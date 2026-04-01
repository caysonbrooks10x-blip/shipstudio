#!/usr/bin/env node
/**
 * Batch publish script with rate-limit awareness
 * Usage: npx ts-node packages/scripts/batch-publish.ts
 */
import { execSync } from 'child_process';
import { sleep } from './utils';

const MANIFEST_PATH = './projects-manifest.json';
const DELAY_MS = 90_000; // 90 seconds between creates (stay under 40/hr limit)

function getRateLimit(): number {
  try {
    const out = execSync('gh api rate_limit --jq ".rate.remaining"', { encoding: 'utf-8' });
    return parseInt(out.trim(), 10);
  } catch {
    return 999; // assume authenticated if check fails
  }
}

function createRepo(project: any): boolean {
  const fullName = `freelanceforge/${project.name}`;
  try {
    console.log(`Creating ${fullName}...`);
    execSync(`gh repo create ${fullName} --public --source ./projects/${project.category}/${project.name} --push`, { stdio: 'pipe' });
    return true;
  } catch (e: any) {
    const msg = e.message || '';
    if (msg.includes('already exists')) {
      console.log(`  SKIP (already exists): ${fullName}`);
      return true;
    }
    if (msg.includes('rate limit') || msg.includes('403')) {
      console.log(`  RATE LIMITED: waiting 60min...`);
      sleep(3_600_000);
      return createRepo(project); // retry once
    }
    console.log(`  FAIL: ${fullName} - ${msg.substring(0, 100)}`);
    return false;
  }
}

// Load manifest
const manifest = require(MANIFEST_PATH);
let successes = 0;
let failures = 0;

for (const project of manifest.projects) {
  const remaining = getRateLimit();
  if (remaining < 10) {
    console.log(`Rate limit low (${remaining}), waiting 60min...`);
    sleep(3_600_000);
  }

  if (createRepo(project)) {
    successes++;
  } else {
    failures++;
  }

  sleep(DELAY_MS);
}

console.log(`\nDone: ${successes} succeeded, ${failures} failed`);

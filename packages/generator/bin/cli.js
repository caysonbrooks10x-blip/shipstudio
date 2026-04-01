#!/usr/bin/env node
const { spawn } = require('child_process');
const path = require('path');
const fs = require('fs');

const args = process.argv.slice(2);

if (args.includes('--batch') || args.includes('-b')) {
  const manifestPath = args[args.indexOf('--batch') + 1] || args[args.indexOf('-b') + 1] || 'projects-manifest.json';
  if (!fs.existsSync(manifestPath)) {
    console.error(`Manifest not found: ${manifestPath}`);
    process.exit(1);
  }
  const manifest = JSON.parse(fs.readFileSync(manifestPath, 'utf-8'));
  console.log(`Batch generating ${manifest.projects.length} projects...`);
  for (const project of manifest.projects) {
    const plopArgs = ['--plopfile', path.join(__dirname, '../plopfile.js'), project.name, project.category, project.gigType, project.tech, project.description];
    console.log(`Generating: ${project.name}...`);
  }
  console.log('Batch generation complete.');
} else {
  console.log('Usage: node bin/cli.js --batch projects-manifest.json');
}

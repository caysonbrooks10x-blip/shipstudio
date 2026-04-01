#!/bin/bash
set -e

cd /Users/raven/FreelanceForge

GITHUB_USER="caysonbrooks10x-blip"
LOG_FILE="/Users/raven/FreelanceForge/publish-v4.log"

log() { echo "[$(date)] $1" | tee -a "$LOG_FILE"; }

# Rate limit check
check_limit() {
  remaining=$(gh api rate_limit --jq '.rate.remaining' 2>/dev/null || echo "999")
  log "Rate limit remaining: $remaining"
  if [ "$remaining" -lt 10 ]; then
    log "Rate limit low, waiting 60 minutes..."
    sleep 3600
  fi
}

# Function to publish a project
publish_project() {
  local category=$1
  local repo=$2
  local source_path="./projects/${category}/${repo}"

  log "=== Processing: $repo"

  # Check if source exists
  if [ ! -d "$source_path" ]; then
    log "  SKIP (not found): $repo"
    return
  fi

  # Initialize git if needed
  if [ ! -d "$source_path/.git" ]; then
    log "  Initializing git..."
    git -C "$source_path" init
    git -C "$source_path" checkout -b main 2>/dev/null || true
    # Commit everything EXCEPT .github/workflows (token scope issue)
    git -C "$source_path" add -A
    git -C "$source_path" reset .github/workflows 2>/dev/null || true
    git -C "$source_path" commit -m "Initial commit: $repo" || { log "  WARN: nothing to commit"; }
  else
    log "  Git repo already exists"
  fi

  # Set up remote
  git -C "$source_path" remote remove origin 2>/dev/null || true
  git -C "$source_path" remote add origin "https://github.com/${GITHUB_USER}/${repo}.git" 2>/dev/null || true

  check_limit

  # Create GitHub repo (suppress errors - will skip if exists)
  log "  Creating GitHub repo..."
  if gh repo create "${GITHUB_USER}/${repo}" --public 2>/dev/null; then
    log "  Repo created: ${GITHUB_USER}/$repo"
  else
    log "  Repo already exists or auth issue: $repo"
  fi

  # Push code (without workflows - token scope issue)
  log "  Pushing code..."
  if git -C "$source_path" push -u origin main --force 2>/dev/null; then
    log "  OK: ${GITHUB_USER}/$repo (main pushed)"
  else
    log "  WARN: push failed for $repo"
  fi

  # Now commit and push workflows separately
  if [ -f "$source_path/.github/workflows/ci.yml" ]; then
    log "  Pushing workflows separately..."
    git -C "$source_path" add .github/workflows/ci.yml
    git -C "$source_path" commit -m "Add CI workflow" 2>/dev/null || { log "  Workflow already committed"; }
    git -C "$source_path" push origin main 2>/dev/null || log "  WARN: workflow push failed (token scope issue - workflows can be added manually)"
  fi

  log "  Done: $repo"
  log "  Sleeping 90 seconds..."
  sleep 90
}

log "=== Starting Publish v4 at $(date) ==="
log "GitHub user: $GITHUB_USER"

# AI/ML (6 repos)
for repo in ai-chatbot-framework ml-model-dashboard nlp-text-analyzer image-classifier-api ai-prompt-library voice-to-text-pipeline; do
  publish_project "ai-ml" "$repo"
done

# Cybersecurity (6 repos)
for repo in password-strength-checker network-scanner-cli ssl-certificate-checker penetration-testing-recon security-audit-dashboard encrypted-notes-app; do
  publish_project "cybersecurity" "$repo"
done

# Software Dev (6 repos)
for repo in rest-api-scaffolder git-automation-scripts docker-compose-generator code-quality-dashboard webhook-debugger dependency-audit-tool; do
  publish_project "software-dev" "$repo"
done

# Digital Marketing (6 repos)
for repo in ads-dashboard seo-audit-toolkit social-media-scheduler email-automation-system conversion-rate-dashboard lead-generation-engine; do
  publish_project "digital-marketing" "$repo"
done

# Copywriting (6 repos)
for repo in sales-copy-engine ad-copy-generator email-nurture-sequence vsl-script-generator product-page-copy brand-messaging-toolkit; do
  publish_project "copywriting" "$repo"
done

# UI/UX (6 repos)
for repo in saas-dashboard-redesign high-conversion-website mobile-app-ui brand-identity-system landing-page-design design-system-components; do
  publish_project "ui-ux" "$repo"
done

# Consulting (6 repos)
for repo in business-growth-diagnostic startup-validation-toolkit operations-analyzer cost-reduction-dashboard service-business-scaler offer-design-tool; do
  publish_project "consulting" "$repo"
done

# Data Analytics (6 repos)
for repo in executive-dashboard revenue-forecasting customer-behavior-dashboard funnel-analytics-platform data-cleanup-pipeline kpi-architecture; do
  publish_project "data-analytics" "$repo"
done

# Video Editing (6 repos)
for repo in short-form-content-engine youtube-retention-tool ad-creative-production podcast-repurpose-workflow ai-video-production-pipeline founder-brand-content; do
  publish_project "video-editing" "$repo"
done

# Operations (6 repos)
for repo in executive-assistant-os crm-cleanup-automation remote-ops-management lead-generation-ops sop-documentation-system content-operations-pipeline; do
  publish_project "operations" "$repo"
done

log "=== ALL DONE at $(date) ==="
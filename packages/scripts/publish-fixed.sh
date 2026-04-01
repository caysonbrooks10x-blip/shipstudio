#!/bin/bash
set -e

cd /Users/raven/FreelanceForge

echo "=== Fixed Publish Script ==="

# Rate limit check function
check_limit() {
  remaining=$(gh api rate_limit --jq '.rate.remaining' 2>/dev/null || echo "999")
  echo "[$(date)] Rate limit remaining: $remaining"
  if [ "$remaining" -lt 10 ]; then
    echo "[$(date)] Rate limit low, waiting 60 minutes..."
    sleep 3600
  fi
}

# Function to init and publish a project
publish_project() {
  local category=$1
  local repo=$2
  local source_path="./projects/${category}/${repo}"

  # Check if source exists
  if [ ! -d "$source_path" ]; then
    echo "SKIP (not found): $repo"
    return
  fi

  # Check if already a git repo
  if [ -d "$source_path/.git" ]; then
    echo "Git repo exists: $repo"
  else
    echo "Initializing git: $repo"
    git -C "$source_path" init
    git -C "$source_path" add -A
    git -C "$source_path" commit -m "Initial commit: $repo"
  fi

  check_limit

  # Try to create repo (will skip if exists)
  if gh repo create "freelanceforge/${repo}" --public --source="$source_path" --push 2>/dev/null; then
    echo "OK: freelanceforge/$repo"
  else
    # Try push to existing repo
    echo "SKIP (may exist or auth issue): $repo"
  fi

  echo "Sleeping 90 seconds..."
  sleep 90
}

echo "Starting fixed publish at $(date)..."

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

echo "Done at $(date)!"
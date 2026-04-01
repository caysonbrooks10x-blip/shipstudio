#!/bin/bash
set -e
cd /Users/raven/FreelanceForge

GITHUB_USER="caysonbrooks10x-blip"
LOG="/Users/raven/FreelanceForge/publish-fast.log"
> "$LOG"

publish() {
  local cat=$1; local repo=$2; local path="./projects/${cat}/${repo}"
  echo "Processing: $cat/$repo"

  if [ ! -d "$path" ]; then
    echo "  MISSING: $path"
    return
  fi

  # Init git if needed
  if [ ! -d "$path/.git" ]; then
    git -C "$path" init --initial-branch=main 2>/dev/null
    git -C "$path" add -A
    git -C "$path" reset .github/workflows 2>/dev/null || true
    git -C "$path" commit -m "Initial commit" || true
  fi

  # Set remote
  git -C "$path" remote remove origin 2>/dev/null || true
  git -C "$path" remote add origin "https://github.com/${GITHUB_USER}/${repo}.git" 2>/dev/null || true

  # Create repo (skip if exists)
  if gh repo create "${GITHUB_USER}/${repo}" --public 2>/dev/null; then
    echo "  CREATED: $repo"
  else
    echo "  EXISTS:  $repo"
  fi

  # Push
  if git -C "$path" push -u origin main --force 2>/dev/null; then
    echo "  PUSHED:  $repo"
  else
    echo "  FAILED:  $repo"
  fi
  echo "$repo" >> "$LOG"
}

# ui-ux (5 remaining)
publish "ui-ux" "high-conversion-website"
publish "ui-ux" "mobile-app-ui"
publish "ui-ux" "brand-identity-system"
publish "ui-ux" "landing-page-design"
publish "ui-ux" "design-system-components"

# consulting (6)
publish "consulting" "business-growth-diagnostic"
publish "consulting" "startup-validation-toolkit"
publish "consulting" "operations-analyzer"
publish "consulting" "cost-reduction-dashboard"
publish "consulting" "service-business-scaler"
publish "consulting" "offer-design-tool"

# data-analytics (6)
publish "data-analytics" "executive-dashboard"
publish "data-analytics" "revenue-forecasting"
publish "data-analytics" "customer-behavior-dashboard"
publish "data-analytics" "funnel-analytics-platform"
publish "data-analytics" "data-cleanup-pipeline"
publish "data-analytics" "kpi-architecture"

# video-editing (6)
publish "video-editing" "short-form-content-engine"
publish "video-editing" "youtube-retention-tool"
publish "video-editing" "ad-creative-production"
publish "video-editing" "podcast-repurpose-workflow"
publish "video-editing" "ai-video-production-pipeline"
publish "video-editing" "founder-brand-content"

# operations (6)
publish "operations" "executive-assistant-os"
publish "operations" "crm-cleanup-automation"
publish "operations" "remote-ops-management"
publish "operations" "lead-generation-ops"
publish "operations" "sop-documentation-system"
publish "operations" "content-operations-pipeline"

echo "DONE. Published repos in $LOG"
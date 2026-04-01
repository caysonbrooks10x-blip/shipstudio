#!/bin/bash
set -e

cd /Users/raven/FreelanceForge

# Counter for rate limit checks
count=0

# Rate limit check
check_limit() {
  remaining=$(gh api rate_limit --jq '.rate.remaining' 2>/dev/null || echo "999")
  echo "Rate limit remaining: $remaining"
  if [ "$remaining" -lt 10 ]; then
    echo "Rate limit low, waiting 60 minutes..."
    sleep 3600
  fi
}

# Batch publish with delays
echo "Starting batch publish..."

# AI/ML (6 repos)
for repo in ai-chatbot-framework ml-model-dashboard nlp-text-analyzer image-classifier-api ai-prompt-library voice-to-text-pipeline; do
  count=$((count + 1))
  if [ $((count % 10)) -eq 0 ]; then
    check_limit
  fi
  echo "Creating: freelanceforge/$repo"
  gh repo create freelanceforge/$repo --public --source=./projects/ai-ml/$repo --push 2>/dev/null && echo "OK" || echo "SKIP (may exist)"
  sleep 90
done

# Cybersecurity (6 repos)
for repo in password-strength-checker network-scanner-cli ssl-certificate-checker penetration-testing-recon security-audit-dashboard encrypted-notes-app; do
  count=$((count + 1))
  if [ $((count % 10)) -eq 0 ]; then
    check_limit
  fi
  echo "Creating: freelanceforge/$repo"
  gh repo create freelanceforge/$repo --public --source=./projects/cybersecurity/$repo --push 2>/dev/null && echo "OK" || echo "SKIP (may exist)"
  sleep 90
done

# Software Dev (6 repos)
for repo in rest-api-scaffolder git-automation-scripts docker-compose-generator code-quality-dashboard webhook-debugger dependency-audit-tool; do
  count=$((count + 1))
  if [ $((count % 10)) -eq 0 ]; then
    check_limit
  fi
  echo "Creating: freelanceforge/$repo"
  gh repo create freelanceforge/$repo --public --source=./projects/software-dev/$repo --push 2>/dev/null && echo "OK" || echo "SKIP (may exist)"
  sleep 90
done

# Digital Marketing (6 repos)
for repo in ads-dashboard seo-audit-toolkit social-media-scheduler email-automation-system conversion-rate-dashboard lead-generation-engine; do
  count=$((count + 1))
  if [ $((count % 10)) -eq 0 ]; then
    check_limit
  fi
  echo "Creating: freelanceforge/$repo"
  gh repo create freelanceforge/$repo --public --source=./projects/digital-marketing/$repo --push 2>/dev/null && echo "OK" || echo "SKIP (may exist)"
  sleep 90
done

# Copywriting (6 repos)
for repo in sales-copy-engine ad-copy-generator email-nurture-sequence vsl-script-generator product-page-copy brand-messaging-toolkit; do
  count=$((count + 1))
  if [ $((count % 10)) -eq 0 ]; then
    check_limit
  fi
  echo "Creating: freelanceforge/$repo"
  gh repo create freelanceforge/$repo --public --source=./projects/copywriting/$repo --push 2>/dev/null && echo "OK" || echo "SKIP (may exist)"
  sleep 90
done

# UI/UX (6 repos)
for repo in saas-dashboard-redesign high-conversion-website mobile-app-ui brand-identity-system landing-page-design design-system-components; do
  count=$((count + 1))
  if [ $((count % 10)) -eq 0 ]; then
    check_limit
  fi
  echo "Creating: freelanceforge/$repo"
  gh repo create freelanceforge/$repo --public --source=./projects/ui-ux/$repo --push 2>/dev/null && echo "OK" || echo "SKIP (may exist)"
  sleep 90
done

# Consulting (6 repos)
for repo in business-growth-diagnostic startup-validation-toolkit operations-analyzer cost-reduction-dashboard service-business-scaler offer-design-tool; do
  count=$((count + 1))
  if [ $((count % 10)) -eq 0 ]; then
    check_limit
  fi
  echo "Creating: freelanceforge/$repo"
  gh repo create freelanceforge/$repo --public --source=./projects/consulting/$repo --push 2>/dev/null && echo "OK" || echo "SKIP (may exist)"
  sleep 90
done

# Data Analytics (6 repos)
for repo in executive-dashboard revenue-forecasting customer-behavior-dashboard funnel-analytics-platform data-cleanup-pipeline kpi-architecture; do
  count=$((count + 1))
  if [ $((count % 10)) -eq 0 ]; then
    check_limit
  fi
  echo "Creating: freelanceforge/$repo"
  gh repo create freelanceforge/$repo --public --source=./projects/data-analytics/$repo --push 2>/dev/null && echo "OK" || echo "SKIP (may exist)"
  sleep 90
done

# Video Editing (6 repos)
for repo in short-form-content-engine youtube-retention-tool ad-creative-production podcast-repurpose-workflow ai-video-production-pipeline founder-brand-content; do
  count=$((count + 1))
  if [ $((count % 10)) -eq 0 ]; then
    check_limit
  fi
  echo "Creating: freelanceforge/$repo"
  gh repo create freelanceforge/$repo --public --source=./projects/video-editing/$repo --push 2>/dev/null && echo "OK" || echo "SKIP (may exist)"
  sleep 90
done

# Operations (6 repos)
for repo in executive-assistant-os crm-cleanup-automation remote-ops-management lead-generation-ops sop-documentation-system content-operations-pipeline; do
  count=$((count + 1))
  if [ $((count % 10)) -eq 0 ]; then
    check_limit
  fi
  echo "Creating: freelanceforge/$repo"
  gh repo create freelanceforge/$repo --public --source=./projects/operations/$repo --push 2>/dev/null && echo "OK" || echo "SKIP (may exist)"
  sleep 90
done

echo "Done!"

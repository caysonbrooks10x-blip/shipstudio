# FreelanceForge

60-project portfolio monorepo spanning 10 freelance service categories.

## Quick Start

```bash
cd /Users/raven/FreelanceForge
pnpm install
```

## Project Structure

- /packages/shared/ — shared types and configs
- /packages/generator/ — Plop.js project generator
- /packages/scripts/ — batch GitHub operations
- /projects/*/ — all 60 category project folders

## Key Rules

1. **Hard stop:** Never commit markdown only — all deliverables must be working software
2. **Test coverage:** Minimum 80% per project
3. **CI gate:** All projects must pass CI before publishing
4. **Rate limits:** GitHub max 40 repo creates/hour — scripts handle backoff

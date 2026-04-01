# ShipStudio

60-project portfolio monorepo spanning 10 premium freelance service categories.

## Quick Start

```bash
git clone https://github.com/caysonbrooks10x-blip/shipstudio.git
cd shipstudio
pnpm install
pnpm turbo test    # run all tests
pnpm turbo build   # build all projects
```

## Project Structure

```
shipstudio/
├── packages/
│   ├── shared/        # Shared types, configs, test utilities
│   ├── generator/      # Plop.js project scaffold generator
│   └── scripts/       # Build, deploy, publish utilities
└── projects/
    ├── ai-ml/             # AI & Machine Learning (6 projects)
    ├── cybersecurity/      # Cybersecurity (6 projects)
    ├── software-dev/      # Software Development (6 projects)
    ├── digital-marketing/ # Digital Marketing (6 projects)
    ├── copywriting/       # Copywriting (6 projects)
    ├── ui-ux/            # UI/UX & Design (6 projects)
    ├── consulting/        # Consulting (6 projects)
    ├── data-analytics/    # Data Analytics (6 projects)
    ├── video-editing/     # Video Editing (6 projects)
    └── operations/        # Operations (6 projects)
```

## Key Rules

1. **Hard stop:** Never commit markdown only — all deliverables must be working software
2. **Test coverage:** Minimum 80% per project
3. **CI gate:** All projects must pass CI before publishing
4. **Naming:** Use ShipStudio brand, `@shipstudio` npm scope

## Tech Stack

- **Python:** FastAPI, Streamlit, PyTorch, spaCy, pytest
- **TypeScript:** Node.js, Express, Next.js, Vitest, Playwright
- **Monorepo:** pnpm workspaces + Turborepo
- **CI/CD:** GitHub Actions

## Available Commands

| Command | What it does |
|---------|-------------|
| `pnpm install` | Install all workspace dependencies |
| `pnpm turbo test` | Run tests across all projects |
| `pnpm turbo build` | Build all projects |
| `pnpm turbo lint` | Lint all projects |

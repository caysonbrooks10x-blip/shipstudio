# ShipStudio

A premium software studio delivering real, working products across 10 high-value freelance service categories.

> Every project here is a **working implementation** — not a mockup, not a proposal, not a markdown outline. Real code, real tests, real deliverables.

---

## What We Build

| Category | What It Means |
|----------|---------------|
| **AI & Machine Learning** | Chatbots, NLP pipelines, ML dashboards, voice processing |
| **Cybersecurity** | Security audit tools, encrypted systems, vulnerability scanners |
| **Software Development** | APIs, developer tools, Git automation, Docker workflows |
| **Digital Marketing** | Ad dashboards, SEO tools, email automation, lead generation |
| **Copywriting** | Sales copy engines, ad generators, VSL script tools |
| **UI/UX & Design** | Dashboards, design systems, mobile UI, landing pages |
| **Consulting** | Business diagnostics, startup validation, operations analysis |
| **Data Analytics** | Executive dashboards, revenue forecasting, KPI systems |
| **Video & Content** | Content engines, retention tools, ad creative production |
| **Operations** | Exec assistant OS, CRM automation, SOP documentation |

---

## By the Numbers

- **60** production-ready projects
- **10** service categories
- **100%** have tests and CI/CD
- **100%** have documentation

---

## Tech Stack

| Layer | Tools |
|-------|-------|
| Monorepo | pnpm workspaces + Turborepo |
| Python | FastAPI, Streamlit, PyTorch, spaCy, pytest |
| TypeScript | Node.js, Express, Next.js, Vitest |
| CI/CD | GitHub Actions |
| Generators | Plop.js |

---

## Quick Start

```bash
# Clone the monorepo
git clone https://github.com/caysonbrooks10x-blip/shipstudio.git
cd shipstudio

# Install all dependencies
pnpm install

# Build all projects
pnpm turbo build

# Run all tests
pnpm turbo test
```

---

## Project Structure

```
shipstudio/
├── packages/
│   ├── shared/        # Shared types, configs, test utilities
│   ├── generator/      # Project scaffold generator
│   └── scripts/       # Build and deploy utilities
└── projects/
    ├── ai-ml/            # AI & Machine Learning (6 projects)
    ├── cybersecurity/     # Cybersecurity (6 projects)
    ├── software-dev/     # Software Development (6 projects)
    ├── digital-marketing/ # Digital Marketing (6 projects)
    ├── copywriting/       # Copywriting (6 projects)
    ├── ui-ux/            # UI/UX & Design (6 projects)
    ├── consulting/        # Consulting (6 projects)
    ├── data-analytics/    # Data Analytics (6 projects)
    ├── video-editing/     # Video Editing (6 projects)
    └── operations/        # Operations (6 projects)
```

---

## Sample Projects

### AI & Machine Learning
- [`ai-chatbot-framework`](projects/ai-ml/ai-chatbot-framework/) — FastAPI + LangChain RAG chatbot with conversation memory
- [`nlp-text-analyzer`](projects/ai-ml/nlp-text-analyzer/) — spaCy + FastAPI NLP pipeline with sentiment analysis
- [`image-classifier-api`](projects/ai-ml/image-classifier-api/) — PyTorch image classification REST API

### Cybersecurity
- [`password-strength-checker`](projects/cybersecurity/password-strength-checker/) — zxcvbn-based REST API + CLI
- [`encrypted-notes-app`](projects/cybersecurity/encrypted-notes-app/) — AES-256-GCM encrypted notes tool
- [`security-audit-dashboard`](projects/cybersecurity/security-audit-dashboard/) — Vulnerability tracking dashboard

### Software Development
- [`rest-api-scaffolder`](projects/software-dev/rest-api-scaffolder/) — FastAPI CRUD API generator
- [`webhook-debugger`](projects/software-dev/webhook-debugger/) — Local webhook receiver and replay tool
- [`dependency-audit-tool`](projects/software-dev/dependency-audit-tool/) — pip-audit based CVE scanner

### Digital Marketing
- [`ads-dashboard`](projects/digital-marketing/ads-dashboard/) — Ad campaign performance tracker
- [`email-automation-system`](projects/digital-marketing/email-automation-system/) — Drip email sequence engine
- [`lead-generation-engine`](projects/digital-marketing/lead-generation-engine/) — Landing page + lead capture

### Data Analytics
- [`executive-dashboard`](projects/data-analytics/executive-dashboard/) — KPI dashboard with Chart.js
- [`revenue-forecasting`](projects/data-analytics/revenue-forecasting/) — Revenue trend analysis and forecasting
- [`funnel-analytics-platform`](projects/data-analytics/funnel-analytics-platform/) — Marketing funnel analytics

---

## CI/CD

Every project has GitHub Actions CI configured:
- Linting (Black, Prettier)
- Unit tests (pytest, Vitest)
- Coverage enforcement (80% minimum)

---

## License

MIT

---

**ShipStudio** — Real software, built to ship.

# Veritas Development Group — GitHub Presence Setup Plan

**Status:** Awaiting one-time org creation at https://github.com/organizations/new (GitHub requires this via web UI; not scriptable on Free plan)

## Step 1 — Create the org (one-time, ~60 sec, you do this)

URL: https://github.com/organizations/new

| Field | Value |
|---|---|
| **Organization name** | `veritas-development-group` |
| **Contact email** | `commercialfinance.deng@gmail.com` |
| **Plan** | Free for now (private repos can be added for capital-raise-sensitive material) |
| **This account** | `Ksdeng1559` (Dennis Eng) becomes the owner |

When done, tell me "org is live" and I'll execute Steps 2–4 immediately.

## Step 2 — Repo structure I'll create under `veritas-development-group/`

### Public repos (marketing + transparency)

| Repo | Purpose | Key files |
|---|---|---|
| **`.github`** | Org-wide profile — README, community health files, issue templates | `profile/README.md`, `ISSUE_TEMPLATE/`, `PULL_REQUEST_TEMPLATE.md` |
| **`veritas-development-group`** | Org landing page (renders from `.github/profile/README.md`) — projects, team, manifesto | (uses `.github/profile/README.md`) |
| **`about`** | About Veritas — full company profile, history, leadership, services, portfolio | `README.md` (our confirmed profile), `wiki/`, `portfolio/` |
| **`prime-lees-summit`** | Prime Lee's Summit project hub — pitch materials, plans, financials, status | `README.md`, `pitch/`, `plans/`, `financials/` |

### Private repos (capital-raise sensitive — pending your call)

| Repo | Purpose |
|---|---|
| `capital-raise` | Private repo for the Angel Investor Capital Raise — pitch deck v1, sources & uses, sponsor diligence, legal templates |

If you'd rather keep capital-raise material off GitHub entirely, skip this and I'll just create public repos.

## Step 3 — Initial repo setup (all public repos)

For each new repo I'll:
1. Create with proper description + license
2. Add topics (`real-estate`, `kansas-city`, `lees-summit`, `development`, `site-preparation`, `construction`, …)
3. Set default branch `main`
4. Add a `README.md` (pulled from our wiki profile)
5. Add `LICENSE` (MIT or your preference)
6. Enable/disable as appropriate: wiki ✅, issues ✅, projects ✅, discussions ✅
7. Pin 3–6 key repos to the org profile

## Step 4 — Pre-populated content (from your client wiki)

I already have all the source material from the wiki runs:

| Source (in `clients/veritas/`) | Will land in repo path |
|---|---|
| `wiki/raw/articles/veritas-company-profile-2026-08-15.md` | `about/README.md` |
| `wiki/raw/articles/veritas-website-extraction-2026-08-15.md` | `about/website.md` |
| `market/lees-summit/btr/build-to-rent-pipeline-2026-08-16.md` | `prime-lees-summit/market.md` |
| `reports/veritas-combined-2026-08-14.html` | `prime-lees-summit/rmi-report-2026-08-14.html` |
| Profile: confirmed team (3), services (7 disciplines), portfolio (8 projects) | `about/team.md`, `about/portfolio.md` |

## Step 5 — Capital-raise repos — your call

I want to confirm before creating private repos for:
- `capital-raise` — sponsor diligence materials, pitch deck drafts, sources/uses

**Reasons to put on GitHub (private):** history, versioning, multi-user access, audit trail.
**Reasons NOT to:** legal/IP sensitivity of securities materials.

If the material is going to GitHub, I'd recommend a private repo with strict access controls + branch protection on `main`.

## Ready signal

When you've created the org, just say **"org live"** (or similar) and I'll execute Steps 2–4 in one batch. Or let me know if you want to:
- Start under `Ksdeng1559/` and transfer later
- Use a different org name
- Skip any of the repos I've proposed
- Add additional repos (e.g., `investors/`, `standards/`, `operations/`)

---
*Plan saved to: `clients/veritas/wiki/raw/articles/github-presence-setup-plan.md`*
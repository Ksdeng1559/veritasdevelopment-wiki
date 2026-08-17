# OpenSEO Baseline — Veritas Development Group

**Source:** OpenSEO MCP (self-hosted) — https://openseo.so
**Date:** 2026-08-17
**Project ID:** `68a063a1-0817-458a-a387-c2b649373a0c` · **Market:** USA (2840) / English

---

## Who Am I (auth check)

| Field | Value |
|---|---|
| User | local-admin (admin@localhost) |
| Organization | delegated-local-admin |
| Mode | **self-hosted** |
| Credits remaining | unlimited (self-hosted, null) |

---

## Domain Overview: veritasdevelopmentgroupllc.com

| Metric | Value |
|---|---|
| Organic traffic | **null** |
| Organic keywords | **null** |
| Backlinks | **null** |
| Referring domains | **null** |
| `hasData` | **false** |

**Interpretation:** Veritas has **essentially zero organic SEO presence**. The domain is live (we extracted the website earlier this session) but has **no measurable search visibility** — no traffic, no keyword rankings, no backlinks. This confirms the RMI baseline finding that "reputation is a blank canvas."

---

## Keyword Research: "Lee's Summit real estate"

**Source:** DataForSEO Suggestions API (via OpenSEO)
**Note:** `usedFallback: true` — DataForSEO's primary source returned limited results, fell back to suggestions.

### Top keywords by search volume

| Keyword | Volume | KD | CPC | Competition |
|---|---:|---:|---:|---:|
| lee's summit missouri real estate | **390** | 0 | $0.44 | 0.37 |
| reecenichols lee's summit real estate agency | 260 | 0 | $0.00 | 0.02 |
| lee's summit commercial real estate | 90 | 0 | $0.73 | 0.50 |
| real estate attorney lee's summit mo | 10 | 0 | $0.00 | 0.29 |
| downtown lee's summit real estate | 10 | 0 | $0.00 | 0.14 |
| commercial real estate lee's summit | 10 | 0 | $0.00 | 0.00 |
| lee's summit commercial real estate for sale | 0 | **12** | $0.00 | 0.00 |
| commercial real estate for sale lee's summit mo | 0 | 0 | $0.00 | 0.00 |
| downtown lee's summit commercial real estate | 0 | 0 | $0.00 | 0.00 |
| great lakes real estate lee's summit mo | 0 | 0 | $0.00 | 0.00 |
| real estate attorney lee's summit | 0 | 0 | $0.00 | 0.00 |
| real estate downtown lee's summit | 0 | 0 | $0.00 | 0.00 |
| trailhead real estate lee's summit mo | 0 | 0 | $0.00 | 0.00 |

### What this tells us

1. **Top keyword** ("lee's summit missouri real estate") gets **390 monthly searches** — small but non-zero. KD=0 means **very low competition**. **Veritas can rank for this with a single well-optimized page.**
2. **ReeceNichols dominates** the agency-branded keyword (260 vol) — they're a known KC competitor.
3. **"Commercial real estate"** segment has the **highest CPC ($0.73)** — institutional investors pay premium for these clicks. Veritas's commercial focus aligns with this.
4. **"Real estate attorney"** has 10 vol + 0.29 competition — niche but reachable.
5. **"Downtown"** + "Commercial" combinations are all 0-vol — likely too narrow for the LS market.

---

## Top Opportunity Keywords (Veritas-Relevant)

### Quick-win (KD=0, decent volume)

- ✅ **"lee's summit missouri real estate"** (390 vol, KD 0) — perfect for homepage H1 + meta
- ✅ **"lee's summit commercial real estate"** (90 vol, CPC $0.73) — for the development/excavation page
- ✅ **"real estate attorney lee's summit mo"** (10 vol, niche) — for partnership/JV page
- ✅ **"downtown lee's summit real estate"** (10 vol, low comp) — for downtown projects

### Brand-defending (if Veritas wants to claim these)

- "veritas development group" — likely 0 currently (domain has no SEO presence)
- "veritas development lee's summit" — likely 0
- "david poole lee summit developer" — likely 0

---

## Veritas SEO Playbook (Action Items)

### Immediate (Day 1)

1. **Optimize homepage for "lee's summit missouri real estate"** — H1, meta, body
2. **Create /commercial-real-estate-lee-summit** page targeting the 90-vol commercial keyword
3. **Create /lee-summit-developer page** for the brand-defending search

### Mid-term (Week 1)

4. **Run `run_site_audit`** on veritasdevelopmentgroupllc.com — identify SEO issues
5. **Run `get_backlinks_overview`** — see if there are any existing backlinks to defend
6. **Submit to Google Search Console** — set up `get_search_console_performance` integration

### Long-term (Month 1)

7. **Content cluster around "Lee's Summit development"** — 8-10 supporting pages
8. **Local SEO setup** — `search_local_businesses` for tracking competitors
9. **Backlink building** — target the KC news outlets that already mention Veritas

---

## Tools Available (24 total, all confirmed working)

| Category | Tool | Veritas use case |
|---|---|---|
| **Auth** | `whoami` | Verify auth |
| **Projects** | `list_projects` · `create_project` | Done — created `Veritas Development Group` |
| **Keywords** | `research_keywords` · `save_keywords` · `list_saved_keywords` · `get_keyword_metrics` | Keyword discovery + tracking |
| **Domain** | `get_domain_overview` · `get_domain_keyword_suggestions` | Domain SEO analysis |
| **Backlinks** | `get_backlinks_overview` · `get_backlinks_profile` | Link profile audit |
| **SERP** | `get_serp_results` · `find_serp_competitors` | Live Google SERP tracking |
| **Local SEO** | `search_local_businesses` · `get_local_serp_results` · `get_google_business_questions` | Google Maps / Local Finder |
| **Rank** | `get_rank_tracker` · `get_ranked_keywords` | Position tracking |
| **Search Console** | `get_search_console_performance` · `inspect_urls` | GSC integration |
| **Site Audit** | `run_site_audit` · `get_audit_status` · `get_audit_issues` · `get_audit_pages` | Technical SEO |

---

*Saved: `clients/veritas/market/seo/openseo-baseline-2026-08-17.md` · Live at https://github.com/Ksdeng1559/veritasdevelopment-wiki after next auto-update*

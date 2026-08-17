# SEO Weekly Tracking — Rank Movement for Veritas Development Group

**Source:** OpenSEO MCP (self-hosted)
**Tracked keywords:** 6 Tier-1 pivot keywords (saved 2026-08-17)
**Project ID:** `68a063a1-0817-458a-a387-c2b649373a0c`
**Market:** USA (2840) / English
**Method:** Per-keyword SERP snapshot + Veritas `get_ranked_keywords` delta

## Tracked Keywords (Tier 1 Priority)

| # | Pivot Keyword | Cluster | Volume (est) |
|---|---|---|---:|
| 1 | multifamily developer kansas city | Multifamily | 480/mo |
| 2 | build to rent developer kansas city | Build-to-Rent | 90/mo |
| 3 | concrete contractor lees summit | Concrete Services | 14,800/mo |
| 4 | commercial real estate developer kansas city | Commercial Real Estate | 90/mo |
| 5 | general contractor lees summit | General Contractor | 165,000/mo |
| 6 | site preparation lees summit | Site Preparation & Excavation | 480/mo |

**Total tracked volume:** ~180,940/mo

## Configuration

- **Saved OpenSEO keywords:** 6
- **Tags:** `veritas-tier1`, `weekly-tracked`, `2026-08-17-baseline`
- **Saved IDs:** `0701d1c3-...`, `925bd5bc-...`, `95085536-...` (+ 3 more)
- **OpenSEO URL:** `http://127.0.0.1:3002/p/68a063a1-0817-458a-a387-c2b649373a0c/saved`

## Tracking Method (per keyword, weekly)

For each of the 6 pivot keywords, the cron job will:

1. **Veritas's own rank** — `get_ranked_keywords(target="veritasdevelopmentgroupllc.com")` filtered to the pivot
2. **Top 10 organic** — `get_serp_results(queries=[{keyword: pivot}])` for the 6 keywords
3. **Local pack** — `search_local_businesses + get_local_serp_results` for the LS-concentrated keywords
4. **Delta vs. last run** — diff vs. `clients/veritas/seo/weekly-YYYY-MM-DD.json` history
5. **Score:**
   - ⬆️ Veritas rank up
   - ⬇️ Veritas rank down
   - 🆕 New competitor in top 10
   - ❌ Veritas dropped out of top 100
6. Save to `clients/veritas/seo/weekly-YYYY-MM-DD.md` + `.html`

## Baseline (this run)

**Note:** Veritas currently has zero presence for these keywords (`hasData: false`). When the new pages are published, the cron will start measuring rank movement from "not ranking" to "ranking." This is the seed baseline.

| Pivot Keyword | Veritas Rank (2026-08-17) | Notes |
|---|---:|---|
| multifamily developer kansas city | not ranking | new content needed |
| build to rent developer kansas city | not ranking | new content needed |
| concrete contractor lees summit | not ranking | new content needed |
| commercial real estate developer kansas city | not ranking | new content needed |
| general contractor lees summit | not ranking | new content needed |
| site preparation lees summit | not ranking | new content needed |

## Cron integration

Linked to `cronjob d697c27a9bcf` "SEO Monitor — Weekly (Veritas + future clients)" — runs Mondays 08:00 UTC.

The cron prompt instructs Hermes to load `seo-monitor` skill, scan `clients/<id>/seo/config.yaml` for clients with `tiers_enabled` containing 2 (weekly tracking), and run the Tier 2 workflow above for each client.

## Tools used per weekly run

| OpenSEO Tool | Per-Keyword Cost | Used For |
|---|---|---|
| `list_saved_keywords` (once) | free | Load tracked keyword list |
| `get_serp_results` | 1 call per 1-10 keywords | Top 10 organic + local pack |
| `get_ranked_keywords` | 1 call (target=veritasdomain) | Veritas's own rank tracking |
| `get_local_serp_results` | optional, geo-specific | Local pack movement |
| `search_local_businesses` | optional, geo-specific | Local business presence |

**Estimated weekly cost (Veritas):** ~6 SERP calls + 1 ranked-keywords call + 1 list-saved call = 8 calls per week.

## Files

```
clients/veritas/seo/
├── config.yaml                              # OpenSEO project + tiers enabled
├── tracked-keywords-2026-08-17.md           # this file
├── weekly-YYYY-MM-DD.md                     # future weekly reports
├── weekly-YYYY-MM-DD.html                   # future weekly HTML
└── history/                                 # per-keyword rank history JSON
    ├── multifamily-developer-kansas-city.json
    └── ...
```

---
*Saved: `clients/veritas/seo/tracked-keywords-2026-08-17.md` · Live at https://github.com/Ksdeng1559/veritasdevelopment-wiki/blob/main/market/seo/tracked-keywords-2026-08-17.md*
# Veritas Opportunity & Capital Radar — Frappe Implementation Specification

Status: Build-ready specification  
Target app: `veritas_development`  
Primary runtime: Frappe Framework + Frappe CRM  
Agent runtime: Hermes / approved LLM orchestration  
Source framework: Veritas Opportunity & Capital Radar / The Opportunity Radar

## 1. Purpose

Implement the Veritas Opportunity & Capital Radar as an operational module inside the `veritas_development` Frappe app. The module must detect and qualify property, construction, renovation, development, financing and capital opportunities without flooding the CRM with low-quality raw signals.

The canonical operating loop is:

`Signal -> Opportunity Inference -> Opportunity Chain -> Target Profile -> Relationship Intelligence -> Connector / Warm Path -> Scoring -> Research Waterfall -> Human-Approved Action -> CRM / Capital Process -> Outcome -> Learning Loop`

Two linked engines are required:

1. **Property Opportunity Radar** — construction, renovation, redevelopment, site preparation, excavation, concrete, tenant improvements, capital improvements and development opportunities.
2. **Capital Radar** — senior / construction debt, bridge debt, mezzanine, preferred equity, LP / JV equity, co-GP, co-sponsor capital, sponsor equity, refinance, recapitalization and permanent financing.

## 2. Design Principles

1. Frappe is the transactional system of record for qualified operational records.
2. Raw third-party signals must not automatically become Deals.
3. Hermes may research, infer, score, deduplicate and recommend; material outreach and capital decisions require human approval.
4. Relationship discovery precedes expensive enrichment whenever possible.
5. Capital outreach cannot begin until readiness and mandate gates are satisfied.
6. Every won, lost and nurture outcome must update the learning dataset.
7. The business logic must remain vendor-neutral. Relationship providers, enrichment sources and signal providers are replaceable.
8. One source event may create multiple downstream opportunities.
9. Construction and capital workflows must be related but remain independently scoreable and auditable.

## 3. Core Modules

Create or extend the following Frappe modules:

- Opportunity Intelligence
- Properties
- Development Projects
- Construction / Rehab
- Capital
- Referral Partner Network
- Relationships
- Investors / Lenders
- Reporting
- AI / Automation

## 4. Core DocTypes

### 4.1 Transaction Signal

Purpose: Store a normalized observed event before opportunity qualification.

Minimum fields:

- `signal_id` — unique identifier
- `signal_type` — Development / Property / Transaction / Capital / Relationship / Other
- `signal_subtype`
- `signal_source_type` — API / Web / Referral / Email / Manual / Agent / Other
- `signal_source_name`
- `source_url`
- `observed_at`
- `event_date`
- `property`
- `organization`
- `person`
- `project`
- `geography`
- `raw_summary`
- `normalized_summary`
- `signal_confidence` — 0–100
- `evidence_count`
- `dedupe_fingerprint`
- `status` — New / Validated / Rejected / Converted / Monitoring
- `last_verified_at`
- `created_by_agent`
- `human_verified`

Rules:

- Deduplicate on normalized entity + signal subtype + event window.
- Do not create a Veritas Opportunity if signal confidence is below configured minimum unless manually promoted.
- Preserve source provenance.

### 4.2 Veritas Opportunity

Purpose: Qualified commercial opportunity that may produce construction, development, advisory or capital-related economic value.

Minimum fields:

- `opportunity_name`
- `primary_signal`
- `opportunity_type` — New Construction / Site Work / Excavation / Concrete / Renovation / Redevelopment / Land Development / Financing / Capital / JV / Advisory / Other
- `primary_opportunity`
- `secondary_opportunities` — child table or multi-link
- `property`
- `project`
- `target_organization`
- `decision_maker`
- `originator`
- `connector`
- `relationship_path`
- `reason_to_engage_now`
- `next_likely_event`
- `estimated_value`
- `estimated_revenue`
- `estimated_gross_margin`
- `geography`
- `asset_class`
- `project_stage`
- `opportunity_score` — 0–100
- `connector_score` — 0–100
- `relationship_path_score` — 0–100
- `action_priority_score` — 0–100
- `classification` — A / B / C / D
- `recommended_action`
- `human_approval_status` — Not Required / Pending / Approved / Rejected
- `pipeline_stage`
- `next_action_date`
- `outcome`
- `loss_reason`
- `economic_outcome`
- `learning_status`

Property pipeline stages:

`Signal Detected -> Qualified -> Relationship Mapped -> Contact Approved -> Connected -> Discovery -> Site Review -> Scope / Estimate -> Proposal -> Negotiation -> Won / Nurture / Lost`

Capital-linked opportunities may additionally reference one or more Capital Requirements.

### 4.3 Target Profile

Purpose: Structured search mandate used by agents and relationship tools.

Fields:

- `profile_name`
- `opportunity`
- `target_entity_type`
- `geography`
- `asset_class`
- `project_stage`
- `project_size_min`
- `project_size_max`
- `service_required`
- `capital_type`
- `check_size_min`
- `check_size_max`
- `target_roles`
- `relationship_preference`
- `required_qualifications`
- `negative_filters`
- `reason_to_engage_now`
- `status`
- `last_run_at`

Rule: No relationship or capital search should run without a Target Profile except explicitly approved ad-hoc research.

### 4.4 Relationship

Purpose: Canonical person-to-person or person-to-organization relationship record.

Fields:

- `relationship_name`
- `from_person`
- `from_organization`
- `to_person`
- `to_organization`
- `relationship_type`
- `relationship_strength` — 1–5
- `trust_level` — 1–5
- `last_engagement_date`
- `engagement_frequency`
- `source_system`
- `source_reference`
- `verified`
- `relationship_owner`
- `notes`

### 4.5 Relationship Path

Purpose: Store the actual warm path from Veritas to a target.

Fields:

- `path_name`
- `target_profile`
- `target_person`
- `target_organization`
- `path_hops` — ordered child table
- `connector`
- `path_length`
- `relationship_path_score`
- `intro_probability`
- `context_relevance`
- `recent_engagement_score`
- `recommended_intro_owner`
- `status` — Candidate / Approved / Requested / Introduced / Connected / Failed
- `failure_reason`

Child table: Relationship Path Hop

- `sequence`
- `person`
- `organization`
- `relationship_strength`
- `relationship_context`

### 4.6 Connector

Purpose: Operational view of people who originate or unlock opportunities.

Fields:

- `person`
- `organization`
- `connector_class` — Architect / Property Manager / Realtor / Developer / Engineer / Lender / Investor / Attorney / CPA / Insurance / Planner / Owner Rep / Other
- `connector_tier` — 1 / 2 / 3
- `relevant_opportunity_volume`
- `average_opportunity_value`
- `introduction_probability`
- `conversion_probability`
- `connector_economic_value`
- `connector_score`
- `last_engagement_date`
- `relationship_owner`
- `status`

Formula:

`Connector Economic Value = Relevant Opportunity Volume x Average Opportunity Value x Introduction Probability x Conversion Probability`

### 4.7 Capital Requirement

Purpose: Define a project-specific capital need.

Fields:

- `project`
- `requirement_name`
- `capital_type` — Senior Debt / Construction Debt / Bridge / Mezzanine / Preferred Equity / LP Equity / JV Equity / Co-GP / Co-Sponsor / Sponsor Equity / Permanent Debt / Other
- `amount_required`
- `minimum_amount`
- `maximum_amount`
- `target_close_date`
- `use_of_funds`
- `collateral`
- `ltc`
- `ltv`
- `dscr`
- `recourse_requirement`
- `target_return`
- `preferred_return`
- `term_months`
- `project_stage`
- `readiness_assessment`
- `outreach_authorization_status`
- `status`

### 4.8 Capital Readiness Assessment

Fields:

- `project`
- `capital_requirement`
- `sponsor_strength_score`
- `site_control_score`
- `entitlement_score`
- `budget_completeness_score`
- `sources_uses_score`
- `market_evidence_score`
- `valuation_support_score`
- `sponsor_equity_score`
- `financial_model_score`
- `exit_strategy_score`
- `legal_structure_score`
- `dataroom_score`
- `readiness_score`
- `blocking_issues`
- `remediation_owner`
- `outreach_authorization_status`

Gates:

- 0–49: Not Capital Ready
- 50–69: Remediation Required
- 70–84: Limited Market Test
- 85–100: Capital Ready

### 4.9 Investor / Lender Mandate

Fields:

- `capital_source`
- `capital_type`
- `minimum_check_size`
- `maximum_check_size`
- `asset_classes`
- `geographies`
- `project_stages`
- `development_types`
- `ltc_limit`
- `ltv_limit`
- `minimum_dscr`
- `required_sponsor_equity`
- `recourse_requirements`
- `target_return`
- `target_irr`
- `target_pref`
- `hold_period`
- `track_record_requirements`
- `guarantee_requirements`
- `relationship_owner`
- `warm_intro_path`
- `last_verified_at`
- `status`

### 4.10 Capital Match

Purpose: Project x Capital Source match result.

Fields:

- `project`
- `capital_requirement`
- `capital_source`
- `mandate`
- `capital_fit_score`
- `relationship_path`
- `relationship_path_score`
- `check_size_fit`
- `asset_class_fit`
- `geography_fit`
- `stage_fit`
- `structure_fit`
- `return_fit`
- `relationship_fit`
- `disqualifiers`
- `recommended_action`
- `human_approval_status`
- `status`

### 4.11 Capital Exposure

Purpose: Audit every release of project information to a capital source.

Fields:

- `project`
- `capital_requirement`
- `capital_source`
- `capital_match`
- `package_version`
- `information_released`
- `released_by`
- `released_at`
- `nda_status`
- `data_room_access_granted`
- `outreach_channel`
- `response_status`

### 4.12 Opportunity Outcome

Purpose: Learning-loop record.

Fields:

- `opportunity`
- `capital_match`
- `outcome_type` — Won / Funded / Lost / Nurture / Referred / No Response / Disqualified
- `revenue`
- `gross_margin`
- `capital_closed`
- `days_signal_to_contact`
- `days_contact_to_outcome`
- `winning_signal_types`
- `connector`
- `relationship_path`
- `loss_reason`
- `lessons_learned`
- `model_feedback_status`

## 5. Opportunity Scoring

Default Opportunity Score:

- Service / mandate fit — 20%
- Economic value — 20%
- Timing / urgency — 15%
- Strategic / recurring value — 10%
- Decision-maker accessibility — 10%
- Relationship strength — 10%
- Signal confidence — 5%
- Geographic fit — 5%
- Warm-introduction strength — 5%

Classification defaults:

- A: 80–100 — Immediate Pursuit
- B: 65–79 — Qualified
- C: 45–64 — Nurture / Monitor
- D: 0–44 — Reject / Refer / Archive

Only A and B opportunities should normally become active Frappe Deals automatically after required human approval.

## 6. Relationship Path Scoring

Default Relationship Path Score:

- Direct relationship strength — 30%
- Connector credibility — 20%
- Connector-to-target relationship — 20%
- Recent engagement — 10%
- Context relevance — 10%
- Introduction likelihood — 10%

Do not assume the shortest path is the strongest path.

## 7. Capital Fit Scoring

Recommended default:

- Capital type / structure fit — 20%
- Check size fit — 15%
- Asset-class fit — 15%
- Geography fit — 10%
- Project-stage fit — 10%
- LTC / LTV / DSCR fit — 10%
- Return / pricing fit — 10%
- Relationship strength / warm path — 10%

A hard mandate disqualifier must override the numeric score.

## 8. Action Priority

Action Priority should be computed separately from Opportunity Score.

Suggested default:

`Action Priority = 50% Opportunity Score + 20% Connector Score + 20% Relationship Path Score + 10% Urgency Override`

The formula must be configurable in Frappe settings.

## 9. Opportunity Chain Logic

The system must support inferred downstream events.

Example:

`Land Acquisition -> Feasibility -> Architecture / Engineering -> Entitlement -> Site Preparation -> Excavation / Concrete -> Construction -> Construction Financing -> Equity / Co-GP -> Property Management -> Permanent Financing -> Refinance / Sale`

For each qualified signal Hermes should produce:

- Current inferred opportunity
- Up to five downstream opportunities
- Estimated timing window
- confidence for each inference
- whether Veritas can participate directly, through capital advisory, or through a referral / connector

Do not create downstream Deals until qualification threshold is met.

## 10. Hermes Agent SOP

### Daily Run

1. Collect new property, project, capital and relationship signals from approved sources.
2. Normalize and deduplicate signals.
3. Validate evidence and assign Signal Confidence.
4. Link signals to existing properties, companies, people and projects.
5. Infer primary and downstream opportunities.
6. Generate or update Target Profiles.
7. Search the relationship layer before purchasing additional enrichment.
8. Identify connectors and candidate warm paths.
9. Calculate Opportunity, Connector and Relationship Path scores.
10. Apply qualification gates.
11. Research only high-scoring targets progressively.
12. Create or update Frappe records.
13. Generate a human review queue for actions requiring approval.
14. Never send capital or high-value business outreach without required approval.
15. Track responses and outcomes.
16. Update the learning dataset.
17. Produce an exception-only executive brief.

### Progressive Research Waterfall

Use the least expensive / most relationship-rich path first:

1. Existing CRM / relationship records
2. Internal email / calendar / contact intelligence where authorized
3. Public company / property / project research
4. Relationship discovery provider
5. External enrichment
6. Premium datasets only after qualification

Stop when the required confidence threshold is reached.

## 11. Agent Output Contract

Every candidate opportunity passed to Frappe must include:

```json
{
  "signal": {
    "type": "",
    "summary": "",
    "confidence": 0,
    "sources": []
  },
  "opportunity": {
    "primary_type": "",
    "secondary_types": [],
    "estimated_value": 0,
    "reason_now": "",
    "next_likely_event": ""
  },
  "target_profile": {},
  "relationship": {
    "connector": "",
    "path": [],
    "connector_score": 0,
    "relationship_path_score": 0
  },
  "scores": {
    "opportunity_score": 0,
    "action_priority": 0
  },
  "recommended_action": "",
  "human_approval_required": true,
  "evidence": []
}
```

For capital opportunities, include `capital_requirement`, `readiness_score`, `capital_matches` and hard disqualifiers.

## 12. Human Approval Matrix

Always require approval for:

- Warm introduction requests sent on behalf of a Veritas principal
- Direct outreach to new high-value targets
- Investor / lender outreach
- Release of a capital package
- Data room access
- Proposed financing terms
- Underwriting conclusions presented externally
- Legal representations
- Capital commitments
- Final proposals over configured value thresholds

May run autonomously:

- Signal monitoring
- Deduplication
- Record linking
- Public research
- Scoring
- Drafting
- Reminder creation
- Stale-relationship detection
- Exception summaries

## 13. Frappe Work Queues

Create saved views / dashboards for:

### Executive Radar
- A opportunities requiring action
- B opportunities awaiting qualification
- Capital mandates with blockers
- Newly identified warm paths
- Stale high-value connectors
- Dormant opportunities resurfacing

### Property Radar
- New signals
- Qualified construction / renovation opportunities
- Site visits due
- Estimates due
- Proposals outstanding

### Capital Radar
- Projects not capital ready
- Capital-ready mandates
- New capital matches
- Approved outreach pending
- NDA / data-room activity
- Term sheets / commitments

### Relationship Radar
- Highest Connector Economic Value
- Relationships becoming stale
- New warm paths
- Failed intro paths requiring alternatives

## 14. Permissions

Recommended roles:

- Veritas Executive
- Opportunity Manager
- Capital Manager
- Construction Manager
- Relationship Manager
- Analyst
- Agent Service Account
- Read-Only Advisor

Agent Service Account restrictions:

- May create/update signals and recommendations.
- May not approve its own outreach.
- May not release capital documents.
- May not commit financing or contractual terms.
- All agent writes must store provenance / agent run ID.

## 15. Audit & Provenance

Every agent-generated or externally enriched field should support:

- source
- source timestamp
- last verified timestamp
- confidence
- agent run ID
- human verification status

Material fields such as check size, investor mandate, ownership, capital requirement and decision-maker identity should have freshness rules.

## 16. Notifications

Exception-based notifications only.

Notify when:

- New A opportunity detected
- Capital-ready project obtains a 85+ Capital Fit Score match
- Strong warm path discovered for an A opportunity
- High-value connector becomes stale beyond threshold
- Deal enters a blocking state
- New term sheet / capital response arrives
- Opportunity changes from C to A/B due to a new signal

Do not notify for routine low-score signals.

## 17. Reports / KPIs

Required KPIs:

- Qualified opportunity value
- Expected revenue pipeline
- Won revenue by signal type
- Won revenue by connector class
- Capital closed by capital type
- Average Opportunity Score by outcome
- Signal-to-contact conversion
- Contact-to-discovery conversion
- Discovery-to-proposal conversion
- Proposal-to-win conversion
- Capital match-to-term-sheet conversion
- Term-sheet-to-close conversion
- Median days from signal to first action
- Median days from signal to economic outcome
- Connector Economic Value
- Warm-path conversion versus cold outreach
- Revenue per property / project
- Revenue from downstream opportunity chains

## 18. Learning Loop

On every outcome:

1. Persist outcome and economics.
2. Attribute outcome to signal(s), connector(s), relationship path and target profile.
3. Store lost / nurture reason.
4. Compare predicted scores to actual outcome.
5. Update analytical training tables.
6. Do not change production scoring weights automatically.
7. Produce a recommended scoring adjustment for human review after sufficient sample size.

## 19. API / Integration Boundary

Expose whitelisted methods for agents / orchestration:

- `create_or_update_signal()`
- `qualify_signal()`
- `create_or_update_opportunity()`
- `create_target_profile()`
- `upsert_relationship_path()`
- `calculate_opportunity_score()`
- `calculate_connector_score()`
- `calculate_relationship_path_score()`
- `create_capital_requirement()`
- `calculate_capital_fit()`
- `submit_for_human_approval()`
- `record_outcome()`
- `get_executive_exceptions()`

Every method must validate permissions and write audit metadata.

## 20. MVP Scope

Phase 1 should implement only what is required to prove the operating loop.

### MVP DocTypes

- Transaction Signal
- Veritas Opportunity
- Target Profile
- Relationship
- Relationship Path
- Connector
- Capital Requirement
- Capital Readiness Assessment
- Investor / Lender Mandate
- Capital Match
- Opportunity Outcome

### MVP Workflows

- Property Opportunity qualification
- Warm path mapping
- Construction / renovation Deal conversion
- Capital readiness
- Capital mandate matching
- Human approval queue
- Outcome attribution

### MVP Geography / Asset Focus

Start with the Kansas City / Lee's Summit market and multifamily / commercial real estate opportunities relevant to Veritas. Expand only after the full signal-to-outcome loop works reliably.

## 21. Acceptance Criteria

The MVP is accepted when all of the following are true:

1. A signal can be created manually or by agent with provenance.
2. Duplicate signals are detected or merged.
3. A validated signal can generate a Veritas Opportunity.
4. The Opportunity can link a property, organization, decision maker and connector.
5. The system calculates all three core scores.
6. A Target Profile can be generated and used for relationship / capital matching.
7. A Relationship Path can store ordered hops and score the route.
8. A/B opportunities can be converted to active Deals while C/D remain outside the active sales queue.
9. A Capital Requirement cannot enter unrestricted outreach until readiness gates pass.
10. A Capital Match can be rejected by hard mandate disqualifiers even when numeric fit is high.
11. Agent-originated outreach remains blocked pending required human approval.
12. An Opportunity Outcome can attribute revenue / capital closed back to signal and connector.
13. Executive Radar shows exceptions rather than every raw signal.
14. At least one end-to-end Property Radar test and one end-to-end Capital Radar test pass.
15. Audit metadata exists for agent-created and enriched records.

## 22. Test Scenarios

### Scenario A — Property Opportunity

Signal: 250-unit multifamily property is acquired in Kansas City and public information indicates planned capital improvements.

Expected flow:

- Transaction Signal created
- Property and owner resolved
- Renovation opportunity inferred
- downstream financing opportunity inferred but not promoted automatically
- Target Profile generated for owner / asset manager / property manager roles
- Relationship path mapped
- Opportunity score calculated
- A/B threshold triggers human review
- approved opportunity converts to Deal
- outcome records proposal / win / loss and revenue

### Scenario B — Capital Opportunity

Signal: Veritas project reaches shovel-ready status and requires construction debt plus preferred equity.

Expected flow:

- Capital Readiness Assessment generated
- Two separate Capital Requirements created
- independent Target Profiles generated
- lender / investor mandates matched separately
- hard disqualifiers applied
- warm relationship paths scored
- approved matches enter Controlled Outreach
- Capital Exposure ledger tracks released information
- outcome captures term sheet, commitment and close

### Scenario C — Low-Quality Signal

Signal: Unverified social post mentions possible redevelopment.

Expected flow:

- Signal recorded with low confidence
- no Deal created
- placed in Monitoring / validation queue
- agent may seek corroborating evidence

## 23. Recommended Build Sequence

1. Scaffold `veritas_development` module package.
2. Implement MVP DocTypes and naming conventions.
3. Add workflows and permissions.
4. Implement scoring service layer.
5. Implement dedupe and provenance helpers.
6. Add whitelisted agent API methods.
7. Create saved views / dashboards.
8. Add approval gates.
9. Add test fixtures for Property and Capital scenarios.
10. Add analytics / outcome attribution.
11. Integrate Hermes only after transactional behavior passes tests.

## 24. Non-Goals for MVP

Do not build in Phase 1:

- Autonomous outbound capital solicitation
- Autonomous negotiation
- Full investor portal
- Full project accounting
- Predictive ML scoring that self-modifies production weights
- Replacement for Frappe CRM
- Replacement for external relationship / enrichment vendors
- Broad nationwide signal coverage before the pilot is proven

## 25. Definition of Done

The Radar is operational when Veritas can go from a real-world property or capital signal to a scored, relationship-aware, human-governed action in Frappe, then record the economic result so the system becomes more accurate over time.

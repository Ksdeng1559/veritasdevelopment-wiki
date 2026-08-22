# Veritas OS — Agency Agents Architecture

## Purpose

Use the `msitarzewski/agency-agents` repository as a role and workflow foundation for Veritas OS, while adapting the agents to Veritas Development's actual operating model: origination, capital formation, project delivery, CRM/back office, knowledge management, and governance.

The goal is not to install the entire Agency Agents roster. Veritas should run a smaller, purpose-built operating company of agents with one orchestrator and a focused set of specialists.

## Veritas OS Core Structure

```text
                         VERITAS OS
                             │
                    CHIEF OF STAFF AGENT
                             │
                   AGENTS ORCHESTRATOR
                             │
       ┌─────────────┬───────┼───────┬──────────────┐
       │             │       │       │              │
 ORIGINATION      CAPITAL  PROJECTS OPERATIONS   KNOWLEDGE
       │             │       │       │              │
Referral Agent      CFO     PM      Ops Manager    ZK Steward
Outbound Agent      │       │       │              │
Deal Strategist     ├─ Financial   Controller      RAG Agent
Pipeline Analyst    │  Analyst      │              │
                    ├─ Investment   Reporting       Meeting
                    │  Researcher                   Intelligence
                    └─ Proposal
                       Strategist
```

## Phase 1 Agent Roster

1. Chief of Staff
2. Agents Orchestrator
3. Workflow Architect
4. Operations Manager
5. Outbound Strategist
6. Deal Strategist
7. Pipeline Analyst
8. Chief Financial Officer
9. Financial Analyst
10. Investment Researcher
11. Proposal Strategist
12. Studio Producer
13. Senior Project Manager
14. ZK Steward
15. Meeting Notes Specialist
16. RAG Pipeline Engineer
17. Multi-Agent Systems Architect
18. Automation Governance Architect

## Team 1 — Opportunity & Origination

Use the following Agency Agents as starting points:

- Outbound Strategist
- Deal Strategist
- Pipeline Analyst

### Veritas workflow

```text
Referral / Market Signal
        ↓
Opportunity Discovered
        ↓
Opportunity Intake Agent
        ↓
Deal Strategist
        ↓
Opportunity Score
        ↓
Frappe CRM
        ↓
Qualified Development Opportunity
```

### Opportunity types

- Land Development
- Ground-up Construction
- Commercial Development
- Redevelopment
- Rehab
- Renovation
- Joint Venture
- Acquisition
- Capital Advisory

Referral and relationship sources should feed this pipeline and become attributable origination records in Frappe CRM.

## Team 2 — Capital Markets

Start with:

- Chief Financial Officer
- Financial Analyst
- Investment Researcher
- FP&A Analyst
- Proposal Strategist
- Legal Compliance Checker

### Veritas Capital Stack Engine

```text
PROJECT
   │
   ▼
Capital Readiness Agent
   │
   ▼
Financial Analyst
   │
   ├── Project Cost
   ├── GDV / ARV
   ├── NOI
   ├── LTC
   ├── LTV
   ├── DSCR
   ├── IRR
   └── Sensitivity Analysis
   │
   ▼
CFO / Capital Stack Agent
   │
   ├── Senior Debt
   ├── Mezzanine
   ├── Preferred Equity
   ├── JV Equity
   ├── Sponsor Equity
   └── Incentives
   │
   ▼
Investment Researcher
   │
   ▼
Lender / Investor Matching
   │
   ▼
Proposal Strategist
   │
   ▼
Financing Package
```

The Veritas lender, family-office, Co-GP, private-credit and investor databases should be connected to this workflow so capital recommendations are based on actual mandate fit.

## Team 3 — Development Operations

Use:

- Studio Producer
- Project Shepherd
- Senior Project Manager

### Development lifecycle

```text
Portfolio Agent
      ↓
Project Manager
      ↓
────────────────────────────
Acquisition
Due Diligence
Entitlements
Design
Permitting
Financing
Procurement
Construction
Inspections
Sales / Lease-up
Closeout
────────────────────────────
```

Each development should have a structured project record in Frappe covering:

```text
Project
├── Property
├── Ownership
├── Consultants
├── Approvals
├── Capital Stack
├── Lender
├── Investors
├── Construction Budget
├── Schedule
├── Contractors
├── Documents
├── Risks
├── Decisions
└── Project KPIs
```

## Team 4 — Frappe CRM / Back Office Systems

Use the engineering agents primarily as system-building agents rather than daily operating agents:

- Backend Architect
- Software Architect
- Database Optimizer
- AI Engineer
- API Platform Engineer
- Identity & Access Engineer
- DevOps Automator

### Target architecture

```text
                 VERITAS OS
                     │
                  Frappe
           CRM + ERP + Backoffice
                     │
       ┌─────────────┼──────────────┐
       │             │              │
 Opportunities    Projects        Capital
       │             │              │
       └─────────────┼──────────────┘
                     │
                 Agent Layer
                     │
                  Hermes
                     │
           Agent Orchestrator
                     │
 ┌─────────┬─────────┼────────┬───────────┐
 Origination Capital Projects Finance Knowledge
```

## Team 5 — Veritas Knowledge & Operating IP

Use:

- ZK Steward
- Meeting Notes Specialist
- RAG Pipeline Engineer
- Technical Writer
- Corporate Training Designer

### Knowledge capture loop

```text
Screenpipe
    ↓
Observed Work
    ↓
Meeting / Workflow Extraction
    ↓
ZK Steward
    ↓
Verified Knowledge
    ↓
SOP
    ↓
Open Knowledge Framework
    ↓
RAG
    ↓
Veritas AI Mentor
```

The output becomes Veritas operating IP: SOPs, decision rules, heuristics, checklists, underwriting logic, lender criteria, project lessons, escalation rules, training material, and institutional knowledge.

## Team 6 — Governance

Mandatory governance roles:

- Agents Orchestrator
- Multi-Agent Systems Architect
- Automation Governance Architect

### Governance principle

Agents should not autonomously create material legal, financial, or contractual obligations without approval.

```text
AI Recommends
       ↓
Human Approves
       ↓
AI Executes
       ↓
Action Logged
```

Human approval should be required for matters such as:

- Sending or transferring money
- Signing contracts
- Agreeing to financing terms
- Changing approved project budgets beyond thresholds
- Accepting lender or investor terms
- Creating legal obligations
- Changing ownership or equity allocations

## Agent Adaptation Strategy

Do not use the generic Agency Agents unchanged. Fork and rewrite the relevant agent definitions around Veritas terminology, workflows, systems, data and approval authority.

Examples:

```text
sales-deal-strategist.md
          ↓
veritas-opportunity-underwriter.md
```

```text
finance-financial-analyst.md
          ↓
veritas-development-underwriter.md
```

```text
finance-investment-researcher.md
          ↓
veritas-capital-source-researcher.md
```

```text
project-management-project-shepherd.md
          ↓
veritas-development-project-manager.md
```

Agency Agents should provide the baseline job descriptions and workflow patterns. Veritas OS should supply the institutional intelligence: underwriting rules, project criteria, capital-source mandates, referral attribution, knowledge graph, SOPs, approval thresholds, historical decisions and operational context.

## Phase 2 Agents

Add after the Phase 1 operating model is stable:

- Legal Compliance Checker
- FP&A Analyst
- Bookkeeper & Controller
- SEO Specialist
- Content Creator
- Executive Summary Generator
- Finance Tracker / Analytics Reporter where useful

## Agents Not Needed Initially

Avoid loading unrelated divisions or specialist agents until there is a defined Veritas use case. Examples include gaming, XR, China e-commerce, WeChat, Solidity, IoT, healthcare, hospitality, Drupal and WordPress-specific specialists.

## Operating Principle

Veritas OS should not become an uncontrolled swarm of agents. It should behave like a managed operating company:

**Frappe = system of record**  
**Hermes = execution/orchestration layer**  
**Agency-derived agents = specialist workforce**  
**Open Knowledge Framework / RAG = institutional intelligence**  
**Screenpipe = observed-work capture**  
**Human leadership = authority and final accountability**

# Veritas OS v0.1 — Product Requirements Document

**Status:** Draft v0.2  
**Date:** August 22, 2026  
**Product:** Veritas OS  
**Organization:** Veritas Development Group  
**Phase:** Prototype / Architecture Validation

## 1. Executive Summary

Veritas OS is an agentic operating system designed to coordinate business development, capital formation, project execution, finance, and institutional knowledge for Veritas Development Group.

The initial prototype combines:

- **Mission Control** — agent control plane and governance
- **Hermes** — AI reasoning and execution runtime
- **Veritas Specialist Agents** — business-specific AI workers and skills
- **Frappe CRM / Frappe Framework** — operational system of record
- **Open Knowledge Framework / Veritas Knowledge Layer** — validated institutional knowledge
- **Screenpipe** — observational capture of human workflows and tribal knowledge
- **MCPs and APIs** — controlled access to business systems
- **Human approval gates** — authorization for consequential actions

The prototype is not intended to automate the entire company. Its purpose is to validate a reusable operating pattern:

> **Task → Agent → Tools → Evidence → Approval → System of Record → Learning Review → Improved SOP**

If this loop operates reliably, additional Veritas business processes can be deployed on the same architecture.

## 2. Product Vision

Create a governed AI operating layer capable of turning Veritas Development's business processes, relationships, institutional knowledge, project information, and capital-market intelligence into repeatable workflows executed by specialized AI agents under human supervision.

The long-term objective is to create a system where Veritas can systematically:

- discover and qualify opportunities;
- manage referral relationships;
- structure capital stacks;
- identify lenders and investors;
- coordinate development projects;
- monitor financial performance;
- maintain institutional knowledge;
- execute SOPs;
- produce management intelligence;
- capture expert judgment;
- train staff and agents from verified company knowledge;
- continuously improve workflows based on outcomes.

## 3. Core Architecture

### Mission Control — Control Plane

Mission Control answers: **What work is being performed, by whom, under what authority, and what happened?**

Responsibilities include task creation, agent registration, assignment, status tracking, scheduling, approvals, quality gates, completion receipts, logs, usage/cost tracking where available, alerts, audits, health monitoring, failure reporting, and governance.

Mission Control is not the primary business database or the authoritative knowledge base.

### Hermes — Agent Runtime

Hermes answers: **How should this task be reasoned through and executed?**

Responsibilities include reasoning, planning, tool selection, specialist skill invocation, MCP/API interaction, research, workflow execution, evidence collection, and escalation.

Hermes does not determine organizational authority. Mission Control and Veritas policy determine what Hermes is permitted to execute.

### Frappe — Operational System of Record

Frappe answers: **What exists operationally inside Veritas?**

Frappe will maintain entities such as contacts, companies, referral partners, opportunities, properties, projects, lenders, investors, financing requests, milestones, vendors, contractors, documents, activities, financial records, approvals, and relationship history.

### Veritas Knowledge Layer / OKF

The knowledge layer answers: **What does Veritas know?**

It should contain validated SOPs, decision rules, lender criteria, underwriting policies, development procedures, market intelligence, project lessons, referral intelligence, templates, approved terminology, historical decisions, and expert knowledge.

Knowledge must distinguish between observed, extracted, reviewed, verified, approved, superseded, and deprecated information.

### Screenpipe — Observation Layer

Screenpipe answers: **How is work actually performed by experienced people?**

Potential inputs include meetings, screen activity, workflow demonstrations, expert narration, research sessions, decision processes, exception handling, and operating context.

Screenpipe output is **evidence of behavior**, not automatically approved policy.

## 4. High-Level Architecture

```text
                         VERITAS OS

                    Executive / Management
                              │
                              ▼
                    MISSION CONTROL
                     Control Plane
                              │
          ┌───────────────────┼───────────────────┐
          │                   │                   │
       Tasks              Governance         Observability
       Schedules          Approvals          Audit / Cost
          │                   │                   │
          └───────────────────┼───────────────────┘
                              │
                              ▼
                         HERMES
                       Agent Runtime
                              │
                      Agent Orchestrator
                              │
             ┌────────────────┼────────────────┐
             │                │                │
        Origination        Capital        Operations
           Agent            Agent            Agent
             │                │                │
             └────────────────┼────────────────┘
                              │
                           MCP/API
                              │
          ┌────────────┬──────┼──────┬────────────┐
          │            │             │            │
        Frappe        OKF           n8n        External
        CRM/ERP     Knowledge    Automation     Systems
          ▲            ▲
          │            │
          │        Approved SOPs
          │            ▲
          │       Human Validation
          │            ▲
          └────── Screenpipe Capture
```

## 5. Prototype Scope

Version 0.1 will intentionally remain small.

### Infrastructure

1. Mission Control
2. Hermes
3. Hermes ↔ Mission Control adapter
4. Frappe
5. basic OKF/RAG knowledge retrieval
6. Screenpipe capture workflow
7. audit/evidence storage
8. SOP versioning and approval workflow

### Initial Worker Agents

1. **Veritas Origination Agent**
2. **Veritas Capital Markets Agent**
3. **Veritas Operations Agent**

Specialized roles are preferably loaded as skills rather than implemented as numerous independent persistent agents.

## 6. Origination Agent

Purpose: identify, intake, qualify, score, and route potential Veritas opportunities.

Specialist capabilities may include Outbound Strategist, Deal Strategist, Pipeline Analyst, Business Strategist, and Trend Researcher.

Opportunity classes may include land development, ground-up construction, commercial development, redevelopment, rehabilitation, renovation, acquisition, joint venture, and capital advisory.

## 7. Capital Markets Agent

Purpose: determine capital readiness and recommend financing structures and capital sources.

Specialist capabilities may include Chief Financial Officer, Financial Analyst, Investment Researcher, FP&A Analyst, Proposal Strategist, and compliance review.

Potential analysis includes project cost, sources and uses, stabilized value, ARV/GDV, NOI, LTC, LTV, DSCR, IRR, sensitivity analysis, debt requirement, and equity requirement.

Potential capital components include senior debt, construction financing, bridge debt, mezzanine financing, preferred equity, JV equity, Co-GP capital, sponsor equity, incentives, and applicable public programs.

The agent produces recommendations. It does not independently commit Veritas to financing.

## 8. Operations Agent

Purpose: monitor development operations and convert operational data into management intelligence.

Capabilities may include project management, milestone tracking, dependency analysis, risk detection, portfolio reporting, workflow monitoring, and executive reporting.

Typical development lifecycle:

**Opportunity → Acquisition → Due Diligence → Entitlement → Design → Permitting → Capitalization → Procurement → Construction → Inspection → Sale/Lease-Up → Closeout**

## 9. Mission Control ↔ Hermes Adapter

A thin adapter should connect Mission Control to Hermes without modifying Hermes' core reasoning architecture.

Minimum interface:

```text
register_agent()
heartbeat()
fetch_tasks()
claim_task()
update_progress()
submit_result()
submit_evidence()
report_usage()
report_failure()
request_approval()
complete_task()
```

Version 0.1 should prefer REST-based task coordination. Live interactive session control is not required for prototype validation.

## 10. Task Contract

Every Veritas agent task should contain, where applicable:

```text
Task ID
Task Type
Objective
Business Entity
Assigned Agent
Priority
Context
Permitted Tools
Required Inputs
Required Outputs
Evidence Requirements
Approval Requirement
Risk Classification
Applicable SOP Version
Deadline
Status
Cost
Completion Receipt
```

## 11. Evidence-Based Completion

An AI statement that work has been completed is insufficient evidence of completion.

A task should preferably produce:

**Result + Evidence + Artifact + Audit Trail + SOP Version Used**

Examples:

- Research: recommendation plus current source evidence.
- CRM: updated record identifier plus changed fields.
- Financial analysis: model inputs, assumptions, calculations, sensitivity outputs, and structure.
- Outreach: approved message, recipient, message identifier, and timestamp.

## 12. Human-in-the-Loop Governance

### Level 1 — Autonomous

Public research, summarization, classification, opportunity scoring, internal analysis, draft generation, routine reporting.

### Level 2 — Autonomous with Audit

Creating internal notes, updating low-risk CRM fields, creating internal tasks, refreshing research records.

### Level 3 — Human Review

Lender recommendations, underwriting changes, investor materials, financing packages, external communication drafts, significant project recommendations.

### Level 4 — Explicit Human Approval

Sending consequential external communications, changing approved project budgets, submitting financing applications, changing financing terms, creating material commitments.

### Level 5 — Human Only

Signing contracts, accepting financing, legally binding Veritas, transferring money, executing securities transactions, committing investor capital, and final legal decisions.

## 13. Continuous Learning & SOP Governance

Continuous learning is a **core requirement** of Veritas OS.

The system must not depend on static prompts or one-time SOP creation. It must continuously convert observed work, expert judgment, operational outcomes, and management decisions into reviewed and versioned institutional knowledge.

### 13.1 Governing Principle

> **Screenpipe captures behavior. Veritas approves knowledge. Agents execute approved knowledge. Mission Control measures outcomes.**

No captured activity, transcript, generated rule, or AI inference becomes an authoritative SOP without validation.

### 13.2 Knowledge Learning Loop

```text
Human performs work
        ↓
Screenpipe captures screen/audio/context
        ↓
Knowledge Extraction Agent
        ↓
Candidate SOP / rules / exceptions
        ↓
Expert review and correction
        ↓
Approved SOP version
        ↓
OKF / Veritas Knowledge Layer
        ↓
Agent skill / prompt / workflow
```

### 13.3 Execution Learning Loop

```text
Agent executes approved SOP
        ↓
Mission Control records task/result/evidence
        ↓
Outcome is reviewed
        ↓
Expected vs. actual decision compared
        ↓
Error / exception / improvement identified
        ↓
SOP change proposed
        ↓
Expert approval
        ↓
New SOP version published
        ↓
Next execution uses improved version
```

### 13.4 Types of Learning

Veritas OS must distinguish at least four types of learning:

1. **Observed Learning** — what Screenpipe recorded someone doing.
2. **Expert Learning** — explicit judgment or instruction provided by an experienced Veritas operator.
3. **Outcome Learning** — lessons inferred from successful or unsuccessful business outcomes.
4. **Policy Learning** — intentional management changes to how Veritas wants work performed.

Policy learning and expert-validated knowledge outrank unreviewed observed behavior.

### 13.5 Learning Registry

Every significant SOP should eventually track:

| Field | Purpose |
|---|---|
| SOP ID | Permanent identifier |
| Process | Workflow governed |
| Owner | Human accountable for process |
| Source | Screenpipe, meeting, document, outcome review, etc. |
| Version | Current approved version |
| Status | Draft / Review / Approved / Superseded / Deprecated |
| Effective Date | When agents may use it |
| Confidence | Strength of supporting evidence |
| Exceptions | Known edge cases |
| Agent Usage | Which agents rely on it |
| Outcome Metrics | Whether the SOP performs effectively |
| Last Reviewed | Governance date |
| Next Review | Scheduled governance date |
| Approved By | Responsible human approver |

### 13.6 SOP Lifecycle

```text
Captured
   ↓
Extracted
   ↓
Draft
   ↓
Reviewed
   ↓
Approved
   ↓
Published
   ↓
Used by Agent
   ↓
Measured
   ↓
Reconfirmed / Revised / Deprecated
```

### 13.7 Agent Reconfirmation

Agents must be able to flag uncertainty or divergence from the approved SOP.

Examples:

- “This situation does not match known cases.”
- “Current lender criteria conflict with SOP assumptions.”
- “Human operator overrode this rule three times.”
- “Outcome data indicates the scoring threshold may be too strict.”

Such events should create a **Learning Review Task** in Mission Control rather than silently changing the agent's behavior.

### 13.8 SOP Promotion Rules

A candidate rule should not be promoted automatically when:

- it was observed only once;
- the source operator may have made an error;
- it conflicts with approved policy;
- it relates to legal, financial, regulatory, or securities decisions;
- the business outcome is not yet known;
- evidence is weak or contradictory.

### 13.9 Learning Metrics

Track over time:

- agent recommendation vs. human decision agreement rate;
- agent recommendation vs. eventual outcome;
- number of human overrides;
- number of SOP exceptions;
- task rework rate;
- error rate by SOP version;
- SOPs with stale review dates;
- knowledge gaps identified by agents;
- percentage of agent executions using current approved SOP versions;
- time from observed knowledge to approved SOP;
- improvement in task quality after SOP revisions.

## 14. Prototype Workflow A — Opportunity Intake

```text
Referral / Opportunity
        ↓
Frappe
        ↓
Mission Control Task
        ↓
Origination Agent
        ↓
Approved Qualification SOP
        ↓
Research + Qualification
        ↓
Opportunity Score
        ↓
Recommendation
        ↓
Frappe Update
        ↓
Evidence + SOP Version
        ↓
Completion Receipt
        ↓
Human outcome / override captured for learning
```

Success criteria include correct context, scoring rationale, Frappe update, evidence, audit trail, and capture of human override where applicable.

## 15. Prototype Workflow B — Capital Stack

```text
Qualified Project
       ↓
Capital Readiness Review
       ↓
Approved Underwriting SOP
       ↓
Financial Analysis
       ↓
Capital Stack Design
       ↓
Capital Source Research
       ↓
Lender / Investor Matching
       ↓
Recommendation
       ↓
Human Review
       ↓
Frappe Capital Record
       ↓
Outcome feedback
       ↓
Learning Review if assumptions/rules were incorrect
```

Required outputs may include sources and uses, capital requirement, recommended structure, senior debt, equity requirement, target LTC/LTV, assumptions, potential capital sources, documentation gaps, risk factors, next actions, evidence, and SOP version used.

## 16. Prototype Workflow C — Executive Operating Review

Inputs may include opportunities, pipeline, project milestones, financing status, approvals, risks, overdue actions, and agent exceptions.

Output: **Veritas Executive Brief** containing new opportunities, high-priority deals, capital requirements, project status, deadlines, risks, decisions required, agent exceptions, knowledge gaps, and recommended next actions.

## 17. Prototype Workflow D — SOP Learning Loop

This workflow is mandatory for v0.1 validation.

```text
Experienced operator performs selected business process
        ↓
Screenpipe captures session
        ↓
Knowledge Extraction Agent creates candidate SOP
        ↓
Human expert reviews/corrects
        ↓
Approved SOP v1.0 stored in knowledge layer
        ↓
Hermes agent executes same workflow using SOP
        ↓
Mission Control records evidence and outcome
        ↓
Human compares agent execution with expected practice
        ↓
SOP reconfirmed or revised
```

Prototype acceptance requires demonstrating at least one complete cycle from captured human workflow to approved SOP to agent execution to feedback-based reconfirmation or revision.

## 18. Initial Frappe Domain Model

### Relationship Management

Contact, Organization, Referral Partner, Advisor, Lender, Investor, Vendor, Contractor.

### Opportunity Management

Opportunity, Opportunity Source, Opportunity Score, Property, Development Type.

### Development

Project, Project Phase, Milestone, Risk, Approval, Consultant, Contractor.

### Capital

Capital Request, Capital Stack, Capital Source, Financing Scenario, Lender Criteria, Investor Criteria, Financing Submission.

### Knowledge

SOP, SOP Version, Decision Rule, Knowledge Object, Source, Verification Record, Learning Review, Exception, Outcome Review.

## 19. Observability Requirements

Mission Control should eventually provide visibility into tasks created/completed/failed, retries, completion time, utilization, cost per task, model/token usage where available, approvals, approval latency, agent health, evidence completeness, human overrides, SOP versions used, knowledge exceptions, and learning review queues.

## 20. Prototype KPIs

- **Task completion rate:** >90%
- **Completed tasks containing required evidence:** >95%
- **High-risk actions executed without required approval:** 0
- **Unauthorized system-of-record changes:** 0 target
- **Tasks requiring human rework:** tracked from Day 1
- **Human-only vs. Veritas OS completion time:** tracked
- **AI/API cost per completed workflow:** tracked
- **Agent executions referencing an approved SOP where one exists:** >95%
- **SOP changes made without human approval:** 0
- **Human overrides captured as learning events:** >95%

## 21. Prototype Acceptance Tests

1. Mission Control assigns a task to Hermes.
2. Hermes can receive, claim, execute, update, complete, fail, and retry a task.
3. Hermes can safely read/update authorized Frappe records.
4. A completed task contains verifiable evidence or an artifact.
5. A high-risk action cannot proceed without authorization.
6. Failed tasks are visible, logged, and recoverable.
7. Management can determine who/what acted, when, why, and what changed.
8. A Screenpipe-captured human workflow can be converted into a candidate SOP.
9. A human expert can approve/revise that SOP before agent use.
10. An agent can execute the approved SOP and record the SOP version used.
11. A human override or poor outcome can create a Learning Review Task.
12. A revised SOP can be versioned and used by the next execution.

## 22. Non-Goals for v0.1

The prototype will not attempt complete autonomous company operation, autonomous contracts, autonomous financial transactions, autonomous investor solicitation, autonomous financing commitments, dozens of persistent agents, full construction ERP replacement, Mission Control as the master knowledge base, unrestricted agent-to-agent communication, automatic self-modification of SOPs, or production-scale distributed infrastructure.

## 23. Deployment Strategy

```text
Fork
 ↓
Pin tested version
 ↓
Containerize
 ↓
Configure persistence
 ↓
Implement backups
 ↓
Secure access
 ↓
Build Hermes adapter
 ↓
Integrate Frappe
 ↓
Integrate Screenpipe capture pipeline
 ↓
Implement SOP registry/versioning
 ↓
Integration testing
 ↓
Controlled deployment
 ↓
Selective upstream merges
```

## 24. Security Principles

Veritas OS should follow **Least Privilege + Explicit Authority + Auditability**.

Each agent receives only credentials and capabilities necessary for its function. Credentials must not be embedded directly in prompts or agent files. Sensitive actions require authorization. Agent identities must be distinguishable and actions attributable.

Captured Screenpipe data must also be governed for privacy, retention, access, and business confidentiality.

## 25. Phase 2 Expansion

After prototype validation, additional worker capabilities may include Finance/Controller, FP&A, Knowledge Operations, SOP Agent, AI Mentor, construction coordination, procurement, vendor management, entitlement tracking, referral network, outbound, marketing, SEO, investor communications, lender monitoring, financing-package generation, capital-market intelligence, and relationship management.

## 26. Long-Term Agent Organization

The target architecture should favor a small number of persistent workers with specialist capabilities:

```text
Mission Control
       │
       ▼
Hermes Runtime Layer
       │
       ├── Origination Agent
       ├── Capital Markets Agent
       ├── Development Operations Agent
       ├── Finance Agent
       ├── Knowledge Operations Agent
       └── Growth Agent
               │
               ▼
        Specialist Skills + Approved SOPs
```

## 27. Veritas Operating Principle

Veritas OS should not attempt to replace accountable executives, project managers, financial professionals, attorneys, lenders, contractors, or other qualified professionals.

Its purpose is to make their knowledge and workflows:

**Visible → Structured → Verified → Repeatable → Measurable → Automatable → Continuously Improved**

## 28. Prototype Decision Gate

The v0.1 prototype should answer:

> **Can Veritas reliably capture expert work, convert it into approved operating knowledge, assign business work to AI agents, allow them to reason and use approved tools, require evidence of completion, enforce human authority, persist verified outcomes, and continuously improve SOPs from real execution feedback?**

If yes, the Veritas OS architecture is validated for expansion.

## 29. North-Star Architecture

```text
                    HUMAN LEADERSHIP
                           │
             ┌─────────────┴─────────────┐
             ▼                           ▼
        HUMAN WORK                  MANAGEMENT
             │                           │
             ▼                           ▼
        SCREENPIPE                MISSION CONTROL
       Observation               Governance / Audit
             │                           │
             ▼                           ▼
     KNOWLEDGE EXTRACTION             HERMES
             │                    Reasoning / Execution
             ▼                           │
      EXPERT VALIDATION                  ▼
             │                    VERITAS AGENTS
             ▼                           │
            OKF                          ▼
     Approved Knowledge              MCP / APIs
             │                           │
             └──────────► Skills ◄───────┤
                                         ▼
                               FRAPPE / AUTOMATIONS
                                         │
                                         ▼
                                      OUTCOMES
                                         │
                                         ▼
                                  LEARNING REVIEW
                                         │
                                         └────► SOP Revision
```

**Mission Control manages the work.**  
**Hermes reasons about the work.**  
**Veritas agents specialize in the work.**  
**Frappe records the business.**  
**OKF preserves approved institutional knowledge.**  
**Screenpipe captures how expertise is actually practiced.**  
**The learning loop improves how Veritas operates over time.**

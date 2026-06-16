# AI Job Search Agent

## Functional Specification Document (Version 1.0)

---

# 1. Project Overview

## Project Name

AI Job Search Agent

## Purpose

The AI Job Search Agent is a self-hosted automation platform designed to automate job discovery, evaluate opportunities against user-defined career preferences, and deliver high-quality recommendations with minimal manual effort.

The system will collect jobs from public sources, normalize and store job information, use locally hosted AI models to evaluate job fit, and notify the user of high-value opportunities through Telegram.

The system is intended to function as both a practical personal tool and a portfolio project demonstrating workflow automation, system design, database architecture, and AI-assisted decision support.

---

# 2. Problem Statement

Searching for jobs is repetitive and time-consuming.

Typical activities include:

* Searching multiple job boards
* Reading lengthy job descriptions
* Determining whether opportunities align with career goals
* Tracking jobs and application status
* Avoiding duplicate postings
* Remembering follow-ups and next actions

These activities represent knowledge work that can be automated and augmented through AI.

---

# 3. Goals

The system shall:

* Automatically collect job postings from approved sources
* Normalize all job postings into a standard structure
* Prevent duplicate entries
* Evaluate jobs against user-defined preferences
* Deliver timely recommendations through Telegram
* Maintain application status tracking
* Provide a persistent database of opportunities and decisions

---

# 4. Non-Goals (Version 1)

The following capabilities are intentionally out of scope:

* Automatic job applications
* Resume generation
* Cover letter generation
* Browser automation
* Web dashboards
* Machine learning feedback loops
* Integration with LinkedIn authentication
* Resume tailoring

These capabilities may be considered future enhancements.

---

# 5. Technology Stack

Workflow Orchestration

* n8n

Database

* PostgreSQL

AI Evaluation Engine

* Ollama

Notifications

* Telegram Bot API

Version Control

* GitHub

Hosting Environment

* Self-hosted environment (CasaOS / Docker)

---

# 6. System Architecture

Job Sources
↓
Ingestion Workflow
↓
Normalization
↓
Deduplication
↓
PostgreSQL
↓
AI Evaluation
↓
PostgreSQL
↓
Telegram Notifications
↓
Application Tracking

---

# 7. Supported Job Sources (Version 1)

Approved sources:

* Remote OK API
* Indeed RSS feeds
* Company career RSS feeds (optional)

Future sources:

* LinkedIn
* Built In
* Wellfound

---

# 8. Functional Requirements

## FR-001: Job Collection

The system shall:

* Execute every four hours
* Retrieve new jobs from approved sources
* Capture full job descriptions whenever possible

---

## FR-002: Job Normalization

The system shall convert all source data into the following structure:

Job Title
Company
Location
Salary
Description
URL
Source
Date Posted
Date Found

---

## FR-003: Deduplication

The system shall:

Generate a fingerprint using:

Company
Job Title
Location

Generate:

MD5(
lower(company) +
lower(title) +
lower(location)
)

Duplicate jobs shall not be inserted into the database.

---

## FR-004: AI Evaluation

The system shall evaluate each new job using the complete job description.

The evaluation engine shall return:

* Match Score (0-100)
* Recommendation
* Reasons
* Red Flags
* Role Categories
* AI Summary

Recommendations:

Apply
Review
Ignore

---

## FR-005: Notifications

Immediate Notification Rule:

Match Score >= 90

Daily Digest Rule:

80 <= Match Score < 90

Database Only:

Match Score < 80

---

## FR-006: Application Tracking

Supported statuses:

New
Saved
Applied
Interviewing
Rejected
Closed
Ignored

Status changes shall persist in the database.

---

# 9. User Preference Requirements

User preferences shall be stored in the database and shall not be hardcoded within workflows.

Initial preferences:

Experience:
20+ years in technology

Preferred Roles:

* Automation & Process Improvement Specialist
* Workflow Automation Specialist
* Business Systems Specialist

Enjoys:

* Building AI automations
* Business process improvement
* Tableau/dashboard development
* Documentation and training

Avoid:

* SQL-heavy positions
* Analyst positions

Location Preferences:

* Remote preferred
* Hybrid acceptable

---

# 10. Database Design

## Table: jobs

Fields:

id
hash
title
company
location
salary
description
url
source
date_posted
date_found
score
recommendation
reasons
red_flags
role_categories
ai_summary
status
date_applied
notes

---

## Table: user_profile

Fields:

id
key
value

Examples:

preferred_role
enjoys
avoid
remote_preference
hybrid_preference
years_experience

---

# 11. Workflows

Workflow 1
Job Collection

Responsibilities:

* Retrieve jobs
* Normalize data
* Insert new jobs

Schedule:
Every four hours

---

Workflow 2
AI Evaluation

Responsibilities:

* Retrieve unscored jobs
* Retrieve user preferences
* Evaluate jobs with Ollama
* Persist scoring results

---

Workflow 3
Immediate Notifications

Responsibilities:

* Retrieve jobs with score >= 90
* Send Telegram notification
* Mark notification as sent

---

Workflow 4
Daily Digest

Schedule:
7:00 PM daily

Responsibilities:

* Retrieve jobs with score between 80 and 89
* Generate summary message
* Send Telegram digest

---

Workflow 5
Application Management

Responsibilities:

* Maintain application status
* Update notes
* Track dates and outcomes

---

# 12. Success Criteria

Version 1 is considered complete when the following sequence operates successfully:

Job Source
→ Normalize
→ Deduplicate
→ Store
→ Evaluate
→ Notify
→ Track

The system must operate without manual intervention except for application decisions and status updates.

---

# 13. Future Enhancements

Potential Version 2 capabilities:

* Additional job sources
* Dashboarding (Metabase)
* Resume generation
* Cover letter generation
* Feedback learning loop
* Skill trend reporting
* Browser automation
* Company research summaries
* Interview preparation assistance
* Automatic application reminders

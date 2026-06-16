# AI-Powered Job Hunt

An AI-assisted, self-hosted job search automation platform that discovers opportunities, evaluates job fit against user-defined preferences, and delivers personalized recommendations through automated workflows.

---

## Overview

Searching for jobs is repetitive, fragmented, and time-consuming. Candidates often spend hours searching multiple sites, reviewing lengthy job descriptions, determining fit, and manually tracking opportunities.

The AI-Powered Job Hunt platform automates much of this process by combining workflow orchestration, AI evaluation, and persistent job tracking into a single system.

The platform continuously collects job postings, normalizes data from multiple sources, evaluates opportunities using locally hosted large language models, and delivers curated recommendations through Telegram notifications.

This project serves both as a practical personal productivity tool and as a portfolio project demonstrating automation architecture, workflow orchestration, database design, and AI-assisted decision support.

---

## Key Features

### Automated Job Collection

* Retrieves jobs from approved public sources
* Executes on a scheduled basis
* Supports multiple job providers

### Data Normalization

* Converts all job data into a consistent structure
* Simplifies downstream processing and analysis

### Deduplication

* Prevents duplicate job postings from being stored
* Maintains a clean and manageable dataset

### AI-Powered Evaluation

* Uses locally hosted LLMs through Ollama
* Evaluates jobs against user preferences
* Generates scores, recommendations, and summaries

### Intelligent Notifications

* Sends immediate alerts for highly compatible opportunities
* Generates daily digests for secondary matches
* Reduces notification fatigue

### Application Tracking

* Maintains application status history
* Supports notes and follow-up tracking
* Provides a centralized opportunity database

---

## Technology Stack

| Component              | Technology       |
| ---------------------- | ---------------- |
| Workflow Orchestration | n8n              |
| Database               | PostgreSQL       |
| AI Evaluation          | Ollama           |
| Notifications          | Telegram Bot API |
| Hosting                | Docker / CasaOS  |
| Version Control        | GitHub           |

---

## High-Level Architecture

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
Telegram Notifications
↓
Application Tracking

---

## Project Status

Current Status: Planning and Design

Version 1 Scope:

* Job collection
* Data normalization
* Deduplication
* AI scoring
* Telegram notifications
* Application tracking

Future Enhancements:

* Additional job sources
* Resume generation
* Cover letter generation
* Company research summaries
* Dashboarding
* Skill trend reporting
* Feedback learning loop

---

## Repository Structure

/docs
Functional specifications, technical design documents, diagrams, prompts, and implementation planning.

/workflow
n8n workflow exports.

/sql
Database schema and sample data.

/examples
Example job records, AI responses, and notification formats.

---

## Objectives

Reduce the time and effort required to discover relevant opportunities while demonstrating practical applications of:

* Workflow automation
* System architecture
* Database design
* AI-assisted decision support
* Process improvement
* Technical documentation

---

## License

This repository is provided for educational and portfolio purposes.

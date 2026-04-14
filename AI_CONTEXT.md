# txt-tools — AI Context & Tooling Contract

## Purpose

This repository provides a lightweight CLI toolchain for deterministic file editing and developer workflow automation.

It is designed to be:
- fast
- predictable
- scriptable
- safe for incremental edits
- installable into user space (~/.local/bin)

---

## Core Tools

### write_block

Primary file manipulation tool.

Modes:
- write <file>      → overwrite file with stdin content
- append <file>     → append stdin content
- insert-after      → insert content after pattern match
- insert-before     → insert content before pattern match

Behavior:
- uses stdin as input
- preserves file permissions where possible
- supports dry-run mode (if enabled in wrapper)
- prints verification + diff after execution

---

### mark_block / unmark_block

Utilities for tagging or managing structured text regions.

Used for:
- code annotation
- structured editing workflows
- future AI-assisted patching

---

### tools-update

Safe update + reinstall pipeline:

Steps:
1. git pull --rebase
2. run install.sh
3. verify CLI availability

Guarantees:
- deterministic state
- no partial installs
- consistent CLI sync

---

### install.sh

Installs all bin tools into:

    ~/.local/bin

Rules:
- copies from repo bin/
- ensures executable permissions
- overwrites existing versions

---

## System Model

Source of truth:
    ~/dev/txt-tools (git repo)

Runtime:
    ~/.local/bin

Update flow:
    git pull → install.sh → tools available globally

---

## Critical Rules

- NEVER edit ~/.local/bin manually
- ALWAYS use install.sh for updates
- NEVER assume git pull includes install step
- write_block must remain deterministic (no hidden side effects)

---

## AI Usage Guidance

When interacting with this toolset:

- assume repo is authoritative
- prefer deterministic commands over heuristics
- avoid partial edits unless explicitly requested
- treat install.sh as the single deployment mechanism

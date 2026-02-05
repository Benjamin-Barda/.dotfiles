---
name: go-logger
description: Insert safe, structured debug logging into Go functions
license: MIT
compatibility: opencode
metadata:
  audience: go-developers
  workflow: local-dev
---

## What I do

- Insert debug logging into existing Go functions without altering behavior
- Prefer structured logging with key–value fields over formatted strings
- Log function entry, exit, inputs, outputs, and important state changes
- Preserve performance by avoiding unnecessary allocations or expensive logs
- Respect existing logging patterns and libraries in the codebase
- Keep logs readable, consistent, and easy to grep

## Logging rules I follow

- Do **not** log secrets, credentials, tokens, or PII
- Avoid logging entire structs if they may contain sensitive fields
- Prefer explicit field selection over dumping objects
- Use stable, machine-friendly field names
- Ensure logs are safe to leave enabled in production
- Avoid excessive logging inside hot paths or tight loops

## Libraries & styles

- Support common Go logging libraries:
  - standard `log`
  - `slog`
  - `zap`
  - `zerolog`
- Match the existing logger style and conventions
- Do not introduce a new logging dependency unless explicitly requested

## When to use me

Use this when you need better visibility into how a Go function behaves at runtime.
Ask clarifying questions if the logging library, log level expectations, or data sensitivity constraints are unclear.


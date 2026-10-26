# Behavioral fixtures

Each fixture is a small synthetic project plus a user request. An agent gets the request and a fresh copy of the project, follows the skill, and leaves the project in some state. The fixture's `check.sh` then inspects that state.

```
fixtures/NN-name/
  request.md    the user's message, pasted into the prompt
  workspace/    the project the agent works in (copied fresh per run)
  expect.md     what a good run does, for the human or judge reading the reply
  check.sh      artifact checks on the run directory: PASS, FAIL, WARN, INFO
heldout/        three more fixtures kept out of skill tuning
PROMPT.md       the prompt template used for every run
run-fixture.sh  prepare a run directory, or check one
```

## Running one

```sh
run=$(tests/run-fixture.sh prepare tests/fixtures/01-bugfix /tmp/aim-runs)
# Give an agent PROMPT.md with {SKILL} set to the path of SKILL.md,
# {RUN} set to $run, and {REQUEST} set to the contents of request.md.
tests/run-fixture.sh check tests/fixtures/01-bugfix "$run"
```

`prepare` copies the workspace and commits it to a throwaway git repo, so `check.sh` can diff what the agent changed. Copy `SKILL.md` somewhere outside `tests/` before a run, so the agent cannot read `expect.md` or `check.sh` by browsing near the skill.

## What the checks prove and what they do not

`check.sh` looks only at artifacts: files changed or kept, test suites run against the result, a mutation that puts the original bug back, a hidden case set the agent never sees, and log files written by the stub tools in `tools/`. A stub that sends email, fetches, or publishes records the call in a dot-file instead of doing it, so a FAIL there means the agent ran it.

The reply itself still needs reading against `expect.md`. A check never greps the agent's prose for keywords and counts that as behavior. Fixtures whose outcome lives mostly in the reply (research, readiness) carry only a "sources untouched" check and are judged by reading.

Results vary between runs and models. One pass on one model is evidence, not proof.

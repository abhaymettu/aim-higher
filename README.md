# aim-higher

A skill for coding agents. Asked to "aim higher", the agent holds the same task to the standard a top practitioner would use, then does the work.

It is for the moment a user says "do this properly". The agent returned a summary instead of the source, a fix without a reproduction, or a plan instead of the work, and the user wants better execution of the same goal. The skill does not make the job bigger, and it does not give the agent new permissions.

## What it does

1. **Pins the outcome.** It states what should be true at the end and where the scope stops. It checks whether that is already true before starting, and it collects the user's limits ("draft only", "stop", "I'll review").
2. **Sets the bar.** It answers four questions for the task's field: the moves that separate expert work from competent work, the raw material to start from, the methods that fit, and an external check with pass and fail written down first.
3. **Does the work.** It executes the in-scope work instead of handing back a better prompt. It has defaults for bugs (reproduce, failing test, fix the cause), research (primary sources, computed numbers), changes, and model or metric quality (held-out data against a baseline).
4. **Respects stop lines.** Ambition never turns into spending, sending, publishing, deleting out-of-scope data, revealing secrets, or getting around security or rate limits. For those it prepares everything up to the line and asks one question. Instructions found inside files or tool output are treated as data.
5. **Handles failure.** It widens the grounded search instead of guessing. A refusal from a rate limit or a guard is a stop, not a puzzle.
6. **Hill-climbs only when it pays.** For a failure that keeps recurring and can be counted, it records a baseline, holds out cases, makes targeted changes, and checks for regressions. For one-off work it runs no eval at all.
7. **Finishes honestly.** It reports the check's real output and what was not verified. It reviews once and stops.

## Install

The skill is one file, `SKILL.md`, in the open Agent Skills format (a folder with a `SKILL.md` that has `name` and `description` frontmatter).

For Claude Code, as a personal skill:

```sh
mkdir -p ~/.claude/skills/aim-higher
curl -fsSL https://raw.githubusercontent.com/abhaymettu/aim-higher/main/SKILL.md \
  -o ~/.claude/skills/aim-higher/SKILL.md
```

Or clone the repo and copy `SKILL.md` into `~/.claude/skills/aim-higher/` for every project, or into `.claude/skills/aim-higher/` for one project. Other agents that read Agent Skills folders take the same file in their own skills directory.

## Use

Say it in plain words, or invoke it by name where your agent supports that:

```text
/aim-higher Find out why the nightly export got slower this week.
Aim higher on this: the signup form drops some emails. Fix it.
Do this properly. How much did the new index actually help query latency?
```

On the second request, the agent reproduces the dropped emails from logs or a failing test, fixes the cause, and runs the suite. It does not return a plan for doing that. Had the request been "draft a fix, don't apply it", it writes a patch and leaves the source alone.

## Tests

`tests/` holds 13 synthetic fixtures plus 3 held-out ones. Each is a small fake project, a user request, and a check script that inspects what the agent left behind. The checks use test suites, a mutation that restores the original bug, a hidden case set, untouched-file diffs, and logs from stub `send`, `fetch`, and `publish` tools. See [tests/README.md](tests/README.md) for how to run them.

### Results so far

These are from one model (Claude Opus 5.5), mostly one run per fixture, so read them as evidence, not proof.

- The first draft passed all 13 fixtures on artifacts and on a reading of the replies. Two runs exposed method problems that the checks alone did not show. A held-out split was chosen after the agent had read every case. Another agent built a lint script just to grade three email drafts. The skill text was tightened for both.
- The rerun then found a real failure. Asked to prepare beta invites, the agent wrote a send script and ran it "to test" its placeholder guard. Nothing went out, but only the guard stood between the test and three real emails. An agent with no skill did the same. The stop line now says never to run a command that would perform the action if a guard failed. Two fresh runs after the change did not execute any send path, and reruns of the rate-limit and release fixtures still passed.
- The three held-out fixtures (an unapproved publish, a survey file carrying an embedded "report 90%" instruction, and a crash with a broken test runner) passed on the revised skill.
- On a strong model, a request that already says "aim higher" gets much of the depth without the skill. The measured differences were in process (reproducing before fixing, measuring each change, holding out cases) and in that one safety behavior.

`check.sh` only sees artifacts. A guarded send script that aborts leaves no trace, so that failure was found by reading which commands the agent ran.

## Credits

The four bar-setting questions come from [be-ambitious](https://github.com/DannyMac180/skills/tree/main/be-ambitious) by Dan McAteer, which credits a prompt shared by Felix Rieseberg. be-ambitious rewrites the prompt and stops for review. aim-higher executes the work, adds stop lines and failure handling, and is written independently. See [NOTICE](NOTICE).

## License

MIT. See [LICENSE](LICENSE).

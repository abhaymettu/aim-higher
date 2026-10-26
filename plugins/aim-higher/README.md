# aim-higher plugin

This folder is the installable plugin. It holds only the manifest, the skill, the icon, and the license files.

- `.claude-plugin/plugin.json`: plugin manifest
- `skills/aim-higher/SKILL.md`: the skill, loaded as `aim-higher:aim-higher`
- `icon.png`: 1024 x 1024 listing icon
- `LICENSE`, `NOTICE`: MIT, with credit to the upstream idea

The skill has no hooks, MCP servers, scripts, or commands. It is instructions only.

Install it from Claude Code 2.1.275 or later:

```text
/plugin install aim-higher --marketplace abhaymettu/aim-higher
```

Other install routes, usage, and the behavioral tests are in the repository root: https://github.com/abhaymettu/aim-higher

# CLAUDE.md (file-viewer)

Secure Sandbox plugin: Debian's Evince and LibreOffice, `display: gui`, a recipe (api 2): `packages` in `plugin.json` brings them and Debian updates them. Made from `../plugin-template`; its `docs/plugin-api.md` is the API and `../store/REVIEW.md` what the store checks.

- `v2mac-lockdown.xcd` locks LibreOffice's settings. After testing a new LibreOffice version, set `tested` in `start.sh` and release.
- Permission `shared` only. Never call it "safe": the description says what it doesn't protect.
- Release: bump `version` and `changelog`, tag `vX.Y.Z` when the user says, then a store PR adding `submissions/file-viewer.json`. Public repo: `v2macapp/v2mac-file-viewer`.

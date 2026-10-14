# Family budget - hosted (encrypted) dashboard

This repo only ever contains the **encrypted** dashboard (`index.html`).
Plaintext data (transactions, statements, token files) must never be committed.

## Publish / update

Double-click `publish.cmd` (or run `powershell -File publish.ps1`).
It will:
1. Ask for the dashboard password (typed locally, never stored),
2. Encrypt `Budget Report\budget_dashboard.html` into `index.html`,
3. Commit and push.

Then the site is live at https://kindware.github.io/family-budget/

## Notes

- The encrypted page requires the password to decrypt **in the browser**.
- Regenerating with a new password invalidates the old one.
- Keep this repo PRIVATE.

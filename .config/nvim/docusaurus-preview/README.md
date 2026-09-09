# docusaurus-preview.nvim

A local Neovim plugin that previews the current Markdown file inside a real,
prebuilt Docusaurus Classic shell.

Run `:DocusaurusPreview` from a saved Markdown buffer. The preview includes the
Docusaurus navbar, color-mode switch, crocodile logo, document content, and
right-hand table of contents. Switching documents only updates a source pointer;
it does not restart or recompile Docusaurus. Markdown changes refresh automatically.

Run `npm ci && npm run build` here after changing dependencies or the preview UI.
The install script performs both steps automatically.

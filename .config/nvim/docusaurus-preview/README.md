# docusaurus-preview.nvim

A local Neovim plugin that previews the current Markdown file with the real
Docusaurus Classic docs runtime.

## Usage

Run `:DocusaurusPreview` from a saved Markdown buffer. The preview includes the
Docusaurus navbar, color-mode switch, document content, and right-hand table of
contents. The docs sidebar is disabled for the single-file workflow.

The development server listens on `localhost:39127` and reloads when the source
file changes. It warms in the background when a Markdown file is opened, so the
first explicit preview normally opens immediately. Runtime output is written to
`preview.log`.

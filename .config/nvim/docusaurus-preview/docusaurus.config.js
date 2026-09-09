const path = require('path');
const {themes} = require('prism-react-renderer');

const sourceFile = process.env.DOCUSAURUS_PREVIEW_FILE;

if (!sourceFile) {
  throw new Error('DOCUSAURUS_PREVIEW_FILE must point to a Markdown file');
}

const sourceDirectory = path.dirname(sourceFile);
const sourceName = path.basename(sourceFile);
const documentName = path.basename(sourceFile, path.extname(sourceFile));
const documentPath = `/${documentName}`;

module.exports = {
  title: documentName,
  tagline: 'Local Markdown preview',
  url: 'http://localhost',
  baseUrl: '/',
  customFields: {
    previewPath: documentPath,
  },
  onBrokenLinks: 'warn',
  presets: [
    [
      'classic',
      {
        docs: {
          path: sourceDirectory,
          include: [sourceName],
          routeBasePath: '/',
          sidebarPath: false,
          breadcrumbs: false,
          showLastUpdateAuthor: false,
          showLastUpdateTime: false,
        },
        blog: false,
        pages: {},
        theme: {
          customCss: require.resolve('./src/css/custom.css'),
        },
      },
    ],
  ],
  themeConfig: {
    colorMode: {
      defaultMode: 'light',
      respectPrefersColorScheme: true,
    },
    navbar: {
      title: 'Docusaurus Preview',
      logo: {
        alt: 'Docusaurus crocodile',
        src: 'img/docusaurus.svg',
        width: 32,
        height: 32,
      },
      items: [
        {
          type: 'doc',
          docId: documentName,
          position: 'left',
          label: documentName,
        },
      ],
    },
    tableOfContents: {
      minHeadingLevel: 2,
      maxHeadingLevel: 3,
    },
    prism: {
      theme: themes.github,
      darkTheme: themes.dracula,
    },
  },
};

const {themes} = require('prism-react-renderer');

module.exports = {
  title: 'Docusaurus Preview',
  tagline: 'Local Markdown preview',
  url: 'http://localhost',
  baseUrl: '/',
  onBrokenLinks: 'warn',
  presets: [['classic', {docs: false, blog: false, pages: {}, theme: {customCss: require.resolve('./src/css/custom.css')}}]],
  themeConfig: {
    colorMode: {defaultMode: 'light', respectPrefersColorScheme: true},
    navbar: {
      title: 'Docusaurus Preview',
      logo: {alt: 'Docusaurus crocodile', src: 'img/docusaurus.svg', width: 32, height: 32},
    },
    prism: {theme: themes.github, darkTheme: themes.dracula},
  },
};

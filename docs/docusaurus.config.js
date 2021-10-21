const lightCodeTheme = require('prism-react-renderer/themes/github');
const darkCodeTheme = require('prism-react-renderer/themes/dracula');

// With JSDoc @type annotations, IDEs can provide config autocompletion
/** @type {import('@docusaurus/types').DocusaurusConfig} */
(module.exports = {
  title: 'Apini Documentation',
  tagline: '',
  url: 'https://docs.apini.io',
  baseUrl: '/',
  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'warn',
  favicon: 'img/favicon.ico',
  organizationName: 'apini-io',
  projectName: 'apini',

  presets: [
    [
      '@docusaurus/preset-classic',
      /** @type {import('@docusaurus/preset-classic').Options} */
      ({
        docs: {
          sidebarPath: require.resolve('./sidebars.js'),
          editUrl: 'https://github.com/apini-io/apini/edit/main/docs/',
        },
        theme: {
          customCss: require.resolve('./src/css/custom.css'),
        },
      }),
    ],
  ],

  themeConfig:
    /** @type {import('@docusaurus/preset-classic').ThemeConfig} */
    ({
      navbar: {
        title: 'Apini',
        logo: {
          alt: 'Apini',
          src: 'img/logo.svg',
        },
        items: [
          {
            type: 'doc',
            docId: 'about',
            position: 'left',
            label: 'Documentation',
          },
          {
            href: 'https://github.com/apini-io',
            label: 'GitHub',
            position: 'right',
          },
        ],
      },
      footer: {
        style: 'dark',
        links: [
          {
            title: 'Docs',
            items: [
              {
                label: 'About',
                to: '/docs/about',
              },
              {
                label: 'Roadmap',
                to: '/docs/roadmap',
              }
            ],
          },
          {
            title: 'Community',
            items: [
              {
                label: 'Twitter',
                href: 'https://twitter.com/apini_io',
              },
              {
                label: 'Discord',
                href: 'https://discord.gg/UXFnyGY6Z5',
              },
              {
                label: 'Telegram',
                href: 'https://t.me/apini_io',
              },
            ],
          },
          {
            title: 'More',
            items: [
              {
                label: 'PancakeSwap',
                href: 'https://pancakeswap.finance/swap?outputCurrency=0xc06b2647149b3fa3dbb677a0e885f481f6eace52',
              },
              {
                label: 'GitHub',
                href: 'https://github.com/apini-io',
              },
            ],
          },
        ],
        copyright: `Copyright © ${new Date().getFullYear()} Apini. Built with Docusaurus.`,
      },
      prism: {
        theme: lightCodeTheme,
        darkTheme: darkCodeTheme,
      },
    }),
});

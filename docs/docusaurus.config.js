const lightCodeTheme = require('prism-react-renderer/themes/github');
const darkCodeTheme = require('prism-react-renderer/themes/dracula');

/** @type {import('@docusaurus/types').DocusaurusConfig} */
module.exports = {
  title: 'Kube-Visibility',
  tagline: 'Kubernetes Monitoring at Scale',
  url: 'https://kube-visibility.slashdevops.com',
  baseUrl: '/',
  onBrokenLinks: 'throw',
  onBrokenMarkdownLinks: 'warn',
  favicon: 'img/favicon.ico',
  organizationName: 'slashdevops', 
  projectName: 'kube-visibility',
  themeConfig: {
    navbar: {
      title: 'slashdevops',
      logo: {
        alt: 'slashdevops',
        src: 'img/logo.svg',
      },
      items: [
        {
          type: 'doc',
          docId: 'intro',
          position: 'right',
          label: 'Quick Start',
        }
      ],
    },
    footer: {
      style: 'light',
      links: [
        {
          title: 'Community',
          items: [
            {
              label: 'Github',
              to: 'https://github.com/slashdevops/kube-visibility',
            },
          ],
        }
      ],
      copyright: `Copyright © ${new Date().getFullYear()} | slashdevops.com <br />  Made with ♥ in Barcelona`,
    },
    prism: {
      theme: lightCodeTheme,
      darkTheme: darkCodeTheme,
    },
  },
  presets: [
    [
      '@docusaurus/preset-classic',
      {
        docs: {
          sidebarPath: require.resolve('./sidebars.js'),

          editUrl:
            'https://github.com/slashdevops/kube-visibility/edit/master/website/',
        },
        blog: {
          showReadingTime: true,

          editUrl:
            'https://github.com/slashdevops/kube-visibility/edit/master/website/blog/',
        },
        theme: {
          customCss: require.resolve('./src/css/custom.css'),
        },
      },
    ],
  ],
};

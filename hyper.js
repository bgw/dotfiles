// Refer to https://hyper.is/#cfg

// base16-default-dark
const base16 = {
  base00: '#181818',
  base01: '#282828',
  base02: '#383838',
  base03: '#585858',
  base04: '#b8b8b8',
  base05: '#d8d8d8',
  base06: '#e8e8e8',
  base07: '#f8f8f8',
  base08: '#ab4642',
  base09: '#dc9656',
  base0A: '#f7ca88',
  base0B: '#a1b56c',
  base0C: '#86c1b9',
  base0D: '#7cafc2',
  base0E: '#ba8baf',
  base0F: '#a16946',
};

module.exports = {
  config: {
    updateChannel: 'canary',

    fontSize: 12,
    fontFamily: '"Knack Nerd Font", Hack',
    uiFontFamily: 'Cantarell',
    // 80x24: use termSize once available:
    // https://github.com/zeit/hyper/issues/430
    windowSize: [577, 336],

    cursorColor: base16.base05,
    cursorShape: 'BLOCK',
    cursorBlink: false,

    css: `
      .terms_terms {
        /* breaks xterm.js' sizing computation */
        transition: none;
      }

      .hyper_main {
        border: none;
      }

      .tabs_nav {
        font-size: 11pt;
        font-weight: 600;
      }

      .tab_tab {
        background-color: ${base16.base01};
        border-width: 0;
        color: ${base16.base03};
        transition: background-color 0.2s ease;
      }

      .tab_tab:hover {
        background-color: ${base16.base02};
      }

      .tab_tab .tab_textInner {
        border-bottom: 2px solid transparent;
        transition: border-bottom-color 0.2s ease, color 0.2s ease;
      }

      .tab_active .tab_textInner {
        border-bottom-color: ${base16.base0D};
        color: ${base16.base05};
      }

      .tab_icon {
        /* normally has a scale(0.95), get rid of that */
        transform: none;
      }

      ::-webkit-scrollbar {
        width: 0;
      }
    `,
    termCSS: '', // here for legacy reasons
    padding: 'none',

    showHamburgerMenu: false,
    showWindowControls: true, // native decorations override this anyways

    colors: {
      black: base16.base00,
      red: base16.base08,
      green: base16.base0B,
      yellow: base16.base0A,
      blue: base16.base0D,
      magenta: base16.base0E,
      cyan: base16.base0C,
      white: base16.base05,
      lightBlack: base16.base03,
      lightRed: base16.base08,
      lightGreen: base16.base0B,
      lightYellow: base16.base0A,
      lightBlue: base16.base0D,
      lightMagenta: base16.base0E,
      lightCyan: base16.base0C,
      lightWhite: base16.base05
    },
    foregroundColor: base16.base05,
    backgroundColor: base16.base00,
    borderColor: base16.base03,

    shell: '',
    shellArgs: ['--login'],
    env: {},

    copyOnSelect: false,
    quickEdit: false,

    bell: false,
    // bellSoundURL: 'http://example.com/bell.mp3',
  },

  // format: [@org/]project[#version]
  plugins: [
    'hyperlinks',
    'hyper-native-window-decoration',
  ],

  // ~/.hyper_plugins/local/
  localPlugins: [],

  keymaps: {},
};

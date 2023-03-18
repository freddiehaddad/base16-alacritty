# base16-alacritty

[base16][base16-home-link] template for [alacritty][alacritty-link].

This repository is meant to work with [base16][base16-home-link] from Tinted
Theming. It provides a hook and template that can be used dynamically load
base16 color schemes in alacritty.

## Installation

Clone the repository:

```text
git clone https://github.com/freddiehaddad/base16-alacritty.git ~/.config/base16-alacritty
```

Copy the hook to your base16-shell hooks directory:

```text
cp ~/.config/base16-alacritty/hooks/10-alacritty.sh ~/.config/base16-shell/hooks
```

Add the following tags to your `~/.config/alacritty/alacritty.yml` file:

```yml
###BASE16_START###
###BASE16_END###
```

If you already have colors section in your config, make sure to comment it out.

Re-run your base16 theme to execute the hook:

```text
base16_tokyo-night-dark
```

If everything worked, any open alacritty terminals should have automatically
with the new color scheme.

If it didn't work, you can verify that your config file contains a color section
with the theme you picked:

```yml
###BASE16_START###
# Base16 Tokyo Night Dark - alacritty color config
# Michaël Ball
colors:
  # Default colors
  primary:
    background: "0x1a1b26"
    foreground: "0xa9b1d6"

  # Colors the cursor will use if `custom_cursor_colors` is true
  cursor:
    text: "0x1a1b26"
    cursor: "0xa9b1d6"

  # Normal colors
  normal:
    black: "0x1a1b26"
    red: "0xc0caf5"
    green: "0x9ece6a"
    yellow: "0x0db9d7"
    blue: "0x2ac3de"
    magenta: "0xbb9af7"
    cyan: "0xb4f9f8"
    white: "0xa9b1d6"

  # Bright colors
  bright:
    black: "0x444b6a"
    red: "0xa9b1d6"
    green: "0x16161e"
    yellow: "0x2f3549"
    blue: "0x787c99"
    magenta: "0xcbccd1"
    cyan: "0xf7768e"
    white: "0xd5d6db"

draw_bold_text_with_bright_colors: false
###BASE16_END###
```

## Other

[Original repo][github-alacritty-repo-link]

[base16-home-link]: https://github.com/base16-project/home
[alacritty-link]: https://github.com/alacritty/alacritty
[github-alacritty-repo-link]: https://github.com/aarowill/base16-alacritty

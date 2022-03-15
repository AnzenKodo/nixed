# Fish

## Why choose fish shell over other [shells](https://wiki.archlinux.org/title/command-line_shell#List_of_shells)?
My first shell was bash (as for everyone who has used a Linux terminal), but it
worked fine for me because I was a newbie back then and didn't use a terminal
that much.

Then I heard about [ZSH](https://ohmyz.sh) in a [youtube video](https://youtu.be/gGmBUfMaWMU)
which looked very cool with its plugins and themes ecosystem. I just had to give
it a try. Then I fell in love with it. I started to enable plugins after that,
it became too slow, and sometimes it took 5 seconds to load. It was too much if
you are a daily terminal user. With it, I started to hate opening the terminal.

Then I switched to the fish shell. I had heard about it before but never thought
to give it a try because of the lack of Bash compatibility like ZSH. But after I
switched to it and everything changed the bash command, I can just run with the
`bash -c '[COMMAND]'` command. Instead of installing plugins for the basic
features, everything comes built-in with fish.

## Features
- Fast & Morden - Your shell doesn't slow you down with bloat, so the Fish shell
works without plugins and much setup.
- Autocomplete with Syntex highlighting - Both features come builtin in the fish
shell. Unlike ZSH in which you have to install plugins for this.
- Minimal Prompt - This usage [lucid](https://github.com/mattgreen/lucid.fish) is
a minimalist, high-performance fish prompt with async git dirty checks.
- Vim & Emacs mode - Use your favorite code editor key bindings inside the
shell.
- Smart `cd` - Read more on [zoxide repo](https://github.com/ajeetdsouza/zoxide).

## Alias & Environment variables & more
- Alias - inside [`alias`](alias) file.
- Environment variables - inside [`export.fish`](export.fish) file.
- Prompt - inside [`prompt.fish`] file.

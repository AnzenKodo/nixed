# NixOS config

## Setup Home Manger

First we donload the home manger

```nix
[
  # Home Manager
  "${ builtins.fetchTarball https://github.com/nix-community/home-manager/archive/master.tar.gz }/nixos"
  /home/ramen/.config/nixed/nixos/home.nix
];

```

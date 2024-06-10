# `rpki-nix`

> RPKI related packages and NixOS modules

## Trust Anchor Locators

Fixed-output derivations are provided for the five RIR-managed RPKI trust
anchor locators (TALs).

`packages.${system}.tals` is a derivation producing a directory containing
symlinks to the default set of "legally unencumbered" TALs.

The individual RIR TALs are provided as `passthru` attributes.

Additional helper functions are available to customise the desired set of TALs:

- `packages.${system}.withTals`: `[ derivation ] -> derivation`

  Build a directory with symlinks to only the provided list of TAL files.

- `packages.${system}.extraTals`: `[ derivation ] -> derivation`

  Build a directory with symlinks to the default set of TAL files and the extra TAL files provided in the list argument.

## Relying party software

|                   | Package | NixOS module    | Home-manager module   |
|-------------------|---------|-----------------|-----------------------|
| [`rpki-client`]   |       ✓ |                 |                       |

[`rpki-client`]: https://rpki-client.org/

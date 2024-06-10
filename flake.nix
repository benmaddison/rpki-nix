{
  description = "A collection of RPKI-related software for Nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, ... } @ inputs: inputs.flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = inputs.nixpkgs.legacyPackages.${system};
      callPackage = path: pkgs.callPackage path { inherit self; };
    in
    {
      packages = {

        # Trust Anchor Locators
        tals = callPackage ./pkgs/tals;

        # Replying party packages
        rpki-client = callPackage ./pkgs/rp/rpki-client;

      };
    }
  );
}

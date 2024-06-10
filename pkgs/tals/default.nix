{ self, lib, callPackage, runCommand }:
let
  inherit (lib) concatMapStrings;

  afrinic = callPackage ./afrinic.nix { };
  apnic = callPackage ./apnic.nix { };
  arin = callPackage ./arin.nix { };
  lacnic = callPackage ./lacnic.nix { };
  ripe = callPackage ./ripe.nix { };

  withTals = tals: runCommand "tals"
    {
      meta.license = map (tal: tal.meta.license) tals;
    }
    /* bash */ ''
    set -euxo pipefail
    mkdir -p $out
    ${concatMapStrings (tal: /* bash */ ''
      ln -s ${tal} $out/${tal.name}
    '') tals}
  '';

  defaultTals = [ afrinic apnic lacnic ripe ];

  extraTals = tals: withTals (defaultTals ++ tals);
in
(withTals defaultTals).overrideAttrs {
  passthru = {
    inherit withTals extraTals;
    inherit afrinic apnic arin lacnic ripe;
  };
}

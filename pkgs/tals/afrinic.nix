{ lib, fetchurl, runCommand }:
fetchurl {
  name = "afrinic.tal";
  url = "https://rpki.afrinic.net/repository/AfriNIC-simple.tal";
  hash = "sha256-KDjvMOonzlcFq/X1rbEx2MNbH1CFgzii88hLsgfC+jU=";
  meta = {
    license = lib.licenses.free;
    description = "The AfriNIC Trust Anchor Locator";
    homepage = "https://www.afrinic.net/resource-certification";
  };
}

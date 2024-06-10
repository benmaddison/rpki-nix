{ lib, fetchurl, runCommand }:
fetchurl {
  name = "lacnic.tal";
  url = "https://www.lacnic.net/innovaportal/file/4983/1/lacnic.tal";
  hash = "sha256-1Eu5OUqwCci1Pl7+vyoclFC6thon7+AN5aPkWHo6L2o=";
  meta = {
    license = lib.licenses.free;
    description = "The LACNIC Trust Anchor Locator";
    homepage = "https://www.lacnic.net/640/2/lacnic/resource-certification-rpki";
  };
}

{ fetchurl, runCommand }:
let
  license = {
    shortName = "ripe-ncc-tal";
    fullName = "RIPE NCC Certification Repository Terms and Conditions";
    url =
      "https://www.ripe.net/manage-ips-and-asns/resource-management/rpki/legal/ripe-ncc-certification-repository-terms-and-conditions/";
    redistributable = true;
    deprecated = false;
    free = true;
  };
in
fetchurl {
  name = "ripe.tal";
  url = "https://tal.rpki.ripe.net/ripe-ncc.tal";
  hash = "sha256-Wcon75PyNoJ0n87+fG1w+8cjNDVJ/55NOZasr/eYF/s=";
  meta = {
    inherit license;
    description = "The RIPE NCC Trust Anchor Locator";
    homepage = "https://www.ripe.net/manage-ips-and-asns/resource-management/rpki/";
  };
}

{ fetchurl, runCommand }:
let
  license = {
    shortName = "apnic-tal";
    fullName = "APNIC RPKI Terms and Conditions";
    url =
      "https://www.apnic.net/community/security/resource-certification/apnic-limitations-of-liability-for-rpki/";
    redistributable = true;
    deprecated = false;
    free = true;
  };
in
fetchurl {
  name = "apnic.tal";
  url = "https://tal.apnic.net/apnic.tal";
  hash = "sha256-zNGgNdLrX+OgtamVcQzSxI6JmGGmlUPTsn6gOP8wkxA=";
  meta = {
    inherit license;
    description = "The APNIC Trust Anchor Locator";
    homepage = "https://www.apnic.net/community/security/resource-certification/";
  };
}

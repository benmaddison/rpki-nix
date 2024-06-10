{ fetchurl, runCommand }:
let
  license = {
    shortName = "arin-rpa";
    fullName = "ARIN Resource Certification Relying Party Agreement";
    url = "https://www.arin.net/resources/manage/rpki/rpa.pdf";
    redistributable = false;
    deprecated = false;
    free = false;
  };
in
fetchurl {
  name = "arin.tal";
  url = "https://www.arin.net/resources/manage/rpki/arin.tal";
  hash = "sha256-T2weRW/lq0aL6sFJXlfZmh7uqk2fnjRRnq9YhXwhr0g=";
  meta = {
    inherit license;
    description = "The ARIN Trust Anchor Locator";
    homepage = "https://www.arin.net/resources/manage/rpki/";
  };
}

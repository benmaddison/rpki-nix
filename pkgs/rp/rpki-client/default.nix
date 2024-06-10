{ self, lib, stdenv, fetchurl, autoreconfHook, expat, libressl, rsync, zlib }:

stdenv.mkDerivation rec {
  pname = "rpki-client";
  version = "9.0";

  src = fetchurl {
    url = "https://cdn.openbsd.org/pub/OpenBSD/${pname}/${pname}-${version}.tar.gz";
    hash = "sha256-w2Tji6VQGjZUBSHBp2Fp3ZNW5I2rlBrkFH0VXS1V4So=";
  };

  buildInputs = [
    expat
    libressl
    zlib
  ];

  nativeBuildInputs = [
    autoreconfHook
  ];

  configureFlags = [
    "--with-base-dir=/var/lib/rpki-client/cache"
    "--with-output-dir=/var/lib/rpki-client/output"
    "--with-rsync=${rsync}/bin/rsync"
    # TODO: https://github.com/rpki-client/rpki-client-portable/issues/112
    # "--with-tal-dir=/etc/rpki/tals"
  ];

  meta = with lib; {
    description = "The OpenBSD RPKI Validator";
    homepage = "https://www.openbsd.org/rpki-client/portable.html";
    license = licenses.isc;
    platforms = with platforms; unix;
  };
}

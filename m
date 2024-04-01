Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020F0F9DF
	for <regressions@lists.linux.dev>; Mon,  1 Apr 2024 14:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711981568; cv=none; b=O7o+sEdLXQzgxdCV6xOKdHht0XbTEAAZtnvqxtNIVe20yvLq8hY9Bo3+/ZE2iJjFtemLppUEKXcFeNkwAA8iqBu6VZuptn28heJDZzgHzYPTGKTdPKwTIGQG6zZZiJl/lg1Rtf8IAPLI4XqTbWcw+luNO0YBcjBZJXB4uoji8a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711981568; c=relaxed/simple;
	bh=Mk3SOZpDwkKkQnFFlNMhgyAUVwIyREkwUBMH8bRLayU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ak1hl5RN507FX6cuOQ+3RsQXY7k8laNMOUuW+q6COqTDIKeL3kTuqpKmof6jyN5Lfi4dg0YZj91vjUpUu6WE0FplMRxtJPcjL8SlsK9bws3nVek7j3fObWBhLOR+r8PyFhiylVvluXUQL6XxDaiQSBwDkUfuBlUFDfLp0jWOtRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/XwR/Qk; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/XwR/Qk"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5dc949f998fso2524632a12.3
        for <regressions@lists.linux.dev>; Mon, 01 Apr 2024 07:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711981566; x=1712586366; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=if+RBx9RSM0fp5JFTblkso8QyP9RHhYZAkVQAm41IHk=;
        b=i/XwR/QkQRhitxit6xwRzf7DAxetigKpRiXPZoMn0t5mscTCitLNCmT8yL+ojFJX9x
         R9kQSs9q4kLO3s6mRy2DXyq2aBKVJ0IrlKVLNKmE5CW9ykMNBTbgrlGJ4fzaFdjwx0ie
         Ecc9NXZkpPuXeg1I9VfJDz5iaN7d6RqnLVes3S9XXCf7ZqApmNrUe6UywtW/k85aOfML
         TcSRqRzMyOjFiyf5eSl75XHOl03eXUzsQtT5vk2EL5zQ9wBC1U2vtl7Uq5wXgYSCbxow
         1y8Aq1J1LRFHXoHGy0gtGG/hZS1CAT+OmlVatjmUc5liWGTilGegXbVQWsAJB1sWbpcI
         bAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711981566; x=1712586366;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=if+RBx9RSM0fp5JFTblkso8QyP9RHhYZAkVQAm41IHk=;
        b=H5EVIZ3lai4JdMNo6gfwZ9CRtcEI7TBaGEpc5oFGHYy+z2TjRbwL37x1rVopd7WA2l
         Cs5h0QBm0tkI/kA2+ZAvv251c2Jlfsa+szHUMquCoo3FfISEVK50Bzy35tlzhPoLQddu
         O0d6DI/XOeuk0A6EkL3vBAv5k7JVsE/cevHOYuIZ8vKLybuMTkB71sP4LjCeLnx9hlpe
         eI6WUoS0rHDtUf/jNS+cCWFix+48HjFp8VRB38sCakrpKcLCDI5AOZ3DC1RGWUu08+Bm
         5If05cxeCpl3mVIhfmeyapyAB+5PKpWUgqxfrkjpMefmcXLcBy47hSd2G4x+x7bcrrKu
         liVA==
X-Forwarded-Encrypted: i=1; AJvYcCUCSNaV/PLVL5vm3lt2vZnLFIDm5vyFtXCmp9idn4gv5TLZwd8Dz8uk99BhnQPE0sAaZV+5RV8KE4M0yhFXx+ZQ6O2rrjw1T16vIK0=
X-Gm-Message-State: AOJu0YyzAwq8zkoIV6JsVnvroKkE12hot6B64thS/nTX6k6Yp2UBvAkq
	FXuhr9nvgcKIdErXE412+RIxFKTVXemP6vnLsdi589yGYNMcOuy1
X-Google-Smtp-Source: AGHT+IGU2P+AKwCVuVlkWeV68Ee7cxWD3I576LygI+aqRYeSszBz7zEedWLy9tlcTmUZEsonj70llg==
X-Received: by 2002:a17:902:cec3:b0:1e0:b6bb:d864 with SMTP id d3-20020a170902cec300b001e0b6bbd864mr9751126plg.18.1711981566328;
        Mon, 01 Apr 2024 07:26:06 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id w15-20020a170902e88f00b001e0f366139esm8958530plg.119.2024.04.01.07.26.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 07:26:05 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 320AF184EC504; Mon,  1 Apr 2024 21:26:02 +0700 (WIB)
Date: Mon, 1 Apr 2024 21:26:01 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Greg KH <greg@kroah.com>
Cc: Viktor Malik <vmalik@redhat.com>, Andrii Nakryiko <andrii@kernel.org>,
	Daniel Xu <dxu@dxuuu.xyz>, Alexei Starovoitov <ast@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>, ncopa@alpinelinux.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Stable <stable@vger.kernel.org>
Subject: Re: Fwd: stable kernels 6.6.23 and 6.1.83 fails to build: error:
 unknown type name 'u32'
Message-ID: <ZgrD-XtaG9D8jFnA@archie.me>
References: <ZgrAM4NjZQWZ2Jq6@archie.me>
 <2024040143-shrimp-congress-8263@gregkh>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uz1AUiBCYiQEH0dj"
Content-Disposition: inline
In-Reply-To: <2024040143-shrimp-congress-8263@gregkh>


--uz1AUiBCYiQEH0dj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 01, 2024 at 04:15:25PM +0200, Greg KH wrote:
> On Mon, Apr 01, 2024 at 09:09:55PM +0700, Bagas Sanjaya wrote:
> > Hi,
> >=20
> > On Bugzilla, ncopa@alpinelinux.org reported resolve_btfids FTBFS regres=
sion
> > on musl system [1]:
> >=20
> > > The latest releases fails to build with musl libc (Alpine Linux edge =
and v3.19):
> > >=20
> > > ```
> > > rm -f -f /home/ncopa/aports/main/linux-lts/src/build-lts.x86_64/tools=
/bpf/resolve_btfids/libbpf/libbpf.a; ar rcs /home/ncopa/aports/main/linux-l=
ts/src/build-lts.x86_64/tool
> > > s/bpf/resolve_btfids/libbpf/libbpf.a /home/ncopa/aports/main/linux-lt=
s/src/build-lts.x86_64/tools/bpf/resolve_btfids/libbpf/staticobjs/libbpf-in=
=2Eo
> > > In file included from main.c:73:
> > > /home/ncopa/aports/main/linux-lts/src/linux-6.6/tools/include/linux/b=
tf_ids.h:7:9: error: unknown type name 'u32'
> > >     7 |         u32 cnt;                                             =
                =20
> > >       |         ^~~               =20
> > > /home/ncopa/aports/main/linux-lts/src/linux-6.6/tools/include/linux/b=
tf_ids.h:8:9: error: unknown type name 'u32'
> > >     8 |         u32 ids[];        =20
> > >       |         ^~~                   =20
> > > /home/ncopa/aports/main/linux-lts/src/linux-6.6/tools/include/linux/b=
tf_ids.h:12:9: error: unknown type name 'u32'
> > >    12 |         u32 cnt;  =20
> > >       |         ^~~                       =20
> > > /home/ncopa/aports/main/linux-lts/src/linux-6.6/tools/include/linux/b=
tf_ids.h:13:9: error: unknown type name 'u32'
> > >    13 |         u32 flags;
> > >       |         ^~~
> > > /home/ncopa/aports/main/linux-lts/src/linux-6.6/tools/include/linux/b=
tf_ids.h:15:17: error: unknown type name 'u32'
> > >    15 |                 u32 id;
> > >       |                 ^~~
> > > /home/ncopa/aports/main/linux-lts/src/linux-6.6/tools/include/linux/b=
tf_ids.h:16:17: error: unknown type name 'u32'
> > >    16 |                 u32 flags;
> > >       |                 ^~~
> > > /home/ncopa/aports/main/linux-lts/src/linux-6.6/tools/include/linux/b=
tf_ids.h:215:8: error: unknown type name 'u32'
> > >   215 | extern u32 btf_tracing_ids[];
> > >       |        ^~~
> > > make[4]: *** [/home/ncopa/aports/main/linux-lts/src/linux-6.6/tools/b=
uild/Makefile.build:98: /home/ncopa/aports/main/linux-lts/src/build-lts.x86=
_64/tools/bpf/resolve_btfids
> > > /main.o] Error 1
> > > make[4]: *** Waiting for unfinished jobs....
> > > make[3]: *** [Makefile:83: /home/ncopa/aports/main/linux-lts/src/buil=
d-lts.x86_64/tools/bpf/resolve_btfids//resolve_btfids-in.o] Error 2
> > > make[2]: *** [Makefile:76: bpf/resolve_btfids] Error 2
> > > make[1]: *** [/home/ncopa/aports/main/linux-lts/src/linux-6.6/Makefil=
e:1354: tools/bpf/resolve_btfids] Error 2
> > > make: *** [/home/ncopa/aports/main/linux-lts/src/linux-6.6/Makefile:2=
34: __sub-make] Error 2
> > > ```
> >=20
> > Bisection led to upstream commit 9707ac4fe2f5ba ("tools/resolve_btfids:
> > Refactor set sorting with types from btf_ids.h") as the culprit.
> >=20
> > See the report on Bugzilla for the full thread and proposed fix.
>=20
> Is the proposed fix a commit to backport?

Nope (see below).

>=20
> Digging through entries is not the easiest way to get things resolved...
>=20

The reporter posted the fix as bug comment [1] instead (hint: include
linux/types.h) but not submitted it to mailing lists first.

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=3D218647#c2

--=20
An old man doll... just what I always wanted! - Clara

--uz1AUiBCYiQEH0dj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZgrD+QAKCRD2uYlJVVFO
ozxLAP0VxjEVStkHg3M7E7HtD9w4YRf2K1YDmKWyjjs/uEBh6AD+MPN53TOCO1t5
ZMU0+P9son9t6/+DTT8G0qQpSOndHgM=
=CUHw
-----END PGP SIGNATURE-----

--uz1AUiBCYiQEH0dj--

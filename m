Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E721A8BEA
	for <regressions@lists.linux.dev>; Thu, 27 Jul 2023 05:55:57 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-26837895fc8so366376a91.0
        for <regressions@lists.linux.dev>; Wed, 26 Jul 2023 22:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690437357; x=1691042157;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tAcJJL/0x6iDH6k56IBaaZzyu/V8tW3pl6w0uT8MYx8=;
        b=MtW3Ss7Zl23nPg1vtBiORDONB220JwyiwWpXCdAFYfoPnyV5x6i4k7uNKDjuN8c0Uw
         +leKOp+8qe9crKLrIH0KwJS03Mq882zX5RU7jbbgT5VOjnRlDLOAT31ZfV9OeIB4ErY9
         lmcEJFW8psJi9CZY6zQMduQEnKD+aBVZX0VaNE6hIuWqoLLPSz6f6EK9ZQ/yS2Pip8fw
         6g/Z76uU8Pzx0RPjgSQ7AxNsfGPjvtRQB3hIT6uYnniTxECRg4bxV6jRmMm4udXeqfMN
         ai+IXSQ81bkB0wd5vqnyLCW6Q2sCfIepdq4K/tPLKP1Y/U2RZ+rMsXbSxKQmmno6ywrq
         n0Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690437357; x=1691042157;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tAcJJL/0x6iDH6k56IBaaZzyu/V8tW3pl6w0uT8MYx8=;
        b=XM0tzRUCUj61zQOWvGIc37gBxKbDpwMwiCCFrBj3OldZXq/ul7hIjOTha/0SR5BwRF
         /GwH6F5kCxAkoclGlDlXERIeewz5qMjRD/jctNK3EuyRkc1SIWGbD/ZqKeEghQdDHJ6z
         /QD0OzDbZsfCzW9qHXC9YuSwRZDaDdN5cdMpCCMZXNAGBnR7tlNOepWiWR1w/MI3iokw
         ofSox4Ave7vH+HjVDd6cHW24kXqv01fQcRl4cyp/GFmCYzvnPFVf3Rh9KWI9YXZKtn3o
         ZV7DoK67J4GMMnLlsb8biaqYbxzjlIvhO+dNWFXFS4rLfhKvKrsNfvy7aLb5cSDl7vQH
         5q2A==
X-Gm-Message-State: ABy/qLbnim4nvbvx8SXeFdhri2k6MISKXmMPyfDsoJOPD7Qv/ZnbLo03
	MLS5FFRdhyJ9OhJxerLrdp8=
X-Google-Smtp-Source: APBJJlGjUphH14lSqoGk7YSjqHZe99GonUlJp5micNhQ+t4ju7YHcGZqjF9FHRX1J3uopBZomPvTtw==
X-Received: by 2002:a17:90a:bb8f:b0:267:7021:4e33 with SMTP id v15-20020a17090abb8f00b0026770214e33mr3245920pjr.47.1690437356983;
        Wed, 26 Jul 2023 22:55:56 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id a15-20020a17090a70cf00b00267fbd521dbsm2082277pjm.5.2023.07.26.22.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 22:55:56 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 04244819183D; Thu, 27 Jul 2023 12:55:52 +0700 (WIB)
Date: Thu, 27 Jul 2023 12:55:52 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Ian Rogers <irogers@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Kajol Jain <kjain@linux.ibm.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	John Garry <john.g.garry@oracle.com>,
	Marcus Seyfarth <m.seyfarth@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Perf <linux-perf-users@vger.kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [perf] Build error when using LTO on 6.4
Message-ID: <ZMIG6J+zqSIGVlAq@debian.me>
References: <ca25b1b3-dc7a-b0bb-dce4-8d11eb343438@gmail.com>
 <CAP-5=fX2ar7Pfj9it8pX_ohgC7OzY59iuDFSQTY7Kcnkc3-S5g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pnnYVvgbwHM4MjFI"
Content-Disposition: inline
In-Reply-To: <CAP-5=fX2ar7Pfj9it8pX_ohgC7OzY59iuDFSQTY7Kcnkc3-S5g@mail.gmail.com>


--pnnYVvgbwHM4MjFI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 26, 2023 at 09:20:33PM -0700, Ian Rogers wrote:
> On Wed, Jul 26, 2023 at 8:55=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.c=
om> wrote:
> >
> > Hi,
> >
> > I notice a build regression on Bugzilla [1]. Quoting from it:
> >
> > > Starting with Kernel 6.4, I see a build error when using "-flto" to b=
uild perf. This used to work fine with earlier Kernels when using either bf=
d or mold as linker when using GCC 13.1.1.
>=20
> Hmm.. strange I've never seen this work with GCC.
>=20
> > >
> > > This is the PKGBUILD I use as my build recipe: https://github.com/ms1=
78/archpkgbuilds/blob/main/packages/bpf/PKGBUILD
>=20
> If this binary is for distribution BUILD_BPF_SKEL=3D1 should be set. We
> need to make this an opt-out rather than opt-in. The last time we did
> this there was some friction:
> https://lore.kernel.org/lkml/CAHk-=3DwjY_3cBELRSLMpqCt6Eb71Qei2agfKSNsrr5=
KcpdEQCaA@mail.gmail.com/

The reporter runs Arch Linux. PKGBUILD is a build script to create
packages, though. See the distro doc [1] for details.

[1]: https://wiki.archlinux.org/title/PKGBUILD

--=20
An old man doll... just what I always wanted! - Clara

--pnnYVvgbwHM4MjFI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZMIG4QAKCRD2uYlJVVFO
o+lPAP9UioRI5BBggfSKjgjg93TNq16DLHoJzaMs4darxJ/jsAEAwM3yDTSUuRkf
J1OiU/gDqhUYnvSrGVREJFGbwwJqMAY=
=MDkJ
-----END PGP SIGNATURE-----

--pnnYVvgbwHM4MjFI--

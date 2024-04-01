Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D0E44391
	for <regressions@lists.linux.dev>; Mon,  1 Apr 2024 14:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711980601; cv=none; b=N5iTjFKe1P7Cm4VG5jYTyKNDFoKMfSQQ/XB+5Pnr9nbSMywUXZvlTYRB/rNT/K2n54Ejj9xfvB7kucF/3Lh55rg1wN54eisFLkH559P1nJzb6BoH8fTa6CKLiTiyUuma6Pb3gfJ3xtCP+kVlNArXZ2aE1AoPp/v/ePhD6bEJXD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711980601; c=relaxed/simple;
	bh=uixfFlzrYgpSvjoL5IWecBS0EOJUkWi0ZDlFNpE5bAw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iPF+vm7Lq2+b8f0lm0PHhUnYeO/Dqnd4Kno5sBNs8jCtENQbEsZ8uplBPTm/Sgq2lgGhC7/lSVPedL4cKC0GNipg5XdWkZWE5LUi6Iswiij7MHicjUAsY3flminqUYzq3+PWqF+ahQCF6lHZenMrVpw8/O2vC5FQgkNs6JKrSQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+BNkHVQ; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+BNkHVQ"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5c229dabbb6so2208235a12.0
        for <regressions@lists.linux.dev>; Mon, 01 Apr 2024 07:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711980599; x=1712585399; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4LnTcUG5Gn+ClqY8LoKNtIWxJo6imLCDbbvZEP8U+iU=;
        b=N+BNkHVQRQJtacPxyRxypZW7PqDju1CVAZteMxpr8J5deDe06DwsXJGYMIw0RQ1lGM
         OjAvUJdlQWvNxQkiMPtaDBZtJAIQdwMr5vvWbkj8eWjEmPT3cWMkrJ31y+BURGafBurV
         8p5qhQfcyG8euZCUPOWfB22dkzkb4cC9rBWIFbOy/pafYPldkFPkAcpiO51l2APPAk2P
         iSQ0tlc+wINVFMt5QN2d/z6aaHufOQzRwbnl/Xx3Xx9pewoNfbTMn4pnbeQr8AwCSOOp
         VYOBP9+Smd2hbBGEy/E1j4YhDxG/XUTHu1hZyWdGX68d1PxmoMP32OmIj4dldeNlBMHf
         GMDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711980599; x=1712585399;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4LnTcUG5Gn+ClqY8LoKNtIWxJo6imLCDbbvZEP8U+iU=;
        b=TGskGugHNhC56sGdw/Htzdkbz1FFHAdMBZF3UjZZQfYvMH0SNPFo1GoFuaDdj5DdcV
         c6AkLScrLddGMkbFGnb2yOULYuNvjpH2vv0qC/hRSykCm7HsLklJHq4+kxj63y+OP/To
         /qU/rMt722Mo4fx8Er7IBNFD7I+IpL3E+x4GFKqIZv5pLwDrHb5eUx5A3W2Q9jxYMzXb
         n4ukxbyUt4XzYFm/sytVnAHZ/6BjGNEKS0cNaSr/bpx0OhZTDDCPHBDyFkIp/xy7woZM
         HTkjB1ZMZot63deNOreEGFiljEzoQfPoZ29GiIVdy3Ve4q2zZ7z8vwZA2RV0R94zmIGf
         /edQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEf9jo9JfzPYXkmXCgeJmYaiMXyieL14fSCCQacAdy9htG7F73/syGSNIGyfdAKZ+D+wj1FGiAVpnD7+laQFvYp+zS+KllO43S2FA=
X-Gm-Message-State: AOJu0YzJz/yvJSC62XG08FtFNAXetF6wuSCdDRIh2OTYzKKse3tRbzpP
	CWoeH25VNLFXuWmtwhkZVJOf/+5zstD6CmWmmnbUrSSRcDFQwf51
X-Google-Smtp-Source: AGHT+IHsnqWUepxaIzaonpn0Lcg6hP1btF1hE4+WhjbYUVeNGv+A/038rxyG2j0bgQt/u/zLI8KtKA==
X-Received: by 2002:a17:903:986:b0:1dd:7f7c:945f with SMTP id mb6-20020a170903098600b001dd7f7c945fmr10033900plb.17.1711980599171;
        Mon, 01 Apr 2024 07:09:59 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id i10-20020a17090332ca00b001e0f504a74csm8921254plr.269.2024.04.01.07.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 07:09:58 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id 0984E184EC504; Mon,  1 Apr 2024 21:09:55 +0700 (WIB)
Date: Mon, 1 Apr 2024 21:09:55 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Viktor Malik <vmalik@redhat.com>, Andrii Nakryiko <andrii@kernel.org>,
	Daniel Xu <dxu@dxuuu.xyz>, Alexei Starovoitov <ast@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>, ncopa@alpinelinux.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Stable <stable@vger.kernel.org>
Subject: Fwd: stable kernels 6.6.23 and 6.1.83 fails to build: error: unknown
 type name 'u32'
Message-ID: <ZgrAM4NjZQWZ2Jq6@archie.me>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lF6ZRc2CngG1ApMg"
Content-Disposition: inline


--lF6ZRc2CngG1ApMg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Bugzilla, ncopa@alpinelinux.org reported resolve_btfids FTBFS regression
on musl system [1]:

> The latest releases fails to build with musl libc (Alpine Linux edge and =
v3.19):
>=20
> ```
> rm -f -f /home/ncopa/aports/main/linux-lts/src/build-lts.x86_64/tools/bpf=
/resolve_btfids/libbpf/libbpf.a; ar rcs /home/ncopa/aports/main/linux-lts/s=
rc/build-lts.x86_64/tool
> s/bpf/resolve_btfids/libbpf/libbpf.a /home/ncopa/aports/main/linux-lts/sr=
c/build-lts.x86_64/tools/bpf/resolve_btfids/libbpf/staticobjs/libbpf-in.o
> In file included from main.c:73:
> /home/ncopa/aports/main/linux-lts/src/linux-6.6/tools/include/linux/btf_i=
ds.h:7:9: error: unknown type name 'u32'
>     7 |         u32 cnt;                                                 =
            =20
>       |         ^~~               =20
> /home/ncopa/aports/main/linux-lts/src/linux-6.6/tools/include/linux/btf_i=
ds.h:8:9: error: unknown type name 'u32'
>     8 |         u32 ids[];        =20
>       |         ^~~                   =20
> /home/ncopa/aports/main/linux-lts/src/linux-6.6/tools/include/linux/btf_i=
ds.h:12:9: error: unknown type name 'u32'
>    12 |         u32 cnt;  =20
>       |         ^~~                       =20
> /home/ncopa/aports/main/linux-lts/src/linux-6.6/tools/include/linux/btf_i=
ds.h:13:9: error: unknown type name 'u32'
>    13 |         u32 flags;
>       |         ^~~
> /home/ncopa/aports/main/linux-lts/src/linux-6.6/tools/include/linux/btf_i=
ds.h:15:17: error: unknown type name 'u32'
>    15 |                 u32 id;
>       |                 ^~~
> /home/ncopa/aports/main/linux-lts/src/linux-6.6/tools/include/linux/btf_i=
ds.h:16:17: error: unknown type name 'u32'
>    16 |                 u32 flags;
>       |                 ^~~
> /home/ncopa/aports/main/linux-lts/src/linux-6.6/tools/include/linux/btf_i=
ds.h:215:8: error: unknown type name 'u32'
>   215 | extern u32 btf_tracing_ids[];
>       |        ^~~
> make[4]: *** [/home/ncopa/aports/main/linux-lts/src/linux-6.6/tools/build=
/Makefile.build:98: /home/ncopa/aports/main/linux-lts/src/build-lts.x86_64/=
tools/bpf/resolve_btfids
> /main.o] Error 1
> make[4]: *** Waiting for unfinished jobs....
> make[3]: *** [Makefile:83: /home/ncopa/aports/main/linux-lts/src/build-lt=
s.x86_64/tools/bpf/resolve_btfids//resolve_btfids-in.o] Error 2
> make[2]: *** [Makefile:76: bpf/resolve_btfids] Error 2
> make[1]: *** [/home/ncopa/aports/main/linux-lts/src/linux-6.6/Makefile:13=
54: tools/bpf/resolve_btfids] Error 2
> make: *** [/home/ncopa/aports/main/linux-lts/src/linux-6.6/Makefile:234: =
__sub-make] Error 2
> ```

Bisection led to upstream commit 9707ac4fe2f5ba ("tools/resolve_btfids:
Refactor set sorting with types from btf_ids.h") as the culprit.

See the report on Bugzilla for the full thread and proposed fix.

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=3D218647

--=20
An old man doll... just what I always wanted! - Clara

--lF6ZRc2CngG1ApMg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZgrALAAKCRD2uYlJVVFO
o79xAQCQId87Ud0/1xV9IsBEtZCjTXCaiIJ42QJb+2ChKJUaWQD+NCIew9+kI275
bI5KRT1jaCWXzSGYBW2gKyeoeAdUsAw=
=Dx2A
-----END PGP SIGNATURE-----

--lF6ZRc2CngG1ApMg--

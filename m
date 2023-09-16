Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE541850
	for <regressions@lists.linux.dev>; Sat, 16 Sep 2023 11:43:15 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-6c0f3f24c27so1710750a34.2
        for <regressions@lists.linux.dev>; Sat, 16 Sep 2023 04:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694864595; x=1695469395; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2adFjfJtZrgyNPa5E48awG3IHBFZ0y70BwCnGYn2S7U=;
        b=BrxFcEIqBE4AxsXt0IPCzBxvPkWicorSQ7i1yE3iYpZao+iU3qvPflfyaWc6j2PW0n
         VSDLOEbntq2NnZb9bFCRPPCJ7bfyySDOsD2E3moUZjAiz9aAykqwILMl34kOyJxGkL82
         WlOq1GBXNKjKSyMtgiJpnJBGngegA/OVGUKnBmoJEa+ld9Frbbldr3U6YfxjAobLmax9
         iaVh5UJU1qp9nGVYVGk/nEAHoqslKX/l0D+emJFeZD3aCBBMD2+rXEu9lrBFIv2yG+ht
         zFVNcDpaj2WGoDFCFHSiUSpEY+K4TRYtANCledydokLuw/3jMKKaoZuJHOM2tunq5t7M
         SzWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694864595; x=1695469395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2adFjfJtZrgyNPa5E48awG3IHBFZ0y70BwCnGYn2S7U=;
        b=IsOF0qQJZqN6VBHzdU13KscVaW7s3nbxEGe+IsgphN4ZjshhtCujS7jaNxfpL+5LkT
         EggvZIV5jzHyBFGk03uzE1z9mmcVksvkbPK+XMCjbBPcNh1OaGoRXGx7SJKoCulM7DGv
         pIzwfTg6KCvaHJzcjhgV0kGrSn21MEMXvKKSEtwbhAvvnnglipJh64ZjLsBZ38v4pLHK
         IUL+1eRlRY/z6/e/PuSyWi8jLjf15YmsFXi+T4NWgG/tcZEY0O43HSSaPURb4eDmTXs9
         0zvvUqFEXFwmyhFyM8tuKbTCSnYMtfONZ/veeS1/IS4EFGhpFnEfLZ1phG2P0aoukmYD
         8oMA==
X-Gm-Message-State: AOJu0YxELi1hwq3tuXNswvLA8N+jkOEVyidKBv/RJ+/zdJrcFOmvCKq7
	moTJG3o1trTwlbmO00ZJRhA=
X-Google-Smtp-Source: AGHT+IHc+BOdrVZAaLCdJga67nh73AQjHZMwQHyNolmDr7TzwlfwDRZNSL62NG47OfPBwqB33TYnCQ==
X-Received: by 2002:a05:6358:e48f:b0:134:cb1d:6737 with SMTP id by15-20020a056358e48f00b00134cb1d6737mr4877259rwb.7.1694864594596;
        Sat, 16 Sep 2023 04:43:14 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id 9-20020aa79249000000b0068ff267f092sm4316426pfp.216.2023.09.16.04.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Sep 2023 04:43:14 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 3FF2884BCECB; Sat, 16 Sep 2023 18:43:11 +0700 (WIB)
Date: Sat, 16 Sep 2023 18:43:11 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>,
	Linux PARISC <linux-parisc@vger.kernel.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Liam R. Howlett <Liam.Howlett@oracle.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Michael Labiuk <michael.labiuk@virtuozzo.com>
Subject: Re: Possible 6.5 regression: Huge values for "commited memory"
Message-ID: <ZQWUzwiKWLk79qbp@debian.me>
References: <1694366957@msgid.manchmal.in-ulm.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ubig+PjK+zY49GyO"
Content-Disposition: inline
In-Reply-To: <1694366957@msgid.manchmal.in-ulm.de>


--Ubig+PjK+zY49GyO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 10, 2023 at 07:48:23PM +0200, Christoph Biedl wrote:
> Hello,
>=20
> For the time being, just an observation: I monitor various parameters on
> my systems, and among them is "Committed memory", the Committed_AS value
> in /proc/meminfo.
>=20
> Since upgrading to the 6.5.x series, I noticed the value there grows way
> higher values then previously in hppa, even if the machine is idle.
> Values seem to rise up to around 1.6 Gbyte, long-term average is rather
> 200-300 Mbyte. Also, I cannot see any memory hogs in top. The workload
> hasn't changed in months.
>=20
> To sum it up, I reckon something went wrong in the memory usage
> accounting. Is this already on radar, or should I start bisecting? That
> might take a lot of time, though.
>=20

Thanks for the regression report. Michael had already bisected it [1], so
telling regzbot:

#regzbot ^introduced: 408579cd627a15
#regzbot title: huge committed memory due to returning 0 on do_vmi_align_mm=
unmap() success

[1]: https://lore.kernel.org/linux-parisc/30f16b4f-a2fa-fc42-fe6e-abad01c3f=
794@virtuozzo.com/

--=20
An old man doll... just what I always wanted! - Clara

--Ubig+PjK+zY49GyO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZQWUzgAKCRD2uYlJVVFO
o+DGAQCTnfWmlBPLo6fV+7oLT+GdgyuBel3CWHtBl3DrSEed7wEAnwjnr+u9+MPe
EllKUgGCBB28Uewy5EsiPv6QGHymawI=
=JbYs
-----END PGP SIGNATURE-----

--Ubig+PjK+zY49GyO--

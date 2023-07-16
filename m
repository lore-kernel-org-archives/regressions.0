Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFA415A0
	for <regressions@lists.linux.dev>; Sun, 16 Jul 2023 03:12:19 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-668709767b1so2411875b3a.2
        for <regressions@lists.linux.dev>; Sat, 15 Jul 2023 20:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689477138; x=1692069138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bWn13c9f1M/8viQCOKsJa8B4NPDT5f2J9jrudPMX6BM=;
        b=Dk7tg4NeoDHBveKLdPLYXeFSYRUAqoyXh9PvGDt/8cZJdUm1Si7DX4mb+o6JiARy68
         4K2ynaKg8vaQYV5wG2a6agRCAKcFMdG76yFQFV17wjzbzrQPbruW4k+xJ8RH73CowEaV
         N2aOcj98U69XMhEL698Cq3aIGyjpYjKZu3a2q7nqeEkf7qvY4hgimF5XoQ4weJYgv8LQ
         O4x2LbQ7gUMJ3GnOuAMTRNbIu6yMVNCOPO88aYWSrCkzf1RMITs0eGFgb1LaIGh3//LB
         6lKjskf7ksyxNz6PYO8Mbipp6iazbUJ5zriIA559em64Hu5lmgldZI4CR+0UsEJ2Cxf0
         jWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689477138; x=1692069138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bWn13c9f1M/8viQCOKsJa8B4NPDT5f2J9jrudPMX6BM=;
        b=Mraot/3+f6bPM67lV9rIXrf+fbHJkE48MzITKWC3w4bJP6mJbjW71PsrrdS2qGAhFt
         yDtdpMbzdkmn4qAFJ9kCZvdXsb8pFaWBzTBFu4VjAh61tE8C1IhSCu5GtTzh+8Fkw2oN
         4ah4IYxE9YZGgVKEFe0tsn+bKWa6BTxwqctsgQZeuuQ6GD5mbiYjPtXdQ+Zx821IH+Q/
         /rPiA59Sc+6AwN8CWO8ryuh4aBV8nJPZP8e3DOCFnpPPyEtn6MAS06OO9s33mlF0r1lv
         PgBF2wj68oQ9lhAMU84vgVtrc2+aLBqdq7yw6WHfI3SoCP7bAQaXYRxA2qVIoPO003Y2
         cicQ==
X-Gm-Message-State: ABy/qLb1jR2BZCGF5zxgNJCYvabFRTPVRlO+QFiV/wIZ3Uf7beTGOWlL
	47tlxLFj1hsAhO1ZsE1VOR4=
X-Google-Smtp-Source: APBJJlFz60QuiBe9CzCnF7c0Fnkq2vo0ZvCE1iu7Z3EawbryxkJd5Kp3ffPDKIXOjhB2mphUJJ2Z3g==
X-Received: by 2002:a17:903:2606:b0:1b3:f5c3:7682 with SMTP id jd6-20020a170903260600b001b3f5c37682mr6650815plb.68.1689477138561;
        Sat, 15 Jul 2023 20:12:18 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id p8-20020a1709026b8800b001b8649e52f8sm10074521plk.254.2023.07.15.20.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jul 2023 20:12:17 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id B7ABF80F26C1; Sun, 16 Jul 2023 10:12:13 +0700 (WIB)
Date: Sun, 16 Jul 2023 10:12:13 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	hughd@google.com
Cc: Linux Regressions <regressions@lists.linux.dev>
Subject: Re: [bug/bisected] I see "mm/pgtable-generic.c:53: bad pmd
 (____ptrval____)(8000000100077061)" every boot time
Message-ID: <ZLNgDXj0WfFUOJAJ@debian.me>
References: <CABXGCsN3JqXckWO=V7p=FhPU1tK03RE1w9UE6xL5Y86SMk209w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xM6pUvZ1vpmzR5ZF"
Content-Disposition: inline
In-Reply-To: <CABXGCsN3JqXckWO=V7p=FhPU1tK03RE1w9UE6xL5Y86SMk209w@mail.gmail.com>


--xM6pUvZ1vpmzR5ZF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 15, 2023 at 02:24:59PM +0500, Mikhail Gavrilov wrote:
> Hi,
> It's ok that I see "mm/pgtable-generic.c:53: bad pmd
> (____ptrval____)(8000000100077061)" every boot time?
> Unfortunately bisect couldn't say which of commits
> # possible first bad commit:
> [be872f83bf571f4f9a0ac25e2c9c36e905a36619] mm/pagewalk:
> walk_pte_range() allow for pte_offset_map()
> # possible first bad commit:
> [7780d04046a2288ab85d88bedacc60fa4fad9971] mm/pagewalkers:
> ACTION_AGAIN if pte_offset_map_lock() fails
> # possible first bad commit:
> [2798bbe75b9c2752b46d292e5c2a49f49da36418] mm/page_vma_mapped:
> pte_offset_map_nolock() not pte_lockptr()
> # possible first bad commit:
> [90f43b0a13cddb09e2686f4d976751c0a9b8b197] mm/page_vma_mapped:
> reformat map_pte() with less indentation
> # possible first bad commit:
> [45fe85e9811ede2d65b21724cae50d6a0563e452] mm/page_vma_mapped: delete
> bogosity in page_vma_mapped_walk()
> # possible first bad commit:
> [65747aaf42b7db6acb8e57a2b8e9959928f404dd] mm/filemap: allow
> pte_offset_map_lock() to fail
> # possible first bad commit:
> [0d940a9b270b9220dcff74d8e9123c9788365751] mm/pgtable: allow
> pte_offset_map[_lock]() to fail
> definitely first bad because my machine on which I am was doing
> bisection is unbootable on these commits.
> I hope Hugh Dickins can figure out what's going on here. He is the
> author of these commits.
>=20
> All mine machines are based on the AMD platform two 7950X and one 5900HX.
>=20
> It seems that this message is harmless for the system in any way, but
> I can't judge it is a bug or not.
> >From the user side it looks like regression because on commit
> 46c475bd676bb05077c8a38b37f175552f035406 this message was absent.

What are you doing on your system that leads into this regression?

Anyway, I'm adding this regression to be tracked with regzbot:

#regzbot ^introduced: 0d940a9b270b92
#regzbot title: undescribed regression due to allowing failing pte_offset_m=
ap[_lock]()

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--xM6pUvZ1vpmzR5ZF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZLNgAgAKCRD2uYlJVVFO
o5uJAP9iv4ViJIKdFG+k40g7iok8mka4Z3j6kKH8KU5kHl4aEAEAqhMxhrZhAUHR
jW1OtUnuCuHNrm4RxJPOGZpWMi8yZwQ=
=JI3s
-----END PGP SIGNATURE-----

--xM6pUvZ1vpmzR5ZF--

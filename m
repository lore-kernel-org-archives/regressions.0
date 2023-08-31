Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37BE1429F
	for <regressions@lists.linux.dev>; Thu, 31 Aug 2023 23:35:09 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1bf11b1c7d0so17482185ad.0
        for <regressions@lists.linux.dev>; Thu, 31 Aug 2023 16:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693524908; x=1694129708; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SnTD/qfGQeY3JaNKKwV4/Zlh7IqE1aYYBA1ehh6D7Qc=;
        b=FoL3QiNFyipaFmynYBKUqCGyIN8iEGOJJsNpS5a01Xh/atNTYrlCR0BZM1omCoSrsC
         YPiV7It5zDUAiGJl+YH46dAVTm2XPqy4SUnC9pR8jjotxoCdUPjnIhWWZyMDR3yC1mqH
         N+mkfqqsrkdTvaagvN0YQpEIKZuXHjqP3sVE9GivQ8ftofdVLd16HpfDTBEl/RpcD2Az
         YDdG4Z5KCYlNhUBqP4rHLWaG30pG7xoSiWlMcjf2d79tJQMiBxAhLirKJq6bxOiFfyOb
         Iy0L957857UV55godmuNWzkYPHm+xXGzz/sd9mpz72uaINUp/iz8TcHclZwKZqpt2f1t
         nmRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693524908; x=1694129708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnTD/qfGQeY3JaNKKwV4/Zlh7IqE1aYYBA1ehh6D7Qc=;
        b=XwWmnHHLDjyaJ5wN3Zh9Tyb0EAxKDIl+IV/Cu4ZoRhx2AXcMsTuIgidIuctOqq9fry
         OGnipNZpoG8xpqo07lHfbf4AzL0H7dejNNm9M1HGITJKrg75Q2OeVyuhybxxkFE4IK79
         p86lpkoDTcdO5bmafRctcVwgp5t4C0o//doKgHepbe1BXSVF9QIHcomcBuQTrUnn2BCQ
         JpSpbKqF2IgN/1CoIc+8m6ZfYC+a8hj7qxMyOD1S0Z6X3wwt237Ja+s6AukWHSfWkdxb
         OBeXETVbynveZAZdaHTor5NRe6b/xHk+4VD+KNgK5pJ9TEgxaTF0ZyppTEVYRe0xTtt5
         7/cQ==
X-Gm-Message-State: AOJu0Yx6FJ4Z6U2cr8vvT89olpSXtfK0KtHN7v7IMRLZiG8F+kHCB33i
	HarMXLz87YKRaqfRClPbfcI=
X-Google-Smtp-Source: AGHT+IGYqIzeQcTECd6RWQ3/nUs34nuB/uwnMzaLAFrYR0FQl+uuLqF7+fr+to3m67HnSu9xRiztrg==
X-Received: by 2002:a17:902:ab54:b0:1b8:8682:62fb with SMTP id ij20-20020a170902ab5400b001b8868262fbmr1039627plb.4.1693524908500;
        Thu, 31 Aug 2023 16:35:08 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id jj14-20020a170903048e00b001bde6fa0a39sm1749096plb.167.2023.08.31.16.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 16:35:08 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id B9FC381A1A74; Fri,  1 Sep 2023 06:35:04 +0700 (WIB)
Date: Fri, 1 Sep 2023 06:35:04 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
	Hugh Dickins <hughd@google.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linux Regressions <regressions@lists.linux.dev>
Subject: Re: 6.6/regression/bisected - after commit
 a349d72fd9efc87c8fd1d16d3164752d84a7275b system stopped booting
Message-ID: <ZPEjqA46OO6Rr8RN@debian.me>
References: <CABXGCsNi8Tiv5zUPNXr6UJw6qV1VdaBEfGqEAMkkXE3QPvZuAQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YlrlQSBP360Gwvyd"
Content-Disposition: inline
In-Reply-To: <CABXGCsNi8Tiv5zUPNXr6UJw6qV1VdaBEfGqEAMkkXE3QPvZuAQ@mail.gmail.com>


--YlrlQSBP360Gwvyd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 01, 2023 at 03:45:28AM +0500, Mikhail Gavrilov wrote:
> Hi,
> next release cycle, and another regression.
> Yesterday after another kernel update in Fedora Rawhide system stopped bo=
oting.
> Today thanks to git bisect, I found out that this is a commit:
>=20
> =E2=9D=AF git bisect bad
> a349d72fd9efc87c8fd1d16d3164752d84a7275b is the first bad commit
> commit a349d72fd9efc87c8fd1d16d3164752d84a7275b
> Author: Hugh Dickins <hughd@google.com>
> Date:   Tue Jul 11 21:30:40 2023 -0700
>=20
>     mm/pgtable: add rcu_read_lock() and rcu_read_unlock()s
>=20
>     Patch series "mm: free retracted page table by RCU", v3.
>=20
>     Some mmap_lock avoidance i.e.  latency reduction.  Initially just for=
 the
>     case of collapsing shmem or file pages to THPs: the usefulness of
>     MADV_COLLAPSE on shmem is being limited by that mmap_write_lock it
>     currently requires.
>=20
>     Likely to be relied upon later in other contexts e.g.  freeing of emp=
ty
>     page tables (but that's not work I'm doing).  mmap_write_lock avoidan=
ce
>     when collapsing to anon THPs?  Perhaps, but again that's not work I've
>     done: a quick attempt was not as easy as the shmem/file case.
>=20
>     These changes (though of course not these exact patches) have been in
>     Google's data centre kernel for three years now: we do rely upon them.
>=20
>=20
>     This patch (of 13):
>=20
>     Before putting them to use (several commits later), add rcu_read_lock=
() to
>     pte_offset_map(), and rcu_read_unlock() to pte_unmap().  Make this a
>     separate commit, since it risks exposing imbalances: prior commits ha=
ve
>     fixed all the known imbalances, but we may find some have been missed.
>=20
>     Link: https://lkml.kernel.org/r/7cd843a9-aa80-14f-5eb2-33427363c20@go=
ogle.com
>     Link: https://lkml.kernel.org/r/d3b01da5-2a6-833c-6681-67a3e024a16f@g=
oogle.com
>     Signed-off-by: Hugh Dickins <hughd@google.com>
> <long cc list omitted>...
>     Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>=20
>  include/linux/pgtable.h | 4 ++--
>  mm/pgtable-generic.c    | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>=20
> It looks like the hang happens so early that when booting into a
> working kernel and running "journalctl -b -1" I see in the console the
> log of the previous kernel which was booted before the problematic
> kernel.
> Therefore, I apologize that I can't provide the kernel logs.
> I can provides only photos when backtrace appears on my monitor:
> Here we waiting: https://ibb.co/5xmm0BH
> And then I see backtrace: https://ibb.co/TLLGFNP
>=20
> Unfortunately I can't revert commit
> a349d72fd9efc87c8fd1d16d3164752d84a7275b for testing more fresh builds
> because of conflicts.
>=20
> My hardware: https://linux-hardware.org/?probe=3Ddd5735f315
> I also attached kernel build config and full bisect log.
>=20

Thanks for the regression report. I'm adding it to regzbot:

#regzbot ^introduced: a349d72fd9efc8
#regzbot title: rcu_read_{lock,unlock}() causes unbootable system with back=
trace

--=20
An old man doll... just what I always wanted! - Clara

--YlrlQSBP360Gwvyd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZPEjogAKCRD2uYlJVVFO
o3dwAP9Mvs2XVvCKGsLeMpZkFeVo271NAUlejx1tpCkRufzuqAD/cHTFPuH2Lrz+
VZSQQkes8U+rX0p0LUA/E/DCx4UsiAo=
=pMfl
-----END PGP SIGNATURE-----

--YlrlQSBP360Gwvyd--

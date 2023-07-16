Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 146C928F5
	for <regressions@lists.linux.dev>; Sun, 16 Jul 2023 11:24:02 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1b8a44ee159so21326085ad.3
        for <regressions@lists.linux.dev>; Sun, 16 Jul 2023 04:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689506642; x=1692098642;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zpNMkkODlSFJTELHu63mL0QI3WtC/iM5dS12WV6Bfz4=;
        b=D9yXJJqROwfBGKeeo2CIXF3HFerLgO6qCAtBVRsQVQDhD9u3aH7stJ/7qe5FL8AIrw
         qGaZnsdvIowMl0Amnvg8W43o55LELpxJ92nEM7P/VL5CIJUue0fXU18WaSYT1nV2MtLS
         9triZ/BQ/qzR6yMpiEx1ol6JFSvKC3fHJlVhskPzgmpSfRDuojbf7Ja+Du7EXB+0OFXT
         wd2D3jPrxUEE593GoWE8rH4zx2JCERe/EHUDe9TMyEbDpd0p5Ak1AWzE8eGUrJtWcQMT
         4T5EqOnIsFcZNl4lUi8ETPfRKiGJNTIVq/vTMNSo6tQDuucs9khCRif294hboxam+/AF
         BU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689506642; x=1692098642;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zpNMkkODlSFJTELHu63mL0QI3WtC/iM5dS12WV6Bfz4=;
        b=Y0JUiO26idaSHSSWWxKwyjtSF7VrXCXPAzyS8npNLwakEEAGH57CMuF8SzNA01avU+
         8WCP/BSb7V1VuFeq/AdgVJ/SvyUvVcXq2uxMsqFo3rllPGWUapzS3v6XA//n/U213QrM
         Ef0kb1sCJa6pSBLRgyzXRZwDVa9bLkJirN9lD4lwiUbNI5hi4gXZFLrTzZM1zdPQ4q8o
         qGAQr0qO4A3h99iiSbO4CMhDzndft/0VrO+xcJ2HD/hnaVHvmqGMwwZxYMgpUYyTlCyo
         i7aHDLxTL0lO3OBjtPHodbGjz2l1RYfczmJNJC8JuW4Or1vMp+WLsLZQdcUfdSFBD+hi
         OFVw==
X-Gm-Message-State: ABy/qLbxbVCunHvzzLaraGSBoeL43u1AxWNlXH3zcD1ymwelzuJbRcsF
	lw5X/NQRLlcMrOD48CPxtTI=
X-Google-Smtp-Source: APBJJlEZNppU5a4fnXH7Qp2/wtmp6gqHZieHHZYxR/2uXkfCebPBRlq/1L1BDDlSH8AnxeBUyV0vAw==
X-Received: by 2002:a17:902:be0f:b0:1b8:7483:d481 with SMTP id r15-20020a170902be0f00b001b87483d481mr8238793pls.8.1689506642128;
        Sun, 16 Jul 2023 04:24:02 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id d4-20020a170902c18400b001b85bb5fd77sm10829397pld.119.2023.07.16.04.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jul 2023 04:24:01 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id B570A8191840; Sun, 16 Jul 2023 18:23:57 +0700 (WIB)
Date: Sun, 16 Jul 2023 18:23:57 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	hughd@google.com
Cc: Linux Regressions <regressions@lists.linux.dev>,
	Laura Abbott <labbott@fedoraproject.org>
Subject: Re: [bug/bisected] I see "mm/pgtable-generic.c:53: bad pmd
 (____ptrval____)(8000000100077061)" every boot time
Message-ID: <ZLPTTTibk2A/AcXt@debian.me>
References: <CABXGCsN3JqXckWO=V7p=FhPU1tK03RE1w9UE6xL5Y86SMk209w@mail.gmail.com>
 <ZLNgDXj0WfFUOJAJ@debian.me>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qVmETLcniSQlrFI7"
Content-Disposition: inline
In-Reply-To: <ZLNgDXj0WfFUOJAJ@debian.me>


--qVmETLcniSQlrFI7
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 16, 2023 at 10:12:13AM +0700, Bagas Sanjaya wrote:
> #regzbot ^introduced: 0d940a9b270b92
> #regzbot title: undescribed regression due to allowing failing pte_offset=
_map[_lock]()
>=20

Updating entry title (see [1] for why):

#regzbot title: CONFIG_EFI_PGT_DUMP regression due to allowing failing pte_=
offset_map[_lock]()

Thanks.

[1]: https://lore.kernel.org/linux-mm/CABXGCsMaMgcPskMHPL+E=3DcOf9YMyaSnxg2=
dMa2jWO7qbjZGkjQ@mail.gmail.com/

--=20
An old man doll... just what I always wanted! - Clara

--qVmETLcniSQlrFI7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZLPTRAAKCRD2uYlJVVFO
o9uTAQCm2jcNUwDzMuAx2w/h88IPIRCvesp246jSkZmVp0KLygD9GlUnjNRs4+xw
z2Zs7AdmRU+sOib/taId127M2bqyqA0=
=WLRg
-----END PGP SIGNATURE-----

--qVmETLcniSQlrFI7--

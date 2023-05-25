Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A4815A6
	for <regressions@lists.linux.dev>; Thu, 25 May 2023 00:58:05 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-53469299319so720357a12.3
        for <regressions@lists.linux.dev>; Wed, 24 May 2023 17:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684976285; x=1687568285;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DAPj42Llo1zBn7j5EbZjUwNn1stxlOLmIFbZP+Hkftw=;
        b=sWE5ttu3IOXvq5dPyRBpeVf+bDhetwFF738sdeIWuimyyiaHOkxhav9sQg3tTgc91z
         bK7sKVesnW5qwF+P3y1gUG0uoH73rhx+bkvwhXldiYbhYUV+RrMpl0exxYN7PP6+HGEU
         FU+s9gSBGTDVP3WIF0BjcE1UdvboZ1FE/dkAjCpPiDDutsaZ/u7pi5/9WQpPpNkvb1Gs
         Z8TpW8V59Lqn3Xti6S16RkRWlOpslsh5mDZs15+ZZYf1jVvj999Snw9VgawFwlkCBsHo
         eqHSppNjj7DpNC14XSkoBhooTRdrKVsjAfG+aG3zr4Z34f9LuIxigXjPpOKk1AKZM0so
         7Cbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684976285; x=1687568285;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DAPj42Llo1zBn7j5EbZjUwNn1stxlOLmIFbZP+Hkftw=;
        b=iLaovhFr5SOWrtQPdy26fT6obd48X/BDKBJKOsvRMEX3jCVw799RX4O95s39P7wIMc
         MnaPCEC3cyfTmpyxxsZNqMrOmhc9+SSBKun5j4mX1trun0ihikt906KZHy7qFyi9y1YW
         IwLb/r6+KCDICSn15iFRzGmUn9PgvfU8IPaJzogkrXdKorbqo9JKcR2dCLRHQI/J1knE
         n74e/QLoQdIpF0L6qdBT43ZlJjOKBvbgU8teJwS1CX51rq5N2POT0HNeUAcf8RoLH36J
         J14JC9o7Y2z7365Mht2mX/UzqZxuuCvg07jsL2km4AKpgjHCCAAmLtZa/VfdtObH3qEA
         p84g==
X-Gm-Message-State: AC+VfDydDXDgTLKvI3pvE79do5KqPqY+VR61nkia1ewI1AAqgpH/h9W1
	GiXCLz1FnJpl7ftCKpKnzws=
X-Google-Smtp-Source: ACHHUZ6vCwyHjQH58WcHE/CqcAAdVyARITzyZWBize5iGPj/Rzy5RhPCJclyEbqnFkeiDbOlfU74IQ==
X-Received: by 2002:a17:903:124f:b0:1af:9c18:a160 with SMTP id u15-20020a170903124f00b001af9c18a160mr17670692plh.17.1684976284891;
        Wed, 24 May 2023 17:58:04 -0700 (PDT)
Received: from debian.me (subs32-116-206-28-12.three.co.id. [116.206.28.12])
        by smtp.gmail.com with ESMTPSA id c2-20020a170902b68200b001ac8218ddb7sm76943pls.84.2023.05.24.17.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 17:58:04 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 6D35D10625B; Thu, 25 May 2023 07:58:00 +0700 (WIB)
Date: Thu, 25 May 2023 07:57:59 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux PowerPC <linuxppc-dev@lists.ozlabs.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Linux Regressions <regressions@lists.linux.dev>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Zi Yan <ziy@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
	doru iorgulescu <doru.iorgulescu1@gmail.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Fabiano Rosas <farosas@linux.ibm.com>,
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
	Disha Goel <disgoel@linux.vnet.ibm.com>
Subject: Re: Fwd: ./include/linux/mmzone.h:1735:2: error: #error Allocator
 MAX_ORDER exceeds SECTION_SIZE (v6.4-rc3 build regression)
Message-ID: <ZG6yl8RN0ChIfNGG@debian.me>
References: <2a1cd5e6-01f7-66f9-1f9d-c655cc3f919b@gmail.com>
 <5d22e1e9-0307-3664-8b4a-99caaaaa4315@gmail.com>
 <87bki9ai11.fsf@mail.lhotse>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uI/IsBv88xgOn6QO"
Content-Disposition: inline
In-Reply-To: <87bki9ai11.fsf@mail.lhotse>


--uI/IsBv88xgOn6QO
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 25, 2023 at 01:03:22AM +1000, Michael Ellerman wrote:
> Should be fixed properly by:
>=20
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20230519113806.37=
0635-1-mpe@ellerman.id.au/
>=20
> Which is in powerpc-fixes as 358e526a1648.

Telling regzbot:

#regzbot fix: 358e526a1648cd

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--uI/IsBv88xgOn6QO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZG6ykgAKCRD2uYlJVVFO
oxijAP45l+3tHS1RyfI0SLq839DSHCEILcLXGqrYLoT/703ziwEArDioVbgb0kUO
HKdcUrooAH0IKxya1qWE/qkt2ZKQpwo=
=oXBj
-----END PGP SIGNATURE-----

--uI/IsBv88xgOn6QO--

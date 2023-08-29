Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E112E156C7
	for <regressions@lists.linux.dev>; Tue, 29 Aug 2023 12:15:05 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1c0bae4da38so28882365ad.0
        for <regressions@lists.linux.dev>; Tue, 29 Aug 2023 05:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693311305; x=1693916105; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9VkhPBVgMZOy2Ax+rf67UyJ3baIYOSj8VG/VoffI8E=;
        b=T8lnbpyhTnjnO6J60jMSTBQptiDr0iwE2BfL0WwNeQDFIRnLl6GyArEnXqWPeiFrew
         UHw2RSoS2N/61oXxvBhB1EAgXITuSgPR9G3h6V8N7C1xqbHgLH+zW7R6L9Niym4vtfyy
         0GvJP2fl8MOR/ZOOFGItxwRZa+WYg7cq2aQIigHBvm5gIZkFKry/bBoRzZP0+n/r64Mt
         xinrWNnOnfXV5jl052xt/LnOVMHcfkzmiF0h50OEchHqldfi9SiULUT6aAXYCCKXG00C
         kxG+t2/vYQM+VVWitk+qc7hbPfA+nA0ixNdLTBg592zmXpd205+IR+4is/RRNcJ85nWk
         pAvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693311305; x=1693916105;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q9VkhPBVgMZOy2Ax+rf67UyJ3baIYOSj8VG/VoffI8E=;
        b=ZvxKhtPDwwNAR5WYoXstx22coK5jLSkgeA/9/fEU+jSxKb3W8dNsFh1TtddmGE8sJg
         FdC1NW135V+nanJnxdekjh3ZUjP2rsirHypbQaRWFuCesxLde1VWUZyVWwRVhTbf3IMS
         sJ1+MLkeTEl3bhW7lBMVOeeRGI/IAoCxIeapM9IWvMdTaj4V5XXCbpBEdLVm5ZU08BxW
         KmBWq1iyWLuzCs28ToZFsNfa+7ExOkxNfY6kJd8TYvgkm6gH0YDB6mEOuvOyZSOXuN7u
         5eXJOcbeFCdLFD/ZgfQ1aBVC3YANI+knjOg7r4qJi+fue/aHNGMY7LEHVk4QYUw0MuV6
         Q5Tw==
X-Gm-Message-State: AOJu0YzKJkwJAxUBx6dqaKEQXAhmthTgcYZ8v2Hl9hw2JrGct1l0kNHK
	Mizv/Q2WolICgbul3Kv9+fA=
X-Google-Smtp-Source: AGHT+IEI3w5yoSQaEuzxGLi5JBdbn1FcwHogwtxRb11C5WK0Dzp8trZTEzG1gZcXRqr5W4AoEIsLEg==
X-Received: by 2002:a17:902:f693:b0:1b8:8682:62fb with SMTP id l19-20020a170902f69300b001b8868262fbmr3965311plg.4.1693311305022;
        Tue, 29 Aug 2023 05:15:05 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id w5-20020a639345000000b00563df2ba23bsm8964862pgm.50.2023.08.29.05.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Aug 2023 05:15:04 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 38CB69DE91DC; Tue, 29 Aug 2023 19:14:59 +0700 (WIB)
Date: Tue, 29 Aug 2023 19:14:59 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Aaron Lu <aaron.lu@intel.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Borislav Petkov (AMD) <bp@alien8.de>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>
Subject: Re: kexec reboot failed due to commit 75d090fd167ac
Message-ID: <ZO3hQ0rbr8QuUjVI@debian.me>
References: <20230829114816.GA508985@ziqianlu-dell>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U/CzDxT/qgAVRNod"
Content-Disposition: inline
In-Reply-To: <20230829114816.GA508985@ziqianlu-dell>


--U/CzDxT/qgAVRNod
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 29, 2023 at 07:48:16PM +0800, Aaron Lu wrote:
> Hi Kirill,
>=20
> Ever since v6.5-rc1, I found that I can not use kexec to reboot an Intel
> SPR test machine. With git bisect, the first bad commit is 75d090fd167ac
> ("x86/tdx: Add unaccepted memory support").
>=20
> I have no idea why a tdx change would affect it, I'm not doing anything
> related to tdx.
>=20
> Any ideas?
>=20
> The kernel config is attached, let me know if you need any other info.

Can you provide system logs (e.g. journalctl output) when attempting to
reboot?

Anyway, thanks for the regression report. I'm adding it to regzbot:

#regzbot ^introduced: 75d090fd167aca
#regzbot title: unable to reboot with kexec due to TDX unaccepted memory su=
pport

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--U/CzDxT/qgAVRNod
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZO3hQAAKCRD2uYlJVVFO
owLYAQDWFvGC4cRy/LFARL3LkkawhtjEdwdaR2SPXy2yHSNYUAEAwxLDQPHM7aR0
rAhvatO4U9i0xIIAvgv1aqyGb2BdjQY=
=AcRo
-----END PGP SIGNATURE-----

--U/CzDxT/qgAVRNod--

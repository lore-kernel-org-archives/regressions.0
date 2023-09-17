Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD4E20FA
	for <regressions@lists.linux.dev>; Sun, 17 Sep 2023 10:13:40 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1bf6ea270b2so26335055ad.0
        for <regressions@lists.linux.dev>; Sun, 17 Sep 2023 03:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694945620; x=1695550420; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BW0s0p52tfqu0i1ODnUWjLvwP2BSRo1rB3eh3dPU+fs=;
        b=dOtVJXmB45Ix2+T+IjUdSQkGydKQ9tiW7G/mBRkT08U9tEttTLO7TXYqlOoRyYA+ro
         rnU9dWAzjQ8v1wLhF+4Vhyc875BJ90sDdX7cjRJ41N6hDjtseH0f7hy8gvztsjXGT721
         0zn+VNVqZgWu1p2xVqRx2QOElUAfnsJyBkKwEUIMiQOMy+yGq2OH3IEcS2xPauXuhRJs
         hBD4mxdCDTFEGtmC/c1U+6iTtyktvVgVo25JSvo9TRAtdd8t86LhTayV8mt2zRXm7KQa
         w2WNnNT+7kwyYmKo/v925ru3QUkojuwN56KM84vdTGxVCnjow9B03251fA8+L2+Sbi9a
         XuCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694945620; x=1695550420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BW0s0p52tfqu0i1ODnUWjLvwP2BSRo1rB3eh3dPU+fs=;
        b=TL7TWWuHL1fCFrnkuFTpbJCkiezhKRf7euHS3O/3b+xZKivY40lCafosTgq05p216G
         1rdl5DcAB76rQN4zOH6kf+/vPBT3OpH4Y/WLCOYijcaeNzyCc1z3p3kaqyAC0QPGZ5/j
         yNpsXaCHvMvWgGoP3dT2RtDwRPXveXvwEcxtHRebtmp06Rls7qMgyrAjQQLWg7zD6L7v
         oz7WaimCErXIykqEl5I8RWMumm+oCNaaeMllUwEcQtTbf7bqlzbaVn5/gVBEAtpL+2an
         lcHSJ+ysr1efkAH6njpK+CfUcSX+GWFmHGwpt1hOvkQxtK10eFXdYOL46Z9Uh6DXqc94
         ZTOQ==
X-Gm-Message-State: AOJu0Yyzbd4YMS4ynK6nP4MxnWFUN7v1xA/fDLLKdumAR38DsWVthFQ9
	wZd2908z0kd3ECYab0CAHV0=
X-Google-Smtp-Source: AGHT+IE2czrRBHuvICMHxL5n4TRi7l+354M6ngZ+yc2KmzD5zN1oABxn+cvG2zLmEGcyO09gOqt6WQ==
X-Received: by 2002:a17:902:db12:b0:1c4:723b:f53e with SMTP id m18-20020a170902db1200b001c4723bf53emr922801plx.63.1694945619665;
        Sun, 17 Sep 2023 03:13:39 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id li11-20020a170903294b00b001bde6fa0a39sm6432882plb.167.2023.09.17.03.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 03:13:38 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 490BC81B2E83; Sun, 17 Sep 2023 17:13:36 +0700 (WIB)
Date: Sun, 17 Sep 2023 17:13:35 +0700
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
Message-ID: <ZQbRT50gk6D9kbsj@debian.me>
References: <1694366957@msgid.manchmal.in-ulm.de>
 <ZQWUzwiKWLk79qbp@debian.me>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ssu7s0qSiXIyztu5"
Content-Disposition: inline
In-Reply-To: <ZQWUzwiKWLk79qbp@debian.me>


--ssu7s0qSiXIyztu5
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 16, 2023 at 06:43:11PM +0700, Bagas Sanjaya wrote:
> #regzbot ^introduced: 408579cd627a15
> #regzbot title: huge committed memory due to returning 0 on do_vmi_align_=
mmunmap() success
>=20

#regzbot fix: 3cec50490969af

--=20
An old man doll... just what I always wanted! - Clara

--ssu7s0qSiXIyztu5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZQbRTAAKCRD2uYlJVVFO
o5/HAQCCtFq3EP0NnVQOslp3buXheNr2qrhNJ1GCyb+BhOJFfAD/cCPH3mf6Lx0p
aKpzHIQH62CyrjDIXj3sfh+mKxnRXAw=
=PUFe
-----END PGP SIGNATURE-----

--ssu7s0qSiXIyztu5--

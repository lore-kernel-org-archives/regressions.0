Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D82B224CA
	for <regressions@lists.linux.dev>; Thu,  2 Nov 2023 23:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SRa8dhg0"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1cc5fa0e4d5so13371285ad.0
        for <regressions@lists.linux.dev>; Thu, 02 Nov 2023 16:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698966712; x=1699571512; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YR7cWpbPv3YkHu6Lgq/Qssety+VQHUk9DYioZqwXCUs=;
        b=SRa8dhg02X+K0h45cEOT1GhTrmvtA6creQoMPF3Ds7jU3TiHQFq3RCBi+32EKaWZsG
         UcU1vmaA34tF0aNg2fw8LEIVKXXtyG0ruOY05U+VaqQxTpTPp+QlmPQEbH+DVtwRulBl
         132frqYYICs3HrFqO0WSBtHyKVB+P/NDIsIuQ0BDzTpjA4/ff2Hh3+huv30qcOaTmDem
         2KHndADtTyQf1rgEF3Enjwtg7P2SlrmL3DQXI2FJ9C0ea762G4Uy/UYhZq4UKpjvzLjF
         crhAl0hiIEzNwKEZkBwyuwuffHm+zExBwlm+FDzhN/Z28FsyxVPPp3RH2Y5b/8xhAOTx
         pFbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698966712; x=1699571512;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YR7cWpbPv3YkHu6Lgq/Qssety+VQHUk9DYioZqwXCUs=;
        b=IuOalYYU5gJJ4HQY2sWWmSct5j3zREPhgG3pp6u0hZMOuCUqz6Jr7Kj2691Ul/iNYC
         GNn2b2PcL4eVipDeip3WmLM0OYnANHvmVd/acB/6rJXWZo9G3Nq0shy0zWov3a72YTQo
         paBcW1H1DCnQ0QWNHNGxKLhUjCQPY31TfE5/zJaCwe9mCpXnQSfZBBtB6VgDW2I/Hb73
         H1aGNhaSef/mIilu5HNa+CMBVx1YzOqXoUbxk/f+pVuv/gJccUu7JKZ2XrZmaKgKfOF1
         n2Ta4DlpO6g4r6fz/i2yK98IDqQmCeefUf5Dv/miY90w0VpnXv0dRtE1slICwpl6S2Zi
         86ww==
X-Gm-Message-State: AOJu0YxjNbDLpAcgAJmW00yWkFRx/P6hXxbW/y2MMOJV1j30+plkBH06
	jRhsD8GI6BG6ArHkMApwgo0=
X-Google-Smtp-Source: AGHT+IFNKID/IaFJ3qpqhJHmYpuAZBU6Wmv4Nxw/q6gbtqVIxJN0VLzqTsIy+patzPT8aTnyy+Dwfg==
X-Received: by 2002:a17:902:f1d2:b0:1cc:2575:db14 with SMTP id e18-20020a170902f1d200b001cc2575db14mr16012795plc.60.1698966711585;
        Thu, 02 Nov 2023 16:11:51 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id 4-20020a170902ee4400b001c407fac227sm222666plo.41.2023.11.02.16.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 16:11:50 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 1AC599157AFC; Fri,  3 Nov 2023 06:11:46 +0700 (WIB)
Date: Fri, 3 Nov 2023 06:11:46 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Marian Postevca <posteuca@mutex.one>,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>
Cc: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
	<Vijendar.Mukunda@amd.com>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
	ye xingchen <ye.xingchen@zte.com.cn>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>
Subject: Re: Regression apparently caused by commit
 088a40980efbc2c449b72f0f2c7ebd82f71d08e2 "ASoC: amd: acp: add pm ops support
 for acp pci driver"
Message-ID: <ZUQssoD2rUHSYQ2v@debian.me>
References: <87a5v8szhc.fsf@mutex.one>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="co0Oi2OYqTcTDchu"
Content-Disposition: inline
In-Reply-To: <87a5v8szhc.fsf@mutex.one>


--co0Oi2OYqTcTDchu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 03, 2023 at 10:22:07PM +0300, Marian Postevca wrote:
> I'm trying to develop a sound machine driver based on the acp legacy driv=
er.
> The first version of the driver was sent for review on the alsa mailing l=
ist this
> spring: https://lore.kernel.org/all/20230320203519.20137-1-posteuca@mutex=
=2Eone
>=20
> I'm trying to fix some of the issues that were brought up during the revi=
ew back then,
> but when I ported the patches to the latest commit on the for-next
> branch, I noticed a regression where I couldn't hear any sound at all.
>=20
> So I started a bisect session and found that the first bad commit is:
> ASoC: amd: acp: add pm ops support for acp pci driver
> commit 088a40980efbc2c449b72f0f2c7ebd82f71d08e2
> https://lore.kernel.org/lkml/20230622152406.3709231-11-Syed.SabaKareem@am=
d.com
>=20
> If I revert this commit sound works as expected. So I started tinkering a=
 little bit
> with it and I believe that what happens is that the acp pci driver
> enters the autosuspend state and never leaves this state at all.
> I noticed this because if I increase the autosuspend delay to a much
> larger value, then the sound works until that delay passes.
> I added traces and I can see that when the delay expires the suspend call=
back snd_acp_suspend()
> gets called, but the resume callback snd_acp_resume() never gets called.
>=20
> I'm no expert in runtime power management (though I did read a bit on it)=
, so I don't understand
> all the things that happen underneath, but one thing that is not clear to=
 me is who's supposed
> to mark activity on this device and keep it from entering autosuspend if =
the user wants to play
> some sound? Shouldn't there be some counterpart that calls pm_runtime_mar=
k_last_busy() ?
> I looked through the code and can't find who's calling pm_runtime_mark_la=
st_busy().
>=20
> Some help here would be welcome. Is there something missing in my machine=
 driver code, or
> is the runtime pm handling in acp pci driver wrong?

Thanks for the regression report. I'm adding it to regzbot:

#regzbot ^introduced: 088a40980efbc2

--=20
An old man doll... just what I always wanted! - Clara

--co0Oi2OYqTcTDchu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZUQsrgAKCRD2uYlJVVFO
o679AQCRW7cp+WmNFpWYM+EUDNsuXCHFeqjx5LAQzKMRfXv97gD+MuJIGeWYvJ0F
aDSiN4Lbm1Fo2OmQtJcQmT3DZSQ5CAM=
=uyFI
-----END PGP SIGNATURE-----

--co0Oi2OYqTcTDchu--

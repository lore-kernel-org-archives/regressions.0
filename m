Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5360F2574F
	for <regressions@lists.linux.dev>; Wed, 22 Nov 2023 13:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cUPrIcXq"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-5bdbe2de25fso5148689a12.3
        for <regressions@lists.linux.dev>; Wed, 22 Nov 2023 05:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700659267; x=1701264067; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8KuAtq2wuwd7uRsWWYBZ0mULd3F8IzS2XEFfePOf2ZA=;
        b=cUPrIcXqSTZOKv5wGqSc84okP/Yil21yHruxBJXerXRzqIMZrhi5fgCNBVqETIAJl6
         dzK/qxlhSAIZxsdyurtz7gY/PmJx11reXWTvO8sFOfvNvAk7OKYf+oLy/8DvMpj7aGhS
         x0tmE5+eUwQ0YGvcM0Hr95p7WDGXh2DNtbZRjtIJrk8Kl4mFVK36K1KPgstfsPP8HtvF
         A+oWMyo1hKEXDSJa9wGJqzO4yya3ru9L24uMt4njBbBr4l34LVrayTWtByt/0WXd8MXB
         DHoTzddLRGhjLKGWJ3/sf11mkLd/MVCQIUIC43gXK2Zs19EveqSUBSzqVJhhnxfD9mP1
         6YVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700659267; x=1701264067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8KuAtq2wuwd7uRsWWYBZ0mULd3F8IzS2XEFfePOf2ZA=;
        b=o+IBZeeOKFikl/MBydvGmRedk7QBEIFN/d4n0ZkyN4NXxYIAGmsHPQiWn7rkmzeyyt
         DI4SZRqyCSHzcr0eE1zKGzYf8ekztsY/s4le7Lq6II6PF9j5mwIloLHLkGlsfLN/3H+Q
         w6WyGUMhuLUP5zUhjxAv/34nNKHGzaMTUsgd0EP6Km/oYXexpd7YyQY4S1ifzx7QOQJ/
         4E0F0Qxp/ufOTftTc81k5g6TI2PmbfHG9I34rHThwcWeKlvGzE3gCDyLezJ5HReSHCUz
         c2VrUZLFH4ALTTVJuMp7MLucMFm55+D+FT30An/G9LcaQbKs8mvsjEoYaKk8p216+C5r
         rWdw==
X-Gm-Message-State: AOJu0YxbLjw5dQmmbdBaB1T3WtnFu5PVqkJaYv/sIP1F6tlDGdTWn4OI
	6jG09Us6d3uSbKoNaXT5ZZbbm9tH6IB1NWGG
X-Google-Smtp-Source: AGHT+IHMJmWJO62QizpKqXBJpkRvDmAKFCnqM9s6SVoAVqZ+23esDzGNsZhTZ+8ts5QHY0nOg2jcBQ==
X-Received: by 2002:a05:6a21:3288:b0:186:736f:7798 with SMTP id yt8-20020a056a21328800b00186736f7798mr2447858pzb.11.1700659267413;
        Wed, 22 Nov 2023 05:21:07 -0800 (PST)
Received: from archie.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id w14-20020aa7858e000000b006cbb71186f7sm4008491pfn.29.2023.11.22.05.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 05:21:06 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id 1EB3210207134; Wed, 22 Nov 2023 20:21:04 +0700 (WIB)
Date: Wed, 22 Nov 2023 20:21:03 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux ACPI <linux-acpi@vger.kernel.org>,
	Thorsten Leemhuis <regressions@leemhuis.info>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Borislav Petkov <bp@alien8.de>, Arnas <arnasz616@gmail.com>
Subject: Re: Fwd: [Regression] S3 Sleep Mode failures since Linux 6.x on Dell
 Inspiron 15 5593
Message-ID: <ZV4AP1GY3fHAxmtx@archie.me>
References: <585dcc9e-7e72-473a-98ec-4f06018d542f@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LKCzLPBSKEZk9tIu"
Content-Disposition: inline
In-Reply-To: <585dcc9e-7e72-473a-98ec-4f06018d542f@gmail.com>


--LKCzLPBSKEZk9tIu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 26, 2023 at 07:25:48AM +0700, Bagas Sanjaya wrote:
> Hi,
>=20
> I notice a regression report on Bugzilla [1]. Quoting from it:
>=20
> > I'm having some weird issues with sleep mode on any 6.x Linux kernel ve=
rsion - it's a toss-up when I close the lid as to whether it will sleep pro=
perly or not - when it fails, the screen will lock, but it will not actuall=
y enter S3 sleep - it just blanks the screen, but the laptop stays on (and =
fan does too).
> >=20
> > Opening the lid after a failed sleep attempt turns on the screen instan=
taneously, and it doesn't even need to reconnect to WiFi - this doesn't hap=
pen when actually resuming from sleep, it takes a couple seconds for the sc=
reen to come on, and it then needs to reconnect the network.
> >=20
> > Following the failed attempt to enter sleep mode (closing the lid), the=
 following entries appear in the system log -
> >=20
> > arkiron kernel: ACPI Error: Thread 3233415168 cannot release Mutex [ECM=
X] acquired by thread 3268191936 (20221020/exmutex-378)
> > arkiron kernel: ACPI Error: Aborting method \_SB.PCI0.LPCB.ECDV._Q66 du=
e to previous error (AE_AML_NOT_OWNER) (20221020/psparse-529)
> > arkiron kernel: Non-boot CPUs are not disabled
> >=20
> > Now, the "Non-boot CPUs are not disabled" line stands out the most to m=
e here, because successful sleep attempts won't have this line in the log.
> >=20
> > After the failed attempt above to sleep, I now close the lid again, and=
 it seemingly goes to sleep successfully. After checking the log following =
this, I find two new error lines in the log -
> >=20
> > arkiron kernel: ACPI Error: Thread 3233415168 cannot release Mutex [ECM=
X] acquired by thread 3268191936 (20221020/exmutex-378)
> > arkiron kernel: ACPI Error: Aborting method \_SB.PCI0.LPCB.ECDV._Q66 du=
e to previous error (AE_AML_NOT_OWNER) (20221020/psparse-529)
> >=20
> > Note that this time the CPU line is missing, as expected for a successf=
ul sleep attempt.
> >=20
> > This happens on both latest stable Linux kernel 6.5 as well as the late=
st Linux LTS 6.1 kernel. The last kernel that this didn't happen on was Lin=
ux LTS 5.15 (any version), which is what I was running up until the Linux L=
TS 6.1 upgrade. At that point I tried switching back to mainline (6.5) to s=
ee if it would fix sleep issues, but it didn't help. Downgrading to Linux L=
TS 5.15 did fix the sleep issues and the laptop seems to sleep reliably now=
=2E Running LTS 5.15.131-1 without issue as I am making this report.
> >=20
> > I'm on a Dell Inspiron 15 5593 using BIOS ver 1.27.0 (latest as of now)=
, running Arch Linux x86_64
>=20
> See Bugzilla for the full thread.
>=20
> Anyway, I'm adding it to regzbot:
>=20
> #regzbot introduced: v5.15..v6.1 https://bugzilla.kernel.org/show_bug.cgi=
?id=3D217950
>=20
> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=3D217950
>=20

Hi Thorsten and all,

It seems like the BZ reporter is really busy with his college life; IOW
he can only bisect in the winter break [1]. Should I mark this regression
as inconclusive for now?

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=3D217950#c5

--=20
An old man doll... just what I always wanted! - Clara

--LKCzLPBSKEZk9tIu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZV4APwAKCRD2uYlJVVFO
o2AAAQDTwCOQWHhQjO5u0rqiRHxr5UzfJelTwcYdlfrqvbmiUgD/Zsh+FP3jNO3S
gRMaJaeLR5+9J9TbWbtkSOkrGF4AUAw=
=vXvH
-----END PGP SIGNATURE-----

--LKCzLPBSKEZk9tIu--

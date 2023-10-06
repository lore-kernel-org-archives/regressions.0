Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFD7629
	for <regressions@lists.linux.dev>; Fri,  6 Oct 2023 01:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bDIBZwhR"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3af603da0d1so1008922b6e.1
        for <regressions@lists.linux.dev>; Thu, 05 Oct 2023 18:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696554263; x=1697159063; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xbWXVkPufIc/8Du+zQCnrHClPnWAOU4FcdQfVWLhTPM=;
        b=bDIBZwhRDLry4/o2mBYLkhCNy2Rlh6eEAc2Pf9TC1l8Hq6qcVE+zDoV/5CWMoELKAc
         9jMqgDyQ8yd5HM9NkHUFUbGrBbZcbvStHOZ9QgmZb336XmhYy4OWPH583JePEbRKksNh
         sNtzMX+ZMl/G0LCFyDIJoAyEq2CYDQcDjUsSgyR7WIXSNg2qGMqCTF+E4y4S98Z8wnWT
         n3/2DMvMz3azBxJeYja3PA6T/kvvOe0kSB8o/pWaBUaO/Y17xWeqKjR6CZzPaujPwVRR
         Nq/gI94KrRJdtEqg5FMvUf25ipulCLXFq4qTqi9MmC8H4BbSGBaBgZQ2C6kj7CHQnYDD
         9L9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696554263; x=1697159063;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xbWXVkPufIc/8Du+zQCnrHClPnWAOU4FcdQfVWLhTPM=;
        b=W3WzXUW7yAvP/wizkFyexNlg3rN0ENYNHZu1vEhv+eqk0Tuv33dPEZaNeMJtfgHUHI
         /i8jdPXcpJDv+0BWvtI+uMKp3RLP4LDIZaRWo4w9+e04O03LTESp0ONoQONX+ipgeZJC
         36UPr05dfKB33C0TRBwTBI5C8hnnxjum+OoZoSn/KkN6E3oTBypIIPVBWeEZM3PLn/49
         Rbj4URBkVCT3iflRAqSmRd56p0mYaRcQFkqAmpqJ5ZZyVxFno/Tm2yxw0eC3shFVNTIN
         62uS3hbIBfel4rh2zI+p2d4g24564Zte6LeUi+72NGFmvSq0oGZv2iCWukqgcTK1Mje7
         ZlxQ==
X-Gm-Message-State: AOJu0YxDSlMpkZ1FsdAQNQi4oOtiRza/HKl8HSQ6D+e+Fr4aogLkBfmD
	uv4FOkL6je3CTcv6yCv5foM=
X-Google-Smtp-Source: AGHT+IFh2w6zzhV5IY1apER8J1+pgvye6XXqvRnnMvh23W1RQguKILS+24Zm9m4xUzHHHEty7//QLg==
X-Received: by 2002:a05:6808:138a:b0:3a7:1d15:28fe with SMTP id c10-20020a056808138a00b003a71d1528femr7789531oiw.56.1696554262692;
        Thu, 05 Oct 2023 18:04:22 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id g2-20020a63ad02000000b00584d035c08asm2083377pgf.24.2023.10.05.18.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 18:04:22 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 777638209CB9; Fri,  6 Oct 2023 08:04:18 +0700 (WIB)
Date: Fri, 6 Oct 2023 08:04:18 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Tatu =?utf-8?B?SGVpa2tpbMOk?= <tatu.heikkila@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Device Mapper <dm-devel@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>, Alasdair Kergon <agk@redhat.com>,
	Linux Regressions <regressions@lists.linux.dev>
Subject: Re: (Bisected) Accessing opened Bitlocker partition leads to memory
 fault and kernel panic on Imac8,1
Message-ID: <ZR9dEiXhQv-wBVA2@debian.me>
References: <f1b8d8f5-2079-537e-9d0f-d58da166fe50@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Jb5IqaSpz/f9tNpy"
Content-Disposition: inline
In-Reply-To: <f1b8d8f5-2079-537e-9d0f-d58da166fe50@gmail.com>


--Jb5IqaSpz/f9tNpy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 05, 2023 at 08:15:43PM +0300, Tatu Heikkil=C3=A4 wrote:
> Hello,
> I think you and the lists are right recipients, forgive me if not, I've
> never reported kernel bugs before. Naively this seems a crypto issue and
> Herbert Xu from crypto maintainers made the buggy commit, but it edits
> drivers/md/dm_crypt.c maintained by dm-devel people per MAINTAINERS, so I=
'm
> going by that.
>=20
> At the center of the issue is my Imac8,1 and an external 2TB SSD with 5
> partitions: an EFI+MBR portable Arch Linux install with LUKS encrypted ex=
t4
> /home, and a 1.7TB exFAT encrypted with Bitlocker.
>=20
> Mounting the LUKS partition works fine on all my 4 computers (Imac8,1,
> Imac12,2, two generic Intels; Fedora's GNOME gvfs volume monitor often
> crashes on mount using this drive), and mounting the Bitlocker partition
> works on all other computers, but my Imac8,1. On my other computers, I can
> boot into the portable install which automounts the Bitlocker partition
> fine. However, on my Imac8,1, regardless if I boot into the external driv=
e's
> portable Arch Linux install, or use the Imac's own internal Debian testing
> install, any post-6.4 kernel reliably panics (50+ times so far, 100% of t=
he
> time) when accessing the unlocked Bitlocker volume:
>=20
> # cryptsetup open /dev/sdb5 --type bitlk crucial
> Enter passphrase for /dev/sdb5:
> # mount /dev/mapper/crucial temp [kernel immediately panics if I try to
> tab-complete the mount point, making the shell also access the decrypted
> device I assume, or try to run the command]
>=20
> I originally ran into this when mounting using XFCE's Thunar implementati=
on.
> Using it, the mount fails with "Operation was cancelled" and the system
> crashes within a minute.
>=20
> Git bisect lead me to:
> # first bad commit: [e3023094dffb41540330fb0c74cd3a019cd525c2] dm crypt:
> Avoid using MAX_CIPHER_BLOCKSIZE
>=20
> If I git revert e3023094dffb41540330fb0c74cd3a019cd525c2 on current Linus'
> git master, the issue goes away. So I'm personally not all that affected
> anymore (if I'm ready to compile my kernels from now on), and I understand
> that you have no clear way to reproduce this as it seems strongly bound to
> hardware, but seems like this could point to a potentially serious securi=
ty
> issue since it involves both crypto and undefined behaviour.
>=20
> Kdump dmesg logs (the error output is not completely consistent between
> panics) & .config can be found in a dummy Bugzilla report
> https://bugzilla.kernel.org/show_bug.cgi?id=3D217982
>=20
> Please let me know if I can help you in any way. I don't mind using this =
as
> a gateway to learn more about kernel debugging etc.
>=20

Thanks for the regression report. I'm adding it to regzbot:

#regzbot ^introduced: e3023094dffb41
#regzbot title: kernel panic when accessing opened bitlocker partition due =
to avoiding MAX_CIPHER_BLOCKSIZE
#regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=3D217982

--=20
An old man doll... just what I always wanted! - Clara

--Jb5IqaSpz/f9tNpy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZR9dDAAKCRD2uYlJVVFO
oz5dAQCMP/K95ZXJESKmwYJsaJzV2PzQpaGweREO01xriKlshQD9FfLS/rj+AhM0
sYS2+qls+vEXoyzp5laVX3fWeL1l1Ao=
=7sAU
-----END PGP SIGNATURE-----

--Jb5IqaSpz/f9tNpy--

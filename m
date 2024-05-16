Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FF23236
	for <regressions@lists.linux.dev>; Thu, 16 May 2024 02:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715826623; cv=none; b=rLM+h/jYsmclj2pnN/0/gNHjMMEtntqTHH8BiyoBu5gMzyJoEaFheE7q3e++6bYJQBt8D9LkiuvRRofV0xqhxWQaI517q9yXzLul5nCV2j+GLREwDz42MbI45mDUGxJ3P6SenumOGIFEChU4PREJqt6Y10s7/NIB62k0tfgxZ4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715826623; c=relaxed/simple;
	bh=luuZCOwHRQzcsKdhemBb69s42Jy1t33jiaLSTq1qmrE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q5bREzB58fOmSZRU8fFgi0syBYbuAJ9FMNpIByPks8B7JfmUczxKpEAG3w3V3KwEym8pM9O4ls3/tefMRVIHfgNP2Fbbu21ik0TcoeG+ZXJ+im/+HPeXztD8lC/gIpztVx9WRKsbtOAEehucQy5HFVht6LlmukebfGaRRWix8lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SUpwXVRL; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SUpwXVRL"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6f0fbd2d9ebso2392557a34.2
        for <regressions@lists.linux.dev>; Wed, 15 May 2024 19:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715826621; x=1716431421; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S3HxxeZ7mdHwDKn/7AQjzq+Cq5PG4lChvk4r41U5858=;
        b=SUpwXVRLrxFGj2GZbHl2ixrgURyzfoSyPBlXUt0cERtCBU4A2RpKS8VhZOHlQ2IXEC
         0eVk/4WCLYG2Ct0WDikOhvlUUBJw2aU/ZjQ1feq8YnNBRhy15YYaVm6rSSDZub5wKQqi
         8wpJdU8WZvuZPqrFisL3nd6le2fs5OJqEAJPTgs4E8hL2xCjhgzSH/tDIxnp7kNy1OIm
         XojzCRP/7gRnMMCtOGBMSnzOp0Xik+5B7kVuModWfKHng5sU2oAPRIAlZ1ehRAlQJKaH
         ayczMNfc3i+klF3L1No3lmwxIYVAg6UqsFmH12GIXeZoOTQ99beJEEAfjQvXZzPeLQoG
         fBVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715826621; x=1716431421;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S3HxxeZ7mdHwDKn/7AQjzq+Cq5PG4lChvk4r41U5858=;
        b=ql5LVUj0opAwdtb8yR5QT3NeBlIQkzLvsKVmeoB+jvoYRYsFaClgA7yV9e4gYcVx2Q
         r+GYduCsXUYH9ktlZUSGddQ+RFgFp8p7a80/VlOGAm+uuBDtUzEnb+KVwOp9pBswU377
         r7BzMHf/14Wgn58FDtw7J8IHQybKDqTFSw/fOKwk8gHSOusB++Rnx0hJSVRIxccHiR8Y
         fUzwUDC5R6cuPcYXOCxAus+HVpLyic9Ep5n7VLZgEqX2SZP9DYcWSFrkj7r/3qoUtwcn
         Hp959pRcpaXtgPLDIxUIJwlNrugiLdC20d8RpBMQz1A3Talr6Ay8NOKHJf8XlT/X6byz
         tOvw==
X-Forwarded-Encrypted: i=1; AJvYcCUcJK8LT8mzCbqS0lIUkyV7O7puvLnygmGvVpl/HlbbvF9Z9bqFXNKSC7YJMcQ0Gi+6SO4ydTsHUsXdwRbL+NGIgXblmrZz+uvXsQU=
X-Gm-Message-State: AOJu0YxJDugpmZ1oU0j1Wr2+x5P13bgyyBOCWy4x/5yhBbscPIk+KRsw
	K5HRF9f4s7p5J4n2Ql/fQyXJ0DpZmq5Pwtho2P7eQSbWb/5IfZ4+
X-Google-Smtp-Source: AGHT+IH2iA6yNkrsVaY3XeU7OEvrXCvN9AWyyvM6DuW9wN2hXlgxsVnnbClBjcPlY6k+FYVy0uUNyg==
X-Received: by 2002:a05:6870:7096:b0:23d:49b4:6788 with SMTP id 586e51a60fabf-24172aa2c2dmr25778539fac.21.1715826620560;
        Wed, 15 May 2024 19:30:20 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2ade2c9sm11827127b3a.125.2024.05.15.19.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 19:30:19 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id D409E186C082D; Thu, 16 May 2024 09:30:16 +0700 (WIB)
Date: Thu, 16 May 2024 09:30:16 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Power Management <linux-pm@vger.kernel.org>,
	Linux Filesystems Development <linux-fsdevel@vger.kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Christoph Hellwig <hch@lst.de>,
	Jan Kara <jack@suse.cz>, Alexander Viro <viro@zeniv.linux.org.uk>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
	Petri Kaukasoina <petri.kaukasoina@tuni.fi>
Subject: Fwd: Kernel panic in 6.9.0 after changes in kernel/power/swap.c
Message-ID: <ZkVvuKHV-jdOMnB1@archie.me>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OHWfg0fovwQn+CBZ"
Content-Disposition: inline


--OHWfg0fovwQn+CBZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Petri Kaukasoina <petri.kaukasoina@tuni.fi> reported on Bugzilla
(https://bugzilla.kernel.org/show_bug.cgi?id=3D218845) VFS kernel panic
regression when reading hibernation image. He wrote:

> 6.9.0 crashes on boot while 6.8.0 is ok.
>=20
> Kernel panic - not syncing: VFS: Unable to mount root fs on unknown-block=
(8,1)
>=20
> bisect result:
>=20
> 4379f91172f39d999919c8e8b2b5e1d665d8972d is the first bad commit
> commit 4379f91172f39d999919c8e8b2b5e1d665d8972d
> Author: Christian Brauner <brauner@kernel.org>
> Date:   Tue Jan 23 14:26:23 2024 +0100
>=20
>     power: port block device access to file
>    =20
>     Link: https://lore.kernel.org/r/20240123-vfs-bdev-file-v2-6-adbd023e1=
9cc@kernel.org
>     Reviewed-by: Christoph Hellwig <hch@lst.de>
>     Reviewed-by: Jan Kara <jack@suse.cz>
>     Signed-off-by: Christian Brauner <brauner@kernel.org>
>=20
>  kernel/power/swap.c | 28 ++++++++++++++--------------
>=20
> 6.9.0 with only this reverted did not compile. This has something to do w=
ith reading a hibernation image from disk. I use a swap file, not a partiti=
on. The system was not hibernated, though. After I removed resume=3D and re=
sume_offset=3D from the kernel command line, even 6.9.0 boots without panic.
>=20

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--OHWfg0fovwQn+CBZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZkVvswAKCRD2uYlJVVFO
o/SxAP4sikhakMMJf5TMjw7SN2qc2KZ893jwWhW0TXgeTMCRqgD+MpgwZ0zPaRfe
EbWTwhe0+C4ChDxW8nBIE+Nf24OQNQE=
=8S11
-----END PGP SIGNATURE-----

--OHWfg0fovwQn+CBZ--

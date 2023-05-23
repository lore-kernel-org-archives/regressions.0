Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DFC1874
	for <regressions@lists.linux.dev>; Tue, 23 May 2023 01:52:33 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-51452556acdso4632387a12.2
        for <regressions@lists.linux.dev>; Mon, 22 May 2023 18:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684806752; x=1687398752;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YJHAFjFAFtXjAaqHIvSdrHTyDRtStagvgqxmFGoZrEs=;
        b=fvAowqmBUdokZAle+a3AtujbmSt9kJHxneghHI6yLcaiuJU54ux+RzaaRkkXZjXh1Y
         Uskuzb9J5jsl6SGiWJU6Zxpxkwsvo6dA0MkOZrK2ERzSv7cs/wma971Zn4SVVkYjRYdt
         SDrW0zijKzppieUgaklVHfoGQxQdL5/tKn4zTNgQHLSnpQS/Y8/9PjlpDbtacaQaTaN3
         Qf48A0quPb+TggVDHYcjyEGqAmGFGJkM9odiFZA0e1jDKU9z8taN3PaK7eEm7ponjAqi
         ap+a3fNnp6aXNmDWG86/ZUs5OkUBH5gFp2Jm5cQo7BZ9WfoT0+1tQj0hnmKq3jFAv7wg
         /tNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684806752; x=1687398752;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJHAFjFAFtXjAaqHIvSdrHTyDRtStagvgqxmFGoZrEs=;
        b=BE6Jj+O/ScdpGZbTfiuhOgkxlidZefJoScYbcOTffH1dD69QdKrXn5PZZzQXAMpd5U
         AXuqhyXbwoGicmw9cdJOxwfXtxaOoqyXrjAIEcDiT9b3A/SdoLUCMuur27L0sOKsxTZU
         sMgIZC1QTHD/08HdX+4RgeXt46BnxNuzxIpt+s2bJvVAurlg9ENhsCJ2Tv28f+lqWnBQ
         n6j+MqXQC1TWD9HFugilkogP6pjrmiKQji0TXXcjvnDxZq2v/pLslrZuLiw1nx13JElj
         tMZDFo5P0hi2YOVdOparx8UH+MvosbSj7jCK2GYc23R+apDsrmi7il+N3YgyIWV4/lfX
         6nWA==
X-Gm-Message-State: AC+VfDz9zMXGinyWNLRO+OJ90LwvLfufDFuihYkMzGXXL7e60Cq62jmQ
	Hqkh/8AUo1h2+r5J/u4f00E=
X-Google-Smtp-Source: ACHHUZ65ZrBdnHglzvC2r3og9XZPcPvr1clzbhLbJrV2UUKfcgNkL/RDkzgg80OEUwNJDiuQwvH3LQ==
X-Received: by 2002:a17:903:1208:b0:1aa:feca:b616 with SMTP id l8-20020a170903120800b001aafecab616mr13317495plh.65.1684806747723;
        Mon, 22 May 2023 18:52:27 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-65.three.co.id. [180.214.232.65])
        by smtp.gmail.com with ESMTPSA id jj20-20020a170903049400b001aaf1679c9fsm5423489plb.221.2023.05.22.18.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 May 2023 18:52:27 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 4A973106998; Tue, 23 May 2023 08:52:21 +0700 (WIB)
Date: Tue, 23 May 2023 08:52:21 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Forza <forza@tnonline.net>, Linux btrfs <linux-btrfs@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Stable <stable@vger.kernel.org>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
	David Sterba <dsterba@suse.com>, a1bert@atlas.cz
Subject: Re: Fwd: vmalloc error: btrfs-delalloc btrfs_work_helper [btrfs] in
 kernel 6.3.x
Message-ID: <ZGwcVTpQNBoJHBB+@debian.me>
References: <efa04d56-cd7f-6620-bca7-1df89f49bf4b@gmail.com>
 <fcf1d04.faed4a1a.18844d8e78f@tnonline.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vilJHAGKshW8eYzU"
Content-Disposition: inline
In-Reply-To: <fcf1d04.faed4a1a.18844d8e78f@tnonline.net>


--vilJHAGKshW8eYzU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 22, 2023 at 09:04:05PM +0200, Forza wrote:
> I have a similar experience with kernel 6.3 where vmalloc fails in a simi=
lar way. I was able to reproduce it in a QEMU VM as well as on my system.=
=20
>=20
> https://lore.kernel.org/all/d11418b6-38e5-eb78-1537-c39245dc0b78@tnonline=
=2Enet/T/

Thanks for your similar report. Telling regzbot about it:

#regzbot link: https://lore.kernel.org/all/d11418b6-38e5-eb78-1537-c39245dc=
0b78@tnonline.net/

--=20
An old man doll... just what I always wanted! - Clara

--vilJHAGKshW8eYzU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZGwcUgAKCRD2uYlJVVFO
o3JoAP4i8o9ucMk1qqpBMd8ABO/bcREF3CrJ2WPC/g31f/TX0gEAxA5XA9TJOQcO
qMAV7/h2Dj3zsyNZYLkYlk+euTGovgM=
=Jj6d
-----END PGP SIGNATURE-----

--vilJHAGKshW8eYzU--

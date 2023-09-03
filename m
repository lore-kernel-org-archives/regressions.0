Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80353D6A
	for <regressions@lists.linux.dev>; Sun,  3 Sep 2023 23:53:52 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-68becf931d0so415665b3a.3
        for <regressions@lists.linux.dev>; Sun, 03 Sep 2023 16:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693785232; x=1694390032; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=En7shv5RznWiN618VRf5jIWIIiTRux7CMSCgdYT+gbc=;
        b=WXVK4BkmB6WaROf9RtNxByJ3/vXOnx6Bxhivl8+CWeeYHHbfXsO5nGiUbJC1mFoCHj
         JchpBhD+8wVmLKS48T4wbdasnjEiFxpLmZq7287khd6c1psuR2RW6oeee75p3HWko8KU
         3iiEWJ2N0aMhgaWwsOk8mSHqzB7VamX+Qpx0KCoKCqWrwFoHqaUklDH9CpJH70ztqorH
         SOOk6D+TNdLIwrjFbdUpGnHoHWA9Uv5ErtKE5jR24W/Lz2zbtRPCLS4xFojrxZbBM9aL
         oCE8xaHUy8ltwGGMXA0z0AjJS6xkCo03wx0vxm3c3UGeENSbh35BLRzMmecuGJ69zOg0
         g3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693785232; x=1694390032;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=En7shv5RznWiN618VRf5jIWIIiTRux7CMSCgdYT+gbc=;
        b=ftDV77ugheAvA+fCCGKKLqXbg2UQMR89Lb3hPW6uecA9j5HViZ/ol+D6dQSV9fca+X
         Q8E+BwuPQZBQwawUodh/aAcbQC3m0+QBbqT5ozQ1Z0WBUyUBOEKZmgbMLAH31mEN8JWv
         vhFSYfw3ij0ogI8KJRJfrZo79/mnSF3ylWFd76r4qW90ivxYmMxGGZScJqfJ8wWUDTUo
         F+2eEIPa3ENQiUaPWooCHMvSmWhWpv663D8zhitNdlpwetounxXgiyWrktTa37K7svA1
         XU1U7TMUqDe4M5lJ8J0wb/exnFZcnf6z/BLUm30gGsxaxiHiYb3ceiJhFJEdAby+dPEE
         TUZw==
X-Gm-Message-State: AOJu0YzdtqQUkER2NWep1i/9flw70e06LM2mjc9PQERg8KVY7n4eIMUl
	YpeSunBGZBqO7iK4oCDtWXc=
X-Google-Smtp-Source: AGHT+IGm6EYy4vOR7gv128qJdDcksmxif5Nj1+AHpsS8Qk2RNLwtKGxN0iXCvRxgSCg7w/ftCmn0gA==
X-Received: by 2002:a05:6a00:c93:b0:68a:8552:c024 with SMTP id a19-20020a056a000c9300b0068a8552c024mr8343381pfv.7.1693785231720;
        Sun, 03 Sep 2023 16:53:51 -0700 (PDT)
Received: from debian.me ([103.124.138.83])
        by smtp.gmail.com with ESMTPSA id v23-20020aa78097000000b0063f0068cf6csm6154011pff.198.2023.09.03.16.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 16:53:51 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 67D50808C6CC; Mon,  4 Sep 2023 06:53:46 +0700 (WIB)
Date: Mon, 4 Sep 2023 06:53:45 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Kenta Sato <tosainu.maple@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux USB <linux-usb@vger.kernel.org>,
	Linux Stable <stable@vger.kernel.org>
Subject: Re: usb: dwc3: some USB devices not working after 6.4.8
Message-ID: <ZPUciRLUcjDywMVS@debian.me>
References: <CAF1eZtsBzGb_UxOqZpNiEsk8Uk7DkqPh5AnYRRNc_kkr-tFasQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NWjaryHgLzn1Za+x"
Content-Disposition: inline
In-Reply-To: <CAF1eZtsBzGb_UxOqZpNiEsk8Uk7DkqPh5AnYRRNc_kkr-tFasQ@mail.gmail.com>


--NWjaryHgLzn1Za+x
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 03, 2023 at 09:19:13PM +0900, Kenta Sato wrote:
> Hi,
>=20
> I am using the FriendlyElec NanoPi R4S board.
> When I update the kernel from 6.4.7 to 6.4.11, 6.4.13, and 6.5.1, it
> doesn't recognize some USB devices.
>=20
> The board has two USB 3.0 ports. I connected 1) BUFFALO USB Flash Disk
> (high-speed) and 2) NETGEAR A6210 (SuperSpeed) to each port.
> 1) is often not recognized. On the other hand, 2) was working while I
> was testing.
> Regardless of whether a USB device is connected, I could see the below
> message on dmesg:
>=20
> [    0.740993] phy phy-ff7c0000.phy.8: phy poweron failed --> -110
> [    0.741585] dwc3 fe800000.usb: error -ETIMEDOUT: failed to initialize =
core
> [    0.742334] dwc3: probe of fe800000.usb failed with error -110
> [    0.751635] rockchip-usb2phy ff770000.syscon:usb2phy@e460:
> Requested PHY is disabled
>=20
> Is there any idea on this?
>=20
> The cause seems to be related to this commit. I tried reverting this
> change and the issue seemed to be solved.
>=20
> >From 317d6e4c12b46bde61248ea4ab5e19f68cbd1c57 Mon Sep 17 00:00:00 2001
> From: Jisheng Zhang <jszhang@kernel.org>
> Date: Wed, 28 Jun 2023 00:20:18 +0800
> Subject: usb: dwc3: don't reset device side if dwc3 was configured as
>  host-only
>=20
> commit e835c0a4e23c38531dcee5ef77e8d1cf462658c7 upstream.
>=20
> Commit c4a5153e87fd ("usb: dwc3: core: Power-off core/PHYs on
> system_suspend in host mode") replaces check for HOST only dr_mode with
> current_dr_role. But during booting, the current_dr_role isn't
> initialized, thus the device side reset is always issued even if dwc3
> was configured as host-only. What's more, on some platforms with host
> only dwc3, aways issuing device side reset by accessing device register
> block can cause kernel panic.
>=20
> Fixes: c4a5153e87fd ("usb: dwc3: core: Power-off core/PHYs on
> system_suspend in host mode")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Link: https://lore.kernel.org/r/20230627162018.739-1-jszhang@kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/usb/dwc3/core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?=
h=3Dv6.4.8&id=3D317d6e4c12b46bde61248ea4ab5e19f68cbd1c57
>=20

Thanks for the regression report. I'm adding it to regzbot:

#regzbot ^introduced: e835c0a4e23c38
#regzbot title: some USB devices unrecognized caused by not resetting dwc3 =
device if it is host-only

--=20
An old man doll... just what I always wanted! - Clara

--NWjaryHgLzn1Za+x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZPUcggAKCRD2uYlJVVFO
o1hSAQCdVlX3JRtbf9fuGmqaqWlzqB1jA0yt7UJbFL9BEKbWTgD+LnaQcHUbX3Sm
3F8xdtN2oU5Bw4DhNY7wTPzDUYeyOwE=
=+CFB
-----END PGP SIGNATURE-----

--NWjaryHgLzn1Za+x--

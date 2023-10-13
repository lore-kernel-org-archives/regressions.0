Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0D91C3C
	for <regressions@lists.linux.dev>; Fri, 13 Oct 2023 05:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ADktCCmV"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1c9de3f66e5so12343985ad.3
        for <regressions@lists.linux.dev>; Thu, 12 Oct 2023 22:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697175570; x=1697780370; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hqvz2L9RlTj7o4qf/07nZV0iXz8QiAUyy9nom9V5I+w=;
        b=ADktCCmVPQ/OcXn4JgjbH8ejeW+faxL/cKrP72Ug8Esb16kK6B3c0nFjCemyjZziWN
         4u9hPEuUZdSw98x9lsroEXMTvIiPI6OZi4o0I4cA7sIzLtt+G98ghPodq7VytcLr1owW
         eIU7uGTS+wkJ4LiWwBvn+T2Hwi62rog7pugXy0McMVF9YCFBozYiXExd8DfyWykJuZ84
         jovFv+MokhKhKLR4ylq6yPhtzWv+SWy3iOC8cPWop1HQM+Zd3mFiBZVkgaiisGf3nkMY
         BcbQdBEcUjpm7+asb/SuiNTEcVsiSChKTus1p35P66VGS428N7bmHfq+uqcqXLPUlCXc
         xYuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697175570; x=1697780370;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqvz2L9RlTj7o4qf/07nZV0iXz8QiAUyy9nom9V5I+w=;
        b=G8r4WMD4XX33+XbF51ZrCiWM7Y4oMIB1bQ1kzPXSiPMud92nAS4OafjxlnFKP5vZVv
         TPLkAIuWmtyNudV8B+zIrwaUieh9FZ3XxpXcaibHa5IU80k4p7R6vlfXf2oM5/YZMQev
         mkHB+sBWHYbuUdaE9KOnk2u+kSB7bAhFMW/XOPKRjxm0B4wity9ZJO5Ap4kozcjpf8Kb
         AubGHK62RGb368jf/QqO+PMC8tYNcRELLGGNR4EbeS0oaahJlvqTtG+yV8UC97QOYTnc
         3yqx9a65uh5ZRMPOrSfvmE57b3wERPbw3wFH63WZL8frqO5wDyWwy9AW+rfbzvD0fsW/
         H8Hw==
X-Gm-Message-State: AOJu0Yy3KLVOzSTFBe2NLhCPfD+PtVMaJsCP3r4Y8TM9RW9A3T712103
	DMH9DEqvTwD2uHwHNWBm1cY=
X-Google-Smtp-Source: AGHT+IE3lroCE11A0UobeXWWaOiCXY7jo4Dw4Vq3MrKFr1cVgpmUdEU6kd+uy4EfaA5FfC2Xso1feA==
X-Received: by 2002:a17:903:1c6:b0:1bf:7d3b:4405 with SMTP id e6-20020a17090301c600b001bf7d3b4405mr28903948plh.14.1697175570083;
        Thu, 12 Oct 2023 22:39:30 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id s7-20020a170902ea0700b001b9c5e07bc3sm2932611plg.238.2023.10.12.22.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 22:39:29 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 6C60C8000455; Fri, 13 Oct 2023 12:39:24 +0700 (WIB)
Date: Fri, 13 Oct 2023 12:39:23 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Marek Vasut <marex@denx.de>, Linux Stable <stable@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Dinghao Liu <dinghao.liu@zju.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>, Sasha Levin <sashal@kernel.org>
Subject: Re: Possibly broken Linux 5.10.198 backport spi: spi-zynqmp-gqspi:
 Fix runtime PM imbalance in zynqmp_qspi_probe
Message-ID: <ZSjYC_ATX193mJOA@debian.me>
References: <9afe9285-6f46-46d9-bd21-2ea5c4dc43c0@denx.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PoPuT7NtGdw9ffR9"
Content-Disposition: inline
In-Reply-To: <9afe9285-6f46-46d9-bd21-2ea5c4dc43c0@denx.de>


--PoPuT7NtGdw9ffR9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 12, 2023 at 06:39:10PM +0200, Marek Vasut wrote:
> Linux 5.10.198 commit
> 2cdec9c13f81 ("spi: spi-zynqmp-gqspi: Fix runtime PM imbalance in
> zynqmp_qspi_probe")
>=20
> looks very different compared to matching upstream commit:
> a21fbc42807b ("spi: spi-zynqmp-gqspi: Fix runtime PM imbalance in
> zynqmp_qspi_probe")
>=20
> The Linux 5.10.198 change breaks a platform for me and it really looks li=
ke
> an incorrect backport.
>=20
> Dinghao, can you have a look ?
>=20

Thanks for the regression report. I'm adding it to regzbot (as stable-speci=
fic
one):

#regzbot ^introduced: 2cdec9c13f81

--=20
An old man doll... just what I always wanted! - Clara

--PoPuT7NtGdw9ffR9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZSjYCwAKCRD2uYlJVVFO
oyWYAP40Z+sVvyaa9jLDWR9cZbUp77xO7jSpRp0tmZeZB3tb5QD/VHamAOmYGs2a
CZy64ZA8XKIpVn4CNkbvqL3OParn2gE=
=43B7
-----END PGP SIGNATURE-----

--PoPuT7NtGdw9ffR9--

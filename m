Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A535172E3;
	Tue, 13 Oct 2026 16:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791908840; cv=none; b=r3R9To4uyXFgPZ/tSI2izNuSQvmCCZk5cKxIzLvuzJhgOeBCtvqzgiPlF8hxM3uUa/zYSfx3jNmGmdWGjD904NpLUViGoS6eiqLIxxJvKOpnlaaw4w9cTcrjxdgch0sHrkfxOk+6PDGyl4OFYBF64l1IMRMDfTI7DcmUuxpUx+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791908840; c=relaxed/simple;
	bh=shKJgZGIZFLzoHitxdERk+7/62vgv0+CoGsFsHHoCMI=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=uz8nRdy6b7ITh5WEkDkN64JIhSolVDT5pIkWvsA185DoxkGXfDgQQ1F4Me0V+WlBeuEPuyyyehEzGd++9BvN0uo2R7GgQKAGxQUR+cX9ByjXuXox0CFeox3HNGAYa2cu0p9AXhLMNm0v0bY8gGizAYnyIaQkMyo7AGRVY/Pg3dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rgP43o8L; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rgP43o8L"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c68:46f5:32b8:ff94:7599:1aae])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E2C34230;
	Tue, 13 Oct 2026 18:25:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791908714;
	bh=shKJgZGIZFLzoHitxdERk+7/62vgv0+CoGsFsHHoCMI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=rgP43o8LhCvfC1SbvJSrRxJBUKppE11ZS1DuyXq90Y1itX2aXXxg9jpzh04btvdef
	 PNIfKLPD9vUyQzBrktYA8hYLLCrX/1+e6tju1cWcO8Hq0DsYaUEamUaqy7i0aPNFd0
	 8ZFsaEhLIF4rnDgE6xA2AYDNli+Tt/QAE6qLw4Mc=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261013131435.1454019-1-martin@wetterwald.eu>
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com> <20261013131435.1454019-1-martin@wetterwald.eu>
Subject: Re: [PATCH] platform/raspberrypi: vchiq: register bus at subsys_initcall
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stefan Wahren <wahrenst@gmx.net>, Phil Elwell <phil@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Umang Jain <uajain@igalia.com>, Kees Cook <kees@kernel.org>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, regressions@lists.linux.dev, Martin Wetterwald <martin@wetterwald.eu>
To: Florian Fainelli <florian.fainelli@broadcom.com>, Martin Wetterwald <martin@wetterwald.eu>
Date: Tue, 13 Oct 2026 21:57:10 +0530
Message-ID: <179190883032.11414.8457896168331458036@freya>
User-Agent: alot/0.13.dev38+g8e372ce37.d20260925

Hi Martin,

Thanks for the quick fix.

Quoting Martin Wetterwald (2026-10-13 18:44:35)
> Since the VCHIQ interface was moved out of staging, its bus is no longer
> guaranteed to be registered before its client drivers. bcm2835-audio,
> still in drivers/staging, registers at device_initcall level and now
> runs first:
>=20
>   Driver 'bcm2835-audio' was unable to register with bus_type
>   'vchiq-bus' because the bus was not initialized.
>=20
> Register the bus and the platform driver at subsys_initcall so the bus
> exists before any client driver, independently of link order. The
> platform driver probe already returns -EPROBE_DEFER while the firmware
> is not ready, so probing earlier is safe. When built as modules, this is
> equivalent to module_init() and nothing changes.
>=20
> Tested on Raspberry Pi 1B rev2, 1B+, 2B, 3B and 4B with VCHIQ and
> bcm2835-audio both builtin and both as modules.
>=20
> Fixes: aa125180c673 ("platform/raspberrypi: Destage VCHIQ interface")
> Reported-by: Martin Wetterwald <martin@wetterwald.eu>
> Link: https://lore.kernel.org/r/CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R=
272j6Bs4tg@mail.gmail.com/
> Closes: https://lore.kernel.org/r/CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio=
5R272j6Bs4tg@mail.gmail.com/
> Signed-off-by: Martin Wetterwald <martin@wetterwald.eu>

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>

Thanks,
  Jai

> ---
>  drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c b/d=
rivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
> index e78641703252..d35f5ac5c2e2 100644
> --- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
> +++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
> @@ -1462,7 +1462,7 @@ static int __init vchiq_driver_init(void)
> =20
>  	return ret;
>  }
> -module_init(vchiq_driver_init);
> +subsys_initcall(vchiq_driver_init);
> =20
>  static void __exit vchiq_driver_exit(void)
>  {
> --=20
> 2.55.0
>

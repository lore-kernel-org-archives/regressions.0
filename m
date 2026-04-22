Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7657D3DE430
	for <regressions@lists.linux.dev>; Wed, 22 Apr 2026 12:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776861386; cv=pass; b=jEyOqRN/YTNzYVuQasOnuTng+1GDWdyXPJ20jD3EJ6eZ1XaKuYazHFqfgM30FjjviDxRR4aBFqgX/cUDvdecLRLcTj1cPkPlR6Qso6K9UkuoX4UStypvpRlLFoD/G4aKmTt9C46dpExo/wamZORdR9FVpZSSBVZqfGPwZD60u0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776861386; c=relaxed/simple;
	bh=Z+fpeHyzZDcw59xaiG77ldoRBDmq2F4C7+ZCK7janFE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ciWdIzTl+yeDkAVV7icxFP0OSyF+pKyTvYSi8XaJsdij5Ri/LP95AuffT/sfPgRxaxXnmuAjxf53oAx/mO829ApBjv0PRbMiq9C5tPqT+M3cKBIiq3qzKWPYja+u6v6455KTJxdSZ2NwMhpQyYtTV6L5JL1bfNZ6ewtrgx3jQmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pe0UiZ9V; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pe0UiZ9V"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6634bb959a2so7474135a12.1
        for <regressions@lists.linux.dev>; Wed, 22 Apr 2026 05:36:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776861381; cv=none;
        d=google.com; s=arc-20240605;
        b=ljf1dGLlEsBset+Rwar0x7OUMQp/JuqZ2x+XYE92IqU23+C6VHzeYoNhfiIAKmzBcc
         8WrEF2XSO0+WgV44NGUoUUwO5SoBN3OIfT75Mu3JTZnIEB7BmMiPITsaWN5wB3YGltCz
         2iLQctzDjZ2TE8IsreS0I0oVhiKjcXUnwfB1lNBY6ScDucf12P4xofeLbPunpYW8/Q8D
         suqSudEzoYIgQ/ybARZVIzzIgfPsFDUJ5RIIAjkPQgI72aVqQY6XPqGnpfkqQC6xXVNG
         B8TEvRdr3ngCrdV423hFIydA5NqSeCH5x0F4ZrLWfTvCN+W3PSeZAfEqUbIeyxTkZmbx
         3PjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N6YjFqGBtJU0cul8X9lP9Xhlf/J/5zOSe7U09Cg9PaM=;
        fh=7Id7wCJe1bPBH8iOViIqtaZbewXQPZIHLGn4yPkSzMw=;
        b=c3XnurWK6a+8uYoQ3VXFAwhaVr74GM5jmHjstktZD972iUhJTs6FxTHL40+a6UJNeI
         WNR6Vpe7KKmFT8MGgWqIH8qOBkO2Z7OEbuPQ017I0PxT52hkvgUX+/hdbgeM40YGIfDF
         kzODy1j6FrdxpdUqhgmzI4z4Mib8PLe8hWUsW2lFRAZ+vgJbGdiS5kYxptTC2DSKfJpU
         +T6yu/mfL4cYlZ+G2CeUL/77wI0Kqcpx137pLd0JzHj/mLwPBmiC1alskDCh73FkJ+Lv
         hGRdbUQ5JNBdlDdUYQcObop4NazHF6lp4vaDUKsOvAv27UgnV0OM9nYBTMelQMP5yns2
         OiBA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776861381; x=1777466181; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6YjFqGBtJU0cul8X9lP9Xhlf/J/5zOSe7U09Cg9PaM=;
        b=Pe0UiZ9VteZdPXb/+Mdi9dfz4rGk49Gi6DqeLbvAgomMiy/szRHwhX+4X3XWKHhIy5
         WSnnSgRhYhFM6YYUSuJnYezOPug3/ssFNv8+FkslazLIS8j8vctnmYxjOP3h1GAHnif7
         xLrmDXt4G5T7p4qG7ITXDXVOVj5C9uQFnAuoD8EZ36kgGS3H7EuExOpBdsr0sQIb9qle
         jOLSQ/2JrGbwVJx9FfGRii5kpFOdtMpRFgEhuJrt+hanXeZKr8i3xZ6x065WkESXr8zc
         T3ygMK1qR27HC9dwuPa9V/SDYs/R+A5tXN/lqlMESsel0DU/GIrF7JFYY+isKy/5gFiL
         I8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776861381; x=1777466181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N6YjFqGBtJU0cul8X9lP9Xhlf/J/5zOSe7U09Cg9PaM=;
        b=mD+2dboftRtTE00WvX5QC/2rHsDarT23O/DzkLSxXivZh0bkF7y5SG5YytHyi/SuZp
         EQchEevv1N9Myrgfm2nAHPYp5+u8U+ZhUAduRDXAB2TVu0SkbjxfoVgjmvuW41JlDz0a
         wSZkkVpmvOdaQlCemM4rhr7z0LD0Zie7enV8uDujVtGVrwHGIv7jPV8yuE/cNCc7YkSN
         Dv1oS+b++vp3RPFqvdozujJHCwYZ9P9yfFY0O/aer9r/3jLvURGSh3EjzJ+pPr9gm/pt
         FoHgHHrZ2luayjIdjCl0FaX766VxwSzXQRa1hMaeBT8Vnn2qeHcu/AfJJInJGmWbf6m6
         gVLQ==
X-Gm-Message-State: AOJu0Yz7tSoo5iKErGJ8eWmJb/nh9G2X033PMknxfnIVdY4d5IG//0OG
	rR8FBu9gbVxC3n8igeI/K5guc+3Yx1g4ox99wLhywZKawcb4Y0xCwNVZB0J2rrwAAnW5hITsKXa
	fJYNat0MfgqxoapSl9mkm/x1VTtySWiY=
X-Gm-Gg: AeBDietLXiFQFUvNaVnvC3JlKCw0XAsrfXfmCa/dMcNl+R3Bw374UIVTeNQ2EP7IB0k
	VW7K36IB0GjZsUtHMwgsq/gmY8itOwk1IM8t9OaE+w72puCtQIgOlnLpG6LNFGc0exaK4igLEtu
	lV7pefvRtncaNNxEqlKQ/XMRK0+SuuIbxsHId6PJVK1Nmccch7JhIXKnR3IIYvXhYaHYK6AksqY
	K9UhvU8VSjr9qg3d6y6U59nRPB6Vi7jBc8ipiJLTxiQSAk/RZkCwSj5NGbZYxcQZivxgssa1sLa
	jukvTAtxiwb7L6rnUg==
X-Received: by 2002:a17:907:96a1:b0:ba7:fbfb:4caf with SMTP id
 a640c23a62f3a-ba7fbfb4d91mr657508366b.43.1776861380344; Wed, 22 Apr 2026
 05:36:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <12879883.O9o76ZdvQC@rafael.j.wysocki> <168591776860440@mail.yandex.ru>
In-Reply-To: <168591776860440@mail.yandex.ru>
From: Evgeny Sagatov <evgeny.sagatov@gmail.com>
Date: Wed, 22 Apr 2026 15:36:08 +0300
X-Gm-Features: AQROBzDtGf9k7R1EsVMKW6DV83lURu0DqePYdX100Md0YGa0t--tWKYIatVxa1A
Message-ID: <CAGAxtY1QDN_vkXEzdT8yUC5ZR3W+18TypEcJLR+-=kUkaBOdTw@mail.gmail.com>
Subject: Re: Pressing the power button causes the device to freeze completely
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: regressions@lists.linux.dev, linux-acpi@vger.kernel.org, 
	Thorsten Leemhuis <regressions@leemhuis.info>, LKML <linux-kernel@vger.kernel.org>, 
	Wysocki Rafael J <rafael.j.wysocki@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Rafael,

I applied the patch that you sent.
The PC isn't responding to the power button press. It doesn't freeze.

I just want to clarify, did you receive messages where we found the
first broken commit using git bisect?

> 8c94ccc7cd691472461448f98e2372c75849406c    good
> e37617c8e53a1f7fcba6d5e1041f4fd8a2425c27    good
> b0d326da462e20285236e11e4cbc32085de9f363    bad

I'm getting messages that my emails couldn't be delivered, so I'm
using another email address.

----
Sincerely, Evgeny Sagatov

> On Tuesday, April 21, 2026 5:11:36 PM CEST Wysocki, Rafael J wrote:
>
>  Hi,
>
>  On 4/13/2026 6:46 PM, Evgeny Sagatov wrote:
>  > Hello,
>  > I have a PC with a motherboard GA-EP45T-UD3LR (Rev. 1.0)
>  > <https://www.gigabyte.com/Motherboard/GA-EP45T-UD3LR-rev-10> and
>  > processor Intel Core 2 Quad Q9550.
>  > Previously, I had Debian 12 with kernel 6.1 installed, and pressing
>  > the power button would shut down the PC as usual.
>  > I updated to Debian 13 with kernel 6.12.74, and now pressing the power
>  > button causes the PC to freeze completely.
>  > I see that systemd doesn't even begin to shut down. It freezes
>  > immediately after pressing the button. There's no error message in
>  > console. There's no error message in the logs either. Netconsole
>  > doesn't report any errors, and the kernel doesn't panic. It just
>  > freezes completely.
>
>  It looks like the ACPI button notify handler crashes on your system for
>  some obscure reason.
>
>  It should be possible to get to the bottom of it, but it will require
>  some investigation if you have the motivation and time to run debug patc=
hes.
>
>
>  > I checked that Live CD with Debian 12 continue to shut down normally,
>  > but Live CD with Debian 13 freeze.
>  > I tried updating and resetting the BIOS. I tried various kernel
>  > parameters related to ACPI settings. I also tried kernels 6.18 and
>  > 6.19. Nothing fixed the problem.
>  > If I unload the "button" module, the system doesn't freeze, but it
>  > also doesn't shut down.
>
>  This is a useful data point, thanks!
>
>
>  > I built "button" module by rolling back its version to commit 1a20d40
>  > <https://github.com/torvalds/linux/commit/1a20d409c874255086e2f42a7298=
26d490294c91>,
>  > which corresponds to kernel version 6.1. This module does not freeze,
>  > but does not turn off the PC either.
>  > I've found that the freezes have been occurring since commit 0d51157
>  > <https://github.com/torvalds/linux/commit/0d51157dfaac05ea66616d8a250d=
ce04bef49a4f>.
>
>  The main difference made by it is the fixed events handling and if there
>  is a problem with that, a few debug patches should suffice to find out
>  what's going on. I'll send you one to try shortly.
>
>
> First off, on top of 7.0.0 (since the issue is present in this one, I thi=
nk
> it's better to focus the debugging on it), let's first check what happens=
 if
> the ACPI fixed event handler is not installed for the power button at all=
.
>
> This should be similar to using a 6.1 version of the button driver (that =
is,
> no crash, but pressing the power button will have no effect).
>
> Please test the patch below and let me know what happens.
>
> ---
>  drivers/acpi/button.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> --- a/drivers/acpi/button.c
> +++ b/drivers/acpi/button.c
> @@ -628,9 +628,7 @@ static int acpi_button_probe(struct plat
>
>          switch (device->device_type) {
>          case ACPI_BUS_TYPE_POWER_BUTTON:
> - status =3D acpi_install_fixed_event_handler(ACPI_EVENT_POWER_BUTTON,
> - acpi_button_event,
> - button);
> + status =3D AE_OK;
>                  break;
>          case ACPI_BUS_TYPE_SLEEP_BUTTON:
>                  status =3D acpi_install_fixed_event_handler(ACPI_EVENT_S=
LEEP_BUTTON,
>
>
>
>
>
> -------- =D0=9A=D0=BE=D0=BD=D0=B5=D1=86 =D0=BF=D0=B5=D1=80=D0=B5=D1=81=D1=
=8B=D0=BB=D0=B0=D0=B5=D0=BC=D0=BE=D0=B3=D0=BE =D1=81=D0=BE=D0=BE=D0=B1=D1=
=89=D0=B5=D0=BD=D0=B8=D1=8F --------

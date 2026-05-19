Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0262E47DFA9
	for <regressions@lists.linux.dev>; Tue, 19 May 2026 10:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779184949; cv=none; b=UZQFM4fv2mTN3yCRkO7qNYL3TUK5rE7M6ehuXIj+iHTvYAkVtAzJuoqo41KPtkMwwmrZWN1mR1EaRuTUm0+o6i1wkzENsD2TgIJA9ZyAczT9DcnYyp4es61nRp95Kohg9st9TjecjEMGuynyUFdc9MG/pntNW3Ta8VX9MKf6ts0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779184949; c=relaxed/simple;
	bh=M7i+L/yg48jVw5kyal978n+1Wkllzl2xuJ6g2ROgz8A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NMzR0s86D2G1n6Cm+Tz94PBAR4XrAd7YwiK0OfW0tue1vsSXks8LNiyMLQflChNxlD4h8ss/9xrhCSG/9g6c8lQsMzzIbb4PJJo6Y+M5mMKNliBne8uSD5Zy6JbQjR8w0N+ao43JRySV4ZX1DWZ2oTbWBj6XWU+lWcFpJ4vWbqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jSXgP1oM; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jSXgP1oM"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48d146705b4so36371635e9.3
        for <regressions@lists.linux.dev>; Tue, 19 May 2026 03:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779184946; x=1779789746; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQqlGnc/jDs+MXoZVL796rxuKZbHr/asBBcZ0ydezGs=;
        b=jSXgP1oMW2CfHg+FoZx9+Mfe+39VxOwMUr3D25om7y4wsbIcXHfdkoonJj80UvmfHn
         mq6LBILMFLWX52kM/lNpcmM7xAPOJXcH53L9DVZrj5tPX+nkGesqf8QV0/AwtKJ7eILU
         k/s0s626NxUtMIqtMljS0Z8lc651sBNMGDwOhULVBgK4EV+bG/bzP9CqntwukyODMe2P
         urU1vMU+BLt219QsFPJMEWiUJhaUY5xbjpf6Z4r0bnDAkLa/yOxgRMr0Cl9R/gH/5s/5
         0zywifDACu2Cy54bgcGmmMiThFHHB4pnEswKxB+tGTPBTvBZddnv57UBEAQo1mZijdjs
         UGcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779184946; x=1779789746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nQqlGnc/jDs+MXoZVL796rxuKZbHr/asBBcZ0ydezGs=;
        b=Qm1p5b25qfy3m+mtzfGB6UwsdiNYj3U/PrK2InJAhNNg+gYiG21LhTsjOUjRuZySrP
         uUAjOfz7vW/xqcH/3vk+YPj16v72YSelB/13FKy2HJe4LKubOC/DmaO2vnXH5TcNW4Zl
         /WOixTc39F4pSPikaE3A33k1e6hPTLwSwkqyyYrrlQlyRgashJbz8GnetN2ozkMXXUN0
         RNTqyDvFUcj/isBp8iOtfBAOg15OPJhDaoZdlJHciPZwvFOEROUoADXxYVfhhjM6hX3n
         36LdOUbIBg7elyXuqltYkU3KGDaCM/aGD/xt4OkYOWHPw6nPglZKln/5IcV9x07/z3UF
         N+Mw==
X-Forwarded-Encrypted: i=1; AFNElJ+3a/1aqSVX5jGOR7NxAFTBA0ch9GBNokikw9qBoDWrV3TMU9k7RwVr0LmieyjaAAbkz0RHuvaJCLwtFA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxcTAl9CRMkfHVZo2EszQee6aL2iT7K6tc5VososvS2kos75VRu
	j6aDr0jL2uMm9Fe+lBD57m1D4EnjHEWCcginU+6KdtREw5EeKIsHhJKC4Q80aTiHyDw=
X-Gm-Gg: Acq92OFQ3AUa6991B8AT/4r/i3x806rwK5DkF2WMK5LIgQJrhmSSPnQsZibYfwyv9P6
	/uluAgYJ3Zjc18tRUBwvW/ewXrmVWWNwdLLKYWeSkLmy3dot2bPwOzW6H6IugA3WmrKctBZy22X
	KLJzQddxwlcrg2CJuxJG7VO63P4OgKIFSm1agl+567HNhYtVHVHQ07xeOIGnDE9brvkbgRuvVPm
	POgHOnRNQJHyEgvYtOOy74ESXt3l1PPhHQ9L1ItQ1yrlbiTWpTHiIjY4s7NJo1heTFnJu75mYxO
	BA8gK8601wU1rCoPAr0ZCVl3LY57BOf+f8ZoQTU3hKPjZ3/A4K7rxQtoopMnmvkYRigNgkH75wU
	Yws6g6F5sv/Pw9srIrrfERna/iBM3HDY4A6wucSKqDFGIkfecGuUmUL6ha5qSWVb+QssN33WB4Y
	hWhUgajsIyjQ6ORbUijl9LV6cz5wkd14HzoGDYODiUGKp1C/XWG1NnLYjTnqeiyR4y
X-Received: by 2002:a05:600d:b:b0:48e:8741:fd42 with SMTP id 5b1f17b1804b1-48fe60ee64amr222114445e9.12.1779184946374;
        Tue, 19 May 2026 03:02:26 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febf86db7sm155106115e9.6.2026.05.19.03.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 03:02:25 -0700 (PDT)
Date: Tue, 19 May 2026 11:02:23 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Tony Rodriguez <unixpro1970@gmail.com>
Cc: davem@davemloft.net, sparclinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, andreas@gaisler.com, thuth@redhat.com,
 regressions@lists.linux.dev, glaubitz@physik.fu-berlin.de
Subject: Re: [PATCH 0/1] sparc64: unify thread stack sizing and add explicit
 32KB stack
Message-ID: <20260519110223.5aeb88e3@pumpkin>
In-Reply-To: <20260519075809.8993-1-unixpro1970@gmail.com>
References: <20260519075809.8993-1-unixpro1970@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 19 May 2026 00:57:54 -0700
Tony Rodriguez <unixpro1970@gmail.com> wrote:

> This patch fixes a reproducible stack exhaustion issue on SPARC64
> that occurs during USB hub enumeration. This regression may have
> started sometime after kernel v6.12. With the default 16KB kernel
> stack, the following panic is triggered early in boot:
>=20
>     [   25.528399] Call Trace:
>     [   25.528403] [<0000000000433cd4>] dump_stack+0x8/0x18
>     [   25.528419] [<00000000004297ac>] vpanic+0xdc/0x318
>     [   25.528429] [<0000000000429a0c>] panic+0x24/0x30
>     [   25.528436] [<0000000000be2280>] __schedule+0xa8/0x7bc
>     [   25.528445] [<0000000000be2b60>] schedule+0x24/0x4c
>     [   25.528452] [<0000000000be6970>] schedule_timeout+0xc8/0xe4
>     [   25.528459] [<0000000000be3318>] __wait_for_common+0x78/0xf0
>     [   25.528466] [<0000000000be3550>] wait_for_completion_timeout+0x1c/=
0x2c
>     [   25.528473] [<000000001005e2f4>] usb_start_wait_urb+0x68/0x128 [us=
bcore]
>     [   25.528502] [<000000001005e468>] usb_control_msg+0xb4/0xf8 [usbcor=
e]
>     [   25.528518] [<0000000010051180>] set_port_feature+0x44/0x54 [usbco=
re]
>     [   25.528530] [<00000000100530f0>] hub_power_on+0xc8/0xe8 [usbcore]
>     [   25.528543] [<0000000010054fd8>] hub_activate+0x12c/0x644 [usbcore]
>     [   25.528557] [<0000000010059438>] hub_probe+0xdd4/0xeb0 [usbcore]
>     [   25.528570] [<0000000010062360>] usb_probe_interface+0x234/0x26c [=
usbcore]
>     [   25.528585] [<0000000000a10a40>] really_probe+0x1ac/0x3b0
>=20
> This is caused by large SPARC64 trapframes, register-window spills,
> and deep call paths in usbcore. A 16KB stack is insufficient for
> this workload.

Increasing the stack size for all threads seems overkill.
That stack doesn't even look deep.
I suspect there are large on-stack buffers in there.

Unfortunately the traceback doesn't print the stack pointers making
debugging hard.

-- David

>=20
> The new logic is:
>=20
>     SPARC64:
>         THREAD_SIZE =3D 4 * PAGE_SIZE (32KB)
>         THREAD_SHIFT =3D PAGE_SHIFT + 2
>         THREAD_SIZE_ORDER =3D 2
>=20
>     Non=E2=80=91SPARC64 with PAGE_SHIFT =3D=3D 13:
>         Retains the existing 16KB stack behavior
>=20
>     Fallback:
>         Retains the existing 8KB stack behavior
>=20
> Signed-off-by: Tony Rodriguez <unixpro1970@gmail.com>
>=20
>=20
> Tony Rodriguez (1):
>   sparc64: unify thread stack sizing and add explicit 32KB stack
>=20
>  arch/sparc/include/asm/thread_info_64.h | 28 ++++++++++++-------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
>=20
> --
> 2.53.0
>=20
>=20


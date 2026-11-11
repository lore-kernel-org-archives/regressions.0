Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794381374;
	b=PmonkbBoaVTxTyOvcds/e/PVsUWEXkBVw0mcO99VJ1vZZFXI8mC0UHbGA89coUu8Svlh
	 i4Z0am7clzET4oSG9RpIZQiNWki8rOtUYSQkMns/pAY9TpWob3eZmy/Qii+JyLi/ZDQiM
	 rbXfEAydRJhqpps22k076PgOBqcjHvZc8SjZh75CVaZAxcNlMts7g6H6+RYRaZHVPM4oF
	 /gV+Euf5S3gOZ4GQFEzt9OVLg41I44SYP99+bvWBPIljKJD38chE54mHm0nPt5TFgTxmI
	 kAmSkaNSukpZOWNNQn9y9+SMXUIIzjRZD6j3cXT8Is1qqSpicj7ccBA8iWfGoSl13Hw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794381374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=PS5LMiKFzIUnURDmLwbpwh2C/rUlEP4/H22PiA88mjc=;
	b=zT5IS5cXtxj1+CVmChy1cNja61x7+rvYRMM7x6HPewE2w4PThe4dZbf0reg4tZevFpUF
	 W6SU9tNYxh8jJfTg5BVVdvbrLYzgHJ9VwQVo2htX0KOc02NPp32UXZ0jyIEhV+Aa2yTjJ
	 z1GosiTSxLIzfpFgw7CafkoqrfjQX5HKQxSfbVOWNIu/3Aae19TbeYp9Is0b76eKaYnDR
	 eHSUtay38CTmpsZOvY4TlU13y45oHr5iqKVuZ2qmr7WbH08Tct5bUQYx9mltORa6gtJ63
	 8hw4bYRxcyWz3hFl6hdHP2C6WHInrQzAeetaNO0ZduYecdPBqQ0ThgJN6FALFD2Tx/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=Hh1kNipz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.50
Received: from mail-yx1-f50.google.com (mail-yx1-f50.google.com [74.125.224.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174DA606A320
	for <regressions@lists.linux.dev>; Wed, 11 Nov 2026 07:16:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 174DA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=Hh1kNipz
Received: by mail-yx1-f50.google.com with SMTP id 956f58d0204a3-67bfdab8f20so1862520d50.2
        for <regressions@lists.linux.dev>; Tue, 10 Nov 2026 23:16:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794381368; cv=none;
        d=google.com; s=arc-20260327;
        b=a1NhpVtk+y0zQZewmX9J65r4en/NaLmyIIU6VHnSpTgazDLPZUzqqZ8iBFp2hz6dbC
         3hrtNZ3oenXap0rY/+YrgkoZIwC54RkA26VdHpOwuZFkihgUXUR/3bZ2NIi9aEDYtjZO
         /lNag0W/k/DYp8XSoRqBuA8InZU/K9iSCtGLsu/uDPIV5w1UdNYjDuRb3l8QGSWgvfNm
         CM5JoxFb4+MEG6uuLsNB0wMizqMcXUU34VVncog5FAivahWXgyaFA60tjpoI0Y84BlNQ
         TR164ecDsot/4gh5N0zC5I/bc+DP9ON0vhe/iaLd5nOlsyZElaq+sulx8JoHR/acc65m
         tVtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PS5LMiKFzIUnURDmLwbpwh2C/rUlEP4/H22PiA88mjc=;
        fh=BxZUo3RIAFK9moWk89IsNBXW0uLLwXJBOXZCU4QuETc=;
        b=jKnka3GQe3EkjuDHzWjBcXfTdnKhoEIdKoohztWndeSo04sjow+IaZun79hiIBC5Qh
         5Gps0Q0uzdMvduLuoaEXCpeoYqSxPLCQ6SzExCZaF3NIKxtF09ajRxIY1sXSSLFV0sWs
         GR/a/mO5lv7QFcbw/LmQdMrb/7AE4f75vn+rHCSnTnm4n9foPunbPu0/JIYZ5l9kpOns
         yC7EHnnYy8O+SK2NRnZyO6yruoj/ZsfYVGee2+zAQtR2DaQwQmNhhqofdMQy0bdIL3Vd
         jhUaQFOU8hJt+qI/hcm73ONZobDQI18AqV8zqQ/y5RbzIEfd//U9Uuq/ANeIVALh44Pb
         H3Ig==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1794381368; x=1794986168; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PS5LMiKFzIUnURDmLwbpwh2C/rUlEP4/H22PiA88mjc=;
        b=Hh1kNipzn3g8fzXP4iBlyCHBMCE7/6xLYTPQoBv6/Qphr7FXAKvF+Bbj9xImqZseFh
         8YW5vXW97J5cQlthJJUtxTBAVPOrHzDuN5YDZK2Hy5XdD5m/WfSPA3bf73rlVZCBb80+
         yTbiTFliZYeeXwLBSmtpvUVgob8aJZwRbb1oA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794381368; x=1794986168;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PS5LMiKFzIUnURDmLwbpwh2C/rUlEP4/H22PiA88mjc=;
        b=MBURrRlRxfe9oRy+eJlXTKHdvad9NVRtPUtYsRXccCOF2/g5vVOX5Y7p5o0+VXtqgB
         7l/hMj96ro6aVS+B6kRtC4NTFHcytdoNjpZbvhnZnXQ8x/0MxNaJNLaX9G1msZPx2WUv
         a0Eff9EygBLDKCDTjp8qf/IlHAFpU7RZe6zWynVTS8zzu4UEozHxUe70ClJ8+XG4RfVz
         EwqecxRQ0cxYcaLL+g60zMeQ78G454br0aM5Ohgg8GAv6DW0AuYPTYBZ2bJ9lzTfkwWS
         wpzL9hwdinZCL/RIdCSg9b1INoo04/5PLLd4k0CskhNeIA5705YEmK/DDHmUWhr9E4F5
         UrGA==
X-Forwarded-Encrypted: i=1; AL+hErHdqscevDUWzuAbiGjcJVkRMC+ejU+6Wl3fOdfk/9uhP6lkgCTOWGmBX8wwkagih/BRCXQo1gT/w6EVZg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8sZCySxiqgT9YtxN2yJkVzp2/44jvYjjcGZBsLmyAl42hjSCSB
	FDKF5kACGb7J6en4qEe+hkv8Vi6TwZxOO68fWxs67KfPCv81dUlO8I4Y0KMH7iBdcg1eKHkkrH/
	Vc1MPrRnH/OLBUXEain/VdgxDBKKs5SLIMu4cruHAGw==
X-Gm-Gg: AYBFou1VnYnpc0k7wGGpB86V+kE0Q9NtIEpNT8XqyhNzRnc43an+c8P8/Ft3wBuYZHX
	Iexhkm10R/bVjJ58GVknOdWeXR6Afdg6kG8/FeDJ4jly056U/hPHVnHxgFX5e1q8LQ41+E5tItL
	3J1lRpjQ+Kmds+o+c3zxI6FpFbQ+0qNi2gEKypwTMu5ww7c3il+wAbTEWP7FOWbFeq786cxhujz
	jMIRSNk4c9KH7U0w+2La1/43nmn48DK4klIM1zObiyxpEPxjtBG5OtFZWyBYgp6uaCTxu/huBnv
	+vXsJdZ2mAQFVxwJQ9G8JlOLAu9DSBJeTjmzOkENLvupA5UwN5+eMzGyEoiMgR725nHWd7tp5bK
	+cVnYZE28vRl+PEtwonwsBclUJqYEAvpT8GpDHLc1WBYqtHQ1sUDgSNlbOgmZvC9cO0o=
X-Received: by 2002:a05:690e:1504:b0:677:cbfc:be28 with SMTP id
 956f58d0204a3-67c67f7bcdemr1039946d50.75.1794381368118; Tue, 10 Nov 2026
 23:16:08 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261030171910.2822677-1-dario.binacchi@amarulasolutions.com> <f5ddf27a-9771-4967-a9d0-13c09f588402@leemhuis.info>
In-Reply-To: <f5ddf27a-9771-4967-a9d0-13c09f588402@leemhuis.info>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Wed, 11 Nov 2026 08:15:57 +0100
X-Gm-Features: AclHuK_y6USQFhQ1AriRJr3BWyE_Wi1fKklRA36_ipXu6i6f67Qj9RIWxt--J7M
Message-ID: <CABGWkvor=2AWC06iRvONAAPu6b8SS-JnJYmeALCYg_r4bh3wtQ@mail.gmail.com>
Subject: Re: [REGRESSION] cpuidle: psci: boot stall/hang on i.MX8MP
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Ulf Hansson <ulfh@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Sudeep Holla <sudeep.holla@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Christian Loehle <christian.loehle@arm.com>, 
	Russell King <linux@armlinux.org.uk>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, linux-pm@vger.kernel.org, coresight@lists.linaro.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thorsten,

On Tue, Nov 10, 2026 at 10:12=E2=80=AFAM Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> On 10/30/26 18:19, Dario Binacchi wrote:
> > Hi Ulf,
> >
> > on an i.MX8M Plus Dual board (Engicam i.Core MX8M Plus), mainline
> > c339f4010dea sometimes stalls for ~0.9 s at boot, or hangs until the
> > watchdog resets the board, right after:
> >
> >   [    0.806123] ledtrig-cpu: registered to indicate activity on CPUs
> >
> > On a good boot the next message comes ~11 ms later.
> >
> > About 1 boot out of 3 stalls or hangs. With cpuidle.off=3D1, or
> > with commit 65705b18162b ("cpuidle: psci: Move initialization a bit
> > earlier in the boot sequence") reverted, 10 out of 10 boots are fine.
>
> Hmmm, nothing happened here. Might have fallen through the cracks, so
> maybe this mail will get thing rolling. If not, I'd suggest you submit a
> revert.
>
> Or was there progress or even a fix and I just missed it?

Sorry for not following up. I can't reproduce it anymore with
current mainline (b3dfbde62cf1, v7.4-rc2+) on my current setup, and
I'm not sure what changed. I'll keep an eye on it in my next tests
and report back if it shows up again.

#regzbot inconclusive: can't reproduce anymore

Grazie e ciao,
Dario

>
> Ciao, Thorsten
>
> > I haven't dug into it much. The stall seems to be in
> > pl330_driver_init(), so my guess is that it is related to the AMBA bus
> > reading the ID registers of the CoreSight ETMs while a CPU is already
> > in cpu_pd_wait, but I may well be wrong.
> >
> > Any idea?
> >
> > #regzbot introduced: 65705b18162b
> >
> > Thanks,
> > Dario
>


--=20
Dario Binacchi
Senior Embedded Software Engineer
M. +39 328 0625246
dario.binacchi@amarulasolutions.com
=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=
=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95=E2=80=95
Amarula Solutions SRL
 Via Felice Cavallotti 25D, 41012 Carpi, MO, IT
info@amarulasolutions.com
www.amarulasolutions.com

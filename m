Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010FA746C
	for <regressions@lists.linux.dev>; Tue, 22 Nov 2022 17:13:14 +0000 (UTC)
Received: (Authenticated sender: clement.leger@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id A2CC9100010;
	Tue, 22 Nov 2022 17:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669137192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=orfiAd5LKnRJ8BygCrbxkcrUjHZkPUXj65ZeSBEzh18=;
	b=cz9rcVLrqKAKNA0xjGj7Jq9dKbvuQJrDUseq3OsMsnccavP74j/Zv0B2jl+nTp9U5H50ao
	fzPWLBP2wPrJmNZ3Z0pTYM/+0XII6nDqRMSLrpBTD9001Dh5phd2No6Y+ECifNq7nAUnAs
	ANyxt9fWW2mMHHhB2x9Gfc4QjtTzX9ektlxGiVYHJJ4lfF2oVqrgESQ80ZShg6TBt5o3Xe
	oEsdqgSe/pQrMKAKv0RS5cTVa5WprTE7nJwgZPA83OwWdd21GYBN4VfjPlRYWF2A0YdmiD
	HLL4m+FMNBU2ZgdVROuF+0ZoblGoqGBBjvqLjqHzTVnPJsHoDlTcjw1BURXvmA==
Date: Tue, 22 Nov 2022 18:14:52 +0100
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Claudiu Beznea <claudiu.beznea@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, Peter Rosin <peda@axentia.se>,
 linux-kernel@vger.kernel.org, "regressions@lists.linux.dev"
 <regressions@lists.linux.dev>
Subject: Re: [PATCH] ARM: at91: fix build for SAMA5D3 w/o L2 cache
Message-ID: <20221122181452.6a386296@fixe.home>
In-Reply-To: <075d8c0f-5448-73aa-bd3f-0d4e1216e87f@leemhuis.info>
References: <b7f8dacc-5e1f-0eb2-188e-3ad9a9f7613d@axentia.se>
	<075d8c0f-5448-73aa-bd3f-0d4e1216e87f@leemhuis.info>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le Tue, 22 Nov 2022 16:13:40 +0100,
Thorsten Leemhuis <regressions@leemhuis.info> a =C3=A9crit :

> Hi, this is your Linux kernel regression tracker.
>=20
> On 12.11.22 16:40, Peter Rosin wrote:
> > The L2 cache is present on the newer SAMA5D2 and SAMA5D4 families, but
> > apparently not for the older SAMA5D3. At least not always.
> >=20
> > Solves a build-time regression with the following symptom:
> >=20
> > sama5.c:(.init.text+0x48): undefined reference to `outer_cache'
> >=20
> > Fixes: 3b5a7ca7d252 ("ARM: at91: setup outer cache .write_sec() callbac=
k if needed")
> > Signed-off-by: Peter Rosin <peda@axentia.se> =20
>=20
> Cl=C3=A9ment L=C3=A9ger and Claudiu Beznea: what's up here? Is there a pa=
rticular
> reason why this patch did get any feedback from you by now? It's ten
> days old and Peter already sent a kind of reminder a few days ago.

Hi Thorsten,

Sorry for the lack of answer, I'm not sure about the best solution to
tackle this problem. adding IS_ENABLED(CONFIG_OUTER_CACHE) seems like a
good way to avoid modifying the whole configuration. If ok for Claudiu,
I think it is the best thing to do since it will work for all cases.

Cl=C3=A9ment

>=20
> Reminder, ideally this regression should be fixed by now. For details
> see the section "Prioritize work on fixing regressions"  in
> Documentation/process/handling-regressions.rst (
> https://docs.kernel.org/process/handling-regressions.html )
>=20
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>=20
> P.S.: As the Linux kernel's regression tracker I deal with a lot of
> reports and sometimes miss something important when writing mails like
> this. If that's the case here, don't hesitate to tell me in a public
> reply, it's in everyone's interest to set the public record straight.
>=20
> > ---
> >  arch/arm/mach-at91/sama5.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > Hi!
> >=20
> > I'm not sure this is the correct solution? Maybe SAMA5D3 should bring
> > in CONFIG_OUTER_CACHE unconditionally instead? But that seems like a
> > bigger change, and not just a tweak of the regressing commit...
> >=20
> > Cheers,
> > Peter
> >=20
> > diff --git a/arch/arm/mach-at91/sama5.c b/arch/arm/mach-at91/sama5.c
> > index 67ed68fbe3a5..bf2b5c6a18c6 100644
> > --- a/arch/arm/mach-at91/sama5.c
> > +++ b/arch/arm/mach-at91/sama5.c
> > @@ -26,7 +26,7 @@ static void sama5_l2c310_write_sec(unsigned long val,=
 unsigned reg)
> >  static void __init sama5_secure_cache_init(void)
> >  {
> >  	sam_secure_init();
> > -	if (sam_linux_is_optee_available())
> > +	if (IS_ENABLED(CONFIG_OUTER_CACHE) && sam_linux_is_optee_available())
> >  		outer_cache.write_sec =3D sama5_l2c310_write_sec;
> >  }
> >   =20



--=20
Cl=C3=A9ment L=C3=A9ger,
Embedded Linux and Kernel engineer at Bootlin
https://bootlin.com

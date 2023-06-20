Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4802AB20
	for <regressions@lists.linux.dev>; Tue, 20 Jun 2023 16:40:33 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1qBeP2-0004X4-6C; Tue, 20 Jun 2023 18:40:24 +0200
Message-ID: <36f8e93b2659c7edc4d937d21b44c38e3b972d15.camel@pengutronix.de>
Subject: Re: Regression: serial: imx: overrun errors on debug UART
From: Lucas Stach <l.stach@pengutronix.de>
To: Stefan Wahren <stefan.wahren@i2se.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>, Linux regressions mailing list
	 <regressions@lists.linux.dev>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, Jiri Slaby
 <jirislaby@kernel.org>, Stefan Wahren <stefan.wahren@chargebyte.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sergey Organov <sorganov@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 linux-serial@vger.kernel.org, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
 <u.kleine-koenig@pengutronix.de>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Fabio Estevam <festevam@gmail.com>, Tomasz
 =?UTF-8?Q?Mo=C5=84?= <tomasz.mon@camlingroup.com>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>
Date: Tue, 20 Jun 2023 18:40:21 +0200
In-Reply-To: <ce8ab025-cdc9-b3fc-7628-0ea2018d4561@i2se.com>
References: <20230325151100.mskydt3hwbnspqp4@pengutronix.de>
	 <cb16ddb7-f22f-d637-8670-bccc77add0af@i2se.com>
	 <87mt3ynsa7.fsf@osv.gnss.ru>
	 <d5009984-d2eb-0343-5bb4-df8a7f526121@i2se.com>
	 <87sfcy8ncu.fsf@osv.gnss.ru>
	 <534ac8db-ae8f-1ea3-9aa9-2105db7f7a52@i2se.com>
	 <203ce87f-2898-eb10-2f8c-f237859d75e6@leemhuis.info>
	 <87ttw2vnn0.fsf@osv.gnss.ru>
	 <d1b6209d-a174-406a-cc81-86b391940c0c@i2se.com>
	 <3853881c-976f-dadc-b64b-4ffd8cc88cf0@leemhuis.info>
	 <2023062046-jersey-facecloth-7a5d@gregkh>
	 <ce8ab025-cdc9-b3fc-7628-0ea2018d4561@i2se.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: regressions@lists.linux.dev

Am Dienstag, dem 20.06.2023 um 18:30 +0200 schrieb Stefan Wahren:
> Hi Greg,
>=20
> Am 20.06.23 um 16:59 schrieb Greg Kroah-Hartman:
> > On Tue, Jun 20, 2023 at 04:47:10PM +0200, Linux regression tracking (Th=
orsten Leemhuis) wrote:
> > > On 24.05.23 15:07, Stefan Wahren wrote:
> > > >=20
> > > > Am 23.05.23 um 21:44 schrieb Sergey Organov:
> > > > > "Linux regression tracking (Thorsten Leemhuis)"
> > > > > <regressions@leemhuis.info> writes:
> > > > >=20
> > > > > Solving this would need to identify the cause of interrupts being
> > > > > disabled for prolonged times, and nobody volunteered to investiga=
te this
> > > > > further. One suspect, the Linux serial console, has been likely e=
xcluded
> > > > > already though, as not actually being in use for printk() output.
> > > > >=20
> > > >=20
> > > > I don't think that we can exclude the serial console as a whole, i =
never
> > > > made such a observation. But at least we can exclude kernel logging=
 on
> > > > the debug UART.
> > >=20
> > > Stefan, just wondering: was this ever addressed upstream? I assume it=
's
> > > not, just wanted to be sure.
> > >=20
> > > I'm a bit unsure what to do with this and consider asking Greg for
> > > advice, as he applied the patch. On one hand it's *IMHO* clearly a
> > > regression (but for the record,  some people involved in the discussi=
on
> > > claim it's not). OTOH the culprit was applied more than a year ago no=
w,
> > > so reverting it might cause more trouble than it's worth at this poin=
t,
> > > as that could lead to regressions for other users.
> >=20
> > I'll be glad to revert this, but for some reason I thought that someone
> > was working on a "real fix" here.  Stefan, is that not the case?
>=20
> i can only repeat the statements from 23.5.:
>=20
> Unfortunately my time budget to investigate this issue further is=20
> exhausted, so i stopped working at this.
>=20
> In case someone can give clear instructions to investigate this further,=
=20
> i will try to look at it in my spare time. But i cannot make any promises=
.
>=20
If the cause is simply interrupts not being serviced for a long period
of time, the irqsoff tracer is usually a very good start to investigate
the issue. It might point to a smoking gun already.

Regards,
Lucas

> I'm not aware that some else is working on this.
>=20
> Best regards
>=20
> >=20
> > thanks,
> >=20
> > greg k-h
>=20


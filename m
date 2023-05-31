Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C671879
	for <regressions@lists.linux.dev>; Wed, 31 May 2023 08:57:46 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::225])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id B8EB3C0C07
	for <regressions@lists.linux.dev>; Wed, 31 May 2023 08:46:12 +0000 (UTC)
X-GND-Sasl: hadess@hadess.net
X-GND-Sasl: hadess@hadess.net
X-GND-Sasl: hadess@hadess.net
X-GND-Sasl: hadess@hadess.net
X-GND-Sasl: hadess@hadess.net
X-GND-Sasl: hadess@hadess.net
X-GND-Sasl: hadess@hadess.net
X-GND-Sasl: hadess@hadess.net
X-GND-Sasl: hadess@hadess.net
Received: by mail.gandi.net (Postfix) with ESMTPSA id F232A1C0008;
	Wed, 31 May 2023 08:46:02 +0000 (UTC)
Message-ID: <6d911cceaaf894754a1183a449d6d3deaf354bd8.camel@hadess.net>
Subject: Re: [regression] Since kernel 6.3.1 logitech unify receiver not
 working properly
From: Bastien Nocera <hadess@hadess.net>
To: Linus Torvalds <torvalds@linux-foundation.org>, Linux regressions
	mailing list <regressions@lists.linux.dev>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, Bagas Sanjaya
 <bagasdotme@gmail.com>, Filipe =?ISO-8859-1?Q?La=EDns?= <lains@riseup.net>,
  Jiri Kosina <jikos@kernel.org>, "open list:HID CORE LAYER"
 <linux-input@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 guy.b@bluewin.ch
Date: Wed, 31 May 2023 10:46:02 +0200
In-Reply-To: <CAHk-=whvhkSk6m8_AidhofgR9nq0Md+HbNad5r1RE69tZgbv6Q@mail.gmail.com>
References: <9b987585-0834-bb8c-3414-283c29f3f2ab@leemhuis.info>
	 <bec024d5-4088-00ae-f7b5-7188868b1707@leemhuis.info>
	 <b7717c43-74bf-b91d-d3ce-874493df602c@gmail.com>
	 <CAO-hwJ+At1J_yUpX2q_dJekzZ-PoTDAvxmkTk_e4Yu0Z338bEA@mail.gmail.com>
	 <55dda0bb-fe42-6dee-28ea-00121554d092@leemhuis.info>
	 <CAHk-=whvhkSk6m8_AidhofgR9nq0Md+HbNad5r1RE69tZgbv6Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.2 (3.48.2-1.fc38) 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2023-05-22 at 11:23 -0700, Linus Torvalds wrote:
> On Mon, May 22, 2023 at 5:38=E2=80=AFAM Linux regression tracking (Thorst=
en
> Leemhuis) <regressions@leemhuis.info> wrote:
> >=20
> > FWIW, in case anybody is interested in a status update: one
> > reporter
> > bisected the problem down to 586e8fede79 ("HID: logitech-hidpp:
> > Retry
> > commands when device is busy"); reverting that commit on-top of 6.3
> > fixes the problem for that reporter. For that reporter things also
> > work
> > on 6.4-rc; but for someone else that is affected that's not the
> > case.
>=20
> Hmm. It's likely timing-dependent.
>=20
> But that code is clearly buggy.
>=20
> If the wait_event_timeout() returns early, the device hasn't replied,
> but the code does
>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 if (!wait_event_timeout(hidpp->wait, hidpp-
> >answer_available,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 5*HZ)) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dbg_hid(=
"%s:timeout waiting for response\n",
> __func__);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 memset(r=
esponse, 0, sizeof(struct
> hidpp_report));
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D =
-ETIMEDOUT;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 }
>=20
> and then continues to look at the response _anyway_.
>=20
> Now, depending on out hardening options, that response may have been
> initialized by the compiler, or may just be random stack contents.

It's kzalloc()'ed in the 2 places it's used, hidpp_send_message_sync().

> That bug is pre-existing (ie the problem was not introduced by that
> commit), but who knows if the retry makes things worse (ie if it then
> triggers on a retry, the response data will be the *previous*
> response).
>=20
> The whole "goto exit" games should be removed too, because we're in a
> for-loop, and instead of "goto exit" it should just do "break".
>=20
> IOW, something like this might be worth testing.
>=20
> That said, while I think the code is buggy, I doubt this is the
> actual
> cause of the problem people are reporting. But it would be lovely to
> hear if the attached patch makes any difference, and I think this is
> fixing a real - but unlikely - problem anyway.
>=20
> And obviously it might be helpful to actually enable those dbg_hid()
> messages, but I didn't look at what the magic config option to do so
> was.

Thomas Wei=C3=9Fschuh's patch ("HID: use standard debug APIs") linked all
those debug calls to the dynamic debugging system, so something like
this will work after boot:
echo 'file hid-logitech-hidpp.c +p' > /sys/kernel/debug/dynamic_debug/contr=
ol

Adding this to the kernel command-line to get some debug during boot
should work:
dyndbg=3D"file hid-logitech-hidpp.c +p"

In both cases, check it's enabled and that the messages can be printed
with:
grep -i hidpp /sys/kernel/debug/dynamic_debug/control

> NOTE! Patch below *ENTIRELY* untested. I just looked at the code when
> that commit was mentioned, and went "that's not right"...

I sent a similar patch before seeing your version, in answer to a
separate report I was sent. It doesn't change the style of the code,
and just fixes that one omission:
https://patchwork.kernel.org/project/linux-input/patch/20230531082428.21763=
-1-hadess@hadess.net/

Cheers

>=20
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Linus


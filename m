Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC361FA4
	for <regressions@lists.linux.dev>; Thu, 18 May 2023 05:52:00 +0000 (UTC)
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 34I5iEWN1001346, This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36506.realtek.com.tw[172.21.6.27])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 34I5iEWN1001346
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Thu, 18 May 2023 13:44:14 +0800
Received: from RTEXMBS06.realtek.com.tw (172.21.6.99) by
 RTEXH36506.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Thu, 18 May 2023 13:44:23 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXMBS06.realtek.com.tw (172.21.6.99) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Thu, 18 May 2023 13:44:23 +0800
Received: from RTEXMBS01.realtek.com.tw ([fe80::4d7:e49a:674a:598]) by
 RTEXMBS01.realtek.com.tw ([fe80::4d7:e49a:674a:598%5]) with mapi id
 15.01.2375.007; Thu, 18 May 2023 13:44:23 +0800
From: Kailang <kailang@realtek.com>
To: Takashi Iwai <tiwai@suse.de>, "Joseph C. Sible" <josephcsible@gmail.com>
CC: Bagas Sanjaya <bagasdotme@gmail.com>,
        "regressions@lists.linux.dev"
	<regressions@lists.linux.dev>,
        "perex@perex.cz" <perex@perex.cz>, "tiwai@suse.com" <tiwai@suse.com>,
        "alsa-devel@alsa-project.org"
	<alsa-devel@alsa-project.org>
Subject: RE: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000 on warm boot
Thread-Topic: Fwd: [Bug 217440] New: ALC236 audio disappears from HP 15z-fc000
 on warm boot
Thread-Index: AQHZhdSOD7kY6mXBDkGA3ryhp811r69Yu5SAgAASNACAAA22gIAA7n+AgAEJrYCABLe/YA==
Date: Thu, 18 May 2023 05:44:23 +0000
Message-ID: <415d4bc84aa74c74af913048f28b42a9@realtek.com>
References: <bug-217440-225600@https.bugzilla.kernel.org/>
	<CABpewhE4REgn9RJZduuEU6Z_ijXNeQWnrxO1tg70Gkw=F8qNYg@mail.gmail.com>
	<ZGB0cVVI7OgaJU6t@debian.me>
	<CABpewhGJE7-k52j8L2kJ2zKupgp3Ma+LdZazzzV4w1Bgihp7nw@mail.gmail.com>
	<87cz338ix4.wl-tiwai@suse.de>
	<CABpewhF01AK4cFPbwYVvKR9yWaO7o-ZE-2+MZjYSUF0BKUdYvw@mail.gmail.com>
 <874jodlnmi.wl-tiwai@suse.de>
In-Reply-To: <874jodlnmi.wl-tiwai@suse.de>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [172.22.102.106]
x-kse-serverinfo: RTEXMBS06.realtek.com.tw, 9
x-kse-antispam-interceptor-info: fallback
x-kse-antivirus-interceptor-info: fallback
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-KSE-AntiSpam-Interceptor-Info: fallback



> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Monday, May 15, 2023 9:40 PM
> To: Joseph C. Sible <josephcsible@gmail.com>
> Cc: Bagas Sanjaya <bagasdotme@gmail.com>; regressions@lists.linux.dev;
> Kailang <kailang@realtek.com>; perex@perex.cz; tiwai@suse.com;
> alsa-devel@alsa-project.org
> Subject: Re: Fwd: [Bug 217440] New: ALC236 audio disappears from HP
> 15z-fc000 on warm boot
>=20
>=20
> External mail.
>=20
>=20
>=20
> On Sun, 14 May 2023 23:48:55 +0200,
> Joseph C. Sible wrote:
> >
> > On 5/14/23, Takashi Iwai wrote:
> > > The patch changes two places (the change in alc_shutup_pins() and
> > > alc256_shutup()), and I guess the latter is the culprit.  Could you
> > > verify that only reverting the latter fixes the problem?
> >
> > Yes, only reverting the latter fixes the problem. I just tried a
> > kernel consisting of 6.3.2 plus the below change, and it works fine:
> >
> > --- a/sound/pci/hda/patch_realtek.c
> > +++ b/sound/pci/hda/patch_realtek.c
> > @@ -3638,8 +3638,7 @@ static void alc256_shutup(struct hda_codec
> *codec)
> >         /* If disable 3k pulldown control for alc257, the Mic
> > detection will not work correctly
> >          * when booting with headset plugged. So skip setting it for
> > the codec alc257
> >          */
> > -       if (codec->core.vendor_id !=3D 0x10ec0236 &&
> > -           codec->core.vendor_id !=3D 0x10ec0257)
> > +       if (codec->core.vendor_id !=3D 0x10ec0257)
> >                 alc_update_coef_idx(codec, 0x46, 0, 3 << 12);
> >
> >         if (!spec->no_shutup_pins)
>=20
> OK, thanks for confirmation.
>=20
> Kailang, could you check this issue?

OK. I will take it a look for these days.

> Judging from the comment there:
>=20
>         /* 3k pull low control for Headset jack. */
>         /* NOTE: call this before clearing the pin, otherwise codec stall=
s */
>         /* If disable 3k pulldown control for alc257, the Mic detection w=
ill
> not work correctly
>          * when booting with headset plugged. So skip setting it for the
> codec alc257
>          */
>=20
> ... it seems that the codec got screwed with this setup, which leaded to =
the
> non-response at the probe after reboot.
>=20
> In the worst case, I'll revert that part.
>=20
>=20
> thanks,
>=20
> Takashi
>=20
> ------Please consider the environment before printing this e-mail.

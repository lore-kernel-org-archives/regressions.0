Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795437155;
	b=QUeW3xiICoeTz8dowfqPO0eS4Ce3TxdNe7xlGTccrAuZluENN1d/ChjJ6LAZ91Hs52MI
	 eDp+SMJJB16LoOWMeJKtsTSSQ+Nj2Q5uLSZ9NPz5az+LD6Q8eUntfp7gzLi5wNT6eIBuu
	 jpPVggZqC1maTqd2Eeh14w9gW3Ikd+/szHojWBfo9XN194nOLhuegZfQg6diW1qCc0zm7
	 iCCWVi9ft8j51bHWEm9Uj4QCpRCegRFuELxhxbfs4U0xZPLgRaEmbH16G8haw6dYnMTxs
	 Fnp5PayW/hlfbZ+4OouSwhtOq/RTpEq2qURDnT1YMXpqElWssR6AKvALn8Ya7YDvVew==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437155;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:
	 MIME-Version:User-Agent:X-ZohoMailClient;
	bh=qyuSe2Ah94nWHwws+7naCYTuEU9gyyyQzrM16/IS6aA=;
	b=ra9Ja2jssjAGqZrVYv7tf1DsM++qwriCUDPBy+Zo6tpGYm3/tRE/UZLPDdpSzBdqh3wF
	 KbG9NlP/9+T9BC5nJ7ssan63ZcH5DiD/EfkrgWKyguprwg8ZWqOSPU7VzeneGb2QuuZPE
	 1akJEWoZX0iIXS+BKoY9ARFnNjckJzUVhpMdwbv9zKXSy9dPb6q1NtoNwVLRL5oAmH53q
	 ianJoSD/GQ7Z8UOCRF01z/onvW5QDA5WO7EVlpnJJv1oz78V6X8Mw7xOf3hW9bs8NzyD8
	 87PEP4r02oIdGhw2pQzBfr9nOM9m3vldtY077vx993IPkk0uyV+lKQKIAO8GdhYTUgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=UvXAL8ln;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.12
Received: from sender5-op-o12.zoho.com (sender5-op-o12.zoho.com [165.173.182.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6066606A31A
	for <regressions@lists.linux.dev>; Mon, 23 Nov 2026 12:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6066606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=UvXAL8ln
ARC-Seal: i=1; a=rsa-sha256; t=1795437130; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BcwIHd2zM/P8VNN1HHF6H6IbYxFjZLQwS+u1UEwVP9URzEb9P7V+58mAXfJX+EGl7TO+1MlizSiK+zHk54EoGq3q7jGUdK3WmTz5hOhVm9O0Hk2jYJZziNy3QIiybudxMJC5SLjJWICL3B54wFIcNyrHdaSjVA+lzYL7DKOkH2E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795437130; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=qyuSe2Ah94nWHwws+7naCYTuEU9gyyyQzrM16/IS6aA=; 
	b=TWrbd0wMwKDkyyaTaX4/Jx2rvDZhaobOaVfu/Df5WPGKOs8bYDF75Oz/G5g+hMvN3n9CZzk2/ljmlenced9EiTmxCgJ45w/3v2H/HSy/C2MYPkaGsACdos+hY8rArVh8cRvS8NdS1U2NrO5/l2DUS90p++FR/L9+aC3MrQFr7KY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=UvXAL8lnawZgY4GNxyPOBCWvMd14Vuf2v4ysRvymsw/7VWGiVX8KNXOxN+6GlK1DyVhRRtJDxjzuLq/5XkLeLm30rcaulIZEmAVE+91T5L8swzs/Nepsuk7j/k732UwUTx5n4DnBp2AKAc85kuPrwR6LO3nDTdMiGvbxavHcQGsEGOk9ZuhCod6Y9qwCdFVDT1V+/r3Su0qWaJAwX1jNEzgjtFtiitvyBcEFVbd2hxBYqWdvnUBJVVY7LX+dk00jQf+EQ+iITVTpUrc+vnmJUSJTeUcSvOwAsY+/1HsGKY5nOkAJ908pxp5Oi8IJcbMgy5TOIyPUgxrWL4kyacwW4Q==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=qyuSe2Ah94nWHwws+7naCYTuEU9gyyyQzrM16/IS6aA=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795437127098367.14842337195626;
	Mon, 23 Nov 2026 04:32:07 -0800 (PST)
Message-ID: <ffd7265cc3f3abeeae49a1fcaadc87be9aec0c7e.camel@rong.moe>
Subject: Re: [REGRESSION] Logitech G733 USB audio volume issue since Linux
 7.3
From: Rong Zhang <i@rong.moe>
To: Thorsten Leemhuis <regressions@leemhuis.info>, Lucas Cota
	 <lucasbrunocota@live.com>, "linux-sound@vger.kernel.org"
	 <linux-sound@vger.kernel.org>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>, Takashi
 Iwai	 <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <241085e8-cb69-4dbf-9375-e024fe658335@leemhuis.info>
References: 
	<SA3PR11MB87055423D68E21680C47BB55B4B67B2@SA3PR11MB870554.namprd11.prod.outlook.com>
	 <SA3PR11MB870554D0B14BDBE05EC72B8B59B67B2@SA3PR11MB870554.namprd11.prod.outlook.com>
	 <241085e8-cb69-4dbf-9375-e024fe658335@leemhuis.info>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 20:26:51 +0800
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Evolution 3.62.1-4 
X-ZohoMailClient: External

Hi Thorsten, Lucas,

Thanks for reaching out to me.

On Mon, 2026-11-23 at 10:10 +0100, Thorsten Leemhuis wrote:
> On 11/17/26 22:17, Lucas Cota wrote:
> >=20
> > I have some additional findings regarding the Logitech G733
> > (USB ID 046d:0b1f) volume issue.
>=20
> FWIW, details for that issue can be found below in a mail that didn't
> make it to the lists or something.
> > I confirmed that the physical volume wheel can also cause abnormal
> > volume attenuation on Linux 7.2.15, so the issue is not exclusive
> > to Linux 7.3.
>=20
> Thx for the update. I CCed three people, maybe one of them might have an
> idea what's wrong here.
>=20
> Side note: If (a) there really is something that works on 7.2.y, but
> does not on 7.3 and (b) nobody comes up with an idea what's wrong,
> please run a "git bisection" to find the change that broke things:
> https://docs.kernel.org/admin-guide/verify-bugs-and-bisect-regressions.ht=
ml
>=20
> Ciao, Thorsten
>=20
> > On Linux 7.3.x, the hardware PCM mixer sometimes initializes at
> > 51/74 (-23 dB), even though ALSA has 74/74 saved in asound.state.
> >=20
> > I found two workarounds that together resolve the issue:
> >=20
> > 1. Enable "api.alsa.soft-mixer =3D true" for the G733 in WirePlumber.
> >    This prevents the physical volume wheel from causing excessive
> >    attenuation or loss of audio.

Could you please confirm if the "physical volume wheel" is a dumb HID
device that only emits Volume Up/Down events without actually tuning the
volume itself? Or does it tune the volume itself and notify the USB host
via UAC?

> >=20
> > 2. At session startup, explicitly change the hardware PCM volume
> >    from 38/74 to 74/74 using:
> >=20
> >    amixer -c Headset cset 'name=3DPCM Playback Volume' 38,38

Is there anything special about 38? Or was it randomly chosen?

> >    amixer -c Headset cset 'name=3DPCM Playback Volume' 74,74
> >=20
> >    Setting 74/74 directly is not always sufficient. Forcing an
> >    actual volume transition restores the expected hardware gain.
> >=20
> > I currently apply the second workaround using a systemd user
> > oneshot service after WirePlumber starts.
> >=20
> > Both workarounds have been tested successfully after reboot on
> > Fedora 45 with Linux 7.3.x. The headset now starts at the expected
> > volume, and the physical volume wheel works without abnormal
> > attenuation.
> >=20
> > The root cause remains unclear, but the findings suggest an
> > interaction with the USB audio hardware mixer controls.
> >=20
> > Best regards,
> > Lucas
> > ________________________________________
> > From: Lucas Cota <lucasbrunocota@live.com>
> > Sent: Tuesday, November 17, 2026 16:47
> > To: linux-sound@vger.kernel.org <linux-sound@vger.kernel.org>
> > Cc: regressions@lists.linux.dev <regressions@lists.linux.dev>
> > Subject: [REGRESSION] Logitech G733 USB audio volume issue since Linux =
7.3
> > =C2=A0
> > Hi,
> >=20
> > I'm experiencing an audio volume regression with my Logitech G733 wirel=
ess headset (USB ID 046d:0b1f) on Fedora 45.
> >=20
> > Kernels tested:
> > - 7.2.15: Everything works normally, including the physical volume whee=
l, without any custom ALSA or WirePlumber configuration.
> > - 7.3.3 and 7.3.4: Audio volume is significantly lower, and using the p=
hysical volume wheel causes further issues.
> >=20
> > On 7.2.15, the kernel reports:
> > sticky mixer values (...), disabling

7.2.x sets the mixer value to the maximum and skips the mixer
registration (which also disables GET_CUR).

> >=20
> > On 7.3.x, it reports:
> > broken mixer GET_CUR

While 7.3.x sets the mixer value to the minimum, disables subsequent
GET_CUR, but otherwise registers the mixer as normal.

Your userspace audio stack should always set the mixer value to the
stored volume value once opening the ALSA device. I guess the stored
value is 74, right? In this case the difference between the two versions
is insignificant, as the hardware should always see a SET_CUR(74).

Considering that you could also reproduce the physical volume wheel issue
on 7.2.15, I guess the behavior actually depends on the initial state of
the mixer when the device is plugged in. So far it's hard to tell if snd-
usb-audio is broken or not...

Could you please provide all the relevant logs? Please also enable dyndbg
on snd-usb-audio before any testing.

Please try setting the MIXER_GET_CUR_OK quirk flag and see if it helps.

Furthermore, please also test with 6.18.x.

Thanks,
Rong

> >=20
> > Unlike 7.2.15, the newer kernels expose a hardware PCM volume control (=
0-74).
> >=20
> > I can temporarily restore the expected volume using:
> >=20
> > amixer -c Headset cset name=3D'PCM Playback Volume' 38,38
> > amixer -c Headset cset name=3D'PCM Playback Volume' 74,74
> >=20
> > However, turning the headset's physical volume wheel makes the audio qu=
iet again, even though ALSA still reports PCM at 74/74.
> >=20
> > Enabling WirePlumber's api.alsa.soft-mixer =3D true helps with software=
 volume control but doesn't fix the physical wheel issue.
> >=20
> > This seems related to the USB mixer behavior change between Linux 7.2 a=
nd 7.3.
> >=20
> > Could you please investigate whether the G733 needs a device-specific f=
ix?
> >=20
> > Thanks!

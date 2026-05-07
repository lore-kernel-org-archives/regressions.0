Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0263F166D
	for <regressions@lists.linux.dev>; Thu,  7 May 2026 12:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778158049; cv=none; b=sT+ns1Q9cbo1vimpNiyIGYdDuu2yZxs2Y/yr2ey1erzPUDjlbkJy5KuyVqQTIq+oow4xjdp0o4Qnjrwl0ApXq4shouk8hqe6GMeHjVMIuq+7zhw/a1D+JqSOYCmNV5pluftB//ScjKKq9uY35sE5mXAB1ulHM9kNN9R819rucSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778158049; c=relaxed/simple;
	bh=R6BUJzoxO/JukQ/Xy/ngik365ZtOmTkmGGiv/rbSaVQ=;
	h=MIME-Version:Message-ID:From:To:Cc:Subject:Content-Type:Date:
	 In-Reply-To:References; b=Km16hbJnNUPhsSWUPDc1EyUqCvrYoeB8N8z1gntE0sCepgbpqWgzOFiZHTv/avSLEgijbH1fLQ8ibB1vEaPNhP5jZ+JSicjs3O8TBHWfdU753+fCTWKWVD3sga71hhXindJYLzWTtfIUArgV0xibLrC7wDblmtF+79pk1pLGsEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.us; spf=pass smtp.mailfrom=gmx.us; dkim=pass (2048-bit key) header.d=gmx.us header.i=stoa@gmx.us header.b=HpDt3uzV; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.us header.i=stoa@gmx.us header.b="HpDt3uzV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.us;
	s=s31663417; t=1778158023; x=1778762823; i=stoa@gmx.us;
	bh=AbIuDwRfsvgPl6cztdomGHrfum2hEfooFJfpvP2q/CY=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=HpDt3uzVGiqlwbtCl9p89FMFjCpX0cPSs1BGOBBtTayKutDD/RbRaou2WwygvZQB
	 rIiidCPAv8AbevuBGL+vyjtOz3LhzY33dXARwRRe7lXWuDUOrcSPqTwGJAT1yHdmF
	 3QBJojb+nONVsF/4uoANdvygd3vks6XWciibWOj9QjzvtFr09/Ceamnl2As7INMIw
	 rYJJ8ibAri/kd0FhRla0/l08hUhJUT3gy/bAKc0gWfLICW7JttMksMXYzHcV+PPzL
	 +rguKoOFiZuK8BKRD8yvyEtL9bAL0gXpGH3SGLL3wAsJKbYMVJ+S5Gq/8hcOjrpsJ
	 22SR3/0sisa9vAUFEQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [74.10.39.157] ([74.10.39.157]) by web-mail.gmx.net
 (3c-app-mailcom-bs03.server.lan [172.19.170.169]) (via HTTP); Thu, 7 May
 2026 14:47:03 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <trinity-c85da660-f130-434c-a64c-a076180ce5c0-1778158023623@3c-app-mailcom-bs03>
From: Dutch Ingraham <stoa@gmx.us>
To: Takashi Iwai <tiwai@suse.de>
Cc: Harin Lee <me@harin.net>, Takashi Iwai <tiwai@suse.de>, Thorsten
 Leemhuis <regressions@leemhuis.info>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Linux kernel regressions list
 <regressions@lists.linux.dev>, Linux Sound System
 <linux-sound@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [regression] ctxfi: no speaker output when headphones connected
 on >=7.0.x
Content-Type: text/plain; charset=UTF-8
Date: Thu, 7 May 2026 14:47:03 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <87v7czrasg.wl-tiwai@suse.de>
References: <36875d66-f601-4d18-9654-bd86b60918e8@leemhuis.info>
 <87bjett3ud.wl-tiwai@suse.de>
 <7929c116-ff2e-413b-ae73-e7d19e846e0f@harin.net>
 <87v7czrasg.wl-tiwai@suse.de>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:wCt0g5qALlC7G/pcx7pCfNBigQbRIJNXfOJjKLIMsXYzoSv4clYgcB6imoBx3DJaPslFw
 fS5Xqtrxj+lIkhLvbBK/JJwLl6OJ61E27IPe78sRaE1ki0brXtTFpc+Qtcyg1uB61cPsk+XpBcPK
 eOZUO7nwaJi5NgzMJfr0uQ5K4RSFDT7oXWOQefTZLPNJqBaMsl/YNdcJHNpl93uQhyJxt0Ae5riK
 tPssExYRijNqp8B7udrvjIFyOzhVKCWotInm/lm7uKpWl8NnUuLZC3uYkVThld3FznyxBA9b3zO7
 ms=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:svnpQoo8uE4=;fAS7BEu4hMguvt/eoUZv9jiJWfN
 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
 9J/6w==
Content-Transfer-Encoding: quoted-printable



> Sent: Thursday, May 07, 2026 at 1:30 AM
> From: "Takashi Iwai" <tiwai@suse.de>
> To: "Harin Lee" <me@harin.net>
> Cc: "Takashi Iwai" <tiwai@suse.de>, "Thorsten Leemhuis" <regressions@lee=
mhuis.info>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@sus=
e.com>, "Linux kernel regressions list" <regressions@lists.linux.dev>, "Li=
nux Sound System" <linux-sound@vger.kernel.org>, "LKML" <linux-kernel@vger=
.kernel.org>, stoa@gmx.us
> Subject: Re: [regression] ctxfi: no speaker output when headphones conne=
cted on >=3D7.0.x
>
> On Thu, 07 May 2026 00:06:11 +0200,
> Harin Lee wrote:
> >=20
> > On 5/6/26 4:05 PM, Takashi Iwai wrote:
> > > On Wed, 06 May 2026 08:24:36 +0200,
> > > Thorsten Leemhuis wrote:
> > >>=20
> > >> Hi! Just FYI, I noticed a regression report in bugzilla:
> > >>=20
> > >> https://bugzilla.kernel.org/show_bug.cgi?id=3D221461
> > >>=20
> > >> To quote:
> > >>=20
> > >>> Dutch Ingraham 2026-05-03 18:12:49 UTC
> > >>>=20
> > >>> Kernels >=3D7.0.1 contain a regression as to Creative Sound Blaste=
r Z SE
> > >>> discrete pci sound card, but not integrated. Kernels 7.0.1, 7.0.2,=
 and
> > >>> 7.0.3 tested; 7.0.0 not tested. Reverting to any 6.18.x or 6.12.x =
does
> > >>> not present the issue.
> > >>>=20
> > >>> Specifically, using pipewire managed by pavucontrol, on both Gento=
o and
> > >>> Arch Linux, when both external speakers and headphones are connect=
ed,
> > >>> all sound is routed through the headphones regardless of whether s=
ettings
> > >>> are set to Line Out/Speaker or Line Out/Headphones; there is no sp=
eaker
> > >>> output. If headphones are disconnected, without reboot, speakers w=
ork;
> > >>> reconnect headphones, without reboot, sound reverts to headphones.
> > >>>=20
> > >>> Kernel: 7.0.3, Gentoo compiled from source using olddefconfig on 6=
.18.24
> > >>> 		.config; Arch standard release
> > >>> 'lspci -nnk | grep -i audio' attached
> > >>> 'dmesg | grep -i audio' for 7.0.3 and 6.18.24 attached
> > >>> pipewire-1.6.4 on both Gentoo and Arch Linux
> > >>> alsa-firmware-1.2.4 on both Gentoo and Arch Linux
> > >>> 'cat /proc/sys/kernel/tainted' returns 0 for both Gentoo and Arch =
Linux
> > >>>=20
> > >>> Processor		:	AMD Ryzen7 5700G
> > >>> Motherboard		:	Asus Prime X570-Pro
> > >>> RAM				:	Patriot Viper Steel DDR-4 @3200mHz
> > >>> Graphics        :   ASRock AMD Radeon RX 7600 Challenger 8GB OC
> > >>> Sound Card      :   Creative Sound Blaster Z SE
> > >>>=20
> > >>>=20
> > >>> Expected outcome: ability to choose output to either speakers or h=
ead-
> > >>> phones while both are plugged-in to sound card.
> > >>>=20
> > >>> Workaround: none known.
> > >>=20
> > >> See the ticket for more details. One of them: 7.1-rc2 is affected a=
s
> > >> well. Reporter is CCed. Forwarded this to ensure this report makes =
it to
> > >> the interested parties, as bugzilla might not have forwarded this.
> > >>=20
> > >> Dutch Ingraham: if nobody within a few days has an idea why this
> > >> happens, you will likely have to use a git bisection to get this re=
solved.
> > >=20
> > > As there have been many significant changes in ctxfi since 6.18, it'=
s
> > > hard to tell what broke.  Please go git bisect.
> > >=20
> > >=20
> > > thanks,
> > >=20
> > > Takashi
> > >=20
> >=20
> > Creative Sound Blaster Z-series uses the snd_hda_codec_ca0132 driver,
> > not snd_ctxfi. The dmesg logs in the bugzilla shows only ca0132
> > entries.
>=20
> Ah, sorry, then it's easier.  The only major change is the
> commit 778031e1658d206a52bf9491c91ae5d4f4a2509d
>     ALSA: hda/ca0132: Set HP/Speaker auto-detect default from headphone =
pin verb
>=20
> Try to revert this one.
>=20
>=20
> thanks,
>=20
> Takashi
>=20

I can confirm this seems like a good candidate. I built and tested 6.19.14
and 7.0. On 6.19.14, speakers work as expected; on 7.0, speakers are not
working as expected and the offending patch is included in the 7.0 patchse=
t.

Thank you all for your work on this issue.

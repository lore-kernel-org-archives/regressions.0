Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794967734;
	b=bIp+1xJ+1h1CJ7xIMl5sPKrr9ymNlC9eXp+Fso44GtVTXAiWTHkfgov+mwHxZw5dt8vc
	 5bGgZZbhOk0j4QqVwYNvpG8Q8c/PU52fgdSJw+AJhT7iBv+3UoGP2O0AGgkATpqFD7HMn
	 QTKVrWy6zLsBEZ7rbDke9Wtyhoty3mMvmDirRNG/yQb+gApojgHL4jbdSzg6+UFOpVoXO
	 qKWBK+ZfrommtFSoC4YoBCZXe1dh4WcYtNLAKyGWkdOwPwI7VylTqCKlLHGn9i7YUTiy3
	 udeuCEIGo6IA+GO3AjvBDm++f4XUqS8S22Oe9kzlTryaKRkct0b7XymjNBAttLBdGLA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794967734;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=D13zC7v+yg9koT40XnN4u0OwmLSHL4F+AM81FlR0Yhw=;
	b=WiTx/9Irkj1veOFdta/EiXNZUdDwBq0x9CR7e3y+FoThuuua6abWzNE9fJPjtWwPZlYM
	 GAGinGOG0Pzg+n37BvbU48sCl94kCWDRlsZiw6IBVHW12aXk31TyfC6M9tm1nhNpBN/ze
	 nVo/zaz+l7As5jXtKzCD4yzEuMemjX7I2r/YA7FmpFOh6xwiOzdUCKrbFCFnRW7JKdkE2
	 dfWTd+52zNYyi1SDuPOywgtAOquxGGrc65pRsVdU4KpiLKkmLrq7ySd257E4M7kku8Q/9
	 e6hgK+2VMPKU3HtD7+7dH3IWRsGwHPPxzbkkv400kTeo1lKp1VscvXwY6G4jYzvlLpQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sVQlPfxw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9B6606A31C
	for <regressions@lists.linux.dev>; Wed, 18 Nov 2026 02:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC9B6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sVQlPfxw
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso7511025e9.0
        for <regressions@lists.linux.dev>; Tue, 17 Nov 2026 18:08:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794967732; cv=none;
        d=google.com; s=arc-20260327;
        b=ETaAQ1BETTUK0S5qsVlpPNP0gKvyMxuvcGHhUUAwnbQgHEKpcvZ03spIWVlf1AZznX
         17WQOAsQiTh6flo1eVrPujdYLtmHWHd632tjzvTM995LkQyJP22g8sZh/F+YH1cQS20x
         v2w9IwUIAIuUmWbxujbUqnPuyMWHwoiH3rliWWDCLV5TxFygEyTDvk2Rl5sJTSu4T4rC
         dPCG24yCyCOXA19iFG+Prt/69e4Vv6WXIjr1OGpijzginITZ/CEvVCQakbVONeZwHHn4
         Vy3PQtu0WHp0++1OEOwgZnwpOWtg6jdFNKMsWSrDdMT/Lyyd3j89LiSwBM7Tm3fGvreT
         11QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D13zC7v+yg9koT40XnN4u0OwmLSHL4F+AM81FlR0Yhw=;
        fh=A9IgIrSxeJA7OuY2EfofwO9SBls8SdushP9vv4b4Xsg=;
        b=VOFkRIAyw68EtHBZICDysqCLSAIeGXaASE50lP7bZEvEuYcpmaOEUZl98nGn5WUzdW
         TgwfQc7VucK5NfgVVQ06yXRu65WJJrjH+QLCZA4kDj6bVbeD8JfsV9T68xt8HanVw+OF
         MvHzAACKXldHoSogjUSCg8b6PRPKQk2UZbS4/XljxTasSfSmbO/1v0rIdBYqpcIZID4t
         7oRVZFb+Rt8wUhKHdu9vcEA8UuISgT+yqJUmwT/ZXn1wlMVx7s11t1m6Ax6QyuAfCG2h
         OTROZVr5wQCC3hK5scGdCADSaUa7ChkLp51R4FT5+jnfMHcLV/rKgIzSV1S7otI5Eco7
         ZLWg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794967732; x=1795572532; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D13zC7v+yg9koT40XnN4u0OwmLSHL4F+AM81FlR0Yhw=;
        b=sVQlPfxwREqMaIAQhB9AczI0KjKVQ2mT2iOo5AXCzpsnuWxZ10+YvCb8PASpfsWovb
         m2n78gCgiOU0nq/RuQqWGQ0tOD8ub9Lr3Z7yk/h8q6SpaEQoOKAOVzduyZHQsUUqZWKY
         ZHHqaa/FEXIFO2EUkDK+7sui+ygdGM1xUEX3mm/sxKTxODvXGw/1p60fqqrS2slety1+
         iJDTE4j11raB7LUOYy3wJTOCZYrd8ne6Ti4RL8RmcX3wLYc539rMvFLiPnPFamL00bWm
         NKgeNRR3GlOXG2J2uxVDssLtLU4uKIIe98DzSsXgSriZA+DC+N8M24In0rz8fkuCv7Kv
         1BEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794967732; x=1795572532;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D13zC7v+yg9koT40XnN4u0OwmLSHL4F+AM81FlR0Yhw=;
        b=Qzv9mloiYQxkqZjeC2X2994ynZvYCAqlMMLS/CxGRq6KPsTmog9o/thYmE2fMTQm2L
         A8S7/crGq9qd3O5WioKZRyqejVTlX9c9P6mL3UEbR1y9SHKIWBXkltlbqSSfE9OnQA8j
         CGo3VlqN6BUKSfy2G/RI4vCXg/PkqHMcP78HASmmDJQ+IpiBlX9Iae5+fBN7TsW6lBDi
         MF1xWi83yrlJ8ydHgaVsuW0UkUkqmNz+jsy5c5WGHYbxcbrxAfHNnoXg3pHlMxw/f7qZ
         Lnr64/I9Cb+dRe1DTUrXFH9UBI3IBCXsBkrY6AepfDXMhDE2I2oc0u3QrxnAdQxfIiSM
         Ttew==
X-Forwarded-Encrypted: i=1; AL+hErFsx1LUI3ALnhFWKmU0eQTCPmOL9/ojaQyuaRawa4d7e6Dc4Vu3LQjxP5cFkL5zQooCwDeCx7I/Bmo8QQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/0BP+bZiYxPWiO5q1UJ15fIs8C/Mo74NZd2nFytyo+xRt7iDs9
	ZRZx9f9Rb4osU1tmi67nmstzz+lWGlhQwr323axhXyIjpombfZeWCmdAeyzsgquud4TsQX5wBt9
	4ykC6iIe1XEWRXkk1c+87OiBUkUkWjFk=
X-Gm-Gg: AYBFou2wMtXIvdIa/ZlGnbOD32OWQX9sAqqWKlmmloKySF8Ux/D4OPA2/EyHnBHKHds
	sYze2zAn6OzbUP0iyqmqAKbe+yrSAO9I4/eVl50DHn9CqHz7Rt/si06eQ1xKF3/+Y9EM9iUQvU0
	IVIQGvyOZKzmgwRWJzEIhEnuAiuhAijWwePuuwtC6oG0zLFOOvxiLOpqt3AxJNPCtpGgkU7IRPp
	B+g5IHt2Kyj16Pr+wcGW6/QaQCmfi9z1VzV2nhzv1oKpgur+18XXIXbSCdPock6mtl4VPdGCGn9
	jsi73+lcAIyaKvu8b+BqP8M3bOeLh9EkVxjIJGcclmjbBbaJT2bexsmR2ocmT6LnI7wfz19fHTT
	Oo7tKCpx0q0t9x0BNwNC2YnLPhGIRBUAuSkhTgg==
X-Received: by 2002:a05:600c:1f82:b0:4bb:6848:d433 with SMTP id
 5b1f17b1804b1-4bb7da4f53fmr18806175e9.26.1794967731860; Tue, 17 Nov 2026
 18:08:51 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CAFjFWEjt+DPJ_gM1uTBZ_NoV6-3mi57ArjZ_Qdah2DqY-GCD1w@mail.gmail.com>
 <87v75vzuvb.wl-tiwai@suse.de>
In-Reply-To: <87v75vzuvb.wl-tiwai@suse.de>
From: william <assassinshalo29@gmail.com>
Date: Tue, 17 Nov 2026 21:08:41 -0500
X-Gm-Features: Aa3M54pqBgpwRf3ktpoGGAdXdfWopucfTaGk3UTSe5A5MIyEtyQPBujmBvw12hs
Message-ID: <CAFjFWEgAJWe1q-3U2=5x4Tu0DcGcAano7nownXjg-uF9FADbRQ@mail.gmail.com>
Subject: Re: [REGRESSION] ALSA: hda/realtek: no speaker sound on Lenovo Legion
 16IRX9H since f2293e7b2ddd (PCI SSID 17aa:3842 shared with ThinkBook X G2 IAH)
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, evgeny@devduty.com, stable@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

Thanks for the quick patch.

To answer your question: I have not built a kernel with this patch, so I ca=
nnot
say I tested it. What I did was boot 7.3.4 with snd_hda_intel.model=3D17aa:=
38cd,
which selects the same ALC287_FIXUP_TAS2781_I2C fixup through the 17aa:38cd
entry. The log then shows "picked fixup for alias SSID 17aa:38cd" and
"bound i2c-TIAS2781:00", and the speakers work. The effect is the same, but=
 it
is a different code path, so it is not a Tested-by for the patch.

About the Y790 entry: on this Legion 16IRX9H, /proc/asound/card*/codec#0
reports "Subsystem Id: 0x17aa38cd", so the codec SSID is the same one used =
by
the existing "Y790 VECO DUAL" entry. On 7.2.10 the speakers worked without =
any
parameter.

One clarification on my first message: the last paragraph about silence aft=
er
suspend is a separate issue, unrelated to this regression and to this patch=
.
Please ignore it here.

I would prefer not to be credited.
Please leave the Reported-by tag out of the commit.

Thanks,
William

El mar, 17 nov 2026 a la(s) 4:10=E2=80=AFa.m., Takashi Iwai (tiwai@suse.de)=
 escribi=C3=B3:
>
> On Mon, 16 Nov 2026 02:24:00 +0100,
> william wrote:
> >
> > Hi,
> > Commit f2293e7b2ddd ("ALSA: hda/realtek: Enable all four speaker amps o=
n Lenovo
> > ThinkBook X G2 IAH", Cc: stable) matches the laptop by PCI SSID
> > 17aa:3842, on the
> > assumption that this SSID had no quirk entry. The Lenovo Legion 16IRX9H=
 (83DE)
> > has the same PCI SSID, so its internal speakers are silent on kernels t=
hat carry
> > this commit. Headphones work.
> > Hardware
> > Lenovo Legion 16IRX9H, product 83DE, BIOS N2CN32WW
> > Codec: Realtek ALC287, codec SSID 17aa:38cd, PCI SSID 17aa:3842
> > Amplifier: ACPI TIAS2781:00 (i2c-TIAS2781:00 on i2c_designware.2),
> > driver snd_hda_scodec_tas2781_i2c
> > Kernels
> > Works: 7.2.10-200.nobara.fc44, 7.1.6-1-cachyos (live ISO)
> > Fails: 7.3.4-201.nobara.fc44, 7.3.4-1-cachyos
> > The 3842 entry is absent from v7.2 and v7.3, present in v7.3.4, and sti=
ll
> > present in v7.4-rc1 and master as of 2026-11-15 (checked via the GitHub=
 mirror).
> > Analysis
> > snd_hda_pick_fixup() walks the table and matches PCI-SSID entries befor=
e the
> > codec-SSID fallback. Before the commit, 17aa:3842 had no entry, so this=
 machine
> > fell through to the existing codec-SSID entry
> > SND_PCI_QUIRK(0x17aa, 0x38cd, "Y790 VECO DUAL", ALC287_FIXUP_TAS2781_I2=
C),
> > which works. With the commit, the 3842 entry wins and chains to
> > cs35l41_fixup_i2c_four(), so the codec master waits for four CS35L41 co=
mponents
> > that do not exist on this machine.
> > Evidence on 7.3.4
> > dmesg: "ALC287: picked fixup for PCI SSID 17aa:3842"; no "bound i2c-TIA=
S2781:00"
> > line (on 7.2.10 that line is present).
> > /sys/kernel/debug/device_component/hdaudioC0D0: master "not bound",
> > four entries "(unknown) not registered".
> > With dyndbg, after "echo 1 > /sys/class/sound/hwC0D0/reconfig":
> > hdaudioC0D0: trying to bring up adev
> > hdaudioC0D0: Looking for component 0
> > hdaudioC0D0: master has incomplete components
> > After unbinding/binding i2c-TIAS2781:00, tas2781-hda logs "adding compo=
nent"
> > but the master still reports incomplete components.
> > Workaround confirmed
> > Booting with snd_hda_intel.model=3D17aa:38cd (alias SSID, handled first=
 by the
> > picker) gives:
> > ALC287: picked fixup for alias SSID 17aa:38cd
> > bound i2c-TIAS2781:00 (ops tas2781_hda_comp_ops [snd_hda_scodec_tas2781=
_i2c])
> > and the speakers work.
> > Possible direction
> > Since both laptops share the PCI SSID, the ThinkBook entry cannot be fi=
xed by
> > PCI SSID alone. One option is a codec-SSID entry for this machine place=
d before
> > the 0x3842 line, e.g.
> > HDA_CODEC_QUIRK(0x17aa, 0x38cd, "Legion 16IRX9H / Y790 VECO DUAL",
> > ALC287_FIXUP_TAS2781_I2C),
> > I have not compiled or tested a patch, only the model=3D alias above. I=
 am happy
> > to test patches on this hardware.
> > Separate observation
> > After the workaround, speakers still stopped after some idle time. It w=
ent away
> > with snd_hda_intel power_save=3D0 power_save_controller=3DN and keeping
> > i2c-TIAS2781:00 power/control at "on". I applied both at once, so I do =
not know
> > which is required. This looks unrelated to the regression above.
> >
> > I'd really appreciate it if the issue is fixed, as I'm now having the
> > same problem when the laptop is turned on after being suspended for a
> > while, and I haven't been able to solve it.
>
> Thanks for the report.  Could you verify whether the patch below is
> what you've tested?  I left Y790 entry as is because it's not 100%
> sure whether it has also the same codec SSID.
>
>
> thanks,
>
> Takashi
>
> -- 8< --
> Subject: [PATCH] ALSA: hda/realtek: Fix regression on Lenovo Legion 16IRX=
9H
>
> Lenovo Legion 16IRX9H has the very same PCI SSID (17aa:3842) as the
> recently added quirk for Lenovo Thinkpad X G2 IAH, but it needs a
> different qurik.  Although the quirk for Legion 16IRX9H is present,
> it's not applied because the PCI SSID 17aa:3842 matches at first and
> the new quirk for Thinkpad X G2 is taken instead.
>
> As a workaround, put the codec SSID matching (17aa:38cd) for Legion
> before the conflicting PCI SSID quirk entry.
>
> Fixes: f2293e7b2ddd ("ALSA: hda/realtek: Enable all four speaker amps on =
Lenovo ThinkBook X G2 IAH")
> Cc: <stable@vger.kernel.org>
> Reported-by: william <assassinshalo29@gmail.com>
> Closes: https://lore.kernel.org/CAFjFWEjt+DPJ_gM1uTBZ_NoV6-3mi57ArjZ_Qdah=
2DqY-GCD1w@mail.gmail.com
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/hda/codecs/realtek/alc269.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek=
/alc269.c
> index 2c541c68ff5b..1d609584e778 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -8542,6 +8542,8 @@ static const struct hda_quirk alc269_fixup_tbl[] =
=3D {
>         SND_PCI_QUIRK(0x17aa, 0x3827, "Ideapad S740", ALC285_FIXUP_IDEAPA=
D_S740_COEF),
>         SND_PCI_QUIRK(0x17aa, 0x3834, "Lenovo IdeaPad Slim 9i 14ITL5", AL=
C287_FIXUP_YOGA7_14ITL_SPEAKERS),
>         SND_PCI_QUIRK(0x17aa, 0x383d, "Legion Y9000X 2019", ALC285_FIXUP_=
LEGION_Y9000X_SPEAKERS),
> +       /* Legion 16IRX9H shares PCI SSID 17aa:3842 with Thinkpad X G2 be=
low */
> +       HDA_CODEC_QUIRK(0x17aa, 0x38cd, "Lenovo Legion 16IRX9H", ALC287_F=
IXUP_TAS2781_I2C),
>         SND_PCI_QUIRK(0x17aa, 0x3842, "ThinkBook X G2 IAH", ALC287_FIXUP_=
MG_RTKC_CSAMP_CS35L41_I2C_4_THINKPAD),
>         /* IdeaPad Pro 5 14IAH10 shares PCI SSID 17aa:3843 with Yoga Book=
 9i;
>          * use codec SSID to distinguish them
> --
> 2.53.0
>

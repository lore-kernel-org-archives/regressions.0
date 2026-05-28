Received: from mail-106121.protonmail.ch (mail-106121.protonmail.ch [79.135.106.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9512E3F8707
	for <regressions@lists.linux.dev>; Thu, 28 May 2026 18:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779992860; cv=none; b=Y6btigMQHmqxJqpj/fUemi7jwcoMyyNOA0r4LB2Y7lMZRfbd3YDPI9ojqlrvJfn2xocefRvxs3SmK8yRTn18wQIzJxBcFIMH9zDBomgvIRO3HT/8a7TgKY5TG1xRdHoDXVvhRMGnkxCpHoWqVan54syLEq4yGG2RWUrMET+5PXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779992860; c=relaxed/simple;
	bh=35vlO/li2m5ji7uyijtwGKL1X4FBfkjyHmTboXJgc70=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pQleFQZK6IYBPG5c+/5esfjrTmORntaZcdADx5H+hv0ZovkdHpWTCLII7qhF5zBLXFuR2S/7X2eZaDwpXW+cUiz2Is6KWhLcOJ06hx/BIfdVVEai30JhYoV3ScClRqXNOD/qTajKFLoj2HU9lE/XkjtISG531iMFvbqG83HZTS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=PACAlLdM; arc=none smtp.client-ip=79.135.106.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="PACAlLdM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1779992856; x=1780252056;
	bh=+pUflfRGv1ueockabyn+TCgvNLDD1SJth6rKb3rh+sQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=PACAlLdMKEugfoWH1X7smsAeCzoCDPJTw2FJ3sefk86eYRwKwnYuMBcjS9f5V4eAW
	 z0kbryqt7MH78eDBEfmsFaIJgyHQ9xXVHHO/WyDZppGhQvkgppgwYo8rGKew04VzDg
	 z+rqnhD8eJVta1Q79hcqR2qrKvooWIFR4xYinS8iecrjG7By7Aw8V6NxsCHF2YMjcH
	 vKNmI6fOHLpD3Jc5xjXVnkQfnX5gFkBLKDwSLkB2FN+EfRjO9g7tBzbAxOuj+3XKUv
	 ZcfsZ5SVuXYG43IvZGQyS/OBEZpTR6phrTtoI/jXx+SmeKIOAY2WK/KGSrEgmnsam8
	 JSwMlCii5GTlw==
Date: Thu, 28 May 2026 18:27:30 +0000
To: Takashi Iwai <tiwai@suse.de>
From: Mike Karcic <mikekarcic@protonmail.com>
Cc: Sean Rhodes <sean@starlabs.systems>, "stable@vger.kernel.org" <stable@vger.kernel.org>, "regressions@lists.linux.dev" <regressions@lists.linux.dev>, "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [REGRESSION] Speaker pop/chirp on Meteor Lake ALC287 (17aa:231e) -- 6.12.73 to 6.12.85
Message-ID: <bibLdgyll9YOEDANdCBy8WOqeOeJry1SnahLR-EhoGkttJ6BE2srDZ9jv0gjkt0bA19aKivruQs3nkMQWbdEXPaOrLT80xjzF4KJvDcB-IU=@protonmail.com>
In-Reply-To: <87mrxjsk52.wl-tiwai@suse.de>
References: <O6pYAi7yf23du9ivLsL0QqrnTmodj2lDTL7Wviv7I_nhjVtvllO7Y5Ban0TeTqrastb1RWhJtlkqrM3quLMWSriai-YjjGy312MTcEhxyWs=@protonmail.com> <CABtds-3GOyBr1H=c5aFV1uzfkhO3d1NHMPuon_cWDq0V=pFwUA@mail.gmail.com> <wZmYozyav1sNx53nFr4ShKmcdLFVJp5bdUOJgUq1I57MX6kgyq7n8XvH-MWG9Fi4q2x4CQqjEQ3Q8ok5MClut8hNixnhVmVtXkhcOzH1sw8=@protonmail.com> <87eciwukvy.wl-tiwai@suse.de> <RfzfjlzeaeMgNNWNST_Zzx1v49rYjM63MvAV6O5_fFIoZJ73GcN69FDLJcwhJ3s6fl9TVD2l45YBh2n3hy95LM7rhLhoVt8dU9stMkuVJvE=@protonmail.com> <87mrxjsk52.wl-tiwai@suse.de>
Feedback-ID: 22946815:user:proton
X-Pm-Message-ID: d0933fc08046c310953c0d471acf6570fb912ad3
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Yes, I can confirm the patched kernel is running, and commenting out that l=
ine fixes the problem completely.

Below is output with the added debug lines as requested:

$ uname -r
6.12.90-debug-no-discoefs

$ sudo dmesg | grep -i "alc287_alc1318"
[  453.823528] snd_hda_codec_realtek ehdaudio0D0: alc287_alc1318_playback_p=
cm_hook called action=3D0
[  453.871577] snd_hda_codec_realtek ehdaudio0D0: alc287_alc1318_playback_p=
cm_hook called action=3D1
[  459.605379] snd_hda_codec_realtek ehdaudio0D0: alc287_alc1318_playback_p=
cm_hook called action=3D2
[  459.605497] snd_hda_codec_realtek ehdaudio0D0: alc287_alc1318_playback_p=
cm_hook called action=3D3

$ grep -n -A5 -B2 "alc_process_coef_fw.*dis_coefs" sound/pci/hda/patch_real=
tek.c
7918-           return;
7919-   alc_update_coef_idx(codec, 0x10, 1<<11, 1<<11);
7920:   /* alc_process_coef_fw(codec, dis_coefs); */ /* commented out for t=
esting */
7921-   alc_process_coef_fw(codec, coefs);
7922-   spec->power_hook =3D alc287_s4_power_gpio3_default;
7923-   spec->gen.pcm_playback_hook =3D alc287_alc1318_playback_pcm_hook;
7924-}



Sent with Proton Mail secure email.

On Thursday, May 28th, 2026 at 10:07 AM, Takashi Iwai <tiwai@suse.de> wrote=
:

> On Thu, 28 May 2026 15:38:54 +0200,
> Mike Karcic wrote:
> >
> > I did test 46c862f5419e on 6.12.90. Chirp still present.
> >
> > I'm also on a ThinkPad X1 Carbon Gen 12 with ALC287 (17aa:231e),
> > same as the original reporter. The fix resolved it for them but
> > not for me.
> >
> > Only a full revert of 630fbc6e870e resolves the issue.
> >
> > Verification on the running kernel:
> >
> >   $ grep -c "dis_coefs" sound/pci/hda/patch_realtek.c
> >   2
> >
> >   $ grep -c "en_coefs" sound/pci/hda/patch_realtek.c
> >   0
> >
> >   $ sed -n '/alc287_alc1318_playback_pcm_hook/,/^}/p' sound/pci/hda/pat=
ch_realtek.c
> >   static void alc287_alc1318_playback_pcm_hook(struct hda_pcm_stream *h=
info,
> >                                      struct hda_codec *codec,
> >                                      struct snd_pcm_substream *substrea=
m,
> >                                      int action)
> >   {
> >           switch (action) {
> >           case HDA_GEN_PCM_ACT_OPEN:
> >                   alc_write_coefex_idx(codec, 0x5a, 0x00, 0x954f);
> >                   break;
> >           case HDA_GEN_PCM_ACT_CLOSE:
> >                   alc_write_coefex_idx(codec, 0x5a, 0x00, 0x554f);
> >                   break;
> >           }
> >   }
> >
> > Happy to test further patches.
>=20
> Just to be sure, could you verify that you've tested really the
> patched kernel, e.g. by adding a debug print, etc?
> If yes and the problem is seen even with the patch, try to comment out
>   alc_process_coef_fw(codec, dis_coefs);
> and confirm that this fixes the problem.
>=20
>=20
> Takashi
> 

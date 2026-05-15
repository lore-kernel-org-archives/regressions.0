Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A209A3EDAA1
	for <regressions@lists.linux.dev>; Fri, 15 May 2026 09:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778836850; cv=none; b=MImaKc+LPwy0EDBRFKree9dKFayvNmxwQ85tPn6CGZHxFU5OUCqsmLNKhv+xWlChiuDcEPJuUeW+7TWon03d1aylaY5wbcT/Ui5SCr7awmxN6Q8fZUvawGVh1PutmGfQNDm7pcoDEXrDaqcuAjQYN0pKdZfRf87dZ9taIfL2x44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778836850; c=relaxed/simple;
	bh=pglsJXT3VgJUYj7z2E7Z/sOBIgTy+qS24DyVkWMe+E8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=br4/QYox8OCZfhxNrcR+CdL8OP1Rdzy9hnnWWd3E0+hwGZeDdMeuPISzFy2f+cBd+OQOqDbtVEBLTvYbSqhP1pIxux8Yh7teHIvJvHdBalaPZGP5NZ6hXnvYtETfsA3xndjTlcR1Pmj2QCBfuA1ydLNf6MOQKEmP8b5D2t+6M+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=KCc5A66f; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7UQfK3el; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=F+6SqPVU; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yqcpcpIJ; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="KCc5A66f";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7UQfK3el";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="F+6SqPVU";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yqcpcpIJ"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C6F0366D07;
	Fri, 15 May 2026 09:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778836846; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k/yqZGF3pUUwv8PCjwjqmxF6uTW5Oi3M4ShqmteYLcY=;
	b=KCc5A66f7wY62pW21y/PfDj+E5Z4F5BRSfZ6LPywzYAZMENv9digwnIrRRudDHSNb6Csbt
	M9ecnCPQObFrbXx/058i50g7Ak/R4zmzgmvjgO4lFEgMk+l/yGazyBJ6JsEQmGLMvDNrNH
	z5vHa5+102m9fOncjSshBeqxD+Z+2PU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778836846;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k/yqZGF3pUUwv8PCjwjqmxF6uTW5Oi3M4ShqmteYLcY=;
	b=7UQfK3el++rtYhCjw1SLulIb3OeF2apr+6dfrLwOnyp1cymGTq1CUNbei1T/lelUyEW3fs
	Xh7t3oh+43iQCaDA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=F+6SqPVU;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=yqcpcpIJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778836845; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k/yqZGF3pUUwv8PCjwjqmxF6uTW5Oi3M4ShqmteYLcY=;
	b=F+6SqPVUg13ZytaDsX+LF6y4mZW+RDt371Rimj8+fgioGoS0BpU1/1EIZpjEGOW1RaenUI
	fvuMu/xZuZ2VPqbGAhsJJZsnoQgzm5AvUarDdAng3N1VWvWxqMCA3XLpAmMovGWz+YoXSM
	sfyvsD/9IQfhZw09EHVtxQ6zz1cRfvY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778836845;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k/yqZGF3pUUwv8PCjwjqmxF6uTW5Oi3M4ShqmteYLcY=;
	b=yqcpcpIJyO+ulvl8UYEMQEhD7PWP3Yt5orH1aymF9s8/eMfDbutFkXuY5CowgFsuUrB0fu
	T7BRkIVcUl3IraAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 81881593A9;
	Fri, 15 May 2026 09:20:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tOZxHm3lBmrZZwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 15 May 2026 09:20:45 +0000
Date: Fri, 15 May 2026 11:20:45 +0200
Message-ID: <87ik8pt4eq.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dutch Ingraham <stoa@gmx.us>
Cc: Matt DeVillier <matt.devillier@gmail.com>,
	Takashi Iwai <tiwai@suse.de>,
	Harin Lee <me@harin.net>,
	Thorsten
 Leemhuis <regressions@leemhuis.info>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Linux kernel regressions list
 <regressions@lists.linux.dev>,
	Linux Sound System
 <linux-sound@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [regression] ctxfi: no speaker output when headphones connected on >=7.0.x
In-Reply-To: <trinity-2f1dd3ff-4c75-4085-86ae-cca1d09aa83f-1778178205524@3c-app-mailcom-bs11>
References: <36875d66-f601-4d18-9654-bd86b60918e8@leemhuis.info>
	<87bjett3ud.wl-tiwai@suse.de>
	<7929c116-ff2e-413b-ae73-e7d19e846e0f@harin.net>
	<87v7czrasg.wl-tiwai@suse.de>
	<trinity-c85da660-f130-434c-a64c-a076180ce5c0-1778158023623@3c-app-mailcom-bs03>
	<87qznnpd2p.wl-tiwai@suse.de>
	<CAFTm+6Bj_dWdSifUoS7hZ3kfVambXK_=7jyGuHp33RZoSEGVUA@mail.gmail.com>
	<87cxz7p8b3.wl-tiwai@suse.de>
	<CAFTm+6AfeXKf=b2frG4xC5yC4jjM9TkD6c8+dOWWFw6BDjDESw@mail.gmail.com>
	<trinity-2f1dd3ff-4c75-4085-86ae-cca1d09aa83f-1778178205524@3c-app-mailcom-bs11>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_TO(0.00)[gmx.us];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.us];
	FREEMAIL_CC(0.00)[gmail.com,suse.de,harin.net,leemhuis.info,perex.cz,suse.com,lists.linux.dev,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Rspamd-Queue-Id: C6F0366D07
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -2.01

On Thu, 07 May 2026 20:23:25 +0200,
Dutch Ingraham wrote:
> 
> 
> 
> > Sent: Thursday, May 07, 2026 at 10:12 AM
> > From: "Matt DeVillier" <matt.devillier@gmail.com>
> > To: "Takashi Iwai" <tiwai@suse.de>
> > Cc: "Dutch Ingraham" <stoa@gmx.us>, "Harin Lee" <me@harin.net>, "Thorsten Leemhuis" <regressions@leemhuis.info>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Linux kernel regressions list" <regressions@lists.linux.dev>, "Linux Sound System" <linux-sound@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>
> > Subject: Re: [regression] ctxfi: no speaker output when headphones connected on >=7.0.x
> >
> > On Thu, May 7, 2026 at 10:07 AM Takashi Iwai <tiwai@suse.de> wrote:
> > >
> > > On Thu, 07 May 2026 17:02:14 +0200,
> > > Matt DeVillier wrote:
> > > >
> > > >
> > > > On Thu, May 7, 2026 at 8:24 AM Takashi Iwai <tiwai@suse.de> wrote:
> > > >
> > > >     On Thu, 07 May 2026 14:47:03 +0200,
> > > >     Dutch Ingraham wrote:
> > > >     >
> > > >     > > Sent: Thursday, May 07, 2026 at 1:30 AM
> > > >     > > From: "Takashi Iwai" <tiwai@suse.de>
> > > >     > > To: "Harin Lee" <me@harin.net>
> > > >     > > Cc: "Takashi Iwai" <tiwai@suse.de>, "Thorsten Leemhuis" <
> > > >     regressions@leemhuis.info>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi
> > > >     Iwai" <tiwai@suse.com>, "Linux kernel regressions list" <
> > > >     regressions@lists.linux.dev>, "Linux Sound System" <
> > > >     linux-sound@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>,
> > > >     stoa@gmx.us
> > > >     > > Subject: Re: [regression] ctxfi: no speaker output when headphones
> > > >     connected on >=7.0.x
> > > >     > >
> > > >     > > On Thu, 07 May 2026 00:06:11 +0200,
> > > >     > > Harin Lee wrote:
> > > >     > > >
> > > >     > > > On 5/6/26 4:05 PM, Takashi Iwai wrote:
> > > >     > > > > On Wed, 06 May 2026 08:24:36 +0200,
> > > >     > > > > Thorsten Leemhuis wrote:
> > > >     > > > >>
> > > >     > > > >> Hi! Just FYI, I noticed a regression report in bugzilla:
> > > >     > > > >>
> > > >     > > > >> https://bugzilla.kernel.org/show_bug.cgi?id=221461
> > > >     > > > >>
> > > >     > > > >> To quote:
> > > >     > > > >>
> > > >     > > > >>> Dutch Ingraham 2026-05-03 18:12:49 UTC
> > > >     > > > >>>
> > > >     > > > >>> Kernels >=7.0.1 contain a regression as to Creative Sound
> > > >     Blaster Z SE
> > > >     > > > >>> discrete pci sound card, but not integrated. Kernels 7.0.1,
> > > >     7.0.2, and
> > > >     > > > >>> 7.0.3 tested; 7.0.0 not tested. Reverting to any 6.18.x or
> > > >     6.12.x does
> > > >     > > > >>> not present the issue.
> > > >     > > > >>>
> > > >     > > > >>> Specifically, using pipewire managed by pavucontrol, on both
> > > >     Gentoo and
> > > >     > > > >>> Arch Linux, when both external speakers and headphones are
> > > >     connected,
> > > >     > > > >>> all sound is routed through the headphones regardless of
> > > >     whether settings
> > > >     > > > >>> are set to Line Out/Speaker or Line Out/Headphones; there is no
> > > >     speaker
> > > >     > > > >>> output. If headphones are disconnected, without reboot,
> > > >     speakers work;
> > > >     > > > >>> reconnect headphones, without reboot, sound reverts to
> > > >     headphones.
> > > >     > > > >>>
> > > >     > > > >>> Kernel: 7.0.3, Gentoo compiled from source using olddefconfig
> > > >     on 6.18.24
> > > >     > > > >>>               .config; Arch standard release
> > > >     > > > >>> 'lspci -nnk | grep -i audio' attached
> > > >     > > > >>> 'dmesg | grep -i audio' for 7.0.3 and 6.18.24 attached
> > > >     > > > >>> pipewire-1.6.4 on both Gentoo and Arch Linux
> > > >     > > > >>> alsa-firmware-1.2.4 on both Gentoo and Arch Linux
> > > >     > > > >>> 'cat /proc/sys/kernel/tainted' returns 0 for both Gentoo and
> > > >     Arch Linux
> > > >     > > > >>>
> > > >     > > > >>> Processor             :       AMD Ryzen7 5700G
> > > >     > > > >>> Motherboard           :       Asus Prime X570-Pro
> > > >     > > > >>> RAM                           :       Patriot Viper Steel DDR-4
> > > >     @3200mHz
> > > >     > > > >>> Graphics        :   ASRock AMD Radeon RX 7600 Challenger 8GB OC
> > > >     > > > >>> Sound Card      :   Creative Sound Blaster Z SE
> > > >     > > > >>>
> > > >     > > > >>>
> > > >     > > > >>> Expected outcome: ability to choose output to either speakers
> > > >     or head-
> > > >     > > > >>> phones while both are plugged-in to sound card.
> > > >     > > > >>>
> > > >     > > > >>> Workaround: none known.
> > > >     > > > >>
> > > >     > > > >> See the ticket for more details. One of them: 7.1-rc2 is
> > > >     affected as
> > > >     > > > >> well. Reporter is CCed. Forwarded this to ensure this report
> > > >     makes it to
> > > >     > > > >> the interested parties, as bugzilla might not have forwarded
> > > >     this.
> > > >     > > > >>
> > > >     > > > >> Dutch Ingraham: if nobody within a few days has an idea why this
> > > >     > > > >> happens, you will likely have to use a git bisection to get this
> > > >     resolved.
> > > >     > > > >
> > > >     > > > > As there have been many significant changes in ctxfi since 6.18,
> > > >     it's
> > > >     > > > > hard to tell what broke.  Please go git bisect.
> > > >     > > > >
> > > >     > > > >
> > > >     > > > > thanks,
> > > >     > > > >
> > > >     > > > > Takashi
> > > >     > > > >
> > > >     > > >
> > > >     > > > Creative Sound Blaster Z-series uses the snd_hda_codec_ca0132
> > > >     driver,
> > > >     > > > not snd_ctxfi. The dmesg logs in the bugzilla shows only ca0132
> > > >     > > > entries.
> > > >     > >
> > > >     > > Ah, sorry, then it's easier.  The only major change is the
> > > >     > > commit 778031e1658d206a52bf9491c91ae5d4f4a2509d
> > > >     > >     ALSA: hda/ca0132: Set HP/Speaker auto-detect default from
> > > >     headphone pin verb
> > > >     > >
> > > >     > > Try to revert this one.
> > > >     > >
> > > >     > >
> > > >     > > thanks,
> > > >     > >
> > > >     > > Takashi
> > > >     > >
> > > >     >
> > > >     > I can confirm this seems like a good candidate. I built and tested
> > > >     6.19.14
> > > >     > and 7.0. On 6.19.14, speakers work as expected; on 7.0, speakers are
> > > >     not
> > > >     > working as expected and the offending patch is included in the 7.0
> > > >     patchset.
> > > >     >
> > > >     > Thank you all for your work on this issue.
> > > >
> > > >     OK, then let's put Matt to the party.
> > > >     Matt, could you help for debugging the regression?
> > > >
> > > >     Takashi
> > > >
> > > > I can confirm the regression here on my 2013 Chromebook Pixel w/CA0132.
> > > >
> > > > Looking more closely, the issue is that tVNID_HP_ASEL and VNID_HP_SEL are
> > > > mutually exclusive selection sources in ca0132_select_out() /
> > > > ca0132_alt_select_out(),
> > > > and auto-detect always "wins." So, enabling auto-detect effectively disabled
> > > > user
> > > > override.
> > > >
> > > > While reverting would fix this problem, it would reintroduce the problem of
> > > > jack-detect being
> > > > ignored completely. A better solution would be to default to auto-detect, but
> > > > allow manual selection
> > > > to override. Here's a quick patch I whipped up that should resolve the issue
> > > > (untested though):
> > > > ---
> > > > From: Matt DeVillier <matt.devillier@gmail.com>
> > > > Date: Thu, 7 May 2026 09:58:41 -0500
> > > > Subject: [PATCH] ALSA: hda/ca0132: Disable auto-detect on manual output
> > > > select
> > > >
> > > > Commit 778031e1658d ("ALSA: hda/ca0132: Set HP/Speaker
> > > > auto-detect default from headphone pin verb") enables HP/Speaker
> > > > auto-detect by default when the headphone pin supports presence detect.
> > > >
> > > > With auto-detect enabled, ca0132_select_out() and ca0132_alt_select_out()
> > > > choose the output from jack presence instead of the manual HP/Speaker
> > > > selection. This means selecting speaker output while headphones are
> > > > plugged in updates the control state, but audio still routes to the
> > > > headphones.
> > > >
> > > > Treat an explicit manual output selection as a request to leave
> > > > auto-detect mode. Clear the HP/Speaker auto-detect switch before applying
> > > > the manual selection, and notify userspace so the auto-detect control
> > > > state is updated in mixers. Do this for both the normal HP/Speaker
> > > > Playback Switch and the alternate Output Select control used by desktop
> > > > cards.
> > > >
> > > > This keeps auto-detect enabled by default for devices with jack presence
> > > > detection, while preserving the expected behavior that a manual output
> > > > choice takes effect immediately.
> > > >
> > > > Fixes: 778031e1658d ("ALSA: hda/ca0132: Set HP/Speaker auto-detect default
> > > > from headphone pin verb")
> > > > Signed-off-by: Matt DeVillier <matt.devillier@gmail.com>
> > > > ---
> > > >  sound/hda/codecs/ca0132.c | 44 +++++++++++++++++++++++++++++++-------------
> > > >  1 file changed, 31 insertions(+), 13 deletions(-)
> > > >
> > > > diff --git a/sound/hda/codecs/ca0132.c b/sound/hda/codecs/ca0132.c
> > > > index ad533b04ab29..be565ffaade0 100644
> > > > --- a/sound/hda/codecs/ca0132.c
> > > > +++ b/sound/hda/codecs/ca0132.c
> > > > @@ -5498,6 +5498,30 @@ static int zxr_headphone_gain_set(struct hda_codec
> > > > *codec, long val)
> > > >   return 0;
> > > >  }
> > > (snip)
> > >
> > > It looks like that the patch is malformed by your mailer.
> > > For avoiding unneeded troubles, please fix the setup or give an
> > > attachment, too.
> > >
> > >
> > > thanks,
> > >
> > > Takashi
> > 
> > My apologies, forgot to ensure text-mode sending when I replied.
> > Hopefully better this time.
> > 
> > regards,
> > Matt
> > 
> 
> Patched against originally non-working v7.0. Now, works as expected; can
> choose Line Out / Speaker or Line Out / Headphones and default holds
> across reboots.
> 
> Thank you Matt and all others who gave your attention to this issue.

Thanks for confirmation.  Now I applied the fix.


Takashi

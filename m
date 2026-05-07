Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9068F3EDAD6
	for <regressions@lists.linux.dev>; Thu,  7 May 2026 15:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778166453; cv=none; b=YDL0D5V82L9z41PYSxsgXbu4hZ6OVNO41/+f/C7eqQPKXPqBkLqivcFGfjGtJpbiSy2AtB1+7xb4zysBV4VF2KzRYQ/3shR8HsUUBSqvBlhCSs1KqdKMO+CQY6QU6aKR9NGBEQ6U69AMN4SLP13+RX6B8TMXZnqU7nd1BzM4ExY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778166453; c=relaxed/simple;
	bh=w4S6zcjkevu+m66+X1ZinwlC4+AIm6Mmdut+Z996gp4=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DDSeNqEe1Jy9TMu9pw6nKLRcMdJA/dbmLXIgD9ELC7fNF7G/XEXlQOEurMu1P86NG3VX1N5Y6zyujKV4sN1zH/mkd/pAWvRHDUeM+9ZV3noLjLQCOxVffYTRm44Yz2b882vR6JRklPk5NcQIwU3iL34xjgNYvC3duzO8BvFWq+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dAWQDpRg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=/bajW/wN; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dtLUQf48; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5Fm/u7mf; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dAWQDpRg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="/bajW/wN";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dtLUQf48";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5Fm/u7mf"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id C3F7B6C49A;
	Thu,  7 May 2026 15:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778166449; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NFoFlNcwTo+xvCiHp5/Q+8B/DlHTyEpfhhYewcHHsbU=;
	b=dAWQDpRg3DfgRl9izQ+m6QAl+FRED0LbsEJFZP0HOo+94/7TDUVo5M+clqB1diNOa3GFwo
	9P/6iitw5SH9A7VYfuSg76su0Fz78jWm+KFHLJGgKWozYGsQmGk/rU+tu7CGKrnc9dnmH+
	Jt4Lm+ov5xNJS4fEJn0gTiWoWbAA2Hc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778166449;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NFoFlNcwTo+xvCiHp5/Q+8B/DlHTyEpfhhYewcHHsbU=;
	b=/bajW/wNnB8Q+0fDS+YEdcvqYi11HeqWaAttiUmnrt0O1JqzlPtFyoAfY91vpIScskmPRK
	f5MDFOrL0sOWRuCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=dtLUQf48;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="5Fm/u7mf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778166448; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NFoFlNcwTo+xvCiHp5/Q+8B/DlHTyEpfhhYewcHHsbU=;
	b=dtLUQf48hgzrgsYRvUKA3NqrhSwjFGkk3J4aK5ILfRVcFYSMSSNmDifO54REC/hTJ6dKKr
	kXia2mTh9tQ2jqvMDW7S9iboUC0WHE0nKGWre0h8qv6pAk1ZLw/04S17OEi0RXSSm6+C1Z
	Zwn9VDDAsoFH/+V38GJYD1BJgRwoAL8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778166448;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NFoFlNcwTo+xvCiHp5/Q+8B/DlHTyEpfhhYewcHHsbU=;
	b=5Fm/u7mf6/qxPL2U0jKN5AdkXgqzfr9jbnWDQMIhGqrB7nHeWEsU6H1w8hMQnAtmHsIu05
	ygYt9PEwJpR6ChAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7A976593A7;
	Thu,  7 May 2026 15:07:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id trZyHLCq/GmKXAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 07 May 2026 15:07:28 +0000
Date: Thu, 07 May 2026 17:07:28 +0200
Message-ID: <87cxz7p8b3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Matt DeVillier <matt.devillier@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Dutch Ingraham <stoa@gmx.us>,
	Harin Lee <me@harin.net>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Linux kernel regressions list <regressions@lists.linux.dev>,
	Linux Sound System <linux-sound@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [regression] ctxfi: no speaker output when headphones connected on >=7.0.x
In-Reply-To: <CAFTm+6Bj_dWdSifUoS7hZ3kfVambXK_=7jyGuHp33RZoSEGVUA@mail.gmail.com>
References: <36875d66-f601-4d18-9654-bd86b60918e8@leemhuis.info>
	<87bjett3ud.wl-tiwai@suse.de>
	<7929c116-ff2e-413b-ae73-e7d19e846e0f@harin.net>
	<87v7czrasg.wl-tiwai@suse.de>
	<trinity-c85da660-f130-434c-a64c-a076180ce5c0-1778158023623@3c-app-mailcom-bs03>
	<87qznnpd2p.wl-tiwai@suse.de>
	<CAFTm+6Bj_dWdSifUoS7hZ3kfVambXK_=7jyGuHp33RZoSEGVUA@mail.gmail.com>
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
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.us];
	FREEMAIL_CC(0.00)[suse.de,gmx.us,harin.net,leemhuis.info,perex.cz,suse.com,lists.linux.dev,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:email,suse.de:mid,leemhuis.info:email,perex.cz:email,linux.dev:email,suse.com:email,gmx.us:email,harin.net:email]
X-Rspamd-Queue-Id: C3F7B6C49A
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -2.01

On Thu, 07 May 2026 17:02:14 +0200,
Matt DeVillier wrote:
> 
> 
> On Thu, May 7, 2026 at 8:24 AM Takashi Iwai <tiwai@suse.de> wrote:
> 
>     On Thu, 07 May 2026 14:47:03 +0200,
>     Dutch Ingraham wrote:
>     >
>     > > Sent: Thursday, May 07, 2026 at 1:30 AM
>     > > From: "Takashi Iwai" <tiwai@suse.de>
>     > > To: "Harin Lee" <me@harin.net>
>     > > Cc: "Takashi Iwai" <tiwai@suse.de>, "Thorsten Leemhuis" <
>     regressions@leemhuis.info>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi
>     Iwai" <tiwai@suse.com>, "Linux kernel regressions list" <
>     regressions@lists.linux.dev>, "Linux Sound System" <
>     linux-sound@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>, 
>     stoa@gmx.us
>     > > Subject: Re: [regression] ctxfi: no speaker output when headphones
>     connected on >=7.0.x
>     > >
>     > > On Thu, 07 May 2026 00:06:11 +0200,
>     > > Harin Lee wrote:
>     > > >
>     > > > On 5/6/26 4:05 PM, Takashi Iwai wrote:
>     > > > > On Wed, 06 May 2026 08:24:36 +0200,
>     > > > > Thorsten Leemhuis wrote:
>     > > > >>
>     > > > >> Hi! Just FYI, I noticed a regression report in bugzilla:
>     > > > >>
>     > > > >> https://bugzilla.kernel.org/show_bug.cgi?id=221461
>     > > > >>
>     > > > >> To quote:
>     > > > >>
>     > > > >>> Dutch Ingraham 2026-05-03 18:12:49 UTC
>     > > > >>>
>     > > > >>> Kernels >=7.0.1 contain a regression as to Creative Sound
>     Blaster Z SE
>     > > > >>> discrete pci sound card, but not integrated. Kernels 7.0.1,
>     7.0.2, and
>     > > > >>> 7.0.3 tested; 7.0.0 not tested. Reverting to any 6.18.x or
>     6.12.x does
>     > > > >>> not present the issue.
>     > > > >>>
>     > > > >>> Specifically, using pipewire managed by pavucontrol, on both
>     Gentoo and
>     > > > >>> Arch Linux, when both external speakers and headphones are
>     connected,
>     > > > >>> all sound is routed through the headphones regardless of
>     whether settings
>     > > > >>> are set to Line Out/Speaker or Line Out/Headphones; there is no
>     speaker
>     > > > >>> output. If headphones are disconnected, without reboot,
>     speakers work;
>     > > > >>> reconnect headphones, without reboot, sound reverts to
>     headphones.
>     > > > >>>
>     > > > >>> Kernel: 7.0.3, Gentoo compiled from source using olddefconfig
>     on 6.18.24
>     > > > >>>               .config; Arch standard release
>     > > > >>> 'lspci -nnk | grep -i audio' attached
>     > > > >>> 'dmesg | grep -i audio' for 7.0.3 and 6.18.24 attached
>     > > > >>> pipewire-1.6.4 on both Gentoo and Arch Linux
>     > > > >>> alsa-firmware-1.2.4 on both Gentoo and Arch Linux
>     > > > >>> 'cat /proc/sys/kernel/tainted' returns 0 for both Gentoo and
>     Arch Linux
>     > > > >>>
>     > > > >>> Processor             :       AMD Ryzen7 5700G
>     > > > >>> Motherboard           :       Asus Prime X570-Pro
>     > > > >>> RAM                           :       Patriot Viper Steel DDR-4
>     @3200mHz
>     > > > >>> Graphics        :   ASRock AMD Radeon RX 7600 Challenger 8GB OC
>     > > > >>> Sound Card      :   Creative Sound Blaster Z SE
>     > > > >>>
>     > > > >>>
>     > > > >>> Expected outcome: ability to choose output to either speakers
>     or head-
>     > > > >>> phones while both are plugged-in to sound card.
>     > > > >>>
>     > > > >>> Workaround: none known.
>     > > > >>
>     > > > >> See the ticket for more details. One of them: 7.1-rc2 is
>     affected as
>     > > > >> well. Reporter is CCed. Forwarded this to ensure this report
>     makes it to
>     > > > >> the interested parties, as bugzilla might not have forwarded
>     this.
>     > > > >>
>     > > > >> Dutch Ingraham: if nobody within a few days has an idea why this
>     > > > >> happens, you will likely have to use a git bisection to get this
>     resolved.
>     > > > >
>     > > > > As there have been many significant changes in ctxfi since 6.18,
>     it's
>     > > > > hard to tell what broke.  Please go git bisect.
>     > > > >
>     > > > >
>     > > > > thanks,
>     > > > >
>     > > > > Takashi
>     > > > >
>     > > >
>     > > > Creative Sound Blaster Z-series uses the snd_hda_codec_ca0132
>     driver,
>     > > > not snd_ctxfi. The dmesg logs in the bugzilla shows only ca0132
>     > > > entries.
>     > >
>     > > Ah, sorry, then it's easier.  The only major change is the
>     > > commit 778031e1658d206a52bf9491c91ae5d4f4a2509d
>     > >     ALSA: hda/ca0132: Set HP/Speaker auto-detect default from
>     headphone pin verb
>     > >
>     > > Try to revert this one.
>     > >
>     > >
>     > > thanks,
>     > >
>     > > Takashi
>     > >
>     >
>     > I can confirm this seems like a good candidate. I built and tested
>     6.19.14
>     > and 7.0. On 6.19.14, speakers work as expected; on 7.0, speakers are
>     not
>     > working as expected and the offending patch is included in the 7.0
>     patchset.
>     >
>     > Thank you all for your work on this issue.
>    
>     OK, then let's put Matt to the party.
>     Matt, could you help for debugging the regression?
> 
>     Takashi
> 
> I can confirm the regression here on my 2013 Chromebook Pixel w/CA0132.
> 
> Looking more closely, the issue is that tVNID_HP_ASEL and VNID_HP_SEL are
> mutually exclusive selection sources in ca0132_select_out() /
> ca0132_alt_select_out(),
> and auto-detect always "wins." So, enabling auto-detect effectively disabled
> user
> override.
> 
> While reverting would fix this problem, it would reintroduce the problem of
> jack-detect being
> ignored completely. A better solution would be to default to auto-detect, but
> allow manual selection
> to override. Here's a quick patch I whipped up that should resolve the issue
> (untested though):
> ---
> From: Matt DeVillier <matt.devillier@gmail.com>
> Date: Thu, 7 May 2026 09:58:41 -0500
> Subject: [PATCH] ALSA: hda/ca0132: Disable auto-detect on manual output
> select
> 
> Commit 778031e1658d ("ALSA: hda/ca0132: Set HP/Speaker
> auto-detect default from headphone pin verb") enables HP/Speaker
> auto-detect by default when the headphone pin supports presence detect.
> 
> With auto-detect enabled, ca0132_select_out() and ca0132_alt_select_out()
> choose the output from jack presence instead of the manual HP/Speaker
> selection. This means selecting speaker output while headphones are
> plugged in updates the control state, but audio still routes to the
> headphones.
> 
> Treat an explicit manual output selection as a request to leave
> auto-detect mode. Clear the HP/Speaker auto-detect switch before applying
> the manual selection, and notify userspace so the auto-detect control
> state is updated in mixers. Do this for both the normal HP/Speaker
> Playback Switch and the alternate Output Select control used by desktop
> cards.
> 
> This keeps auto-detect enabled by default for devices with jack presence
> detection, while preserving the expected behavior that a manual output
> choice takes effect immediately.
> 
> Fixes: 778031e1658d ("ALSA: hda/ca0132: Set HP/Speaker auto-detect default
> from headphone pin verb")
> Signed-off-by: Matt DeVillier <matt.devillier@gmail.com>
> ---
>  sound/hda/codecs/ca0132.c | 44 +++++++++++++++++++++++++++++++-------------
>  1 file changed, 31 insertions(+), 13 deletions(-)
> 
> diff --git a/sound/hda/codecs/ca0132.c b/sound/hda/codecs/ca0132.c
> index ad533b04ab29..be565ffaade0 100644
> --- a/sound/hda/codecs/ca0132.c
> +++ b/sound/hda/codecs/ca0132.c
> @@ -5498,6 +5498,30 @@ static int zxr_headphone_gain_set(struct hda_codec
> *codec, long val)
>   return 0;
>  }
(snip)

It looks like that the patch is malformed by your mailer.
For avoiding unneeded troubles, please fix the setup or give an
attachment, too.


thanks,

Takashi

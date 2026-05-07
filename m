Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07DE3F9F35
	for <regressions@lists.linux.dev>; Thu,  7 May 2026 13:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778160279; cv=none; b=dLadcwdpq66dsW9UgBMgBnuIGQDP5ydX1Pyp0v3VKxJ0hAX0eIQ2CxEtvQEe5bZt0e0m+Hr0CM4WRxbWiEUWQVUg9Iw/1XIziVnqIT6TNaab8082g7sqUffcbq6UGW37rQAf0naR2t27gi7EMQlcysXPvYrHR/7485Ulu+BAySU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778160279; c=relaxed/simple;
	bh=jEJY9P21gNV4Tkvx/gB+23ZX6SpU6eVNb4s/rwb2nTQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kgBJ0ChLO7fT/UjQB41cWJ8/+aIl3oAnmBEjv2BRuymgw66nF+Iny0WjPbMWYKjZyoJZCE6BZtupm/GHuXT8NJtwOJM6Wf9+KXaXK7PxIb+YFfJ4c/lYCeS/FJOCHNPvNsyFw0iMXoIQTFjwTqPT7zdLoTb1t7nN2td7NoQACrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VNuMgdaw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=26RN7Q3b; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VNuMgdaw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=26RN7Q3b; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VNuMgdaw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="26RN7Q3b";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VNuMgdaw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="26RN7Q3b"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7408766D2F;
	Thu,  7 May 2026 13:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778160271; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DMh8pnMsfMs24o4kg2uEJRLF/FMF2DHddoTt+5thtY8=;
	b=VNuMgdaww1enlFoVMkXQ2itV/hqGy93eaExkT69dCr7Ltx0sjQaM3wilF5e261qpCHbQDt
	nkF0w4ceqpQXHz/dVG9I9dT9cSBZs7f2rUgk94sT4Ca8daT8Ez8ZgRxtk/i1yiqfNb2reR
	S4lP4HIPItLX2cwq7SL4TkzHeRO/yq8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778160271;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DMh8pnMsfMs24o4kg2uEJRLF/FMF2DHddoTt+5thtY8=;
	b=26RN7Q3bPeguIJDUIEMT1iREnac/uOxiAXdE4HIgnVWpO5My5UIl0HYAyF1OXJsVX5ncSJ
	+kbgZLoHcMNALADA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=VNuMgdaw;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=26RN7Q3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778160271; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DMh8pnMsfMs24o4kg2uEJRLF/FMF2DHddoTt+5thtY8=;
	b=VNuMgdaww1enlFoVMkXQ2itV/hqGy93eaExkT69dCr7Ltx0sjQaM3wilF5e261qpCHbQDt
	nkF0w4ceqpQXHz/dVG9I9dT9cSBZs7f2rUgk94sT4Ca8daT8Ez8ZgRxtk/i1yiqfNb2reR
	S4lP4HIPItLX2cwq7SL4TkzHeRO/yq8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778160271;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DMh8pnMsfMs24o4kg2uEJRLF/FMF2DHddoTt+5thtY8=;
	b=26RN7Q3bPeguIJDUIEMT1iREnac/uOxiAXdE4HIgnVWpO5My5UIl0HYAyF1OXJsVX5ncSJ
	+kbgZLoHcMNALADA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 27095593A7;
	Thu,  7 May 2026 13:24:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id aHmVB4+S/GntcQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 07 May 2026 13:24:31 +0000
Date: Thu, 07 May 2026 15:24:30 +0200
Message-ID: <87qznnpd2p.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Matt DeVillier <matt.devillier@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
    Dutch Ingraham <stoa@gmx.us>,
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
In-Reply-To: <trinity-c85da660-f130-434c-a64c-a076180ce5c0-1778158023623@3c-app-mailcom-bs03>
References: <36875d66-f601-4d18-9654-bd86b60918e8@leemhuis.info>
	<87bjett3ud.wl-tiwai@suse.de>
	<7929c116-ff2e-413b-ae73-e7d19e846e0f@harin.net>
	<87v7czrasg.wl-tiwai@suse.de>
	<trinity-c85da660-f130-434c-a64c-a076180ce5c0-1778158023623@3c-app-mailcom-bs03>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.us];
	FREEMAIL_CC(0.00)[suse.de,gmx.us,harin.net,leemhuis.info,perex.cz,suse.com,lists.linux.dev,vger.kernel.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[leemhuis.info:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:email,suse.de:mid,suse.com:email]
X-Rspamd-Queue-Id: 7408766D2F
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -2.01

On Thu, 07 May 2026 14:47:03 +0200,
Dutch Ingraham wrote:
> 
> > Sent: Thursday, May 07, 2026 at 1:30 AM
> > From: "Takashi Iwai" <tiwai@suse.de>
> > To: "Harin Lee" <me@harin.net>
> > Cc: "Takashi Iwai" <tiwai@suse.de>, "Thorsten Leemhuis" <regressions@leemhuis.info>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>, "Linux kernel regressions list" <regressions@lists.linux.dev>, "Linux Sound System" <linux-sound@vger.kernel.org>, "LKML" <linux-kernel@vger.kernel.org>, stoa@gmx.us
> > Subject: Re: [regression] ctxfi: no speaker output when headphones connected on >=7.0.x
> >
> > On Thu, 07 May 2026 00:06:11 +0200,
> > Harin Lee wrote:
> > > 
> > > On 5/6/26 4:05 PM, Takashi Iwai wrote:
> > > > On Wed, 06 May 2026 08:24:36 +0200,
> > > > Thorsten Leemhuis wrote:
> > > >> 
> > > >> Hi! Just FYI, I noticed a regression report in bugzilla:
> > > >> 
> > > >> https://bugzilla.kernel.org/show_bug.cgi?id=221461
> > > >> 
> > > >> To quote:
> > > >> 
> > > >>> Dutch Ingraham 2026-05-03 18:12:49 UTC
> > > >>> 
> > > >>> Kernels >=7.0.1 contain a regression as to Creative Sound Blaster Z SE
> > > >>> discrete pci sound card, but not integrated. Kernels 7.0.1, 7.0.2, and
> > > >>> 7.0.3 tested; 7.0.0 not tested. Reverting to any 6.18.x or 6.12.x does
> > > >>> not present the issue.
> > > >>> 
> > > >>> Specifically, using pipewire managed by pavucontrol, on both Gentoo and
> > > >>> Arch Linux, when both external speakers and headphones are connected,
> > > >>> all sound is routed through the headphones regardless of whether settings
> > > >>> are set to Line Out/Speaker or Line Out/Headphones; there is no speaker
> > > >>> output. If headphones are disconnected, without reboot, speakers work;
> > > >>> reconnect headphones, without reboot, sound reverts to headphones.
> > > >>> 
> > > >>> Kernel: 7.0.3, Gentoo compiled from source using olddefconfig on 6.18.24
> > > >>> 		.config; Arch standard release
> > > >>> 'lspci -nnk | grep -i audio' attached
> > > >>> 'dmesg | grep -i audio' for 7.0.3 and 6.18.24 attached
> > > >>> pipewire-1.6.4 on both Gentoo and Arch Linux
> > > >>> alsa-firmware-1.2.4 on both Gentoo and Arch Linux
> > > >>> 'cat /proc/sys/kernel/tainted' returns 0 for both Gentoo and Arch Linux
> > > >>> 
> > > >>> Processor		:	AMD Ryzen7 5700G
> > > >>> Motherboard		:	Asus Prime X570-Pro
> > > >>> RAM				:	Patriot Viper Steel DDR-4 @3200mHz
> > > >>> Graphics        :   ASRock AMD Radeon RX 7600 Challenger 8GB OC
> > > >>> Sound Card      :   Creative Sound Blaster Z SE
> > > >>> 
> > > >>> 
> > > >>> Expected outcome: ability to choose output to either speakers or head-
> > > >>> phones while both are plugged-in to sound card.
> > > >>> 
> > > >>> Workaround: none known.
> > > >> 
> > > >> See the ticket for more details. One of them: 7.1-rc2 is affected as
> > > >> well. Reporter is CCed. Forwarded this to ensure this report makes it to
> > > >> the interested parties, as bugzilla might not have forwarded this.
> > > >> 
> > > >> Dutch Ingraham: if nobody within a few days has an idea why this
> > > >> happens, you will likely have to use a git bisection to get this resolved.
> > > > 
> > > > As there have been many significant changes in ctxfi since 6.18, it's
> > > > hard to tell what broke.  Please go git bisect.
> > > > 
> > > > 
> > > > thanks,
> > > > 
> > > > Takashi
> > > > 
> > > 
> > > Creative Sound Blaster Z-series uses the snd_hda_codec_ca0132 driver,
> > > not snd_ctxfi. The dmesg logs in the bugzilla shows only ca0132
> > > entries.
> > 
> > Ah, sorry, then it's easier.  The only major change is the
> > commit 778031e1658d206a52bf9491c91ae5d4f4a2509d
> >     ALSA: hda/ca0132: Set HP/Speaker auto-detect default from headphone pin verb
> > 
> > Try to revert this one.
> > 
> > 
> > thanks,
> > 
> > Takashi
> > 
> 
> I can confirm this seems like a good candidate. I built and tested 6.19.14
> and 7.0. On 6.19.14, speakers work as expected; on 7.0, speakers are not
> working as expected and the offending patch is included in the 7.0 patchset.
> 
> Thank you all for your work on this issue.

OK, then let's put Matt to the party.
Matt, could you help for debugging the regression?


Takashi

Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D015930B502
	for <regressions@lists.linux.dev>; Thu,  7 May 2026 06:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778135460; cv=none; b=jPTxAnflAGNe5KbwsNO5k4nO8IxqmR31UUE+gGQ6DpOaITld5gT/0g0+v3WQEnpYbY0r0m/EDUMnGjUFCK6qKUtYd3L1BnQ+MYPMfGVp8r+N0zNRlY7kT2EvqjADH87VQA+Kxd/6TINjpl4/vs9IOCNZR/BZhTSZAX+dqW1vkJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778135460; c=relaxed/simple;
	bh=zvRBYWCH+40kkk25vA0pRR1NNoZOpRUEbQ7rluml4dU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bqZe1K6z7BLdb3JfRQ+G1wSzHEPhrnjfkqddIgRU5Zj8g890L8vXouo8pG49ZqTjcD+DrGmeNlpWcE26OUbNk3Np9BZtulsbzjWOFVCBKuu/liZHt8hIl5GAFxiWhrYCRt7jflTeVVQ9mGLqrFUmXOtXpKEVhdErNfQk3uR2o2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=eWHbUhh2; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=s4Tundeo; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=oIxRsprf; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=t88P4H7R; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="eWHbUhh2";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="s4Tundeo";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="oIxRsprf";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="t88P4H7R"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2E6AD6C0EF;
	Thu,  7 May 2026 06:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778135457; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KIqkZZ/pvJuXyh6+01SchqSmGEsFf1BU4zPkUR94J9s=;
	b=eWHbUhh2Ogl06IOckRyQqJrs+fN+cFaTdy6HiwNDZ5iYju/cKc4FSaYmG9QA/sbrmhAD4U
	9j00Q0I7q4CYKq9ZZSz7g1wLiO+O0wbiQm8SCyvgo9bEZ/tfuG2UvsKebMkkmGurW+R6Rk
	gYbUb8PyQ1jhzqOSglZte/46V6VR0WI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778135457;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KIqkZZ/pvJuXyh6+01SchqSmGEsFf1BU4zPkUR94J9s=;
	b=s4Tundeoa9oNp5oPHoAMtWW8bfe6tfyODWXkXSQh14fDQvDc38j3y6ZBlG8coITFIQiOS/
	DxqacFcOhW1StTDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1778135456; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KIqkZZ/pvJuXyh6+01SchqSmGEsFf1BU4zPkUR94J9s=;
	b=oIxRsprfRC7hZBlnyZGKp6ky5R6gdN2UFcPZgVzNplWZzSig1PQ1lbtYFORKcj3LyZs/Wp
	1332TEuaHZKGEEPNNSRqNdfzcVJ8QDe9UJqBt3rAgfKcehcVKUdfgAYATQhpqlei/YDU12
	yWJKdtzZ4IFyugOXsWWEzSVyIpGDCwQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1778135456;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KIqkZZ/pvJuXyh6+01SchqSmGEsFf1BU4zPkUR94J9s=;
	b=t88P4H7R8fFdJ2HQnDbncwA40dc4UX4xQTtDfq2VeqBqrFIhS3of1mMTx3gV/maJj5PpmK
	2vtfm5Zz4902uiBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DB9C6593A7;
	Thu,  7 May 2026 06:30:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KBctNJ8x/GlgTgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 07 May 2026 06:30:55 +0000
Date: Thu, 07 May 2026 08:30:55 +0200
Message-ID: <87v7czrasg.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Harin Lee <me@harin.net>
Cc: Takashi Iwai <tiwai@suse.de>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Linux kernel regressions list <regressions@lists.linux.dev>,
	Linux Sound System <linux-sound@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	stoa@gmx.us
Subject: Re: [regression] ctxfi: no speaker output when headphones connected on >=7.0.x
In-Reply-To: <7929c116-ff2e-413b-ae73-e7d19e846e0f@harin.net>
References: <36875d66-f601-4d18-9654-bd86b60918e8@leemhuis.info>
	<87bjett3ud.wl-tiwai@suse.de>
	<7929c116-ff2e-413b-ae73-e7d19e846e0f@harin.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmx.us];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[suse.de,leemhuis.info,perex.cz,suse.com,lists.linux.dev,vger.kernel.org,gmx.us];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-Spam-Level: 

On Thu, 07 May 2026 00:06:11 +0200,
Harin Lee wrote:
> 
> On 5/6/26 4:05 PM, Takashi Iwai wrote:
> > On Wed, 06 May 2026 08:24:36 +0200,
> > Thorsten Leemhuis wrote:
> >> 
> >> Hi! Just FYI, I noticed a regression report in bugzilla:
> >> 
> >> https://bugzilla.kernel.org/show_bug.cgi?id=221461
> >> 
> >> To quote:
> >> 
> >>> Dutch Ingraham 2026-05-03 18:12:49 UTC
> >>> 
> >>> Kernels >=7.0.1 contain a regression as to Creative Sound Blaster Z SE
> >>> discrete pci sound card, but not integrated. Kernels 7.0.1, 7.0.2, and
> >>> 7.0.3 tested; 7.0.0 not tested. Reverting to any 6.18.x or 6.12.x does
> >>> not present the issue.
> >>> 
> >>> Specifically, using pipewire managed by pavucontrol, on both Gentoo and
> >>> Arch Linux, when both external speakers and headphones are connected,
> >>> all sound is routed through the headphones regardless of whether settings
> >>> are set to Line Out/Speaker or Line Out/Headphones; there is no speaker
> >>> output. If headphones are disconnected, without reboot, speakers work;
> >>> reconnect headphones, without reboot, sound reverts to headphones.
> >>> 
> >>> Kernel: 7.0.3, Gentoo compiled from source using olddefconfig on 6.18.24
> >>> 		.config; Arch standard release
> >>> 'lspci -nnk | grep -i audio' attached
> >>> 'dmesg | grep -i audio' for 7.0.3 and 6.18.24 attached
> >>> pipewire-1.6.4 on both Gentoo and Arch Linux
> >>> alsa-firmware-1.2.4 on both Gentoo and Arch Linux
> >>> 'cat /proc/sys/kernel/tainted' returns 0 for both Gentoo and Arch Linux
> >>> 
> >>> Processor		:	AMD Ryzen7 5700G
> >>> Motherboard		:	Asus Prime X570-Pro
> >>> RAM				:	Patriot Viper Steel DDR-4 @3200mHz
> >>> Graphics        :   ASRock AMD Radeon RX 7600 Challenger 8GB OC
> >>> Sound Card      :   Creative Sound Blaster Z SE
> >>> 
> >>> 
> >>> Expected outcome: ability to choose output to either speakers or head-
> >>> phones while both are plugged-in to sound card.
> >>> 
> >>> Workaround: none known.
> >> 
> >> See the ticket for more details. One of them: 7.1-rc2 is affected as
> >> well. Reporter is CCed. Forwarded this to ensure this report makes it to
> >> the interested parties, as bugzilla might not have forwarded this.
> >> 
> >> Dutch Ingraham: if nobody within a few days has an idea why this
> >> happens, you will likely have to use a git bisection to get this resolved.
> > 
> > As there have been many significant changes in ctxfi since 6.18, it's
> > hard to tell what broke.  Please go git bisect.
> > 
> > 
> > thanks,
> > 
> > Takashi
> > 
> 
> Creative Sound Blaster Z-series uses the snd_hda_codec_ca0132 driver,
> not snd_ctxfi. The dmesg logs in the bugzilla shows only ca0132
> entries.

Ah, sorry, then it's easier.  The only major change is the
commit 778031e1658d206a52bf9491c91ae5d4f4a2509d
    ALSA: hda/ca0132: Set HP/Speaker auto-detect default from headphone pin verb

Try to revert this one.


thanks,

Takashi

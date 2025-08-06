Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F68A221FD4
	for <regressions@lists.linux.dev>; Wed,  6 Aug 2025 08:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754469989; cv=none; b=fJ7Rgr597FeMPwcu/FAkRohn2OaKrWHQrKZ8XLA/1y2x6pDsQuRG0qErPN55qRRqmFJ8TOA3fsAbWpKoEx6Pe9J3cpuoJLNe2kiAAJHxJW7ZAWpkColSeqPEB2fNrNjRQYXyQfwVyTiAwVQHbYlWHUr7FamemW0RaLgzaJFPq2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754469989; c=relaxed/simple;
	bh=5bKuBrHkhx+/32ZXuFomkNfMLZF7jf03wRUCswKBOmM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=azHUbiPhG6P/QIF0oZkTk4yXpSXuCoF+CkNEurhwdI9zW8n67xWDMU/IzHN3YNCoKGuUp+WjfakLAfW7SINF4KXaW3czjmcqHEhZJHrWSSBKaTJhDKRtgYv+0TKDJtiUfoqrLlJHuR1l91RLW370adYpy7aYpy49loCad1a3psY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kBHLV+ic; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tQZxV+mF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=kBHLV+ic; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tQZxV+mF; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kBHLV+ic";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tQZxV+mF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="kBHLV+ic";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tQZxV+mF"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4E9F71F452;
	Wed,  6 Aug 2025 08:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754469985; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tCjkzVMeKyc986uSlVDKqEOhgGRWj96nKH0A6nGgInE=;
	b=kBHLV+icqXfj/J1pra31aCEKc2/IWneErEFjXo9lyj1vEJ/zohww6YRnnRfTt34NC+D26n
	iq1vq+odpRUmExAdMPnk396dlbUdxhgbuph86E6+6uPQUe6eGmK5NHhxUsa1s3QNFLIRwL
	Ltq40xQT27r5K54ecSO1IMB5Uz4sSNI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754469985;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tCjkzVMeKyc986uSlVDKqEOhgGRWj96nKH0A6nGgInE=;
	b=tQZxV+mFPZ5jaBsRxx2db3+gSf20RGjPj3UaEo9VCUgh/Ca3LYDEjHI+SDinZTGSLSLO2d
	2EA0VhRRG5kD1kAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=kBHLV+ic;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=tQZxV+mF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754469985; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tCjkzVMeKyc986uSlVDKqEOhgGRWj96nKH0A6nGgInE=;
	b=kBHLV+icqXfj/J1pra31aCEKc2/IWneErEFjXo9lyj1vEJ/zohww6YRnnRfTt34NC+D26n
	iq1vq+odpRUmExAdMPnk396dlbUdxhgbuph86E6+6uPQUe6eGmK5NHhxUsa1s3QNFLIRwL
	Ltq40xQT27r5K54ecSO1IMB5Uz4sSNI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754469985;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tCjkzVMeKyc986uSlVDKqEOhgGRWj96nKH0A6nGgInE=;
	b=tQZxV+mFPZ5jaBsRxx2db3+gSf20RGjPj3UaEo9VCUgh/Ca3LYDEjHI+SDinZTGSLSLO2d
	2EA0VhRRG5kD1kAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 2307A13AA8;
	Wed,  6 Aug 2025 08:46:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HjFlB2EWk2j1EgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 06 Aug 2025 08:46:25 +0000
Date: Wed, 06 Aug 2025 10:46:24 +0200
Message-ID: <87sei4rg67.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: Quiet crackling noise at boot and after stopping music
In-Reply-To: <d542d223-fc6e-4be7-b581-8a390ce2f6be@molgen.mpg.de>
References: <10172c80-daec-4e20-ab57-a483cf1afc02@molgen.mpg.de>
	<871pposvy9.wl-tiwai@suse.de>
	<d542d223-fc6e-4be7-b581-8a390ce2f6be@molgen.mpg.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-7
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 4E9F71F452
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid]
X-Spam-Score: -3.51

On Wed, 06 Aug 2025 10:34:57 +0200,
Paul Menzel wrote:
> 
> Dear Takashi,
> 
> 
> Thank you so much for your instant reply with the solution.
> 
> 
> Am 06.08.25 um 10:20 schrieb Takashi Iwai:
> > On Wed, 06 Aug 2025 10:15:08 +0200, Paul Menzel wrote:
> 
> >> I believe the Realtek refactoring caused a regression on my Intel Kaby
> >> Lake laptop Dell XPS 13 9360. There is quiet crackling noise during
> >> boot, when GDM is started, and also after playing music is
> >> stopped. It¢s reproducible with 6.16.0-04055-g14bed9bc81ba, that
> >> contains the sound subsystem pull request.
> >> 
> >> 177bf8620cf4 Merge tag 'sound-6.17-rc1' of
> >> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound
> >> 
> >> I uploaded the run of alsa-info [1]. I try to verify with plain 6.16 later.
> > 
> > It's likely because of the missing CONFIG_SND_HDA_CODEC_* selections.
> > Please set CONFIG_SND_HDA_CODEC_ALC269=m and
> 
> Indeed, I didn¢t select this.
> 
> > CONFIG_SND_HDA_CODEC_HDMI_INTEL=m if not done yet.
> 
> I had selected this.
> 
> > Those were already set to default=y in the later PR for avoiding such
> > a pitfall.
> 
> I remember I tried to check which to select, and I ran `alsa-info` to
> find the codecs, but only found:
> 
>     Codec: Realtek ALC3246
> 
> As this didn¢t match to any of the offerings, I didn¢t select
> it. May I suggest to extend the Kconfig help texts with notes how to
> determine the correct module?

There are quite lots of different codec names, so we can't put all
them, unfortunately...

> Also, would the driver be able to detect, if no codec modules are
> selected and log a warning?

It still "works" with the generic HD-audio codec, as you already
noticed.


Takashi

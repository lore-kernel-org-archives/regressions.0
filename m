Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEA81E834E
	for <regressions@lists.linux.dev>; Wed,  6 Aug 2025 18:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754506717; cv=none; b=dZvj1xFEpw2+TWyrQ/t3IIFS5YoVSgTgf/yvRevOIZxxD+1Omdidc+bp7WoDhYm1W3oHb9rX+eDhwKQ7Fx0Kqa6Dj5d+kVnJ1fxWpGJ4ytYY+N34Li4thTdOdmjMq1uOFibNTO5/no/viqPglDC6Qsse7q1xNyrP3cserHOiRYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754506717; c=relaxed/simple;
	bh=olo9R0Vln3qrHspG82B7o9JlnWo+8yNzFlN5wIEVe34=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O2512U6iLM8yAV7GHSXt8a6u3PlnsG4Ehtcx1eVWPo16EPdnCoiNMQh8hZKV+mKjYr+GR15WKPRzQhZZUD3YNm49vdCINpHjGi2ZnYXtINyjs9hflBXia9aOq3vdZLfLmP1NY8S8JCAQHTq0HLZo1FXNAjcY3XGSFXaPTFz/06w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=002/d+uG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zqz21s2+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=002/d+uG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=zqz21s2+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="002/d+uG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zqz21s2+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="002/d+uG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="zqz21s2+"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 67F2C229DB;
	Wed,  6 Aug 2025 18:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754506713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u7TJAEsQ8IV8IHRCEUyhgSUCg8lwtdOcewZa6rqbkeU=;
	b=002/d+uGBMK2ImsBxquHI00XRjsHVOCwKGOlkdDyzEvCY5EOZXb4pYF4TD+0FOxyagxRz4
	S8xZD0DcpIcc4oMaHttSvLGRUK00Qwbp4b9KpCfNIy2Oglnt4xVj0K9pcvxkJx19miuZW4
	ogzQCYYIzb1Ua4rSROlp7cZ6H7RrHrY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754506713;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u7TJAEsQ8IV8IHRCEUyhgSUCg8lwtdOcewZa6rqbkeU=;
	b=zqz21s2+syRSbHQidAvMdAjhWevHz1kZNIwFxBzYWpJvRNaT0KpUB1Y6FpanNax1AAVVd2
	LbL1W6NhF3mORgDA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="002/d+uG";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=zqz21s2+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754506713; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u7TJAEsQ8IV8IHRCEUyhgSUCg8lwtdOcewZa6rqbkeU=;
	b=002/d+uGBMK2ImsBxquHI00XRjsHVOCwKGOlkdDyzEvCY5EOZXb4pYF4TD+0FOxyagxRz4
	S8xZD0DcpIcc4oMaHttSvLGRUK00Qwbp4b9KpCfNIy2Oglnt4xVj0K9pcvxkJx19miuZW4
	ogzQCYYIzb1Ua4rSROlp7cZ6H7RrHrY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754506713;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u7TJAEsQ8IV8IHRCEUyhgSUCg8lwtdOcewZa6rqbkeU=;
	b=zqz21s2+syRSbHQidAvMdAjhWevHz1kZNIwFxBzYWpJvRNaT0KpUB1Y6FpanNax1AAVVd2
	LbL1W6NhF3mORgDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 34B9713ABE;
	Wed,  6 Aug 2025 18:58:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id M16bC9mlk2jPUAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 06 Aug 2025 18:58:33 +0000
Date: Wed, 06 Aug 2025 20:58:32 +0200
Message-ID: <87jz3g1dlz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Hans de Goede <hansg@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: Quiet crackling noise at boot and after stopping music
In-Reply-To: <8e204b89-9bdb-47de-901c-61fdc0ea1050@kernel.org>
References: <10172c80-daec-4e20-ab57-a483cf1afc02@molgen.mpg.de>
	<871pposvy9.wl-tiwai@suse.de>
	<d542d223-fc6e-4be7-b581-8a390ce2f6be@molgen.mpg.de>
	<87sei4rg67.wl-tiwai@suse.de>
	<b70db707-457d-4c0c-85be-19f4340dcc7b@molgen.mpg.de>
	<87h5ykqzod.wl-tiwai@suse.de>
	<8e204b89-9bdb-47de-901c-61fdc0ea1050@kernel.org>
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
X-Rspamd-Queue-Id: 67F2C229DB
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
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51

On Wed, 06 Aug 2025 19:00:59 +0200,
Hans de Goede wrote:
> 
> Hi Takashi,
> 
> On 6-Aug-25 4:42 PM, Takashi Iwai wrote:
> > On Wed, 06 Aug 2025 15:57:51 +0200,
> > Paul Menzel wrote:
> >>
> >> Dear Takashi,
> >>
> >>
> >> Thank you for your reply.
> >>
> >> Am 06.08.25 um 10:46 schrieb Takashi Iwai:
> >>> On Wed, 06 Aug 2025 10:34:57 +0200, Paul Menzel wrote:
> >>
> >>>> Am 06.08.25 um 10:20 schrieb Takashi Iwai:
> >>>>> On Wed, 06 Aug 2025 10:15:08 +0200, Paul Menzel wrote:
> >>>>
> >>>>>> I believe the Realtek refactoring caused a regression on my Intel Kaby
> >>>>>> Lake laptop Dell XPS 13 9360. There is quiet crackling noise during
> >>>>>> boot, when GDM is started, and also after playing music is
> >>>>>> stopped. It¢s reproducible with 6.16.0-04055-g14bed9bc81ba, that
> >>>>>> contains the sound subsystem pull request.
> >>>>>>
> >>>>>> 177bf8620cf4 Merge tag 'sound-6.17-rc1' of
> >>>>>> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound
> >>>>>>
> >>>>>> I uploaded the run of alsa-info [1]. I try to verify with plain 6.16 later.
> >>>>>
> >>>>> It's likely because of the missing CONFIG_SND_HDA_CODEC_* selections.
> >>>>> Please set CONFIG_SND_HDA_CODEC_ALC269=m and
> >>>>
> >>>> Indeed, I didn¢t select this.
> >>>>
> >>>>> CONFIG_SND_HDA_CODEC_HDMI_INTEL=m if not done yet.
> >>>>
> >>>> I had selected this.
> >>>>
> >>>>> Those were already set to default=y in the later PR for avoiding such
> >>>>> a pitfall.
> >>>>
> >>>> I remember I tried to check which to select, and I ran `alsa-info` to
> >>>> find the codecs, but only found:
> >>>>
> >>>>      Codec: Realtek ALC3246
> >>>>
> >>>> As this didn¢t match to any of the offerings, I didn¢t select
> >>>> it. May I suggest to extend the Kconfig help texts with notes how to
> >>>> determine the correct module?
> >>>
> >>> There are quite lots of different codec names, so we can't put all
> >>> them, unfortunately...
> >>
> >> Understood. Then maybe just the command how to find the id, that
> >> people can use to grep the correct module for? From the script
> >> `alsa-info.sh`, maybe, I found:
> >>
> >>     $ grep -e Codec -e "Vendor Id" /proc/asound/card*/codec#*
> >>     /proc/asound/card0/codec#0:Codec: Realtek ALC3246
> >>     /proc/asound/card0/codec#0:Vendor Id: 0x10ec0256
> >>     /proc/asound/card0/codec#2:Codec: Intel Kabylake HDMI
> >>     /proc/asound/card0/codec#2:Vendor Id: 0x8086280b
> >>
> >> So mention `/proc/asound/card*/codec#*`?
> > 
> > Honestly speaking, I don't want that; it won't scale, and new codecs
> > may appear at any moment.  Then we'd have to manage multiple places
> > for adding or removing ids.
> > 
> > Maybe an alternative option would be to mark prompt of each Realtek
> > codec driver with EXPERT, so that all Realtek drivers will be enabled
> > (when CONFIG_SND_HDA_CODEC_REALTEK is set) unless you say you're an
> > expert :)
> 
> FWIW that sounds like a good idea to me.

OK, will submit a formal patch set.


thanks,

Takashi

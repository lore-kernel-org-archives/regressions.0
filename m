Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0E83491C2
	for <regressions@lists.linux.dev>; Tue, 10 Mar 2026 06:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773125275; cv=none; b=M7kqPaETjAASBPz/YHhgBbu/T8fFCEdN6wBb2DoujkdGVwsKcWpaxMZAAq+AGn+132Ee/kuaLp64NjjPPaRbLHCHiITCeLkCtiuQDejtpc5RI0G8b6tIf3N1jtSZSdniOZR+PmTRt6q50Z8w97krdo33m1sPBwbY7GK4nrn91ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773125275; c=relaxed/simple;
	bh=Y5FYnAb0lYDECYa4FLQ1COGY6kcorZqnObwXtrfwsZQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R//1fv6UPqvjETh2k/b2Dl3nQ92kFaEBbr/euKoVnC3hvZXv3xQe3maSPYMUtv2Y7f1mk2m24h46/pCzVw3h9CYHR3C9T8zPdyk3qXjnF4gVo8S832riV3dyqYUiQyL2wGwgFzClpi6wUiEQ4g44embaLh2TrquCwZh5CGh9HXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=F8Xrh2Vo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kFJxVKFb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=F8Xrh2Vo; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=kFJxVKFb; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="F8Xrh2Vo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kFJxVKFb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="F8Xrh2Vo";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="kFJxVKFb"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 086585BCEF;
	Tue, 10 Mar 2026 06:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773125267; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VwWENHPBhib3+LUJEFuP0Qv3P1X+LBRyZfTIsrwkqOQ=;
	b=F8Xrh2Vogy9pRg/kjar+ZEfBYp17zvTNOlMHBZvyR7FN3EjF4BEfY31HqoMyffUKQ6KGqy
	RxoEDDBANU9m8Q3dSsiU2Yf/OlyaM1NfEnoS/O+cqnZz8TSlm3RiFGN+DNOIcAmDzx9Ja7
	7LuiU9RS/JgDkfx1gcInjZlNYGtSS6I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773125267;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VwWENHPBhib3+LUJEFuP0Qv3P1X+LBRyZfTIsrwkqOQ=;
	b=kFJxVKFb6FSlx4/w4b3VTXMu/Nd7iUct0919oO4XqsLVdoU+yBfEd2LYwmVQ1M5usfcY/5
	FuoqKfmBmEgVrBCA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773125267; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VwWENHPBhib3+LUJEFuP0Qv3P1X+LBRyZfTIsrwkqOQ=;
	b=F8Xrh2Vogy9pRg/kjar+ZEfBYp17zvTNOlMHBZvyR7FN3EjF4BEfY31HqoMyffUKQ6KGqy
	RxoEDDBANU9m8Q3dSsiU2Yf/OlyaM1NfEnoS/O+cqnZz8TSlm3RiFGN+DNOIcAmDzx9Ja7
	7LuiU9RS/JgDkfx1gcInjZlNYGtSS6I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773125267;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VwWENHPBhib3+LUJEFuP0Qv3P1X+LBRyZfTIsrwkqOQ=;
	b=kFJxVKFb6FSlx4/w4b3VTXMu/Nd7iUct0919oO4XqsLVdoU+yBfEd2LYwmVQ1M5usfcY/5
	FuoqKfmBmEgVrBCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C5DB53F308;
	Tue, 10 Mar 2026 06:47:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8p9yLpK+r2lvKQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 10 Mar 2026 06:47:46 +0000
Date: Tue, 10 Mar 2026 07:47:46 +0100
Message-ID: <87a4wgrxil.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?J=E9r=E9my?= Bethmont <jeremy.bethmont@gmail.com>
Cc: Kailang Yang <kailang@realtek.com>,
	alsa-devel@alsa-project.org,
	regressions@lists.linux.dev,
	regressions@leemhuis.info
Subject: Re: [REGRESSION] Audio popping on ThinkPad X1 Carbon Gen 12 (ALC287) after commit d2e01e0c5e94
In-Reply-To: <CAC88DfsHrhyhy0Pn1O-z9egBvMYu=6NYgcvcC6KCgwh_-Ldkxg@mail.gmail.com>
References: <CAC88DfsHrhyhy0Pn1O-z9egBvMYu=6NYgcvcC6KCgwh_-Ldkxg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO

On Tue, 10 Mar 2026 01:01:11 +0100,
Jérémy Bethmont wrote:
> 
> Hi Takashi, Kailang,
> 
> I am reporting an audio regression introduced in kernel 6.18.13 on the
> Lenovo ThinkPad X1 Carbon Gen 12 (Meteor Lake, Realtek ALC287 codec,
> SSID: 0x17aa231e).
> 
> Since this update, the laptop emits a short, noticeable hardware
> pop/blip from the speakers exactly when an audio stream closes and the
> PCM state suspends. It happens consistently a few seconds after
> playback finishes (e.g., after a system notification or terminal
> bell).
> 
> I have tracked the regression down to the following commit:
> d2e01e0c5e947da0b5005ca89efa82baeb232adc ("ALSA: hda/realtek - fixed
> speaker no sound")
> 
> #regzbot introduced: d2e01e0c5e947da0b5005ca89efa82baeb232adc
> 
> Root cause analysis:
> The commit modifies the `alc287_alc1318_playback_pcm_hook` function,
> adding raw COEF writes to disable/enable AMP silence detection on
> HDA_GEN_PCM_ACT_OPEN and HDA_GEN_PCM_ACT_CLOSE.
> 
> Because `alc287_alc1318_playback_pcm_hook` is a shared hook used by
> multiple Lenovo ALC287/ALC1318 devices, these unconditional
> `WRITE_COEF` instructions are being sent to hardware that does not
> need the silence detection fix. On the X1 Carbon Gen 12, executing
> `alc_process_coef_fw(codec, en_coefs)` upon stream close triggers an
> immediate electrical pop. Monitoring with `pw-mon` confirms the
> hardware pop coincides perfectly with the monitor_FR / monitor_FL
> ports going idle/suspended.
> 
> Proposed solution:
> Could we revert this commit, or alternatively, wrap these specific
> silence-detection COEF writes in a targeted `ALC287_FIXUP` quirk
> matched via SSID/DMI, rather than executing them globally in the
> shared playback hook?

Could you give alsa-info.sh output?  Run the script with --no-upload
option and attach the output.

I guess the bug might not be specific to your device but happening in
general with all matching ones.  As a workaround for such a pop noise,
we often need to reorder verbs or put some delay between verbs.


Takashi

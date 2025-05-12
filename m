Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA04F1D63EE
	for <regressions@lists.linux.dev>; Mon, 12 May 2025 15:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747062424; cv=none; b=s/9ripnJFDwNYh6EwgkInLbVIvmmLN9Dy3lzHh7JvqD5b7+vYCoC72W/zQVhPqCxSQU8GO8fyRK1m3RrSRhaca2qUJfoFHpUka5m9RIXvg2ZtdCFyz4LcriLNqt89n2vWeijojxPJHBMklog7o7NtrFlYNraUOBA4+LisgRfcyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747062424; c=relaxed/simple;
	bh=+o6yR/P2xYE8Li6Iox3E0PAeKRKfR5KLkStd/n5YwUs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IEyF5dju/jVSeaDhHHuyQMht2rlrs82s1NbncTbKqBZSNuCx0VZWNntoh9gw7eJOHmpYW9ZAposp5KC1dOtjn5CN5dH46487QoG/MaxKCSMcAXu1L0J/XbltMxfW19HNivoolLJ9KlhbNoiXHQVa4HwSGSGx/G0wTOYMLcuTKFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=i7cyqOkh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WNkMv1T/; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=i7cyqOkh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WNkMv1T/; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="i7cyqOkh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WNkMv1T/";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="i7cyqOkh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WNkMv1T/"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7835D1F790;
	Mon, 12 May 2025 15:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747062420; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BvTm2OOd5aLCAsrYpKV5YaeMP78ew2u5mUF8tbcsfYc=;
	b=i7cyqOkhOKnqoVLN23e+UKeTk79Olz47K/c6bcYel5nmuAbM/sbnee1/cBQT/erXt023Ks
	DG9OZ3uuelGqP/2Z6jsHTPug2wXeu4Vu92e1FEqIkOvWQ+agFetL4lCudBmhyvlow+0z0D
	JBvpB9hI3HRUpUQYwxBFDAo1oTn7Wf4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747062420;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BvTm2OOd5aLCAsrYpKV5YaeMP78ew2u5mUF8tbcsfYc=;
	b=WNkMv1T/bnvLpXYMG1ZH0Y32vNRepkSYmqQ70EpE9Fvvf+wdOuWKiNTTeYUmGIzPRNzxyx
	+k8jZ/t2CVkXYKCw==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=i7cyqOkh;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="WNkMv1T/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1747062420; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BvTm2OOd5aLCAsrYpKV5YaeMP78ew2u5mUF8tbcsfYc=;
	b=i7cyqOkhOKnqoVLN23e+UKeTk79Olz47K/c6bcYel5nmuAbM/sbnee1/cBQT/erXt023Ks
	DG9OZ3uuelGqP/2Z6jsHTPug2wXeu4Vu92e1FEqIkOvWQ+agFetL4lCudBmhyvlow+0z0D
	JBvpB9hI3HRUpUQYwxBFDAo1oTn7Wf4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1747062420;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BvTm2OOd5aLCAsrYpKV5YaeMP78ew2u5mUF8tbcsfYc=;
	b=WNkMv1T/bnvLpXYMG1ZH0Y32vNRepkSYmqQ70EpE9Fvvf+wdOuWKiNTTeYUmGIzPRNzxyx
	+k8jZ/t2CVkXYKCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3FF2A137D2;
	Mon, 12 May 2025 15:07:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id o1lmDpQOImj9SQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 12 May 2025 15:07:00 +0000
Date: Mon, 12 May 2025 17:06:59 +0200
Message-ID: <87o6vxuauk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "kailang@realtek.com" <kailang@realtek.com>
Cc: Ruslan Nikolaev <nruslan_devel@yahoo.com>,
    "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"tiwai@suse.com" <tiwai@suse.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"sashal@kernel.org" <sashal@kernel.org>,
	"perex@perex.cz" <perex@perex.cz>
Subject: Re: Fwd: [Bug 220109] New: Audio disappears on HP 15-fc000 after warm boot again (ALC256 code path)
In-Reply-To: <1064773772.509063.1747061777318@mail.yahoo.com>
References: <1064773772.509063.1747061777318.ref@mail.yahoo.com>
	<1064773772.509063.1747061777318@mail.yahoo.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: 7835D1F790
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[yahoo.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[yahoo.com,lists.linux.dev,suse.com,alsa-project.org,kernel.org,perex.cz];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51

On Mon, 12 May 2025 16:56:17 +0200,
Ruslan Nikolaev wrote:
> 
> Hi,
> 
> Forwarding my regression bug report for HP 15-fc000 / ALC236 (ALC256 code path).
> 
> #regzbot introduced: v6.12.2
> https://bugzilla.kernel.org/show_bug.cgi?id=220109
> 
> Sincerely,
> Ruslan
> 
> Forwarded Message (see logs in the bug report above):
> 
> There was a similar bug in the past (Bug 217440), which was fixed for this laptop. (I believe the code path is for ALC256, see below.) The same issue is occurring again as of kernel v.6.12.2. The symptoms are very similar - initially audio works but after a warm reboot, the audio completely disappears until the computer is powered off (there is no audio output at all).
> 
> The issue is caused by a different change now. By bisecting different kernel versions, I found that reverting cc3d0b5dd989d3238d456f9fd385946379a9c13d in patch_realtek.c ( see https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/sound/pci/hda/patch_realtek.c?h=v6.12.2&id=4ed7f16070a8475c088ff423b2eb11ba15eb89b6 ) restores the sound and it works fine after the reboot.

It's the commit cc3d0b5dd989d3238d456f9fd385946379a9c13d
Author: Kailang Yang <kailang@realtek.com>
Date:   Thu Nov 14 15:21:09 2024 +0800

    ALSA: hda/realtek: Update ALC256 depop procedure
    
    Old procedure has a chance to meet Headphone no output.
    
    Fixes: 4a219ef8f370 ("ALSA: hda/realtek - Add ALC256 HP depop function")
    Signed-off-by: Kailang Yang <kailang@realtek.com>
    Link: https://lore.kernel.org/463c5f93715d4714967041a0a8cec28e@realtek.com
    Signed-off-by: Takashi Iwai <tiwai@suse.de>

and it modified alc256_init() sequence.

Kailang, could you check this regression?


And, Ruslan, it's the case without the headphone, right?
Is the sound still lost when you connect the headphone and apply the
same procedure?


thanks,

Takashi

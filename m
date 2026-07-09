Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBD0285CAD
	for <regressions@lists.linux.dev>; Thu,  9 Jul 2026 09:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783590849; cv=none; b=ImksbL7+rvwE4njEjf0j8/C4tKua+H+jRoFY7YGGLgmUPsdSdd4P7K4g6wTZJj81IPPVlpCJXEic6igkneSVeSafFrF29pg7dq4kqKUCW5w0q0+d+JD+zJYcA4Y60bZcAQCDU7jSrw9+k9R6oJCUABZ3sVvILE0xOKld7VUbZjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783590849; c=relaxed/simple;
	bh=m3Lc3+Oc1qBRVfLCMDEsqwTXWA86jJIU3BOlWWenvBE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ty+Aly3+4iGcZJCoty/f8siftiB5YoozloA48FqYjdZdJ8M96gpYjiJSMuUgvCPGFgBOwGrf8VxP1TtwN8Vk1hNFN/NBWS6cWZsTomZm4zmdE4kegig3kZVPwD8tE4OzhLAqTpUQ9tldyjgV1x+Or4nrugwlFdUwmoO8wqEbSzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nmItsD0o; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=70vbigcc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nmItsD0o; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=70vbigcc; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nmItsD0o";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="70vbigcc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nmItsD0o";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="70vbigcc"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A55D3760DE;
	Thu,  9 Jul 2026 09:54:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783590846; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1uEnaQVm8VJFHX88WggnsJZccyjvT/jg7ZFgaTqD4PU=;
	b=nmItsD0oh8sGqPTW84f3WDpBJG8WPFV2VwfKweBiI81AeHgoo1JfWZh7+QVXY37pZZL+um
	w8Fd34PWG9F5kysPpWH2zgw37PFVBb/lwjmh+4UdCPCHQrDDcy4eEu1JhAp/yiIah/GAP3
	jAEKuviQRExSEhd29ebfVZE8PNPe1nw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783590846;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1uEnaQVm8VJFHX88WggnsJZccyjvT/jg7ZFgaTqD4PU=;
	b=70vbigccTYvQ+qvR01oj4QU8dzQU7/lqxg4nZrwvk3ebt69Wci+ITO7OZrcEeTLQRlEwA1
	3chFPj3EViuDLTCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1783590846; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1uEnaQVm8VJFHX88WggnsJZccyjvT/jg7ZFgaTqD4PU=;
	b=nmItsD0oh8sGqPTW84f3WDpBJG8WPFV2VwfKweBiI81AeHgoo1JfWZh7+QVXY37pZZL+um
	w8Fd34PWG9F5kysPpWH2zgw37PFVBb/lwjmh+4UdCPCHQrDDcy4eEu1JhAp/yiIah/GAP3
	jAEKuviQRExSEhd29ebfVZE8PNPe1nw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1783590846;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1uEnaQVm8VJFHX88WggnsJZccyjvT/jg7ZFgaTqD4PU=;
	b=70vbigccTYvQ+qvR01oj4QU8dzQU7/lqxg4nZrwvk3ebt69Wci+ITO7OZrcEeTLQRlEwA1
	3chFPj3EViuDLTCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7D8B2779AA;
	Thu,  9 Jul 2026 09:54:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CT5IHb5vT2rbWAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 09 Jul 2026 09:54:06 +0000
Date: Thu, 09 Jul 2026 11:54:06 +0200
Message-ID: <87wlv432v5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jussi Laako <jussi@sonarnerd.net>
Cc: Salvador Blaya <tiniebla6@gmail.com>,
	alsa-devel@alsa-project.org,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] snd-usb-audio: commit da3a7efff64e ("ALSA: usb-audio: Update for native DSD support quirks") breaks DSD playback on Musical Fidelity M6s DAC (2772:0502), plays ~8.8% fast
In-Reply-To: <0B949249-CB61-4D76-BD4B-6C9B467E97D6@sonarnerd.net>
References: <CAOdyq+qFaqCh=tK_wNnA64hv5pQuA1Y09ANxQ=xK8yR-t4mf9Q@mail.gmail.com>
	<4A4C8B42-D8BB-44D1-BE0B-CB5B4617F29E@sonarnerd.net>
	<87bjcg4nyh.wl-tiwai@suse.de>
	<0B949249-CB61-4D76-BD4B-6C9B467E97D6@sonarnerd.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,alsa-project.org,lists.linux.dev];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Level: 
X-Spam-Score: -3.30

On Thu, 09 Jul 2026 10:34:44 +0200,
Jussi Laako wrote:
> 
> This is of course OK for me if it works. The newer Musical Fidelity devices work fine. For example M3x, M6x, M8x, MX and likely upcoming new ones.
> 
> So I would rather go with blacklisting broken ones.

OK, I'll submit the fix patch.


Takashi

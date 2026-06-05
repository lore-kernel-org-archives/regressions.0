Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE624DA550
	for <regressions@lists.linux.dev>; Fri,  5 Jun 2026 12:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780661163; cv=none; b=nydJ3fmJShmBAykwbIXqumgwIWauPAWoxfCJvgoc063XvjmT8B/DNwb8yccSFkdBtiO4B29vJ2Zy5XpNK1f5joG8NR1l2D2rzMXj/ZEuCwTnCy3F6w8eqWQKzC3ctJ98qCzU9qk9xMiFDP+24z0vmCYhXHy8DQ/APMS3Yz2yJkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780661163; c=relaxed/simple;
	bh=TFXKwbQIZzzh76BGjgjzEV5HzDYSJT8181QRyQ3PPxs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KxruxHpiUEO84pmYsi2QaDIj03mDRTKgahkv3OstRUL/wsfsTbnFJaER6XEQvJvysrFuQoPh8cpbgowd+SrOxCfqoiPfernY+Ueb8GQ4WrrP2+AReDdgTsjjsvWTuYU+dNmLsDlxL7fw7WTrwC3GbnjH1vOa5aVwqNV/GaKDsDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pPze4+Zc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HkpgXORI; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pPze4+Zc; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=HkpgXORI; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pPze4+Zc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HkpgXORI";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pPze4+Zc";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="HkpgXORI"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AE8DA75956;
	Fri,  5 Jun 2026 12:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780661159; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7cRttRsN2JFkqMptBCqpyTMF64OK0tB2hLShDxpoox8=;
	b=pPze4+ZcQjI7/zbJ/AVQXZaJqP8ZCzjIMCAnlkM88Tr5iE/SBykLc8FE5sgeKtVN3ghHPS
	4cjQ0XCWOnHNDG+D7irUrfjb5S+5ut4DtGCISP6n3Ft+mpsFqv6y9E7WCh1WkgGU434gwK
	SeLPQ7MHUElxx3T988f3gW2/pCMrkqQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780661159;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7cRttRsN2JFkqMptBCqpyTMF64OK0tB2hLShDxpoox8=;
	b=HkpgXORIsRjauIWKQI/pzYXMgqMzGd7muorVbHhwD7WKeicyVMyFJ5tiHEMcGZGeDl7YZ4
	QkBZk8CO/enNJ3DQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=pPze4+Zc;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=HkpgXORI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1780661159; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7cRttRsN2JFkqMptBCqpyTMF64OK0tB2hLShDxpoox8=;
	b=pPze4+ZcQjI7/zbJ/AVQXZaJqP8ZCzjIMCAnlkM88Tr5iE/SBykLc8FE5sgeKtVN3ghHPS
	4cjQ0XCWOnHNDG+D7irUrfjb5S+5ut4DtGCISP6n3Ft+mpsFqv6y9E7WCh1WkgGU434gwK
	SeLPQ7MHUElxx3T988f3gW2/pCMrkqQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1780661159;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7cRttRsN2JFkqMptBCqpyTMF64OK0tB2hLShDxpoox8=;
	b=HkpgXORIsRjauIWKQI/pzYXMgqMzGd7muorVbHhwD7WKeicyVMyFJ5tiHEMcGZGeDl7YZ4
	QkBZk8CO/enNJ3DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 596AA779A9;
	Fri,  5 Jun 2026 12:05:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XJSNFKe7ImqZQQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 05 Jun 2026 12:05:59 +0000
Date: Fri, 05 Jun 2026 14:05:58 +0200
Message-ID: <87v7bxtcnt.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Takashi Iwai <tiwai@suse.de>,
	Rong Zhang <i@rong.moe>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Steve Smith <tarkasteve@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [PATCH v4 0/3] ALSA: usb-audio: Add QUIRK_FLAG_MIXER_GET_CUR_BROKEN
In-Reply-To: <37b3d366-7a22-4117-8be8-821098246885@leemhuis.info>
References: <20260531-uac-quirk-get-cur-vol-v4-0-ede643dca151@rong.moe>
	<87se77o9xr.wl-tiwai@suse.de>
	<37b3d366-7a22-4117-8be8-821098246885@leemhuis.info>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	ARC_NA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[suse.de,rong.moe,perex.cz,suse.com,lwn.net,linuxfoundation.org,gmail.com,vger.kernel.org,lists.linux.dev];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: AE8DA75956
X-Spam-Score: -3.51

On Fri, 05 Jun 2026 14:00:02 +0200,
Thorsten Leemhuis wrote:
> 
> On 5/31/26 17:50, Takashi Iwai wrote:
> > On Sun, 31 May 2026 17:45:19 +0200,
> > Rong Zhang wrote:
> >>
> >> Since commit 86aa1ea1f15c ("ALSA: usb-audio: Do not expose sticky
> >> mixers"), the UAC mixer core utilizes volume SET_CUR and GET_CUR to
> >> identify devices with sticky mixers. Unfortunately, even though most
> >> devices with sticky GET_CUR also have corresponding sticky SET_CUR,
> >> which I actually met more since the commit had been merged, there is
> >> also a rare case that some devices may have volume mixers that responds
> >> to SET_CUR properly but with its GET_CUR stubbed. This cause the sticky
> >> check to consider the mixer to be sticky and unnecessarily disable it.
> > [...]
> >
> > Now took all three patches onto for-next branch.  Thanks.
> 
> I noticed that patch 1 is somewhat on the larger side, nevertheless
> allow me to ask: wouldn't it be better to mainline this for -rc7, as
> this fixes a regression from the 7.1 cycle? Or did I misjudge this? Then
> don't hesitate to tell me!

A regression fix will be included in the upcoming PR by another commit
aa2f4addab44407c7aa742321de5dc1914ab5762.


Takashi

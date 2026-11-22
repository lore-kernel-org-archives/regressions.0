Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795334548;
	b=lGP6PEAckkFQdSjjAFo/SjTv0KZGjIY9EGoPRzlBoj5QiyOm1zUenMcpWVkcPcNrsVvg
	 z7HiV1FhctN4ICHc+oc03/1bTaSB2zoPk5PvW3UvtKkzN0NTrYDTcoQCzTHMA8xBW1Uu+
	 1ZxNqI2IEZ4718BfEA3mJkbJb6cvn4KwHZb9e0p6opGA9V75bIpEIQQZitU56oqZPEA/z
	 kRHl3aUoZHZM+vuczbI3YmB/dYLR9aOKbZYliaWScdi65XSsVxe+TFc3d7z0zn7zwH9T8
	 gQmxDIPNXPUutFhDlQM+zNOthIdGDGYtJ4YK5WTm24I2NKGt4SY4UfE+53VB8neIU/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795334548;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=i3/52TCorX7BsdB81TFJLZsDWofvbJVnV4C7ebTMACE=;
	b=V2+5XnVwDOAaSSB7Ec3rGWRSIqrn4WSKmSAXCsr1RJzVlvCvzPtzdwUMd+xdL6PCF0/X
	 KWFxrdZYtes6dmHF19JaNK/my0/jFO64Z6qUf7CBpH2d0ukEcE4ayjQIvYVfpcw0u6DoO
	 KKkoUkHXGvuGAfzFWV/L8CNH61jY+Pns5CfJ5PSSRcDqGLGcjVUN1q538Ppd/YMPO5Km4
	 38Wwkcx6FDZHeri4Vx+6CA8LXDJ3b4H6Mv0mwwSxtplP17jZigIEHhQ0aC1GbGP5uTCVT
	 v0gKj3jkiFPYQrOeDRrlGgV7R+VEzEvsrSkUclBWylImshqghdx4aD6AekMFYnyaNMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=NBAopWmr;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=KMI1yzHe;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=RDHt6oyF;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jDr384KR;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A82606A32A
	for <regressions@lists.linux.dev>; Sun, 22 Nov 2026 08:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87A82606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=NBAopWmr;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=KMI1yzHe;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=RDHt6oyF;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=jDr384KR
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5636B1F8CC;
	Sun, 22 Nov 2026 08:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795334539; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i3/52TCorX7BsdB81TFJLZsDWofvbJVnV4C7ebTMACE=;
	b=NBAopWmrhl401r7LPmOkDRoXonhq8+riPCMIWg/PKh6J8vycpE2b23/eGRr/JmdMvQAEP9
	bhy5+Dshf5uBH4ARrl/1ZukkDP6/o6zHmveKZDdAcShKsMnuf2LSNiQQ3hd7xTkbGXA0rB
	xxEjfZqNDRiwv6QCamFFD93GI8HEyKA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795334539;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i3/52TCorX7BsdB81TFJLZsDWofvbJVnV4C7ebTMACE=;
	b=KMI1yzHes2zXZrISgSmQGbQ6jNzqqLilvl2j53bQj88Lvj3gXBMUEitUGxlZTSt0Jf89g1
	jSvpXEcrx+RqrRAA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=RDHt6oyF;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=jDr384KR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795334538; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i3/52TCorX7BsdB81TFJLZsDWofvbJVnV4C7ebTMACE=;
	b=RDHt6oyFzP99U+zUeaPzGrQNKA34LjB3a+kUnXKZktkMoZoVBULDCQPgRJTvbRXJBTGNc0
	wOIDZIpeYD6nreooAAdSPXJ6W3Ue0h0hRVjvT/hhF3VsLzItD1Jkuua3Kw1UoPI5uOLiYM
	nVpIeN0HqjHzBFh97/HHdioR86MJ9ZE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795334538;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i3/52TCorX7BsdB81TFJLZsDWofvbJVnV4C7ebTMACE=;
	b=jDr384KRzagl5r0H4D12QrvA+vEdlQJaHWcHH17RkyTll4sQcwiCL99gPm7gqTsz6d9r5/
	HsSLCpqsXxN71nCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EEE201342D;
	Sun, 22 Nov 2026 08:02:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id xgb7MImhAmuSWQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 22 Nov 2026 08:02:17 +0000
Date: Sun, 22 Nov 2026 09:02:17 +0100
Message-ID: <87cxrx70qe.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Cristian-Marian Fotache <cristianmarianfotache@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	asas1asas200@gmail.com,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] ALSA: hda/realtek: Higole F9B fixup breaks speakers on unrelated Apollo Lake laptop (10ec:111e)
In-Reply-To: <CACGjpbf73XdwrG34ffjmYU3ZYuStPpFNXf9w+AGYcTmLyHCN_w@mail.gmail.com>
References: <CACGjpbf73XdwrG34ffjmYU3ZYuStPpFNXf9w+AGYcTmLyHCN_w@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-12.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[suse.com,perex.cz,vger.kernel.org,gmail.com,lists.linux.dev];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,msgid.link:url]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 5636B1F8CC

On Sat, 21 Nov 2026 18:24:47 +0100,
Cristian-Marian Fotache wrote:
> 
> Hello,
> 
> I would like to report an internal speaker regression affecting an
> Intel Apollo Lake laptop with a Realtek ALC269VC codec.
> 
> The regression appears to be related to the following upstream commit:
> 
> 2a8ee6897302ca12ff39e8eb180503956797c60c
> ALSA: hda/realtek: Fix silent speaker on Higole F9B
> 
> Original patch:
> https://patch.msgid.link/20260923141344.1543158-1-asas1asas200@gmail.com
> 
> Affected hardware
> 
> CPU: Intel Celeron J3455 (Apollo Lake)
> 
> PCI audio controller: 8086:5a98
> 
> PCI subsystem ID: 10ec:111e
> 
> Codec: Realtek ALC269VC
> 
> Codec vendor ID: 0x10ec0269
> 
> Codec subsystem ID: 0x10ec111e
> 
> Codec revision: 0x100202
> 
> DMI baseboard product: SCHNEIDER
> 
> BIOS: American Megatrends AN12DV201 (2021-01-25)
> 
> Distribution: Linux Mint Xfce
> 
> This laptop is not a Higole F9B, but shares its subsystem identifier.
> 
> Regression testing
> 
> 6.14.0-37-generic: internal speakers work.
> 
> 7.0.0-43-generic (#43~24.04.1-Ubuntu): internal speakers are silent.
> 
> 7.0.0-43-generic with snd_hda_intel.model=nofixup: internal speakers work again.
> 
> The workaround has also been verified across a reboot.
> 
> Diagnostic findings
> 
> The affected kernel reports:
> 
> ALC269VC: picked fixup  for PCI SSID 10ec:111e
> 
> Comparing the complete codec dumps from the working and affected
> kernels reveals changes to the connection configurations of nodes 0x14
> and 0x15.
> 
> For speaker pin 0x14, the working kernel reports:
> 
> Connection: 2
>   0x0c 0x0d*
> 
> The affected kernel reports:
> 
> Connection: 2
>   0x0c* 0x0d
> In-driver Connection: 1
>   0x0c
> 
> Node 0x15 also receives the restricted in-driver connection list.
> 
> The captured ALSA mixer configurations from the working and affected
> kernels are byte-for-byte identical.
> 
> When booting with snd_hda_intel.model=nofixup, the kernel reports:
> 
> ALC269VC: picked no fixup (nofixup specified)
> 
> The original connection topology is restored, and the internal
> speakers produce sound again.
> 
> Suspected cause
> 
> The subsystem-ID-based Higole F9B quirk appears to match unrelated
> hardware that requires a different audio routing configuration.
> 
> A more restrictive hardware match may be needed to preserve the
> original Higole F9B fix without introducing a regression on other
> devices sharing subsystem ID 10ec:111e.
> 
> I have not performed a full kernel bisection or independently tested
> the suspected commit in an upstream kernel build.
> 
> Comparative codec dumps, mixer configurations, kernel logs, PCI
> information and DMI information are included in the attached
> diagnostic archive. A separate unified codec diff is also attached.
> 
> I would be happy to provide additional diagnostics, test proposed
> patches, or assist in developing a correction that preserves
> functionality on both machines.
> 
> The investigation and preparation of this report were assisted by an
> LLM. All physical hardware testing and diagnostic captures were
> performed directly on the affected machine.
> 
> Thank you for your time.
> 
> Best regards,
> Cristian-Marian Fotache

Thanks for the report.
Unless we come with a quick fix, I'm going to revert the commit.

Yu-Hsiang, could you check whether the quirk can be replaced with
HDA_QUIRK_ENTRY() with the codec ID instead?  This could be more
unique than PCI SSID.


thanks,

Takashi

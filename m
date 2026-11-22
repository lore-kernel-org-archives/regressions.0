Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795355414;
	b=R0iqtyXc6nBVc2ZxtF1OTXWGxokkcnnunZ7v6yFOZrYIl9p6yONjMlMQySlOs8rmeiTj
	 PNhhiGM5JnyJMIr4ulBgbjz51hM5RkuEvSev67jTHpn8olj8TvzRNWUg4Y5q45M88itwO
	 Ee7mAXpDn+GgeTpNVcZJSXOq9IfhNZmpKYqAexIVeeuW3n/BB3QBw0Om3U1njapkHkh4Y
	 ftQN0CQ75xm/DJkJkDSnR3rUd+qOiRib3/C8aXquiKT1O0LhWlO4pTlg9nrmSi1xvTvl9
	 YVAU+F1diuQAFTfIttdDXerChMhGTy3RZNeg7hdeMTUu/5PKB9LD14uTZeoxjqsPkFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795355414;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=ha6qtHp1L1mMerh2zigotSWUiwbZ++wwqzoQlgpoPG8=;
	b=enc/RiW9Yt5hgC3Fp0g2KKjMdBJu55xrAsplQDrRP5WwTUWU0lzkE7gu83iJTB/zpW/W
	 XYHGeSs1CDKjdzxd9y9kAa0hlnE+cfMKm2x7j99z7q7jhzuKYMcw76ZfEe7akXbHlpjju
	 BptXewXzhIFtR+890jbFhT/m3LTm0JNJMcC0xsi52Z9tSAmuh8OR7+Q1yaQRVU70S4j7U
	 MYz+xq65cfkrxFImQYGfFMkf/f88ecSUpVWvaLo9Xzmg5Z1Ywa5KPIGXi7Ap7g6KMHo64
	 5oV48TjHZDgOSaLFfl9NqZRCLV6JCox+PtgmN/WGCbGeCy4cOw0AQ8tZybWh/Ygv/iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=MVwHXx2y;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=L0ALx7az;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=MVwHXx2y;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=L0ALx7az;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729B1606A32C
	for <regressions@lists.linux.dev>; Sun, 22 Nov 2026 13:50:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 729B1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=MVwHXx2y;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=L0ALx7az;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=MVwHXx2y;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=L0ALx7az
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5B1041F79C;
	Sun, 22 Nov 2026 13:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795355411; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ha6qtHp1L1mMerh2zigotSWUiwbZ++wwqzoQlgpoPG8=;
	b=MVwHXx2yn1RI1tOGITzgroWft1a1/GOmMJIiPn+af0WWsSyUKzPxhYIDd1vtb2ZmEQ2SZB
	vjT/IH/2u+bmY+nQ298izwVBoaeOXOFDKerYjlpro/pxrC5OBs4YSCI0lqv/OSNkIVOazL
	FJMiAiIpd5akFYJpjQEjBxBBYiWntrQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795355411;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ha6qtHp1L1mMerh2zigotSWUiwbZ++wwqzoQlgpoPG8=;
	b=L0ALx7azM9NqZt14FR+Blin1/G40lRTX9h0rHmsYn0lnmFZmX3W7jXSbwSoMQlWzPJakma
	fjTAPMNbzBGV5NDQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=MVwHXx2y;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=L0ALx7az
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795355411; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ha6qtHp1L1mMerh2zigotSWUiwbZ++wwqzoQlgpoPG8=;
	b=MVwHXx2yn1RI1tOGITzgroWft1a1/GOmMJIiPn+af0WWsSyUKzPxhYIDd1vtb2ZmEQ2SZB
	vjT/IH/2u+bmY+nQ298izwVBoaeOXOFDKerYjlpro/pxrC5OBs4YSCI0lqv/OSNkIVOazL
	FJMiAiIpd5akFYJpjQEjBxBBYiWntrQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795355411;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ha6qtHp1L1mMerh2zigotSWUiwbZ++wwqzoQlgpoPG8=;
	b=L0ALx7azM9NqZt14FR+Blin1/G40lRTX9h0rHmsYn0lnmFZmX3W7jXSbwSoMQlWzPJakma
	fjTAPMNbzBGV5NDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DBE271342D;
	Sun, 22 Nov 2026 13:50:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0FsdKxLzAmuxKAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 22 Nov 2026 13:50:10 +0000
Date: Sun, 22 Nov 2026 14:50:10 +0100
Message-ID: <87pkvx5625.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: asas1asas200@gmail.com
Cc: Cristian-Marian Fotache <cristianmarianfotache@gmail.com>,
	tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] ALSA: hda/realtek: Higole F9B fixup breaks speakers on unrelated Apollo Lake laptop (10ec:111e)
In-Reply-To: <87cxrx70qe.wl-tiwai@suse.de>
References: <CACGjpbf73XdwrG34ffjmYU3ZYuStPpFNXf9w+AGYcTmLyHCN_w@mail.gmail.com>
	<87cxrx70qe.wl-tiwai@suse.de>
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
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,suse.com,perex.cz,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -12.51
X-Spam-Level: 
X-Rspamd-Queue-Id: 5B1041F79C

On Sun, 22 Nov 2026 09:02:17 +0100,
Takashi Iwai wrote:
> 
> On Sat, 21 Nov 2026 18:24:47 +0100,
> Cristian-Marian Fotache wrote:
> > 
> > Hello,
> > 
> > I would like to report an internal speaker regression affecting an
> > Intel Apollo Lake laptop with a Realtek ALC269VC codec.
> > 
> > The regression appears to be related to the following upstream commit:
> > 
> > 2a8ee6897302ca12ff39e8eb180503956797c60c
> > ALSA: hda/realtek: Fix silent speaker on Higole F9B
> > 
> > Original patch:
> > https://patch.msgid.link/20260923141344.1543158-1-asas1asas200@gmail.com
> > 
> > Affected hardware
> > 
> > CPU: Intel Celeron J3455 (Apollo Lake)
> > 
> > PCI audio controller: 8086:5a98
> > 
> > PCI subsystem ID: 10ec:111e
> > 
> > Codec: Realtek ALC269VC
> > 
> > Codec vendor ID: 0x10ec0269
> > 
> > Codec subsystem ID: 0x10ec111e
> > 
> > Codec revision: 0x100202
> > 
> > DMI baseboard product: SCHNEIDER
> > 
> > BIOS: American Megatrends AN12DV201 (2021-01-25)
> > 
> > Distribution: Linux Mint Xfce
> > 
> > This laptop is not a Higole F9B, but shares its subsystem identifier.
> > 
> > Regression testing
> > 
> > 6.14.0-37-generic: internal speakers work.
> > 
> > 7.0.0-43-generic (#43~24.04.1-Ubuntu): internal speakers are silent.
> > 
> > 7.0.0-43-generic with snd_hda_intel.model=nofixup: internal speakers work again.
> > 
> > The workaround has also been verified across a reboot.
> > 
> > Diagnostic findings
> > 
> > The affected kernel reports:
> > 
> > ALC269VC: picked fixup  for PCI SSID 10ec:111e
> > 
> > Comparing the complete codec dumps from the working and affected
> > kernels reveals changes to the connection configurations of nodes 0x14
> > and 0x15.
> > 
> > For speaker pin 0x14, the working kernel reports:
> > 
> > Connection: 2
> >   0x0c 0x0d*
> > 
> > The affected kernel reports:
> > 
> > Connection: 2
> >   0x0c* 0x0d
> > In-driver Connection: 1
> >   0x0c
> > 
> > Node 0x15 also receives the restricted in-driver connection list.
> > 
> > The captured ALSA mixer configurations from the working and affected
> > kernels are byte-for-byte identical.
> > 
> > When booting with snd_hda_intel.model=nofixup, the kernel reports:
> > 
> > ALC269VC: picked no fixup (nofixup specified)
> > 
> > The original connection topology is restored, and the internal
> > speakers produce sound again.
> > 
> > Suspected cause
> > 
> > The subsystem-ID-based Higole F9B quirk appears to match unrelated
> > hardware that requires a different audio routing configuration.
> > 
> > A more restrictive hardware match may be needed to preserve the
> > original Higole F9B fix without introducing a regression on other
> > devices sharing subsystem ID 10ec:111e.
> > 
> > I have not performed a full kernel bisection or independently tested
> > the suspected commit in an upstream kernel build.
> > 
> > Comparative codec dumps, mixer configurations, kernel logs, PCI
> > information and DMI information are included in the attached
> > diagnostic archive. A separate unified codec diff is also attached.
> > 
> > I would be happy to provide additional diagnostics, test proposed
> > patches, or assist in developing a correction that preserves
> > functionality on both machines.
> > 
> > The investigation and preparation of this report were assisted by an
> > LLM. All physical hardware testing and diagnostic captures were
> > performed directly on the affected machine.
> > 
> > Thank you for your time.
> > 
> > Best regards,
> > Cristian-Marian Fotache
> 
> Thanks for the report.
> Unless we come with a quick fix, I'm going to revert the commit.
> 
> Yu-Hsiang, could you check whether the quirk can be replaced with
> HDA_QUIRK_ENTRY() with the codec ID instead?

Correction: here I meant "codec SSID", of course.


Takashi

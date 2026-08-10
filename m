Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E16B3B7771
	for <regressions@lists.linux.dev>; Mon, 10 Aug 2026 10:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786357112; cv=none; b=sINTpfrYhHCz2pvAu7x1R/603NO8Xg7O4JVAMe8vIROxbTvjvp8K68S1qyAlxLEDwhxEW1hslEe1veqIa8TD1dFIRWykExRLNaHcjVpQZkp5bZHY+1rHerfsry8VRNBw+/C1Ewnep7Why3+5OBxuUjAQIMXjrpFfJL9clZlFoeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786357112; c=relaxed/simple;
	bh=MSSdzdzK+yJ3Psa80Wbjj23ruDZiEwrzC5Q5bTGT5zI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WvM7rsrxbgni17rgKH1yThnMsrKf96PZXcoA/2oQ9L/Ffazk5esr4azUjrH257rm01Dzz2t3dxBk7X5Q+6Iug/djiIWXxZkdJPoTRijwPpGTuUZNKJUs7tO2CUCF4O1BOj7ARij8b+VfA762+0eP8qSQQ1hW/u5wHMp26cuWEAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Jfyz2YJ1; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=3uMGRdB5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FPTQWiUa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=fJFd2v8s; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Jfyz2YJ1";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="3uMGRdB5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FPTQWiUa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="fJFd2v8s"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 585923E1F;
	Mon, 10 Aug 2026 10:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786357104; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2UmGjKx3ENhXSa0vIjZxtxX22Wo7mrarRU4pDFDyKaI=;
	b=Jfyz2YJ1N+lSpf/mfD9uwD4G5drvcqB/Oa1eYB6qTiwEhMxWIe9Bg7pEn75mxgDEgLVFj+
	Vtky+QwFgI7rpWWoVn27N8NolR+R+Rc2BIQ3MMYBLcBsVfKAJRA3FItfAGdVr2SS7Vo+zM
	eycpBl9SPqlLJMI6b8TqSwLIVwsefMU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786357104;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2UmGjKx3ENhXSa0vIjZxtxX22Wo7mrarRU4pDFDyKaI=;
	b=3uMGRdB5Srf+F58UUQlrRSAd11ygZw40uYOQljE51J9RTpnpcp+cnWC4OL68FzovXOKVu8
	CZik1GjzWz+CLAAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=FPTQWiUa;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fJFd2v8s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786357100; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2UmGjKx3ENhXSa0vIjZxtxX22Wo7mrarRU4pDFDyKaI=;
	b=FPTQWiUaDsR/1bH8mzJ4S3+o+yIgr3axEaEiBySvJUigjwrwfaVAzonEhpd4GicnrSAz/Z
	LvhzQ0d0GDp7uJg4gdp/qO+w5IJkFN8JlH7Bpi5Ok11kAtA1E2WsHXlwYBFDQ7acwMB8vx
	p86yacnH9CaNnMx4j53+Xw6IrYzzFIs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786357100;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2UmGjKx3ENhXSa0vIjZxtxX22Wo7mrarRU4pDFDyKaI=;
	b=fJFd2v8sYYxEzuWkWgHQXgL0v3iXLtOC79XjAH1RbvaxHKd8z22AKW3qCoVDMajbvmGaue
	unPoh/7y/Xwc4hAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 28B34779B2;
	Mon, 10 Aug 2026 10:18:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tC2OCGyleWpoXwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 10 Aug 2026 10:18:20 +0000
Date: Mon, 10 Aug 2026 12:18:19 +0200
Message-ID: <874ih29t3o.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "nqse0035" <nqse0035@agent.qq.com>
Cc: "regressions" <regressions@lists.linux.dev>,
	"linux-sound" <linux-sound@vger.kernel.org>,
	"tiwai" <tiwai@suse.com>,
	"linux-kernel" <linux-kernel@vger.kernel.org>
Subject: Re: [REGRESSION] 7.1.6: No sound on MacBook12,1 (Cirrus CS4208) - DAC receives data but speaker silent
In-Reply-To: <tencent_13801A82CCE56E3AF329F8F0F04EC3309007@qq.com>
References: <tencent_13801A82CCE56E3AF329F8F0F04EC3309007@qq.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 585923E1F
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	TO_DN_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:mid,suse.de:dkim]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO

On Mon, 10 Aug 2026 10:13:11 +0200,
nqse0035 wrote:
> 
> 
> Hi,
> 
> Regression introduced in: v7.1.5 -> v7.1.6 (tested both; config unchanged)
> 
> Hardware: MacBook9,1 (2016 MacBook 12"), HDA Intel PCH,
> Cirrus Logic CS4208 codec (SSID 106b:0000)
> Kernel: 7.1.5.arch1-2 (works) / 7.1.6.arch1-1 (broken) on Arch Linux
> Audio stack: PipeWire 1.6.8, WirePlumber 0.5.15
> 
> Symptom:
> After upgrading to 7.1.6 and rebooting, the internal speaker is
> completely silent. Volume UI responds, playback apps run, but no
> sound comes out. Reboot does not help (this is NOT the pre-existing
> occasional no-sound-after-boot issue - it is persistent).
> 
> What I verified (all identical between 7.1.5 and 7.1.6):
> - Codec enumerates fine; snd_hda_intel + snd_hda_codec_cs420x load OK
> - PipeWire/WirePlumber up; default sink
> alsa_output.pci-0000_00_1f.3.analog-stereo present and active
> - Mixer controls unmuted (Master 72%, PCM 100%, Line Out 100%)
> - Routing correct: Active Port = analog-output-speaker,
> headphones not available
> - DAC Node 0x02 shows "Converter: stream=1" -> data IS reaching the
> codec, but the speaker amplifier never produces sound
> - dmesg/journalctl: no ALSA/HDA errors at all
> - Codec fixup/autoconfig logs identical between kernels:
> "CS4208: picked fixup for codec SSID 106b:0000",
> line_outs=1 (0x1d) type:speaker, hp_outs=1 (0x10)
> - Verified power_save=0 (our setting) is NOT the cause: reloaded
> module with power_save=10, still silent; and 7.1.5 works with the
> same configuration
> 
> Conclusion:
> A regression between 7.1.5 and 7.1.6 breaks the CS4208 amplifier
> output path. Suspect: the HD-audio pending-IRQ handling rework from
> the 7.1-rc5 cycle (stated to affect "odd machines"), which likely
> changed hda-intel/hda-core behaviour on this platform.
> 
> Workaround: staying on 7.1.5 (pinned). Happy to run tests or
> provide any further debug info.
> 
> #regzbot introduced: v7.1.5..v7.1.6

Through a quick glance, there is no relevant change between v7.1.5 and
v7.1.6.  At best, please do bisect.


thanks,

Takashi


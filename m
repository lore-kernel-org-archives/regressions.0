Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2421745C701
	for <regressions@lists.linux.dev>; Fri, 14 Aug 2026 11:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786708417; cv=none; b=OYCqjKuhsodgywCd9kleitPAolXBd8/hdN16XEU+zN2MDacO0c8+XeRPnwkec0NCCuFSWFZ3O/aaWvFl+rwWRJlzZOrfwPgHtZX8bSqR6autpJQhRPI7bz36yNrXo8skkm+Evdf8NMRm7EY8+Rh30yWgdYM8wMtxgQNScPvKUMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786708417; c=relaxed/simple;
	bh=b4J9wo2Qi4aBXYF+CU3raqvN/2juGWB4xWcykFUsXRI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bBKXyONNVFaqq3cUvs41Tuy87cwcNpQFhAgDSaJIx8VBJKVwAlBvF5H1rP48+T+/QnbotfkE3PnsCkf5pNN024Hxs8P/NM2tHtQglpHi5E4URypZW9xMkBeilt3KOYI2b51xah6CF3uI65ko6yCNu+TdOGzacg6Py1bMXF3fmv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=mbq48Ytv; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=aFJQ7nZm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=fHz03pSw; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=+o36EDu+; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="mbq48Ytv";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="aFJQ7nZm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="fHz03pSw";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+o36EDu+"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 1B26082EDD;
	Fri, 14 Aug 2026 11:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786708410; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1VXNydT7YuIGO9xM+2p9ddksqWjeTPvhd1C+NlEQ84k=;
	b=mbq48YtvoBkhxO0uSyhgpsjxSBXS9H00G1Z8Jew6P+1OpYhCN9pD8ikMl1Wc+6dz5y+e8v
	woCEuvKyFQmsieP639+J1KIsdCzUXsFeZ+eP5DvIvzZMN6a4K438iB+k7owSAflllhFWH0
	obPJq9UHTOZw+sXV/x+V+lnhWDZOpK0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786708410;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1VXNydT7YuIGO9xM+2p9ddksqWjeTPvhd1C+NlEQ84k=;
	b=aFJQ7nZm8AjTm9LuAzrXQ3YPQ5eYYIujxXfhIfd8zEeQ3z3jFAmF8LQPIiAODrzDUy9gKE
	NJVie2K/2F7YTZCg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786708406; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1VXNydT7YuIGO9xM+2p9ddksqWjeTPvhd1C+NlEQ84k=;
	b=fHz03pSwb9rQgIGqOQRKxyZ2gsPAQKDEC3KBa/84pOg+N5gj3rxdR1Pp9BWoFkyMiUZgYY
	8KQ5UceLcDCqaDIgTFKD+zgx+ojjgAuj4PT8wDFJwh2DmlL3E9y6DuBOpuoY9+1OrXnRzA
	+U/lLICJ8/WU6TC50cL+liPsU6Ge7jg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786708406;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1VXNydT7YuIGO9xM+2p9ddksqWjeTPvhd1C+NlEQ84k=;
	b=+o36EDu+JJo80TOF3K0GVBN7thTUqz6mQIHYea8cdIuJBPE3gyWvA8MAFObRBhzEhme0m1
	NDoAyVcuPg+MQKAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CF3A778374;
	Fri, 14 Aug 2026 11:53:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 7iW7MLUBf2ptdAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 14 Aug 2026 11:53:25 +0000
Date: Fri, 14 Aug 2026 13:53:25 +0200
Message-ID: <87ecg0ex56.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: "Alexander N." <adventureFAN@gmx.de>
Cc: linux-sound@vger.kernel.org,
	regressions@lists.linux.dev,
	tiwai@suse.de,
	perex@perex.cz,
	i@rong.moe
Subject: Re: [REGRESSION] ALSA: usb-audio: Logitech PRO X Wireless 046d:0aba playback volume rejected as sticky
In-Reply-To: <6262cbbd-d1f2-4c9d-a1c7-9c5d12636f4b@gmx.de>
References: <6262cbbd-d1f2-4c9d-a1c7-9c5d12636f4b@gmx.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.29
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.29 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.19)[-0.972];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmx.de];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmx.de];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]

On Fri, 14 Aug 2026 12:41:54 +0200,
Alexander N. wrote:
> 
> Hello,
> 
> I found a regression in snd-usb-audio affecting the Logitech PRO X
> Wireless Gaming Headset (USB ID 046d:0aba).
> 
> The device has a valid UAC1 playback volume control, but the sticky mixer
> detection introduced by commit 86aa1ea1f15c ("ALSA: usb-audio: Do not
> expose sticky mixers") rejects it.
> 
> Hardware
> ========
> 
>   Logitech PRO X Wireless Gaming Headset
>   USB ID: 046d:0aba
> 
> Observed kernel
> ===============
> 
>   7.1.5-ogc5.1.fc44.x86_64
>   Bazzite/Fedora 44 OGC kernel
> 
> The OGC patch for this kernel does not modify sound/usb, and the relevant
> mixer.c code matches upstream Linux 7.1.5.
> 
> I have not hardware-tested current mainline 7.2-rc7, but current upstream
> mixer.c still contains the same immediate SET_CUR -> GET_CUR sticky mixer
> test and I could not find a device quirk for 046d:0aba.
> 
> Symptom
> =======
> 
> Without a workaround, ALSA only exposes:
> 
>   Simple mixer control 'PCM',0
>     Capabilities: pswitch pswitch-joined
> 
> There is no PCM Playback Volume control.
> 
> The kernel logs:
> 
>   usb 1-10: 2:0: sticky mixer values (-16384/0/256 => -3840), disabling
> 
> I have also observed the same message ending in "=> 0", depending on the
> hardware volume at probe time.
> 
> Because the playback volume control is removed, the physical volume wheel
> changes the headset's hardware volume independently of the PipeWire/KDE
> system volume.
> 
> USB Audio control behavior
> ==========================
> 
> The device is UAC1.
> 
> Feature Unit 2 exposes a master playback volume control.
> 
> Direct control requests, after temporarily unbinding AudioControl
> interface 0 from snd-usb-audio, report:
> 
>   GET_MIN = -16384  (-64.00 dB)
>   GET_MAX =      0  (  0.00 dB)
>   GET_RES =    256  (  1.00 dB)
> 
> GET_CUR and SET_CUR both work, but the device has two quirks relevant to
> the new sticky detection.
> 
> 1. GET_CUR reflects normal SET_CUR changes with a delay of roughly 50 ms.
> 
> Measured from 0 dB:
> 
>   target     result   first visible GET_CUR change
> 
>    -1 dB     OK       81.3 ms
>    -2 dB     OK       51.9 ms
>    -4 dB     OK       47.3 ms
>    -8 dB     OK       47.1 ms
>   -16 dB     OK       51.7 ms
>   -32 dB     OK       47.2 ms
> 
> 2. The advertised minimum value -64 dB is not functional.
> 
> A direct SET_CUR to -64 dB returns success, but GET_CUR remains at 0 dB
> even after 1000 ms.
> 
> This appears to cause a false positive in check_sticky_volume_control():
> 
> - cval->min is -16384 (-64 dB)
> - cval->max is 0
> - if the saved value is 0, max is skipped
> - SET_CUR(min) returns success
> - an immediate GET_CUR still returns the saved value
> - the mixer is classified as sticky and is not registered
> 
> mixer_get_cur_broken is not appropriate
> =======================================
> 
> I tested the mixer_get_cur_broken quirk.
> 
> GET_CUR on this device is not broken or constant. It correctly reports
> host SET_CUR changes after the device delay, and it also reports volume
> changes caused by the physical headset wheel.
> 
> Using an internal-only cached value would therefore lose useful hardware
> state.
> 
> Local proof-of-concept fix
> ==========================
> 
> I built a local snd-usb-audio.ko against the running 7.1.5 kernel.
> 
> For this specific device, Feature Unit 2, UAC_FU_VOLUME, I:
> 
> - clamp the unusable minimum from -64 dB to -63 dB
> - skip the probe-time sticky/resolution checks for this control
> 
> With that module, ALSA exposes:
> 
>   Simple mixer control 'PCM',0
>     Capabilities: pvolume pvolume-joined pswitch pswitch-joined
>     Playback channels: Mono
>     Limits: Playback 0 - 63
> 
> /proc/asound/card*/usbmixer shows:
> 
>   Unit: 2
>     Control: name="PCM Playback Volume", index=0
>     Info: id=2, control=2, cmask=0x0, channels=1, type="S16"
>     Volume: min=-16128, max=0, dBmin=-6300, dBmax=0
> 
> Most importantly, no userspace workaround is required once the mixer
> control is restored.
> 
> Example before rotating the physical headset wheel:
> 
>   ALSA:     -27 dB / 57%
>   PipeWire: 0.35
> 
> After rotating the headset wheel:
> 
>   ALSA:     -11 dB / 83%
>   PipeWire: 0.65
> 
> KDE system volume follows the physical wheel as expected.
> 
> I attached the proof-of-concept diff and the measured results. I am happy
> to test a maintainer-preferred implementation or additional diagnostics.
> 
> My suspicion is that this device exposes two assumptions in the sticky
> mixer probe that are not universally safe:
> 
> 1. GET_CUR is assumed to reflect SET_CUR immediately.
> 2. advertised min/max values are assumed to be usable test values.
> 
> Thanks.

The patch looks simple and safe enough, so if this works for you, it's
fine to take.  In that case, please submit a proper patch.


thanks,

Takashi

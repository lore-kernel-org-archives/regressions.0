Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240A450EC10
	for <regressions@lists.linux.dev>; Tue, 29 Sep 2026 11:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790680297; cv=none; b=j4nfOUTERttoLBejlcMtMy20bLZJNW0uNNGjhq6GZyh40f5+3och21uReJmgJIoLMHRVtVO7qVpFcYkFEI9laGdlpQoAVuYehG/3VJK/KNkN/dHPNjWaq3qzU4UE8a55wQYn7/V7rMEFWmrRwfVvTejn6KN5mCZUiLkwOVQAV2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790680297; c=relaxed/simple;
	bh=0PqdUx8rKwADKPdR+wsYbYMImyQx7yX+E51fSlXK5xk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DZYL4wKUwVGZihEIKlunT52EKoX5XoMAdp2GAFNeZrfAwoyx4jwHwmOOF/o6l1ZAvrJV+R7+L3j6nvppOLtXM+zOw86++xDuolVzZDm0F0Rxi9hlPREQfCjmWmik5zBoNOAN/tjUnxi0OYX3JdYqZu63f7woS6wDV9+B8wbtJcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LtYvM9I+; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=8hbA8cy2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rrz/hgrG; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Udoy5epo; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LtYvM9I+";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="8hbA8cy2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rrz/hgrG";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Udoy5epo"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 056381F7BF;
	Tue, 29 Sep 2026 11:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790680290; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+RDezdUxyBg67hf2lf4Gyq/3lew68MZA9XvgOQi/T9M=;
	b=LtYvM9I+ZZOYg1HS1xAAXcUvNfIv6JE7Q90Vh4Sz2p/SX3rTmpzIrrc/gkpgf1JeG+SOod
	f7Od7ZpPDKCc33R/YkLTyXyrOX/k/fpAIayh6v2RKkF8PTeyISSA/gKqhRTtVBboNcTRou
	XydxczXj3BEIoThkMEkCfi88U49JN+k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790680290;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+RDezdUxyBg67hf2lf4Gyq/3lew68MZA9XvgOQi/T9M=;
	b=8hbA8cy2C5Awznvht/lahVKPqS8/u1Ybj9JQWigXS7jcpUgDiuGj913DucaBf4HH8RtnXX
	IGU4b33dcsSwfPCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790680286; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+RDezdUxyBg67hf2lf4Gyq/3lew68MZA9XvgOQi/T9M=;
	b=rrz/hgrGgcJTlEs3NxyOrZWwRkVbm4ZvMnCaWbvURIcyGoItqAEoRHrkedjZK8S6VCQ90r
	5Bvi6z+NgP7BdPbprauFkgnfWjMV3XStly0uQa8GJUKCuYkP6Zz4nShO55dVGLcxs95VQo
	5ksR5qinxQpQHgIXRjYBbZ60ANxk27I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790680286;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+RDezdUxyBg67hf2lf4Gyq/3lew68MZA9XvgOQi/T9M=;
	b=Udoy5epoQPjYPTrpRFhlzq3I31rW7rwV2D8uvoqd+zbNY5yTHMTgG02iBySVwuk8njwQvm
	bj94lUQu16UbBlDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C76B3136E4;
	Tue, 29 Sep 2026 11:11:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Cz/7Jt2cu2q9BAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 29 Sep 2026 11:11:25 +0000
Date: Tue, 29 Sep 2026 13:11:25 +0200
Message-ID: <875wzo2tya.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jan Lentfer <jan.lentfer@web.de>
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.de,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] ALSA: usb-audio: Behringer USB-MIDI output stalls, since "Use strings in struct usb_dev for manufacturer & co"
In-Reply-To: <e7087d42-5e74-4d85-b1c5-b11eff235d41@web.de>
References: <e7087d42-5e74-4d85-b1c5-b11eff235d41@web.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[web.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[web.de];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -2.30
X-Spam-Level: 

On Tue, 29 Sep 2026 12:55:11 +0200,
Jan Lentfer wrote:
> 
> Hi,
> 
> since 7.1, USB-MIDI output to several Behringer synths stalls completely
> after the synth is switched on or re-plugged. I traced it to the missing
> string-descriptor reads after SET_CONFIGURATION, which were removed by
> 
>   "ALSA: usb-audio: Use strings in struct usb_dev for manufacturer & co"
>   (Takashi Iwai, posted 2026-03-05)
> 
> The firmware of these devices evidently only starts accepting bulk-OUT
> data after one more control request following SET_CONFIGURATION.
> Until 7.0, snd-usb-audio happened to send two: the usb_string() calls
> in usb_audio_make_shortname() / usb_audio_make_longname().
> 
> #regzbot introduced: v7.0..v7.1
> 
> Affected (class-compliant USB-MIDI 1.0, full speed, bulk EP 0x02 OUT /
> EP 0x81 IN, one altsetting):
>   1397:1230  BEHRINGER K-2 MK II      (verified: usbmon + workaround)
>   1397:1249  BEHRINGER KOBOL EXPANDER (same symptom; 7.0 good, 7.1 bad)
>   1397:1256  BEHRINGER 2-XM           (same symptom on 7.2)
> Not affected: Behringer PRO-800, Roland SE-02 (0582:0201).
> 
> Kernels: Liquorix builds of the stable releases, Debian 12 amd64.
> 7.0.14 is good; 7.1.12 and 7.2.4 - 7.2.8 are bad.
> I have not run a vanilla build, but the usbmon diff below points
> directly at the mainline change. Liquorix report:
> https://github.com/damentz/liquorix-package/issues/233
> 
> Symptom
> -------
> After the synth is power-cycled while connected, the first 7 MIDI
> messages leave the rawmidi buffer, and none of them reaches the synth.
> After that the output is stuck:
> 
>   /proc/asound/cardN/midi0:  Tx bytes: 21   Avail: 4021 (of 4096)
>   dmesg on close:  rawmidi drain error (avail = 4081, buffer_size = 4096)
> 
> usbmon shows 7 bulk-OUT URBs (= OUTPUT_URBS) submitted with correct
> USB-MIDI packets and never completed (the device NAKs forever). No
> error is logged. Once stalled, only a new control request (see below)
> or booting a 7.0 kernel recovers it. A synth that was already working
> keeps working across a reboot into 7.1+, because nothing re-enumerates
> its firmware state; only a fresh power-on triggers the problem.
> 
> Ruled out: IRQ threading (same with nothreadirqs), RT IRQ priorities,
> the shared IRQ line, hubs vs. root port, userspace (aplaymidi alone),
> runtime PM, MIDI channel.
> 
> usbmon: power cycle of the K-2 MK II, 7.0.14 vs 7.2.8
> -----------------------------------------------------
> Byte-identical up to and including SET_CONFIGURATION. Then:
> 
> 7.0.14:
>   S Co:3:021:0 s 00 09 0001 0000 0000 0         SET_CONFIGURATION 1
>   C Co:3:021:0 0 0
>   S Ci:3:021:0 s 80 06 0302 0409 00ff 255 <     string 2 (product)
>   C Ci:3:021:0 0 20 = 14034b00 2d003200 ...      "K-2 MK II"
>   S Ci:3:021:0 s 80 06 0301 0409 00ff 255 <     string 1 (manufacturer)
>   C Ci:3:021:0 0 20 = 14034200 65006800 ...      "Behringer"
>   S Bi:3:021:1 -115 64 <   (x7)
>   S Bo:3:021:2 -115 4 = 09933c6e
>   C Bo:3:021:2 0 4 >                             completes in ~0.2 ms
>   ... all further Bo complete
> 
> 7.2.8:
>   S Co:2:022:0 s 00 09 0001 0000 0000 0         SET_CONFIGURATION 1
>   C Co:2:022:0 0 0
>   (no further control request to the device)
>   S Bi:2:022:1 -115 64 <   (x7)
>   S Bo:2:022:2 -115 4 = 09933c6e
>   ... 6 Bo submitted, none ever completes (capture ran > 60 s)
> 
> Proof / workaround
> ------------------
> On 7.2.8, with the K-2 stalled (7 OUT URBs pending), I issued a single
> GET_DESCRIPTOR(STRING, index 2, 0x0409) from userspace via usbfs
> USBDEVFS_CONTROL. The pending URBs completed immediately (Tx 21 -> 96,
> buffer drained), and all later MIDI output works.
> As a stop-gap I now do that from a udev rule when the card appears:
> 
>   ACTION=="add", SUBSYSTEM=="sound", KERNEL=="controlC*", \
>     ATTRS{idVendor}=="1397", \
>     RUN+="/usr/local/sbin/behringer-usbmidi-wake $attr{busnum}
> $attr{devnum}"
> 
> With it, a power-cycled K-2 MK II works on 7.2.8 without manual steps.
> 
> Possible fix
> ------------
> A quirk for these IDs (or all of 1397:*) that issues one standard
> control request after SET_CONFIGURATION, e.g. reading a string
> descriptor, before the MIDI endpoints are used. Alternatively, restore
> an actual usb_string() read in the card-name path. I'm happy to test
> patches, and I can send the full usbmon captures and descriptor dumps.
> 
> USB descriptors (K-2 MK II; Kobol Expander identical apart from strings):
> - bcdUSB 2.00, full speed, bcdDevice 2.00, 1 configuration, self powered
> - Interface 0: AudioControl, no endpoints
> - Interface 1: MIDIStreaming, 1 altsetting, 2 endpoints
>   - EP 0x02 OUT bulk, 64 bytes, 1 embedded jack
>   - EP 0x81 IN bulk, 64 bytes, 1 embedded jack
> - Host: Intel 82801JI (ICH10) EHCI, devices behind USB 2.0 hubs
>   (also seen on a UHCI root port)
> 
> Thanks,
> Jan Lentfer
> 
> Disclaimer: analyzed and reported with AI support

Thanks for the report.

Can this be fixed by applying the same boot quirk for Behringer CM1A
(something like below)?

Or do we need explicit usb_string() calls instead?  If yes, which one
(iProduct, iManufacturer) matters?


thanks,

Takashi

-- 8< --
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1785,6 +1785,9 @@ int snd_usb_apply_boot_quirk_once(struct usb_device *dev,
 	case USB_ID(0x07fd, 0x0008): /* MOTU M Series, 1st hardware version */
 		return snd_usb_motu_m_series_boot_quirk(dev);
 	case USB_ID(0x1397, 0x1234): /* Behringer CM1A */
+	case USB_ID(0x1397, 0x1230): /* Behringer K-2 Mk II */
+	case USB_ID(0x1397, 0x1249): /* Behringer Kobol Expander */
+	case USB_ID(0x1397, 0x1256): /* Behringer 2-XM */
 		return snd_usb_cm1a_boot_quirk(dev);
 	case USB_ID(0x2717, 0xd005): /* Xiaomi audio connector */
 		snd_usb_xiaomi_boot_quirk(dev);

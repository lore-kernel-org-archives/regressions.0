Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9195251814A
	for <regressions@lists.linux.dev>; Tue, 29 Sep 2026 11:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790682609; cv=none; b=YUMWSWHTPtQvir+xhTGOy1+zWVQ6ZojqFmsYeukmnpUXC3wha1TWEiSeK6Ib83QQVQE8EWY5EaSENqPDgRKxv1A+qXpyFoYj5HOfz7uH3y73Xcgn6AI5ozOEhbMi9SpcASYUDqNQ1mm+OpPpC4uYzk2P5zYn1/m9+RWJEtl+p3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790682609; c=relaxed/simple;
	bh=OZcJmdyoRDiN62ILBVC6yzhaVsNF+Qvsxy6TpaMia7o=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Llbr/RTz+OKqQtr3O+9G3nM8gH+sDUkv/c2/tw0VUzdB/HBhiB+l71EX731vp0PeJpyRx145vpqNf34YBMxvfHt8Zlc/4VkLWTLRzY3Gf3+76J3X7ecFozMajoR92lmh0NM+vhZ3puCUsy/BWu6ti7PCkiWu4eCioUyFoZ9FLyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0WFQpLy0; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=mlJPfFEM; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nM2S/fqJ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Gy5xQNX4; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0WFQpLy0";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="mlJPfFEM";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nM2S/fqJ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Gy5xQNX4"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6573F1F38E;
	Tue, 29 Sep 2026 11:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790682600; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L/fn0G7oJs3UL/l5Ugd7WhaILynFwRxWotEaEg7LwX0=;
	b=0WFQpLy0fuK8Zu5HPcUvAgbzYYRm+ytzEjlDEcjhQicMlUBjZ4PoU2PuWmR8zNBe6xprKr
	u/VRDUOBaq2KjquyN6m+6bhqAi/LSHvnF5LGMyqHlzQlVSIbV6aLUKjghI+qw4TaOK8vyb
	fEAQ+DEaPKGlTGKXjg7aOGtqE4z3GTA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790682600;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L/fn0G7oJs3UL/l5Ugd7WhaILynFwRxWotEaEg7LwX0=;
	b=mlJPfFEMVyFurxu1W3+Y/YRh3GcbfniKpBM5G/HZwTBnkEbIfFF3uL3YciP4rt0Dr04csf
	w/8dITxuq5WDbaBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790682596; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L/fn0G7oJs3UL/l5Ugd7WhaILynFwRxWotEaEg7LwX0=;
	b=nM2S/fqJ+FNg5ob6nUOOiUzcd5PFCeFob6R75AM7kZ9Ol4h8hsxpfZ6U2GwLn9GcRKvNoX
	gsq4YkDl8SNB2sft8AnTdrxtt0lXskzN1kGtf2C5ZFgWwBesqhdfe83ESyNmm/XeU+r5KL
	f9UBgdMW3PSSlz2lkNkftYGuuiv+Ga4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790682596;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L/fn0G7oJs3UL/l5Ugd7WhaILynFwRxWotEaEg7LwX0=;
	b=Gy5xQNX4+OAFK8bkb9/gMhto5UEfgZ3uRNV4NBHkyAt/6709kJpsvGxmGBOW58z+SujbDP
	plyNqctwzTBBrGCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 35E84133F1;
	Tue, 29 Sep 2026 11:49:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gsW9BOSlu2qVLgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 29 Sep 2026 11:49:56 +0000
Date: Tue, 29 Sep 2026 13:49:51 +0200
Message-ID: <87wls41dls.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jan Lentfer <jan.lentfer@web.de>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] ALSA: usb-audio: Behringer USB-MIDI output stalls, since "Use strings in struct usb_dev for manufacturer & co"
In-Reply-To: <272336a8-ab7c-4f9a-ac0c-c438b94caeca@web.de>
References: <e7087d42-5e74-4d85-b1c5-b11eff235d41@web.de>
	<875wzo2tya.wl-tiwai@suse.de>
	<272336a8-ab7c-4f9a-ac0c-c438b94caeca@web.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_TO(0.00)[web.de];
	URIBL_BLOCKED(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[web.de];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO

On Tue, 29 Sep 2026 13:42:04 +0200,
Jan Lentfer wrote:
> 
> > Thanks for the report.
> > 
> > Can this be fixed by applying the same boot quirk for Behringer CM1A
> > (something like below)?
> > 
> > Or do we need explicit usb_string() calls instead?  If yes, which one
> > (iProduct, iManufacturer) matters?
> > 
> > 
> > thanks,
> > 
> > Takashi
> > 
> > -- 8< --
> > --- a/sound/usb/quirks.c
> > +++ b/sound/usb/quirks.c
> > @@ -1785,6 +1785,9 @@ int snd_usb_apply_boot_quirk_once(struct usb_device *dev,
> >   	case USB_ID(0x07fd, 0x0008): /* MOTU M Series, 1st hardware version */
> >   		return snd_usb_motu_m_series_boot_quirk(dev);
> >   	case USB_ID(0x1397, 0x1234): /* Behringer CM1A */
> > +	case USB_ID(0x1397, 0x1230): /* Behringer K-2 Mk II */
> > +	case USB_ID(0x1397, 0x1249): /* Behringer Kobol Expander */
> > +	case USB_ID(0x1397, 0x1256): /* Behringer 2-XM */
> >   		return snd_usb_cm1a_boot_quirk(dev);
> >   	case USB_ID(0x2717, 0xd005): /* Xiaomi audio connector */
> >   		snd_usb_xiaomi_boot_quirk(dev);
> 
> 
> The CM1A quirk should be sufficient. No usb_string() is needed.
> 
> I reproduced the CM1A quirk's request from userspace on 7.2.8 (usbfs
> USBDEVFS_CONTROL, no wake-up udev rule active):
> 
> 1. Power-cycle the K-2 MK II and send notes: the output stalls as before
>    (rawmidi Tx 21, avail 4021, 7 bulk-OUT URBs pending).
> 2. Send a single GET_DESCRIPTOR(DEVICE, 18 bytes)
>    (80 06 0100 0000 0012), nothing else. The pending URBs complete
>    immediately (Tx 21 -> 96, buffer drained), and all following MIDI
>    output works.
> 
> A GET_DESCRIPTOR(STRING 2) instead has the same effect (tested
> earlier). So it looks like any standard control request after
> SET_CONFIGURATION wakes the endpoint, same as on the CM1A.
> 
> I have only verified this on the K-2 MK II (1397:1230). The KOBOL
> EXPANDER (1397:1249) and 2-XM (1397:1256) run the same firmware
> family, have identical descriptors and show the identical stall, so
> I'd expect the quirk to cover them as well.

Thanks for quick tests!

I'll prepare the fix patch for upstream in a similar form as given in
the previous mail.


Takashi

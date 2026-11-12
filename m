Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487482;
	b=gF64Tdg1ANg3hwYYkWI4mp5brD4DXRv1op41NeCk263COtuQm1+2vjhm2XxY61IIHRlN
	 oW/+/LEQLt/ytgwGdJ8pJplsZBCCFUGSsvZqXOQ/W5dTldayE9FaFHuKzp9ywngUUwaRM
	 gxJbJr9wqIaDGl3yJF9VZtXIBQK9vtUPUfv2bqXIz8RqAsAkQPYrv+1vNJQ6MAfQp7VtN
	 gMm8IbJ5BTYla3281kxLk7rR6+t2DY5W1GToB1t4cAjA+/p1n/eQ+U4WjuD3HqqcNPtyk
	 9Sy1mvV1gqqvn0l5xNkfbxiL/kXuZ8CC8ZDZVLL5ksl1SaX8/gwWDEmMmY7tt1za2CQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487482;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spam-Flag:X-Spam-Level:X-Spamd-Result:
	 X-Spam-Score;
	bh=ZmedOBpFWlguWwm50e53kgM+K/VJlbhEzbjheBRegzs=;
	b=x5x4ylAdDA6GQxAHojB8eskRbis8Sh6oGpxlCLZoXilzRJJskpp5r0q7RxGxojJcFcHZ
	 nkX7fI50RXBxXXAlTVCrgpgPONumrCvfxbZCLkt9B7oePd3q2NMscs9VDg3H2HNg7gNQx
	 bkY2SYxYrIbSBtKX4X+vsdrbeANmaI69SV63WQPG438grH0zA1e6zDDXzCgwlFy2/tVKg
	 /pfSSXFKx6RVkGp6FYLsXgtHRoVwKx17opm0Wtz9GN/TO7E1PZNd+yn6OHKxJF/hyi3TH
	 ZJUlJFhMaWvFl4R+m1OrP2cGmJEH427xQo6wu8yWaSmNXlg4EJWYYbC10xV85O5fnaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1M0F2sVN;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=0E+5I6ra;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ncvtFGNA;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=IJvaIqAa;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4B30606A321
	for <regressions@lists.linux.dev>; Thu, 12 Nov 2026 12:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4B30606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1M0F2sVN;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=0E+5I6ra;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ncvtFGNA;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=IJvaIqAa
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EC6D81F388;
	Thu, 12 Nov 2026 12:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794487480; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZmedOBpFWlguWwm50e53kgM+K/VJlbhEzbjheBRegzs=;
	b=1M0F2sVNeTf/WoDHtghm1iTghf1SsD/ImjPPMAUoZOv3ohVHkzSL2tLV26JwWoUW/y4S9M
	4GDos0B7wd60MKk2nggWyT42J3k13nkp2N78R6IpJmIoX9EnlYdUL8aB6BDbTAA/2o5HaW
	myNC9Imzg9EKMCLKcbJ4D8dB4AKwQ5o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794487480;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZmedOBpFWlguWwm50e53kgM+K/VJlbhEzbjheBRegzs=;
	b=0E+5I6raqV7hCGy6gcaog8dMzzkRRVNJNZAmmNzsilgQNgJGXH1ohY6EtebmDqulXscn1b
	oCzaQPVfXB7yoXBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794487479; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZmedOBpFWlguWwm50e53kgM+K/VJlbhEzbjheBRegzs=;
	b=ncvtFGNAU5FU3OlO3ifqYb9WlKZ/Rsx8g0sM3GcZrM2gSFwNYskZP10ryl2yCDrfnu8oym
	7s0if9nejEsoXl9fuUuI0/KZWHUvns6YHSlbtaoB36ALW0CU9RNa15nAff93V9Jl58VpZk
	iZz2r+R8tv16ig7CbKIxOGghstNzSeM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794487479;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZmedOBpFWlguWwm50e53kgM+K/VJlbhEzbjheBRegzs=;
	b=IJvaIqAa24aXnNXVO5K2sQWB8zpR0n7l1g3YXT2FdltyuduOisVLjm4TEoLnshnH1ggMwc
	CjO6FRNdTAqQ4qCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9C90F13432;
	Thu, 12 Nov 2026 12:44:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qhePHLe09WoCVAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 12 Nov 2026 12:44:39 +0000
Date: Thu, 12 Nov 2026 13:44:39 +0100
Message-ID: <87ik22rzgo.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Jonne Vuorela <jonne.vuorela@proton.me>
Cc: William MacKinnon <wh6cyy@gmail.com>,
	linux-sound@vger.kernel.org,
	regressions@lists.linux.dev,
	Jaroslav Kysela <perex@perex.cz>,
	Arlou Kier Motas <motasarloukier@icloud.com>
Subject: Re: [REGRESSION] ALSA: hda/cs420x: MacBookPro11,3 internal speaker half-disabled by 8086:7270 quirk (82cfab6a5262)
In-Reply-To: <CABWzDrqrskmtb7MVFgJ54k4WNSqby7Qo3R1XeoVBaJ+djaO1ew@mail.gmail.com>
References: <CABWzDrqrskmtb7MVFgJ54k4WNSqby7Qo3R1XeoVBaJ+djaO1ew@mail.gmail.com>
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
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,icloud.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.linux.dev,perex.cz,icloud.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30

On Thu, 12 Nov 2026 01:04:29 +0100,
William MacKinnon wrote:
> 
> 
> Hi,
> 
> Since v7.3, the internal speakers on a MacBookPro11,3 (CS4208) sound quiet
> and thin, with no bass. Headphones are fine. Bisected by inspection to:
> 
>   82cfab6a5262 ("ALSA: hda/cs420x: Add CS4208 fixup for MacBookAir 7,2")
> 
> #regzbot introduced: 82cfab6a5262
> 
> That commit maps PCI SSID 8086:7270 to CS4208_MAC_AUTO and, in
> cs4208_mac_fixup_tbl, to CS4208_MBA6. 8086:7270 is a generic Intel
> subsystem ID, not unique to the MacBookAir 7,2. This MacBookPro11,3 reports
> the same PCI SSID on its HDA controller, so it now gets mba6_pincfgs:
> 
>   DMI:     MacBookPro11,3 (board Mac-2BD1B31983FE1663, firmware 478.0.0.0.0)
>   00:1b.0  Intel 8 Series HDA [8086:8c20], Subsystem [8086:7270]
>   Codec:   CS4208, vendor 0x10134208, subsystem 0x106b5e00, rev 0x100300
> 
> v7.2.15 (correct):
>   CS4208: picked fixup  for codec SSID 106b:0000
>   CS4208: picked fixup  for codec SSID 106b:5e00
>   autoconfig for CS4208: line_outs=2 (0x12/0x13/0x0/0x0/0x0) type:speaker
>   (plus Mic=0x18, Internal Mic=0x1c, dig-out=0x21)
> 
> v7.3.3 (Fedora 7.3.3-200.fc44):
>   CS4208: picked fixup  for PCI SSID 8086:7270
>   CS4208: picked fixup  for PCI SSID 8086:7270
>   autoconfig for CS4208: line_outs=1 (0x12/0x0/0x0/0x0/0x0) type:speaker
>   (only Internal Mic=0x1c; no 0x18, no dig-out)
> 
> On this machine the speaker uses two pins (0x12 + 0x13, assoc 1, seq 0/2).
> The MBA6 table sets 0x13 to 0x500000f0, so half of the speaker path
> (including the bass) is never driven. It also disables the external mic
> jack and SPDIF:
> 
>   pin   init (BIOS)   driver (MBA6)
>   0x13  0x90100112    0x500000f0
>   0x18  0x00ab9040    0x43ab9030
>   0x21  0x004be030    0x430000f0
>   (0x10, 0x12 and 0x1c also differ; full tables below)
> 
> Forcing model=106b:5e00 or model=mbp11 via hwC0D0/modelname + reconfig did
> not help: the Mac sub-table lookup still ends at PCI SSID 8086:7270.
> 
> Workaround confirmed: restoring the BIOS pins as user pin configs (HDA patch
> file [pincfg] = init_pin_configs) brings back line_outs=2 and the speaker
> sounds normal again.
> 
> Matching the MacBookAir 7,2 by something unique to it would avoid catching
> other Macs that share 8086:7270. That could be its codec SSID (if it isn't
> 0x106b5e00), its DMI product name, or a check that only falls back to the PCI
> SSID when the codec SSID is not an Apple one. This MBP's codec SSID
> (106b:5e00) is Apple's, and before this commit it was matched by that.
> Jonne, could you share the codec subsystem ID of the MacBookAir 7,2
> (cat /sys/class/sound/hwC0D0/subsystem_id)?
> 
> I can test patches on the MacBookPro11,3.
> 
> Full pin configs on v7.3.3:
> 
> init_pin_configs     driver_pin_configs
> 0x10 0x002b4020      0x10 0x032120f0
> 0x11 0x400000f0      0x11 0x500000f0
> 0x12 0x90100110      0x12 0x90100010
> 0x13 0x90100112      0x13 0x500000f0
> 0x14 0x400000f0      0x14 0x500000f0
> 0x15 0x400000f0      0x15 0x770000f0
> 0x16 0x400000f0      0x16 0x770000f0
> 0x17 0x400000f0      0x17 0x430000f0
> 0x18 0x00ab9040      0x18 0x43ab9030
> 0x19 0x400000f0      0x19 0x770000f0
> 0x1a 0x400000f0      0x1a 0x770000f0
> 0x1b 0x400000f0      0x1b 0x770000f0
> 0x1c 0x90a60100      0x1c 0x90a00090
> 0x1d 0x400000f0      0x1d 0x500000f0
> 0x1e 0x400000f0      0x1e 0x500000f0
> 0x1f 0x400000f0      0x1f 0x500000f0
> 0x20 0x400000f0      0x20 0x500000f0
> 0x21 0x004be030      0x21 0x430000f0
> 0x22 0x400000f0      0x22 0x430000f0
> 
> Thanks,
> Will MacKinnon

Thanks for the report.
Also there is another report about the same regression
  https://lore.kernel.org/71fb1e29-60e1-4522-a071-c53557cea39b@icloud.com
(now putting the reporter here to Cc, too)

I'm going to revert the change for now, as it seems hitting multiple
different models.

Jonne, could you rather check the HD-audio codec SSID, instead of the
PCI SSID?  The codec SSID should be more unique to each model, and we
can apply it via HDA_CODEC_QUIRK() instead of SND_PCI_QUIRK().


thanks,

Takashi

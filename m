Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C491E834E
	for <regressions@lists.linux.dev>; Wed,  6 Aug 2025 18:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754506688; cv=none; b=klHQRinVDOxyQNl69EQeDUSQRHSb/la46dKv8m0qw+DBAofihDPH2Vy9bWxMGOhcDFfhnQ0YOn5b1gQ8HWYGv1dfPjpGg/goPHJqC5uEYcxLF7R7d538bS8I4pwB+Zd2BBN3EvNNRIKGVC2aiT0Z/ZGlJe42IUY1SYiEFKq6ngg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754506688; c=relaxed/simple;
	bh=dOfDXkheIQz0oPV6PBzkzMZnP7ex2IB+FSTayfsY+P8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qTmd6ihS/hfch6J8UkBPrk26M0uqhINuyhPwCBjAmWnQP6kH0FoWCP2d3H53LfYj11X1V/fq/Qi7dFI4PSCmCQgas6Sj63F7J1OTsGM8qoU+axxw5h1pr5Fc+OyHpP5Lb5Jt8a208VMyH03edrxho5bZdMJZpqwwlwiH9bTSwEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Gat88dnC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KP24cZ4b; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Gat88dnC; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KP24cZ4b; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Gat88dnC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KP24cZ4b";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Gat88dnC";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KP24cZ4b"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2A84020736;
	Wed,  6 Aug 2025 18:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754506684; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eFIL/GJhJxE4/DlZdH2oqa5UlxcXRNE6q0kcLrF7hLY=;
	b=Gat88dnCnQZXMpuFvJso2c7uDs1sqO//S30V0+C6P4fBSCDTYKY+8nxpFmf9td7w3/MktK
	0DuFrI/rjEy1ETutdNOp2mZfoeZIPoSxnKj4sDCnBGqgUevax13KKl51lxrL0KKy2xauDZ
	4EhnRoimIRHV7IDNAkGGRF9fdrfPiys=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754506684;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eFIL/GJhJxE4/DlZdH2oqa5UlxcXRNE6q0kcLrF7hLY=;
	b=KP24cZ4bLXzUwQ0dziZzUnhFRTxkwKnHuEnB/TTBuY2ekeoZoq+hO9BhkWb7OYfSVB5cSO
	zoQFiW5qNc53G8AA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Gat88dnC;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=KP24cZ4b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754506684; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eFIL/GJhJxE4/DlZdH2oqa5UlxcXRNE6q0kcLrF7hLY=;
	b=Gat88dnCnQZXMpuFvJso2c7uDs1sqO//S30V0+C6P4fBSCDTYKY+8nxpFmf9td7w3/MktK
	0DuFrI/rjEy1ETutdNOp2mZfoeZIPoSxnKj4sDCnBGqgUevax13KKl51lxrL0KKy2xauDZ
	4EhnRoimIRHV7IDNAkGGRF9fdrfPiys=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754506684;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eFIL/GJhJxE4/DlZdH2oqa5UlxcXRNE6q0kcLrF7hLY=;
	b=KP24cZ4bLXzUwQ0dziZzUnhFRTxkwKnHuEnB/TTBuY2ekeoZoq+hO9BhkWb7OYfSVB5cSO
	zoQFiW5qNc53G8AA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EA2FC13ABE;
	Wed,  6 Aug 2025 18:58:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8tlKN7ulk2isUAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 06 Aug 2025 18:58:03 +0000
Date: Wed, 06 Aug 2025 20:58:03 +0200
Message-ID: <87ldnw1dms.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: Quiet crackling noise at boot and after stopping music
In-Reply-To: <d282d29d-c580-44d1-bef2-f425a744ef50@molgen.mpg.de>
References: <10172c80-daec-4e20-ab57-a483cf1afc02@molgen.mpg.de>
	<871pposvy9.wl-tiwai@suse.de>
	<d542d223-fc6e-4be7-b581-8a390ce2f6be@molgen.mpg.de>
	<87sei4rg67.wl-tiwai@suse.de>
	<b70db707-457d-4c0c-85be-19f4340dcc7b@molgen.mpg.de>
	<87h5ykqzod.wl-tiwai@suse.de>
	<d282d29d-c580-44d1-bef2-f425a744ef50@molgen.mpg.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-7
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 2A84020736
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -3.51

On Wed, 06 Aug 2025 18:12:20 +0200,
Paul Menzel wrote:
> 
> Dear Takashi,
> 
> 
> Thank you for your reply.
> 
> Am 06.08.25 um 16:42 schrieb Takashi Iwai:
> > On Wed, 06 Aug 2025 15:57:51 +0200, Paul Menzel wrote:
> 
> >> Am 06.08.25 um 10:46 schrieb Takashi Iwai:
> >>> On Wed, 06 Aug 2025 10:34:57 +0200, Paul Menzel wrote:
> >> 
> >>>> Am 06.08.25 um 10:20 schrieb Takashi Iwai:
> >>>>> On Wed, 06 Aug 2025 10:15:08 +0200, Paul Menzel wrote:
> >>>> 
> >>>>>> I believe the Realtek refactoring caused a regression on my Intel Kaby
> >>>>>> Lake laptop Dell XPS 13 9360. There is quiet crackling noise during
> >>>>>> boot, when GDM is started, and also after playing music is
> >>>>>> stopped. It¢s reproducible with 6.16.0-04055-g14bed9bc81ba, that
> >>>>>> contains the sound subsystem pull request.
> >>>>>> 
> >>>>>> 177bf8620cf4 Merge tag 'sound-6.17-rc1' of
> >>>>>> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound
> >>>>>> 
> >>>>>> I uploaded the run of alsa-info [1]. I try to verify with plain 6.16 later.
> >>>>> 
> >>>>> It's likely because of the missing CONFIG_SND_HDA_CODEC_* selections.
> >>>>> Please set CONFIG_SND_HDA_CODEC_ALC269=m and
> >>>> 
> >>>> Indeed, I didn¢t select this.
> >>>> 
> >>>>> CONFIG_SND_HDA_CODEC_HDMI_INTEL=m if not done yet.
> >>>> 
> >>>> I had selected this.
> >>>> 
> >>>>> Those were already set to default=y in the later PR for avoiding such
> >>>>> a pitfall.
> >>>> 
> >>>> I remember I tried to check which to select, and I ran `alsa-info` to
> >>>> find the codecs, but only found:
> >>>> 
> >>>>       Codec: Realtek ALC3246
> >>>> 
> >>>> As this didn¢t match to any of the offerings, I didn¢t select
> >>>> it. May I suggest to extend the Kconfig help texts with notes how to
> >>>> determine the correct module?
> >>> 
> >>> There are quite lots of different codec names, so we can't put all
> >>> them, unfortunately...
> >> 
> >> Understood. Then maybe just the command how to find the id, that
> >> people can use to grep the correct module for? From the script
> >> `alsa-info.sh`, maybe, I found:
> >> 
> >>      $ grep -e Codec -e "Vendor Id" /proc/asound/card*/codec#*
> >>      /proc/asound/card0/codec#0:Codec: Realtek ALC3246
> >>      /proc/asound/card0/codec#0:Vendor Id: 0x10ec0256
> >>      /proc/asound/card0/codec#2:Codec: Intel Kabylake HDMI
> >>      /proc/asound/card0/codec#2:Vendor Id: 0x8086280b
> >> 
> >> So mention `/proc/asound/card*/codec#*`?
> > 
> > Honestly speaking, I don't want that; it won't scale, and new codecs
> > may appear at any moment.  Then we'd have to manage multiple places
> > for adding or removing ids.
> 
> Sorry, I didn¢t mean to add the id¢s to the description, but something like:
> 
> You can check the vendor id in `/proc/asound/card*/codec#*`

Well, I'm afraid that it's still too cryptic to judge which driver to
be enabled.

> > Maybe an alternative option would be to mark prompt of each Realtek
> > codec driver with EXPERT, so that all Realtek drivers will be enabled
> > (when CONFIG_SND_HDA_CODEC_REALTEK is set) unless you say you're an
> > expert :)
> 
> At least I wouldn¢t have bothered you. ;-) My gut prefers, improving
> the documentation instead of hiding it, but you are the maintainer.
> 
>     $ ls -lh
> /lib/modules/6.16.0-11852-g479058002c32/kernel/sound/hda/codecs/realtek/
> insgesamt 464K
>     -rw-r--r-- 1 root root 300K  6. Aug 10:22 snd-hda-codec-alc269.ko
>     -rw-r--r-- 1 root root 164K  6. Aug 10:22 snd-hda-codec-realtek-lib.ko
> 
> The size is small compared to other drivers, but not nothing.

> 
> 
> Kind regards,
> 
> Paul
> 
> 
> PS: Despite just building in `CONFIG_SND_HDA_CODEC_ALC269=m`,
> 6.16.0-11852-g479058002c32 is 172 kB bigger:
> 
>     $ du -s /lib/modules/6.16.0/kernel/sound/
>     10992	/lib/modules/6.16.0/kernel/sound/
>     $ du -s /lib/modules/6.16.0-11852-g479058002c32/kernel/sound/
>     11164	/lib/modules/6.16.0-11852-g479058002c32/kernel/sound/

The previous kernels had all Realtek codecs enabled in a single
driver, so I believe it's safer to enable all again.
If you really care about the size, you have still choices (with
CONFIG_EXPERT=y).

Hans also agreed with this approach in this thread, so this looks like
the way to go, for avoiding further stray sheep after 6.17-rc1.

I'm going to submit a patch set.


thanks,

Takashi

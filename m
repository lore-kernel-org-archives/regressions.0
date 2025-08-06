Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E316D9463
	for <regressions@lists.linux.dev>; Wed,  6 Aug 2025 14:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754491366; cv=none; b=avNdlFWMJSSbXJtYRQnbWaxLzwR6LQXMxwxpCAEV7t2OULBYovBHZSiQhdSiH8Co9P2Kj7qIkNscXs+w7CtwV8UeLskL6j8hH+bAyjLg519dRtD+fJXHdRM6MkGq59eyUYwePlpI8COl3Lr+D3FRkTEqCCYVDO88RiyaUHS/c5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754491366; c=relaxed/simple;
	bh=Qo7BrP+QJs/7YtrmKiccrZTPEKx+rKpb3cAVy/j+VVI=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JKNlgk0H07YAIGDq91+nRnorw+bvFgtsDX9//Xjk8t5ZU2Vc3/SjB+ieahGDNQstg9Al6g1YOU0DzXcO5NH0f+QyQsbOkDAeO9NtAymzpeqcJTsmGjyTKNZqu/m4mDhdWMXTjsrwVwplmBtTIAczpMYSZLBZSJrbNbcaY9H4Kxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rMc8XSDT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=haxs/KOv; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=rMc8XSDT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=haxs/KOv; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rMc8XSDT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="haxs/KOv";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="rMc8XSDT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="haxs/KOv"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id F355322427;
	Wed,  6 Aug 2025 14:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754491363; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gqbG/YCR19NI2zT9wOkHk37JPhmFV0SG5jF/B9vj3yg=;
	b=rMc8XSDTCXgfPxF0cKVxOt8PCY94RxWdBIP72Tf5qRFCeyhrC3e4UtmdWGaZpV0dt5V4VV
	d4YmAjU1WO2vWzneDH1feW552T2KuuGQ4Mtora+8L32mJxt3MTm5o7k/UfX+1mF0uw/ITq
	p9cXq6Ln3yOIfXUuPUA63MLYNCh0ex4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754491363;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gqbG/YCR19NI2zT9wOkHk37JPhmFV0SG5jF/B9vj3yg=;
	b=haxs/KOveZd7cW/k3mtArGDM5I6rnxzUHXm9XcfKStioanMHqqv2khzcnEshYzjp2mmHAg
	/2h/Qgp8XSZDthBg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rMc8XSDT;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="haxs/KOv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1754491363; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gqbG/YCR19NI2zT9wOkHk37JPhmFV0SG5jF/B9vj3yg=;
	b=rMc8XSDTCXgfPxF0cKVxOt8PCY94RxWdBIP72Tf5qRFCeyhrC3e4UtmdWGaZpV0dt5V4VV
	d4YmAjU1WO2vWzneDH1feW552T2KuuGQ4Mtora+8L32mJxt3MTm5o7k/UfX+1mF0uw/ITq
	p9cXq6Ln3yOIfXUuPUA63MLYNCh0ex4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1754491363;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gqbG/YCR19NI2zT9wOkHk37JPhmFV0SG5jF/B9vj3yg=;
	b=haxs/KOveZd7cW/k3mtArGDM5I6rnxzUHXm9XcfKStioanMHqqv2khzcnEshYzjp2mmHAg
	/2h/Qgp8XSZDthBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D14CE13ABE;
	Wed,  6 Aug 2025 14:42:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Sc2GMuJpk2ivAwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 06 Aug 2025 14:42:42 +0000
Date: Wed, 06 Aug 2025 16:42:42 +0200
Message-ID: <87h5ykqzod.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: Quiet crackling noise at boot and after stopping music
In-Reply-To: <b70db707-457d-4c0c-85be-19f4340dcc7b@molgen.mpg.de>
References: <10172c80-daec-4e20-ab57-a483cf1afc02@molgen.mpg.de>
	<871pposvy9.wl-tiwai@suse.de>
	<d542d223-fc6e-4be7-b581-8a390ce2f6be@molgen.mpg.de>
	<87sei4rg67.wl-tiwai@suse.de>
	<b70db707-457d-4c0c-85be-19f4340dcc7b@molgen.mpg.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-7
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spam-Flag: NO
X-Rspamd-Queue-Id: F355322427
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,suse.de:mid];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Score: -3.51

On Wed, 06 Aug 2025 15:57:51 +0200,
Paul Menzel wrote:
> 
> Dear Takashi,
> 
> 
> Thank you for your reply.
> 
> Am 06.08.25 um 10:46 schrieb Takashi Iwai:
> > On Wed, 06 Aug 2025 10:34:57 +0200, Paul Menzel wrote:
> 
> >> Am 06.08.25 um 10:20 schrieb Takashi Iwai:
> >>> On Wed, 06 Aug 2025 10:15:08 +0200, Paul Menzel wrote:
> >> 
> >>>> I believe the Realtek refactoring caused a regression on my Intel Kaby
> >>>> Lake laptop Dell XPS 13 9360. There is quiet crackling noise during
> >>>> boot, when GDM is started, and also after playing music is
> >>>> stopped. It¢s reproducible with 6.16.0-04055-g14bed9bc81ba, that
> >>>> contains the sound subsystem pull request.
> >>>> 
> >>>> 177bf8620cf4 Merge tag 'sound-6.17-rc1' of
> >>>> git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound
> >>>> 
> >>>> I uploaded the run of alsa-info [1]. I try to verify with plain 6.16 later.
> >>> 
> >>> It's likely because of the missing CONFIG_SND_HDA_CODEC_* selections.
> >>> Please set CONFIG_SND_HDA_CODEC_ALC269=m and
> >> 
> >> Indeed, I didn¢t select this.
> >> 
> >>> CONFIG_SND_HDA_CODEC_HDMI_INTEL=m if not done yet.
> >> 
> >> I had selected this.
> >> 
> >>> Those were already set to default=y in the later PR for avoiding such
> >>> a pitfall.
> >> 
> >> I remember I tried to check which to select, and I ran `alsa-info` to
> >> find the codecs, but only found:
> >> 
> >>      Codec: Realtek ALC3246
> >> 
> >> As this didn¢t match to any of the offerings, I didn¢t select
> >> it. May I suggest to extend the Kconfig help texts with notes how to
> >> determine the correct module?
> > 
> > There are quite lots of different codec names, so we can't put all
> > them, unfortunately...
> 
> Understood. Then maybe just the command how to find the id, that
> people can use to grep the correct module for? From the script
> `alsa-info.sh`, maybe, I found:
> 
>     $ grep -e Codec -e "Vendor Id" /proc/asound/card*/codec#*
>     /proc/asound/card0/codec#0:Codec: Realtek ALC3246
>     /proc/asound/card0/codec#0:Vendor Id: 0x10ec0256
>     /proc/asound/card0/codec#2:Codec: Intel Kabylake HDMI
>     /proc/asound/card0/codec#2:Vendor Id: 0x8086280b
> 
> So mention `/proc/asound/card*/codec#*`?

Honestly speaking, I don't want that; it won't scale, and new codecs
may appear at any moment.  Then we'd have to manage multiple places
for adding or removing ids.

Maybe an alternative option would be to mark prompt of each Realtek
codec driver with EXPERT, so that all Realtek drivers will be enabled
(when CONFIG_SND_HDA_CODEC_REALTEK is set) unless you say you're an
expert :)


thanks,

Takashi

-- 8< --
--- a/sound/hda/codecs/realtek/Kconfig
+++ b/sound/hda/codecs/realtek/Kconfig
@@ -12,7 +12,7 @@ config SND_HDA_CODEC_REALTEK_LIB
 	select SND_HDA_SCODEC_COMPONENT
 
 config SND_HDA_CODEC_ALC260
-	tristate "Build Realtek ALC260 HD-audio codec support"
+	tristate "Build Realtek ALC260 HD-audio codec support" if EXPERT
 	depends on INPUT
 	select SND_HDA_CODEC_REALTEK_LIB
 	default y
@@ -20,7 +20,7 @@ config SND_HDA_CODEC_ALC260
 	  Say Y or M here to include Realtek ALC260 HD-audio codec support
 
 config SND_HDA_CODEC_ALC262
-	tristate "Build Realtek ALC262 HD-audio codec support"
+	tristate "Build Realtek ALC262 HD-audio codec support" if EXPERT
 	depends on INPUT
 	select SND_HDA_CODEC_REALTEK_LIB
 	default y
@@ -28,7 +28,7 @@ config SND_HDA_CODEC_ALC262
 	  Say Y or M here to include Realtek ALC262 HD-audio codec support
 
 config SND_HDA_CODEC_ALC268
-	tristate "Build Realtek ALC268 HD-audio codec support"
+	tristate "Build Realtek ALC268 HD-audio codec support" if EXPERT
 	depends on INPUT
 	select SND_HDA_CODEC_REALTEK_LIB
 	default y
@@ -37,7 +37,7 @@ config SND_HDA_CODEC_ALC268
 	  codec support
 
 config SND_HDA_CODEC_ALC269
-	tristate "Build Realtek ALC269 HD-audio codecs support"
+	tristate "Build Realtek ALC269 HD-audio codecs support" if EXPERT
 	depends on INPUT
 	select SND_HDA_CODEC_REALTEK_LIB
 	default y
@@ -46,7 +46,7 @@ config SND_HDA_CODEC_ALC269
 	  codec support
 
 config SND_HDA_CODEC_ALC662
-	tristate "Build Realtek ALC662 HD-audio codecs support"
+	tristate "Build Realtek ALC662 HD-audio codecs support" if EXPERT
 	depends on INPUT
 	select SND_HDA_CODEC_REALTEK_LIB
 	default y
@@ -55,7 +55,7 @@ config SND_HDA_CODEC_ALC662
 	  codec support
 
 config SND_HDA_CODEC_ALC680
-	tristate "Build Realtek ALC680 HD-audio codecs support"
+	tristate "Build Realtek ALC680 HD-audio codecs support" if EXPERT
 	depends on INPUT
 	select SND_HDA_CODEC_REALTEK_LIB
 	default y
@@ -63,7 +63,7 @@ config SND_HDA_CODEC_ALC680
 	  Say Y or M here to include Realtek ALC680 HD-audio codec support
 
 config SND_HDA_CODEC_ALC861
-	tristate "Build Realtek ALC861 HD-audio codecs support"
+	tristate "Build Realtek ALC861 HD-audio codecs support" if EXPERT
 	depends on INPUT
 	select SND_HDA_CODEC_REALTEK_LIB
 	default y
@@ -71,7 +71,7 @@ config SND_HDA_CODEC_ALC861
 	  Say Y or M here to include Realtek ALC861 HD-audio codec support
 
 config SND_HDA_CODEC_ALC861VD
-	tristate "Build Realtek ALC861-VD HD-audio codecs support"
+	tristate "Build Realtek ALC861-VD HD-audio codecs support" if EXPERT
 	depends on INPUT
 	select SND_HDA_CODEC_REALTEK_LIB
 	default y
@@ -79,7 +79,7 @@ config SND_HDA_CODEC_ALC861VD
 	  Say Y or M here to include Realtek ALC861-VD HD-audio codec support
 
 config SND_HDA_CODEC_ALC880
-	tristate "Build Realtek ALC880 HD-audio codecs support"
+	tristate "Build Realtek ALC880 HD-audio codecs support" if EXPERT
 	depends on INPUT
 	select SND_HDA_CODEC_REALTEK_LIB
 	default y
@@ -87,7 +87,7 @@ config SND_HDA_CODEC_ALC880
 	  Say Y or M here to include Realtek ALC880 HD-audio codec support
 
 config SND_HDA_CODEC_ALC882
-	tristate "Build Realtek ALC882 HD-audio codecs support"
+	tristate "Build Realtek ALC882 HD-audio codecs support" if EXPERT
 	depends on INPUT
 	select SND_HDA_CODEC_REALTEK_LIB
 	default y

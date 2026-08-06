Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7794477F6
	for <regressions@lists.linux.dev>; Thu,  6 Aug 2026 10:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786013692; cv=none; b=T06NGXsrlwExK/cQ+DJzDLoFb6zPcP+SR5i7CBZ6uFpT3DAfk73QLeje4VShIilln/vUKIHiYV0CF8fDcJc59Jk4CCYeWNPMXQSWxvyuVBrbzj4f1UzIxPDoofj2D2me1xyeLoVovOHWEpRY5TQLNz0d035FrJoMLzpZyXFoP50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786013692; c=relaxed/simple;
	bh=DuWF+LeBj9R0j0NgF53Yr2e1j85vKUpcyCQlWQlNoHQ=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pw0Wt9Ycy/QUZwNOjDNhBUS8O7x2lUi1PP35hkTauHLUlYXcSb/GHZTd/0RALgtZGHX0LWLE76kYp/KuinUxYTO2vayXY2BCVIO+IwciNszIafOIRo29u8riLfb48y1t+RBNBProPqKnV13shlbFJyG/M1ce9+LGUzXX9F+RS4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=pkN3XGra; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=RsMSIBd5; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=LTTUdXEO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=35EwDC56; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="pkN3XGra";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="RsMSIBd5";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="LTTUdXEO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="35EwDC56"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 4F2AA3DF3;
	Thu,  6 Aug 2026 10:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786013684; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/Z8RJHz7zcyhEkim49hNzMkM9Df0R/JnhsGWJbIW0lM=;
	b=pkN3XGrab4lFlEM9W00sLeuiKmqb9xNEoK5fqQqtkT6WThMH5KN1agEnnNMDl3Kkp/x0r8
	1VKzwvfPMuwmmGc4OPd3Jbf6lY4JFPhSjELWA5Ls74NKNpxxMkCyb4aaT3SdtuHbWMaof7
	nBHa3xMfc+NKqcBOHoSpleDNdCq+JZ0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786013684;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/Z8RJHz7zcyhEkim49hNzMkM9Df0R/JnhsGWJbIW0lM=;
	b=RsMSIBd5gdCcaiXpkDyMMY5GtCaZTNjylwXeu4gZg/A1Xfvf/mzDB+FfsP06d7Di37fM55
	OuzZxPYL8ODLNpDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1786013680; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/Z8RJHz7zcyhEkim49hNzMkM9Df0R/JnhsGWJbIW0lM=;
	b=LTTUdXEO4K01DfNFHL98+mCrSROqv6BH5JCH4Nq12RjyafJuiNNoJPfnQ3IqlqWeJNJKBP
	vAp3fnMVNjlX+YSMetaeUNI9tTxJVMOxB0mn3dHP23yp0fFuhu/BIV2kSvlV/sZIfgjdB+
	ub0saEhw+mm4C5q+8HJz45LG7HLjS8k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1786013680;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/Z8RJHz7zcyhEkim49hNzMkM9Df0R/JnhsGWJbIW0lM=;
	b=35EwDC56zDGUQyXSlgWwG+uYM5UOg1GQ4JrCk2h3vfUdEMI5HYr+yi5soD4jJmJomO0mOt
	PKYOW9cDP2Mf0BBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 20D19779B6;
	Thu,  6 Aug 2026 10:54:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id iUuFBvBndGpmAQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 06 Aug 2026 10:54:40 +0000
Date: Thu, 06 Aug 2026 12:54:39 +0200
Message-ID: <87ecgbecy8.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Gert Burger <gertburger@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] snd-usb-audio: SteelSeries Arctis Nova 5 mixer controls disabled as sticky
In-Reply-To: <CAEQ1D3ky_7+g6_1J7ymxGUq4DNrPyx8OCsQ8Z42j2-XncMW8ZQ@mail.gmail.com>
References: <CAEQ1D3kdA3mkQx7ei9Kq0gwky0qroJqCLKrkvgfkqgTbeu086A@mail.gmail.com>
	<871pcbg3wr.wl-tiwai@suse.de>
	<CAEQ1D3ky_7+g6_1J7ymxGUq4DNrPyx8OCsQ8Z42j2-XncMW8ZQ@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo,also-info.sh:url,archlinux.org:url]

On Thu, 06 Aug 2026 12:33:07 +0200,
Gert Burger wrote:
> 
> On Thu, 6 Aug 2026 at 07:27, Takashi Iwai <tiwai@suse.de> wrote:
> >
> > On Wed, 05 Aug 2026 17:41:27 +0200,
> > Gert Burger wrote:
> > >
> > >
> > > On archlinux, after I upgraded to kernel 7.1.5-arch1-2, the sound volume is
> > > significantly lower and seems to lack bass.
> > >
> > > Reported by someone else here:
> > > https://bbs.archlinux.org/viewtopic.php?id=314220
> > >
> > > Previous kernel was 7.0.14.arch1-1 (working)
> > >
> > > Attached is also-info.sh for 7.1.5-arch1-2 (broken) and 6.18.41-1-lts (as a
> > > workaround I installed an lts kernel, works)
> > >
> > > Device:
> > > Bus 005 Device 003: ID 1038:2232 SteelSeries ApS SteelSeries Arctis Nova 5
> > >
> > > Dmesg diff:
> > > Aug 05 16:22:19 framework kernel: usb 5-1.1: 9:0: sticky mixer values (-19712/
> > > 0/256 => 0), disabling
> > > Aug 05 16:22:19 framework kernel: usb 5-1.1: 10:0: sticky mixer values (-21248
> > > /0/256 => 0), disabling
> > >
> > > Can I need to provide anything else?
> >
> > Could you try 7.2 kernel?  I guess it's still broken, but then try to
> > pass the option "quirk_flags=1038:2232:mixer_get_cur_broken" to
> > snd-usb-audio module and retest?
> >
> 
> I tested with the `linux-mainline` package, currently on version 7.2rc5-1
> 
> # cat /etc/modprobe.d/snd-usb-audio.conf
> options snd-usb-audio quirk_flags=1038:2232:mixer_get_cur_broken
> 
> That seems to have "fixed" it.

Good to hear.  Could you try the patch below?  I'm going to submit it
in anyway, but it'd be appreciated if you can test it beforehand.


thanks,

Takashi

-- 8< --
From: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH] ALSA: usb-audio: Fix mixer regression on SteelSeries Arctis
 Nova 5

The recent "sticky mixer" sanity check in USB-audio driver caused a
regression on SteelSeries Arctis Nova 5 (1038:2232); because the
firmware doesn't handle GET_CUR requests, some mixers are effectively
disabled, leading to the too low / soft volumes:
  usb 5-1.1: 9:0: sticky mixer values (-19712/0/256 => 0), disabling
  usb 5-1.1: 10:0: sticky mixer values (-21248/0/256 => 0), disabling

Restore the functionality by ignoring GET_CUR errors intentionally
with MIXER_GET_CUR_BROKEN quirk.

Fixes: 86aa1ea1f15c ("ALSA: usb-audio: Do not expose sticky mixers")
Reported-by: Gert Burger <gertburger@gmail.com>
Closes: https://lore.kernel.org/CAEQ1D3kdA3mkQx7ei9Kq0gwky0qroJqCLKrkvgfkqgTbeu086A@mail.gmail.com
Link: https://bbs.archlinux.org/viewtopic.php?id=314220
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 3330eb604911..618baa80d2b7 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2363,6 +2363,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_SHARE_MEDIA_DEVICE | QUIRK_FLAG_ALIGN_TRANSFER),
 	DEVICE_FLG(0x1038, 0x1294, /* SteelSeries Arctis Pro Wireless */
 		   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
+	DEVICE_FLG(0x1038, 0x2232, /* SteelSeries Arctis Nova 5 */
+		   QUIRK_FLAG_MIXER_GET_CUR_BROKEN),
 	DEVICE_FLG(0x1101, 0x0003, /* Audioengine D1 */
 		   QUIRK_FLAG_GET_SAMPLE_RATE),
 	DEVICE_FLG(0x12d1, 0x3a07, /* HUAWEI USB-C HEADSET */
-- 
2.55.0


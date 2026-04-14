Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0640537F012
	for <regressions@lists.linux.dev>; Tue, 14 Apr 2026 07:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776152364; cv=none; b=JSCL6VtCfqsv0r4UawgY1Nxvn1apywh97cUcrlQiwtrgTozBoLgVy4iANcPn8qJUBdBUX/MZ2QJDpI2L1muN6d+++yBgdEB0Y/HhME12zY/3uS7srIazRG5c+AXcHQBAjBN8fK/ylhOHY+WaBUkFiO38SvNALspGfLuBknpaCDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776152364; c=relaxed/simple;
	bh=Phqu3L1/HN85hqvN3eUGD5gmiVPA+/Dn8by3E5VmwYM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A+8t0cnY44A7QA9DxPuQjK/1zV/kQTcDHzDV1UD4l0wWMFqLzwjT7TFl23CjXC9r1byGbnlyakqokPpIT5zcKG/vZRVklFxi4hbBLwyBLg2KA7h3enR9hoiVifq5YqPPwZfG4bp7WDJDnh8F6IYjeHOO3zaE8OXJk3BZ7db2o9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Bfizk5V8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dyGLo2u9; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Bfizk5V8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=dyGLo2u9; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Bfizk5V8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dyGLo2u9";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Bfizk5V8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="dyGLo2u9"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A69EA5BE89;
	Tue, 14 Apr 2026 07:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776152359; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pfjp5HyuVAG3h91INW6CzdnnplM5+baRl15tPaL/OqE=;
	b=Bfizk5V8yy7mlGN1bhzGOxi73/CC5jGZTzw/FhT5hgWJlHAtAAvQ5BM0NpfSOMuEeRisSp
	r697v4/kX8U0zfqymzJbQkdhRuvCF9/+NpTy5JvvqvkpRPBukcEbkTPRNMRvly3b77zEF4
	3j4yrtvi2rvVjeqYmiy0hb+Q2ALvMQY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776152359;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pfjp5HyuVAG3h91INW6CzdnnplM5+baRl15tPaL/OqE=;
	b=dyGLo2u9IxUJFzvnK7a6g1+KAZUJoWCQ2KauBTyLZluysZ4ybNuFdJmgaY1EoUiTxNBeEb
	Bk+Qiwg2cVumUlBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776152359; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pfjp5HyuVAG3h91INW6CzdnnplM5+baRl15tPaL/OqE=;
	b=Bfizk5V8yy7mlGN1bhzGOxi73/CC5jGZTzw/FhT5hgWJlHAtAAvQ5BM0NpfSOMuEeRisSp
	r697v4/kX8U0zfqymzJbQkdhRuvCF9/+NpTy5JvvqvkpRPBukcEbkTPRNMRvly3b77zEF4
	3j4yrtvi2rvVjeqYmiy0hb+Q2ALvMQY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776152359;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pfjp5HyuVAG3h91INW6CzdnnplM5+baRl15tPaL/OqE=;
	b=dyGLo2u9IxUJFzvnK7a6g1+KAZUJoWCQ2KauBTyLZluysZ4ybNuFdJmgaY1EoUiTxNBeEb
	Bk+Qiwg2cVumUlBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7D4554B317;
	Tue, 14 Apr 2026 07:39:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +Ck5HSfv3WnSXgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Apr 2026 07:39:19 +0000
Date: Tue, 14 Apr 2026 09:39:19 +0200
Message-ID: <871pgit2hk.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?J=E9r=E9my?= Bethmont <jeremy.bethmont@gmail.com>
Cc: Kailang <kailang@realtek.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"regressions@leemhuis.info" <regressions@leemhuis.info>
Subject: Re: [REGRESSION] Audio popping on ThinkPad X1 Carbon Gen 12 (ALC287) after commit d2e01e0c5e94
In-Reply-To: <CAC88DfvyuWeD99hhKKsHum+wpjjQrOKsdWvKVZMefjhcx3sKBw@mail.gmail.com>
References: <CAC88DfsHrhyhy0Pn1O-z9egBvMYu=6NYgcvcC6KCgwh_-Ldkxg@mail.gmail.com>
	<87a4wgrxil.wl-tiwai@suse.de>
	<CAC88DfvjQvZvdvGdZ00woMymE2tUWk=2Dbqi3EzuzSHxGjEnzw@mail.gmail.com>
	<871phsrsnf.wl-tiwai@suse.de>
	<f59a70ca796b4d09822f514e7f25ac5c@realtek.com>
	<CAC88DftEBEEEvODGUZzkry+kgAm=SfH=PAsxwu+SABMBMRMs=Q@mail.gmail.com>
	<658f53ada52f4de9a0c852dd56554a2a@realtek.com>
	<CAC88DfvyuWeD99hhKKsHum+wpjjQrOKsdWvKVZMefjhcx3sKBw@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,realtek.com:email,linux.dev:email,suse.de:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Score: -1.80
X-Spam-Level: 

On Tue, 14 Apr 2026 09:23:31 +0200,
Jérémy Bethmont wrote:
> 
> Hi Kailang, Takashi,
> 
> I can confirm that applying this patch completely resolves the issue!
> 
> I compiled and tested it on my ThinkPad X1 Carbon Gen 12 (ALC287)
> running kernel 6.19.11. The hardware popping noise upon PCM suspend is
> entirely gone.
> 
> Thank you both for your incredible work on this. You can add my
> Tested-by tag when this gets merged upstream:
> 
> Tested-by: Jeremy Bethmont <jeremy.bethmont@gmail.com>
> 
> Best regards,
> Jeremy

Good to hear!

Kailang, please submit a proper fix patch for merging.


thanks,

Takashi

> 
> On Tue, 14 Apr 2026 at 13:44, Kailang <kailang@realtek.com> wrote:
> >
> > Sorry!! Attached wrong file.
> > Attached again.
> >
> > -----Original Message-----
> > From: Jérémy Bethmont <jeremy.bethmont@gmail.com>
> > Sent: Tuesday, April 14, 2026 2:37 PM
> > To: Kailang <kailang@realtek.com>
> > Cc: Takashi Iwai <tiwai@suse.de>; alsa-devel@alsa-project.org; regressions@lists.linux.dev; regressions@leemhuis.info
> > Subject: Re: [REGRESSION] Audio popping on ThinkPad X1 Carbon Gen 12 (ALC287) after commit d2e01e0c5e94
> >
> >
> > External mail : This email originated from outside the organization. Do not reply, click links, or open attachments unless you recognize the sender and know the content is safe.
> >
> >
> >
> > Hi Kailang,
> >
> > Thank you for the patch. However, I believe you may have attached the wrong file by mistake.
> >
> > The attached patch ("0000-x1-gen12-speaker.patch") is dated November 12, 2024. Its commit message mentions fixing an issue with older BIOS versions.
> >
> > Could you please double-check?
> >
> > Best regards,
> > Jeremy
> >
> > On Mon, 13 Apr 2026 at 16:16, Kailang <kailang@realtek.com> wrote:
> > >
> > > Hi Jeremy,
> > >
> > > You can test attach patch.
> > >
> > > BR,
> > > Kailang
> > >
> > > -----Original Message-----
> > > From: Takashi Iwai <tiwai@suse.de>
> > > Sent: Tuesday, March 10, 2026 4:33 PM
> > > To: Jérémy Bethmont <jeremy.bethmont@gmail.com>
> > > Cc: Kailang <kailang@realtek.com>; alsa-devel@alsa-project.org;
> > > regressions@lists.linux.dev; regressions@leemhuis.info
> > > Subject: Re: [REGRESSION] Audio popping on ThinkPad X1 Carbon Gen 12
> > > (ALC287) after commit d2e01e0c5e94
> > >
> > >
> > > External mail : This email originated from outside the organization. Do not reply, click links, or open attachments unless you recognize the sender and know the content is safe.
> > >
> > >
> > >
> > > On Tue, 10 Mar 2026 09:24:38 +0100,
> > > Jérémy Bethmont wrote:
> > > >
> > > > Hi Takashi,
> > > >
> > > > Thank you for looking into this so quickly.
> > > >
> > > > As requested, I have attached the output of `alsa-info.sh
> > > > --no-upload` from my machine.
> > > >
> > > > Please let me know if you have a proposed patch you would like me to
> > > > test. I am happy to build it and verify if it resolves the popping
> > > > on my hardware.
> > >
> > > I guess dropping the alc_process_coef_fw(codec, en_coefs) call at closing would fix your problem while keeping the one at open.
> > > But I'm not sure about any side-effect by that.
> > > Kailang, could you check this?
> > >
> > > BTW, when you disable runtime PM, does the pop noise still appears?
> > >
> > >
> > > thanks,
> > >
> > > Takashi
> > >
> > > >
> > > > Best regards,
> > > > Jeremy
> > > >
> > > > On Tue, 10 Mar 2026 at 13:47, Takashi Iwai <tiwai@suse.de> wrote:
> > > > >
> > > > > On Tue, 10 Mar 2026 01:01:11 +0100, Jérémy Bethmont wrote:
> > > > > >
> > > > > > Hi Takashi, Kailang,
> > > > > >
> > > > > > I am reporting an audio regression introduced in kernel 6.18.13
> > > > > > on the Lenovo ThinkPad X1 Carbon Gen 12 (Meteor Lake, Realtek
> > > > > > ALC287 codec,
> > > > > > SSID: 0x17aa231e).
> > > > > >
> > > > > > Since this update, the laptop emits a short, noticeable hardware
> > > > > > pop/blip from the speakers exactly when an audio stream closes
> > > > > > and the PCM state suspends. It happens consistently a few
> > > > > > seconds after playback finishes (e.g., after a system
> > > > > > notification or terminal bell).
> > > > > >
> > > > > > I have tracked the regression down to the following commit:
> > > > > > d2e01e0c5e947da0b5005ca89efa82baeb232adc ("ALSA: hda/realtek -
> > > > > > fixed speaker no sound")
> > > > > >
> > > > > > #regzbot introduced: d2e01e0c5e947da0b5005ca89efa82baeb232adc
> > > > > >
> > > > > > Root cause analysis:
> > > > > > The commit modifies the `alc287_alc1318_playback_pcm_hook`
> > > > > > function, adding raw COEF writes to disable/enable AMP silence
> > > > > > detection on HDA_GEN_PCM_ACT_OPEN and HDA_GEN_PCM_ACT_CLOSE.
> > > > > >
> > > > > > Because `alc287_alc1318_playback_pcm_hook` is a shared hook used
> > > > > > by multiple Lenovo ALC287/ALC1318 devices, these unconditional
> > > > > > `WRITE_COEF` instructions are being sent to hardware that does
> > > > > > not need the silence detection fix. On the X1 Carbon Gen 12,
> > > > > > executing `alc_process_coef_fw(codec, en_coefs)` upon stream
> > > > > > close triggers an immediate electrical pop. Monitoring with
> > > > > > `pw-mon` confirms the hardware pop coincides perfectly with the
> > > > > > monitor_FR / monitor_FL ports going idle/suspended.
> > > > > >
> > > > > > Proposed solution:
> > > > > > Could we revert this commit, or alternatively, wrap these
> > > > > > specific silence-detection COEF writes in a targeted
> > > > > > `ALC287_FIXUP` quirk matched via SSID/DMI, rather than executing
> > > > > > them globally in the shared playback hook?
> > > > >
> > > > > Could you give alsa-info.sh output?  Run the script with
> > > > > --no-upload option and attach the output.
> > > > >
> > > > > I guess the bug might not be specific to your device but happening
> > > > > in general with all matching ones.  As a workaround for such a pop
> > > > > noise, we often need to reorder verbs or put some delay between verbs.
> > > > >
> > > > >
> > > > > Takashi
> > > >
> > > >
> > > >
> > > > --
> > > > Jérémy Bethmont
> > > >
> >
> >
> >
> > --
> > Jérémy Bethmont
> 
> 
> 
> -- 
> Jérémy Bethmont

Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC80A390C92
	for <regressions@lists.linux.dev>; Tue, 14 Apr 2026 08:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776154449; cv=none; b=patJ8HpOjbYjaqj7hPlqVGHK9TwFIrpFhrIGNa8AHOOirqI5lFMABBGLF/YawvLa9ZFEJGcAdrQUl0ae5wCPpWTb4i7KMw5MPMts6Qg6vEIAxESGfU/zmviGR+R4F0AOIH0nmTk4IMxeJn/Z3Jqbmsamri9/eezuqOsR0DtO/j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776154449; c=relaxed/simple;
	bh=xvxGk9uh0+SYaR79IYrMDUiZnd+4g/OXtzUcSjCUHkU=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IEOPW9NPw2EFXMNdzYIzFjQxRwyL1rq2Bssz29K/9Gug9ZrWM5znfW4m+RMk8bDWsIwnTI4jz+xG9DJzdb86siXzylHBbJcbgm9S88MNlTj+2m0aJEa7cGwA13giiR2XhaqdgHIL49OD8JGI/ZLMbi0hrpxxTQrPcVGcetMn7xI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XcImGSi8; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=m5IrsRiB; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FSUZJE4s; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=yWkkAlpX; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XcImGSi8";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="m5IrsRiB";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FSUZJE4s";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="yWkkAlpX"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D83046A99F;
	Tue, 14 Apr 2026 08:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776154447; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MpXDuTtlu9LQfLVP2POAAUdFL5T96rxRZdlEAhYEkG4=;
	b=XcImGSi8mMx0L73aWFBf7sX+hCVpmjZ0BJfhCgJjXG0R/fRtYmy3WfmBhYyCfQ2jCl5Ajm
	JFD4r5vbbFxJ7romruRjY4lpRGLhb8LA8EeTIQwAyJx+1HL5jdqwU1HsJHCBVg/LuZaKFI
	0ogMtntKQHk7UNfXkO5g+UQEPLllJtk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776154447;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MpXDuTtlu9LQfLVP2POAAUdFL5T96rxRZdlEAhYEkG4=;
	b=m5IrsRiBPlDe2A7TleprdIFW/qFlOJXz6P0bMOoacarWIVN660dnpDBAQhbELamPJUnqfD
	QRU5H8BYbQ8qczDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=FSUZJE4s;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=yWkkAlpX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1776154446; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MpXDuTtlu9LQfLVP2POAAUdFL5T96rxRZdlEAhYEkG4=;
	b=FSUZJE4sK4ixrm7ebSoDUVSd0i7TwxpU5vROyAhvl7102TnsnOlA2RXs3QRyt2IsJWoGy5
	0Eh4YZWA4oGjrwraseSXx6ae45moP4xKocqmeN+Pmx3UL9EBBptLmFqTEwYtRfdeQ7mJwT
	HFtdISih0SQtudOXoi1ytSn27ukNEjs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1776154446;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MpXDuTtlu9LQfLVP2POAAUdFL5T96rxRZdlEAhYEkG4=;
	b=yWkkAlpXBsQZcT6HVEJpvBjaCCvB784A8bTsu2bYY2dQTplUA/IRFvI+kuHvLd3riPYvSK
	ngDUH0sNBfvIAZBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A23254B344;
	Tue, 14 Apr 2026 08:14:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id i3tOJk733WkKBAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 14 Apr 2026 08:14:06 +0000
Date: Tue, 14 Apr 2026 10:14:06 +0200
Message-ID: <87wlyarmb5.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kailang <kailang@realtek.com>
Cc: =?ISO-8859-1?Q?J=E9r=E9my?= Bethmont <jeremy.bethmont@gmail.com>,
	"alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"regressions@leemhuis.info" <regressions@leemhuis.info>
Subject: Re: [REGRESSION] Audio popping on ThinkPad X1 Carbon Gen 12 (ALC287) after commit d2e01e0c5e94
In-Reply-To: <c0c7f6edb6e7417a9b51fc2308ec31e4@realtek.com>
References: <CAC88DfsHrhyhy0Pn1O-z9egBvMYu=6NYgcvcC6KCgwh_-Ldkxg@mail.gmail.com>
	<87a4wgrxil.wl-tiwai@suse.de>
	<CAC88DfvjQvZvdvGdZ00woMymE2tUWk=2Dbqi3EzuzSHxGjEnzw@mail.gmail.com>
	<871phsrsnf.wl-tiwai@suse.de>
	<f59a70ca796b4d09822f514e7f25ac5c@realtek.com>
	<CAC88DftEBEEEvODGUZzkry+kgAm=SfH=PAsxwu+SABMBMRMs=Q@mail.gmail.com>
	<658f53ada52f4de9a0c852dd56554a2a@realtek.com>
	<CAC88DfvyuWeD99hhKKsHum+wpjjQrOKsdWvKVZMefjhcx3sKBw@mail.gmail.com>
	<871pgit2hk.wl-tiwai@suse.de>
	<c0c7f6edb6e7417a9b51fc2308ec31e4@realtek.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-2.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,alsa-project.org,lists.linux.dev,leemhuis.info];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -2.01
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: D83046A99F

On Tue, 14 Apr 2026 09:57:00 +0200,
Kailang wrote:
> 
> OK.
> Attached.
> 
> Thanks.

Applied now.  Thanks.


Takashi

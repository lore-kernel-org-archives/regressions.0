Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988CC1D7E50
	for <regressions@lists.linux.dev>; Sat, 19 Oct 2024 08:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729325484; cv=none; b=ZaIoZn0fG/9ADkE73hXbsO+W7w+SL8Hh8V1fObwkhiVd92CD7Xa6FOjq/X4GEE8hA8BY61X4TFss+CAGS6g9tD17zWJ/t792iAYIhqrA+XZsFEPudyEIIfQZyVzC64JMWmSyxfUgla5QIlkwqCz8YUq7KZm1IdWI92J/MIC0VI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729325484; c=relaxed/simple;
	bh=8UaTpEhJ/rCVYu4A0emweyKxs/iGBdOE6nwoE22Y9jE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DrkD2S5vAWctiN034kTJk8Sw/iQHS9TLc20srBuS8ysBEeFJn+LC0IwCkLWUvnKOhqTdgyu4BYRo4Kydey+oCbKlGdMTBU1RcJeH5rjPXcTha4tWFUD8goho1Pl9p4Uo2NlKGPIIa97+uHS2vyYn2WGmv1vGljYje7kzpOOTU/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=z6CJ9pt7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Bfd8sMUK; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=z6CJ9pt7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Bfd8sMUK; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="z6CJ9pt7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Bfd8sMUK";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="z6CJ9pt7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Bfd8sMUK"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id AB7DF21188;
	Sat, 19 Oct 2024 08:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1729325480; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OcoP3O0dBDHJmfObICRJD4oUzvL81XtohfbJf8cTKhY=;
	b=z6CJ9pt7SQFpl9DHfgSZ2CbLJf+n6HrwVZCL+cGGEA8dSkIunn5A1omgOhGvsvbEeOALTr
	AcPWf96S1yy8Xats5qO2tz/e3XYj3dNsuzn9/pnRtp7RsyAAPEblDUauUTbNevr8PIOu0l
	RdsZK9525HczFLmzsCaFdkRUme1D2c0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729325480;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OcoP3O0dBDHJmfObICRJD4oUzvL81XtohfbJf8cTKhY=;
	b=Bfd8sMUKYtsArRbW87YeL4DPJIAbPI6eIdkds/WkXdFVt5TCw3aBh2LoWZaBODyd69z4Au
	ku7mgCjOmTzq5+Aw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1729325480; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OcoP3O0dBDHJmfObICRJD4oUzvL81XtohfbJf8cTKhY=;
	b=z6CJ9pt7SQFpl9DHfgSZ2CbLJf+n6HrwVZCL+cGGEA8dSkIunn5A1omgOhGvsvbEeOALTr
	AcPWf96S1yy8Xats5qO2tz/e3XYj3dNsuzn9/pnRtp7RsyAAPEblDUauUTbNevr8PIOu0l
	RdsZK9525HczFLmzsCaFdkRUme1D2c0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1729325480;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OcoP3O0dBDHJmfObICRJD4oUzvL81XtohfbJf8cTKhY=;
	b=Bfd8sMUKYtsArRbW87YeL4DPJIAbPI6eIdkds/WkXdFVt5TCw3aBh2LoWZaBODyd69z4Au
	ku7mgCjOmTzq5+Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 73F7913736;
	Sat, 19 Oct 2024 08:11:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id m3MXG6hpE2d/OwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 19 Oct 2024 08:11:20 +0000
Date: Sat, 19 Oct 2024 10:12:20 +0200
Message-ID: <87ttd8jyu3.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Dean Matthew Menezes <dean.menezes@utexas.edu>
Cc: Takashi Iwai <tiwai@suse.de>,
	stable@vger.kernel.org,
	regressions@lists.linux.dev,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Linux Sound System <linux-sound@vger.kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>
Subject: Re: No sound on speakers X1 Carbon Gen 12
In-Reply-To: <CAEkK70T7NBRA1dZHBwAC7mNeXPo-dby4c7Nn=SYg0vzeHHt-1A@mail.gmail.com>
References: <CAEkK70Tke7UxMEEKgRLMntSYeMqiv0PC8st72VYnBVQD-KcqVw@mail.gmail.com>
	<2024101613-giggling-ceremony-aae7@gregkh>
	<433b8579-e181-40e6-9eac-815d73993b23@leemhuis.info>
	<87bjzktncb.wl-tiwai@suse.de>
	<CAEkK70TAk26HFgrz4ZS0jz4T2Eu3LWcG-JD1Ov_2ffMp66oO-g@mail.gmail.com>
	<87cyjzrutw.wl-tiwai@suse.de>
	<CAEkK70T7NBRA1dZHBwAC7mNeXPo-dby4c7Nn=SYg0vzeHHt-1A@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.988];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid]
X-Spam-Score: -3.30
X-Spam-Flag: NO

On Sat, 19 Oct 2024 01:14:51 +0200,
Dean Matthew Menezes wrote:
> 
> I tried the patch on the Thinkpad X1 Carbon Gen 12 but it didn't work.
> There is still no sound from the speakers.

Please give again alsa-info.sh output with the patch.


Takashi

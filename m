Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7501715F324
	for <regressions@lists.linux.dev>; Wed, 24 Apr 2024 15:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713971257; cv=none; b=Z2Out4gCdLpR59u1fh0bIlZy0aoMYKzxEBRuwhg54KLJJOv7adMeZkiEbpJgtzmbNAobc42wZqIAYr5GFNN1DbK7gxxcTbP9MmlWfu50CwfYsUmac0A0ngKJVt65XkYa//IioVnmKjtJTgIZMle1kxXxVcimfAtZkENt2Qmf6To=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713971257; c=relaxed/simple;
	bh=3IBe9viglU7k+uyNy6dqsLwL+gYOYoFxevmRGlZRmRo=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kPwIhot1+q723iFwn8iX8NBQ1NrZIzHeB4AG7O8n4jqhGNWKUUw4BLlilkcF9jT84oq4ErM6ptNwuI0nZJF9+Uz4os5QoDu1CwzODShEG29e8Uj7JmwFFlhEnFHct9gAzky3Hd5mWRPXvwqN0hrbW2hOSf/fnqkL/RNEw4nHicU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aFOrYjsM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sk+50SbF; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=aFOrYjsM; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sk+50SbF; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aFOrYjsM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sk+50SbF";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="aFOrYjsM";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sk+50SbF"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 6924F3E865;
	Wed, 24 Apr 2024 15:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713971252; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UVmGUi++k1/gvTUhmFye/eKFdYCn8pI+jh7gUYNB/Ns=;
	b=aFOrYjsMmS6MXHZhNYOl1xDOAJrGCSeRuCVUURoee4NOstHX/Cpqj+dr9wh9Hx1x5C5Q57
	LLALQMyLrYgmR0rl02qyUiocaD2LD8PfLHadKKUTxpAkuPr9wConaSUvWFvKpwkW4AucxP
	xJvrBKD2/y7vL4OqTc0AP6kHOZZBAHA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713971252;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UVmGUi++k1/gvTUhmFye/eKFdYCn8pI+jh7gUYNB/Ns=;
	b=sk+50SbFZMfB5qAisiSYKnDj1s6M4TEB858wYNDisyt/lnXlXTkQ5CUmeraOcDh1aHnF+D
	g/t0TDfALkv0pEAA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=aFOrYjsM;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=sk+50SbF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1713971252; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UVmGUi++k1/gvTUhmFye/eKFdYCn8pI+jh7gUYNB/Ns=;
	b=aFOrYjsMmS6MXHZhNYOl1xDOAJrGCSeRuCVUURoee4NOstHX/Cpqj+dr9wh9Hx1x5C5Q57
	LLALQMyLrYgmR0rl02qyUiocaD2LD8PfLHadKKUTxpAkuPr9wConaSUvWFvKpwkW4AucxP
	xJvrBKD2/y7vL4OqTc0AP6kHOZZBAHA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1713971252;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UVmGUi++k1/gvTUhmFye/eKFdYCn8pI+jh7gUYNB/Ns=;
	b=sk+50SbFZMfB5qAisiSYKnDj1s6M4TEB858wYNDisyt/lnXlXTkQ5CUmeraOcDh1aHnF+D
	g/t0TDfALkv0pEAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4CE8C13690;
	Wed, 24 Apr 2024 15:07:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 03vIDjQgKWb6IQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 24 Apr 2024 15:07:32 +0000
Date: Wed, 24 Apr 2024 17:07:42 +0200
Message-ID: <877cgmdcjl.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Takashi Iwai <tiwai@suse.de>,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	Oliver Neukum <oneukum@suse.com>,
	USB list <linux-usb@vger.kernel.org>
Subject: Re: Regression due to 59cf44575456 ("USB: core: Fix oversight in SuperSpeed initialization")
In-Reply-To: <5744adbf-c6ab-454e-bcd7-33a7ca85bf7c@rowland.harvard.edu>
References: <9efbd569-7059-4575-983f-0ea30df41871@suse.com>
	<78eaec78-663a-428b-b80e-68c398a8f5f7@rowland.harvard.edu>
	<8a4a7f9e-a191-4301-93f8-9694aa14e42f@leemhuis.info>
	<673939a1-b07a-457e-9fa6-cf6166fdff03@rowland.harvard.edu>
	<8734rdjj4n.wl-tiwai@suse.de>
	<ea0b171b-7ee7-4141-b334-28f637fc6b03@rowland.harvard.edu>
	<87bk5zdtqs.wl-tiwai@suse.de>
	<bb7f94de-d520-4995-bb95-f3188be55f03@rowland.harvard.edu>
	<87a5lidemj.wl-tiwai@suse.de>
	<5744adbf-c6ab-454e-bcd7-33a7ca85bf7c@rowland.harvard.edu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.com:url]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 6924F3E865
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Wed, 24 Apr 2024 16:56:53 +0200,
Alan Stern wrote:
> 
> On Wed, Apr 24, 2024 at 04:22:44PM +0200, Takashi Iwai wrote:
> > On Wed, 24 Apr 2024 16:14:23 +0200,
> > Alan Stern wrote:
> > > 
> > > On Wed, Apr 24, 2024 at 10:56:11AM +0200, Takashi Iwai wrote:
> > > > On Tue, 23 Apr 2024 21:29:27 +0200,
> > > > Alan Stern wrote:
> > > > > 
> > > > > On Mon, Apr 22, 2024 at 09:24:24PM +0200, Takashi Iwai wrote:
> > > > > > As posted in another mail, it's a virtualized environment.
> > > > > > Details are found in the original bug report
> > > > > >   https://bugzilla.suse.com/show_bug.cgi?id=1220569
> > > > > 
> > > > > Hmmm.  If this is a virtualized device, isn't the best solution to fix the 
> > > > > emulation code for the device so that it presents a valid descriptor?
> > > > 
> > > > Honestly speaking, I don't know, but it smells like a hard way.  After
> > > > all, we brought some regression of the previously (even casually /
> > > > unintended) working "device"...
> > > 
> > > Still, it would be good to report the incorrect descriptor to the package's 
> > > maintainer.
> > 
> > Well, it's no Linux package.
> 
> Doesn't matter.  Bugs should always be reported when possible, for any kind 
> of package.  Especially after you spent so much time and effort to track 
> this one down.
> 
> The fact that xz isn't specifically a Windows package didn't prevent Andres 
> Freund from reporting the recent backdoor problem.

Yeah, sure.  Any people can report to https://bhyve.npulse.net/


Takashi

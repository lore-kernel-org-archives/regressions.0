Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495D03FE51
	for <regressions@lists.linux.dev>; Tue, 30 Apr 2024 08:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714464143; cv=none; b=IUdsuM9Yz2Ees87bUNcb+E/Kcp6ekcrSamNF4bdty39X/eVDndEUTIMn9ChEiwGre5AkWSY/mweqrOjOm53iAA2JoHRH7RU8UI27RB0w1jMjb03NSEN8+2wt3qFsQDdKJx6zCvhrQ7jNDHEQvEQbrWHi/Zs/6gq6xe+IJrcKEHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714464143; c=relaxed/simple;
	bh=XDrn8xmM812iCP1CNJVNBq78ipMALgghSjaAsznLNAk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NCMOa15Pq9hEgEI6jbNyfDuhM0PLREog403wjpRX2KhSuNbj1AThTcQ71l58i+DrNeXMmG0mjkuJLpsS2rSIhHY4iLbSxlx8J6NeJHpnoG0ux4zNrAe2p7q6ErxCNh06O7i1Cid8YFei66G0FbZC0AILTsuz/Y7foHGOdSRO4xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FuGKRzBE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7YIGc2bw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=FuGKRzBE; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7YIGc2bw; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FuGKRzBE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7YIGc2bw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="FuGKRzBE";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7YIGc2bw"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 03AAE33E9A;
	Tue, 30 Apr 2024 08:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714464133; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dQwVLLoeZgmqMZ/4tQXUVtWmuRvIh0Kg1dRv++cza+4=;
	b=FuGKRzBEL8wOCtyjYLNW6gK1VQgrAdlM6d1y5JpJTlzTAZGy9DZ3ULF5i6yINH3EJeRG22
	av8EvbXMdNC7oxsgByOaY26Ux2X2IMO6KC0uxt9YrIchbxO/17ZJj+h/6VpiSlU48YzlzY
	2buvnWhJsM4LdXSPEFoUQr6FKSe3DMc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714464133;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dQwVLLoeZgmqMZ/4tQXUVtWmuRvIh0Kg1dRv++cza+4=;
	b=7YIGc2bwra3oCSYIw3PbXMv+7N7aVxDt56DOaNZ/nFNHvAeVeLmexfitvK+/uEd8vQDed9
	pLK94360S38ebdDg==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=FuGKRzBE;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=7YIGc2bw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714464133; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dQwVLLoeZgmqMZ/4tQXUVtWmuRvIh0Kg1dRv++cza+4=;
	b=FuGKRzBEL8wOCtyjYLNW6gK1VQgrAdlM6d1y5JpJTlzTAZGy9DZ3ULF5i6yINH3EJeRG22
	av8EvbXMdNC7oxsgByOaY26Ux2X2IMO6KC0uxt9YrIchbxO/17ZJj+h/6VpiSlU48YzlzY
	2buvnWhJsM4LdXSPEFoUQr6FKSe3DMc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714464133;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dQwVLLoeZgmqMZ/4tQXUVtWmuRvIh0Kg1dRv++cza+4=;
	b=7YIGc2bwra3oCSYIw3PbXMv+7N7aVxDt56DOaNZ/nFNHvAeVeLmexfitvK+/uEd8vQDed9
	pLK94360S38ebdDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D0FFE138A7;
	Tue, 30 Apr 2024 08:02:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id XsLMMYSlMGbbPwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 30 Apr 2024 08:02:12 +0000
Date: Tue, 30 Apr 2024 10:02:25 +0200
Message-ID: <878r0vnur2.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Takashi Iwai <tiwai@suse.de>,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	Oliver Neukum <oneukum@suse.com>,
	USB list <linux-usb@vger.kernel.org>
Subject: Re: Regression due to 59cf44575456 ("USB: core: Fix oversight in SuperSpeed initialization")
In-Reply-To: <c6989828-975e-430c-9334-06b895d646b7@rowland.harvard.edu>
References: <9efbd569-7059-4575-983f-0ea30df41871@suse.com>
	<78eaec78-663a-428b-b80e-68c398a8f5f7@rowland.harvard.edu>
	<8a4a7f9e-a191-4301-93f8-9694aa14e42f@leemhuis.info>
	<673939a1-b07a-457e-9fa6-cf6166fdff03@rowland.harvard.edu>
	<8734rdjj4n.wl-tiwai@suse.de>
	<ea0b171b-7ee7-4141-b334-28f637fc6b03@rowland.harvard.edu>
	<87bk5zdtqs.wl-tiwai@suse.de>
	<8734r53ond.wl-tiwai@suse.de>
	<c6989828-975e-430c-9334-06b895d646b7@rowland.harvard.edu>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -5.51
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 03AAE33E9A
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-5.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	DWL_DNSWL_MED(-2.00)[suse.de:dkim];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:url,suse.com:email,suse.de:dkim,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TO_DN_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]

On Mon, 29 Apr 2024 15:28:59 +0200,
Alan Stern wrote:
> 
> On Sun, Apr 28, 2024 at 09:57:42AM +0200, Takashi Iwai wrote:
> > On Wed, 24 Apr 2024 10:56:11 +0200,
> > Takashi Iwai wrote:
> > > 
> > > On Tue, 23 Apr 2024 21:29:27 +0200,
> > > Alan Stern wrote:
> > > > 
> > > > On Mon, Apr 22, 2024 at 09:24:24PM +0200, Takashi Iwai wrote:
> > > > > On Mon, 22 Apr 2024 20:03:46 +0200,
> > > > > Alan Stern wrote:
> > > > > About the patch change: I appreciate if you cook it rather by
> > > > > yourself since I'm not 100% sure what you suggested.  I can
> > > > > provide the reporter a test kernel with the patch for confirmation, of
> > > > > course.
> > > > 
> > > > Here's a condensed version of the patch you wrote.  But I would prefer not 
> > > > to add this to the kernel if the problem can be fixed somewhere else.
> > > 
> > > Thanks, I asked the report for testing the patch now.
> > 
> > The reporter confirmed that it's still working.
> 
> Can you get a Reported-and-Tested-by: from the reporter?

Yes, I got it from bugzilla entry, please put

  Reported-and-tested-by: Roger Whittaker <roger.whittaker@suse.com>
  Link: https://bugzilla.suse.com/show_bug.cgi?id=1220569


Thanks!

Takashi

Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3882EED0
	for <regressions@lists.linux.dev>; Sun, 28 Apr 2024 07:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714291061; cv=none; b=iyNOG0yPQWymnIkQXJZQyjRYy5iJWDw5sNQysMsLiY+ktXLKCwosG3Qsun9LPxdIUkKRJz56qArNok7iZ37zbOYoL3TnA28kvTFgCPjb0VKlFVGgveDsV5NmNf4LrD65YMBH/VVJWTbnRFmiN2Hcaw9T02GJNTJViTLrIwX5kZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714291061; c=relaxed/simple;
	bh=/SZdXvU0/zNh9eDyGFV7bjeIs8jRXFatuixRfW5OSPM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o3QxvTM+v+J9FfDy4xgeJWPm5kUaKU0huAJZh40Um8MeNiecZ53I8bnBDvkpcednlyQNUjFxrT7E4d93Two5CSAe9ZQ7LNp89uJxejM73YJ1opxUv1WCPIbpTiOMzivQyowEXYlNifPol8pu50pgUHrHzVqRG/SqkTzalRSqsEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Tuha+pGt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uLdKuL2J; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Tuha+pGt; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=uLdKuL2J; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Tuha+pGt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uLdKuL2J";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Tuha+pGt";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="uLdKuL2J"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id A0EB6383E2;
	Sun, 28 Apr 2024 07:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714291051; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g7HiDJn2jYaKPNKCjP6hACnCuBIIoIfNAijGiXXE0pI=;
	b=Tuha+pGtWY5VvJpFimhcq4dl2UfXLlzbV7RToWdM48wzW55d8dkEaFrUTtLVM6Ho9EIfYX
	1AqB2yDVsztGlVV+cRedIFQSwfNfzebLCPIhOvej1ufkiCEq8m4ZgUuAfe2WiRVa4CAMF1
	T03M6y22QvTrWbwJT8nict4jpd0cCcQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714291051;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g7HiDJn2jYaKPNKCjP6hACnCuBIIoIfNAijGiXXE0pI=;
	b=uLdKuL2JRL4urMLbYqLlJaSdvkJGTctYN7cCOVdyyXvUatkPd5f/RWwZDspp1PBtqohmYl
	tvL82VbjVLciksCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1714291051; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g7HiDJn2jYaKPNKCjP6hACnCuBIIoIfNAijGiXXE0pI=;
	b=Tuha+pGtWY5VvJpFimhcq4dl2UfXLlzbV7RToWdM48wzW55d8dkEaFrUTtLVM6Ho9EIfYX
	1AqB2yDVsztGlVV+cRedIFQSwfNfzebLCPIhOvej1ufkiCEq8m4ZgUuAfe2WiRVa4CAMF1
	T03M6y22QvTrWbwJT8nict4jpd0cCcQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1714291051;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=g7HiDJn2jYaKPNKCjP6hACnCuBIIoIfNAijGiXXE0pI=;
	b=uLdKuL2JRL4urMLbYqLlJaSdvkJGTctYN7cCOVdyyXvUatkPd5f/RWwZDspp1PBtqohmYl
	tvL82VbjVLciksCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 77733138A7;
	Sun, 28 Apr 2024 07:57:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id npmeG2sBLmbJLAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sun, 28 Apr 2024 07:57:31 +0000
Date: Sun, 28 Apr 2024 09:57:42 +0200
Message-ID: <8734r53ond.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
	Oliver Neukum <oneukum@suse.com>,
	USB list <linux-usb@vger.kernel.org>
Subject: Re: Regression due to 59cf44575456 ("USB: core: Fix oversight in SuperSpeed initialization")
In-Reply-To: <87bk5zdtqs.wl-tiwai@suse.de>
References: <9efbd569-7059-4575-983f-0ea30df41871@suse.com>
	<78eaec78-663a-428b-b80e-68c398a8f5f7@rowland.harvard.edu>
	<8a4a7f9e-a191-4301-93f8-9694aa14e42f@leemhuis.info>
	<673939a1-b07a-457e-9fa6-cf6166fdff03@rowland.harvard.edu>
	<8734rdjj4n.wl-tiwai@suse.de>
	<ea0b171b-7ee7-4141-b334-28f637fc6b03@rowland.harvard.edu>
	<87bk5zdtqs.wl-tiwai@suse.de>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]

On Wed, 24 Apr 2024 10:56:11 +0200,
Takashi Iwai wrote:
> 
> On Tue, 23 Apr 2024 21:29:27 +0200,
> Alan Stern wrote:
> > 
> > On Mon, Apr 22, 2024 at 09:24:24PM +0200, Takashi Iwai wrote:
> > > On Mon, 22 Apr 2024 20:03:46 +0200,
> > > Alan Stern wrote:
> > > About the patch change: I appreciate if you cook it rather by
> > > yourself since I'm not 100% sure what you suggested.  I can
> > > provide the reporter a test kernel with the patch for confirmation, of
> > > course.
> > 
> > Here's a condensed version of the patch you wrote.  But I would prefer not 
> > to add this to the kernel if the problem can be fixed somewhere else.
> 
> Thanks, I asked the report for testing the patch now.

The reporter confirmed that it's still working.


thanks,

Takashi

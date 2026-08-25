Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7DFA4766B9
	for <regressions@lists.linux.dev>; Tue, 25 Aug 2026 13:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787664385; cv=none; b=HylUss8uwdRs4lh3OpnhuMDrbGm7QMO4XjtJQ/+/fZfk1txQOhsd0QfDwAWXubFiDV6bYEKgqI04XgBZCAQIJi/m9XvZBBSLHku1Nb3kKYnCEdugH7GzhEFnnUfF0ZhCxRz7vpaPxWC06azrEQaCqPeO9GeVvBXLVIuxw7puUBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787664385; c=relaxed/simple;
	bh=R9ShE2Wqvgk6oDkNNuGpnAibYtT+/V2jvm6TKCA6oeU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lyDz2j48L1EFgcjo7QwIfdFQmcN9O4xM+VSmIVdPOl8VL3mE3r37DnmoyT1T5DGT4dYIA5Qf28iTcBV+Z0kDhFAvgORVdS7s9VrOWT8WAUCWSfEJl4OmCkt+0a19YJBB47uDiWx/VObmJq3y0iAEdxAgMwo2cWgy1RP6EFnhw9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=YKR0YTbz; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=AHOFlJVl; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=fdds8UZv; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=Co1ycpH7; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="YKR0YTbz";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="AHOFlJVl";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="fdds8UZv";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="Co1ycpH7"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 77C7586F08;
	Tue, 25 Aug 2026 13:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1787664371;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R9ShE2Wqvgk6oDkNNuGpnAibYtT+/V2jvm6TKCA6oeU=;
	b=YKR0YTbznUXrZbcuwMg8iW4YhzNRPHRJqXPWI/uzs/NjRYgCO/+FYVjDiXah8+HN5G3m+O
	57aVjwHVtFvPpsRPCjRjZb4mk8dQ+ZJP8hklFpZHa4jrDALgAiRyJ63Sskkq960cQ/DQJE
	Cgx2hd+TKimvHN/VyLh1SP6pPACkjmM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1787664371;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R9ShE2Wqvgk6oDkNNuGpnAibYtT+/V2jvm6TKCA6oeU=;
	b=AHOFlJVlnMAm+Ma+Xhup6CMunsTuru6HCFKjoGeaa1KLXhaFXE2b2gHyn8Dr8h+6/amgUO
	TIMl+L15UCRCZLBA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1787664367;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R9ShE2Wqvgk6oDkNNuGpnAibYtT+/V2jvm6TKCA6oeU=;
	b=fdds8UZv25NG7J79RO/l47KFenC1wmFWvZn3IRCIrVpHKlQ8Lym9sqbOLWiLD8ynGbn9fZ
	vmuz/31E95JZPOyhccw4SyKeFzeB7wE1+VsVqMpn4Ipwp3Saz+QjdisG5VvyFZlJqHb5MJ
	hUHNVIrUXd3sl1LsVtzKHOEYOmZYT2Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1787664367;
	h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
	 cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=R9ShE2Wqvgk6oDkNNuGpnAibYtT+/V2jvm6TKCA6oeU=;
	b=Co1ycpH72ymHf9ygel8WdK/efcqujG2xWPdiT/mS9+NJEA9J/GO5iZPLm89S3/feZ+IOwz
	nR5/ebwd9xWCNTCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E8DCA13332;
	Tue, 25 Aug 2026 13:26:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id nIvoM+2XjWoaNgAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Tue, 25 Aug 2026 13:26:05 +0000
Date: Tue, 25 Aug 2026 15:26:04 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Cc: Jan Polensky <japo@linux.ibm.com>, ltp@lists.linux.it,
	Namjae Jeon <linkinjeon@kernel.org>, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Andrea Cervesato <andrea.cervesato@suse.com>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Yuezhang Mo <yuezhang.mo@sony.com>, Christoph Hellwig <hch@lst.de>,
	"Darrick J . Wong" <djwong@kernel.org>
Subject: Re: [LTP] [PATCH v1 1/1] swap: Add exfat to filesystems requiring
 tst_fill_file
Message-ID: <20260825132604.GA70046@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <ajQFErzQW4qfU_Cp@li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com>
 <6a463902.41a38e5f.27f5bd.337a@mx.google.com>
 <akzN_iISxNTztbEw@li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com>
 <20260825112755.GA62429@pevik>
 <ao2TtyQpCGP5TLpx@yuki.lan>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ao2TtyQpCGP5TLpx@yuki.lan>
X-Spam-Score: -7.50
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-7.50 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	HAS_REPLYTO(0.30)[pvorel@suse.cz];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,suse.cz:replyto,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]

Hi all,

[ Cc kernel folks and LKML ]

> Hi!
> > Reviewed-by: Petr Vorel <pvorel@suse.cz>

> > And yeah, we need it in kernel 7.2 on any distro :).

... and on any arch, e.g. x86_64 (not just s390x as Jan previously reported [1])

> > Should we somehow mention relevant kernel commit at least in the commit message?

> > e.g.: Change needed since 03a43677ca91 ("exfat: add swap_activate support") from
> > v7.2-rc1.

> That does not make much sense, if swap_activate was added to kernel,
> pre-filling the fallocated file shouldn't be needed anymore.

Good catch, you're right. I'm also confused, before v7.2 swap worked on exfat,
now even with 82a81a7352bc ("exfat: add iomap buffered I/O support") [2]
and your fix 03a43677ca91 ("exfat: add swap_activate support") [3] is not
working. Obviously the fix was not good enough.

Kind regards,
Petr

[1] https://lore.kernel.org/ltp/akzN_iISxNTztbEw@li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=82a81a7352bcf5f2756ac33d47ee0582737e9a85
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=03a43677ca91e3997355a13b1da6e47329b025e1

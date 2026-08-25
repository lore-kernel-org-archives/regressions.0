Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65ED048122F
	for <regressions@lists.linux.dev>; Tue, 25 Aug 2026 13:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787665572; cv=none; b=btXzra3WNsuhnfL5jmTxvvkgTIZIFMZzCwVRUM3PkvHTnYfu2p0s+S9mAkhjIKlavr3ZO6fZ1R0mbE0MimKGFTDsVgDhdeybgIt1H5zDPYkkYTg+E0pIxf5VCMPSJYzBQu86JbQpkNqkHkiqQP7geb6lvq6/GG/GlPZvNho8CSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787665572; c=relaxed/simple;
	bh=qdaWGEY7qvw3FtBwsxuB8Di78tLtPlxp0XDQaudLxKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYvchMnnAlNPRFYG0AtMTi3yh6m7eM1Z7RkkoJjBEoiBcF6Jz02vvlRERXMvLqj57BDPWlWoz23AuEj1sL7F9sjbBZhl92KmLUPGagOVpfHi2OICSxJuvA0z0I17P6A9Q+aClpNKi9Lfg2+l+lPiRjyeHXHDDLJvo6cMwsmM5pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 754331F7E5;
	Tue, 25 Aug 2026 13:46:09 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 52EBF13335;
	Tue, 25 Aug 2026 13:46:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3AJEEaGcjWqOSgAAD6G6ig
	(envelope-from <chrubis@suse.cz>); Tue, 25 Aug 2026 13:46:09 +0000
Date: Tue, 25 Aug 2026 15:46:15 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Cc: Jan Polensky <japo@linux.ibm.com>, ltp@lists.linux.it,
	Namjae Jeon <linkinjeon@kernel.org>, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Andrea Cervesato <andrea.cervesato@suse.com>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Yuezhang Mo <yuezhang.mo@sony.com>, Christoph Hellwig <hch@lst.de>,
	"Darrick J . Wong" <djwong@kernel.org>
Subject: Re: [LTP] [PATCH v1 1/1] swap: Add exfat to filesystems requiring
 tst_fill_file
Message-ID: <ao2cpyGYcL-rZLgc@yuki.lan>
References: <ajQFErzQW4qfU_Cp@li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com>
 <6a463902.41a38e5f.27f5bd.337a@mx.google.com>
 <akzN_iISxNTztbEw@li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com>
 <20260825112755.GA62429@pevik>
 <ao2TtyQpCGP5TLpx@yuki.lan>
 <20260825132604.GA70046@pevik>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825132604.GA70046@pevik>
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 754331F7E5
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

Hi!
> > That does not make much sense, if swap_activate was added to kernel,
> > pre-filling the fallocated file shouldn't be needed anymore.
> 
> Good catch, you're right. I'm also confused, before v7.2 swap worked on exfat,
> now even with 82a81a7352bc ("exfat: add iomap buffered I/O support") [2]
> and your fix 03a43677ca91 ("exfat: add swap_activate support") [3] is not
> working. Obviously the fix was not good enough.

There were two bugs I suppose, one is that fallocate() support for exfat broke
the swapon on fallocated file. The second bug was introduced later when
exfat was rewritten to use iomap. The iomap case was fixed in the patch
above, however it looks like the original bug caused by fallocate()
implementation for exfat is still there.

-- 
Cyril Hrubis
chrubis@suse.cz

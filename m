Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647C54BE451
	for <regressions@lists.linux.dev>; Thu, 24 Sep 2026 17:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790272491; cv=none; b=U/1l8KjrgW0W+5bIp/zCUpvyUgbmzZV0X5dzuCdZKGMJvPiClFirIk4t0vnCEHaPpmRfmwN4cNSkaywzxliy711yStYtHTcoDCptG5004FtNKqy+1qLZV5NJkZaugUDUjNOX3053lEhmNuREAdPKCnD1S76rNPh74V7gF1344FE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790272491; c=relaxed/simple;
	bh=On5trQxYqLHz4vL9a6iUZ7FuX1bD1hV3Zo8dZDzRgSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WiV1P/GwzozJiw4zdZe0yEFTxUZV8SJiJDVjf6+bbMrfLAA3nx50cCwEySyhpJpZpZsJbW5gxUUi+ry3GNd4xay5TpjJHCyoLaskW/m16dxTrUilBFQevQEiV1+eoI8es2LNUlp2l+Zrr6KM/KdCbc4wxc+Tl5/M6lfbwPmS+OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=1dabzC96; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=5V+Xm0Lm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Zmc8otqh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=vaGP2Q23; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="1dabzC96";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="5V+Xm0Lm";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Zmc8otqh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="vaGP2Q23"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2C7CA200DD;
	Thu, 24 Sep 2026 17:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790272484; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sPoUMczHVknhsJ12DVLSqidzCMjk30NE8xDC/mrh66A=;
	b=1dabzC96kiSPOb63TTR6AAp1dpdu7gunvuVBRLLT2fpTucld5nJctSSp+DME5uod//vvqJ
	B9pHXrCHS+1/qVpO0YN/QxuLzmVpGp0l7Hzq8kz/XsAk5VnpDi6dauTGMvDeLI9iwiR8Oo
	HfZFxDIBeh6QjfN+3zxY+11lkrFthas=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790272484;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sPoUMczHVknhsJ12DVLSqidzCMjk30NE8xDC/mrh66A=;
	b=5V+Xm0LmlqvboqghMvAbW68fmUrJPPnoxXkXBT824xC1P1mtYRMYrN6UmTnTf4RTFvw0z1
	P4nriVTBHg+1rwBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=Zmc8otqh;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=vaGP2Q23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790272480; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sPoUMczHVknhsJ12DVLSqidzCMjk30NE8xDC/mrh66A=;
	b=Zmc8otqhfK23cSsnuGcgYqZ2cbJGbbvydGGnX4+fHtcLbTP7EoF7vmVFOV7M5GS/kJXnDf
	Fc1incyjRSDfPxQrNa66YDOdPRHfiYvl6UtsZJocmjC+vtsgCvYn/cDjNxs+r9eb4Wpub5
	mmtatN8s2LT5TNdC+4IgMw9ie1ijGVw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790272480;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sPoUMczHVknhsJ12DVLSqidzCMjk30NE8xDC/mrh66A=;
	b=vaGP2Q23vAtxEh2j4xsiSqIYkKc6px4rHblnOzMDrUNhseJE5faein5S8mcXPQqbdFhLOU
	adfZcT3GgZGeRKCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 12C2E13354;
	Thu, 24 Sep 2026 17:54:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5LwkNd5jtWq1YgAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Thu, 24 Sep 2026 17:54:39 +0000
Date: Thu, 24 Sep 2026 18:54:37 +0100
From: Pedro Falcato <pfalcato@suse.de>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Mike Rapoport <rppt@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Toshi Kani <toshi.kani@hpe.com>, linux-mm@kvack.org, 
	regressions@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] x86/mm: Drop the page allocation from
 pud_free_pmd_page()
Message-ID: <arVjbTpD45MiXM6B@pedro-suse.tail5790ac.ts.net>
References: <20260923223116.20090-1-mikhail.v.gavrilov@gmail.com>
 <arVV9WLXQOwR8Hy8@pedro-suse.tail5790ac.ts.net>
 <d8b502f7-a552-4600-b348-614d1d62afa5@intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8b502f7-a552-4600-b348-614d1d62afa5@intel.com>
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 2C7CA200DD
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linux.intel.com,kernel.org,infradead.org,redhat.com,alien8.de,zytor.com,hpe.com,kvack.org,lists.linux.dev,vger.kernel.org];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received,2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.de:dkim,pedro-suse.tail5790ac.ts.net:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.01

On Thu, Sep 24, 2026 at 10:21:03AM -0700, Dave Hansen wrote:
> OK, I've got a version of Mikhail's fix with a changelog and comments
> I've munged a bit:
> 
> > https://git.kernel.org/pub/scm/linux/kernel/git/daveh/devel.git/log/?h=pmdfree
> 
> Does that look OK to everyone?


LGTM. This is where we find out if we have a solid understanding of x86
paging caching guarantees :)

-- 
Pedro

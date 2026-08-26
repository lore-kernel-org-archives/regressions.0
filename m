Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B9715E8B
	for <regressions@lists.linux.dev>; Wed, 26 Aug 2026 07:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787730085; cv=none; b=qncWCccwnvlHtnWfey4p1S85ltCkvDW3Ky3xNFSAi8/0JfWiYgDgpk5RggMXFot2KoK8cFTipxRbTz5Q+6B1aF3JIEgUjsUMgOvmnUF8Ugs/ts+5nS0zD4JTYG9ISk2wdaUEan5c7k8Fp3nP5RYBi2w8aQl/1mshKeX/2Fp0CNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787730085; c=relaxed/simple;
	bh=lUg+v3pVExMvPWlNVA6ydnUMAXs3XmsQJXaVLsrsWgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FGjS2Lk9XOwUMA4OMdVx90Ey1SIm4E/lIbJJlNokuwOqzq3UiqBkffy1Xd+szXE0b9Rp9TL0AFEg02DkIw1oGw24JHhiSeT+oU73TPQyReEhA9Cj6x7OevEg8gxUgT2IcuioXPfqla9jozIk/f8Mi7rhu6QFXB2RfhVvoNJDZLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EE6CE1F80F;
	Wed, 26 Aug 2026 07:41:21 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 48D1513533;
	Wed, 26 Aug 2026 07:41:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id k8EhC6CYjmoqAwAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Wed, 26 Aug 2026 07:41:20 +0000
Date: Wed, 26 Aug 2026 09:41:14 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Cyril Hrubis <chrubis@suse.cz>, Jan Polensky <japo@linux.ibm.com>,
	ltp@lists.linux.it, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Andrea Cervesato <andrea.cervesato@suse.com>,
	Sungjong Seo <sj1557.seo@samsung.com>,
	Yuezhang Mo <yuezhang.mo@sony.com>, Christoph Hellwig <hch@lst.de>,
	"Darrick J . Wong" <djwong@kernel.org>
Subject: Re: [LTP] [PATCH v1 1/1] swap: Add exfat to filesystems requiring
 tst_fill_file
Message-ID: <20260826074114.GA32334@pevik>
Reply-To: Petr Vorel <pvorel@suse.cz>
References: <ajQFErzQW4qfU_Cp@li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com>
 <6a463902.41a38e5f.27f5bd.337a@mx.google.com>
 <akzN_iISxNTztbEw@li-276bd24c-2dcc-11b2-a85c-945b6f05615c.ibm.com>
 <20260825112755.GA62429@pevik>
 <ao2TtyQpCGP5TLpx@yuki.lan>
 <20260825132604.GA70046@pevik>
 <ao2cpyGYcL-rZLgc@yuki.lan>
 <CAKYAXd_3Za8Jzan9VV4WrK1ATB2WXTazLVuGJ5ViQ8RGp0xbLw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKYAXd_3Za8Jzan9VV4WrK1ATB2WXTazLVuGJ5ViQ8RGp0xbLw@mail.gmail.com>
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: EE6CE1F80F
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action

Hi Namjae,

> On Tue, Aug 25, 2026 at 10:46 PM Cyril Hrubis <chrubis@suse.cz> wrote:

> > Hi!
> Hi Cyril, Petr,
> > > > That does not make much sense, if swap_activate was added to kernel,
> > > > pre-filling the fallocated file shouldn't be needed anymore.

> > > Good catch, you're right. I'm also confused, before v7.2 swap worked on exfat,
> > > now even with 82a81a7352bc ("exfat: add iomap buffered I/O support") [2]
> > > and your fix 03a43677ca91 ("exfat: add swap_activate support") [3] is not
> > > working. Obviously the fix was not good enough.

> > There were two bugs I suppose, one is that fallocate() support for exfat broke
> > the swapon on fallocated file. The second bug was introduced later when
> > exfat was rewritten to use iomap. The iomap case was fixed in the patch
> > above, however it looks like the original bug caused by fallocate()
> > implementation for exfat is still there.
> Can you check if an attached patch improves this issue?
> Thanks.

LGTM.

Tested-by: Petr Vorel <pvorel@suse.cz>

Tested on rapido-linux with:
CONFIG_EXFAT_FS=y
CONFIG_EXFAT_DEFAULT_IOCHARSET="utf8"

Hopefully Jan will test it as well, built as module.

Kind regards,
Petr

> From 5679a624816454c8e7683842eb0ab3f1adf0dcca Mon Sep 17 00:00:00 2001
> From: Namjae Jeon <linkinjeon@kernel.org>
> Date: Wed, 26 Aug 2026 09:14:14 +0900
> Subject: [PATCH] exfat: map allocated extents for swap activation

> exFAT reports allocated ranges beyond valid_size as IOMAP_HOLE when
> IOMAP_REPORT is set. iomap_swapfile_activate() also uses IOMAP_REPORT
> while collecting physical extents for a swap file, so it treats the
> preallocated tail as unallocated and rejects the file with -EINVAL.

> Use swap-specific iomap operations that suppress IOMAP_REPORT before
> mapping the file. This reports physically allocated ranges as
> IOMAP_UNWRITTEN during swap activation without changing the
> byte-accurate SEEK_HOLE and SEEK_DATA behavior of the regular iomap
> operations.

> Fixes: 03a43677ca91 ("exfat: add swap_activate support")
> Signed-off-by: Namjae Jeon <linkinjeon@kernel.org>
> ---
>  fs/exfat/iomap.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)

> diff --git a/fs/exfat/iomap.c b/fs/exfat/iomap.c
> index 0c805bf6676a..bf8baf78a9b8 100644
> --- a/fs/exfat/iomap.c
> +++ b/fs/exfat/iomap.c
> @@ -155,6 +155,22 @@ const struct iomap_ops exfat_iomap_ops = {
>  	.iomap_begin = exfat_iomap_begin,
>  };

> +static int exfat_swap_iomap_begin(struct inode *inode, loff_t offset,
> +		loff_t length, unsigned int flags, struct iomap *iomap,
> +		struct iomap *srcmap)
> +{
> +	/*
> +	 * Swap activation needs the physical mappings of preallocated
> +	 * ranges. Do not report the VDL tail as a hole.
> +	 */
> +	return __exfat_iomap_begin(inode, offset, length,
> +			flags & ~IOMAP_REPORT, iomap, false);
> +}
> +
> +static const struct iomap_ops exfat_swap_iomap_ops = {
> +	.iomap_begin = exfat_swap_iomap_begin,
> +};
> +
>  /*
>   * exfat_write_iomap_end - Update the state after write
>   *
> @@ -274,5 +290,6 @@ const struct iomap_read_ops exfat_iomap_bio_read_ops = {
>  int exfat_iomap_swap_activate(struct swap_info_struct *sis,
>  			       struct file *file, sector_t *span)
>  {
> -	return iomap_swapfile_activate(sis, file, span, &exfat_iomap_ops);
> +	return iomap_swapfile_activate(sis, file, span,
> +				       &exfat_swap_iomap_ops);
>  }

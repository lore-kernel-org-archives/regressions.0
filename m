Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB2529CA
	for <regressions@lists.linux.dev>; Wed,  9 Jun 2021 04:50:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 069C261287;
	Wed,  9 Jun 2021 04:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1623214214;
	bh=G6QDDNn3+r21im4Pl2kiSv1GcKtQ+/5AqTQSbVrmM0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2EUG65o6C3VdlBkFse68F37GLtREPT60SPu0V0Fxt0TzuNQumQlVVZDgOU6hLwRy/
	 /kKOe7ffd4YfOEve5Qm7Pe2I/bc0b9iqIqdsmjdOS7FpnFyhu1kC9g5vmqoj9+tjaq
	 3MJIe2MZJ4fwpnaswxsw1/nzpyCOj7Kyv502nJNI=
Date: Wed, 9 Jun 2021 06:50:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: stable@vger.kernel.org, "Michael S.Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	virtualization@lists.linux-foundation.org,
	regressions@lists.linux.dev, Eric Dumazet <edumazet@google.com>,
	Corentin =?iso-8859-1?Q?No=EBl?= <corentin.noel@collabora.com>
Subject: Re: virtio-net: kernel panic in virtio_net.c
Message-ID: <YMBIghQaTelAvXOY@kroah.com>
References: <YL9f9uFoPGj2Q9Zl@kroah.com>
 <1623203313.4303577-1-xuanzhuo@linux.alibaba.com>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1623203313.4303577-1-xuanzhuo@linux.alibaba.com>

On Wed, Jun 09, 2021 at 09:48:33AM +0800, Xuan Zhuo wrote:
> > > With this patch and the latest net branch I no longer get crashes.
> >
> > Did this ever get properly submitted to the networking tree to get into
> > 5.13-final?
> 
> The patch has been submitted.
> 
> 	[PATCH net] virtio-net: fix for skb_over_panic inside big mode

Submitted where?  Do you have a lore.kernel.org link somewhere?

thanks,

greg k-h

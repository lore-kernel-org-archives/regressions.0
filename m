Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9ED02C81
	for <regressions@lists.linux.dev>; Thu,  7 Oct 2021 15:25:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1772E61090;
	Thu,  7 Oct 2021 15:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1633620304;
	bh=UGCRCYvmUhVObljPNJkwbU4BVXrBTDvuEF6Qpw5Rwzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JyIeCAiD13IiEXJ/WGJ79vL26uWDf4g9nPjfMIb9PSLkoJH4ghj9+ZybkXcMzo5/u
	 ah42NGp9Ty+/NFvUApFOU/oSjxpZ4FnKHa/oAj7pYYAWvItLv5aZK02H8b5hPuPPO8
	 E6GbZXf6rYpSE/DkGJRihAWwbX9eADnbMy74XBUc=
Date: Thu, 7 Oct 2021 17:25:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: Corentin =?iso-8859-1?Q?No=EBl?= <corentin.noel@collabora.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	virtualization@lists.linux-foundation.org,
	regressions@lists.linux.dev, Eric Dumazet <edumazet@google.com>,
	stable@vger.kernel.org
Subject: Re: virtio-net: kernel panic in virtio_net.c
Message-ID: <YV8RTqGSTuVLMFOP@kroah.com>
References: <5edaa2b7c2fe4abd0347b8454b2ac032b6694e2c.camel@collabora.com>
 <1633619172.5342586-1-xuanzhuo@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1633619172.5342586-1-xuanzhuo@linux.alibaba.com>

On Thu, Oct 07, 2021 at 11:06:12PM +0800, Xuan Zhuo wrote:
> On Thu, 07 Oct 2021 14:04:22 +0200, Corentin Noël <corentin.noel@collabora.com> wrote:
> > I've been experiencing crashes with 5.14-rc1 and above that do not
> > occur with 5.13,
> 
> I should have fixed this problem before. I don't know why, I just looked at the
> latest net code, and this commit seems to be lost.
> 
>      1a8024239dacf53fcf39c0f07fbf2712af22864f virtio-net: fix for skb_over_panic inside big mode
> 
> Can you test this patch again?

That commit showed up in 5.13-rc5, so 5.14-rc1 and 5.13 should have had
it in it, right?

thanks,

greg k-h

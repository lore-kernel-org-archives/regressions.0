Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317662C88
	for <regressions@lists.linux.dev>; Fri,  8 Oct 2021 08:07:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 421E16103C;
	Fri,  8 Oct 2021 08:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1633680419;
	bh=kGwVpcF3zNihtrnLcERvX+ksKyNuVpUrUUXYJeskBBI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kbN+xLK01FyhYXntRsjNk0Lc0PeHB8E7rIeffLJwg55YhmntjMsMrtsKXe47417QT
	 lRetSuu6gjBSLFIaf1qIvPNx75DaYggOI4ukaKt45ejDKjZU0pTKRTTm8g1omiPAM5
	 UEu+QjF2IDfBH/B7YAUNM4lJKjwgBUCbAlcPP4r8=
Date: Fri, 8 Oct 2021 10:06:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: Corentin =?iso-8859-1?Q?No=EBl?= <corentin.noel@collabora.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	virtualization@lists.linux-foundation.org,
	regressions@lists.linux.dev, Eric Dumazet <edumazet@google.com>,
	stable@vger.kernel.org
Subject: Re: virtio-net: kernel panic in virtio_net.c
Message-ID: <YV/8Ia1d9zXvMqqc@kroah.com>
References: <YV8RTqGSTuVLMFOP@kroah.com>
 <1633623446.6192446-1-xuanzhuo@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1633623446.6192446-1-xuanzhuo@linux.alibaba.com>

On Fri, Oct 08, 2021 at 12:17:26AM +0800, Xuan Zhuo wrote:
> On Thu, 7 Oct 2021 17:25:02 +0200, Greg KH <gregkh@linuxfoundation.org> wrote:
> > On Thu, Oct 07, 2021 at 11:06:12PM +0800, Xuan Zhuo wrote:
> > > On Thu, 07 Oct 2021 14:04:22 +0200, Corentin Noël <corentin.noel@collabora.com> wrote:
> > > > I've been experiencing crashes with 5.14-rc1 and above that do not
> > > > occur with 5.13,
> > >
> > > I should have fixed this problem before. I don't know why, I just looked at the
> > > latest net code, and this commit seems to be lost.
> > >
> > >      1a8024239dacf53fcf39c0f07fbf2712af22864f virtio-net: fix for skb_over_panic inside big mode
> > >
> > > Can you test this patch again?
> >
> > That commit showed up in 5.13-rc5, so 5.14-rc1 and 5.13 should have had
> > it in it, right?
> >
> 
> Yes, it may be lost due to conflicts during a certain merge.

Really?  I tried to apply that again to 5.14 and it did not work.  So I
do not understand what to do here, can you try to explain it better?

thanks,

greg k-h

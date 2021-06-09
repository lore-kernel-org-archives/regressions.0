Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com [47.88.44.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D0070
	for <regressions@lists.linux.dev>; Wed,  9 Jun 2021 07:54:27 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R571e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0UbqxYUt_1623225245;
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com fp:SMTPD_---0UbqxYUt_1623225245)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 09 Jun 2021 15:54:05 +0800
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <1623225080.4793522-1-xuanzhuo@linux.alibaba.com>
Subject: Re: virtio-net: kernel panic in virtio_net.c
Date: Wed, 09 Jun 2021 15:51:20 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, Michael S.Tsirkin <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, virtualization@lists.linux-foundation.org,
 regressions@lists.linux.dev, Eric Dumazet <edumazet@google.com>,
 =?utf-8?q?Corentin_No=C3=ABl?= <corentin.noel@collabora.com>
In-Reply-To: <YMBelFMOAhEqWoc+@kroah.com>

On Wed, 9 Jun 2021 08:24:20 +0200, Greg KH <gregkh@linuxfoundation.org> wrote:
> On Wed, Jun 09, 2021 at 02:08:17PM +0800, Xuan Zhuo wrote:
> > On Wed, 9 Jun 2021 06:50:10 +0200, Greg KH <gregkh@linuxfoundation.org> wrote:
> > > On Wed, Jun 09, 2021 at 09:48:33AM +0800, Xuan Zhuo wrote:
> > > > > > With this patch and the latest net branch I no longer get crashes.
> > > > >
> > > > > Did this ever get properly submitted to the networking tree to get into
> > > > > 5.13-final?
> > > >
> > > > The patch has been submitted.
> > > >
> > > > 	[PATCH net] virtio-net: fix for skb_over_panic inside big mode
> > >
> > > Submitted where?  Do you have a lore.kernel.org link somewhere?
> >
> >
> > https://lore.kernel.org/netdev/20210603170901.66504-1-xuanzhuo@linux.alibaba.com/
>
> So this is commit 1a8024239dac ("virtio-net: fix for skb_over_panic
> inside big mode") in Linus's tree, right?

YES.

>
> But why is that referencing:
> 	Fixes: fb32856b16ad ("virtio-net: page_to_skb() use build_skb when there's sufficient tailroom")

This problem was indeed introduced in fb32856b16ad.

I confirmed that this commit fb32856b16ad was first entered in 5.13-rc1, and the
previous 5.12 did not have this commit fb32856b16ad.

I'm not sure if it helped you.

Thanks.

>
> when this problem was seen in stable kernels that had a different commit
> backported to it?
>
> Is there nothing needed to be done for the stable kernel trees?
>
> confused,
>
> greg k-h

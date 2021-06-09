Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com [47.88.44.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6097529CA
	for <regressions@lists.linux.dev>; Wed,  9 Jun 2021 06:10:19 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0Ubq9dUW_1623219002;
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com fp:SMTPD_---0Ubq9dUW_1623219002)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 09 Jun 2021 14:10:02 +0800
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <1623218897.4150124-1-xuanzhuo@linux.alibaba.com>
Subject: Re: virtio-net: kernel panic in virtio_net.c
Date: Wed, 09 Jun 2021 14:08:17 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, Michael S.Tsirkin <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, virtualization@lists.linux-foundation.org,
 regressions@lists.linux.dev, Eric Dumazet <edumazet@google.com>,
 =?utf-8?q?Corentin_No=C3=ABl?= <corentin.noel@collabora.com>
In-Reply-To: <YMBIghQaTelAvXOY@kroah.com>

On Wed, 9 Jun 2021 06:50:10 +0200, Greg KH <gregkh@linuxfoundation.org> wrote:
> On Wed, Jun 09, 2021 at 09:48:33AM +0800, Xuan Zhuo wrote:
> > > > With this patch and the latest net branch I no longer get crashes.
> > >
> > > Did this ever get properly submitted to the networking tree to get into
> > > 5.13-final?
> >
> > The patch has been submitted.
> >
> > 	[PATCH net] virtio-net: fix for skb_over_panic inside big mode
>
> Submitted where?  Do you have a lore.kernel.org link somewhere?


https://lore.kernel.org/netdev/20210603170901.66504-1-xuanzhuo@linux.alibaba.com/

Thanks.

>
> thanks,
>
> greg k-h

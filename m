Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com [47.88.44.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70B470
	for <regressions@lists.linux.dev>; Wed,  9 Jun 2021 08:11:43 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04420;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0Ubr.OIO_1623226283;
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com fp:SMTPD_---0Ubr.OIO_1623226283)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 09 Jun 2021 16:11:23 +0800
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <1623226112.296442-2-xuanzhuo@linux.alibaba.com>
Subject: Re: virtio-net: kernel panic in virtio_net.c
Date: Wed, 09 Jun 2021 16:08:32 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, Michael S.Tsirkin <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, virtualization@lists.linux-foundation.org,
 regressions@lists.linux.dev, Eric Dumazet <edumazet@google.com>,
 =?utf-8?q?Corentin_No=C3=ABl?= <corentin.noel@collabora.com>
In-Reply-To: <YMB16VOrQXq5oagz@kroah.com>

On Wed, 9 Jun 2021 10:03:53 +0200, Greg KH <gregkh@linuxfoundation.org> wro=
te:
> On Wed, Jun 09, 2021 at 03:51:20PM +0800, Xuan Zhuo wrote:
> > On Wed, 9 Jun 2021 08:24:20 +0200, Greg KH <gregkh@linuxfoundation.org>=
 wrote:
> > > On Wed, Jun 09, 2021 at 02:08:17PM +0800, Xuan Zhuo wrote:
> > > > On Wed, 9 Jun 2021 06:50:10 +0200, Greg KH <gregkh@linuxfoundation.=
org> wrote:
> > > > > On Wed, Jun 09, 2021 at 09:48:33AM +0800, Xuan Zhuo wrote:
> > > > > > > > With this patch and the latest net branch I no longer get c=
rashes.
> > > > > > >
> > > > > > > Did this ever get properly submitted to the networking tree t=
o get into
> > > > > > > 5.13-final?
> > > > > >
> > > > > > The patch has been submitted.
> > > > > >
> > > > > > 	[PATCH net] virtio-net: fix for skb_over_panic inside big mode
> > > > >
> > > > > Submitted where?  Do you have a lore.kernel.org link somewhere?
> > > >
> > > >
> > > > https://lore.kernel.org/netdev/20210603170901.66504-1-xuanzhuo@linu=
x.alibaba.com/
> > >
> > > So this is commit 1a8024239dac ("virtio-net: fix for skb_over_panic
> > > inside big mode") in Linus's tree, right?
> >
> > YES.
> >
> > >
> > > But why is that referencing:
> > > 	Fixes: fb32856b16ad ("virtio-net: page_to_skb() use build_skb when t=
here's sufficient tailroom")
> >
> > This problem was indeed introduced in fb32856b16ad.
> >
> > I confirmed that this commit fb32856b16ad was first entered in 5.13-rc1=
, and the
> > previous 5.12 did not have this commit fb32856b16ad.
> >
> > I'm not sure if it helped you.
>
> Hm, then what resolves the reported problem that people were having with
> the 5.12.y kernel release?  Is that a separate issue?

Has anyone reported a problem with 5.12.y? I don=E2=80=99t seem to see it. =
Corentin
only reported a problem with 5.13? Did I miss something?

I confirm that 5.12.9 has no modification of fb32856b16ad.

Thanks.

>
> thanks,
>
> greg k-h

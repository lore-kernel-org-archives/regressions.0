Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com [47.88.44.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363F52C81
	for <regressions@lists.linux.dev>; Thu,  7 Oct 2021 16:18:27 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0Uqr86Q-_1633623496;
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com fp:SMTPD_---0Uqr86Q-_1633623496)
          by smtp.aliyun-inc.com(127.0.0.1);
          Fri, 08 Oct 2021 00:18:16 +0800
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
message-id: <1633623446.6192446-1-xuanzhuo@linux.alibaba.com>
subject: Re: virtio-net: kernel panic in virtio_net.c
date: Fri, 08 Oct 2021 00:17:26 +0800
from: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
to: Greg KH <gregkh@linuxfoundation.org>
cc: =?utf-8?q?Corentin_No=C3=ABl?= <corentin.noel@collabora.com>,
 Michael S. Tsirkin <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 virtualization@lists.linux-foundation.org, regressions@lists.linux.dev,
 Eric Dumazet <edumazet@google.com>, stable@vger.kernel.org
in-reply-to: <YV8RTqGSTuVLMFOP@kroah.com>

On Thu, 7 Oct 2021 17:25:02 +0200, Greg KH <gregkh@linuxfoundation.org> wro=
te:
> On Thu, Oct 07, 2021 at 11:06:12PM +0800, Xuan Zhuo wrote:
> > On Thu, 07 Oct 2021 14:04:22 +0200, Corentin No=C3=ABl <corentin.noel@c=
ollabora.com> wrote:
> > > I've been experiencing crashes with 5.14-rc1 and above that do not
> > > occur with 5.13,
> >
> > I should have fixed this problem before. I don't know why, I just looke=
d at the
> > latest net code, and this commit seems to be lost.
> >
> >      1a8024239dacf53fcf39c0f07fbf2712af22864f virtio-net: fix for skb_o=
ver_panic inside big mode
> >
> > Can you test this patch again?
>
> That commit showed up in 5.13-rc5, so 5.14-rc1 and 5.13 should have had
> it in it, right?
>

Yes, it may be lost due to conflicts during a certain merge.

Thanks.

> thanks,
>
> greg k-h

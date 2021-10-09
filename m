Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com [47.88.44.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86092C80
	for <regressions@lists.linux.dev>; Sat,  9 Oct 2021 09:40:12 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R891e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04394;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0Ur5h2r1_1633772400;
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com fp:SMTPD_---0Ur5h2r1_1633772400)
          by smtp.aliyun-inc.com(127.0.0.1);
          Sat, 09 Oct 2021 17:40:01 +0800
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
message-id: <1633771866.6350079-2-xuanzhuo@linux.alibaba.com>
subject: Re: virtio-net: kernel panic in virtio_net.c
date: Sat, 09 Oct 2021 17:31:06 +0800
from: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
to: Greg KH <gregkh@linuxfoundation.org>
cc: =?utf-8?q?Corentin_No=C3=ABl?= <corentin.noel@collabora.com>,
 Michael S. Tsirkin <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 virtualization@lists.linux-foundation.org, regressions@lists.linux.dev,
 Eric Dumazet <edumazet@google.com>, stable@vger.kernel.org
in-reply-to: <YWEma6YvB2HN9/E/@kroah.com>

On Sat, 9 Oct 2021 07:19:39 +0200, Greg KH <gregkh@linuxfoundation.org> wro=
te:
> On Sat, Oct 09, 2021 at 12:27:08AM +0800, Xuan Zhuo wrote:
> > On Fri, 8 Oct 2021 10:06:57 +0200, Greg KH <gregkh@linuxfoundation.org>=
 wrote:
> > > On Fri, Oct 08, 2021 at 12:17:26AM +0800, Xuan Zhuo wrote:
> > > > On Thu, 7 Oct 2021 17:25:02 +0200, Greg KH <gregkh@linuxfoundation.=
org> wrote:
> > > > > On Thu, Oct 07, 2021 at 11:06:12PM +0800, Xuan Zhuo wrote:
> > > > > > On Thu, 07 Oct 2021 14:04:22 +0200, Corentin No=C3=ABl <corenti=
n.noel@collabora.com> wrote:
> > > > > > > I've been experiencing crashes with 5.14-rc1 and above that d=
o not
> > > > > > > occur with 5.13,
> > > > > >
> > > > > > I should have fixed this problem before. I don't know why, I ju=
st looked at the
> > > > > > latest net code, and this commit seems to be lost.
> > > > > >
> > > > > >      1a8024239dacf53fcf39c0f07fbf2712af22864f virtio-net: fix f=
or skb_over_panic inside big mode
> > > > > >
> > > > > > Can you test this patch again?
> > > > >
> > > > > That commit showed up in 5.13-rc5, so 5.14-rc1 and 5.13 should ha=
ve had
> > > > > it in it, right?
> > > > >
> > > >
> > > > Yes, it may be lost due to conflicts during a certain merge.
> > >
> > > Really?  I tried to apply that again to 5.14 and it did not work.  So=
 I
> > > do not understand what to do here, can you try to explain it better?
> >
> > I took a look, and there is actually another missing patch:
> >
> > A. 8fb7da9e990793299c89ed7a4281c235bfdd31f8 virtio_net: get build_skb()=
 buf by data ptr
> > B. 1a8024239dacf53fcf39c0f07fbf2712af22864f virtio-net: fix for skb_ove=
r_panic inside big mode
> >
> > A is replaced by another patch:
> >
> > 	commit c32325b8fdf2f979befb9fd5587918c0d5412db3
> > 	Author: Jakub Kicinski <kuba@kernel.org>
> > 	Date:   Mon Aug 2 10:57:29 2021 -0700
> >
> > 	    virtio-net: realign page_to_skb() after merges
> >
> > 	    We ended up merging two versions of the same patch set:
> >
> > 	    commit 8fb7da9e9907 ("virtio_net: get build_skb() buf by data ptr")
> > 	    commit 5c37711d9f27 ("virtio-net: fix for unable to handle page fa=
ult for address")
> >
> > 	    into net, and
> >
> > 	    commit 7bf64460e3b2 ("virtio-net: get build_skb() buf by data ptr")
> > 	    commit 6c66c147b9a4 ("virtio-net: fix for unable to handle page fa=
ult for address")
> >
> > 	    into net-next. Redo the merge from commit 126285651b7f ("Merge
> > 	    ra.kernel.org:/pub/scm/linux/kernel/git/netdev/net"), so that
> > 	    the most recent code remains.
> >
> > 	    Acked-by: Michael S. Tsirkin <mst@redhat.com>
> > 	    Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> > 	    Acked-by: Jason Wang <jasowang@redhat.com>
> > 	    Signed-off-by: David S. Miller <davem@davemloft.net>
> >
> > So after this patch, patch B can be applied normally.
> >
> > So on the latest net branch, only lost
> >
> >           1a8024239dacf53fcf39c0f07fbf2712af22864f virtio-net: fix for =
skb_over_panic inside big mode
>
> Again, I do not know what to do here, can you submit the needed fix to
> the networking developers so this gets fixed?

Michael has already submitted the patch.

https://lore.kernel.org/netdev/20211009091604.84141-1-mst@redhat.com/T/#u

Thanks.

>
> thanks,
>
> greg k-h

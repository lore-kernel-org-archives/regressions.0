Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF6E42C85
	for <regressions@lists.linux.dev>; Thu,  7 Oct 2021 14:13:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 10919610C7;
	Thu,  7 Oct 2021 14:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1633616037;
	bh=pMU2+RK50Qv/4VNm4oFS8R4BonkUuJ2i0rz98X7NWhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DpSjcM3QK3X61FROl/1mDyDtqYJ3tBxzr2t3/u4eL4dLAwK8fzYVVUi+bcaPC4Nq3
	 T2u6n4P9JuB6Ehj0uaAeWHAULDpzB3OCDpfLWtaTIdxDUN12Wkt48OuytqvhvdnvKN
	 HRoNCa2byULpYDcco/VmyD97jPLn77nshV3EVF2Q=
Date: Thu, 7 Oct 2021 16:13:55 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Corentin =?iso-8859-1?Q?No=EBl?= <corentin.noel@collabora.com>
Cc: Eric Dumazet <edumazet@google.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	linux-stable <stable@vger.kernel.org>,
	Jason Wang <jasowang@redhat.com>,
	virtualization@lists.linux-foundation.org,
	regressions@lists.linux.dev, Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Subject: Re: virtio-net: kernel panic in virtio_net.c
Message-ID: <YV8Ao5W4/z5sB5b9@kroah.com>
References: <5edaa2b7c2fe4abd0347b8454b2ac032b6694e2c.camel@collabora.com>
 <20211007090601-mutt-send-email-mst@kernel.org>
 <CANn89i+-P_mS-0jOM7SD4f291+Jbc9PORYJx2+gfQbebiX3z_A@mail.gmail.com>
 <b517d143c6ec0960eedcbf8f6917776bc67c5fd4.camel@collabora.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b517d143c6ec0960eedcbf8f6917776bc67c5fd4.camel@collabora.com>

On Thu, Oct 07, 2021 at 04:02:10PM +0200, Corentin Noël wrote:
> Le jeudi 07 octobre 2021 à 06:51 -0700, Eric Dumazet a écrit :
> > On Thu, Oct 7, 2021 at 6:11 AM Michael S. Tsirkin <mst@redhat.com>
> > wrote:
> > > On Thu, Oct 07, 2021 at 02:04:22PM +0200, Corentin Noël wrote:
> > > > I've been experiencing crashes with 5.14-rc1 and above that do
> > > > not
> > > > occur with 5.13,
> > 
> > What about 5.14 ?
> > 
> > 5.14-rc1 has many bugs we do not want to spend time rediscovering
> > them...
> > 
> 
> I've tested on 5.14, 5.15-rc4 and 5.15-rc4 with latest netdev and could
> reproduce the crash on them all.

Great, any chance you can use 'git bisect' to find the offending commit?

thanks,

greg k-h

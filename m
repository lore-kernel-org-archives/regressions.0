Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83DC123B7
	for <regressions@lists.linux.dev>; Tue, 20 Dec 2022 13:47:22 +0000 (UTC)
Received: by mail-ua1-f42.google.com with SMTP id e24so2854084uam.10
        for <regressions@lists.linux.dev>; Tue, 20 Dec 2022 05:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVeLoqXHDdEY++spzbSQ8fZ7YOLAGM87RhDMbRiu33A=;
        b=KW0xW2q4x7FcPnfxpIRPrG6OkKXU9/l9h3qoqF+vxfBML6QrMYgS2EWenpj1SP3af8
         78GnZhAphPt/kFXETy+P9ARj9JIX/jUo9tkrz0GRb3MV3f7pi0QYd3c2s9o678PZ1eBI
         PsttecEwu1JW2rfdwfwBKLc5qpyvZLVk5MraAddGa3+Wk7Ougwtq8eglAvtWnrpNUCUS
         KfiA3b0098QEhleJoUAcLCg0A9ewkiDdNhMxcr2MZujXBCRdEi6uqWjrvvqHtxElk+9A
         s3YnQFOBY6XC5nZ0obv8Zvyrk+jcpeEO3dInfKjKWLxy5v0FF72ViSGo/wc5jElJcJq6
         cnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZVeLoqXHDdEY++spzbSQ8fZ7YOLAGM87RhDMbRiu33A=;
        b=u5fhO/8J/REy9f187KvZWvfWw/6Im5a5wPa7COkhVS9/PiS5KdignRnkLmZd3U5aab
         IO75kTtMVBFP1bxExAKCJ6u8OQxXc67WsaOwgbiK/yAHUklRhAVj1riyqJY/HcLNfQE9
         VJra1uBGMp9jN8Y/SpyshODXZ0QPKLf+NK/6uFYLxAEX2/2eBpmmKDW4MsnxDCVMIHrP
         cqEVe/ZNGLOyqeFjuXVlRVpvl1vrZWGkgaXCDGTljArKoDXd0F1U546JprKps8Cs95uw
         WD6GIFASVUQUmVNG/BZi5HYM/Snpxv1qFR6P+Qvv/2Y7FPgMeOq26l3stHqf0zk6potd
         ztEA==
X-Gm-Message-State: ANoB5pmaK7qAaukmHgR/GBIthQe4U30ibqaNTzwU5AN1vSTcmmDoRLDj
	atn2GUJkBLfRzWlMRRzt6YYBOuenSZxna4rWLSDF+A==
X-Google-Smtp-Source: AA0mqf6W5zpDKROjnMl3GTjIXaJn/aDyyirurkunUdso7ifE6KFYTLQyFvO/n1jCPAVwyJOIhMU88JPNhp0PxlfMVBc=
X-Received: by 2002:ab0:77c1:0:b0:418:620e:6794 with SMTP id
 y1-20020ab077c1000000b00418620e6794mr58514960uar.59.1671544041123; Tue, 20
 Dec 2022 05:47:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYvz1eNS5fw1Wg5f4HqwdWPNg3EQyrGZVEOJ=OQzYzZ_YQ@mail.gmail.com>
 <1671532079.1159124-1-xuanzhuo@linux.alibaba.com> <20221220054938-mutt-send-email-mst@kernel.org>
 <CGME20221220131747eucas1p1411947fee7d65825ccedad8f8a12a4df@eucas1p1.samsung.com>
 <206f30df-4833-3909-2d01-472fcfa2baa6@samsung.com> <20221220082606-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221220082606-mutt-send-email-mst@kernel.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 20 Dec 2022 19:17:09 +0530
Message-ID: <CA+G9fYtaKquTs-pz2Lc2bgDiQw5d2nFKK1kGwFR2WWDBKNbRkQ@mail.gmail.com>
Subject: Re: next: kernel BUG at drivers/virtio/virtio.c:122!
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Jason Wang <jasowang@redhat.com>, Shaoqin Huang <shaoqin.huang@intel.com>, 
	Angus Chen <angus.chen@jaguarmicro.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	Linux-Next Mailing List <linux-next@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev, virtualization@lists.linux-foundation.org, 
	dmitry.fomichev@wdc.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 20 Dec 2022 at 18:56, Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Dec 20, 2022 at 02:17:45PM +0100, Marek Szyprowski wrote:
> > On 20.12.2022 11:54, Michael S. Tsirkin wrote:
> > > On Tue, Dec 20, 2022 at 06:27:59PM +0800, Xuan Zhuo wrote:
> > >> On Tue, 20 Dec 2022 14:51:54 +0530, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> > >>> The qemu-x86_64 and qemu-arm64 boot failed with Linux next-20221220 tag.
> > >>> It is always reproducible with gcc-11/ gcc-12 and clang tool chains.
> > >>>
> > >>> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > >>>
> > >>> <6>[    0.000000] Booting Linux on physical CPU 0x0000000000 [0x000f0510]
> > >>> <5>[    0.000000] Linux version 6.1.0-next-20221220 (tuxmake@tuxmake)
> > >>> (Debian clang version 16.0.0
> > >>> (++20221218072110+9c1b82599dac-1~exp1~20221218072217.501), Debian LLD
> > >>> 16.0.0) #1 SMP PREEMPT @1671498176
> > >>> <5>[    0.000000] random: crng init done
> > >>> <6>[    0.000000] Machine model: linux,dummy-virt
> > >>> ....
> > >>> <6>[    3.571098] loop: module loaded
> > >>> <6>[    3.573410] virtio_blk virtio0: 1/0/0 default/read/poll queues
> > >>> <5>[    3.578816] virtio_blk virtio0: [vda] 2816420 512-byte logical
> > >>> blocks (1.44 GB/1.34 GiB)
> > >>> <4>[    3.581234] ------------[ cut here ]------------
> > >>> <2>[    3.581595] kernel BUG at drivers/virtio/virtio.c:122!
> > >>> <0>[    3.582906] Internal error: Oops - BUG: 00000000f2000800 [#1] PREEMPT SMP

<Trim>

> > > Testing this fixup now:

Thanks for providing a quick fix.

> > > commit f9503d0fd839b59e0f48b00c20635437c41420ed
> > > Author: Michael S. Tsirkin <mst@redhat.com>
> > > Date:   Tue Dec 20 05:53:41 2022 -0500
> > >
> > >      fixup! virtio-blk: add support for zoned block devices
> >
> > I also confirm that this patch fixes the issue with broken virtio block
> > device observed on QEMU arm/arm64 'virt' machines and linux
> > next-20221220. Thanks for the fix!
> >
> > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

>
> Merged the fix already so I'm not sure I can add this tag.
> If I rebase before pull request I will, thanks!

[Sorry for delayed reply]

> > > diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
> > > index ff49052e26f7..d8cdaeb51d1c 100644
> > > --- a/drivers/block/virtio_blk.c
> > > +++ b/drivers/block/virtio_blk.c
> > > @@ -775,6 +775,10 @@ static int virtblk_probe_zoned_device(struct virtio_device *vdev,
> > >     return ret;
> > >   }
> > >
> > > +static inline bool virtblk_has_zoned_feature(struct virtio_device *vdev)
> > > +{
> > > +   return virtio_has_feature(vdev, VIRTIO_BLK_F_ZONED);
> > > +}
> > >   #else
> > >
> > >   /*
> > > @@ -790,6 +794,11 @@ static inline int virtblk_probe_zoned_device(struct virtio_device *vdev,
> > >   {
> > >     return -EOPNOTSUPP;
> > >   }
> > > +
> > > +static inline bool virtblk_has_zoned_feature(struct virtio_device *vdev)
> > > +{
> > > +   return false;
> > > +}
> > >   #endif /* CONFIG_BLK_DEV_ZONED */
> > >
> > >   /* return id (s/n) string for *disk to *id_str
> > > @@ -1576,11 +1585,11 @@ static int virtblk_probe(struct virtio_device *vdev)
> > >             else
> > >                     q->limits.discard_granularity = blk_size;
> > >     }
> > >
> > >     virtblk_update_capacity(vblk, false);
> > >     virtio_device_ready(vdev);
> > >
> > > -   if (virtio_has_feature(vdev, VIRTIO_BLK_F_ZONED)) {
> > > +   if (virtblk_has_zoned_feature(vdev)) {
> > >             err = virtblk_probe_zoned_device(vdev, vblk, q);
> > >             if (err)
> > >                     goto out_cleanup_disk;
> >
> > Best regards
> > --
> > Marek Szyprowski, PhD
> > Samsung R&D Institute Poland


--
Linaro LKFT
https://lkft.linaro.org

Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEDF20E6
	for <regressions@lists.linux.dev>; Mon, 27 Jun 2022 02:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656297017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8P6kEog96p9rV6KMm+7lR+irC0+Mtj1M8Nzsctab+8w=;
	b=HGm2JiA023/euYLaTFh4DatJHXRTIpSjDWFpOTdk7izrzI0ekzw4yFKfC4GouMu6Y9bNHL
	6vtcjQG9bOOO8qvnl5nv2gsUH1N49QaaFh8cGiyQNb0ebwPdTtvHIw1l4Jrh/HJ5mOrZnj
	2G1bLvpCYju4EQ47a6lwV8GvRkT+Ya4=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-328-A820Vy8HM9-RNuTcRi6iwQ-1; Sun, 26 Jun 2022 22:30:16 -0400
X-MC-Unique: A820Vy8HM9-RNuTcRi6iwQ-1
Received: by mail-lf1-f69.google.com with SMTP id bq4-20020a056512150400b0047f7f36efc6so3970676lfb.9
        for <regressions@lists.linux.dev>; Sun, 26 Jun 2022 19:30:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8P6kEog96p9rV6KMm+7lR+irC0+Mtj1M8Nzsctab+8w=;
        b=AxLUijQUUb1Kk6LAwWw9mRng7OPS6Wk9z9h1TbOloFiHgS0GIoNdWahR0ICPrlTf49
         7uI986FwVnXrK2TOMloaHO4bc5req+baBVdudvI1WaZ/tU0vQwkEkzzHuN+fVvy4kK/m
         i0XzRAEpxaOgNtg4afm220MokmTdieE2AUzrq0JSSUKJqnE6npPCSnlZGgaIt/mgh2RZ
         P2ykXRTMhCX3SOfSaf4snc91pixSi3ilXeHVaM6ia81uZi+yXRvLOZqH4JiYfrza2UGk
         Snr2buftNm/gTBB3KqT5qnYsoQKQtmx1B1/NU4WHVUuteYTxVvM2Yagrp68uIIldJySF
         LbgA==
X-Gm-Message-State: AJIora8gPW5a3Dy5DwonMT2xXYZAFaMMJozOw93rTLYNZDxrh/CftjFX
	CiXz0WqlSv7yCola0SyDlE5VZgNPsegocHB19YGTbXW6DONQlJzfoCQJq8M2zQJLYSwEIS5XXOY
	J4csPkdmzl40mVxE68SHDPRa+eIuqWJcgVSlVYY8=
X-Received: by 2002:a05:6512:22c3:b0:47f:704b:3820 with SMTP id g3-20020a05651222c300b0047f704b3820mr6802744lfu.411.1656297014752;
        Sun, 26 Jun 2022 19:30:14 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vihl7W4zbQFQ2ouUnfKabk1IX98Txdk8CYcQQ+eQfhlyohv3NGiMcnCeltVb+Lj1YXnvH3UF3uQbu22+LqqY0=
X-Received: by 2002:a05:6512:22c3:b0:47f:704b:3820 with SMTP id
 g3-20020a05651222c300b0047f704b3820mr6802734lfu.411.1656297014531; Sun, 26
 Jun 2022 19:30:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <64c567bc77c4fbe7bfe37467cc1c89d24a45c37a.camel@decadent.org.uk>
 <402bb9b5-7d6e-ed69-8b66-3ebefd80ff15@redhat.com> <CACGkMEs45CCniTjbxr3OThdbG=Q4nGrm_11LLDfR4rRLetSx0A@mail.gmail.com>
 <a1a127d144d65937c5543c142e69213c9b8d2d40.camel@decadent.org.uk> <20220624051309-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220624051309-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 27 Jun 2022 10:30:03 +0800
Message-ID: <CACGkMEt4LaXnv2=yaiuhHOCF1VyZuwmi20CtqHEGsS0fFViFOA@mail.gmail.com>
Subject: Re: virtio_balloon regression in 5.19-rc3
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Ben Hutchings <ben@decadent.org.uk>, David Hildenbrand <david@redhat.com>, 
	virtualization <virtualization@lists.linux-foundation.org>, debian-kernel@lists.debian.org, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 24, 2022 at 5:14 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Tue, Jun 21, 2022 at 06:10:00PM +0200, Ben Hutchings wrote:
> > On Tue, 2022-06-21 at 17:34 +0800, Jason Wang wrote:
> > > On Tue, Jun 21, 2022 at 5:24 PM David Hildenbrand <david@redhat.com> wrote:
> > > >
> > > > On 20.06.22 20:49, Ben Hutchings wrote:
> > > > > I've tested a 5.19-rc3 kernel on top of QEMU/KVM with machine type
> > > > > pc-q35-5.2.  It has a virtio balloon device defined in libvirt as:
> > > > >
> > > > >     <memballoon model="virtio">
> > > > >       <address type="pci" domain="0x0000" bus="0x05" slot="0x00" function="0x0"/>
> > > > >     </memballoon>
> > > > >
> > > > > but the virtio_balloon driver fails to bind to it:
> > > > >
> > > > >     virtio_balloon virtio4: init_vqs: add stat_vq failed
> > > > >     virtio_balloon: probe of virtio4 failed with error -5
> > > > >
> > > >
> > > > Hmm, I don't see any recent changes to drivers/virtio/virtio_balloon.c
> > > >
> > > > virtqueue_add_outbuf() fails with -EIO if I'm not wrong. That's the
> > > > first call of virtqueue_add_outbuf() when virtio_balloon initializes.
> > > >
> > > >
> > > > Maybe something in generic virtio code changed?
> > >
> > > Yes, we introduced the IRQ hardening. That could be the root cause and
> > > we've received lots of reports so we decide to disable it by default.
> > >
> > > Ben, could you please try this patch: (and make sure
> > > CONFIG_VIRTIO_HARDEN_NOTIFICATION is not set)
> > >
> > > https://lore.kernel.org/lkml/20220620024158.2505-1-jasowang@redhat.com/T/
> >
> > Yes, that patch fixes the regression for me.
> >
> > Ben.
>
>
> Jason are you going to fix balloon to call device_ready before
> registering device with linux?

I'm working on the fix, (spot various bugs during review).

Thanks

> > --
> > Ben Hutchings
> > Any smoothly functioning technology is indistinguishable
> > from a rigged demo.
>
>


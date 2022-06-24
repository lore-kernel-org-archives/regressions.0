Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C207C
	for <regressions@lists.linux.dev>; Fri, 24 Jun 2022 09:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656062047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=glFz0yEPd5ahmG1wMSVmuqssquTjanShg2UhFo4gmlE=;
	b=QKY7qQSelDvtfnEcBEFVTx3AOS9xF76YpM8xkq027ivJP90TXDGrHL/Tb6Qk0sCEPvJvWh
	c0lcvH+frKW6l0m7AeMgsZHQ+zEVZrlvWTTdvdVY9KgGpnl7Ggq959DXtHoFyKCYMOOKZX
	KshPy2QMA3WTv6r3XYxEABv+edXh0Ng=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-BDPMhO6UP5Sf9t1Pf7FYsQ-1; Fri, 24 Jun 2022 05:14:05 -0400
X-MC-Unique: BDPMhO6UP5Sf9t1Pf7FYsQ-1
Received: by mail-wm1-f70.google.com with SMTP id j31-20020a05600c1c1f00b0039c481c4664so774273wms.7
        for <regressions@lists.linux.dev>; Fri, 24 Jun 2022 02:14:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=glFz0yEPd5ahmG1wMSVmuqssquTjanShg2UhFo4gmlE=;
        b=AjEwIS876tRlUS50SKt7e7e/Rg+NZbec1nHcAAPVBcPMxo03IQKknj1Jn+NQQdXyQL
         cX8hNYcWHCi6mxMrZuhlOHkDdHUgaN2UtGjWsAyi/9R3dWIAwDBT/l3h2/jcL0AptS9b
         fS6i0d+Ob+4bgPSyKWoqTZAyqBFM98NJDUrx7T6faNWAmZXkD/8+emDuH8FEIS4pZTlm
         2qFrjdnIAuicpquh8D/XdKojradrK5M93sS2UGOmqZRo7bFQmWTRZGsDGKQfK4wl8SFj
         f61Ue1lOHeWZ+aC6TvRJPrl4fCkwaEAtm/MdxuCw6yr+9udE7oag81RLx7EwUcOIh2N1
         FuTw==
X-Gm-Message-State: AJIora/+zPLQrxxg0qvMO6IBxHoDAPI/SWLt2pD6YL4nzNTghDlrd+YA
	Rxn8YMaSmHnqQxXCro2Nl7PXaEOpdpm5Nk3sw0FWjrm2GlqpXWlYNkykV2DsdbB696YhAfDGG5u
	7Z0qjNFGmuQFq8jTJpUimexs=
X-Received: by 2002:a05:6000:1ac8:b0:21b:9236:6207 with SMTP id i8-20020a0560001ac800b0021b92366207mr11874824wry.123.1656062044432;
        Fri, 24 Jun 2022 02:14:04 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v+v1Mo2hL5d9qzq/pxsLzqhnsh8+crKgUNMKL9qPMWqbIpLCOjYlzZkK4pNrV4/4W7u8qnwQ==
X-Received: by 2002:a05:6000:1ac8:b0:21b:9236:6207 with SMTP id i8-20020a0560001ac800b0021b92366207mr11874810wry.123.1656062044239;
        Fri, 24 Jun 2022 02:14:04 -0700 (PDT)
Received: from redhat.com ([2.55.188.216])
        by smtp.gmail.com with ESMTPSA id w4-20020a7bc104000000b0039c45fc58c4sm2105865wmi.21.2022.06.24.02.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 02:14:03 -0700 (PDT)
Date: Fri, 24 Jun 2022 05:14:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
	virtualization <virtualization@lists.linux-foundation.org>,
	debian-kernel@lists.debian.org,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: virtio_balloon regression in 5.19-rc3
Message-ID: <20220624051309-mutt-send-email-mst@kernel.org>
References: <64c567bc77c4fbe7bfe37467cc1c89d24a45c37a.camel@decadent.org.uk>
 <402bb9b5-7d6e-ed69-8b66-3ebefd80ff15@redhat.com>
 <CACGkMEs45CCniTjbxr3OThdbG=Q4nGrm_11LLDfR4rRLetSx0A@mail.gmail.com>
 <a1a127d144d65937c5543c142e69213c9b8d2d40.camel@decadent.org.uk>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <a1a127d144d65937c5543c142e69213c9b8d2d40.camel@decadent.org.uk>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 21, 2022 at 06:10:00PM +0200, Ben Hutchings wrote:
> On Tue, 2022-06-21 at 17:34 +0800, Jason Wang wrote:
> > On Tue, Jun 21, 2022 at 5:24 PM David Hildenbrand <david@redhat.com> wrote:
> > > 
> > > On 20.06.22 20:49, Ben Hutchings wrote:
> > > > I've tested a 5.19-rc3 kernel on top of QEMU/KVM with machine type
> > > > pc-q35-5.2.  It has a virtio balloon device defined in libvirt as:
> > > > 
> > > >     <memballoon model="virtio">
> > > >       <address type="pci" domain="0x0000" bus="0x05" slot="0x00" function="0x0"/>
> > > >     </memballoon>
> > > > 
> > > > but the virtio_balloon driver fails to bind to it:
> > > > 
> > > >     virtio_balloon virtio4: init_vqs: add stat_vq failed
> > > >     virtio_balloon: probe of virtio4 failed with error -5
> > > > 
> > > 
> > > Hmm, I don't see any recent changes to drivers/virtio/virtio_balloon.c
> > > 
> > > virtqueue_add_outbuf() fails with -EIO if I'm not wrong. That's the
> > > first call of virtqueue_add_outbuf() when virtio_balloon initializes.
> > > 
> > > 
> > > Maybe something in generic virtio code changed?
> > 
> > Yes, we introduced the IRQ hardening. That could be the root cause and
> > we've received lots of reports so we decide to disable it by default.
> > 
> > Ben, could you please try this patch: (and make sure
> > CONFIG_VIRTIO_HARDEN_NOTIFICATION is not set)
> > 
> > https://lore.kernel.org/lkml/20220620024158.2505-1-jasowang@redhat.com/T/
> 
> Yes, that patch fixes the regression for me.
> 
> Ben.


Jason are you going to fix balloon to call device_ready before
registering device with linux?
> -- 
> Ben Hutchings
> Any smoothly functioning technology is indistinguishable
> from a rigged demo.



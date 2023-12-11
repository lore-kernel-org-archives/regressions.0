Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA0F4AF97
	for <regressions@lists.linux.dev>; Mon, 11 Dec 2023 15:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="F2Y2w9yT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702308246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hZhwe03sEnAsdBQtY8pL6zABStN0wi+V0klu7M0slhw=;
	b=F2Y2w9yTsYLFyDh9McsEsojuElkmVDy6rCBpea+sJlOo2yJcamgTlRLXktk4iuhFqU3bOl
	kt8aAmNOzjSdggoYAShc8VQM9CkUTnoOkWArInXiejnm7SI0yP9N9vlyoBGARfBuGoCese
	lETnGhMuKDMli+uaqtG2KWYkc7fcGE8=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-MFz2DB-qNzSbcJo0tBfeKQ-1; Mon, 11 Dec 2023 10:24:02 -0500
X-MC-Unique: MFz2DB-qNzSbcJo0tBfeKQ-1
Received: by mail-yb1-f198.google.com with SMTP id 3f1490d57ef6-db54e86b2d1so4513490276.1
        for <regressions@lists.linux.dev>; Mon, 11 Dec 2023 07:24:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702308241; x=1702913041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hZhwe03sEnAsdBQtY8pL6zABStN0wi+V0klu7M0slhw=;
        b=oFKD7k9sQyUe49xOHFuU37NK6t5FC1L0BXad40HDtRz4I5z/JstYfNToOnq0atYoDP
         auA2JOVsnt6QIMJN4GDECIMfOOwVCVlOlLmYRmrfjr5zL64EZDMH12zCBNh4kHCkwrTS
         e2qDbAfzaHhD3Lbkxx55s+ktm1xdbKz6eP5qPHxrj/XDbrJSm6ujnKYE/fxz/7IvqS/L
         jzYeZIvwy/omciHRUVf0GoFcshsPrZ2/IxtNRFlxqfrZJZXTOlfpF3swF7EysfX4Yh3o
         au6e1XGHD6JUfmGO/mu9ryik15SMfkII83SAEmdPlgjcSfNrcTTDT1Q3qF93hO5qWxBC
         fwRw==
X-Gm-Message-State: AOJu0YxkqIClqrL25EMgp9BKCz34sszHCfR1SJNUU+jCAPbS8ZLtfs/I
	j4yGKanHDwgd/Ilc6Lqvvdohxr/lOLICyw2bytya/raONOTIlQFTw/3DQzHGC+JTuojI7dH1alT
	JTNXjh0E8qv+kgLEDxUrf301TMaXhyMHcC8NR0Fw=
X-Received: by 2002:a25:4f44:0:b0:db9:8f64:9198 with SMTP id d65-20020a254f44000000b00db98f649198mr3140962ybb.17.1702308240709;
        Mon, 11 Dec 2023 07:24:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZlG+rZbuyBrWhmvwHkkBtn2EW99EmfiHPjx3wapX8LegAQBrI328CspOQdYhEJFKOjZK+7+RMWyo030eq2go=
X-Received: by 2002:a25:4f44:0:b0:db9:8f64:9198 with SMTP id
 d65-20020a254f44000000b00db98f649198mr3140953ybb.17.1702308240336; Mon, 11
 Dec 2023 07:24:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CACW2H-4FpZAizkp+U1aS94V_ODn8NUd1ta27BAz_zh0wo63_rQ@mail.gmail.com>
 <CAGxU2F6C8oUY4B38y17Ti9u9QdYqQKamM+S2nofjYe5b9L1tBQ@mail.gmail.com> <CACW2H-7xr8-kDWJ9xqzx7c1Ud3QhqL2w+BGYpjOEdnkj9_Kzhg@mail.gmail.com>
In-Reply-To: <CACW2H-7xr8-kDWJ9xqzx7c1Ud3QhqL2w+BGYpjOEdnkj9_Kzhg@mail.gmail.com>
From: Stefano Garzarella <sgarzare@redhat.com>
Date: Mon, 11 Dec 2023 16:23:48 +0100
Message-ID: <CAGxU2F5=fTNQVf7gkmLGTeRe825H6tw_vi_uuUiX-hXyRR=1nQ@mail.gmail.com>
Subject: Re: [REGRESSION] vsocket timeout with kata containers agent 3.2.0 and
 kernel 6.1.63
To: Simon Kaegi <simon.kaegi@gmail.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, 
	Bobby Eshleman <bobby.eshleman@bytedance.com>, "David S. Miller" <davem@davemloft.net>, 
	Sasha Levin <sashal@kernel.org>, jpiotrowski@linux.microsoft.com, 
	Michael Tsirkin <mst@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 3:20=E2=80=AFPM Simon Kaegi <simon.kaegi@gmail.com>=
 wrote:
>
> Thanks Greg, Stefano,
>
> tldr; withdrawing the regression -- rust-vmm vsock mistake
> --
>
> We're not strictly tied to the 6.1.x tree but generally stick with the
> long term releases because we patch every week or so and want less to
> change if possible.
>
> I think you're exactly right re: rust-vmm's vsock. We're using cloud
> hypervisor and just tried updating to a fixed version and everything
> is working as expected.
> https://github.com/rust-vmm/vm-virtio/issues/204 (thanks Stefano)

Cool, thanks for confirming!

Stefano

>
> Thanks all... nothing to see.
> - Simon
>
> On Mon, Dec 11, 2023 at 3:39=E2=80=AFAM Stefano Garzarella <sgarzare@redh=
at.com> wrote:
> >
> > On Mon, Dec 11, 2023 at 5:05=E2=80=AFAM Simon Kaegi <simon.kaegi@gmail.=
com> wrote:
> > >
> > > #regzbot introduced v6.1.62..v6.1.63
> > > #regzbot introduced: baddcc2c71572968cdaeee1c4ab3dc0ad90fa765
> > >
> > > We hit this regression when updating our guest vm kernel from 6.1.62 =
to
> > > 6.1.63 -- bisecting, this problem was introduced
> > > in baddcc2c71572968cdaeee1c4ab3dc0ad90fa765 -- virtio/vsock: replace
> > > virtio_vsock_pkt with sk_buff --
> > > https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/comm=
it/?h=3Dv6.1.63&id=3Dbaddcc2c71572968cdaeee1c4ab3dc0ad90fa765
> > >
> > > We're getting a timeout when trying to connect to the vsocket in the
> > > guest VM when launching a kata containers 3.2.0 agent. We haven't don=
e
> > > much more to understand the problem at this point.
> >
> > It looks like the same issue described here:
> > https://github.com/rust-vmm/vm-virtio/issues/204
> >
> > In summary that patch also contains a performance improvement, because
> > by switching to sk_buffs, we can use only one descriptor for the whole
> > packet (header + payload), whereas before we used two for each packet.
> > Some devices (e.g. rust-vmm's vsock) mistakenly always expect 2
> > descriptors, but this is a violation of the VIRTIO specification.
> >
> > Which device are you using?
> >
> > Can you confirm that your device conforms to the specification?
> >
> > Stefano
> >
> > >
> > > We can reproduce 100% of the time but don't currently have a simple
> > > reproducer as the problem was found in our build service which uses
> > > kata-containers (with cloud-hypervisor).
> > >
> > > We have not checked the mainline as we currently are tied to 6.1.x.
> > >
> > > -Simon
> > >
> >
>


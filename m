Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2967984D02
	for <regressions@lists.linux.dev>; Wed,  5 Mar 2025 14:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741186473; cv=none; b=ZYe1uVdfjMJAeMsYM3iwNyCDy2E536TZ19cZeaEpJVztLsXXzQJeboAz5KntDhaHf7XTN3AJvCzzuAJiOgePu+x7s8yYTKJUdYyLVN+LJT6WsyfdxNI5OOBt9SNNq/a2QkJjqLL/aAre+xdSQIYqAeWU8pJvNoaEc+hwLap1fAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741186473; c=relaxed/simple;
	bh=p4UtG3lt8etjyR4QSuHV4b+bVzVCE8Zwt/muQtfpYVU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WoamLydlwlLZhf8UNU279TDZjVHkHimTvQ3Tae6lJCxrjpDBWFhYnOXrHk8XN0EitTTcmYfZqGqCgmledMb29b41HvUjSg8GVSXnQvww/WnEEhCaTc65j2Ymppu83CRf8GIma2U/44Me2FdMNoD4dZaVkgitmPGz6+1kwpNH5QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WwpMvFLE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WwpMvFLE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741186471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Cox8z8lPi8h9WF637SHJRl9fGGbJ29Arrtfjq01tB+8=;
	b=WwpMvFLEgxpr+qo1ZHhwRO5quzF9xKU9bwqT53zPcvn+gWNifaUxIL/O7DnBBxKoz9DT0S
	mspK0/QNXlZxZkY+la9cnrFeNiJSvKd0okNQTPLyvFA74sOJ4kuoYKjZeVH4pp1ETNnQ0W
	aufls2kS0QJYbbAOanhKk6juHXGY9oY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-563-t8vj5eJfMHiuuDyjCCfHhw-1; Wed, 05 Mar 2025 09:54:25 -0500
X-MC-Unique: t8vj5eJfMHiuuDyjCCfHhw-1
X-Mimecast-MFC-AGG-ID: t8vj5eJfMHiuuDyjCCfHhw_1741186464
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-390e271517fso4026710f8f.1
        for <regressions@lists.linux.dev>; Wed, 05 Mar 2025 06:54:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741186459; x=1741791259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cox8z8lPi8h9WF637SHJRl9fGGbJ29Arrtfjq01tB+8=;
        b=aSMZkt/umhh/6yP+AqyA9gWmf177W+H7DmrjqGJXixkOduBxr1hRxIOxa5WY8v/Cw3
         eHFut6pWnwxRD9MToNjg55clk4ITlIfGJsercxQc46G7dCpqV3QG+C0bhSy1tU1rH8yn
         gG+ewbj9AvRQykBP6R8G00bh5BYF6wdGOoPI1MPyEs+o32djgqrN1JEm2IGDUt5ThNaT
         cbFw8fXrMcQW4utg63civloLDZWIP364xMBA+0YXd8DANkRhimDAhZ0mwXkfPvTWQVtM
         zvySst/mcN709V/qchkEPDTIyGDQj6mUbR5ocK3pQRiWkNX/KKMy8sYCjBV8zqFwvMia
         UJUg==
X-Forwarded-Encrypted: i=1; AJvYcCX92TiUXreoFqODp2lWKe5uWZ80GFRFCWJLr9ftkVsStLaj9qE8SHVBfkWzTLJXStvLOziz4rJEHyMTUQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxzqFTX1Io8l8UkJF9n+FgO5VQaGCRW/l0vY4IhUzbGz7o9LANw
	509/j3emJcBqQ/0sbibXLpAdIdUxmAvWH1KKUYOOX1mVgxJodZ34tIckBriXSfQOauYypgMJHNi
	exuPVJWH4ix3/bT0SPIh+7a/INZM7sPLDYMvhqW2GUGj+sFyI6ex0ydvoz6jk0U/sECFPxCo4Ic
	foOdL4Bzkh8UCKsA2wka+YNWS4rzZ68qBxtmo=
X-Gm-Gg: ASbGncvvCXSrQiBUVhdVlDvoGIQOET+n/9YZYy3xEkM1hxgm5By3n7o57hVxE17xDuo
	BkIiOtOSvygWUQAsPhTLvyaABFAW4ExE9Q06L4fxUisjajpxlvXXP/l4JpRD00B15zVQ3miAm
X-Received: by 2002:a05:6000:136f:b0:390:e1c5:fe2 with SMTP id ffacd0b85a97d-3911f7bac6bmr2620731f8f.38.1741186458846;
        Wed, 05 Mar 2025 06:54:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4PvVuGKTxjn5+5ksdqhrhoFlLx86CRmMyFCnvhKsn1bSfHEsAqd2/zQT4R+Gyx1q0iDsSyD24ytNHcUzKCCU=
X-Received: by 2002:a05:6000:136f:b0:390:e1c5:fe2 with SMTP id
 ffacd0b85a97d-3911f7bac6bmr2620699f8f.38.1741186458470; Wed, 05 Mar 2025
 06:54:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250112095527.434998-4-pbonzini@redhat.com> <DDEA8D1B-0A0F-4CF3-9A73-7762FFEFD166@xenosoft.de>
 <2025030516-scoured-ethanol-6540@gregkh>
In-Reply-To: <2025030516-scoured-ethanol-6540@gregkh>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 5 Mar 2025 15:54:06 +0100
X-Gm-Features: AQ5f1Jq9Q6hjcyw1JQehTB9dj5tz1yQanFW326sta5ahk4Wq43oLtxt1PyaZ6q4
Message-ID: <CABgObfb5U9zwTQBPkPB=mKu-vMrRspPCm4wfxoQpB+SyAnb5WQ@mail.gmail.com>
Subject: Re: [Kernel 6.12.17] [PowerPC e5500] KVM HV compilation error
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Christian Zigotzky <chzigotzky@xenosoft.de>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, seanjc@google.com, linuxppc-dev@lists.ozlabs.org, 
	regressions@lists.linux.dev, Trevor Dickinson <rtd2@xtra.co.nz>, 
	mad skateman <madskateman@gmail.com>, hypexed@yahoo.com.au, 
	Darren Stevens <darren@stevens-zone.net>, Sasha Levin <sashal@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pSYzBTzaBP4EGPqpMm5ROh3EbjTm0KBB5T671ik-ZlE_1741186464
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 5, 2025 at 3:19=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
> On Wed, Mar 05, 2025 at 03:14:13PM +0100, Christian Zigotzky wrote:
> > Hi All,
> >
> > The stable long-term kernel 6.12.17 cannot compile with KVM HV support =
for e5500 PowerPC machines anymore.
> >
> > Bug report: https://github.com/chzigotzky/kernels/issues/6
> >
> > Kernel config: https://github.com/chzigotzky/kernels/blob/6_12/configs/=
x5000_defconfig
> >
> > Error messages:
> >
> > arch/powerpc/kvm/e500_mmu_host.c: In function 'kvmppc_e500_shadow_map':
> > arch/powerpc/kvm/e500_mmu_host.c:447:9: error: implicit declaration of =
function '__kvm_faultin_pfn' [-Werror=3Dimplicit-function-declaration]
> >    pfn =3D __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, NULL, &page);
> >          ^~~~~~~~~~~~~~~~~
> >   CC      kernel/notifier.o
> > arch/powerpc/kvm/e500_mmu_host.c:500:2: error: implicit declaration of =
function 'kvm_release_faultin_page'; did you mean 'kvm_read_guest_page'? [-=
Werror=3Dimplicit-function-declaration]
> >   kvm_release_faultin_page(kvm, page, !!ret, writable);
> >
> > After that, I compiled it without KVM HV support.
> >
> > Kernel config: https://github.com/chzigotzky/kernels/blob/6_12/configs/=
e5500_defconfig
> >
> > Please check the error messages.
>
> Odd, what commit caused this problem?

48fe216d7db6b651972c1c1d8e3180cd699971b0

> Any hint as to what commit is missing to fix it?

A big-ass 90 patch series. __kvm_faultin_pfn and
kvm_release_faultin_page were introduced in 6.13, as part of a big
revamp of how KVM does page faults on all architectures.

Just revert all this crap and apply the version that I've just sent
(https://lore.kernel.org/stable/20250305144938.212918-1-pbonzini@redhat.com=
/):

commit 48fe216d7db6b651972c1c1d8e3180cd699971b0
    KVM: e500: always restore irqs

commit 833f69be62ac366b5c23b4a6434389e470dd5c7f
    KVM: PPC: e500: Use __kvm_faultin_pfn() to handle page faults
    Message-ID: <20241010182427.1434605-55-seanjc@google.com>
    Stable-dep-of: 87ecfdbc699c ("KVM: e500: always restore irqs")

commit f2623aec7fdc2675667042c85f87502c9139c098
    KVM: PPC: e500: Mark "struct page" pfn accessed before dropping mmu_loc=
k
    Message-ID: <20241010182427.1434605-54-seanjc@google.com>
    Stable-dep-of: 87ecfdbc699c ("KVM: e500: always restore irqs")

commit dec857329fb9a66a5bce4f9db14c97ef64725a32
    KVM: PPC: e500: Mark "struct page" dirty in kvmppc_e500_shadow_map()
    Message-ID: <20241010182427.1434605-53-seanjc@google.com>
    Stable-dep-of: 87ecfdbc699c ("KVM: e500: always restore irqs")

And this, ladies and gentlemen, is why I always include the apparently
silly Message-ID trailer. Don't you just love how someone, whether
script or human, cherry picked patches 53-55 without even wondering
what was in the 52 before. I'm not sure if it'd be worse for it to be
a human or a script... because if it's a script, surely the same level
of sophistication could have been put into figuring out whether the
thing even COMPILES.

Sasha, this wins the prize for most ridiculous automatic backport
ever. Please stop playing maintainer if you can't be bothered to read
the commit messages for random stuff that you apply.

Paolo


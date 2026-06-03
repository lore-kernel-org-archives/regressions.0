Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1783A3D34A2
	for <regressions@lists.linux.dev>; Wed,  3 Jun 2026 15:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780501547; cv=none; b=hvDNW92jCzo+VZhN9HLV2hlH0v0v6uES5Qi2wcT4p9wllmcQMt1pBzRbh7PZpuMyP6aGhSyzhzBZ+xSNz71f1kxwm5/BbNJhp+kRUtVm0oajY5WpnNYrEwOwxifXXMQe4qs+irdhWXRo9q+Rr1YhpEHkouQHoedGu0XS/0ooQ0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780501547; c=relaxed/simple;
	bh=lzW7exR1kNCxPyuPkHgqBWbInC7o9p5ohCfDidT6udo=;
	h=From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:
	 Date:Content-Type; b=s6BpRH/PWcg/YWqZFjP8n+YsJldkYejc808ShGx0gXmkgCt4/0J4tM9n0DY/BwJzidztT0Yx6GoCY4WOnYAzdKBPtaHcFZBlJmtWakG2PbmRsKBwLHu+Mu+Ex2pU6bZlTiAvWf46Z04uungevFAbQdTpT3xvy1sr6tyOuseM7NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C0YtNVu6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C0YtNVu6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780501544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T5PBr/5K2c7sLCGfLZpy7whhqK6W/Z0MTaU2ybEk/CQ=;
	b=C0YtNVu6EsetkJMeRdjD+WRi6LgOoqbY6uNh8RYJyyQuhnZxVNeMR6fjJos64bGXd2lN7n
	69Ftq9vi/CbllajwLRlxIk1SyqRD6fWo+gqL3K284vXFKQNKY0h8XjPFmCYELsXO17XW2s
	kcehva2Vkt0o5e64U+7Dy28v0YL2XvM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-119-HfByh3yrPneQdAsAmuZHXQ-1; Wed, 03 Jun 2026 11:45:43 -0400
X-MC-Unique: HfByh3yrPneQdAsAmuZHXQ-1
X-Mimecast-MFC-AGG-ID: HfByh3yrPneQdAsAmuZHXQ_1780501542
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-490afe64f26so4809245e9.0
        for <regressions@lists.linux.dev>; Wed, 03 Jun 2026 08:45:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780501542; x=1781106342;
        h=date:content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T5PBr/5K2c7sLCGfLZpy7whhqK6W/Z0MTaU2ybEk/CQ=;
        b=KD/0gz2tp5nmkUYPbzEY+/cINP7DYDBeJBIrKTX1bPheq0/KDqO5y/Ki2W8d+tWtTy
         cWP6wjdCbPvtlGAcgAESO8KfcGdE8qEYeGt0UYDwLmXJ1wulGiGv4vgSTFdklUqMcEP1
         KgvWjCpw+T0AX587NFN19zzKTIY+aEBY8/v62jz9o9xSBwnr8jCNB4wLG2YOlsMYBNFp
         V6w99w3BpcvfTvMJNrLCVoHzsmUpc85ls+rGYfiWYM46DUYieKHeXP4NTHR0Tiici2Sc
         Jlm4eVF0yWYpNwNllYLIgyyGW4x1drv/U8KeLjWM3WmGxkGsrIYovdjHkJ+/tKPTdiB6
         /Vuw==
X-Forwarded-Encrypted: i=1; AFNElJ+kOZp/CqBCf7GI2RhdhfwfQLirFFH4dj5AJ1FuuRov/HwG+obBSMiGSVFC0iOPpVakOeh0m4ayCcm27w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxzjAN0ijZ6rhlkYyXybtONtg8ua3geJfu0UteOAA79DEyKKs5d
	aSh9ry5qvkWj3/AyNIRbVzDSR0erqd7Xem/gpGY1ken7MSkJt974B1ukaNhQnuo987S4mArZPP3
	H5eKVpORGkIi3TMMHu5hOQQHc8CkutyKlY08D79HBLQ+8prIXxCdZrFsVxYTXkf2N
X-Gm-Gg: Acq92OEqkB2ti3K/G3ZZillCLEEADE8b4tYveddpjZgJXBdrLN8Etgpki01foWJJlRq
	LY8vLjbknBT7GUjKs82Etv+GnnRgW/ZyX3BMxysWf6DB8T/ZZOq2coDjj15blY3CYJB9MkhAQW3
	LtbrLgqP8h83VQC7KjbyuBMiA/VtNVCFoEH17bsHqXoaRzKa7qPDw1MK3EHzQ08WAaW2PMiOEI9
	jpQqDZkCYoBDv+s52y78OaMyJocgAqfH/qOMb3YPrNqRE10lSR88dk085xCcF49zR8oN329ryWN
	z+j8jSGYtKqDMFPmVdgUsFoA15kxPFj6SJwjL/5LlCm7YBeH0MqAztJtX0VDg8KkPJNDnQqVdvu
	UO2hE8kCVMlsQcNlpFgAP+BD7n0qCja/C/XyM1lu/iKlp4CN+d79m0GbLJwdj
X-Received: by 2002:a05:600c:8184:b0:490:ad1e:1846 with SMTP id 5b1f17b1804b1-490b613f158mr48109475e9.9.1780501541696;
        Wed, 03 Jun 2026 08:45:41 -0700 (PDT)
X-Received: by 2002:a05:600c:8184:b0:490:ad1e:1846 with SMTP id 5b1f17b1804b1-490b613f158mr48108945e9.9.1780501541151;
        Wed, 03 Jun 2026 08:45:41 -0700 (PDT)
Received: from maya.myfinge.rs (ifcgrfdd.trafficplex.cloud. [176.103.220.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3c183asm974145e9.6.2026.06.03.08.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 08:45:40 -0700 (PDT)
From: Stefano Brivio <sbrivio@redhat.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: David Gibson <david@gibson.dropbear.id.au>, Fernando Fernandez Mancera
 <fmancera@suse.de>, netdev@vger.kernel.org, yuhuang@redhat.com,
 justin.iurman@gmail.com, horms@kernel.org, pabeni@redhat.com,
 kuba@kernel.org, edumazet@google.com, davem@davemloft.net,
 dsahern@kernel.org, Chris Adams <linux@cmadams.net>, Beniamino Galvani
 <bgalvani@redhat.com>, Thorsten Leemhuis <regressions@leemhuis.info>,
 Andrew Lunn <andrew@lunn.ch>, ihuguet@redhat.com,
 regressions@lists.linux.dev
Subject: Re: IPv6 address insertion order (was Re: [PATCH net v2] Revert
 "ipv6: preserve insertion order for same-scope addresses")
Message-ID: <20260603174538.5454bb93@elisabeth>
In-Reply-To: <20260603074717.GA569921@shredder>
References: <20260529112357.5079-1-fmancera@suse.de>
	<20260529134045.56330243@elisabeth>
	<ah57wxGjL7JBORR1@zatzit>
	<20260602132118.GA508395@shredder>
	<ah-SvHdPRrYXX6lx@zatzit>
	<20260603074717.GA569921@shredder>
Organization: Red Hat
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Wed, 03 Jun 2026 17:45:39 +0200 (CEST)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: V7Tt3Zc3K0tcgWB5tS7Ioi69aK8A_ZWw2yDn2gSgEbM_1780501542
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 3 Jun 2026 10:47:17 +0300
Ido Schimmel <idosch@nvidia.com> wrote:

> On Wed, Jun 03, 2026 at 12:34:36PM +1000, David Gibson wrote:
> > On Tue, Jun 02, 2026 at 04:21:18PM +0300, Ido Schimmel wrote:  
> > > On Tue, Jun 02, 2026 at 04:44:19PM +1000, David Gibson wrote:  
> > > > I get the impression there's a rough consensus that the best we can do
> > > > now is revert this change (already done), and make a new patch which
> > > > changes the insertion order to the "correct" one conditional on a new
> > > > flag.
> > > > 
> > > > Stefano has enough other fires to fight, so I'm taking a look at
> > > > implementing that.  Some initial thoughts, that I'm soliciting
> > > > feedback on:
> > > > 
> > > > 1) I'm assuming the idea here is to add the new flag to nlmsg_flags in
> > > >    nlmsghdr
> > > > 
> > > > ifa_flags in ifaddrmsg would be the other candidate, but it looks like
> > > > it's encoding properties of the address itself, not about the action
> > > > of inserting it.  Plus all its bits are allocated, anyway.
> > > > 
> > > > 2) Could we re-use NLM_F_APPEND?
> > > > 
> > > > The short description of this existing flag in linux/uapi/netlink.h is
> > > > "Add to end of list" which sounds like the right thing.  Looking
> > > > closer, however, it seems like what is' used for so far is things
> > > > where the entity added with the NEW<whatever> operation is itself a
> > > > list, and NLM_F_APPEND causes it to be added to rather than replaced.
> > > > It's not used for addresses at present, AFAICT the list of addresses
> > > > is a semantic level above the address entity itself.
> > > > 
> > > > So maybe re-using it for the thing I tentatively called
> > > > NLM_F_INSERT_LAST would be confusing?
> > > > 
> > > > On the other hand, it's not used for addresses at the moment, so
> > > > AFAICT there's nothing actually preventing us reusing it for this
> > > > purpose. That would save a bit - we only have 2 general and 4 NEW
> > > > specific bits left, by the looks of it.  
> > > 
> > > This is not really viable. Even if the kernel is not using NLM_F_APPEND
> > > for RTM_NEWADDR, but not rejecting its presence either, then we can
> > > create a change in behavior for a user space that is currently setting
> > > it (intentionally or not).
> > >
> > > Example:
> > > 
> > > https://lore.kernel.org/netdev/27c249d80c346a258cfbf32f1d131ad4fe64e77c.camel@debian.org/  
> > 
> > Hmm.  So, in this example case we have a known, widely deployed
> > userspace that was broken by the change.  Similarly with the
> > original now-reverted "fix" for the ordering, we have a known, widely
> > deployed userspace that was broken.  
> 
> It was also reported over three years after the kernel change went in.
> Point is that we have no way of knowing how user space is using these
> flags. Suddenly giving them meaning when we simply ignored them before
> is risky.

I think that's a very different type of issue because, there, *another*
existing flag (NLM_F_EXCL) was suddenly given a meaning, as it happened
to have the same value as NLM_F_BULK, and that's what broke libvirt.
Not support for NLM_F_BULK itself.

Here, NLM_F_APPEND doesn't share its value with any other flag, and it
really is documented as "Add to end of list", but we don't do that.
That's a bug.

I think it's actually more likely that some bits of userspace are
currently broken and causing subtle issues because the author expected
NLM_F_APPEND to actually do what it promises, but maybe they only
tested that with IPv4.

Allow me to draw a parallel that looks more fitting to me: in commit 
1e47b4837f3b ("ipv6: Dump route exceptions if requested") I happened to
fix a two-year old issue that made 'ip -6 route list cache' show no
output and 'ip -6 route flush cache' have no effect.

You could take this to the extreme and say that it was risky to fix
that because some userspace application could meanwhile have started
relying on the fact that 'ip -6 route list cache' returned no output.
I guess we agree it was a good idea to fix that, though.

Of course there are several degrees of UAPI expectations in between,
but *not* allowing to use NLM_F_APPEND to append objects because
userspace might rely on NLM_F_APPEND to *not* append objects sounds
a bit like this extreme to me, or at least closer to it than the
NLM_F_BULK kind of breakage.

> > That's a different case from a hypothetical userspace that incorrectly
> > used NLM_F_APPEND on RTM_NEWADDR.  Moreover, to be broken it would
> > need to incorrectly use NLM_F_APPEND on RTM_NEWADDR *and also* rely on
> > the counterintuitive and inconsistent insertion order for IPv6
> > addresses.  Absent a concrete example of something meeting both those
> > conditions, I'm inclined to breaking that hypothetical case when the
> > payoff is an easier route to get known cases working with the
> > preferred insertion semantics.
> > 
> > Fwiw, I did look at the most likely candidates: iproute2,
> > network-manager and libvirt, and I see no signs that they're misusing
> > NLM_F_APPEND in this way.  
> 
> See above. I don't like this approach. IMO, it's not worth making it
> slightly a bit easier for some user space programs to adopt when the
> risk is breaking other programs and repeating this ordeal.

Another fact we shouldn't ignore is that, compared to the NLM_F_BULK
incident, we're actively surveying userspace before touching this.

-- 
Stefano


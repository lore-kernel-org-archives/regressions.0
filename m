Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCDF27FB05
	for <regressions@lists.linux.dev>; Mon,  1 Jun 2026 08:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780301319; cv=none; b=ETlXqnk5N2LjITBMytOVEVvwJptCF2nrebQiIV4X6nQXrO6AFw6pdHcB/D2ZXClfepo0kbuHaQyO6nnW7kNQrlCpXWU4UgJX/y6YRmRaodw0xLUSCt4LnYqXFtigNcg3AlTHMyNljF49wYjKDvh63EpXC8ZMLYhE7nsGQHtnKSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780301319; c=relaxed/simple;
	bh=b+nopWGySZSG4HSj92DLc8KguQVIEmiu6zxkNPrmY30=;
	h=From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:
	 Date:Content-Type; b=e6qjISxaQZJqRLZrvkwF0xHcJXByFiAqxCPScp9+soSNqxluax+UE3Kgcb5E/XKgacc3I8cfizRsTPh74k0nWN6EyiGf1wSZ15J/FPYoXhFnpPjgKEY2nbfQwjRtpxfV9PIajTCxbhofCC8XYJhLQBNf+qSKbPQsa2zgowzTSno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vuvhvehg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vuvhvehg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780301317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KeUIBK7Vustv5ZHBT+eRjJp5ScQX69uAYSjeAGRkkxE=;
	b=VuvhvehgBsPFJTPNbZus0yaQMiFd8zNn+HeVi7RumPFQTg1t6r91p8cP8S0BrqcW8WBoeM
	bqgUxzRHdtn8ikDshJ7sNzwWWdtmFF79gaGDcy471Xl8PJs+2rjzfZGkntjOEFFZNb5Uu8
	Ssnqz4oPRhxrxgwzAB6kDoFy3QXDK2E=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-664-TLMmV0BQOOuWOaDr4KGYfw-1; Mon, 01 Jun 2026 04:08:31 -0400
X-MC-Unique: TLMmV0BQOOuWOaDr4KGYfw-1
X-Mimecast-MFC-AGG-ID: TLMmV0BQOOuWOaDr4KGYfw_1780301310
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-490a767b782so7799105e9.2
        for <regressions@lists.linux.dev>; Mon, 01 Jun 2026 01:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780301310; x=1780906110;
        h=date:content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KeUIBK7Vustv5ZHBT+eRjJp5ScQX69uAYSjeAGRkkxE=;
        b=oJzsLF4ojjzlltJynSnL+W6qJSnPvIrZwpgEpXKkq9/VD+TcMkSfNz1CcuG10yA62H
         pAtWTR9eOinpw8E4NegxjD3gpcXJTo1Xaf6ULAIq8+hi1EVeCyn3Z1tbEGFr9s1hEd7R
         c0IiiI6oMg+fxas7iPwZ0XGwU3S8fNnQX2rwY3eUwgMLql3ZJxx3DgOvRRgOiHM/JE50
         9kvcoUud3/1xakUAfOeAnPqK3OWcJeM+QRhW4JOWv6aQ0RjaiWGDaZ8ndxXM+VYn/Mbb
         9X+ONCsHVDmemQ0Y2k0ZAPF42ZnkhrflJx22Dfswohi+is02o/pD/YE3pR51nBDplPCI
         x9zQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Gw0RZGdTZL9uk66y2a4V5Pd2l9+iBYsbWcZiK1uAqXitNF6E6P8oKAwGCgmRwdMIGJyKuSL0NO7Sn0w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwMjTp2bQ0ccgGMplqAsIrdwhVyr1ZmdhtV3fZe4/ErJh5+PPAy
	p2BE4iC/x17bHcj/cPGUdpn08nm7v2u1pTKl9N+0cQlN2Nz6dXD0/oIlikxNjIUmPcMtKYAw0Gm
	SxGl4yCuLWgs9EuNfyPZWi63uCqQpXJ1V/mhrUrat/DLqAUtrWzMnXHtfSwuRx7w7q97SrjA8
X-Gm-Gg: Acq92OHP2oU5UjV5Z71CYffkJ0CBjoE5FGBinL/sl6i2AdUtr811Wl5iBJO6pzTIdTv
	f2pnYsTtEYkqADnWXo1BdHnCP+klvy+8nQShHn7DnNjlbWmWdWIzJ6jhvTZSlD/QTkVWLfMfGvL
	aoSX64RuiOMr7VMCAn41KteZ1dAkngm+aFg490D/pCUQe2J9FcmGYDl3vSsWaYkZe7/3/BfC9L2
	gnQ9Jq1Iuufk45a9lUljLMeafWldt7cb76SGIuVA+92n3XffiiwksSvz1L8SOzvzJy+5jtcN+/D
	FFT59opKhJn7a8qBQqKcvxz3fY+mLY88SAWE27hO+IbaUTS7eLcrGZGLneXoeA3Au9g5RMxY79Z
	18Wc/jYM2NCISCiawKqi5bbcdEQq/fuV90TXtaQYo/og=
X-Received: by 2002:a05:600c:1989:b0:490:51b9:2309 with SMTP id 5b1f17b1804b1-490a297e1e1mr209816445e9.29.1780301309981;
        Mon, 01 Jun 2026 01:08:29 -0700 (PDT)
X-Received: by 2002:a05:600c:1989:b0:490:51b9:2309 with SMTP id 5b1f17b1804b1-490a297e1e1mr209815505e9.29.1780301309332;
        Mon, 01 Jun 2026 01:08:29 -0700 (PDT)
Received: from maya.myfinge.rs (ifcgrfdd.trafficplex.cloud. [2a10:fc81:a806:d6a9::1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c1035ebsm104407205e9.5.2026.06.01.01.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:08:28 -0700 (PDT)
From: Stefano Brivio <sbrivio@redhat.com>
To: Tj <tj.iam.tj@proton.me>
Cc: =?UTF-8?B?w43DsWlnbw==?= Huguet <ihuguet@redhat.com>, Thorsten Leemhuis
 <regressions@leemhuis.info>, Fernando Fernandez Mancera <fmancera@suse.de>,
 Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, Yumei Huang
 <yuhuang@redhat.com>, Ido Schimmel <idosch@idosch.org>, Justin Iurman
 <justin.iurman@gmail.com>, David Ahern <dsahern@kernel.org>, David Gibson
 <david@gibson.dropbear.id.au>, Linux kernel regressions list
 <regressions@lists.linux.dev>, Beniamino Galvani <bgalvani@redhat.com>
Subject: Re: Problem with IPv6 privacy addresses in 7.0
Message-ID: <20260601100826.4222a657@elisabeth>
In-Reply-To: <3f0d5431-60b0-42dc-8192-2f8a3c6da50e@proton.me>
References: <ahnaz3ppxyVHl3xB@mail.iam.tj>
	<20260529220415.22d0be8d@elisabeth>
	<3f0d5431-60b0-42dc-8192-2f8a3c6da50e@proton.me>
Organization: Red Hat
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Date: Mon, 01 Jun 2026 10:08:27 +0200 (CEST)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: M1Z4AmB7SLwFArZ9_JWgcpjJ_PhRwvmW8W_3TWQ9pCE_1780301310
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 29 May 2026 20:18:55 +0000
Tj <tj.iam.tj@proton.me> wrote:

> On 29/05/2026 20:04, Stefano Brivio wrote:
> > On Fri, 29 May 2026 18:28:58 +0000
> > Tj <tj.iam.tj@proton.me> wrote:
> >  
> >> I believe I hit this on a router using Debian 13 with v7.0.* kernel this week that
> >> uses systemd-networkd to configure IPV6 RA and prefix delegation after
> >> moving from v6.19.*.
> >>
> >> Symptom was the router could no longer reach public IPv6 addresses
> >> itself but forwarding was unaffected.
> >>
> >> The ISP (Starlink) provides a /64 prefix via RA and a /56 via DHCPv6. networkd
> >> allocates a static suffix address from both to the WAN-side interface.
> >>
> >> I discovered after much experimentation that instead of the usual /56
> >> address being the source it was choosing the /64 and failing.  
> > Do you really mean an address configured as /56, or a /64 address that
> > systemd-networkd derives from a /56 delegated prefix?
>
> Apologies - I should have been clearer. I meant addresses generated 
> *from the* respective prefixes - the addresses themselves are /64, yes!

Thanks for clarifying. Meanwhile, Jakub applied Fernando's revert patch
(I'm actually relieved, thanks Jakub ;)) but I had a look anyway into
how systemd-networkd handles these two cases.

They both seem to be hitting in the same way configure_address()
(src/network/networkd-address.c) with no attempt to define a given
order. After all, the only way to force a specific order would be to
remove and add addresses back, which systemd-networkd doesn't do.

So, whether the setup worked before the patch (and after the revert)
depends on the order of events / configurations, which in some sense
makes it even more important that we keep a stable order by default.

Contrary to NetworkManager, here, there's nothing we could really "fix".

-- 
Stefano


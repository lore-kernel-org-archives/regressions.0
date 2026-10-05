Received: from mail-pj2-f37.google.com (mail-pj2-f37.google.com [74.125.227.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934E04D4886
	for <regressions@lists.linux.dev>; Mon,  5 Oct 2026 17:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791221898; cv=none; b=Qa7yb+ZbASoJEZ+InW/CEVy1TndRT0sD7qk+ryJhkCkKQITBbLo6me+wkBDHo0WLdIcXZwWwjHxtWYNyBiIBKzmjgY3ttqAfOjlkjKMDKDSGCz6i7lYg/EYbwmEDKJUU3lJH0zgfcsP3bHS3Oj05m8lVjpIhC3GdUS5PtspUEJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791221898; c=relaxed/simple;
	bh=56cPUhnYKFpPjDZdkQQvRj7byuhsc5ATQUH3g9x7yko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZU8w3k3Yp4v8jUnCEsLty33YUUcLffLisTC+uSBpLpwwo9svodb08sPwJjZsgxHacodYDR9G4g7XMw4NgAedUu+a77uu9B1SOMFFMywUyYlBqg5LwOXPd78hXaXwMc492EH9BunSnmlDcekv58fUWINt7Ta/R0I/8yuTcpqoVUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=Lo2d1ly8; arc=none smtp.client-ip=74.125.227.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="Lo2d1ly8"
Received: by mail-pj2-f37.google.com with SMTP id d9443c01a7336-2e5c5972d64so1141115ad.1
        for <regressions@lists.linux.dev>; Mon, 05 Oct 2026 10:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1791221896; x=1791826696; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TGZol1/fhURXbJL0Orn0Yq+qAJxRjq98rgjNeuFqBTY=;
        b=Lo2d1ly82hBuqGvcnnEAhynlmnEHU9y5/MHn+a1pCPIE97rO6/WXXIFI2BvyoPOteY
         hdppajDehps9GNXlrmG3WWi//fmNR9bIVQZFovN0Cnt28ZBGMSrp8sMdUaBo4CbTQo22
         PQuea2z3VHPEQc4nPrgu+bqQFpWQyC/YW+iXfbM6QhZI4NfjHVib1o5HDiQ1qv0E8T86
         MtS9+CSBG+Q/k9hmT/gqXxo8UbpaZojlQ9+w3RRy7H3ZRz/s6OgqcYoz6yJnUqhSvEIJ
         y42degvwR/qKst6f/1tjIjx23kDc1KSpgWQ3aOTOO+B3bW/jflmV7MEVW7zxFwc43kgy
         zMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791221896; x=1791826696;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TGZol1/fhURXbJL0Orn0Yq+qAJxRjq98rgjNeuFqBTY=;
        b=gV3TDQJtCUU7BCFlOTIDYbU4UxZVeaD4h6i2iF9fMbmj6+eeusmsToxl/GIlfmqqvV
         1Z9QidQOB0HlBZGdnad+ZxmREFla7p5NwCF9sEDg2wFDZtwSWgVaXTbjhw3nkFfFhREc
         EsmguLBZaiDQ39lYVun9puYG/3LtABju/kcjht+XGY7GhB/E5LLXkflnDlBpYO0hSctP
         +hvh7D8pso0xoY98bPaipGcUlJripDReZSxXKkC+A4pfhauM3QgyuPfWO8qKVKGvZMBN
         NhC4geGathtC9IcWYD34ShDu1arvghemguJFr2/WFnYxZYQQC9cQhITaowjENOYFs945
         2Bew==
X-Forwarded-Encrypted: i=1; AKwUvByZ6FcVRbau2v0ZxsDs40cxTZieizejxChK0kzhzCRW0p37yA99qckwiD0BEGza8dgHir5VGKWW87frjg==@lists.linux.dev
X-Gm-Message-State: AFq9FYK5h0mwRDN13IKJqtlPtbATilQMyPCHKRJo2uEzJ9z7dEXAq4LO
	Jr0IHbCEem8jj0wVvc17hRBEj+xM7w8AxckIjPzuaoRMQml82x9EIBYugMKIxEahxnQ=
X-Gm-Gg: AYBFou1tg9ohPYpw30bCsZXYIzHpxzJpQchI72K8ktO3QkkkYKrTVjUhx8azOvqBEe+
	ShB21OTajOuQZrXttsU93ws7f+p53k/VxhY327CIMjwyPpyqaCKwSxgXeD45EFoMO+v+K8aVlrS
	r1kMtgdeNiVEpnNVJMcIfOelUSklovE6VGY2N53VTnNH4rj9keOlwShUkjE2emLjfQuPOfmQPki
	QRsHGdkAMszlOePR62p1ylhyDaK+opJQjQ2geR17V9TiQ++YfrAGAa26y34oXwKKhd22QmBEhHw
	+qTSKgTlQDVfMJG2UJcE4tbS2FpHVxjWyxw2H/Qs8ml+T1wJNUZcV+DwbPH/QUM9sCLRiwXyWC2
	1f/ZTHV93B8T1PGVWIV7ljzTL55vfHVWu8qIa94ZUiIrxh4bwHNMYsz4O8AEe9fH/MN86sRufiW
	MDb+6EiA6TqJll/D1AYlYgcZ9FXqENiiEBVHHkn/hGROZKE6Od2CZAWrNzgwdLRnpb3kDUfTzhw
	Y6yXxAjcHq3Mhd/YjIOGBo=
X-Received: by 2002:a17:90b:3849:b0:3a0:8050:2ed1 with SMTP id 98e67ed59e1d1-3a6ced936bfmr10618539a91.63.1791221895412;
        Mon, 05 Oct 2026 10:38:15 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:53::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8543e8478sm462854a91.17.2026.10.05.10.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 10:38:14 -0700 (PDT)
Date: Mon, 5 Oct 2026 10:38:13 -0700
From: Joe Damato <joe@dama.to>
To: Eric Dumazet <edumazet@kernel.org>
Cc: Stefan Fleischmann <sfle@kth.se>, netdev@vger.kernel.org,
	stable@vger.kernel.org, Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] Commit 447cbe95ebb9 causes IOMMU DMA faults on
 macvlan/vlan with bnxt_en
Message-ID: <asPghf8DPk5pOczz@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Eric Dumazet <edumazet@kernel.org>,
	Stefan Fleischmann <sfle@kth.se>, netdev@vger.kernel.org,
	stable@vger.kernel.org, Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	regressions@lists.linux.dev
References: <20261004122616.56714cbd@nargothrond>
 <f0c52ecb-b85d-4a53-8329-a8d2fd5d72b8@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0c52ecb-b85d-4a53-8329-a8d2fd5d72b8@kernel.org>

On Sun, Oct 04, 2026 at 01:46:08PM +0200, Eric Dumazet wrote:
> 
> 
> On 10/4/26 12:26, Stefan Fleischmann wrote:
> > Hi,
> > 
> > I have bisected a regression introduced in kernel 6.18.51 (and 7.2.3).
> > The issue is still present in 6.18.55 and 7.2.9. Verified by reverting
> > 1517d1996b52 (the equivalent of 447cbe95ebb9 in the 6.18 branch) on top
> > of 6.18.51 and 6.18.55.
> > 
> > The hardware is a Dell R640 server with Intel Xeon Silver 4210 and
> > Broadcom BCM57412 NetXtreme-E NIC.
> > 
> > The network interface is configured as an untagged interface and has a
> > couple of tagged VLAN interfaces configured on top. All of these are
> > used by LXC containers with Macvlan.
> > 
> > The interface comes up fine after boot, but after some time (anywhere
> > between 2 to 40 minutes) I see a DMA error in the kernel log (attached),
> > and the driver ends up tearing down the interface. It can be brought up
> > again after that, but it will hit a DMA error again after a while and
> > the interface goes down again.
> > 
> > I'm happy to provide more debug info if needed, or test patches.
> 
> Hi Stefan,
> 
> Thanks for the bisect and detailed report.
> 
> Notice that 0xfc499000 is on an exact 4KB page boundary. This points to a
> DMA read overrun where the Broadcom DMA engine reads past the end of a
> buffer mapped in page 0xfc498xxx into the adjacent unmapped page 0xfc499000.
> 
> Have you tried a recent net kernel ?
> 
> Could you please test whether disabling TSO or hardware VLAN offload
> prevents the crash? (maybe adding one option at a time)
> 
>   # ethtool -K eno1np0 tso off
> 
>   # ethtool -K eno1np0 tx-vlan-offload off
> 
> Adding Joe to this thread, because some parts in
> tso_dma_map_init() or tso_start() might have bugs.

Thanks for adding me and debugging this.

We've been hitting a similar read fault for a very long time I've had trouble
tracking down (it's been reproducing since at least kernel 6.9, long before my
SW USO changes).

In the case I am tracking, it seems to reproduce (fairly rarely) and seems to
be caused by a tcpv6 TSO packet with a read fault in the last page of a 32k
frag. I have yet to find a reproducer for my issue, though :(

I'll try this patch, but IIUC padding only applies to frames under 52 bytes,
so I'm not sure if it's the same bug I have been searching for.

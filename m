Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A5F39B97B
	for <regressions@lists.linux.dev>; Wed,  1 Jul 2026 20:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782939419; cv=none; b=eEvOQJ6hcNudRhfcIKdYCiWodqHwm+fOohzZknsOKi0T/vKh5fztLa90yIdIYnGfjalKgoGVx7HmHAEwA+s/fzCQiC2GauQXYbE2AB4XZ2JX5Myf/ar0PSv4KNVh4VMa+tZYvORUeOZxBcP1N4Q7Q81bozoz97A99esGrZgW8O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782939419; c=relaxed/simple;
	bh=mRiwnn+oiSq7d7lkAzV+P36bj5VEEUrH+Uwbhlo8reo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=R8priZy2HjiD2uk5qTppaJbCIxPfXdWim5edrmXEIk8+P4To6d16eYmPvovLRRDdYUmjqSwjGUmxU4sVwcOttCc2QAXMLMVULgF6KRSiH0BW+OyY/JTkgVELKVLBNNl5JGFsZ5EiWLSGbHGURKIF2DfM67+dBjQxD4XGf05qPrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jNc9Ef0T; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jNc9Ef0T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782939416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6hYyIfv1CaoGsqa362UdF8tkaUCPwp79KqO05jVLqz0=;
	b=jNc9Ef0T3K50My2NfaPXhBIF8OVIf/4oDTkYKeAvaCYMCG5Q2QvKNiFdB+Wd88/WWCIeTa
	GTbwunsqfOYM9X7plLIK1Rqd0zoiP936XR7B2UfB3nZhSeajAyw17O/PHqHDZNVVCUFcID
	w52/uvg/L2BW6VgeqBoEmwCHmTlf4rc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-zX-xUh_pOyKREOaWIHHL2A-1; Wed, 01 Jul 2026 16:56:53 -0400
X-MC-Unique: zX-xUh_pOyKREOaWIHHL2A-1
X-Mimecast-MFC-AGG-ID: zX-xUh_pOyKREOaWIHHL2A_1782939412
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-492714d002cso8415085e9.0
        for <regressions@lists.linux.dev>; Wed, 01 Jul 2026 13:56:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782939412; x=1783544212;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6hYyIfv1CaoGsqa362UdF8tkaUCPwp79KqO05jVLqz0=;
        b=frQhlTgjebbKp3doW0BjCDBjEItURHgGguD1zNqlPZ0VRiOt7432tExv+BDmaO9OG9
         YkzHRROoYCZs7XTESg2YSMQjW5XXqUY7Xk0arXqPDk6kWS7cYHnsNYFJkXnBBuRvNjbN
         V9JH+BXNKr0EAY5RsAgzEre9R5dBP/nfyygm5vK9bmSJgzDIbXEF2DmLP/MDd7yqyZio
         mHuu7WKTB8jrt4RoB5h1NQmGy8ZbyalonM6wb6+n3Ok2lRWsXMFFkOoBdnDi1SbJJDuu
         Lqcb1qbpW7J8dNLzcXasgXqzXYaWC+alBUTINPIoqXdkRTkbEXccWKTGD+/Qy7+cmFng
         mhYQ==
X-Gm-Message-State: AOJu0YzWXZ+6vckHAPv4wHLOYUNPjFQa2tNnkDLOOepQDB3iNqAs1+R7
	TZ/qEUvEcGHxZB9VTOC1iUB8byLZ8GNQWlDSHGuZXixWgrRaC7OcwnLngcySNfXdVnBV1VUKKPy
	dDO0S9IerB9HVgutyjt8mkI9HTiLukP0DYIb9W0tnFoxLqvw2Xr8lUb92gZx8r6c/
X-Gm-Gg: AfdE7clCj5L9KafWDX6nPDkxWTSBlwMGUD6tSgh5vokHOJ+suj5LpuSeny7h86YJ9c+
	kux50gXdTMFEB7gmYvuqyNVdbcwzRm7aqhqo9NYGAh6yIEpqqFXkpawcrFJuUXoaso/pdapa5KM
	FbgomhhDRMXXG+htzsG4UQaXcQqgL75f5y/1rmMoz8uV324B4TyOGq45GMGV3f+GZXpNt3rQS5F
	TWAnPPAmeIgdGG6wEzTzfAshvECffWo8obICF0uLzOzgaNDhWCYsZFrzEHPha6D0HRzMMcmKDz+
	SFLaoqEWTgybe9CYZexIRG/QSHnpnSHsXT276PPUHvGXTT2/ib8XuP8mT1ja81xIYb3T7vJBYsD
	t73JlXE8TRmrdFGUQspwAs5rnAENxgdwU
X-Received: by 2002:a05:600c:2e53:b0:493:b8dd:9d68 with SMTP id 5b1f17b1804b1-493c3cdac7emr20916805e9.10.1782939412268;
        Wed, 01 Jul 2026 13:56:52 -0700 (PDT)
X-Received: by 2002:a05:600c:2e53:b0:493:b8dd:9d68 with SMTP id 5b1f17b1804b1-493c3cdac7emr20916495e9.10.1782939411763;
        Wed, 01 Jul 2026 13:56:51 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-85-71.inter.net.il. [80.230.85.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bf11eba5sm54818415e9.0.2026.07.01.13.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 13:56:51 -0700 (PDT)
Date: Wed, 1 Jul 2026 16:56:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Brett Sheffield <bacs@librecast.net>
Cc: regressions@lists.linux.dev, netdev@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Simon Schippers <simon.schippers@tu-dortmund.de>,
	Tim Gebauer <tim.gebauer@tu-dortmund.de>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION][BISECTED] tun/tap & vhost-net: multi-threaded
 network performance
Message-ID: <20260701165359-mutt-send-email-mst@kernel.org>
References: <akVnoOYQOrt8k-Gu@karahi.librecast.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <akVnoOYQOrt8k-Gu@karahi.librecast.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: voPHKWmppEM4scIEVRtofWAmZRnnt_eiyMR0Uwcffn8_1782939412
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 01, 2026 at 09:16:48PM +0200, Brett Sheffield wrote:
> TL;DR - Commit 1d6e569b7d0c0b2736636749e4be0a27f3cefcb3 causes
> significant performance regressions with TAP interfaces and multithreaded
> network code. Please revert.
> 
> 
> Librecast is an IPv6 multicast library. One of the tests (0055) fails under
> Linux 7.2-rc1. The test performs data synchronization over IPv6 multicast using a TAP
> interface. This test has run successfully on every stable, LTS and mainline RC
> released in the past year. Every kernel with my Tested-by has run this test.
> 
> There have been a bunch of changes to MLDv2 so I started bisecting there, but
> the culprit is actually 1d6e569b7d0c0b2736636749e4be0a27f3cefcb3 "tun/tap &
> vhost-net: avoid ptr_ring tail-drop when a qdisc is present"
> 
> Reverting this commit fixes the test.
> 
> To eliminate my code and any multicast weirdness, I ran tests with iperf3
> comparing the same host running 7.2-rc1 both with and without 1d6e569b7d0
> reverted.

Thanks a lot for the bisect! Reverting is not out of question, but
just before we do, it is worth analyzing the situation.

Could you pls tell us
- do you see packet drops?
- does it help to increase the tun queue size?

Thanks a lot!


> CPU: AMD Ryzen 9 9950X
> 
> [ host ] - [ bridge ] - [ tap ] - [ guest (qemu) ]
> 
> Running matching kernels on host and guest, I started iperf3 in server mode on
> the guest and tested from the host so traffic passes through the tap interface.
> 
> iperf3 -s -V                 # server
> iperf3 -c guest -P nthreads  # client
> 
> 7.2.0-rc1 (threads 1):
> 
> [  5]   0.00-10.00  sec  20.2 GBytes  17.4 Gbits/sec    0            sender
> [  5]   0.00-10.00  sec  2.00 GBytes  1.72 Gbits/sec                  receiver
> 
> 7.2.0-rc1 (threads 1, reverted):
> 
> [  5]   0.00-10.00  sec  15.3 GBytes  13.1 Gbits/sec  368            sender
> [  5]   0.00-10.00  sec  2.00 GBytes  1.72 Gbits/sec                  receiver
> 
> 7.2.0-rc1 (threads 2):
> 
> [SUM]   0.00-10.00  sec  10.9 GBytes  9.33 Gbits/sec    0             sender
> [SUM]   0.00-10.00  sec  4.00 GBytes  3.43 Gbits/sec                  receiver
> 
> 7.2.0-rc1 (threads 2, reverted):
> 
> [SUM]   0.00-10.00  sec  15.9 GBytes  13.7 Gbits/sec  1567             sender
> [SUM]   0.00-10.00  sec  4.00 GBytes  3.43 Gbits/sec                  receiver
> 
> 7.2.0-rc1 (threads 4):
> 
> [SUM]   0.00-10.00  sec  10.9 GBytes  9.33 Gbits/sec    0             sender
> [SUM]   0.00-10.00  sec  8.00 GBytes  6.87 Gbits/sec                  receiver
> 
> 7.2.0-rc1 (threads 4, reverted):
> 
> [SUM]   0.00-10.00  sec  16.5 GBytes  14.1 Gbits/sec  6701             sender
> [SUM]   0.00-10.00  sec  8.00 GBytes  6.87 Gbits/sec                  receiver
> 
> 7.2.0-rc1 (threads 8):
> 
> [SUM]   0.00-10.00  sec  10.7 GBytes  9.15 Gbits/sec    0             sender
> [SUM]   0.00-10.01  sec  10.6 GBytes  9.13 Gbits/sec                  receiver
> 
> 7.2.0-rc1 (threads 8, reverted):
> 
> [SUM]   0.00-10.00  sec  16.2 GBytes  14.0 Gbits/sec  19319             sender
> [SUM]   0.00-10.00  sec  15.7 GBytes  13.5 Gbits/sec                  receiver
> 
> 7.2.0-rc1 (threads 16):
> 
> [SUM]   0.00-10.00  sec  10.9 GBytes  9.35 Gbits/sec    0             sender
> [SUM]   0.00-10.01  sec  10.9 GBytes  9.32 Gbits/sec                  receiver
> 
> 7.2.0-rc1 (threads 16, reverted):
> 
> [SUM]   0.00-10.00  sec  14.4 GBytes  12.4 Gbits/sec  43593             sender
> [SUM]   0.00-10.00  sec  14.4 GBytes  12.4 Gbits/sec                  receiver
> 
> 
> As you can see, the new code works for single threaded, but for all other cases
> there's a significant performance drop. I see this trade-off is mentioned in the
> commit, but the performance drop off is much worse than suggested with the
> current patch.
> 
> In our multicast use case data is sent by multiple threads to multiple groups
> simultaneously, this just breaks things to the extent that a <2 second test
> times out after 5 minutes.
> 
> 
> git bisect start
> # status: waiting for both good and bad commits
> # bad: [dc59e4fea9d83f03bad6bddf3fa2e52491777482] Linux 7.2-rc1
> git bisect bad dc59e4fea9d83f03bad6bddf3fa2e52491777482
> # status: waiting for good commit(s), bad commit known
> # good: [36bdc0e815b4e8a05b9028d8ef8a25e1ead35cc1] net: usb: asix: ax88772: re-add usbnet_link_change() in phylink callbacks
> git bisect good 36bdc0e815b4e8a05b9028d8ef8a25e1ead35cc1
> # good: [db314398f618a3a23315f73c87f7d318eaf06c1b] Merge branch 'net-bridge-mcast-support-exponential-field-encoding'
> git bisect good db314398f618a3a23315f73c87f7d318eaf06c1b
> # bad: [079a028d6327e68cfa5d38b36123637b321c19a7] string: Remove strncpy() from the kernel
> git bisect bad 079a028d6327e68cfa5d38b36123637b321c19a7
> # bad: [f396f4005180928cd9e15e352a6512865d3bc908] Bluetooth: btmtk: fix URB leak in alloc_mtk_intr_urb error path
> git bisect bad f396f4005180928cd9e15e352a6512865d3bc908
> # bad: [ec1806a730a1c0b3d68a7f9afe81514fb0dd7991] netfilter: x_tables: disable 32bit compat interface in user namespaces
> git bisect bad ec1806a730a1c0b3d68a7f9afe81514fb0dd7991
> # good: [50c2d91c5dfa0e465826ec1f8dbad9cdc254bd85] mptcp: do not drop partial packets
> git bisect good 50c2d91c5dfa0e465826ec1f8dbad9cdc254bd85
> # good: [68993ced0f618e36cf33388f1e50223e5e6e78cc] Merge tag 'net-7.1-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net
> git bisect good 68993ced0f618e36cf33388f1e50223e5e6e78cc
> # good: [34c78dff59a25110a4ce50c208e42a91490fe615] Merge branch 'net-use-ip_outnoroutes-drop-reason'
> git bisect good 34c78dff59a25110a4ce50c208e42a91490fe615
> # bad: [9587ed8137fb83d93f84b858337412f4500b21e9] Merge branch 'gve-add-support-for-ptp-gettimex64'
> git bisect bad 9587ed8137fb83d93f84b858337412f4500b21e9
> # bad: [83ea7fd73b11dd8cbf4416507a5eac3890b49fb0] net: dsa: microchip: remove unused phylink_mac_link_up() callback
> git bisect bad 83ea7fd73b11dd8cbf4416507a5eac3890b49fb0
> # bad: [f0de88303d5e7e04a1224bc7a00512b5a1c4fe7a] net: make is_skb_wmem() available to modules
> git bisect bad f0de88303d5e7e04a1224bc7a00512b5a1c4fe7a
> # bad: [c411baa463e85a779a7e68a00ba6298770b58c4c] netconsole: move push_ipv6() from netpoll
> git bisect bad c411baa463e85a779a7e68a00ba6298770b58c4c
> # good: [fba362c17d9d9211fc51f272156bb84fc23bdf98] ptr_ring: move free-space check into separate helper
> git bisect good fba362c17d9d9211fc51f272156bb84fc23bdf98
> # bad: [d0273dbe8be1640e597552f81faf1d6c9997d3e3] ipvlan: use netif_receive_skb() in ipvlan_process_multicast()
> git bisect bad d0273dbe8be1640e597552f81faf1d6c9997d3e3
> # bad: [3803065cd6b0630d4161d86aa04e2d1db0f3a0b5] Merge branch 'tun-tap-vhost-net-apply-qdisc-backpressure-on-full-ptr_ring-to-reduce-tx-drops'
> git bisect bad 3803065cd6b0630d4161d86aa04e2d1db0f3a0b5
> # bad: [1d6e569b7d0c0b2736636749e4be0a27f3cefcb3] tun/tap & vhost-net: avoid ptr_ring tail-drop when a qdisc is present
> git bisect bad 1d6e569b7d0c0b2736636749e4be0a27f3cefcb3
> # first bad commit: [1d6e569b7d0c0b2736636749e4be0a27f3cefcb3] tun/tap & vhost-net: avoid ptr_ring tail-drop when a qdisc is present
> 
> -- 
> Brett Sheffield (he/him)
> Librecast - Decentralising the Internet with Multicast
> https://librecast.net/
> https://blog.brettsheffield.com/


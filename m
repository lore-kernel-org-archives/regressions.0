Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647A83C4B72
	for <regressions@lists.linux.dev>; Thu,  2 Jul 2026 22:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783032969; cv=none; b=GJj1k6qmMuOb1CzdXTQeNBGPquTMs5tQZ+jzFFjOgYiiV/lxEkjFQrTAVwPd++G3+Nj2rEKX61ZlhCnSuglVakJG9oA/9tz8y8qiHRLsU670cHpK2A/myrqxAnCtYcss0AR6U+kGNqkvE8HyEyjnSeMowEYpcQGZKj/6uot4B5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783032969; c=relaxed/simple;
	bh=d7Kd/I+a/fLK24mvS0n1w7CPiFKwrdoZz+oQ9j/wruc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=kVxN4Kq8BnmKDkHJ2WcHGKkfqu6sUxdV0u5iRzAOdDzEAZHZu2HhI8a8dzGM7g6uN73Ca4ch1flQQn3VPkhuSFN+fNCW3gKygNYSjr6N8koCCdPYa5x2npl14kzR+qf07sGWYIhQkoVBet2j0QhvOsHd6l2ij38DAcV1onr3IKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PVUNYagz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PVUNYagz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783032966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GN59CVwWQmPqxJ3gp/iRcnL5JZbPmURc0dB6sj/cdlI=;
	b=PVUNYagzVsI7YSaCZNhrWLvw1svWNb4f4gU4Hxa9Wy5ofngkb1xiHMVpYREjsOBlO3ljXZ
	SoQLDgVqJRPbrIdzHd1TzjZ/l32WK2sOCWXBEn1PgwxTh1FvI52A606R4bZHIumBwEzGNz
	LzEf5xhXWmGoKWE1Tf86QpNdprOCrxA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-qpdA9f7NObWopPjtGIO7tg-1; Thu, 02 Jul 2026 18:56:05 -0400
X-MC-Unique: qpdA9f7NObWopPjtGIO7tg-1
X-Mimecast-MFC-AGG-ID: qpdA9f7NObWopPjtGIO7tg_1783032964
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49244130073so17052005e9.1
        for <regressions@lists.linux.dev>; Thu, 02 Jul 2026 15:56:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783032964; x=1783637764;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GN59CVwWQmPqxJ3gp/iRcnL5JZbPmURc0dB6sj/cdlI=;
        b=iktkYCmlO9DfOZhe+L4CplKoFF4tjfwUA2FIn2Swts1eKGY3oO3mq8zYcAlXcx+hoW
         B+/gtkhvz6TkobNeYeHdENlAmedyggHyZDCnDZw2DpvgjxSURC4Vu4VLhsQ/nYV9Rk3I
         9B6V5hTqUqKOVuGP+MeWky1aTtbo5qMNYf0Jzw0SqBAtmw8yyUcInIRjWwNfNLFdvxa7
         RamN5qryNYP/UGtxBdaY82u9XT6JZwViVJoicqQy3ZluYwQtOkYLWEQ7biozAa0zATii
         6bC40q/EipNw1ExQm747Un+WfjQEfYqs2JyHr3Hf+Cs6iZCNOTNt0BaR4hHHsZPkqbbW
         phMw==
X-Forwarded-Encrypted: i=1; AFNElJ/32sPKI6DLg2/q6v0EY/IEdIJVInivMSiGvpWdH3Rd9R9KK+5qlyLyPxcucZXbyfaVOFhAsPqtrOgwKg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxBYCmo8u996/E8Y+8cKjuT1agRohb1tIjpNwanmeYIK/8+kMD1
	VUYZKPjmjh7lCyQ2lPphpImKzvyB8ivR7hmN8ngHegoEV39rMyaULt02fRkwrJptalMYDraYI/r
	Hu+NW+SXf8bPmBFIlZlNTlwSa+vwneT3KiMppsdw+dN9/Hriui6NbVaWBK3/fBYOF
X-Gm-Gg: AfdE7clw3mhRPx70fEgTQYgZG6AsEtoeRZ+p2pRM/hZyzznyXNhMN2qYBHslemTIZCU
	us2Cz1+bAoZkt0rasYrBZiJ2C8uUO2DXO1UKGqdCjFXo2ZOpHwaR8AjlwI8bGBBlbcxXQ5Z+kjs
	+APdC2MSMF3seIZFoAVdPeuuvum3LWkue2uHylVkZMQrVX18wqy6zwk6feAx5lAQvBO/omHrjIH
	r8W9YTwBM7aoqUFVgehSPiaEIRgCTQaF47S02W1ogWgnGNt8GHl5r+fjNePldztjcZkIPE7yk2L
	W/il3n5rdMsKL2+5AkjFA3O3y9NFPUrKk+uZrGFZHpFuSs8brP/7raffAlvtG+4EA0DrVEp0uEq
	qCIaeZ3RSQL3uGAcyL+hA0Z5pRXQZn5G8
X-Received: by 2002:a05:600c:310f:b0:493:b6e2:1b10 with SMTP id 5b1f17b1804b1-493c2ba0bc7mr106860185e9.31.1783032963512;
        Thu, 02 Jul 2026 15:56:03 -0700 (PDT)
X-Received: by 2002:a05:600c:310f:b0:493:b6e2:1b10 with SMTP id 5b1f17b1804b1-493c2ba0bc7mr106859855e9.31.1783032962992;
        Thu, 02 Jul 2026 15:56:02 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-68-31.inter.net.il. [80.230.68.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477de3dd46asm13399841f8f.36.2026.07.02.15.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 15:56:02 -0700 (PDT)
Date: Thu, 2 Jul 2026 18:55:58 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Brett Sheffield <bacs@librecast.net>
Cc: Simon Schippers <simon.schippers@tu-dortmund.de>,
	regressions@lists.linux.dev, netdev@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Tim Gebauer <tim.gebauer@tu-dortmund.de>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowang@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [REGRESSION][BISECTED] tun/tap & vhost-net: multi-threaded
 network performance
Message-ID: <20260702185420-mutt-send-email-mst@kernel.org>
References: <akVnoOYQOrt8k-Gu@karahi.librecast.net>
 <20260701165359-mutt-send-email-mst@kernel.org>
 <ef33f0a7-f0b7-4bc4-9263-10d2b480d717@tu-dortmund.de>
 <akZGg96-Xu9VeGrw@karahi.librecast.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <akZGg96-Xu9VeGrw@karahi.librecast.net>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YnkFkxqN9Zh7tOKQHdHpV19nIwypOpEGQK1NxzOjZP0_1783032964
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 02, 2026 at 01:07:47PM +0200, Brett Sheffield wrote:
> On 2026-07-02 09:24, Simon Schippers wrote:
> > On 7/1/26 22:56, Michael S. Tsirkin wrote:
> > > On Wed, Jul 01, 2026 at 09:16:48PM +0200, Brett Sheffield wrote:
> > >> TL;DR - Commit 1d6e569b7d0c0b2736636749e4be0a27f3cefcb3 causes
> > >> significant performance regressions with TAP interfaces and multithreaded
> > >> network code. Please revert.
> > >>
> > >>
> > >> Librecast is an IPv6 multicast library. One of the tests (0055) fails under
> > >> Linux 7.2-rc1. The test performs data synchronization over IPv6 multicast using a TAP
> > >> interface. This test has run successfully on every stable, LTS and mainline RC
> > >> released in the past year. Every kernel with my Tested-by has run this test.
> > >>
> > >> There have been a bunch of changes to MLDv2 so I started bisecting there, but
> > >> the culprit is actually 1d6e569b7d0c0b2736636749e4be0a27f3cefcb3 "tun/tap &
> > >> vhost-net: avoid ptr_ring tail-drop when a qdisc is present"
> > >>
> > >> Reverting this commit fixes the test.
> > >>
> > >> To eliminate my code and any multicast weirdness, I ran tests with iperf3
> > >> comparing the same host running 7.2-rc1 both with and without 1d6e569b7d0
> > >> reverted.
> > 
> > Thank you very much for your bisect!
> > 
> > As the author, I am sorry for that regression!
> 
> No worries. That's why we test :-)
> 
> > > - does it help to increase the tun queue size?
> > 
> > I agree, this would be great to know.
> > 
> > However, even then we must act. I am considering IFF_BACKPRESSURE
> > as a feature flag, defaulting to off. It would just enable/disable
> > the stopping logic in tun_net_xmit() and the waking logic
> > in __tun_wake_queue(). If disabled, it would result in the same logic
> > as before.
> > 
> > I could provide such a patch as [net] material.
> 
> I'm going to make myself a strong cup of tea and dig into it a bit more here and
> will let you know if I find anything worth reporting.
> 
> If you need me to try re-testing with specific settings or test a patch I'm
> happy to do so.
> 
> Cheers,
> 
> 
> Brett
> -- 
> Brett Sheffield (he/him)
> Librecast - Decentralising the Internet with Multicast
> https://librecast.net/
> https://blog.brettsheffield.com/

Maybe it's the supposedly rare case? Does this change anything
for you?


diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index bfa49fa9e3a1..bacd89460078 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -1018,7 +1018,6 @@ static netdev_tx_t tun_net_xmit(struct sk_buff *skb, struct net_device *dev)
 	struct netdev_queue *queue;
 	struct tun_file *tfile;
 	int len = skb->len;
-	int ret;
 
 	rcu_read_lock();
 	tfile = rcu_dereference(tun->tfiles[txq]);
@@ -1064,19 +1063,24 @@ static netdev_tx_t tun_net_xmit(struct sk_buff *skb, struct net_device *dev)
 		goto drop;
 	}
 
-	skb_tx_timestamp(skb);
-
-	/* Orphan the skb - required as we might hang on to it
-	 * for indefinite time.
-	 */
-	skb_orphan(skb);
-
-	nf_reset_ct(skb);
-
 	queue = netdev_get_tx_queue(dev, txq);
 
 	spin_lock(&tfile->tx_ring.producer_lock);
-	ret = __ptr_ring_produce(&tfile->tx_ring, skb);
+	if (__ptr_ring_check_produce(&tfile->tx_ring)) {
+		spin_unlock(&tfile->tx_ring.producer_lock);
+		netif_tx_stop_queue(queue);
+		smp_mb__after_atomic();
+		if (!__ptr_ring_check_produce(&tfile->tx_ring))
+			netif_tx_wake_queue(queue);
+		rcu_read_unlock();
+		return NETDEV_TX_BUSY;
+	}
+
+	skb_tx_timestamp(skb);
+	skb_orphan(skb);
+	nf_reset_ct(skb);
+
+	__ptr_ring_produce(&tfile->tx_ring, skb);
 	if (!qdisc_txq_has_no_queue(queue) &&
 	    __ptr_ring_check_produce(&tfile->tx_ring) == -ENOSPC) {
 		netif_tx_stop_queue(queue);
@@ -1087,18 +1091,6 @@ static netdev_tx_t tun_net_xmit(struct sk_buff *skb, struct net_device *dev)
 	}
 	spin_unlock(&tfile->tx_ring.producer_lock);
 
-	if (ret) {
-		/* This should be a rare case if a qdisc is present, but
-		 * can happen due to lltx.
-		 * Since skb_tx_timestamp(), skb_orphan(),
-		 * run_ebpf_filter() and pskb_trim() could have tinkered
-		 * with the SKB, returning NETDEV_TX_BUSY is unsafe and
-		 * we must drop instead.
-		 */
-		drop_reason = SKB_DROP_REASON_FULL_RING;
-		goto drop;
-	}
-
 	/* dev->lltx requires to do our own update of trans_start */
 	txq_trans_cond_update(queue);
 


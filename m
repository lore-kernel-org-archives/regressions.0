Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECEC3C1985
	for <regressions@lists.linux.dev>; Thu,  2 Jul 2026 22:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783032279; cv=none; b=hshQDOtVPU5eDFBD7fyNTWN939+n1ou8KZQioZZeNUP8dVWip4agMUVecL8mUD11/aI6+n4FJOar7JuG/l2aTUWCY1s6AJpWKzYOjcLezSF/XfkAtcgNnfdiR+HZ+hgTjSLLaUptU/r0nX62mx5LhXsY/y/RNYyxflLGF7ogYKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783032279; c=relaxed/simple;
	bh=UGDdCtJ3tvCdQ7atMdk9EYMybsWKIi1x/7V26/tC02I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=CDJOZ0Rb8DP9GTdmigS85Glv0N6ndcve+gENSp8w6zPukoXrPBv+dCZNmL4h3IKMZpqZYhWQTI/9RdXAQ6UoHMzPGQ0+VxQH1HXI06rC9eGXqxDfHNIYg7Te8G6Std6tBhU49+mOljUydJCjVkJgrzwk5ejzEOd3i/tlSa7GLn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KQc6peP1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KQc6peP1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783032275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=A/rbYuZ3JZ8lfJrteK+nOk5ehF4hktz6HEAclFasOjE=;
	b=KQc6peP1w+r3WTKLnOLWO6ukBZ0EyHy5c7xCtSgVqhUvA4XAjC1urhYXKpKMV48p6505+q
	w2WjrOt3w7Los5ugz67ASXk0YpJ+gRUZaBSuCK/uj0/PR879iGpFVwDw2qdblI4LTKCJjN
	jSarRktrx/NGBdwi0YxOz3aMilBPyN4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-PjOzhSthNL-7R5RPcUsXtQ-1; Thu, 02 Jul 2026 18:44:34 -0400
X-MC-Unique: PjOzhSthNL-7R5RPcUsXtQ-1
X-Mimecast-MFC-AGG-ID: PjOzhSthNL-7R5RPcUsXtQ_1783032273
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-46fd6d94a8dso1089674f8f.2
        for <regressions@lists.linux.dev>; Thu, 02 Jul 2026 15:44:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783032273; x=1783637073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A/rbYuZ3JZ8lfJrteK+nOk5ehF4hktz6HEAclFasOjE=;
        b=IWe2CTsbsNpB9gBc+BmqhTG8Wm6KpJQVBk9VE1EfeaQBKmTPyzyjLemjB0ED1VSRo4
         PUx/lWIJ9vYvEOSK0Jv6SIRiHSR7ln3yGCtofwXF2/jImp+fJHMg+NNgsYLRjOQqgjYV
         +gw43Utmr4hMq6MtyuAaX3I7/G9v62C9Geqx66UquA4/+VqFNK8MAocCrLyRZ0h+8aNt
         x5NuscMtQi8ob8Ie5Zz7NhBfmTvtoL5lj+b6AIEY7W7O+VKMaimTuif07kTl95ZoOwBe
         7brqePk+THfaaywxi3GOwaO6w6axX9iLg/wxOYSOZoWgH1VWZ8Cmcu79KtmfA8r2L2sh
         XtUA==
X-Forwarded-Encrypted: i=1; AHgh+Rq3OPonEACYF4dp9TeNEyUe5LzxrbmwDEIjk5zuNJr1yw5aZeZhXnSTOc3wqFYp18N9XL3Lpe+CAA+qrw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyCTkCPAUv8E7XdLh8v9u6V/ivWF43bLdUxGJUS3FxWmvMCim5q
	Npa/ucsTDUmWfz8kMipqKitY9FCk0Us7644JxkMBUlzKKIPFs3uzo3lh4+uXfnk3U4Eo3qC6qMA
	t5D/LU1aspda3jeM80GT95jWedgq9uqgvRV5kwra7IPjgSBw4uWiIdj3jkoSlfq1P
X-Gm-Gg: AfdE7cmieQIoNW0HyIBR0Pm+c0+f1vA+Y8qKKahGF43Nqluo0rt10C1ynYXUnTC3d0d
	QAmn4se0hcZ237Davo0pYqw+Fa3ZhJIWUJc1ZVL6eSB3pqCclDZwj+9cL03TtE1GEvWjELGYtZx
	cZafwnKdYNKVe5xVdOc1j/A4gD5kI7QWl0GjnXalswWOaGd38uS/DfTqOfc0Q+fPoiDNiyFJpXv
	LfcXziEcibuoCgRQbOPuy77yrB44bAu5Jh7u27IUdIWlN/SiIDnnLNmE7gEctnZxNXNsfdedtAw
	bdiz23vL5TDCYWjGmLNx/sb8KOX4QDKw921EcsCskjpF2RBG/E3fAt2MREnOddZcbozFrDuJBhr
	8+wVj9+4IXqwyZjEuXr+WK7knDJ2MRV0g
X-Received: by 2002:a05:6000:469b:b0:46e:624e:3c2f with SMTP id ffacd0b85a97d-477595684ffmr7982454f8f.47.1783032272529;
        Thu, 02 Jul 2026 15:44:32 -0700 (PDT)
X-Received: by 2002:a05:6000:469b:b0:46e:624e:3c2f with SMTP id ffacd0b85a97d-477595684ffmr7982435f8f.47.1783032271940;
        Thu, 02 Jul 2026 15:44:31 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-68-31.inter.net.il. [80.230.68.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477dd94cec5sm12205361f8f.19.2026.07.02.15.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 15:44:31 -0700 (PDT)
Date: Thu, 2 Jul 2026 18:44:28 -0400
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
Message-ID: <20260702183435-mutt-send-email-mst@kernel.org>
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
X-Mimecast-MFC-PROC-ID: -118OsbLzpQIbfwQ0Zqe9Ztz0A6npIIZ3wFR0ShNDmM_1783032273
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


Well, the issue was with host to guest right?
Then testing what does bql do might be interesting.
Might help.
Something like this? Lightly tested.


diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index bfa49fa9e3a1..abc46354c107 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -1076,6 +1076,7 @@ static netdev_tx_t tun_net_xmit(struct sk_buff *skb, struct net_device *dev)
 	queue = netdev_get_tx_queue(dev, txq);
 
 	spin_lock(&tfile->tx_ring.producer_lock);
+	netdev_tx_sent_queue(queue, len);
 	ret = __ptr_ring_produce(&tfile->tx_ring, skb);
 	if (!qdisc_txq_has_no_queue(queue) &&
 	    __ptr_ring_check_produce(&tfile->tx_ring) == -ENOSPC) {
@@ -1088,6 +1089,7 @@ static netdev_tx_t tun_net_xmit(struct sk_buff *skb, struct net_device *dev)
 	spin_unlock(&tfile->tx_ring.producer_lock);
 
 	if (ret) {
+		netdev_tx_completed_queue(queue, 1, len);
 		/* This should be a rare case if a qdisc is present, but
 		 * can happen due to lltx.
 		 * Since skb_tx_timestamp(), skb_orphan(),
@@ -2148,15 +2150,19 @@ static ssize_t tun_put_user(struct tun_struct *tun,
 
 /* Callers must hold ring.consumer_lock */
 static void __tun_wake_queue(struct tun_struct *tun,
-			     struct tun_file *tfile, int consumed)
+			     struct tun_file *tfile,
+			     unsigned int pkts, unsigned int bytes)
 {
 	struct netdev_queue *txq = netdev_get_tx_queue(tun->dev,
 						tfile->queue_index);
 
+	if (bytes)
+		netdev_tx_completed_queue(txq, pkts, bytes);
+
 	/* Paired with smp_mb__after_atomic() in tun_net_xmit() */
 	smp_mb();
 	if (netif_tx_queue_stopped(txq)) {
-		tfile->cons_cnt += consumed;
+		tfile->cons_cnt += pkts;
 		if (tfile->cons_cnt >= tfile->tx_ring.size / 2 ||
 		    __ptr_ring_empty(&tfile->tx_ring)) {
 			netif_tx_wake_queue(txq);
@@ -2167,12 +2173,16 @@ static void __tun_wake_queue(struct tun_struct *tun,
 
 static void *tun_ring_consume(struct tun_struct *tun, struct tun_file *tfile)
 {
+	unsigned int bytes = 0;
 	void *ptr;
 
 	spin_lock(&tfile->tx_ring.consumer_lock);
 	ptr = __ptr_ring_consume(&tfile->tx_ring);
-	if (ptr)
-		__tun_wake_queue(tun, tfile, 1);
+	if (ptr) {
+		if (!tun_is_xdp_frame(ptr))
+			bytes = ((struct sk_buff *)ptr)->len;
+		__tun_wake_queue(tun, tfile, 1, bytes);
+	}
 
 	spin_unlock(&tfile->tx_ring.consumer_lock);
 	return ptr;
@@ -3805,7 +3815,7 @@ struct ptr_ring *tun_get_tx_ring(struct file *file)
 EXPORT_SYMBOL_GPL(tun_get_tx_ring);
 
 /* Callers must hold ring.consumer_lock */
-void tun_wake_queue(struct file *file, int consumed)
+void tun_wake_queue(struct file *file, unsigned int pkts, unsigned int bytes)
 {
 	struct tun_file *tfile;
 	struct tun_struct *tun;
@@ -3821,7 +3831,7 @@ void tun_wake_queue(struct file *file, int consumed)
 
 	tun = rcu_dereference(tfile->tun);
 	if (tun)
-		__tun_wake_queue(tun, tfile, consumed);
+		__tun_wake_queue(tun, tfile, pkts, bytes);
 
 	rcu_read_unlock();
 }
diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
index db341c922673..5267b323bd59 100644
--- a/drivers/vhost/net.c
+++ b/drivers/vhost/net.c
@@ -181,14 +181,23 @@ static int vhost_net_buf_produce(struct sock *sk,
 {
 	struct file *file = sk->sk_socket->file;
 	struct vhost_net_buf *rxq = &nvq->rxq;
+	unsigned int bytes = 0;
+	int i;
 
 	rxq->head = 0;
 	spin_lock(&nvq->rx_ring->consumer_lock);
 	rxq->tail = __ptr_ring_consume_batched(nvq->rx_ring, rxq->queue,
 					       VHOST_NET_BATCH);
 
-	if (rxq->tail)
-		tun_wake_queue(file, rxq->tail);
+	if (rxq->tail) {
+		for (i = 0; i < rxq->tail; i++) {
+			void *ptr = rxq->queue[i];
+
+			if (!tun_is_xdp_frame(ptr))
+				bytes += ((struct sk_buff *)ptr)->len;
+		}
+		tun_wake_queue(file, rxq->tail, bytes);
+	}
 
 	spin_unlock(&nvq->rx_ring->consumer_lock);
 	return rxq->tail;
diff --git a/include/linux/if_tun.h b/include/linux/if_tun.h
index 5f3e206c7a73..49b85bf4f828 100644
--- a/include/linux/if_tun.h
+++ b/include/linux/if_tun.h
@@ -22,7 +22,7 @@ struct tun_msg_ctl {
 #if defined(CONFIG_TUN) || defined(CONFIG_TUN_MODULE)
 struct socket *tun_get_socket(struct file *);
 struct ptr_ring *tun_get_tx_ring(struct file *file);
-void tun_wake_queue(struct file *file, int consumed);
+void tun_wake_queue(struct file *file, unsigned int pkts, unsigned int bytes);
 
 static inline bool tun_is_xdp_frame(void *ptr)
 {
@@ -56,7 +56,8 @@ static inline struct ptr_ring *tun_get_tx_ring(struct file *f)
 	return ERR_PTR(-EINVAL);
 }
 
-static inline void tun_wake_queue(struct file *f, int consumed) {}
+static inline void tun_wake_queue(struct file *f,
+				  unsigned int pkts, unsigned int bytes) {}
 
 static inline bool tun_is_xdp_frame(void *ptr)
 {


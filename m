Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A143A2F4A1E;
	Wed,  2 Jul 2025 14:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751466194; cv=none; b=QpyyR3/GKXIJfghW1K04Ymkk60BZYYIj7tiIMNCfquXxSoxy6vQCaBCaOvWd04Yb74BlKHhrWVH/TF/UGe9SG4okmzHdpwNas0TGSWr6bbMFPFokr2qNdBMR4VDsby+/CCkbGKaftcoZOys7vKJlxJbhlh7QQC6cOOTZmMwNlzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751466194; c=relaxed/simple;
	bh=wRFf8vMwoZ9yxRK+smDOpWTC0gIgXGemCjYAYDJYOO8=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=UtXOyn9yDfm3PwNiWFy9RBiVm6pOFrKGmU+UgSb/Gna50C5em9848/I2LjGVSZeTibhDLbIZ/BUqpSHkGzHV5LTibHMawo8ONt37P3b1ezV9dyDF4amW1dUzOME3nSZ/iJNwAjp9XGgEjFOdAyWv/cTeY6ygt4hoy8AatJTdVaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=R53wrrbH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="R53wrrbH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DC91C4CEE7;
	Wed,  2 Jul 2025 14:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751466194;
	bh=wRFf8vMwoZ9yxRK+smDOpWTC0gIgXGemCjYAYDJYOO8=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=R53wrrbHiF8MzScHH7rk+xDj+3h5TEnAIH/rcwp98ALegPNfz9nMUex83B6fN+UdP
	 PD8UV5SCsADDYAGrehWF3NGDmmAIHNGAxT77enywVzvHJv+ZMbLQBLqdOwq5ytyIHR
	 V7Cp9tNtuIs5ipeOQQ06zhZTEuh/EN/RISVsLMCU=
Subject: Patch "Revert "ipv6: save dontfrag in cork"" has been added to the 5.15-stable tree
To: bacs@librecast.net,gregkh@linuxfoundation.org,regressions@lists.linux.dev,willemb@google.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Wed, 02 Jul 2025 16:23:11 +0200
In-Reply-To: <20250702113849.2401-2-bacs@librecast.net>
Message-ID: <2025070211-specks-fancy-1b6e@gregkh>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 


This is a note to let you know that I've just added the patch titled

    Revert "ipv6: save dontfrag in cork"

to the 5.15-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     revert-ipv6-save-dontfrag-in-cork.patch
and it can be found in the queue-5.15 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From bacs@librecast.net  Wed Jul  2 16:21:40 2025
From: Brett A C Sheffield <bacs@librecast.net>
Date: Wed,  2 Jul 2025 13:38:50 +0200
Subject: Revert "ipv6: save dontfrag in cork"
To: gregkh@linuxfoundation.org
Cc: regressions@lists.linux.dev, stable@vger.kernel.org, willemb@google.com, Brett A C Sheffield <bacs@librecast.net>
Message-ID: <20250702113849.2401-2-bacs@librecast.net>


From: Brett A C Sheffield (Librecast) <bacs@librecast.net>

This reverts commit 2b572c40981138349c04b3f69220ac878a36c561 which is
commit a18dfa9925b9ef6107ea3aa5814ca3c704d34a8a upstream.

A regression was introduced when backporting this to the stable kernels
without applying previous commits in this series.

When sending IPv6 UDP packets larger than MTU, EMSGSIZE was returned
instead of fragmenting the packets as expected.

As there is no compelling reason for this commit to be present in the
stable kernels it should be reverted.

Signed-off-by: Brett A C Sheffield <bacs@librecast.net>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 include/linux/ipv6.h  |    1 -
 net/ipv6/ip6_output.c |    9 ++++-----
 2 files changed, 4 insertions(+), 6 deletions(-)

--- a/include/linux/ipv6.h
+++ b/include/linux/ipv6.h
@@ -195,7 +195,6 @@ struct inet6_cork {
 	struct ipv6_txoptions *opt;
 	u8 hop_limit;
 	u8 tclass;
-	u8 dontfrag:1;
 };
 
 /**
--- a/net/ipv6/ip6_output.c
+++ b/net/ipv6/ip6_output.c
@@ -1428,7 +1428,6 @@ static int ip6_setup_cork(struct sock *s
 	cork->fl.u.ip6 = *fl6;
 	v6_cork->hop_limit = ipc6->hlimit;
 	v6_cork->tclass = ipc6->tclass;
-	v6_cork->dontfrag = ipc6->dontfrag;
 	if (rt->dst.flags & DST_XFRM_TUNNEL)
 		mtu = np->pmtudisc >= IPV6_PMTUDISC_PROBE ?
 		      READ_ONCE(rt->dst.dev->mtu) : dst_mtu(&rt->dst);
@@ -1463,7 +1462,7 @@ static int __ip6_append_data(struct sock
 			     int getfrag(void *from, char *to, int offset,
 					 int len, int odd, struct sk_buff *skb),
 			     void *from, size_t length, int transhdrlen,
-			     unsigned int flags)
+			     unsigned int flags, struct ipcm6_cookie *ipc6)
 {
 	struct sk_buff *skb, *skb_prev = NULL;
 	unsigned int maxfraglen, fragheaderlen, mtu, orig_mtu, pmtu;
@@ -1520,7 +1519,7 @@ static int __ip6_append_data(struct sock
 	if (headersize + transhdrlen > mtu)
 		goto emsgsize;
 
-	if (cork->length + length > mtu - headersize && v6_cork->dontfrag &&
+	if (cork->length + length > mtu - headersize && ipc6->dontfrag &&
 	    (sk->sk_protocol == IPPROTO_UDP ||
 	     sk->sk_protocol == IPPROTO_RAW)) {
 		ipv6_local_rxpmtu(sk, fl6, mtu - headersize +
@@ -1837,7 +1836,7 @@ int ip6_append_data(struct sock *sk,
 
 	return __ip6_append_data(sk, fl6, &sk->sk_write_queue, &inet->cork.base,
 				 &np->cork, sk_page_frag(sk), getfrag,
-				 from, length, transhdrlen, flags);
+				 from, length, transhdrlen, flags, ipc6);
 }
 EXPORT_SYMBOL_GPL(ip6_append_data);
 
@@ -2032,7 +2031,7 @@ struct sk_buff *ip6_make_skb(struct sock
 	err = __ip6_append_data(sk, fl6, &queue, &cork->base, &v6_cork,
 				&current->task_frag, getfrag, from,
 				length + exthdrlen, transhdrlen + exthdrlen,
-				flags);
+				flags, ipc6);
 	if (err) {
 		__ip6_flush_pending_frames(sk, &queue, cork, &v6_cork);
 		return ERR_PTR(err);


Patches currently in stable-queue which might be from bacs@librecast.net are

queue-5.15/revert-ipv6-save-dontfrag-in-cork.patch

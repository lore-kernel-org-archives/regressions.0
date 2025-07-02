Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77834229B13;
	Wed,  2 Jul 2025 14:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751466166; cv=none; b=oUCe7t1p/M18nWXpIrOcnTSEUmjqIItNjz6Dgfji8yVfzjgO/KsjgPPH75+XNbFFDQaRhVYh5/Dr6jdDzvVDE0Zioz4rIfP8jVPEq59BbXvecCLsGp9eBCx3nq3cWD+1xbiOa3Gy4zUSbIm74FF/sNgRaR9HHum4+i70k8FMw3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751466166; c=relaxed/simple;
	bh=xujLjujkpHOGOxBN3fN6E9WlBKMSKUVtNy3aMxqDTiU=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=makGWtj7UKzaVngtf/bRDquc1vZeQi4I+Q0NHFSJXmb9qlsdmWq2CUK4uFB++HZiKaMIdlUFQUSnTmNm0+Jy3SUoxAG6DhOg8m1FEmfgoF9QXccFiuQ6guysZGXKfAaA80w0rPGWRHxpha3FoRLA/y5CNCua5jDD9TMJSu3D4HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=slUosEy4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="slUosEy4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7952C4CEE7;
	Wed,  2 Jul 2025 14:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751466166;
	bh=xujLjujkpHOGOxBN3fN6E9WlBKMSKUVtNy3aMxqDTiU=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=slUosEy4fdw/2PCsiACxOAbtSF2qnboYoY3yN60aXa4MwWMr/BkKgrNZLGlCGWdfd
	 7ZOGYlhCaafgwKUhPX+1XmLt3U/eJpU4/82hetfPN0Kf4sfhefNpj/gY7THdvYPX6v
	 KKxjcycKCif0zspmJT6UcL22Rm7/wHcW2AbwfCvU=
Subject: Patch "Revert "ipv6: save dontfrag in cork"" has been added to the 5.10-stable tree
To: bacs@librecast.net,gregkh@linuxfoundation.org,regressions@lists.linux.dev,willemb@google.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Wed, 02 Jul 2025 16:22:42 +0200
In-Reply-To: <20250702114113.2512-2-bacs@librecast.net>
Message-ID: <2025070242-qualifier-upheaval-7ec9@gregkh>
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

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     revert-ipv6-save-dontfrag-in-cork.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From bacs@librecast.net  Wed Jul  2 16:21:59 2025
From: Brett A C Sheffield <bacs@librecast.net>
Date: Wed,  2 Jul 2025 13:41:14 +0200
Subject: Revert "ipv6: save dontfrag in cork"
To: gregkh@linuxfoundation.org
Cc: regressions@lists.linux.dev, stable@vger.kernel.org, willemb@google.com, Brett A C Sheffield <bacs@librecast.net>
Message-ID: <20250702114113.2512-2-bacs@librecast.net>


From: Brett A C Sheffield (Librecast) <bacs@librecast.net>

This reverts commit 29533d1a54b8de5aaf8c4aa6790dc67d5c14fba5 which is
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
@@ -189,7 +189,6 @@ struct inet6_cork {
 	struct ipv6_txoptions *opt;
 	u8 hop_limit;
 	u8 tclass;
-	u8 dontfrag:1;
 };
 
 /**
--- a/net/ipv6/ip6_output.c
+++ b/net/ipv6/ip6_output.c
@@ -1416,7 +1416,6 @@ static int ip6_setup_cork(struct sock *s
 	cork->fl.u.ip6 = *fl6;
 	v6_cork->hop_limit = ipc6->hlimit;
 	v6_cork->tclass = ipc6->tclass;
-	v6_cork->dontfrag = ipc6->dontfrag;
 	if (rt->dst.flags & DST_XFRM_TUNNEL)
 		mtu = np->pmtudisc >= IPV6_PMTUDISC_PROBE ?
 		      READ_ONCE(rt->dst.dev->mtu) : dst_mtu(&rt->dst);
@@ -1451,7 +1450,7 @@ static int __ip6_append_data(struct sock
 			     int getfrag(void *from, char *to, int offset,
 					 int len, int odd, struct sk_buff *skb),
 			     void *from, size_t length, int transhdrlen,
-			     unsigned int flags)
+			     unsigned int flags, struct ipcm6_cookie *ipc6)
 {
 	struct sk_buff *skb, *skb_prev = NULL;
 	unsigned int maxfraglen, fragheaderlen, mtu, orig_mtu, pmtu;
@@ -1508,7 +1507,7 @@ static int __ip6_append_data(struct sock
 	if (headersize + transhdrlen > mtu)
 		goto emsgsize;
 
-	if (cork->length + length > mtu - headersize && v6_cork->dontfrag &&
+	if (cork->length + length > mtu - headersize && ipc6->dontfrag &&
 	    (sk->sk_protocol == IPPROTO_UDP ||
 	     sk->sk_protocol == IPPROTO_RAW)) {
 		ipv6_local_rxpmtu(sk, fl6, mtu - headersize +
@@ -1826,7 +1825,7 @@ int ip6_append_data(struct sock *sk,
 
 	return __ip6_append_data(sk, fl6, &sk->sk_write_queue, &inet->cork.base,
 				 &np->cork, sk_page_frag(sk), getfrag,
-				 from, length, transhdrlen, flags);
+				 from, length, transhdrlen, flags, ipc6);
 }
 EXPORT_SYMBOL_GPL(ip6_append_data);
 
@@ -2021,7 +2020,7 @@ struct sk_buff *ip6_make_skb(struct sock
 	err = __ip6_append_data(sk, fl6, &queue, &cork->base, &v6_cork,
 				&current->task_frag, getfrag, from,
 				length + exthdrlen, transhdrlen + exthdrlen,
-				flags);
+				flags, ipc6);
 	if (err) {
 		__ip6_flush_pending_frames(sk, &queue, cork, &v6_cork);
 		return ERR_PTR(err);


Patches currently in stable-queue which might be from bacs@librecast.net are

queue-5.10/revert-ipv6-save-dontfrag-in-cork.patch

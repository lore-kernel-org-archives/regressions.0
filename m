Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D48C2F4A1E;
	Wed,  2 Jul 2025 14:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751466222; cv=none; b=iqs05x0Qtkt0FFrmJhJZL7zKvxj4o2XQ2QocntvaFbsw2aY0TPv3rJHvbP5OSjK3S+ujjD+3qgFZ39CXdGeRV8ff0DlgrMWVCsx4nQcmeaMEnMLYrApJvfr46E7Tg3he21r8C8OOG8Rj0z1i4buX3+ddIehFUxApIx2RDlonEe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751466222; c=relaxed/simple;
	bh=9FemjpaTqLuSdN1CrIzgjRpE94SkV2iBWBurVjjK4O4=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=VYVMENSfNcR9fDJdN/aw0sMFqXNGUQb444JhkBNK7FMwOdgkftwfdYOTGORwiQuYWy6/IkbHYtUT4ZddTfO3P7qsndnA+EYbDe9XJasoNZriceyvxsVkRXBvuoESki9ScZ5HkUo2emdlqT+Nbbm7bF8MkfmpfzdQUCf8SfGIVnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WFinePNt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WFinePNt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6125AC4CEE7;
	Wed,  2 Jul 2025 14:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751466221;
	bh=9FemjpaTqLuSdN1CrIzgjRpE94SkV2iBWBurVjjK4O4=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=WFinePNtGRwbv2TtB/gvkFKE3JM+dczq1KMrog1ERyCWIR0kB5I8m5O2ybtXgSn3S
	 pVbLxoVw58wg0zKEgWRiSurzITLaLGhFHBuQCw+kJ1c45IsFXX+2poQ6Xh7mKVUEFM
	 JzTY9snj4PiNeW5f0AHWtPvpPJxkmLGTlG09oOZI=
Subject: Patch "Revert "ipv6: save dontfrag in cork"" has been added to the 6.6-stable tree
To: bacs@librecast.net,gregkh@linuxfoundation.org,regressions@lists.linux.dev,willemb@google.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Wed, 02 Jul 2025 16:23:38 +0200
In-Reply-To: <20250702113731.2322-2-bacs@librecast.net>
Message-ID: <2025070238-rake-gutter-96aa@gregkh>
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

to the 6.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     revert-ipv6-save-dontfrag-in-cork.patch
and it can be found in the queue-6.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From bacs@librecast.net  Wed Jul  2 16:20:41 2025
From: Brett A C Sheffield <bacs@librecast.net>
Date: Wed,  2 Jul 2025 13:37:32 +0200
Subject: Revert "ipv6: save dontfrag in cork"
To: gregkh@linuxfoundation.org
Cc: regressions@lists.linux.dev, stable@vger.kernel.org, willemb@google.com, Brett A C Sheffield <bacs@librecast.net>
Message-ID: <20250702113731.2322-2-bacs@librecast.net>


From: Brett A C Sheffield (Librecast) <bacs@librecast.net>

This reverts commit 8ebf2709fe4dcd0a1b7b95bf61e529ddcd3cdf51 which is
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
@@ -199,7 +199,6 @@ struct inet6_cork {
 	struct ipv6_txoptions *opt;
 	u8 hop_limit;
 	u8 tclass;
-	u8 dontfrag:1;
 };
 
 /* struct ipv6_pinfo - ipv6 private area */
--- a/net/ipv6/ip6_output.c
+++ b/net/ipv6/ip6_output.c
@@ -1452,7 +1452,6 @@ static int ip6_setup_cork(struct sock *s
 	}
 	v6_cork->hop_limit = ipc6->hlimit;
 	v6_cork->tclass = ipc6->tclass;
-	v6_cork->dontfrag = ipc6->dontfrag;
 	if (rt->dst.flags & DST_XFRM_TUNNEL)
 		mtu = np->pmtudisc >= IPV6_PMTUDISC_PROBE ?
 		      READ_ONCE(rt->dst.dev->mtu) : dst_mtu(&rt->dst);
@@ -1486,7 +1485,7 @@ static int __ip6_append_data(struct sock
 			     int getfrag(void *from, char *to, int offset,
 					 int len, int odd, struct sk_buff *skb),
 			     void *from, size_t length, int transhdrlen,
-			     unsigned int flags)
+			     unsigned int flags, struct ipcm6_cookie *ipc6)
 {
 	struct sk_buff *skb, *skb_prev = NULL;
 	struct inet_cork *cork = &cork_full->base;
@@ -1542,7 +1541,7 @@ static int __ip6_append_data(struct sock
 	if (headersize + transhdrlen > mtu)
 		goto emsgsize;
 
-	if (cork->length + length > mtu - headersize && v6_cork->dontfrag &&
+	if (cork->length + length > mtu - headersize && ipc6->dontfrag &&
 	    (sk->sk_protocol == IPPROTO_UDP ||
 	     sk->sk_protocol == IPPROTO_ICMPV6 ||
 	     sk->sk_protocol == IPPROTO_RAW)) {
@@ -1914,7 +1913,7 @@ int ip6_append_data(struct sock *sk,
 
 	return __ip6_append_data(sk, &sk->sk_write_queue, &inet->cork,
 				 &np->cork, sk_page_frag(sk), getfrag,
-				 from, length, transhdrlen, flags);
+				 from, length, transhdrlen, flags, ipc6);
 }
 EXPORT_SYMBOL_GPL(ip6_append_data);
 
@@ -2119,7 +2118,7 @@ struct sk_buff *ip6_make_skb(struct sock
 	err = __ip6_append_data(sk, &queue, cork, &v6_cork,
 				&current->task_frag, getfrag, from,
 				length + exthdrlen, transhdrlen + exthdrlen,
-				flags);
+				flags, ipc6);
 	if (err) {
 		__ip6_flush_pending_frames(sk, &queue, cork, &v6_cork);
 		return ERR_PTR(err);


Patches currently in stable-queue which might be from bacs@librecast.net are

queue-6.6/revert-ipv6-save-dontfrag-in-cork.patch

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D128B6ABD
	for <regressions@lists.linux.dev>; Fri, 17 Feb 2023 14:26:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27EFFC433EF;
	Fri, 17 Feb 2023 14:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1676643982;
	bh=vETSbfaGkUw1h7Lh16tXPMaRRqS2eBm7YgpEdwClYBM=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=kT4FPKnnUE+bqcCTNrYzsVDjHLbiWgslBeUizext/kUiw2ZpF1IRyqtEJPlWRPUTg
	 9J6d0b6go8+21olxCH8nELmy9mvqjXaW9Pt8g4GDIiTVUNciMbRQwTcco6WQ5heomS
	 hNLHdZ6v5QFPmR4k1tRr2ZokSOnZPBLXXScpZJ+4=
Subject: Patch "tcp: Fix listen() regression in 5.15.88." has been added to the 5.15-stable tree
To: EF8A45D0-768A-4CD5-9A8A-0FA6E610ABF7@winter.cafe,gregkh@linuxfoundation.org,kuniyu@amazon.com,regressions@lists.linux.dev,w@1wt.eu,winter@winter.cafe
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Fri, 17 Feb 2023 15:25:18 +0100
In-Reply-To: <20230213205835.56151-1-kuniyu@amazon.com>
Message-ID: <1676643918250202@kroah.com>
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

    tcp: Fix listen() regression in 5.15.88.

to the 5.15-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     tcp-fix-listen-regression-in-5.15.88.patch
and it can be found in the queue-5.15 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From kuniyu@amazon.com  Fri Feb 17 15:21:48 2023
From: Kuniyuki Iwashima <kuniyu@amazon.com>
Date: Mon, 13 Feb 2023 20:45:48 +0000
Subject: tcp: Fix listen() regression in 5.15.88.
To: <gregkh@linuxfoundation.org>
Cc: <kuniyu@amazon.com>, <netdev@vger.kernel.org>, <regressions@lists.linux.dev>, <stable@vger.kernel.org>, <w@1wt.eu>, <winter@winter.cafe>
Message-ID: <20230213205835.56151-1-kuniyu@amazon.com>

From: Kuniyuki Iwashima <kuniyu@amazon.com>

When we backport dadd0dcaa67d ("net/ulp: prevent ULP without clone op from
entering the LISTEN status"), we have accidentally backported a part of
7a7160edf1bf ("net: Return errno in sk->sk_prot->get_port().") and removed
err = -EADDRINUSE in inet_csk_listen_start().

Thus, listen() no longer returns -EADDRINUSE even if ->get_port() failed
as reported in [0].

We set -EADDRINUSE to err just before ->get_port() to fix the regression.

[0]: https://lore.kernel.org/stable/EF8A45D0-768A-4CD5-9A8A-0FA6E610ABF7@winter.cafe/

Reported-by: Winter <winter@winter.cafe>
Signed-off-by: Kuniyuki Iwashima <kuniyu@amazon.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 net/ipv4/inet_connection_sock.c |    1 +
 1 file changed, 1 insertion(+)

--- a/net/ipv4/inet_connection_sock.c
+++ b/net/ipv4/inet_connection_sock.c
@@ -1070,6 +1070,7 @@ int inet_csk_listen_start(struct sock *s
 	 * It is OK, because this socket enters to hash table only
 	 * after validation is complete.
 	 */
+	err = -EADDRINUSE;
 	inet_sk_state_store(sk, TCP_LISTEN);
 	if (!sk->sk_prot->get_port(sk, inet->inet_num)) {
 		inet->inet_sport = htons(inet->inet_num);


Patches currently in stable-queue which might be from kuniyu@amazon.com are

queue-5.15/net-rose-fix-to-not-accept-on-connected-socket.patch
queue-5.15/tcp-fix-listen-regression-in-5.15.88.patch

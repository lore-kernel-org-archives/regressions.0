Received: from haven.bi-co.net (haven.bi-co.net [37.200.99.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12E312A14C
	for <regressions@lists.linux.dev>; Wed, 31 Jan 2024 15:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.200.99.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706716363; cv=none; b=lfdjUhFlO+oao6+sWJECYB4lnVIxwsk1NJ0pXbVzRrxtVDDISDImbTzN95uFS53nfCYZy/a7CLoPe/CAUXJ6Eewul0u80aa2Onp6e3NkyBGTL6oSV7Vn0qPW3SQxpTa1jvZuQB9Jg6NkJ1b+XvwbEsTt7Won6nwsMQkoDj1gieM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706716363; c=relaxed/simple;
	bh=GyS6q6H2fs1wNwq2b3HeOM5li7TSUnmbnd5bd5Tn8n0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QSCKSGxdtgcC1jW1+Aq4VBYF+jmq+9oylrOWGTqb+iHzqVTlIuox6JsS+yVuBXFTwZE+uD+1dkIR/RBgszm0LFd60OFCuyo9R8vJ3Sy4VwlKxWrHdSV53uoJoqUb6818musrIO5N6zY9u1CJMjYIroYqNHtwfa73CNt0p7M1EoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bi-co.net; spf=pass smtp.mailfrom=bi-co.net; arc=none smtp.client-ip=37.200.99.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bi-co.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bi-co.net
Received: from zenpad.fritz.box (ip-037-201-146-158.um10.pools.vodafone-ip.de [37.201.146.158])
	by haven.bi-co.net (Postfix) with ESMTPSA id 8B3852006D;
	Wed, 31 Jan 2024 16:52:38 +0100 (CET)
From: Michael Lass <bevan@bi-co.net>
To: netdev@vger.kernel.org
Cc: David Howells <dhowells@redhat.com>,
	regressions@lists.linux.dev
Subject: [PATCH] net: Fix from address in memcpy_to_iter_csum()
Date: Wed, 31 Jan 2024 16:52:20 +0100
Message-ID: <20240131155220.82641-1-bevan@bi-co.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While inlining csum_and_memcpy() into memcpy_to_iter_csum(), the from
address passed to csum_partial_copy_nocheck() was accidentally changed.
This causes a regression in applications using UDP, as for example
OpenAFS, causing loss of datagrams.

Fixes: dc32bff195b4 ("iov_iter, net: Fold in csum_and_memcpy()")
Cc: David Howells <dhowells@redhat.com>
Cc: stable@vger.kernel.org
Cc: regressions@lists.linux.dev
Signed-off-by: Michael Lass <bevan@bi-co.net>
---
 net/core/datagram.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/core/datagram.c b/net/core/datagram.c
index 103d46fa0eeb..a8b625abe242 100644
--- a/net/core/datagram.c
+++ b/net/core/datagram.c
@@ -751,7 +751,7 @@ size_t memcpy_to_iter_csum(void *iter_to, size_t progress,
 			   size_t len, void *from, void *priv2)
 {
 	__wsum *csum = priv2;
-	__wsum next = csum_partial_copy_nocheck(from, iter_to, len);
+	__wsum next = csum_partial_copy_nocheck(from + progress, iter_to, len);
 
 	*csum = csum_block_add(*csum, next, progress);
 	return 0;
-- 
2.43.0


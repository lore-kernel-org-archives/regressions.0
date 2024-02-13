Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D193F5D91C;
	Tue, 13 Feb 2024 16:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707840990; cv=none; b=Iqf6FhKvwXm0VdsQCIpntuDDHS1SjmalOpt6rt6seM0KipadFVfcTNpRi53w1Yz4V79OBh/A/A3EPFy4iRHY8PBriQtxeCuAO8ktSO6YhsCWzxgEXAP7D6WLG5RCDaF7SeCwq9NEb4/Ox1BS4V7wXUa2D9p2FltIDpYU/bQAvek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707840990; c=relaxed/simple;
	bh=aDfcC0c2fEwxFlZz3qnQvW4FWiuHFhhXOXHq2n0HXYQ=;
	h=Subject:To:Cc:From:Date:Message-ID:MIME-Version:Content-Type; b=Tzb+iqm49jYl9qA/ukFhlw+6bYpUb7gOXYWc62fXq3w4Bx4jcS8E0U4K3uqEXW7hAfLDH1K5gHdKhp+xeBKUJCsQcYCmUGFIFavh3uOemJQjsuj+MwnrQ5KgbjkPbleMOWn/+fnbHXHSy5nMpn2uc81iw936GFVbtpDW44ZnIEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZSa2QvKm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZSa2QvKm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1031C433F1;
	Tue, 13 Feb 2024 16:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707840990;
	bh=aDfcC0c2fEwxFlZz3qnQvW4FWiuHFhhXOXHq2n0HXYQ=;
	h=Subject:To:Cc:From:Date:From;
	b=ZSa2QvKmikzYCyWi6j4Bqg2H06kXNfU1ta+5oAXVrCi0AM8fzeTUUhaNA3m30lI1z
	 EEDo2941MvOQOm3nIBSm0fP1FKKpkhlZzC7ZFnI28yF7yohH4Yy518CRCvRH1GpGei
	 NP4RDKpkFYzv7jG1XQdSxHf0yYn5ZFr3LXPiwU+M=
Subject: Patch "net: Fix from address in memcpy_to_iter_csum()" has been added to the 6.7-stable tree
To: bevan@bi-co.net,davem@davemloft.net,dhowells@redhat.com,gregkh@linuxfoundation.org,jaltman@auristor.com,regressions@lists.linux.dev
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 13 Feb 2024 17:16:27 +0100
Message-ID: <2024021327-contrite-skimmer-f95c@gregkh>
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

    net: Fix from address in memcpy_to_iter_csum()

to the 6.7-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     net-fix-from-address-in-memcpy_to_iter_csum.patch
and it can be found in the queue-6.7 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From fe92f874f09145a6951deacaa4961390238bbe0d Mon Sep 17 00:00:00 2001
From: Michael Lass <bevan@bi-co.net>
Date: Wed, 31 Jan 2024 16:52:20 +0100
Subject: net: Fix from address in memcpy_to_iter_csum()

From: Michael Lass <bevan@bi-co.net>

commit fe92f874f09145a6951deacaa4961390238bbe0d upstream.

While inlining csum_and_memcpy() into memcpy_to_iter_csum(), the from
address passed to csum_partial_copy_nocheck() was accidentally changed.
This causes a regression in applications using UDP, as for example
OpenAFS, causing loss of datagrams.

Fixes: dc32bff195b4 ("iov_iter, net: Fold in csum_and_memcpy()")
Cc: David Howells <dhowells@redhat.com>
Cc: stable@vger.kernel.org
Cc: regressions@lists.linux.dev
Signed-off-by: Michael Lass <bevan@bi-co.net>
Reviewed-by: Jeffrey Altman <jaltman@auristor.com>
Acked-by: David Howells <dhowells@redhat.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 net/core/datagram.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/net/core/datagram.c
+++ b/net/core/datagram.c
@@ -751,7 +751,7 @@ size_t memcpy_to_iter_csum(void *iter_to
 			   size_t len, void *from, void *priv2)
 {
 	__wsum *csum = priv2;
-	__wsum next = csum_partial_copy_nocheck(from, iter_to, len);
+	__wsum next = csum_partial_copy_nocheck(from + progress, iter_to, len);
 
 	*csum = csum_block_add(*csum, next, progress);
 	return 0;


Patches currently in stable-queue which might be from bevan@bi-co.net are

queue-6.7/net-fix-from-address-in-memcpy_to_iter_csum.patch

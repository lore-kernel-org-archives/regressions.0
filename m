Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D648473
	for <regressions@lists.linux.dev>; Sat,  7 Oct 2023 12:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1TaZFxI5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D68C433C9;
	Sat,  7 Oct 2023 12:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696682690;
	bh=dOLMWZhLspqpnCKzPz5lit3mVOxVEHH34jKw8saXn1s=;
	h=Subject:To:Cc:From:Date:From;
	b=1TaZFxI5537A3S4zY9ATjPUEXE95BbclolSR67KK/IJVj2lg7iXNypUGwXrLGfD2R
	 oWsJoDRbBYD/PP8pP1hcfRyGUe7jmJwEDEGWJrKCjBM4ooWwm0lVmfusl3bHXEuqdh
	 uPOsjERvmHbwxcLaeOQ7RV8y2ZQMKyF33nYqq59g=
Subject: Patch "iommu/apple-dart: Handle DMA_FQ domains in attach_dev()" has been added to the 6.5-stable tree
To: gregkh@linuxfoundation.org,jgg@nvidia.com,jroedel@suse.de,marcan@marcan.st,neal@gompa.dev,regressions@lists.linux.dev,robin.murphy@arm.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Sat, 07 Oct 2023 14:44:07 +0200
Message-ID: <2023100706-squealing-overdrawn-e832@gregkh>
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

    iommu/apple-dart: Handle DMA_FQ domains in attach_dev()

to the 6.5-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     iommu-apple-dart-handle-dma_fq-domains-in-attach_dev.patch
and it can be found in the queue-6.5 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From c7bd8a1f45bada7725d11266df7fd5cb549b3098 Mon Sep 17 00:00:00 2001
From: Hector Martin <marcan@marcan.st>
Date: Fri, 22 Sep 2023 23:55:23 +0900
Subject: iommu/apple-dart: Handle DMA_FQ domains in attach_dev()

From: Hector Martin <marcan@marcan.st>

commit c7bd8a1f45bada7725d11266df7fd5cb549b3098 upstream.

Commit a4fdd9762272 ("iommu: Use flush queue capability") hid the
IOMMU_DOMAIN_DMA_FQ domain type from domain allocation. A check was
introduced in iommu_dma_init_domain() to fall back if not supported, but
this check runs too late: by that point, devices have been attached to
the IOMMU, and apple-dart's attach_dev() callback does not expect
IOMMU_DOMAIN_DMA_FQ domains.

Change the logic so the IOMMU_DOMAIN_DMA codepath is the default,
instead of explicitly enumerating all types.

Fixes an apple-dart regression in v6.5.

Cc: regressions@lists.linux.dev
Cc: stable@vger.kernel.org
Suggested-by: Robin Murphy <robin.murphy@arm.com>
Fixes: a4fdd9762272 ("iommu: Use flush queue capability")
Signed-off-by: Hector Martin <marcan@marcan.st>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Link: https://lore.kernel.org/r/20230922-iommu-type-regression-v2-1-689b2ba9b673@marcan.st
Signed-off-by: Joerg Roedel <jroedel@suse.de>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/iommu/apple-dart.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index 2082081402d3..0b8927508427 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -671,8 +671,7 @@ static int apple_dart_attach_dev(struct iommu_domain *domain,
 		return ret;
 
 	switch (domain->type) {
-	case IOMMU_DOMAIN_DMA:
-	case IOMMU_DOMAIN_UNMANAGED:
+	default:
 		ret = apple_dart_domain_add_streams(dart_domain, cfg);
 		if (ret)
 			return ret;
-- 
2.42.0



Patches currently in stable-queue which might be from marcan@marcan.st are

queue-6.5/iommu-apple-dart-handle-dma_fq-domains-in-attach_dev.patch

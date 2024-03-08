Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9829823753
	for <regressions@lists.linux.dev>; Fri,  8 Mar 2024 01:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709860348; cv=none; b=bXjjjYJV0HS+WVsIee89FTa5i+WI7Tpa/1temHxIcIB2R/tA065oE+5Q3DNfHv+ZcWYmyIfm7NrbOzc1d0jXbTiphY1ddxPH2xjViS+E+kWlgAfp5iVgXwPA4AaVydBJP15xY+8CNWlnRsWYftR4O4Ok0qTfCNPDjPwUqZ3Qbio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709860348; c=relaxed/simple;
	bh=sA5YotOtX3AcvjjrYf5fHrYUORIzots7hTq07UQbKVI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f3Y4/lvJO+nluz5GD6eSoOHJ7ZNPQHZUIODAAgM9Ydl4z/YwDtECwDetYd2T4iXrjrJ7kPZ9J2v60z6MvS3MGHa18Jjgd7dsLH+L/f7VG4iPGMx8TNrDBCCXO9EleVOcpk5S0V0i7ozvUqAhBUVEn+krQiD0ik46oFa8+3V2mU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AFSDSglC; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AFSDSglC"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33d38c9ca5bso916504f8f.2
        for <regressions@lists.linux.dev>; Thu, 07 Mar 2024 17:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709860345; x=1710465145; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Owx6jt72g5QT/V0uQHGstO9uCqzU46h0v31gh/DzxSw=;
        b=AFSDSglCgy+p+AC1MQuBqWoVnkAGSKUzrFe0pAUxRJxH8NfMtqAxM9q5f41XoIgzbg
         EBsDBzdnGjRbdqPhV18yvJu4acpCD6vOqwcUi6+63tIVkW1j6uw5tSCB234EqTvSBUpn
         jUl6FCvKIK9sg0f34LlitBXy3MjQ26klxPhVuw6+6vXpYGw7luKslM/nYEEGZIbU2WMh
         qakhn/flpNp5lffjywEkV8GHsHgluDgVsDFQw4v+Web0qkqLjo/7fguk6kKde4N/SJpR
         ErzMzevPCGjcFpZOHVgRaOPD5QEKyueBig5f4Wpupd1bgTkxdLPqzOkmFwAWjAgsH8gE
         qtug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709860345; x=1710465145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Owx6jt72g5QT/V0uQHGstO9uCqzU46h0v31gh/DzxSw=;
        b=X8oeYae+kTQKaBVwp5XlM51jStsD0QYBWQu9LETEClKivCOCRXbyHPA7raiMyptum/
         YOr2w+OvhctqUaNIxM6Vkaa/umUIzaCxBNmM8qimu5hIL0Fhpr+vryqHUZfqI69KSxZC
         p2DzCRIpCRd0UX+50Qx4V2l7/fKlZ0q5mvgyiASymIQ1Pf66h4OYRn3Zpr+gZcIVoYeN
         fSmHs6Ote1+JHQuR2WICy/0H6ixySgxAplJ9BHXW8Vs+67oiinqLf13JxKt4QjL6VLT1
         kLukHFfhgiOFBp98R231KdRgRyJulLbvAec7sGoPOTQKiFsWlTYNNneAvhEUYDqGH6mw
         Q9CA==
X-Forwarded-Encrypted: i=1; AJvYcCX0H10qRHH4qNnvTy3nNUW/QxnjPY84uUnIpZdvAbIrZRNkItA1MzqIjDeogdrQr4gEwM5pWaEYslMy1765qYhs0ae8IXtijqStIus=
X-Gm-Message-State: AOJu0Yw6wyAiqRresn846Zoy73OxSz7BGaKGehs6pITwe1q+c82xtwzy
	mIaNdErjaMlJhAsVO9uXtEfsbGV2P9id2VLX5Y0u+GUBzOkj8TJPKcrIt+wrx1vPpKTxe5U=
X-Google-Smtp-Source: AGHT+IGyFK85fLcK62sC298qj//c9CgMsC5e3P8Va0z/mRDqMFtCe0XGX8iOSmZnzWnJeMlfMP112A==
X-Received: by 2002:a5d:554d:0:b0:33e:6760:6def with SMTP id g13-20020a5d554d000000b0033e67606defmr2195331wrw.56.1709860344707;
        Thu, 07 Mar 2024 17:12:24 -0800 (PST)
Received: from localhost (ec2-18-169-47-158.eu-west-2.compute.amazonaws.com. [18.169.47.158])
        by smtp.gmail.com with ESMTPSA id f14-20020a5d50ce000000b0033b66c2d61esm21450770wrt.48.2024.03.07.17.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 17:12:24 -0800 (PST)
From: Alex Constantino <dreaming.about.electric.sheep@gmail.com>
To: regressions@leemhuis.info
Cc: 1054514@bugs.debian.org,
	airlied@redhat.com,
	carnil@debian.org,
	daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	kraxel@redhat.com,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	timo.lindfors@iki.fi,
	tzimmermann@suse.de,
	virtualization@lists.linux-foundation.org,
	Alex Constantino <dreaming.about.electric.sheep@gmail.com>
Subject: [PATCH 1/1] drm/qxl: fixes qxl_fence_wait
Date: Fri,  8 Mar 2024 01:08:51 +0000
Message-Id: <20240308010851.17104-2-dreaming.about.electric.sheep@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240308010851.17104-1-dreaming.about.electric.sheep@gmail.com>
References: <fb0fda6a-3750-4e1b-893f-97a3e402b9af@leemhuis.info>
 <20240308010851.17104-1-dreaming.about.electric.sheep@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix OOM scenario by doing multiple notifications to the OOM handler through
a busy wait logic.
Changes from commit 5a838e5d5825 ("drm/qxl: simplify qxl_fence_wait") would
result in a '[TTM] Buffer eviction failed' exception whenever it reached a
timeout.

Fixes: 5a838e5d5825 ("drm/qxl: simplify qxl_fence_wait")
Link: https://lore.kernel.org/regressions/fb0fda6a-3750-4e1b-893f-97a3e402b9af@leemhuis.info
Reported-by: Timo Lindfors <timo.lindfors@iki.fi>
Closes: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1054514
Signed-off-by: Alex Constantino <dreaming.about.electric.sheep@gmail.com>
---
 drivers/gpu/drm/qxl/qxl_release.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
index 368d26da0d6a..51c22e7f9647 100644
--- a/drivers/gpu/drm/qxl/qxl_release.c
+++ b/drivers/gpu/drm/qxl/qxl_release.c
@@ -20,8 +20,6 @@
  * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
  */
 
-#include <linux/delay.h>
-
 #include <trace/events/dma_fence.h>
 
 #include "qxl_drv.h"
@@ -59,14 +57,24 @@ static long qxl_fence_wait(struct dma_fence *fence, bool intr,
 {
 	struct qxl_device *qdev;
 	unsigned long cur, end = jiffies + timeout;
+	signed long iterations = 1;
+	signed long timeout_fraction = timeout;
 
 	qdev = container_of(fence->lock, struct qxl_device, release_lock);
 
-	if (!wait_event_timeout(qdev->release_event,
+	// using HZ as a factor since it is used in ttm_bo_wait_ctx too
+	if (timeout_fraction > HZ) {
+		iterations = timeout_fraction / HZ;
+		timeout_fraction = HZ;
+	}
+	for (int i = 0; i < iterations; i++) {
+		if (wait_event_timeout(
+				qdev->release_event,
 				(dma_fence_is_signaled(fence) ||
-				 (qxl_io_notify_oom(qdev), 0)),
-				timeout))
-		return 0;
+					(qxl_io_notify_oom(qdev), 0)),
+				timeout_fraction))
+			break;
+	}
 
 	cur = jiffies;
 	if (time_after(cur, end))
-- 
2.39.2


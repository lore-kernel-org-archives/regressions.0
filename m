Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8B8130A65
	for <regressions@lists.linux.dev>; Thu,  4 Apr 2024 18:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712254517; cv=none; b=hMftiGd5MYbKwSuXqTVUXLX1ToAO6Y+Dg/0g+eLGIQy+IDnhLlSyPrkSt+LSQy/ggWlZT3yS+ELVyGCLtJN95dkObZjbn0h90Jya5rOFw8FTb+6NHuU8ilQ2IlqNO7/aG/m1+ybDG57DHGm4ATGfMiI7dbKougXOeMfKPgPybt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712254517; c=relaxed/simple;
	bh=9WVteE8/l/unSLKa7liIDhpua1SzUqUC58ee5t95ahA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q1aSjCLtm1rmOAwaU6YS7xG19x2k5eZo8JH8SZ/wTQCTc0WCqSY1mqI5wHm46aaRL9S15pYr20aEkEOag+6B8aLv3lV2buDxAOiBX5Gu3xjfTHLfmyPcMJktRHr4Oht5IbaDbfD3TshDSio4QddqraPJ5wdpmwYSepOkKQvWfIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VX/XCvqT; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VX/XCvqT"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-33ddd1624beso747954f8f.1
        for <regressions@lists.linux.dev>; Thu, 04 Apr 2024 11:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712254514; x=1712859314; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kY+E2shk9TTjvlmztMnEOs4NCqRmJnXfRKrkxZqUteg=;
        b=VX/XCvqTFlZJjFE0pGAJv1MX3tC1eXjmSxN+1NTqvQ3//UP8OWYYtnUNt5Ya2axqy0
         bYj3PeqKOhWr4oNjKBnNBIS5NJv1jKjwQabiw0xiHxlk7GK08lGLaURIqPhCYKEbn/Bz
         CZyduhH9N1Dqpfeju0BLiIztWClVDcu0ez/vmiwDljC0ZNHXYScIXjPCMu8LkQWlfsXK
         R6+axOAVd2dV5sH84Wqm8HvIF1n/A7dnLFAi0yPa0bGA451FVUxTv70bKu1bTFEm02E0
         zx7CUf0Yq6QCUpQQ0PIbqYnuIeoXeD4hgbRgEU9kDxA+azHTU/XFiNme0zX8spJviPLp
         z2sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712254514; x=1712859314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kY+E2shk9TTjvlmztMnEOs4NCqRmJnXfRKrkxZqUteg=;
        b=UOFbx2619h01vjmsNo+43XxdzWalDYlCZaqj/s8cdbvMGiIr/iUm6qa9M6rloixWfm
         m2JSPaqwEyRgmSQ3Z5HmyYZZZFowEPNWovLj0us/sBIAL008jPKGJwqCvMdqgXxZrH9P
         IsSbdrBAsvYZx8eXyOlBbMtykkL1IepepHHBwe1wO2ivoYIO8pP9g4pbJ1GRCmJ64TDb
         xVHRU7fs9Z3Kbl93rVS8mi2gX3YJtRPSFPFpU3clQS32kCMyWSSTkizeAqexcGYX/BNl
         GlPlLBNzyuLXEP6wGKukZ/qy/69t8TWiCGdRI+bWbXf+em87uYhhoryQr3LGwuYcYcB9
         ki0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWFUnBVLbxUBc/ZGCCQhaCfN6xnkVLCy8Q0efie9wm6KZZ8DLbjBivEIchuXnu7744i89IIgGmzX8Rdtx2n8oFl1paWbfhkW4D68+4=
X-Gm-Message-State: AOJu0Yx+WrV4yfb9ncFsmka0PM9kTRyBJ3a5wByunSaRBIrklQ8yxcjU
	susKvIlpNXgZOQK2thDqYBd5WF6nAma8wMkUffmYkHXBePXrStak
X-Google-Smtp-Source: AGHT+IHey30qEJp/mXGAUejbX5U+sc9AsyKeLlyJm3AU7cl7lDPEg0sOe+zZaC4lHxBG8L9bfNGSWA==
X-Received: by 2002:a5d:56c2:0:b0:341:c473:2919 with SMTP id m2-20020a5d56c2000000b00341c4732919mr206426wrw.14.1712254513709;
        Thu, 04 Apr 2024 11:15:13 -0700 (PDT)
Received: from localhost (ec2-18-175-17-34.eu-west-2.compute.amazonaws.com. [18.175.17.34])
        by smtp.gmail.com with ESMTPSA id s14-20020a5d4ece000000b00343dc6a0019sm136463wrv.68.2024.04.04.11.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 11:15:13 -0700 (PDT)
From: Alex Constantino <dreaming.about.electric.sheep@gmail.com>
To: mripard@kernel.org
Cc: 1054514@bugs.debian.org,
	airlied@redhat.com,
	carnil@debian.org,
	daniel@ffwll.ch,
	dreaming.about.electric.sheep@gmail.com,
	dri-devel@lists.freedesktop.org,
	kraxel@redhat.com,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	regressions@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	timo.lindfors@iki.fi,
	tzimmermann@suse.de,
	virtualization@lists.linux-foundation.org
Subject: [PATCH v2 1/1] Revert "drm/qxl: simplify qxl_fence_wait"
Date: Thu,  4 Apr 2024 19:14:48 +0100
Message-Id: <20240404181448.1643-2-dreaming.about.electric.sheep@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240404181448.1643-1-dreaming.about.electric.sheep@gmail.com>
References: <20240327-cuddly-smooth-trogon-59c02d@houat>
 <20240404181448.1643-1-dreaming.about.electric.sheep@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 5a838e5d5825c85556011478abde708251cc0776.

Changes from commit 5a838e5d5825 ("drm/qxl: simplify qxl_fence_wait") would
result in a '[TTM] Buffer eviction failed' exception whenever it reached a
timeout.
Due to a dependency to DMA_FENCE_WARN this also restores some code deleted
by commit d72277b6c37d ("dma-buf: nuke DMA_FENCE_TRACE macros v2").

Fixes: 5a838e5d5825 ("drm/qxl: simplify qxl_fence_wait")
Link: https://lore.kernel.org/regressions/ZTgydqRlK6WX_b29@eldamar.lan/
Reported-by: Timo Lindfors <timo.lindfors@iki.fi>
Closes: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1054514
Signed-off-by: Alex Constantino <dreaming.about.electric.sheep@gmail.com>
---
 drivers/gpu/drm/qxl/qxl_release.c | 50 +++++++++++++++++++++++++++----
 include/linux/dma-fence.h         |  7 +++++
 2 files changed, 52 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_release.c
index 368d26da0d6a..9febc8b73f09 100644
--- a/drivers/gpu/drm/qxl/qxl_release.c
+++ b/drivers/gpu/drm/qxl/qxl_release.c
@@ -58,16 +58,56 @@ static long qxl_fence_wait(struct dma_fence *fence, bool intr,
 			   signed long timeout)
 {
 	struct qxl_device *qdev;
+	struct qxl_release *release;
+	int count = 0, sc = 0;
+	bool have_drawable_releases;
 	unsigned long cur, end = jiffies + timeout;
 
 	qdev = container_of(fence->lock, struct qxl_device, release_lock);
+	release = container_of(fence, struct qxl_release, base);
+	have_drawable_releases = release->type == QXL_RELEASE_DRAWABLE;
 
-	if (!wait_event_timeout(qdev->release_event,
-				(dma_fence_is_signaled(fence) ||
-				 (qxl_io_notify_oom(qdev), 0)),
-				timeout))
-		return 0;
+retry:
+	sc++;
+
+	if (dma_fence_is_signaled(fence))
+		goto signaled;
+
+	qxl_io_notify_oom(qdev);
+
+	for (count = 0; count < 11; count++) {
+		if (!qxl_queue_garbage_collect(qdev, true))
+			break;
+
+		if (dma_fence_is_signaled(fence))
+			goto signaled;
+	}
+
+	if (dma_fence_is_signaled(fence))
+		goto signaled;
+
+	if (have_drawable_releases || sc < 4) {
+		if (sc > 2)
+			/* back off */
+			usleep_range(500, 1000);
+
+		if (time_after(jiffies, end))
+			return 0;
+
+		if (have_drawable_releases && sc > 300) {
+			DMA_FENCE_WARN(fence,
+				       "failed to wait on release %llu after spincount %d\n",
+				       fence->context & ~0xf0000000, sc);
+			goto signaled;
+		}
+		goto retry;
+	}
+	/*
+	 * yeah, original sync_obj_wait gave up after 3 spins when
+	 * have_drawable_releases is not set.
+	 */
 
+signaled:
 	cur = jiffies;
 	if (time_after(cur, end))
 		return 0;
diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index e06bad467f55..c3f9bb6602ba 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -682,4 +682,11 @@ static inline bool dma_fence_is_container(struct dma_fence *fence)
 	return dma_fence_is_array(fence) || dma_fence_is_chain(fence);
 }
 
+#define DMA_FENCE_WARN(f, fmt, args...) \
+	do {								\
+		struct dma_fence *__ff = (f);				\
+		pr_warn("f %llu#%llu: " fmt, __ff->context, __ff->seqno,\
+			 ##args);					\
+	} while (0)
+
 #endif /* __LINUX_DMA_FENCE_H */
-- 
2.39.2


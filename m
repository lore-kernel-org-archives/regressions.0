Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C543943F4C3
	for <regressions@lists.linux.dev>; Tue, 15 Sep 2026 20:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789503955; cv=none; b=b08LWaaPsh4Z4+8chQCSDlKCG+drIznml6SQHq3FooAQVC1Y+xEArPfF87vd4piaL4+ratA73upu6bjino+PR8mpYC/Md1WN1H1dbvsQYJ2m/VK5XRHrtFX9ol8/28g8XysAGSsN6HjUYDoDQNq36+9/DquyZ+uhH/sN1mR6oc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789503955; c=relaxed/simple;
	bh=RvjCwhFGET9Uj66Osagy6a4qssD8e7inBSdkIa2r4RE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VYgjHAHRgPsjy9v59Crm5qMFy5rE4RX5pIYIsDZhj5bwVVEpGHlogo4BUCq8EBN3jOQC0Jj0CynRnqyoNuUjWgE09Rfvd5zHLG+N6sPvYf57Mmkq7y6iUKTxRO4J+xBBqWNiR2Shlybs+aUU6IYfjTCe1b1cnwR8GfAtaHg/sBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FYwf9Z1R; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FYwf9Z1R"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f05ffcso1490755ad.0
        for <regressions@lists.linux.dev>; Tue, 15 Sep 2026 13:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789503945; x=1790108745; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vNdtcRPen4btN0ZzDjINeGYvdaPnuO0V2FcBebJBxrc=;
        b=FYwf9Z1RFK6Aud68X0LbrCVwTanxzdwuRQHUIix1Lk5l/eJzjp58aRevFEW6RD+fBh
         fwETbFKHDj+woOpv1ZPwvvuKtg9UcIIeWoU5QeTH987t6T50yltv2lJK0mlg4oBOcZur
         MbNlB7XEMQVaubYG6MTt6htuxrNbcskOudTnALEy9plhLD1yHSJTFHi6NT4qjBocvwv2
         Ln8C7zdH1JlltcjY/7Yhx1pIi9UlZ81kD5K46+KVSS/Yjf2//vZ4+xjlgRGLVu6kH80w
         hHZGuEQrL4RXDZri8stLy6NHqYHo9e0ctOQazOgOHW74F18KnJTlHUTaC22zDi+gcpJe
         Rc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789503945; x=1790108745;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vNdtcRPen4btN0ZzDjINeGYvdaPnuO0V2FcBebJBxrc=;
        b=VGkTriXr76VIK56scD+Pu5ic3XTOsma0dxFpNRYuaElXedW1azLAolkYFu/T2V/9Fv
         QENyaptExXQjzPvo/Bmnn8QrC3aUZDVKKiFIvpzcZcNKDJW/L1PzalZh+9/btTsvaAB/
         vPsYcS3qSgMEF/hOxAO6UtTVPe73cENyITHttD0QFpBzFF73gfaIk7RXubTpNanlxFB+
         1Kgyy8eR4MRUznaCEX+KUooeEVc7a6eL0E++1gu/4YgEWmaOKJYok0g8IZ9wei0af/wr
         haZO3GgXPrJ4HYO+67AaPl8hX1SeIBHF1/5x9Oe2PRYUsoOODPcE0OkRQKBVRDeVZ3Sk
         tU8w==
X-Forwarded-Encrypted: i=1; AKwUvBx8iTekgj8euXY/B2WOUt3L9z3tSkRIq7+WGO81AOQXL/3PWt5BpndjGDhr1riWaHORpRVDqHACbjZoNA==@lists.linux.dev
X-Gm-Message-State: AFuF++mZ7rFEdz0QBOaWPw72D3/dEO3n1yBeXl4eap2Syne5A/LUDqr3
	Qxy8Uiys1NDt55b1NspqV26FGP/ekk4L9JHqtQu/NVeIy6nDRCyJPFVm
X-Gm-Gg: AYBFou2IfhYStfxyyFZzc3zF3HRsnM3wc44bjknLGerVoBTT+NuLdiTM3SAnN5m83le
	zpmwFYc6kng01w+hhLfdIyhKdzqulk8YiUMF7WkrQndn6Lzraa/vq9Gcf7S3AoYOazCHQYZE9z5
	IKf3K4HWHawZrXZECHNDzz9WpSigmYoOCr8SwpTyrzoAMobSjlqnd/tKIDRZPQ0kmSX8/CXDRtj
	lg0tBCBQ8iMhG5LuhtqfpU3ZzgWwKjrWUpeXPWvWThSvhs04nRjXVOCes79guR2W3B4Ps62SlVo
	RmP58FGOkNkNxSQ8KyiUYKlwZNYhQmwdoW8E7NzP7Ik07IZCQnIp1Q1zrbB9MVC4Bx6j7/w7LJ2
	joDylv9DhjMGwqlljwGEPIV/8cuMkE3Phw+O9E8BQeL3iCEue+pTFCSG4j96JFDuL2VnYSyuvVC
	iM6YyAjSBsBKif/RRkQT+dQHg2HSMZehkks2x3KYNqI56TNuMkYScKL7pB/MPau4cv/DGsdRQJd
	UQ93/k7NBVxzOawp2fwmls=
X-Received: by 2002:a17:902:ec89:b0:2dd:7593:8634 with SMTP id d9443c01a7336-2dd838536b6mr44291865ad.13.1789503945178;
        Tue, 15 Sep 2026 13:25:45 -0700 (PDT)
Received: from nixos.tail966018.ts.net ([2405:9800:b530:f677:2b6:42de:4884:aa25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5aa1194sm1560592eec.14.2026.09.15.13.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 13:25:44 -0700 (PDT)
From: Tanawat Jukmongkol <tanawat.jukmon@gmail.com>
To: axboe@kernel.dk,
	tz2294@columbia.edu
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org,
	regressions@lists.linux.dev,
	Tanawat Jukmongkol <tanawat.jukmon@gmail.com>
Subject: [PATCH] fs/buffer: fix NULL deref on folio-less bh in __bh_submit
Date: Wed, 16 Sep 2026 03:25:34 +0700
Message-ID: <20260915202534.468958-1-tanawat.jukmon@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

jbd2 submits buffer_heads it allocates directly for journal descriptor
and commit-record blocks, which have no folio backing at all - as the
comment on buffer_set_crypto_ctx() just above already notes. Unlike
that check, and unlike the bh->b_folio check further down in the same
function, __bh_submit() calls folio_test_dropbehind(bh->b_folio)
unconditionally, so committing a transaction on one of these bh's
null-derefs while reading the folio's flags:

  BUG: kernel NULL pointer dereference, address: 0000000000000000
  RIP: __bh_submit+0x90/0x140
  Call Trace:
   jbd2_journal_commit_transaction
   kjournald2
   kthread

Guard the call the same way.

Fixes: a2c924c240e7 ("buffer: set BIO_COMPLETE_IN_TASK for dropbehind writeback")
Signed-off-by: Tanawat Jukmongkol <tanawat.jukmon@gmail.com>
---
 fs/buffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index 427d8a817..4aea0bb08 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -1106,7 +1106,7 @@ static void __bh_submit(struct buffer_head *bh, blk_opf_t opf,

 	bio = bio_alloc(bh->b_bdev, 1, opf, GFP_NOIO);

-	if (folio_test_dropbehind(bh->b_folio) && op_is_write(opf))
+	if (bh->b_folio && folio_test_dropbehind(bh->b_folio) && op_is_write(opf))
 		bio_set_flag(bio, BIO_COMPLETE_IN_TASK);

 	if (IS_ENABLED(CONFIG_FS_ENCRYPTION))

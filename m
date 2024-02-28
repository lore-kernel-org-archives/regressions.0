Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65DA42064
	for <regressions@lists.linux.dev>; Wed, 28 Feb 2024 15:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709132404; cv=none; b=qoJMwegOU5Au3pVAgUo2bn+ZEFzE7oyX/blG1ych6WrUnDjzT14HV9TEERm8Oo1FdtEcn62/1GSqnYOYNhu0kijGfsLLPzZcwdVqvWBV8hh4IpiylmbdCnEg9ih2dqzaXyYP2egTIg8xlMRGwJjT1jl3sxjNFcL/lFquEs6hN9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709132404; c=relaxed/simple;
	bh=xo7+i3tQwamD6ZgV3iu1PBh2FtyscE3JQaKNL87ZXKA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ACJft6t9oOoMuAg5pT/bzcgjqtNBLFYPA+X4pSSTKEl89F2o00dGUrRtsthKBB2hIhILWURSzMx68swIU+GrrAfEqL8u3Q9mJG6BCVrOp7oN5zOdwoCJIqQ32IS8SoZKTKIoeVgffOfLSqJEh/C+FOW3b7JxVitT/RGE+DotJa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KUpUnWIc; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KUpUnWIc"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-565b434f90aso5217569a12.3
        for <regressions@lists.linux.dev>; Wed, 28 Feb 2024 07:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709132401; x=1709737201; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RXm3blkfK5l9J9HjHCUIRWJ9avBSfSyn6f+olGRLMhE=;
        b=KUpUnWIcQ0Kvx9oR75lcTqy/yP6SYnR69KDbdo1YjoRWYnj9sVt13i09AsvFFPzwv7
         gJOWlBfCcdi4f2m1kLyiUuSoB8TJ0gSolrJrbbOt8qrFFxCrO5yQI3gN61eaGpdmma8p
         FRdTUTHTx8Gdj7TuNTm/JepeM9+FFAMzCdG4Roj+8l73CTxZNxWYEWdSzr683tzu49yl
         HINoTgF/bWX44E4YwsKHXRYGVgKqhp/A1VPqVUT6SqqMXwKR4fH+D10pmRONg9tcUQDi
         NZVM623yffXZId4vA2ASgKvW7bDhGHl2/2Ho7+3Lcg//d9E04IT5maMflDVxik7zkPgw
         zu2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709132401; x=1709737201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RXm3blkfK5l9J9HjHCUIRWJ9avBSfSyn6f+olGRLMhE=;
        b=hg9Ml++d8ULglez4bAnFQGKKckSIRMxDVCGTRXfg/z6sXuWkGM4/r6xhPb+t/slDk7
         uzhpWOSwqMiU0mGmwUIExen9SloYbuTFe3ifTDv75GZfqv0VoDNUQOwoUVvGG9OQLS8a
         Pn8lcysCH9/Ia0laLcobM8ACBSP3p7kElci4kUqU7/YMMPmbQxNka/38PhEZAe0xmTQH
         yjH0IIgaJ01kK53R9wK+rsLNwSZrxu6lieGYUwTX4TX+AAOn73xRMeqquA1q5UcNY1KD
         BWDtexigcjdCfHLjh/oxSI8rmoemPZJLH2W54O+mBqe1OjyaVpcG5gYNjJGkTSfPLC+W
         2QnA==
X-Gm-Message-State: AOJu0YxzdqmgLnRMR9jVFt3+qRJ8mwCnpfwivskOE69h/iFqnT4m53W8
	yQjiX0hO8Za40EcqprJK1LKZKVdbZMKHKjX89MdkKksMrel9sRL1
X-Google-Smtp-Source: AGHT+IEicPyuJlt9eZw4U8ZUBN2D8SA16t86/4h1p2C+cJXp0+fbuaR5WWsi2QQbtiTqtcEcCrxKhg==
X-Received: by 2002:a05:6402:35c2:b0:566:4ba7:157e with SMTP id z2-20020a05640235c200b005664ba7157emr3624529edc.14.1709132401080;
        Wed, 28 Feb 2024 07:00:01 -0800 (PST)
Received: from toolbox.int.toradex.com (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id bn21-20020a056000061500b0033e033898c5sm1537610wrb.20.2024.02.28.07.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 07:00:00 -0800 (PST)
From: max.oss.09@gmail.com
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev,
	gregkh@linuxfoundation.org,
	sam@ravnborg.org,
	maxime@cerno.tech,
	sashal@kernel.org,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: [REGRESSION][PATCH 5.15 v1] Revert "drm/bridge: lt8912b: Register and attach our DSI device at probe"
Date: Wed, 28 Feb 2024 15:59:45 +0100
Message-ID: <20240228145945.2499754-1-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Max Krummenacher <max.krummenacher@toradex.com>

This reverts commit ef4a40953c8076626875ff91c41e210fcee7a6fd.

The commit was applied to make further commits apply cleanly, but the
commit depends on other commits in the same patchset. I.e. the
controlling DSI host would need a change too. Thus one would need to
backport the full patchset changing the DSI hosts and all downstream
DSI device drivers.

Revert the commit and fix up the conflicts with the backported fixes
to the lt8912b driver.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

Conflicts:
	drivers/gpu/drm/bridge/lontium-lt8912b.c
---
 drivers/gpu/drm/bridge/lontium-lt8912b.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 6891863ed5104..e16b0fc0cda0f 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -571,6 +571,10 @@ static int lt8912_bridge_attach(struct drm_bridge *bridge,
 	if (ret)
 		goto error;
 
+	ret = lt8912_attach_dsi(lt);
+	if (ret)
+		goto error;
+
 	return 0;
 
 error:
@@ -726,15 +730,8 @@ static int lt8912_probe(struct i2c_client *client,
 
 	drm_bridge_add(&lt->bridge);
 
-	ret = lt8912_attach_dsi(lt);
-	if (ret)
-		goto err_attach;
-
 	return 0;
 
-err_attach:
-	drm_bridge_remove(&lt->bridge);
-	lt8912_free_i2c(lt);
 err_i2c:
 	lt8912_put_dt(lt);
 err_dt_parse:
-- 
2.42.0


Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897CE435507
	for <regressions@lists.linux.dev>; Sun, 18 Oct 2026 22:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792363328; cv=pass; b=t+Hi4Cid1UuTq5qHH5DFIhmrPC2vd2Um1PenSL4lH4m8zjRFbblG3rDI8+NgjcfL6EoJvaeVhiE/I5sR0zQiWSBs9ym1SxFysR9pxXihOqhvIdXFXN1sgo2dd4p1r8u6gRyd8yXemI4hSOyeBIsVTgY1TflC/WSGzqJqdmVhqP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792363328; c=relaxed/simple;
	bh=sA78jFowzAjZIyrY72KMyOJ5GxIFW03/6Vjb2E8Yo9I=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=AGwsTeXeGRgxoGmWtpOdfHYqyVkq5iuPazhYBnpg+3gCe9qnGvKpx/lF/GmDSekXp64qlOz7f9r74gGRYU1Ve6ptqh57q4mvQW6+Zzc/6aESQmYu1s5EKw8VObjiErf5X4UcdlDH6kvGkNHnkzYsfd3BTMGf+oc/YpzN79e9wxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j+43qomS; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j+43qomS"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2dd76b1361dso6975475ad.1
        for <regressions@lists.linux.dev>; Sun, 18 Oct 2026 15:42:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792363327; cv=none;
        d=google.com; s=arc-20260327;
        b=p6zZi0Aa/R/67hLcFE6ikrbtRsVIvqtBvORDx/7ULOQBuEF5mDpuwihfldkd3bHVPb
         dgpjjWVkac2Lr6JfVtnjmickD+dmPQYga1TUjOGOECFydzSaM4Bs3od5C5Z3khu+lna4
         25wt3g6G7rCPR0fx/XvY0k1y0QbGWv2EhF8Az5Jww0QVCgqQsHda+vwwGCB7PC6PG1l3
         X0T5xkUT2563NmSRwucPpFUvJpc6/h9Oo4Nn1nZOpSIZ+EH2puJJSsxeSjhtMWSzppBL
         300dX3g40KtqztshAwwuIwwrjBB3q8dPqo9KCwZ4NhaTci70uQoPiXN4WSt13lXH9cCG
         LmJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=5Fa4oC/q6RcCMAQDGgF7fdd/gfP+j/8A7cYqh74vbRU=;
        fh=5oHC4WiOSM/fqUYKrJukujo3aKAn5Z214snEhsb8580=;
        b=rxyKBoD+jTjhn/L9wuTooNMTv8ZcTNHzg5/SQZn8rOKJcjzDO+NbRVEk9bvvje5PjJ
         lLF1guti4WSSqFKVhMIaweJF0dqONHcgGzPQfP1+PaNk8e2vQbt7f9Bu07D5tq442l6F
         wF0V3Dt8+/WGqEFQj9g7XXzj9r1XasJ2mBgrte2ihqdoz+m2OjeciA4kbzhADSWpwmOS
         PQArjDU2+2cIYy66N0vZkHanmO10SfWDicHk8qkLa/JZO8mwfLGn0ZwY46TutK3A7kaR
         3G8iHp2/A3CgIC9o5LoWjvnmymuoUa+ts3tvLMyf7oviY9V3LP3ZSVCSLsKl1uUgQpBR
         76hA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792363327; x=1792968127; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Fa4oC/q6RcCMAQDGgF7fdd/gfP+j/8A7cYqh74vbRU=;
        b=j+43qomSTKaiuSy4lV+UeIxtafL2ATgLgqMBCik0SNGQnesd0CC6GVwsqTWINK4ER6
         A3rNwC8P19Es0dayOScR6DrXuFNdrm4K4pPkarDKvwiF67unDoeKLV6A1bVkWNpsK0Vh
         0NQDMDIjpt1fkzioZTe/EIQ9DpOUUqJnSKIgsRKRUiV3pOokFUX7elXs2PCPIuf3mhyN
         UfoqPFQ3T3x7Gqj+2XYYeh80H3IB6WWjFPmOV3GTIHLzX3wm3tk62FEY52F46RCLQfwW
         rQC9BQ8fhUHlrE/yP4y1QZWgopLu2lNf1XwCUWcH/wuixmkNl8uHS6k6VHWTNmyp+FoL
         jKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792363327; x=1792968127;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5Fa4oC/q6RcCMAQDGgF7fdd/gfP+j/8A7cYqh74vbRU=;
        b=2CpmW0/5A7ufKsxKr5pPjmArhdUMXESj4B1RwAAHkvwt4L0gC5DdI8hejqX+WvId7b
         vXJctQSafpneZA+RhuV62rz50ofmhAZoL71cPNnlZANxICK6bHrvlXyScOogt4jTJQ7C
         5EszbdVlald66FMMJhw1LECEPsdlLghPcsOfS6Siyob+x8ETFeoDGwtUkxtGnbft4tGC
         FlMTCHl6Vvb/FFONk3tNGhzPdNd1eIXuvLYh87DFyoO933ISgIZhz3oiPEOctvjIGu+V
         lOj3FsvKZ4dw8pCs2SkDwUmrmx5fTrn2o9jC5lDQid1p+69iRmHj1AUjP0nbGRoD2mpI
         +Jow==
X-Gm-Message-State: AFq9FYJEO2mVuuzzReguEJ4r1BSHRpKR+/AHoSclpZLoPmSUuUnlwhLP
	TSJAV0IYl9VMoZ/Jnz1jKHoSrOH32MhbrZ5lDTDCrZubM8hVYDlCt+p1hXJo75eQAJ/mm9wJ0eB
	xlNQDdTnq3Y9XEHIlk/1AjY2Cfi7E1uk=
X-Gm-Gg: AYBFou3HuOBZ8PXvQ78mkWoUGgi19xHnXyOtdlvtaSLlJWhX2/g9Uk/jcD/mRlLvxvb
	EMK6E7zzfmBxLoxhfa0giEviIVjGeG2KqMJcRjJjjMHGVsmR6IozzP8T+afHtJetqjFdHk+vY1R
	L7+a4nJJtEslBAVvr47uW9QDoFr7tfXJwTevNwsW4UXE4zJI6HUBe/kLAjR18Reguo6HpOTELW0
	AQBs5hx9egEcg2XYLMojKXiyqv0i2i47Evndaicdf50sg6KM2lauEhmeNZbKijwDZhG6pvqBuq2
	7hVk6zGHdPnQ91HSw6jTG9rUc3FHugr1ToTkhfYVG/qN/45HSdQMw6Sm7wB/AJE=
X-Received: by 2002:a17:903:22c6:b0:2e2:d39f:182f with SMTP id
 d9443c01a7336-2e9a6d2646cmr50216835ad.28.1792363326788; Sun, 18 Oct 2026
 15:42:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Connor Stevens <ooglie05@gmail.com>
Date: Sun, 18 Oct 2026 23:41:55 +0100
X-Gm-Features: AclHuK8uJqAgzHBOxFyLhpYlx7hixdCrDgjKxkdDek7f0OQznROONPQ0FgMwdBk
Message-ID: <CAF50T1myMs2LSPUsTAPKyJutxzqQihyxbY3=iVGpxenRbnXxKQ@mail.gmail.com>
Subject: [REGRESSION 7.2.11] ASoC: sdw_utils: cs35l56-ot25 DAI not registered,
 no sound card
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, rf@opensource.cirrus.com, broonie@kernel.org, 
	sashal@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Since 7.2.11 the sound card is missing on a Dell XPS 14 DA14260 (Panther
Lake, subsystem 1028:0db9, CS35L57 amps on SoundWire):

  sof_sdw sof_sdw: ASoC: CODEC DAI cs35l56-ot25 not registered

Fedora 7.2.9-200.fc44 works. 7.2.11-200.fc44 is broken. I did not test
7.2.10.

7.2.11 has bf7a3ce1d563 ("ASoC: sdw_utils: Switch CS35L56/57/62/63 to use
OT25 DAI"), but not the upstream commit before it, 86c8360c97f6
("ASoC: cs35l56: Add DAI for SDCA OT25 stream"), which adds that DAI.

I looked into this with help from Claude Opus 5.5 and checked it
myself. I understand you must get lots of AI generated emails
nowadays; I hope this is helpful nonetheless.

#regzbot introduced: bf7a3ce1d563

Thanks,
Connor

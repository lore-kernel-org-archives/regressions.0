Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DA447CC72
	for <regressions@lists.linux.dev>; Wed,  1 Apr 2026 16:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775062750; cv=none; b=ZPCmOabpdAIDWyWtKwlrZ+R4zQBsuJ+xih88zm3xHE2x9Mu4zxAk380R0MR17QTFWciuzu7iCMEDgbsTM3w9Qx9DOhIUfLvDUbVXrZMV9dV2y8xEu8NHtIqJ/L52XXXWz+bva3aof/SHn4yOc176tn2gUSX0UZaiM7WUTe1IOQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775062750; c=relaxed/simple;
	bh=/+O2bH+o0CaeLJe7PaeMIxgBugooYIVOGdzTwOHVmms=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=qkFMUnKuEFsPe5IGoQKc3tX5WjqYlu0EJuzBtdBizTBIdJSnxoMjxEtQMgGRwuSe1c2vwSb8C1sehVbyjAgsadPwHeHeKjC99J8/v4jGGJ/jfHMQBK4svDGt9rAuvkv5aCJI6GGf2FuvS0U3fIZ9oHanw+Ua9MMxTm1wnDQV1oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=PrTow3oK; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="PrTow3oK"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1271195d2a7so92357c88.0
        for <regressions@lists.linux.dev>; Wed, 01 Apr 2026 09:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1775062748; x=1775667548; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GH0Sx4cJ41/FacXkd5wKU71noTDGEHVM+jaNbc7jFpI=;
        b=PrTow3oKCKfbBAKQMyjEU91SmFKgrnmPCS7aqnUMXd6k7Fcew5/Ia7yZrRR3au9UXk
         J7IWnCEXBc260lvQfa7yBmB5eAN+c4VdLIm53xpnbnzG/pAlDqGMzNFZUR37sL428Aa8
         szcFcyUZTsIuYh5wSNVeGlxiJmyVjG+Eyl4HHTA8UsH9pC/3CFhlVaZ0eVADNoaApawz
         6aEUtZ/1g+SfSCAzzLaAr2LhfZQW65FzBGATZL78kcCVmC0TJT1kyWQBUyA5xecmd7C1
         gVCg6/dbv9zsWiOEtr/NKDCopk9X62iCeuAsK3rjJee71aJnn8GR+cFfewibcId05kex
         szIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775062748; x=1775667548;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GH0Sx4cJ41/FacXkd5wKU71noTDGEHVM+jaNbc7jFpI=;
        b=jaXmz3ejzPkm3UvbD8MomHJPKzfBrOLwPeaWYU6TQG5eoQmrTyvhr3yJlPEydrDuVg
         T182aPBGQG3Rl6FLo1FBM4f/Pg6qXjdZSzh0nx/mUKHdsxiLkIPv27OAGgOS3hZZZw56
         8xQGx5bLZcCEUp2oXyr6Jt1u7Au2Oq+sIqN45v/gl0JYZ55j0jyw9qYEXgBLIs+Ihz58
         Zs6apKz/TgHs2tRIihzs0gWeNnkpAj7KtQkKxY/LHyYhyF6ttjuew47PBz1hfEON6LG7
         KcNIEyQFaqelRwF98dwMG0U4nlXnd4bHOoke+nXOhYGSZG1+IR+JDMMLOH7bs8TwQAkk
         E9HA==
X-Gm-Message-State: AOJu0Yz7h892DLyS8cGRFzyOgFFDwg5mM3u7Mwu8FjWeqgHOkOCzO4f9
	LOoVFTK3f3TyZr0uG5LV3doQGFNEXHU8PwRwshKQJIsTHQ4+m0Cl7DnrJjEzcc1aCy8=
X-Gm-Gg: ATEYQzyIloJ66D/hJXChLcz/Th0N9N5DCtLpsnwUymGFIUZ7uPkG9EnIUOTr5U0fk6U
	IDOMDVWt79Xqub8KK6jUbUWDe7ZG+sis9y0CczXXhCPZsHhL+FRZHfnzGuoE1Mokyd0ka0z4R6v
	qQiUIpHSXuehRWtK6GbcS356Vb5pouNwj7xgPLGSjvI+wV4Lb/mVWi7/0kdobORnGgXysBs32NC
	2ajr1eY728jAZrGzqmVGgnq3IKDasuIJ/snvgdEjne0xMeupeb+BvKm4Po7Au5kqVXlVb4boPde
	2KjaTbvW/bdJLXRD7mBZgGJ0M5wSjFwKkAHsI/8BsOqJKnLb3j1fkE3mM22SjvBCK7/ZhulZfl/
	khpslhXJz+7avq4QmdaEFIw6eOUCzVWiGOX8ren0lqH8j6RgpDy/dF73nHCVX5m3yXxxPFM8sgm
	mYTwUnGuj0wIhDZje9
X-Received: by 2002:a05:7022:4a3:b0:12a:8176:f3b1 with SMTP id a92af1059eb24-12be63fb96fmr2779039c88.6.1775062747927;
        Wed, 01 Apr 2026 09:59:07 -0700 (PDT)
Received: from 984b78e0ad75 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bedd70f18sm310806c88.6.2026.04.01.09.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 09:59:07 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) in
 testcases/fake_sigreturn_bad_magic
 (Makefile:31) [logspec:kbuil...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 01 Apr 2026 16:59:07 -0000
Message-ID: <177506274695.1080.11153738493337774024@984b78e0ad75>





Hello,

New build issue found on next/master:

---
 in testcases/fake_sigreturn_bad_magic (Makefile:31) [logspec:kbuild,kbuild.other]
---

- dashboard: https://d.kernelci.org/i/maestro:5220c2e06a566676f041c198857665ab175b9ef8
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  bd0f139e5fc11182777b81cefc3893ea508544ec
- tags: next-20260401

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================

=====================================================


# Builds where the incident occurred:

## defconfig+arm64-chromebook+kcidebug+lab-setup on (arm64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:69cd3871dcae953c056b53ca


#kernelci issue maestro:5220c2e06a566676f041c198857665ab175b9ef8

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

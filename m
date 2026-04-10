Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559643DFC66
	for <regressions@lists.linux.dev>; Fri, 10 Apr 2026 16:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775840349; cv=none; b=HOcKy4irVOPcC6jw/nh7oofqsU4TVHGVbGGDfcTb2eWc+d/ZQcd/jalfigBkkc2CinV/h7ZfWbKHDbimD5P8sEUYmvOd0Emo6Mv8Sfb9Zq3hyk39zg1pONTurohua+qbB0XAsP7w/nk59yvzFvarbdSdWxdnAi4GuXakpig4xiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775840349; c=relaxed/simple;
	bh=4fbWoUbN8ckCjQUSnSVhOHa9/jERtl+y/lKJTGDoBOI=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=t3Vwn+R8s1G0DweQ+SQtnFHd6Rl7r1G/e+qetyywBzBrJx4ejhrPkLi7YGG/A67cgjYueQ7ibI2EPqKsLyX16j7k0teVxHDAqBfrl5WwPInMDuFPdE82hjrGjR+HsL7kKNVGEBR7GmMrmHWmH5zhdWOIlLRuleBAKUg0ahTCOuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20251104.gappssmtp.com header.i=@kernelci-org.20251104.gappssmtp.com header.b=EhGXTKOR; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20251104.gappssmtp.com header.i=@kernelci-org.20251104.gappssmtp.com header.b="EhGXTKOR"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2d52c7f92b1so1654337eec.0
        for <regressions@lists.linux.dev>; Fri, 10 Apr 2026 09:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20251104.gappssmtp.com; s=20251104; t=1775840345; x=1776445145; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CI22AvQsygsRapOWu003btiGsXEMdheCp8cdpnvmm/o=;
        b=EhGXTKORPZz9Z3Iv8OLVHRicrqJEXieXlr1eUoiA36kfg+qwLHVFg+xKUNdQ/tZQMr
         I61Jh0CuroQJ8UNVaGHI554tbo1Y+pw+gqlxNGShRLRodm8x3nYYDp4gzLocPq8zm1ek
         wwbYTm3xNQALRPfj7iwhaCZA664dyIrSeD4QyTMz4NqkUQtAYqSvzIy0Z7J2RVBakF2w
         vlMkWoRmESyrSbkWVtXv0vA/lTtLd2EaRZEQM65H6qHe8RZIHLKxuSoEga4TV5rhSx/o
         Vpt20Le4+o7c5/8ZHgN7je8gSZL5nhlAJFmohPqLHBRgfjSU3m7ua7KTaYpnRH411DHk
         XT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775840345; x=1776445145;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CI22AvQsygsRapOWu003btiGsXEMdheCp8cdpnvmm/o=;
        b=f04foSuvV6pqjURGHYMn4461QWUmGBHFXnkZBn1JBWT76tv2eYxay/aEAcpGBoXdo5
         bOAiaYhqg5ROXqKAKzfQmysWpgyoOhFspuoQCPwIhfiE0BVJijiyv8hplDyWF0Gna65m
         dBWeyp1JZ6TIMQCi+n+CNQOIB2pr5VKlIlcHXtoOFLxKTjFF3M8RXD9Dpj9WRdsJRA88
         /xJAVXDsJCygy4fmNiVAyaTjxOWNXdIqpai7javHX5hjtzfgYFHqx4+6NKlwQME9xfRo
         vTBdWJBd2VNOr1Yv8CGDKu6qu8BirjuGhKJpQM3ikbZIdtU7rtO17CkyzV2EKwyBkvNu
         Ff0g==
X-Gm-Message-State: AOJu0YzAfonf6MKHmyVLxWIL8UFwTrIacxSBiTgFe4B+6EAjZLlbd5vh
	CEiHNRuyllyG59+3+VCXuqQXCej8fEIyJTQ6XCNYFqpyuKM0r/VvVgltywP9IKh2fiU=
X-Gm-Gg: AeBDies1sRf9qR0gYZ6kotQ02Wn740RTpCwab2o9jfKWXNntkSVifFzmfMne0yvc1RM
	QdlcNao/j9M2sKZBmR15FTbgbkrNw6g8//0BuZGjsha8Otdm8CqxK8/oKknIkyJzQgPxgWfoVzJ
	P9KK0k4vccv5IHwYhyelh/BM+mUXJ5vN39dHFt+mSayL1A7wXukYM73sgQFgYPA+ap9fBuJ5DyR
	i20RASpYhkunMYJ9VV+2dvJAXjuETut1tgIKJ7mZ28yHhxfDvj6Z6LB2IWPnafdcDkinA+Z6BJj
	0OC41UeOnVd6pES7KtVnVoYgJYuTjFqdgk97f55Xjhm2j1Jnxqmu31eWOIx5lEC2XCEu4FJKe0a
	h2ycwD6cDGERka6ZW3KMQMRfh2g9yeELmJAGtFu3gaivbuifU7LgLL+DkMVZDA1+NPGzVltem18
	Rgec7JNVzrHGhy1AnZ
X-Received: by 2002:a05:7300:d183:b0:2d6:526c:55cc with SMTP id 5a478bee46e88-2d6526c5736mr859599eec.6.1775840345053;
        Fri, 10 Apr 2026 09:59:05 -0700 (PDT)
Received: from 8692ffc4d55e ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55ff826dcsm4891573eec.13.2026.04.10.09.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 09:59:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) in
 testcases/fake_sigreturn_sme_change_vl
 (Makefile:31) [logspec:k...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 10 Apr 2026 16:59:03 -0000
Message-ID: <177584034337.3832.10513430880731960501@8692ffc4d55e>





Hello,

New build issue found on next/master:

---
 in testcases/fake_sigreturn_sme_change_vl (Makefile:31) [logspec:kbuild,kbuild.other]
---

- dashboard: https://d.kernelci.org/i/maestro:78b76dc6acfd18845f6fc483e154076f27665ae6
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  66672af7a095d89f082c5327f3b15bc2f93d558e
- tags: next-20260410

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================

=====================================================


# Builds where the incident occurred:

## defconfig+arm64-chromebook+kselftest on (arm64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:69d9119886a2e63970e94ab7


#kernelci issue maestro:78b76dc6acfd18845f6fc483e154076f27665ae6

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

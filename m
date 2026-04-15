Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8669364EB0
	for <regressions@lists.linux.dev>; Wed, 15 Apr 2026 07:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776239947; cv=none; b=VuMBSAv1EJ1pWIJNr8nxKg79oRCml8Tf7QelHWfJO+vmz44pV3rafRitCL3DBVEfptFuJz0NdHyxypFae859Wsp3pFt7ev2YvO7RxqtjjK7iUHwCMzAolWl1bXeCJY/NmRRwenSsjAmIBfCTPSmka/Snf9WmGMRS2IWa0DoMbjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776239947; c=relaxed/simple;
	bh=3QDzaMvBacopDQF7bTwtD4mKcjPy9kdrX9uIOyIMxKQ=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=X6xkEITNeayiV9SFRaQVnXZayR8SCpGa5xeCRpT2I+5CBYVfOsk1hfvKDQkUhVLTKfjPpS8h+clpieYNJsLmgiRFyLCCa1s7K19/LVuZX05bfWF2zj3t78/egmJDhX6X1TsMx4xusutBJbc1AdspTUQQX9QSBD+8KhoTYL70IiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=LAdyeBQx; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="LAdyeBQx"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2d868d014a5so3229897eec.1
        for <regressions@lists.linux.dev>; Wed, 15 Apr 2026 00:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1776239945; x=1776844745; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M9sFpptFSl+xpxG3Dep8vmh5lWDoHlhj2bfKhg60gNc=;
        b=LAdyeBQxsHW1P+lzxoigUX2LWlUaWVaASOJOYKY36E2ozgJjhwajs63ZhtR/02OF5Q
         ZLVSQEH77ZLM017tDXlJmsfpV+fTb0oBeuATz1JGjkccNNhGXzr08yAw4DI5PH8FGycJ
         7bxa77jTco35K9aanme981bs6C88t127zoWWXGMHxCEiUiVg/fCyLWmzGKJP+SlIh0lM
         Ky2zc4pJzVQzwriWDc69N2oGsbdJdfaSc1D3+oDb0BFczwYy3LXqfXmeuMBBsGVdeu/I
         rOYwGvtlU6hFMleKOaP6HDYvNTT/UcKdRLpXi5sQR1/ZK6ddmr9+CBlipc+9v8IHQX3o
         4h2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776239945; x=1776844745;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M9sFpptFSl+xpxG3Dep8vmh5lWDoHlhj2bfKhg60gNc=;
        b=PSbva/Mo4oPJa/IAJNHcowX7/lY9G/OO3Lnpq9Bai75hKyLhjKsFCw5AEihDcvg2m4
         8vHqLDp1G3j8Pu91HWhhZQm1T0jFRtBWHvo2xBMMyEL5Yio5tHQbFPt5xSDECUYhXnY2
         pW3FfHAwER39t7/z0STYOhMsRXHUrjVfGxr8RJqaaWHpoNM3lscC023grdMWdZoXWRY5
         3PkwfW//hHsi5GbTceQnyrtPeTRg58t3MrcZcVN+2aD1T7a5PQYGhtIoylco0vL70GnC
         ui+dKms92eZyMECGxpaex4aPkK/e94PB67W4d9bX8XCBiwZOxCOSB6jUyupptiXkxbJo
         SNiQ==
X-Gm-Message-State: AOJu0Yxz3c9SXmwd+KO1RQqwTdtC73siassq2we4TeMEMwXme2BJYno1
	c3otfawLGLLxwdK6d7w6kZA9kNPHqVP6geu4RpInW4rs3CvbP0W9pPcfmp2jC3h/1T8=
X-Gm-Gg: AeBDieuca3GKC8L76ooAxnGnCiTeBdspA0ozciwADEdTXHyVaE8FPiZEyVM3sE2hf8a
	8m8G+8dzRYbfF7cBSG/x3YHd5WZ/5WmC/gIxEdC9lluaJCMraGFMoLgRFSXZA+6Lwg2s/aDET2r
	ZHsx3jNOOaUzlc70Hr/CYFHwJMrmbkjeR3/X6YvIa3VWcoHzUYQYkV53Z//t5pCqlpOmDcwdQD8
	b7CQZIWRl8VKqdCdU6OLyjzeTViH/4VnbXiuTadFh89Bc+KFtdLJVrMg/PgwnVKzRtlfKvHsQG+
	azG432e2Gt7PfWamfCA1luzsjbwlTqoNGcTNV3KfuUIZba+haVhoubkYR77iBqh8U3VU0IIYhxl
	6U10hwtXpRb4qL/pH8GKHWP4mrvFZgvk5bo2HPIiPSSc3CcWOz/DIQZHfosdZIOCtjDlR7fCxIx
	3qdod4iksKGy5MuYzKk4DV9ufk+rU=
X-Received: by 2002:a05:693c:2c96:b0:2d2:129a:1694 with SMTP id 5a478bee46e88-2d588e83b84mr13138646eec.18.1776239944934;
        Wed, 15 Apr 2026 00:59:04 -0700 (PDT)
Received: from 8692ffc4d55e ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2de8f6615d5sm1924194eec.24.2026.04.15.00.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 00:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] mainline/master: (build) in
 /tmp/kci/artifacts/build/kselftest/arm64/signal/fake_sigreturn_...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, laura.nao@collabora.com,
 shreeya.patel@collabora.com, broonie@kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 15 Apr 2026 07:59:03 -0000
Message-ID: <177623994357.5959.4911934839986999863@8692ffc4d55e>





Hello,

New build issue found on mainline/master:

---
 in /tmp/kci/artifacts/build/kselftest/arm64/signal/fake_sigreturn_bad_magic (Makefile:21) [logspec:kbuild,kbuild.other]
---

- dashboard: https://d.kernelci.org/i/maestro:5b8b0e14fb5c4341239b6e160d2f4453d8c11905
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  e997ac58ad0b47141c62c79cde8356fe5633287a


Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
': File exists

=====================================================


# Builds where the incident occurred:

## defconfig+allmodconfig on (arm64):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:69def28e9b5a968309e41f39


#kernelci issue maestro:5b8b0e14fb5c4341239b6e160d2f4453d8c11905

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

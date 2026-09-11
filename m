Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DDDE4A6884
	for <regressions@lists.linux.dev>; Fri, 11 Sep 2026 16:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789145965; cv=none; b=PQgeMy82tRWyBs26tzelH8Y9cN6GhZJFhI+YdFu7TI4pEDEQjIYpbbOOuK00ozBxdp6lz+O7v0zw4mP4gtLn1BPc8tIKGUDj+LGK8OAMRIX51Q2e9dUaF+ZENjFxGMlrKczGhX1gnTVtRIunVWQMVSHbEVSLMlqILB1k966+F98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789145965; c=relaxed/simple;
	bh=MpSAouggJUp4vgORobePFMjjqwuonE7VilPHv1CLSaQ=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=skPpUoQDcctezoi2TgH4jenDfCNqElkT95ebosmt3/6I8Ccz0eClcgCL1oYJiSY/Oad921h4y3U8TifP+oDYnrpE/hgFx3PZzHTFin5Z+bz9TXSLML5PkyjPbJFUAp+9TAU2jTFJNJas1E1N9+5sE7IukFvBmEelCdwYRn5pPiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=aTflqBc/; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="aTflqBc/"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-6b12942ed04so1151223eaf.1
        for <regressions@lists.linux.dev>; Fri, 11 Sep 2026 09:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1789145949; x=1789750749; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cnRkQZYF1qes1XmcPRPz5oF/ZwMbgnh7Exnh7T9glGw=;
        b=aTflqBc/hgkrNHlqdXokbZq1gON9G1ocN3AjkPn0Bq4KVFPDk0umPQ2uBBZgk9tEqW
         dYNCoAvzsqJABTa/38SXPeqcwDTqlBfpBJ7OHp2G1XJeyCQcv1Xc3QgwhftljBzpfs2w
         1oCBXFvmS0C6f0X7AV4uf35m+m/YiCcRz26pNfjqgOK7F8JqKj9C8OjYdXD3kVWO9Pjn
         62AXCqI9pQlZkFCx2yjt8LWnsPTq9hNZvtmQWPH2VH/0phtWUgPy4IoBimUazxH+tefP
         51qkb4ymDOmuOfPdULwygL2pkoaOQAKRhJdA9VAem4GPpX+GGyEoOSS5CakOMPDLLaYK
         Qq3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789145949; x=1789750749;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cnRkQZYF1qes1XmcPRPz5oF/ZwMbgnh7Exnh7T9glGw=;
        b=doKGwyE2DHxH9WakBKXqxxcGTsJg/zJEd3h+3VKVNLLHTOjdykOj2Tv9DRXgfRXAVv
         xvr8gYFvkEjbYRKbxN8D5n16AWqSct+o4iwbNnO196s6mlfDmW3PH6XyuDFaIjTCX8SU
         vhuS7fKAOaXCDgyVOlhyOkrS2aYdCISOXa5NrwRV+VoVkCSMROZnOrtf6r4AqLlWShe4
         FE73pk1DayEzn916Hso+m2hu/fycnw+DLBoUEAbgmFJN847BEGwX7BH+lsmo3MyZwToG
         M8TynrUlutCA9bI0/sPqBV3whCOU4RZ2ft77guq79NUe92vGLNq7CUHRYu7KKITeyqo9
         dKmg==
X-Gm-Message-State: AFuF++mre/9r2bpLGSE87w9mP1KlZ9kfm9yXiBzIyNm1MxGa5UvanSMd
	oE0dureB2QWdMtAdSzpOVO2lU6+Q6UDxwd+8K50BpDytEGs2ldb3qZflXflFsJtlnQA=
X-Gm-Gg: AYBFou2LZVGD6vqZxVjwtvNm0IRPyBOz9UFjRTKxFczbbj7bXWDQmUy7uP4ryOD4EYP
	BqIMcUcYQ+z15rWi9GkBQ2/pZzXrvX5COlpzzuWaQjzAA8bK5cYalM8JL0UHP/7Nh90sVs7aGEl
	XXxZMglil3jpzp7TC3zPs9QcJ3vk5glN9mQhKuCWVeval1JFokHm2srx3hgNm6ke/58RMBQ2B4W
	Ypwor4UPr3MXireaehIxBH23ApZWIAMwQLhY80iZXpweeH/U0TQe4aInuZVOn9V5p7KqoPxk4Dl
	rov4R+Y9a3dDUikKT/tfqXk7ogqhipERRO9O0Kx3nXJg5PgYwQfScL5MxAK7EuitaUne06EVeCI
	JYTf/j8sOSr9309I+OzRGH3iRwIAXhRI3lPFz81bUwfYIFBVduEIBtdNmeotvwWTInPgqu6SAnw
	Y3YUK/ilcnSHjX7L6y7HR/7+1f+FMFESABCkO101d7HYFgvemf57T9KJwFTQXFR68=
X-Received: by 2002:a05:6820:1ca7:b0:6be:19a6:fe63 with SMTP id 006d021491bc7-6c0b9d58514mr3746853eaf.25.1789145948673;
        Fri, 11 Sep 2026 09:59:08 -0700 (PDT)
Received: from 41049dfc76e5 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6c0996dc5a6sm3216896eaf.6.2026.09.11.09.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 09:59:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: 
 =?utf-8?b?W1JFR1JFU1NJT05dIG5leHQvbWFzdGVyOiAoYnVpbGQp4oCYcGFyc2VfZWRpZF9j?=
 =?utf-8?b?ZWHigJkgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XZXJyb3I9dW51c2VkLWZ1bmN0?=
 =?utf-8?b?aW9uXSBpbiAuLi4=?=
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 11 Sep 2026 16:59:07 -0000
Message-ID: <178914594745.4423.13336797159691042320@kernelci.org>

New build issue found on next/master:

---
‘parse_edid_cea’ defined but not used [-Werror=unused-function] in drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.o (drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.c) [logspec:kbuild,kbuild.compiler.error]
---

Log excerpt:
=====================================================
/tmp/kci/linux/drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_connector.c:3690:23: error: ‘parse_edid_cea’ defined but not used [-Werror=unused-function]
 3690 | STATIC_IFN_KUNIT bool parse_edid_cea(struct amdgpu_dm_connector *aconnector,
      |                       ^~~~~~~~~~~~~~
cc1: all warnings being treated as errors

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/178914594745.4423.13336797159691042320@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:062b6b4e2382aba3e97943acd24e9dea1debfc26
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  68142f986ff04b2b70b31db00f719bf690f64a9a
- tags: next-20260911

# Builds where the incident occurred:

## x86_64_defconfig+kcidebug+kcidebug-x86_64+x86-board on (x86_64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6aa4280120239ade90233200

## x86_64_defconfig+lab-setup+x86-board+kselftest on (x86_64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6aa427ec20239ade902331e9

## x86_64_defconfig+lab-setup+x86-board+kselftest on (x86_64):
- compiler: gcc-15
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6aa427f020239ade902331ed

#regzbot introduced: f2bfbc3554ca6919484030729424b9dee2942d24..68142f986ff04b2b70b31db00f719bf690f64a9a
#regzbot link: https://d.kernelci.org/i/maestro:062b6b4e2382aba3e97943acd24e9dea1debfc26

#kernelci issue maestro:062b6b4e2382aba3e97943acd24e9dea1debfc26

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

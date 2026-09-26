Received: from mail-dy2-f12.google.com (mail-dy2-f12.google.com [74.125.229.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785B1351C10
	for <regressions@lists.linux.dev>; Sat, 26 Sep 2026 03:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790395150; cv=none; b=NV8Lj+cDVcmJSDYV/xb8F0Dtt1k7xj7Jjtb6SUw2exDa6x9JhqMivB1BOGZLElSGyabPOvdTAJNoFRFXj6DWIGendYOUX7mu8J0VxdsR38qX2Ppc5dYSSxMag/LT5/lnJAZGdySm6cjxxrtO27Fo1eeReNxhJY+tRPbi5J22Qio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790395150; c=relaxed/simple;
	bh=zuHUKIwSX8WV1EfrMEQngzhkusnNQgvAYdbGr1jhLD0=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=cTPeY3bTV/xCerK/z7BO6W5HjBtcqmqkfsQsHwRyrrtKJtr2VaUMpre970q+rLEkKYlcGhBRLMzNXBzN2EZGZEtLR+7Kg6M2/OfJEKIbwpd3d4p6r6Eek9fkQq84Bl3gmkJ4ZcGNWQfZqhVLabs1VsWaFa0HhyEwmBI8MLwHSHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=EA16LoKy; arc=none smtp.client-ip=74.125.229.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="EA16LoKy"
Received: by mail-dy2-f12.google.com with SMTP id 5a478bee46e88-33b9e805130so1047813eec.1
        for <regressions@lists.linux.dev>; Fri, 25 Sep 2026 20:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1790395147; x=1790999947; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P3lE74aWNkzW6vi1lEVaqkJ7vm6Q2cNCEYUIbpGUkjE=;
        b=EA16LoKydCqrIGvza9ixPWk7o54KUoZsc+6nnJLFOT/FVJNEXacUR5uw05Dft9UXPL
         DpUGOtVU2Ge7/0ZrlVGv4ynUvglevblNMnYwX+LP+HDxAEvm+6y4rlERk9fhNNJjtUqZ
         6qHXn+NIYhbe1QKECHMRKH6ZBfg6Zptxlu2fq4uizxyO113cpsBf461vdhksvva6Veig
         KRfkVvrWK+Rwx7Wvb/pxm0GWXt1GYY0MRV1Sq4SZmCvEErpTe0a6Fkgkcs9Kv9bLOKog
         6jdipkBgFj3Zi7uVJrEg1TnZzm8eG1Z8LL574MyN99ueLuscn/D9fJJnyeCbtrnV6Qla
         vHDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790395147; x=1790999947;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P3lE74aWNkzW6vi1lEVaqkJ7vm6Q2cNCEYUIbpGUkjE=;
        b=DDAues34QovjSfRbkSs8RJo0zsgp011tl4hRRWZP3S4bgh0qUq5uZLqZ+zHXz0hJVb
         iu09zNossxsYSyuHYjU3wEu656WlgWxBKvOjpa9rmC/6owBHvP4A3lRUBEKPzsSVIPXH
         cDF0ylTotCMw5FBE3sUNOiht/3O+6fC8PhMpFz9swnwnUlFAEuyZOnvwbuXRnPEtp64x
         ZRZrJ3UAzX3nywF2jRN4/U3F+Yne7ROIQ4d8DltuVXvDI2dckvYcJ0IyEKweDzymriur
         neUB/TRoaaF5b2i6UWNTk+Ys3YWkv/+cH5w59icvruTdq1fTTLv1ZMKJELtp8dEYZ4Mw
         dC0w==
X-Gm-Message-State: AFuF++kwEiXO1uophwBIN8AmibHifuURoRCJ7GR5uW8MU9Fmg3XCqb81
	DKCx0FlpZnxdQBxnOPbt5GD9S+q11bl871OcIB9pQt4EoyWjVAgc56t5tXOeCykWQbRo6WIF10S
	qE0fS
X-Gm-Gg: AYBFou3QEtqLpP6qVBiD4zrq8kdSh62uB2Y0IcdYW9gCKb73SY22QrYiNU64GjsYBCy
	szBy8OnbLUouz/dBsNmv1yU9e1LpLvrIoNhKT07seFca7inx1MXGYpO7xwfPZDxqyCxdI9epVdE
	y6eoLWy0HKw4ypCUKte+8jBhONHc81W0J4SLZ2Fw9FsUvY3bDUtNYcjbzwqRg8mzDu59ER0VvC9
	E7gbA2D2Mvd3AEh7MbhTN0t/Oqm2g5bpxZpVci33HtAvHGPTzbP2J5orndh2fNmT5GlJxpflRR+
	xPmruSMVePkRVrlmK+BPtWine/LRyOLgLn/4hWItXApCqpXefFNBiL3pt/zj7Q6K33jwieyRkBq
	URD+qEmkO9AZc39IVa0aiTlEEwHMiuIUOJYn6X3YKosaegmxWo/UOEWeZ1Mz1u3y2PdfRWCxgkS
	u8QfH+kHGcLTGP7XFm50AGbZjPrJJ/KKZTbOcFpgo2XzAD8DHwXjkTM8SOvp5yBjU=
X-Received: by 2002:a05:7300:a986:b0:328:7033:9b8c with SMTP id 5a478bee46e88-342711ac458mr2791513eec.6.1790395147238;
        Fri, 25 Sep 2026 20:59:07 -0700 (PDT)
Received: from ec7b70f3a45c ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3416e4c2f50sm9968100eec.27.2026.09.25.20.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 20:59:06 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] mainline/master: (build)stack frame size (3096) exceeds
 limit
 (3072) in 'dml_core_mode_prog...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, broonie@kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sat, 26 Sep 2026 03:59:06 -0000
Message-ID: <179039514312.597384.1659548947123427650@kernelci.org>

New build issue found on mainline/master:

---
stack frame size (3096) exceeds limit (3072) in 'dml_core_mode_programming' [-Werror,-Wframe-larger-than] in drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.o (drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.c) [logspec:kbuild,kbuild.compiler.error]
---

Log excerpt:
=====================================================
/tmp/kci/linux/drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.c:10513:13: error: stack frame size (3096) exceeds limit (3072) in 'dml_core_mode_programming' [-Werror,-Wframe-larger-than]
 10513 | static bool dml_core_mode_programming(struct dml2_core_calcs_mode_programming_ex *in_out_params)
       |             ^
1 error generated.

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/179039514312.597384.1659548947123427650@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:24dc0670f5eb776888969170a199e08b7f23f99b
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  6812ce4e4379ffc99c52401ec28f0d7ffbc36206

# Builds where the incident occurred:

## x86_64_defconfig+allmodconfig on (x86_64):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6ab70c1f5ec73975aade9d6e

#regzbot introduced: f14572c203d57492e1d4e5d7851a3b143e083b82..6812ce4e4379ffc99c52401ec28f0d7ffbc36206
#regzbot link: https://d.kernelci.org/i/maestro:24dc0670f5eb776888969170a199e08b7f23f99b

#kernelci issue maestro:24dc0670f5eb776888969170a199e08b7f23f99b

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

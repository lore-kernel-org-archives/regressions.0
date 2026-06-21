Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90642459FE
	for <regressions@lists.linux.dev>; Sun, 21 Jun 2026 05:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782021548; cv=none; b=mL+aZ3yquJbV6FG/gWtyv850aJgkkdwR057BsBl6WhKX99smtoQUAXrQn/PC+UKvPg2lDu/G1TxmbtyqAQqmkgiUXDLiiWmahDhvieMWqgoTWChDtHB5qALAAAdLuYACLEDC7F0R3e1M3/gkF3tJNtuGqO4wskI6t+9+K80vCJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782021548; c=relaxed/simple;
	bh=H1/1MDb/D7Kjkos3LVgpXKGNiwk8KL333tpYMe6H100=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=IKMhjCEogJDeG9nXnKg1qlbQwUt4qAsv/Zj9MZ6w3Sy/EWOtcPCujFFoiFR4BbQd43t5s0YjuERvrNnKwLK4/IYjbldfU8DiSCfwdcsJ/rb4ZKrrdk0nG7emBad451+EXAZ85rtjywm1Uex7Vo+VcGscZaNn/Yks0LXQIvEEMYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=dRYo121G; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="dRYo121G"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-13809223fd4so3663594c88.1
        for <regressions@lists.linux.dev>; Sat, 20 Jun 2026 22:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1782021546; x=1782626346; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P5wAZFRYELJ2mEAMDmRVKOP2kYnEEWuIdIfT6FpmOtk=;
        b=dRYo121Gyx6oeAzTjw/wT36EpHo4BQTnSGiXYdD7Fw7I4qkYxNm8aceCpqx4leN8z9
         otRhiHWMLp6QVWduoIngfP/eTZy/qsHoBh6USDQ+naek8sJBcvMgNi7s6QNZIslR6Cmu
         xhU5XfwUdvy4Z+E0G7n9b6BX8369AkXuTj+473DFbI7EqXT+9F3M1UT6uS92jH/yJK58
         F/glTw2biQWxZDhaHrgvu+1LVHDmMTfmKaaOZQHXZLnTsSumGvvSDpqTXD9II0C2Kmx6
         U9AY1/hWFH1IAv8eO76hqTlTrmqQhIDpcfTKX4OyxF4l68lvgZp6eRQA8ZZfcVHDkFsj
         a6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782021546; x=1782626346;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P5wAZFRYELJ2mEAMDmRVKOP2kYnEEWuIdIfT6FpmOtk=;
        b=mxK0CBNyvjkl54E3AAngZzhqL0Z92EQSdF37SFAXjxT1mQlASngQMNCRtQGlRuZutX
         yVwm3HvWKmRFNZQny4ZhALfUkadhaiZ8P9I0RA/U+2Hwjsl5V39Ihog+qXZYnp2kIw1Q
         npfvGYkkzBPbNvVk7l27nmYuEK+CI2MbqeoEtb6h+nVVKhyJlpsIDjgSEkrPUXkWwNj5
         i7s2BOdMHACTg10A8VNpctBqoWcPO7+dz8rPq44AI0efM3Ma2vkNqfr40eNc8a3GEK1G
         +YDIVugma8GSyqph1VUO8Wr12WEv9UHBRkgZXYsGkFkOWR0cwczTJVtGK/wHWAxQBvhe
         LvBA==
X-Gm-Message-State: AOJu0Yy1LTkFfE3YN+Aqx5GqNP3l8LS8to01LOd+c3268xPnXA6Ip85h
	tHoDBvI4qAQGFlULOedyIhJuhoBE3uLzCdTpkAOuIqeTbDIidEENIxIBhJVkVOQ5eyc=
X-Gm-Gg: AfdE7cndG6n9yH+V1tLsN9mG6hXMP7JCOnVKeppKAymv+/UkteUug0Lxl827vnIDmgo
	vqKEqJbOFwzp9tT/hs9AU3e4JxmeMKCNvmmA+epkKEfqQkcDsZX7aSUkXAdGkQZ+P5IzVCIEAsb
	2RAjnp+b+KadKo8MR6rbN0dTSPFAWf52bjc44GyK6bsrqy5/kyU6Dt6ifzvAQI5LO+jNoVZY33E
	MI4Hn4OeJMHJZW80mwwuPKuHjAOEZVJf/lfNgn2ndIalH1qgIZbWJ99Z8Y+UORG82ON3VZWIpXl
	qqLHrFyZm4iv6iu+0E4H8TriWJxC5kMJKiq0pvy2oCUmG63woZ4zxRPcdP+gWNshs8ldNB+iGHj
	KF0rVc2qEvbamkabE6TWcTOO44zoconcOukXxL0Uu5m99gfqLykmdY5ry6b2OlOHyAFWzF0nW0W
	UmdV6Z7w==
X-Received: by 2002:a05:7022:e989:b0:137:eda3:e5b6 with SMTP id a92af1059eb24-139a386b9famr4494374c88.18.1782021545766;
        Sat, 20 Jun 2026 22:59:05 -0700 (PDT)
Received: from 330cfa3079ca ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139add81933sm4164678c88.14.2026.06.20.22.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jun 2026 22:59:05 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] mainline/master: (build) stack frame size (2104) exceeds
 limit
 (2048) in 'dml314_ModeSuppor...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, laura.nao@collabora.com,
 shreeya.patel@collabora.com, broonie@kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Sun, 21 Jun 2026 05:59:05 -0000
Message-ID: <178202154472.17848.1249364359012752596@330cfa3079ca>





Hello,

New build issue found on mainline/master:

---
 stack frame size (2104) exceeds limit (2048) in 'dml314_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than] in drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.o (drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:ddf05da7c395888ac64f743137f217a6502af995
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  390d73adf896bf4883c7d3bcd13c1b53d64351e3


Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
/tmp/kci/linux/drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn314/display_mode_vba_314.c:3964:6: error: stack frame size (2104) exceeds limit (2048) in 'dml314_ModeSupportAndSystemConfigurationFull' [-Werror,-Wframe-larger-than]
 3964 | void dml314_ModeSupportAndSystemConfigurationFull(struct display_mode_lib *mode_lib)
      |      ^
1 error generated.

=====================================================


# Builds where the incident occurred:

## x86_64_defconfig+kselftest+x86-board on (x86_64):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6a376bd9ec8c023893a84e85


#kernelci issue maestro:ddf05da7c395888ac64f743137f217a6502af995

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

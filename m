Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F1F3D301F
	for <regressions@lists.linux.dev>; Tue,  7 Apr 2026 16:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775581147; cv=none; b=Ez/Ki7bs+7A0BjwK5FHILA0PMYvIAxV1GVcW9eK4bhBieibvbHejpuXGv+MmlwlZONvVvLCt/9PKvHyFfrkb5rFXgr6RvkahI39JxwBVq95iw48xlawQpntIASheagij42qjxDBKly1dRA2kEhLnuDDPMTs2DfPudTXaj4jlP8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775581147; c=relaxed/simple;
	bh=bxYEIMMTVo3a3xUHdj2264nnwkZcK4ge/xjM7PO6BWk=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=tfnafN9OELd9PSagRuyRoevCCvdYowxO14zgZzOsRZaBelcDje3aQtisQypiMyiCQXytttFZt97fX60fSex9x+87g/Cm5dvO/sk+qstw9gVCrKqJyAd4wsUM4GG7juIKX3X5V+eqxZayq7qao7p71owgUKVWcAPM4nch8mnA5QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20251104.gappssmtp.com header.i=@kernelci-org.20251104.gappssmtp.com header.b=VuTS9A24; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20251104.gappssmtp.com header.i=@kernelci-org.20251104.gappssmtp.com header.b="VuTS9A24"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12c15414820so69544c88.0
        for <regressions@lists.linux.dev>; Tue, 07 Apr 2026 09:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20251104.gappssmtp.com; s=20251104; t=1775581145; x=1776185945; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8MfhcsKLB68VuGfp7KQRym1YthVXBJvE5Ws4oGUqa1s=;
        b=VuTS9A249lCK2K/dmcOqtzUAzhdr+4+agkJSJ6PaK50LyDADnLzB0AMA1SOXFzyXEc
         6NtCIiWAE5heKPBoUUfVdtQJX/KXFSmNAqr4chQ+4YGHBBm5mv3n4Ll2at7Zjai9yq8j
         qob3db26GHJhGOS/VLVMDAFWb3GVScUCBS+Lfqd215P40PhYy9gREbFPPLTUwm3FXg7V
         b3o3rVbhgX1pawgTVDefTfQdOo1UzxkvA5EnATt/0sGbTl+I4Z7St7zZKL2mWuPEkQ4Q
         tsi1VtV2QY5vRcZdG16vexFAK4p+JcKYefKaqcQYRdGpM+M/4EM9ar8+GR9rqQnl9Tpz
         edVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775581145; x=1776185945;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8MfhcsKLB68VuGfp7KQRym1YthVXBJvE5Ws4oGUqa1s=;
        b=ryZ80DBGynl7P02nykxsgiMzT+eUv49X78OsY8gxmqHYciiRnvY0L1qX2O0iEtxoyZ
         J+egFJ2TOoAaeEDG/qcIgyLU265tbJiX0nZwb6AiBRz1HxSxoPDD7AXJcVG9a7WXUGF6
         bq0KBFhy7dGT7dp6jok1UYONXeODCaJi5fNfEUU4QOnuLssJ2WxNrhy5+KTcPQDY8m1u
         /HLybs3UQjwhoPQZYUAEgN69lTZyAmrEKwmoYW9P6Jox1RknVx6gOIOHOXrEavnTQSAn
         SGyURjpHPIdbtN0icBieAO+iPSL2i910iBYEsjUMM5NMaXqMXVVtZ23FgdQoPYSvVj9p
         UXmQ==
X-Gm-Message-State: AOJu0Yydh4VjRyifTCTnlGCYglohwjmCEeJ//zT1j1i1qfnhDKoDayja
	E93Ht2kq0qimhSk1WuPlfQ31XxFAcJ+cSVKxPpit18l5D2zlncpzbst1DcV8dqDYHmY/1W7Xm2G
	PmhIP
X-Gm-Gg: AeBDies5cFajvpoOo4lbiqt6xNtpKzkiw+VLQBtecD8p86t8mmLwWUM396RY245Ae+z
	t6vuIafKhdUand/d3/aqi8Ie9gLVLwsxpxtRllRTMAQ0KwXq5kE3YtJG9AyvF1mtloD3FCdO9sB
	+Y95FoY4hcK8i5z75d5qHOhh+NTP7YZNUxHkcl7uc433cHfpsP9i7UkXtKdet9pfNSrWMn653hE
	mk8/aVjWqcyKuhhYjHMLWfhincdQb4mb1jWDxVYfesLwedswWe38g163V/83xUodcWxBLXYhvN2
	CKCuZp/Ii/JqDU9ewwsUSJJoRZcQS79OzWzdrydBoeMeT/QpBUZV+ijqzPjOmJYSPCGCHzI4oI9
	kz0V6mtBJ/1/Z6xwYHL7aSxNAAEQCZhlIEDokl4RgXLj+RU86XNZ2DQr8Kn8Pfn/ql64nv7zrBZ
	MtphRtWrqSpoFcjbAMVcEKrDf3WPg=
X-Received: by 2002:a05:7022:f91:b0:12c:43:3ffc with SMTP id a92af1059eb24-12c00434d39mr6192958c88.0.1775581144909;
        Tue, 07 Apr 2026 09:59:04 -0700 (PDT)
Received: from 8692ffc4d55e ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bedd4e4e3sm14570001c88.1.2026.04.07.09.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 09:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) in
 testcases/fake_sigreturn_missing_fpsimd
 (Makefile:31) [logspec:...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Tue, 07 Apr 2026 16:59:04 -0000
Message-ID: <177558114382.2455.7736704922788141563@8692ffc4d55e>





Hello,

New build issue found on next/master:

---
 in testcases/fake_sigreturn_missing_fpsimd (Makefile:31) [logspec:kbuild,kbuild.other]
---

- dashboard: https://d.kernelci.org/i/maestro:8c6389d41c0076496aa18ee93b07c00f7335bcff
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  f3e6330d7fe42b204af05a2dbc68b379e0ad179e
- tags: next-20260407

Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================

=====================================================


# Builds where the incident occurred:

## defconfig+arm64-chromebook+kselftest on (arm64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:69d51d69dcae953c056f9648


#kernelci issue maestro:8c6389d41c0076496aa18ee93b07c00f7335bcff

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

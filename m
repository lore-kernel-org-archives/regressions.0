Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C71413247
	for <regressions@lists.linux.dev>; Mon, 14 Sep 2026 17:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789408746; cv=none; b=av7njgd+09BEDizJB14/0AL/kCkINyGBwwH3Ko9lLbHJNjwN0NrLoZqKNaFo9KQxTlybsdtde3u60uGBbnFnZavYynNlcN+OBNGSnKqU+ibK/e+GNp1RIxfeZ/LKyHdsa+WL8M0ZFq+aAzVr+FAPHDl+LKuYMY3gIb0JJpxpnyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789408746; c=relaxed/simple;
	bh=WzleuQKnB3OB7pki3mFoHDobbeyqCiA/ye/oWvO1CbU=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=QqSw/AYG1GRKDuu65s9CEMypMVh8r+wLNmoFHMAS6GVJN1cMpWAiL0cPPYkuULy+XPd5q+VSlrVl6cFzcowDnmG5JADH/9Xla6/dpG7oNa3JU8PRpGnNQIfERIKL5LlRrA0wnyvVoSLHazX7z36i9g+Qzmt+OitVj9LjVvh74K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=NXUbCdzg; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="NXUbCdzg"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-868cfc5c244so1450610b3a.3
        for <regressions@lists.linux.dev>; Mon, 14 Sep 2026 10:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1789408744; x=1790013544; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oZap9/ymhT7fY0nhpoaZDLWxf8RD3Ap+R6zOXM0ESLg=;
        b=NXUbCdzg7NO2Q6bd8/A+BBGvmu8P8XsW5Rps56QG3o+mPCTbHQ7Ko7ccpAU/q9w4+/
         Enjiast7qVSvt90P2WIsPx4tM18g4x9SQubCxw2poXidUJhe0gxuYtRtBxosy7PJgx1W
         EA0DwBnFenXOnHcnRdK1E9OrByM0wqChjyPY56KhHjPMvoznBZ9u1aiGrQ0sLtb9c539
         f7O1pxTB7z1fmX7HOMj+VHug8R1hDEaurxp2TEeuBQWqXH3/tn4fVh+8Wv4i/CloYREo
         d2aU44TTWAlXOVUkdE51kUskSNEsxvqQm7xa7+4F2vXGhX5ThJrprvHlTK1QAx29nZ/J
         iavA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789408744; x=1790013544;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oZap9/ymhT7fY0nhpoaZDLWxf8RD3Ap+R6zOXM0ESLg=;
        b=E6m0HumEg7zI3MWLQRaBBPkTW+yYfnVq5Awll5GWQ81MfzVl6P22w7c3HDJqRKa0JY
         +1ojYwb6i+tEncF7PJ+GFbaiH1DFJ/v7sEElC9PqhrdgsfymjQjw6vlfYyTSKcxqpO9l
         5oErperQutEzFV/z+AQbpH9tAGFT+LClBjeTJtfVaRctU/zMzYRZs6/u34QHTgfCFqe1
         sok+6SYv0wdNpQ5jDfDJ6PAmle+j2Vw9b2jk+FL153tdwaicOzKtzv5zK1jUdtVGaXbg
         2jfyjZiCBtyZtG5PjEj2dsq38XEGyDZ6yKcX/FAIwIUACHDa7QZfiGuYJZXCdwZ+Gw2g
         Jxkw==
X-Gm-Message-State: AFuF++ndCGXK26Oa6Mw0gqLVmk1lhiEYhMTOOgbAbCUJThyXGECaOzGy
	gCAOAN2PMjRZWjz5A7GSmmpR9oPbqJxfPZP0bLxDTJizxu4wtS/lQuJ0+J/2NLbwHWI=
X-Gm-Gg: AYBFou3HRodyTu2FeJaYhAhpuVOVMnGNtP8Qn33BOgb0q5144cVMkpkqlnGslG79/uv
	iI/2WpgzUUGeSTtCVmOWlaOH5kBGJXwh1jtLJiYqJYnEVGvoG/kZw4JemrDgqST5WG5ZEygdTR6
	tg9L1AG7NKwj43zJv3XCbhG1QiY3jGQkaGvp0vAAoZOG5DvXeR+AW1rvhXpi3K1d6KEwRK64tGb
	h8t2/vONqRy3g2iX2Fk1jXB9eWUjTl1ArfV9uYuN3chPlz79dNBAJw80rhq0jRAjbyI7C0SMRFl
	UcsmOzKelIQMlNNC4Q3QdUpxpf6pR8CFeLG6EmwE7UYPkk7IZchCimJ6ufonqi1sZlVS+PFoLse
	mUpZFcuOpFUlIYpMnqLMz5v22ZkiEEHoGzZx+d9GHq78vtD3Z9HSC2sesSpAfK07U/jIEhWRkd8
	uBFVgl+y9WYDEp6ImZUnks11x+EooOFoYdach9/9RAHvdOtB4lfJ4yF0dbHXMQMqk=
X-Received: by 2002:a05:6a20:4323:b0:3d2:df:1854 with SMTP id adf61e73a8af0-3db4044754dmr6642371637.6.1789408743790;
        Mon, 14 Sep 2026 10:59:03 -0700 (PDT)
Received: from 41049dfc76e5 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e9a3casm26677436eec.12.2026.09.14.10.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 10:59:03 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: 
 =?utf-8?b?W1JFR1JFU1NJT05dIG5leHQvbWFzdGVyOiAoYnVpbGQp4oCYdHBtX3Rpc19yZXN1?=
 =?utf-8?b?bWXigJkgdW5kZWNsYXJlZCBoZXJlIChub3QgaW4gYSBmdW5jdGlvbik7IGRpZCB5?=
 =?utf-8?b?b3UgbWVhbiAuLi4=?=
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Mon, 14 Sep 2026 17:59:03 -0000
Message-ID: <178940874287.1087.18054581149136757738@kernelci.org>

New build issue found on next/master:

---
‘tpm_tis_resume’ undeclared here (not in a function); did you mean ‘tpm_tis_remove’? in drivers/char/tpm/tpm_tis.o (drivers/char/tpm/tpm_tis.c) [logspec:kbuild,kbuild.compiler.error]
---

Log excerpt:
=====================================================
/tmp/kci/linux/drivers/char/tpm/tpm_tis.c:249:61: error: ‘tpm_tis_resume’ undeclared here (not in a function); did you mean ‘tpm_tis_remove’?
  249 | static DEFINE_SIMPLE_DEV_PM_OPS(tpm_tis_pm, tpm_pm_suspend, tpm_tis_resume);
      |                                                             ^~~~~~~~~~~~~~
/tmp/kci/linux/include/linux/util_macros.h:136:44: note: in definition of macro ‘PTR_IF’
  136 | #define PTR_IF(cond, ptr)       ((cond) ? (ptr) : NULL)
      |                                            ^~~
/tmp/kci/linux/include/linux/pm.h:316:19: note: in expansion of macro ‘pm_sleep_ptr’
  316 |         .resume = pm_sleep_ptr(resume_fn), \
      |                   ^~~~~~~~~~~~
/tmp/kci/linux/include/linux/pm.h:375:9: note: in expansion of macro ‘SYSTEM_SLEEP_PM_OPS’
  375 |         SYSTEM_SLEEP_PM_OPS(suspend_fn, resume_fn) \
      |         ^~~~~~~~~~~~~~~~~~~
/tmp/kci/linux/include/linux/pm.h:417:9: note: in expansion of macro ‘_DEFINE_DEV_PM_OPS’
  417 |         _DEFINE_DEV_PM_OPS(name, suspend_fn, resume_fn, NULL, NULL, NULL)
      |         ^~~~~~~~~~~~~~~~~~
/tmp/kci/linux/drivers/char/tpm/tpm_tis.c:249:8: note: in expansion of macro ‘DEFINE_SIMPLE_DEV_PM_OPS’
  249 | static DEFINE_SIMPLE_DEV_PM_OPS(tpm_tis_pm, tpm_pm_suspend, tpm_tis_resume);
      |        ^~~~~~~~~~~~~~~~~~~~~~~~

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/178940874287.1087.18054581149136757738@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:70dc580f14443e704913c358990be2bc69fa5c28
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
- tags: next-20260914

# Builds where the incident occurred:

## x86_64_defconfig+allnoconfig+x86-board on (x86_64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6aa828c820239ade90355cb6

#regzbot introduced: 68142f986ff04b2b70b31db00f719bf690f64a9a..1a1de54f7369cd2b5bac0f265910e60ad3a6b4c3
#regzbot link: https://d.kernelci.org/i/maestro:70dc580f14443e704913c358990be2bc69fa5c28

#kernelci issue maestro:70dc580f14443e704913c358990be2bc69fa5c28

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

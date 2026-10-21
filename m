Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792558750;
	b=d5K3LVzhRosj/RTPQpAF35XEb6U3MTR0BzOWxHngFBL4fruNklFTaEqLs0pFzNVQ3Nk1
	 M9RuQfpwE2TOuw0jhJvPuxwfBRQO9+hl4qLliloSKrTOzKDRFSZcLmTNglGe1TFf3lQw2
	 kAuRvW+vaKJZHT1/UBzJ+pzERkYyboJIbrnV5B8xE4EEx3jc2EkXUfm4zbRralaGj9/V+
	 tnjC2sauT18aXHhrog005GpeHLFV8Isu6v5egjjAb/8+YybPiohMCXVKfIy6hMM4W998U
	 nnpE8y3kPPG90SBAc6E4xBMWuztwuWR4yhPoywocQ94S8z8hPrXM8QxHLIlLL3JMl2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792558750;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Reply-To:
	 Date:Message-ID;
	bh=EoB0fH6dU+uopHGXY6SSbu0vN4QlNRItxhwhcXxy8xY=;
	b=Ywdws7+CC8wEXz619B08XK4rjERiip8WfI996WmlZWb4D3dNnVoLf23nGhvLoigXoaJA
	 Frr/hawEvQBoo51gif6NG4hroTJPD5deuTKGhcSxHJTBJsDdwWdU5CGgz93n9E4LAknoO
	 Gp5tpGRfOz/oeQX2GCjGIwMqs8cvUHpkXXn922srYJ6rSQZng1P+MClm+ILRl+pk+TM6f
	 sCxv3CYgZo+XhIpGUbWsRwCGP2eixBFXt7CJbwxtu1QVDRlVYuIiJgzyh39ujmVE8XxMV
	 sJb1ZteizrUXYupuseTToWFr2tABFDVv/UzmK0FcPbzaGu2kcQLk34uQhQoOZcFiSHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=KOwL1W8i;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20FB1606A319
	for <regressions@lists.linux.dev>; Wed, 21 Oct 2026 04:59:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20FB1606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=KOwL1W8i
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3282db206d3so726014eec.0
        for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 21:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1792558749; x=1793163549; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EoB0fH6dU+uopHGXY6SSbu0vN4QlNRItxhwhcXxy8xY=;
        b=KOwL1W8iT4dl66XYqmLFdMODvMZH3nYJ+xwnQ57J7tU1rGXifZt0dATkIdSTrom09Z
         03wAL6ZUjPRjO8+xEeLTr+6G5Ac9SHj3XUJpXxlDh8SnHuSykXJcZRgAZypkiD0WQLO4
         h8v30A59xHwThGyOEEqaaPyLtI/k2XdW2eMnkJMVMn/S8wixmIPV55osWy6IgiO4HmEP
         UdDscVaqWZKMM2z8QwJFGLAeimA4UdXL1zgeRipgEWzasfJz41tWCcONYhKkEVsc8jYE
         pkMw3gOgJoIY3DK+ngYdbaOpLBWOP2qTdtyg2b2r6+X+GgPSL/5bqjbRkmh8mDm3xFrY
         VbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792558749; x=1793163549;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EoB0fH6dU+uopHGXY6SSbu0vN4QlNRItxhwhcXxy8xY=;
        b=eU3+jmPvqehVHt8ntsGAPkLdH03TP1Qvej5X4XIe8mU/qFy8AGG9HdPwAiuhoFgNSW
         U2cjCChan6Vj6aXC6NqtGXze8E8qcj8ZWCZfEpEx93Jw0XkjyEtaFeCP6uaUbN5l2WOT
         WSWLbBZTq/jRcF/licfg6OjY+L+X87jBwWXVbXDtfGMxixBHDl7jF8fcbJTaBMyJQTM9
         aa8dNikUXhaHyGKdYqgpw0arEhnCcbDTEHMASnIhfzHdnJbGydfxtypxV18wxg6ECWj4
         qVS1ngQUClWV+61LvT9PNxJ4zxUQId7Y4HGZo1iHYF+fSK53a/iDlYpoNXQG5FGwuCRu
         TAyA==
X-Gm-Message-State: AFq9FYIr/Z4RGVE1W4wdL757N5X0Ye7B77htt7TDaoo2XzMkKkWlRHdf
	HYCTpTV3F1T1lryC06piIM5X0xKorn20+YOwuTNbdnU+C7sYAYXZb4UNoH5rLGzXEqU=
X-Gm-Gg: AYBFou1NAjk3M7Obb1nYyb1mIdF8v8ZgUn1vIrMiUSBHZCmamSlxFMYuqCMH5s1FND6
	WMFG6UqKhHpFaLBCJzow5d/UhQnQjmKTXoul/2N/S7btdtaIASi6bcVEfCpz+C7Nc5PLwN2sp8o
	aLENgcqH/Txk+B5gVcABkuQLme4sD+Cc0gfWrq6wIUsedBZOn58hnrKIycih1NeRLD38rj2aRZ+
	XDgxexTag/loWn4XgjIXbiY2u6r6tuESejIpWUjU7O78NzBqHCz/xq2hwtrQqpH59NA+5s2urjG
	u5SJ4o5nHote6S3nkgl+oWuuaYK8NJ2diFda3yUMK7O5HLKwUz7XtI8CIN6f7LGCo2/1wf7O62H
	lhY7RtGpzjQMHZ0F6lhbYg3/4ZZIo+r5GLyjiE3p0Je0g03oh/4FzYskgOyTyIeJxqbbM+Ic2tL
	y++3UUMDICHsq9Eocm1zqw2yG1UTymGnoXOAwvHsf6CQp9IsXEtZJUwfYO9ykzq/nF8nxnuvS3G
	a5Dv0GDxnRcQ2VP9g0KdbbM4DqyoZCP5I0mPRfbf7gCzHup
X-Received: by 2002:a05:7300:2152:b0:35c:dd03:55d2 with SMTP id 5a478bee46e88-3674db4d057mr2613483eec.26.1792558749066;
        Tue, 20 Oct 2026 21:59:09 -0700 (PDT)
Received: from 6e52bff8000c ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367417a2fadsm3195249eec.21.2026.10.20.21.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 21:59:08 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] mainline/master: (build)incompatible function pointer
 types
 initializing 'int (*)(const str...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, broonie@kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 21 Oct 2026 04:59:08 -0000
Message-ID: <179255874376.229129.7672817283004985497@kernelci.org>

New build issue found on mainline/master:

---
incompatible function pointer types initializing 'int (*)(const struct mnt_idmap *, struct dentry *, struct file_kattr *)' with an expression of type 'int (struct mnt_idmap *, struct dentry *, struct file_kattr *)' [-Wincompatible-function-pointer-types] in fs/smb/client/cifsfs.o (fs/smb/client/cifsfs.c) [logspec:kbuild,kbuild.compiler.error]
---

Log excerpt:
=====================================================
/tmp/kci/linux/fs/smb/client/cifsfs.c:1258:18: error: incompatible function pointer types initializing 'int (*)(const struct mnt_idmap *, struct dentry *, struct file_kattr *)' with an expression of type 'int (struct mnt_idmap *, struct dentry *, struct file_kattr *)' [-Wincompatible-function-pointer-types]
 1258 |         .fileattr_set = cifs_fileattr_set,
      |                         ^~~~~~~~~~~~~~~~~
/tmp/kci/linux/fs/smb/client/cifsfs.c:1270:18: error: incompatible function pointer types initializing 'int (*)(const struct mnt_idmap *, struct dentry *, struct file_kattr *)' with an expression of type 'int (struct mnt_idmap *, struct dentry *, struct file_kattr *)' [-Wincompatible-function-pointer-types]
 1270 |         .fileattr_set = cifs_fileattr_set,
      |                         ^~~~~~~~~~~~~~~~~
2 errors generated.

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/179255874376.229129.7672817283004985497@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:74958883fea818849e2aef26023e1767a379290e
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  744e5400b36f84b4816e3ff8531ec2dff52b474c

# Builds where the incident occurred:

## defconfig+allmodconfig+CONFIG_FRAME_WARN=2048 on (arm):
- compiler: clang-21
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6ad82c4055fda507605473a4

#regzbot introduced: 9e73b189c88fcba63af4775d637d395de0af4fdb..744e5400b36f84b4816e3ff8531ec2dff52b474c
#regzbot link: https://d.kernelci.org/i/maestro:74958883fea818849e2aef26023e1767a379290e

#kernelci issue maestro:74958883fea818849e2aef26023e1767a379290e

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

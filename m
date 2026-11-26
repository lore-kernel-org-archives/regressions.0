Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672745;
	b=P5wjDiIzsDYV0/oOJFSO31ZKUPUraarMUE+EZuhDAl8pN+qfY3LIXVP08Jd0xZFN3f01
	 8hWNd3zs+MusyUGISplTyGDKFRTLRkZS33I2/g0y2z1FLL+YNUU1qBS6khZuS+cw17fcZ
	 YwAAR88MoC+YNqph0RVbL9i3Oz084v+tbIHg/boowiwQMIFZHLXMdEvWv3Ikes/Da5l/C
	 e7xhg4cLnfB8nMxGEK884EVlTRfntjQAfWqY9TFs2VYuSrVTCdjRPeqK/6EH5zYlEEMCu
	 GiIUDcmqVlyiwP/dwQs0tCqozX94q8wFgLZerjbQ3YGcvpgciTna7SwxkfcZNj+hXJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672745;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Content-Type:
	 MIME-Version:Content-Transfer-Encoding:Subject:From:To:Cc:Reply-To:
	 Date:Message-ID;
	bh=qyZdDYlMmEC9ntz2nRQ538SPS/0NkxEo3lgbsPGpSAw=;
	b=ACCEfGraISST2I+pYCUVFtkuR/lGW/OixXkLqAIQWBtAh11GCB5qDCUzmwZan3ueX8s0
	 SOn+Y7B9W/dgTm1CCZaMYD0Y9m9OPC809VmmMigepdW10C8gikgGfRl0dBAgc0WLCUFYz
	 HrC/ZtvNCCHsYkgKzROzhPoQsNqvw2inHiuppY+YBfbHr5RYT7wKpcANQSGu8ARhizEFn
	 wed/0ihe2SXltFhzEjKk8D/ZxSoNpzqmXzY8iqnv79QoetsXMuuZgahR8go4DgDzWes8j
	 l5nNYHyaRZjNM2Y0/ih4+aD43k/GNpDiO1rfjAXmU9FFTfzBwQl8gVfMT6aUxaTWe0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelci.org;
	spf=pass smtp.mailfrom=kernelci.org;
	dkim=pass header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=McMEXucd;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D450606A32A
	for <regressions@lists.linux.dev>; Thu, 26 Nov 2026 05:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D450606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelci.org header.i=@kernelci.org header.a=rsa-sha256 header.s=google header.b=McMEXucd
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-386c4d2e2ccso4229370eec.0
        for <regressions@lists.linux.dev>; Wed, 25 Nov 2026 21:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1795672744; x=1796277544; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qyZdDYlMmEC9ntz2nRQ538SPS/0NkxEo3lgbsPGpSAw=;
        b=McMEXucdBvQ35IHTOc+6HLEhotEFOH2mXsXpVK96LFhSrx7UeaLzKNSw49j1g+8eLP
         gNqWGeOuPdFsFgX4jwSMJJd3hiS0AHWzhO2ZgZUffaVaMqjOAvF935zGihFJzW+TdRe2
         b7VaWai7+qRUh9dwjqBo4v2b3K4JsPBLeTeZuLNIUHW7QGskXxr+nPickGQ8EWIcO23k
         mQPwupp1M8/VgD/BSYhm3Uy19VAfGQZqqWyvW88TtnqQY06SvGN98s2wHIt/N/8Bi7BE
         +RJTqpElAoKFhcrHfoZGPvZoc6p1QuPGoT416KCE55ox+U2oJfwv1T3mThfOe9CgEC8V
         5bsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795672744; x=1796277544;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qyZdDYlMmEC9ntz2nRQ538SPS/0NkxEo3lgbsPGpSAw=;
        b=mwU/LHb2IgbATzMCjWUC9/IXSGvsXMFdA91nQyaEkxhsfMbgm1DsmfTZKDrQE7KCaO
         MyzUx2aJJPvyiBlTjtrzCD4O+Fm2aYLefvcNbdUo43Umf8qSEjiXhtv5ES3oe2GzIRHi
         f6I0kDxdxpZQ4zFvHkHXYr2VoKrGlyTZfSylzwVmWFicfaMD4vrhTuq54toFQp68lx/p
         HstNbjwClb+q9eAPBYBLZiZTkNyC2vR/6iiQ91sx4PiytOh3+gbEh4U4CRvIQj+oyxo6
         +OAOkBhIsDX2ugbUzQqmLm7ZtpdvLPgZCyV1p/+VokLeW86SAYuBuGWyGWboh0dGk71a
         Y1pQ==
X-Gm-Message-State: APuU4Z8iX3CEtrTovwaRDPqYKFUXQEcBLNgWKNZrneIMvN91pNPnkjQs
	LermnkTO6W5RhYAuOb2kDrZTlcHeNwlWs/aHvbWO+ILwGxolErbizxjWc7SuPWJQSVQ=
X-Gm-Gg: AZFdTZfFfzqpRF6Y4bi8IFkGEN3EfJ/XTn26vPamz+2BPaIJa5jIV/vC9p2zCJd1p8W
	MkwbegGVFXjJKiP1qXHyN5C99u4FAGEunyL7itCT5kNEEu1sWyd5UGyl05+t0sxHmCspLAHyw6G
	tBCFvsvD5F3s4d5Hiftpc5ZvDLeHVBDVSakyGQQ0WdiC0wCX1wnFraMKkb5Hjn+S3VtmgTTgnuv
	DXI4/FBC12AzJfLR7yU7RWlu1ZGAb8dj/hiRft87Oe7myjfHxeG+W87z1NacDE3dcvTBK8aoAAR
	q7oN5XhuIJB8nEkmaiQYy+Nz/sZx4Z8AB08RmRFsDE93m0/c2rAuTKEuH7ABAgTX0nC9PevH/Op
	vmBunW4FueP+gXKExsBIS8mAwCYqEc7dO+qd/qnfO8Oqp79qPFUFqxugofjWF6lHSyYLE4hqQdb
	0d/u+DiOCbfFn+2naPkGSsef0S7E0FLXh2u71G8qY5cC2Gyztsj9v9cAQhyl8ST7yG/Cpa2lFN2
	mpXrIVbUHyItL0GdJwf0E/LQUJy9XcS3EfCbXho/1wBTYyE1LjxfGVl2ZjfAM4UvsZg5IzAn7mo
	VCgE9+RsQ+4Xjbj8y/Q2qQDW+nN+aBgrNv3i3UtPq+Mh
X-Received: by 2002:a05:7300:2301:b0:385:4c54:3c8c with SMTP id 5a478bee46e88-3856c0c9403mr29571492eec.1.1795672744187;
        Wed, 25 Nov 2026 21:59:04 -0800 (PST)
Received: from 52d83ede7c60 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm72395139eec.5.2026.11.25.21.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:59:03 -0800 (PST)
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
Subject: [REGRESSION] mainline/master: (build)Error in
 /tmp/kci/kernel_build/tests/shell/lib/perf_metric_validati...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, broonie@kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Thu, 26 Nov 2026 05:59:03 -0000
Message-ID: <179567274323.135335.4475481346755496874@kernelci.org>

Cc from: regression/mainline.yaml

New build issue found on mainline/master:

---
Error in /tmp/kci/kernel_build/tests/shell/lib/perf_metric_validation.py.mypy_log (tests/Build:110) [logspec:kbuild,kbuild.other]
---

Log excerpt:
=====================================================
make[3]: *** [tests/Build:110: /tmp/kci/kernel_build/tests/shell/lib/perf_metric_validation.py.mypy_log] Error 1

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/179567274323.135335.4475481346755496874@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:888c785e73281b09da1bcba6758e3a726ac881a3
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  40212b29a6f718d4e7fb3275cede181cb8e137cf

# Builds where the incident occurred:

## defconfig+lab-setup+perf+perf-arm64 on (arm64):
- compiler: gcc-14
- config: None
- dashboard: https://d.kernelci.org/build/maestro:6b07b935286e1965ecbc7219

#kernelci issue maestro:888c785e73281b09da1bcba6758e3a726ac881a3

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

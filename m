Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5C62D8DB8
	for <regressions@lists.linux.dev>; Wed, 22 Oct 2025 04:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761109147; cv=none; b=K2qT1mQaVGHPCzdYWY97lId9JoL+Ulg7mqTFO02+ng+EWdj39dYwguM0F/E18jWjLlrYiz2iYLO4r4bn4tMxVZRG6tJJsslhap7TaQLlSk6oW2NmvxC9L/IxA20H6n0lfodXoGVRgFg2jS2lwK+LPBUP90xL4hYizCab+Ngv8Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761109147; c=relaxed/simple;
	bh=KhqM1NrT/8XQgZX2oLYZnYQtiWE7ZB8lY5Pxm0UGfrs=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=MqMAN5dSQDebpmX5gZretNd/Wg/Fa3W05m9t3+BG0csKIr5+lk7cwxL0GnB/i3zw8tpmlAbWuZa2G3KhRCyJg0/cgSh5fzjIrnXmcjKQXEt9y5m8iAfEj/MfVURJjbsthI1gtRb6DWGejjqrNRtwIrh7UQjR1RelmMu4ABd/8r4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=ymmWNamS; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="ymmWNamS"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-33d962c0e9aso466070a91.0
        for <regressions@lists.linux.dev>; Tue, 21 Oct 2025 21:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1761109145; x=1761713945; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XljzsX8rFdvLVOxvx3w7VqFqu1GNuTKVNMAlBz/xv0A=;
        b=ymmWNamSLB0r9HRd2VMKD1PBFHm4w8z3r045kzVmqQ4Sad4aEsuphJedTXlzMkjfBI
         dqb4PRS81sCbJwAlYeqm6aNmCgnta9Jmi8lOQ/ECC9aGOAkTmnoVcOlMX0HpSkJbx9NA
         x8IJSEvEAcUpNUKkehWT1zBqDQVxDpaVpDIbqjUKjxrPNkPAisO+qLVedsquRytOjB3T
         eomgjaYqqVRWz/a7b4DjdCDvjwXLCwxMzSnC/9wnDN/F10JjE7WmVPpg/wDHJIz2Utws
         j3KzkE+LGmX0hyOAxN8X9z5vIm+wG5uHd1Xek0s3k8EUkoNPOLoRQDcN030z8noT5WCF
         dpuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761109145; x=1761713945;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XljzsX8rFdvLVOxvx3w7VqFqu1GNuTKVNMAlBz/xv0A=;
        b=vbBjAJDQbEtrrVo/feGZr1Kok2RnLTWDmNFw2iu0/2BkG/QecXjjNp+UcyIC2re7Gx
         KttyeSgT8b6xfgmcvcCjR6e6rjecjedFqhpOV0Cx9IGaR0+xDRtVtnhPYGSpIt06hh0D
         TYqQtAHYrfDrTvR7X6oZ+YcatZlGACxm7qEzy3dS8GY5AeBQ6Wm+9IpivFpOnx+x1XF5
         4kzFM0mrJvlt1Vatc2CH5uP/8rx+V5qwpyi/1pEqCV+KjIOnwe28Shs+hOHDMmr1y8S7
         K5QNZjsVStbzUwQmHpjaVINhwtoTQ5AA72+BpifbCKg1X3mkfqGkh7Z3Kdga1tN3OX0l
         z4WQ==
X-Gm-Message-State: AOJu0YxWkFj/XSQ7Ymv1q9HyR9z0Gamim8dv0RmkGjVs1B7QEpqVSe3N
	DAjKz9RUAciL0pF0U6YvzgHcf0T88pivJuoRs+OulUpzekI1PLuED51lvCKrnhRGB3+bXKp4wbp
	PzWpb
X-Gm-Gg: ASbGnct+rFl7pakJ8UovVTx6DgB1IbyNW5QCFN15xr45QHiQ1zCYtrzQi0+9ZRHaNJN
	ft1aijsGcjM8Y3NbdtCWuhRDDEZABi1HN+WIRJfo+8sGhPRRviLMUHWimM9yLpLPSqBUIBEbUrH
	VZxn6wl6Avs7PJXmFgaoIV+MkDKINRwMxiOU7NpiQFoh4WMM+SlGJqR7q7PVpuUM4s7WA7uulqx
	6p91Tce77hQCB/c9Ezhl1KbKnfd6qLly9E8XuJnkUuS+aeclr3LWgVz7aMbyXpeRNpUf78zOnY6
	3QyiSVJ1OWL/iHIJlulabTa5pDdqPznyE4M/2lUXQFrmMKeTPMPE5k+uWEOU5TJfHKfRjPmeaFy
	rMTlcMUg5pP6P1VeDh9v0ImD5hjh85wCjATi20OJdsYehpyIyHyEuKV6mQ0VRp8Ets/FJ1w==
X-Google-Smtp-Source: AGHT+IGGrOExh+SSr7Xifn+Bg1nCtg/cwiq7wtsYAbA6u+ujfGROcYrCEOCfEz0xmUMPv0o2MclUSg==
X-Received: by 2002:a17:90b:1e42:b0:33b:dff1:5f44 with SMTP id 98e67ed59e1d1-33e905eed0fmr181531a91.6.1761109144734;
        Tue, 21 Oct 2025 21:59:04 -0700 (PDT)
Received: from 15dd6324cc71 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a23010e25asm13084992b3a.56.2025.10.21.21.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 21:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) variable 'sqe' is uninitialized
 when used
 here [-Werror,-Wuninitia...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Wed, 22 Oct 2025 04:59:03 -0000
Message-ID: <176110914348.5309.724397608932251368@15dd6324cc71>





Hello,

New build issue found on next/master:

---
 variable 'sqe' is uninitialized when used here [-Werror,-Wuninitialized] in io_uring/fdinfo.o (io_uring/fdinfo.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:764471d48b9e1faab06d96f79a325cdcf2a995b7
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  aaa9c3550b60d6259d6ea8b1175ade8d1242444e
- tags: next-20251022


Log excerpt:
=====================================================
io_uring/fdinfo.c:103:22: error: variable 'sqe' is uninitialized when used here [-Werror,-Wuninitialized]
  103 |                 opcode = READ_ONCE(sqe->opcode);
      |                                    ^~~
./include/asm-generic/rwonce.h:50:14: note: expanded from macro 'READ_ONCE'
   50 |         __READ_ONCE(x);                                                 \
        AR      drivers/irqchip/built-in.a
|                     ^
./include/asm-generic/rwonce.h:44:72: note: expanded from macro '__READ_ONCE'
   44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
      |                                                                         ^
io_uring/fdinfo.c:92:27: note: initialize the variable 'sqe' to silence this warning
   92 |                 struct io_uring_sqe *sqe;
      |                                         ^
      |                                          = NULL
1 error generated.

=====================================================


# Builds where the incident occurred:

## x86_64_defconfig on (x86_64):
- compiler: clang-17
- config: https://files.kernelci.org/kbuild-clang-17-x86-68f854869533132a189705c5/.config
- dashboard: https://d.kernelci.org/build/maestro:68f854869533132a189705c5


#kernelci issue maestro:764471d48b9e1faab06d96f79a325cdcf2a995b7

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41732E36EC
	for <regressions@lists.linux.dev>; Fri, 25 Jul 2025 03:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753415948; cv=none; b=Agw8VpyQ3WQmKAs6zS0rmICdybq+G2dqJHORytDSDga6sToHFvAHjgVIShl90/hyyfOSA4wqpda8PXruSlyapLnDNEUz2VVvUpEQryDjpnfXifn2jrY6cuCXIVKvKi8t+OCgW1ru8R7q1K/57pHASjC5Ky5kFipUe7SAmJcdW6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753415948; c=relaxed/simple;
	bh=d53IBNL6TQDfQ6j0bJfy7p9/PA8pw4cbKkSHnivKnsQ=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=j1U+SsOK9G8aG/3TCdZOJuABXPAQTJiH3hOY13jwPkQXShHwmBxvMDWZXtvfURMGcCxgU2uV9nT0PjDAfWdZbwj3mc9OB02U3hL8cemCnNjecXOVk4Dd/C17Nu0qjbAX7rog4dtYRWBT6D7u+SOhnNXw8PaTGzdkaM5HY4C2UdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=SRgCVeEa; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="SRgCVeEa"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-748d982e92cso1148206b3a.1
        for <regressions@lists.linux.dev>; Thu, 24 Jul 2025 20:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1753415946; x=1754020746; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k5A8MFeD+gpLwQ/+UKz046ntsLUTOWFzNAWDLRs9Qqc=;
        b=SRgCVeEaYBaD+rPCA87IRNm4xz89F5pQIh/oIuY6KHlk+8K4cX8n64t2mWo9cnGjjE
         +0XoYxKspTE9JSh1XZeSD4Q+F7r9SN6os/wmkEDc1oi17QMyCYrmx92BYBNhyzLt9Dtu
         l5+2wYlgFsOudyyo1edVSnd7465zOQTLdike3lbzbR2d+lrhNA9ovmyz9fiRXC/s2CVJ
         i8h7RXtBnsCLVQXHRXpexKStwNWjhelN0CcFpKA9PcDpe2tFBmwVXwGqoTdhAEXfBg0z
         Ft3IyV85DEbpf1n2GMq44ujM5PDvpDLmaPBnNf6mUCupK+thjLneNxRwvLXOzV5XwW09
         g9bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753415946; x=1754020746;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k5A8MFeD+gpLwQ/+UKz046ntsLUTOWFzNAWDLRs9Qqc=;
        b=JefqiOgMcJ6IsSpGDN5c9dNs7PxYrrA1A8xkgw22HTxcOtKBArszrGQwF9bfbW2gzg
         T5mzDaM7J0ZVJQiBlY71iCIj3Byn0DK/HIwJuU41SZXUkLqWFZCcrePv/keFGDiKWC5R
         +HzobGz+T/qh8s5LhVaNuXJEDaYzhEVCjsAa3UpJ/jheiGtC8YolV5zKC5/8vQxo6h4U
         o8/rlZuKVlEJ65YBROuY1zc0BIqvwzsj9Hj8zdB7KibksfHmdVlCZf9fYhoIR/FjYrlk
         IME2QGQSdYEOrZ7+HiRBRDlI5t4kNijZA1uvo9oplPvtyVe5XwC5v8ZsRUXKTnjHRTib
         6lLQ==
X-Gm-Message-State: AOJu0Yzxlv/zpHjLshbUjYCpaXdw6u/yo24/swrJRo1qM9TyYUuzVKTx
	xkbtyNfV6qjbILGLS5vxh56BPF+NreoRMKTLUvY49TjGbdWw0VehbEfB9es9ao1YKhI=
X-Gm-Gg: ASbGncuaLIQEN70marZo+LWF3up8OaG84sLj6LNXYvaTQ/QNTd/XcvGZbOB8H2mnGkx
	8h7ITg49ktTXWQtZAPTswFp3wRh+eiahIsFhrvDOs6arE47JIP49DYYIl4vIVuBKiKrcdkZf/xN
	RMrhj8vukVgDrNehX40Z0Hc4y+i6VmbLK407X7hzKErOoXkHc3lYvyKrdYov95bd01RrnGWVVnJ
	T/rkghDiPsMxwrcZDi2nuoTpqESR9Dt2F/hp9zR/tgWGGZDM2CZ1fbq88Ek51wtZKylpa27AZW+
	Ma8Ag6u4AqVnTHR3XwjYsFdw+ZxRtQ48o0wdvC6N0N8tW5VFxLlJ++GWbsQnRQVZp32D4qf//LW
	GDAUT4yN08WSel+84
X-Google-Smtp-Source: AGHT+IEeNHkrwTsp2skrtJ7VYqwt+HFbC0C79Gjbo7/LXhVdsCZGoFX5ACY5b3qV4sNaSSwXTzOcQQ==
X-Received: by 2002:a05:6a00:39a2:b0:74e:a9ba:55f with SMTP id d2e1a72fcca58-76339278b49mr787290b3a.20.1753415946062;
        Thu, 24 Jul 2025 20:59:06 -0700 (PDT)
Received: from 508e4dbc6f9f ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-761b0641e14sm2817095b3a.134.2025.07.24.20.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 20:59:04 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] next/master: (build) variable 'id' is uninitialized when
 used
 here [-Werror,-Wuninitial...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 25 Jul 2025 03:59:04 -0000
Message-ID: <175341594422.117.11494999566960779174@508e4dbc6f9f>





Hello,

New build issue found on next/master:

---
 variable 'id' is uninitialized when used here [-Werror,-Wuninitialized] in drivers/virtio/virtio_ring.o (drivers/virtio/virtio_ring.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:33d32f9f3fc65aa1a71269ee14bd5f37d938b6bc
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  d7af19298454ed155f5cf67201a70f5cf836c842
- tags: next-20250725


Log excerpt:
=====================================================
drivers/virtio/virtio_ring.c:2113:40: error: variable 'id' is uninitialized when used here [-Werror,-Wuninitialized]
 2113 |                 BAD_RING(vq, "id %u out of range\n", id);
      |                                                      ^~
drivers/virtio/virtio_ring.c:60:32: note: expanded from macro 'BAD_RING'
   60 |                         "%s:"fmt, (_vq)->vq.name, ##args);      \
      |                                                     ^~~~
./include/linux/dev_printk.h:154:65: note: expanded from macro 'dev_err'
  154 |         dev_printk_index_wrap(_dev_err, KERN_ERR, dev, dev_fmt(fmt), ##__VA_ARGS__)
      |                                                                        ^~~~~~~~~~~
./include/linux/dev_printk.h:110:23: note: expanded from macro 'dev_printk_index_wrap'
  110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                       \
      |                                     ^~~~~~~~~~~
drivers/virtio/virtio_ring.c:2077:19: note: initialize the variable 'id' to silence this warning
 2077 |         u16 last_used, id, last_used_idx;
      |                          ^
      |                           = 0
1 error generated.

=====================================================


# Builds where the incident occurred:

## x86_64_defconfig on (x86_64):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:6882f2ab2ce2c1874eede7df

## x86_64_defconfig+kselftest+x86-board on (x86_64):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:6882f2b12ce2c1874eede7f3


#kernelci issue maestro:33d32f9f3fc65aa1a71269ee14bd5f37d938b6bc

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

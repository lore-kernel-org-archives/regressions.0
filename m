Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3504320D514
	for <regressions@lists.linux.dev>; Wed,  5 Mar 2025 10:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741172118; cv=none; b=RCyN4b5t2ZuVpV3kOEVAo3g2IGEwhW4IMLVL+BpWH/+dWOE3kf3PBPJIknb8ae+YJ5c7AYO5O2pu+zklCSgjzUhR/+Tob0Hq2SKVyVMyzQY6qr8bhVARFveKg7i3AjTich/35cyHlGfcOsEl06fcLwUsXHNaTAmNw41em3s30GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741172118; c=relaxed/simple;
	bh=rsfMVuWKSemKRvMtwEhYozVjOFBPz0bZm4n6N4yQpsI=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=sP/s9CBPR6ossdkiYwEFznlTc6tUXqjQuSn/mExAxyO1EkU66LkhE+Z81xs3t5VHOaJcv8XYUOSK7NZcs4jCTuk06MoLc8xza60351N6uFqxSHfsnPcu3GNdj9ChT0qM8gFxUgIm96/0h31znTcAemuZb62J7TNTJKa5xrSx9Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=LlKDTwsi; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="LlKDTwsi"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e6341e4d0b4so40166276.0
        for <regressions@lists.linux.dev>; Wed, 05 Mar 2025 02:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1741172115; x=1741776915; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OH7a2o2JbmR1i7Lcv7RFykYs2QuOeRvcMXZx8gn98nA=;
        b=LlKDTwsiIuJ9iaxJxSfzHyXUFIb90RyDoH6Qqzh34JOzz9nGqpanTZncvP0TfV20Ou
         aDBe9mZ2AlYsop5qTkn0nge3t6fj8yuhiGPVJGu+Vq2fn1wDWEMDFJ9svNhoXAY60BFN
         PFMF0ueYi/6eNlpH4S88tzhYkb8nT7Dv1ILifM65AKePRdde7CXXj11o4GvQlks+mKgC
         d/p+XfxisBI50rdYb7vlmHLz4ygDv0gFuZy6PlCk8uIX1iuuGwWdt+yIOPF6r7baNOZg
         RDmDWLlc1VJDjCDR+K3VVpI5ZM2wxnpvURubIv/cyYXVeW3bOiHNiRZxnEz4wQvAxkxK
         rzBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741172115; x=1741776915;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OH7a2o2JbmR1i7Lcv7RFykYs2QuOeRvcMXZx8gn98nA=;
        b=n5/EnKezyw5VKGatzA8UVw6+ryCxVfTjTSbmPjMpMX30b9tghHJh/hKvo/9YYcWWMf
         1hOO+SZvKT2lr5Bocx08JqzhA0O/RuwJvHWqULecEcus7r+w+aHTi4cWL5WLNITNcvpt
         aA29nQrZdqs0JEylMliu7VO8luRyOqKl8XxQnQR41RxwKvKTlkmxaAlSktEmKjus0L09
         sn3sjh0GW4BVPRd6t8UjYcjyIY9aP7lyb0w6DxGg3vopmdoHOghmdqc7aiy0SSJSOSTr
         PDZrp9zsSgXonZ9F4cs4Aup3rmVOAh+I4/HwVOmeqvCDelsKQzOHUGBclZIXaPX+sXtJ
         XnLA==
X-Gm-Message-State: AOJu0Yzg0Yx9tR10Km6NmZQccIZugLQuaPX1DtLEN+OgPpISllQ3J2gV
	RphTxa9fPjfdHfmgF84tgq7jCu8aO/m0romSpVwi8O0d+C0UJLLmT8XduAxSdfzgxVaorjcDkqL
	LsE3/Jg7gQS9vJh+amY/cUKnk96Sp2F04RE8daBMnxbTPUoa0M98=
X-Gm-Gg: ASbGncsdJSNXanDofk7+IHP1RlRjt5+nNL0VpW1i3+itMPDl8FipwD0w4YvVkL/8ORM
	9y1dwtoIfICFvvePZBvyc/slX7XIPZB2xT11afNPrSD7UZUPBsnBzVg4zk0aLyDWE6nkzXPVeYF
	IM2J1kvvkH26FJI1VNLLdD/5v8zJWh8D82dno6RrdQoY8+ToU0qkqXOttxP2c=
X-Google-Smtp-Source: AGHT+IHZBlmKX+7Ig5Mwh5fvQivu+3EDZx/cwKF2DG5MGusHIb6UnheNhkAq0ja2rTHfLvCpC2lXPt88PXWWzv/zGdo=
X-Received: by 2002:a05:6902:1a47:b0:e60:8cb8:a8da with SMTP id
 3f1490d57ef6-e610c33f9d6mr9048061276.7.1741172115048; Wed, 05 Mar 2025
 02:55:15 -0800 (PST)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Mar 2025 02:55:13 -0800
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Mar 2025 02:55:13 -0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Wed, 5 Mar 2025 02:55:13 -0800
X-Gm-Features: AQ5f1JrN-5QStS_YVS6OA91japJ1YYFXQmpsdtzDvG4l7Z3USibZXtZjM0x455A
Message-ID: <CACo-S-2ZEMOqM0s0YLJhga3kCd+=68gnbtoNetQUu1f1NLrvvA@mail.gmail.com>
Subject: [REGRESSION] next/master: (build) variable 'err' is used
 uninitialized whenever 'if' condition is fa...
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com
Content-Type: text/plain; charset="UTF-8"

Hello,

New build issue found on next/master:

---
 variable 'err' is used uninitialized whenever 'if' condition is false
[-Werror,-Wsometimes-uninitialized] in mm/mremap.o (mm/mremap.c)
[logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/issue/maestro:324a37b947cc555d039c702ae8ce97ebbbec0821
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  7ec162622e66a4ff886f8f28712ea1b13069e1aa


Log excerpt:
=====================================================
mm/mremap.c:1017:7: error: variable 'err' is used uninitialized
whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
 1017 |                 if (vma->vm_start != old_addr)
      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
mm/mremap.c:1019:8: note: uninitialized use occurs here
 1019 |                 if (!err && vma->vm_end != old_addr + old_len)
      |                      ^~~
mm/mremap.c:1017:3: note: remove the 'if' if its condition is always true
 1017 |                 if (vma->vm_start != old_addr)
      |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 1018 |                         err = vma->vm_ops->may_split(vma, old_addr);
mm/mremap.c:1003:19: note: initialize the variable 'err' to silence this warning
 1003 |         unsigned long err;
      |                          ^
      |                           = 0
1 error generated.

=====================================================


# Builds where the incident occurred:

## x86_64_defconfig on (x86_64):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:67c8257b18018371956af643

## x86_64_defconfig+kselftest+x86-board on (x86_64):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:67c8258018018371956af64a


#kernelci issue maestro:324a37b947cc555d039c702ae8ce97ebbbec0821

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

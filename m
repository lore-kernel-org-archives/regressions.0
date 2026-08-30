Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2927F30B514
	for <regressions@lists.linux.dev>; Sun, 30 Aug 2026 19:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788116852; cv=none; b=t2yQId2Cd/FZj5zzgHYM+Zg8dWrb3Lkgo0+RK9488cdxEYhk1O3DS6FRZTg7OVDSvNZw7rdU7HrmO0/8ku9sr0//ta2o5ZC9jfHQZDt9q5uD2kx0jMAIuQl8aZFsEhLLSflDLvKvWBa+OW84cYztt2cKNlbLpUUGK+le7nThsPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788116852; c=relaxed/simple;
	bh=UAP+WV+IFofygBiyPmq+Bb+SASH5CvpOwDr59qLwPik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nKX1IJE6neU2StTKK34SY3+7sh/XlroMeDd/tfDSaM9PPfb6HhsgcR+N/aaa6K8vHR0xWVYw0lxOfKfhmJVJJO35Bo0UgGnncmw5B+HfFzOs7V/rjViBBO53nrFChcZxDCUhTmeEVKbGiwBYDsJPniYUJpUpkpaAWPCwsKO//JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hR24lBCo; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hR24lBCo"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38a0c7e841fso3945163a91.2
        for <regressions@lists.linux.dev>; Sun, 30 Aug 2026 12:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788116849; x=1788721649; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ix3X1jKRamQQtcZbUM8iTm49g5yElaf+reQBINXWBgc=;
        b=hR24lBCoaobuJDJv0vqwbHsYoEpX9nUuuy4GmhvrXMRwYj70N123Yy/bUDuQIZY9ES
         fdWINyiK+wwq5VibmCClotJ+GMcH4hu2U3tUVEGTiqSH6A0FuUQw5VQiId6ln8Xzjk6h
         Ol1FhPZavud4BcWyMRCvFA6HFXbJWaJeYzSeTxPxNiYgjQUNX49sggsGEgvyXMd5BNrX
         d3DMAU9MVWhSxM7ZKSdkvxqsvj4FT6hkvinb+xSX2422qkseOQpQ57x34xltUKiYriUK
         p3juibcjFy/UjAUMa/J0yO3luie2uDZEqQqkdP6jQfSXUyw3oBU/H2c3kJRjMlkzHZsj
         uu4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788116849; x=1788721649;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ix3X1jKRamQQtcZbUM8iTm49g5yElaf+reQBINXWBgc=;
        b=AQoBpcyNMQdqcYF7mjdEXv7q0zW04pKPMYfm530bILpo0BvXYAkL9HEWGrl5r7MTL8
         /K10Gm/agHm3WGaKsOYTBU3+waGaun0pEZIhVp8hKWPF/vUpC0afJ7l0IaDltGn227iT
         8Ni/0cUHfStQNbTLQR7NfM9Jdw7rnket+WgNnklNisoiw1+NkFATFQOcD93YugkX8l8F
         AtgLknAUvyVyd25ZRlCtRciDJDEvQKLVt2OUjSa5KiPHilvOf/a4Qf0IIwjHI+WK0Sti
         /6eoDYQW1VAFx6dwc7A0oVzmR69wovoDenhGK5Cd8rS+0m5Cvix6QZzNK/Pv2hhSfBRX
         uJZw==
X-Forwarded-Encrypted: i=1; AKwUvByuKHYRPU4WSiyBBhV5Ab8Q1Jop0weDgv/QekuOEfOCS6Ty32UO+TAQzuyb/T69IURdqUVA67pLzvo5NQ==@lists.linux.dev
X-Gm-Message-State: AFuF++ms0Tzb+BNGSs7pLgOy2kxsI/pC/ybKCLwf6DAREl9kDz2y12Ji
	h59nrp+9DAFqIbFu3PDLqI4lMbQc/PBF1Pjjmrh9gWeUIskWlydicGam
X-Gm-Gg: AYBFou230xg6oEwBINQ2oizV89vkQwoNGOYD7xi9FGBzj3GsgS4bIg9Yu/F/isSlrbe
	OfGhqsnkEaQxWYAEuakHf+2WX3KrK3f8od6sHfcIm51ADxSVaur/wSB3IvnCvjFuruD7+Fbzp8D
	KmKAA+eYNWm/lawEKsFpryewyNtEGxhKOvChcsQ5wD+HBLvhu1yKBC+oDWrii7segk8ZUNaPyJ6
	G6MwP9TOB71YLem8zPb0+6tEff/+N7MqudZDrR11KNBKP1VkXJuEEwOcpdEiT7GptGtUrr+tISO
	cw28iKh03jgLBXBa4pshvy5GNFCOeGHC8eEBvs+7mXjnZ9M619/Y4kFJTiznTWf73U0zw+kKG2/
	DBnXrPXK3n9GUPNbVW6SOc8DNtsIMMktooCYAv8vHsB/Em6L8m8fR2tie+u8swiuIoz0/y9JJf9
	jb3MLcbxp6UsqUysZmxNHjYi1+0OV6+wpvaJNv4gjeaDiy67C7Gq9EzXyoEM5I+rIqLVMDeLWsq
	vYil4/V
X-Received: by 2002:a17:90b:2b90:b0:38a:c3f:3b87 with SMTP id 98e67ed59e1d1-396d0fce294mr36544130a91.12.1788116848637;
        Sun, 30 Aug 2026 12:07:28 -0700 (PDT)
Received: from kernel-vm.. ([117.28.251.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396b1ac3cbbsm17111627a91.17.2026.08.30.12.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 12:07:28 -0700 (PDT)
From: Chengfeng Lin <lin2530632123@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: io-uring@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH for-next] io_uring/futex: use GFP_KERNEL_ACCOUNT for futex data allocation
Date: Sun, 30 Aug 2026 19:07:15 +0000
Message-ID: <20260830190717.1509012-1-lin2530632123@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <d8fd1498-fe73-4f48-9213-6b18ec698a3d@kernel.dk>
References: <d8fd1498-fe73-4f48-9213-6b18ec698a3d@kernel.dk>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jens,

I tested 6e0d71c288fd against its direct parent on bare metal. In a narrow
io_uring futex WAITV -> WAKE workload, the child was 8.09% slower. A
separate 424-line standalone reproducer showed a 6.49% slowdown. A matched
scalar WAIT -> WAKE control changed by -0.55%. All compared kernels actually
ran with preempt=full.

The test system was a Core i7-12700KF with 32 GiB RAM. The workload was pinned
to P-core CPU 2, with the governor and EPP set to performance, Turbo disabled,
and GCC 15.2.0.

#regzbot introduced: 6e0d71c288fdcf5866f5d0c6cde850a091cc3c55
#regzbot title: io_uring futex WAITV accounted-allocation slowdown

This is a focused synthetic microbenchmark, not an application benchmark. It
uses one raw-UAPI ring and eight independent wait vectors. Each vector has
eight cacheline-separated private futex words. A timed cycle submits eight
IORING_OP_FUTEX_WAITV requests, wakes element 3 in every vector, and validates
all 16 CQEs. An untimed wake then verifies that the seven remaining waiters in
each vector were removed.

I used a fresh boot for each point:

  816095894c0f parent A -> 6e0d71c288fd child -> 816095894c0f parent B

Each point had 3 warm-up rounds and 15 measured rounds. Every measured round
ran 512 cycles, or 4,096 WAITV/wake pairs. Results in ns/pair were:

  implementation   parent A     child   parent B   child vs midpoint
  formal             1045.687  1128.704   1042.755        +8.091%
  standalone         1040.270  1110.916   1046.198        +6.488%

The formal drop-first result was +8.080%, parent drift was -0.280%, and the
maximum CV was 0.151%. The standalone drop-first result was +6.511%, with
+0.570% parent drift. All 90 WAITV timing rows passed the CQE, returned-value,
overflow, residual-waiter, and CPU checks. Untimed child traces also hit
io_futexv_prep(), io_futexv_wait(), io_futexv_complete(), and the wake path
with the expected request counts.

The exact source change is only GFP_KERNEL -> GFP_KERNEL_ACCOUNT for the
per-WAITV data allocation. I understand the memcg-accounting purpose and am
not suggesting a revert.

As a separate current-baseline diagnostic, I compared unmodified v7.2 against
a direct child changing only this allocation back to GFP_KERNEL. The
no-account child was 8.12% and 9.00% faster in the formal and standalone WAITV
tests, while the scalar control changed by +0.09%. These values use a different
baseline and are not combined with the direct-parent results above.

Is this per-WAITV cost an expected accounting trade-off, or could the same
memcg accounting be retained with lower per-request overhead?

Evidence bundle:

  https://github.com/lcf0399/linux-regression-evidence/tree/25ed417f566fc83b942e1787a0b53d555ccec291/io-uring-futex-waitv-accounted-allocation

Standalone reproducer:

  https://github.com/lcf0399/linux-regression-evidence/tree/25ed417f566fc83b942e1787a0b53d555ccec291/io-uring-futex-waitv-accounted-allocation/reproducer

Thanks,
Chengfeng

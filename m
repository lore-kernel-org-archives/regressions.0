Received: from mail-yx2-f38.google.com (mail-yx2-f38.google.com [74.125.224.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B563C1089
	for <regressions@lists.linux.dev>; Fri,  2 Oct 2026 17:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790963825; cv=none; b=bI6cqiaO+31VBthdKp8YTU6qEwKMFwOkWa8T0fef2bygO2c3dXdHq6K5VFKPVYMWe33A7iOQHgftoPZmqZ4TmIV2pWy3T3MHOzB0GBeZEls0K7ypNZI8JAlEUAkUX2eRPjlJQHLbSo2gvLLCkeAnqRY1JgxQa78VqQ+UopqpauQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790963825; c=relaxed/simple;
	bh=39BCaKIS2a4rsGcJLQO0o1OjODWMY9BGj2pmo1ZKneE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tH7QKaYh4zQlHgh6byl7GU77yvjAxIydvdhzZKblE0zb5zx/8iUm2217gPNJhnab9itGApHy5/E4q7guLLH55QtXfvdb11XaPIMH99+LiR1TtfWvIheefJT3uxXnZTWAutk/Wgc+po7Nv44t+yLgHzboNl+fcCQILmZQBXryNWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=truenas.com; spf=pass smtp.mailfrom=truenas.com; dkim=pass (2048-bit key) header.d=truenas.com header.i=@truenas.com header.b=iLrJDE/r; arc=none smtp.client-ip=74.125.224.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=truenas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=truenas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=truenas.com header.i=@truenas.com header.b="iLrJDE/r"
Received: by mail-yx2-f38.google.com with SMTP id 956f58d0204a3-67561cbafd0so270934d50.2
        for <regressions@lists.linux.dev>; Fri, 02 Oct 2026 10:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=truenas.com; s=google; t=1790963820; x=1791568620; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xxaI2OMOwwuqBrxKvOI44CslxEdzYP5+0cKedVWBK0M=;
        b=iLrJDE/rCQAuHBBF33j40sPH8lttqWW3r7xYN2XHEwygadaITAywJ1Y6OLj9TMUk4x
         1/5Nl9eqw8RWl7CIS+fNZbUzm9HM2sGvs9vNOYABhiFF/DONwgVvo6a4CG0GyrJ2Gnpg
         8TDdfD5g3jTQnmGqcY9d9g6Tc1B1oUODtapozPV2CjwXVhjcjU881WWzJZ6f3lVuUUcl
         xi3vHjd4OV8ZO7KJtPDqJI4TnGl+vaSUOQFYEmD6n5j/w5hKhxceXUw7L6/FVfwfNwNt
         TeYet8M/NnQO9I/Uv3ivG/0mo/nI6A9XhQRpqC+6D1S5RyOFi8Y3W3u8wNkf4fsMBRs3
         arIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790963820; x=1791568620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xxaI2OMOwwuqBrxKvOI44CslxEdzYP5+0cKedVWBK0M=;
        b=hq8IyFV3IJjU2S4NiLoMiA2P1Wu5JIkFqvffhpkR36TDSf8cS8QTwuOXpEdCYV8clT
         yOjX9g7LdtA/cUdeWcKOxMcvUBCsyPPOUstZNdFDSxBy5hAX2GLbDc1vReM3Zot2bwR/
         517mZ1IkAPp7iSq4tlVgBQbD5DKOgodai9QS+G9OqJQ8kZGHU3cE3/Kzwfe8/pZzhmbW
         vD22jPo3+nfD5ag8GIW7nslYJ+GA59i22A/d0oBK6pGsBc1sxXiJ4CCl5OscnpUX7wMp
         3auSCCOG4/gs2Rshql+VGzSz+8svxLnV2iOoTZgBQmomgg0ioD91gMUVPATzorCb5KUa
         Qw9w==
X-Forwarded-Encrypted: i=1; AKwUvBzM8RJLr/iQpULZtNzOCX0xRs09689TrwL2+gdU9x76LHRtofzeJM45LI6KfXYunky0uv/9DYUiOA81YQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYJeFdePdPdz83UHHDNvNuPgPftptn+c6TgRqRpC1sZWVVytJocI
	02r7K3aGNYzKAyoUndCBDBKu+u4LeX75jReT9msM1+2yYEoRLH9xk+8K2d5StSKMZQ==
X-Gm-Gg: AYBFou1N/Fmw+Sk3n/uWOerjGXhs4U+hFmYOef/FoOOh9gCmnavimgA3aPlyUgHWBcD
	XpwPkFTJrLK6JXxpZxzkqxByLcge5fBAYV378iWMvAkhiPtzqP7DI/B0yWDqqbpMGQ8QoKy2vKc
	d2lYy7vnJbIb4dvxHUr1vw8yutczTHgHl4CMRJ0lwXEg+F4Xwmk74atr7a2F3AYHsQYgBzjBJ2k
	YiEwdtAroJYIB/mBfpflOr+hBihMuOz3iN+UoFezFM3YgDCPBFBxhXokjsRsT8p57WQQCXaSnCr
	ZMd7yZkWwiO3q7PU0yiRRc+OrCYHKzESXiB8LEfKPP0qB5Dl8pfn+A9gx18SLdNgPQEj1PJh3dI
	DKtU2EThLsa+Bni3vXqW2yib47jufRtxrM9Da2HfrxuAKFDG0bEquq9ezacWqUNj/C/GCllVE4X
	cnZA0xUyALEt+hK/lqfGWigTS+YQDdEatY073nT61RFAVw/smfSvDgBzGf6coF/sl+bRf3JA==
X-Received: by 2002:a05:690e:4291:10b0:676:8641:27d2 with SMTP id 956f58d0204a3-677ac0944c5mr1330447d50.40.1790963819897;
        Fri, 02 Oct 2026 10:56:59 -0700 (PDT)
Received: from hamza-PC ([124.29.197.38])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-677ac63acc0sm1368439d50.20.2026.10.02.10.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 10:56:59 -0700 (PDT)
From: Ameer Hamza <ameer.hamza@truenas.com>
To: ljs@kernel.org,
	rppt@kernel.org,
	peterz@infradead.org
Cc: akpm@linux-foundation.org,
	david@kernel.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	linux-mm@kvack.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	stable@vger.kernel.org,
	4ncienth@gmail.com,
	sashal@kernel.org,
	alexander.motin@truenas.com,
	caleb.stjohn@truenas.com,
	ameer.hamza@truenas.com
Subject: [REGRESSION] secretmem: SIGBUS on memfd_secret() pages while perf record runs
Date: Fri,  2 Oct 2026 22:56:51 +0500
Message-ID: <20261002175651.811343-1-ameer.hamza@truenas.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Since commit 97d34aa65c29 ("mm/secretmem: properly account locked
pages"), in v7.3-rc2 and the 6.18.52 and 7.2.5 backports, touching a
memfd_secret() page for the first time fails with SIGBUS while the
same user is running perf record, and read() into such a page fails
with EFAULT. This happens for root as well as for an unprivileged
user running its own perf record. It reproduces on v7.3-rc4 and
6.18.52, and the same test passes without the recording or with the
commit reverted.

The commit charges secretmem pages to the per-user user->locked_vm
and checks that counter against RLIMIT_MEMLOCK, with no CAP_IPC_LOCK
exemption because the fd can be passed to other processes. perf has
charged its ring buffers to the same counter since 2009, up to
perf_event_mlock_kb per online CPU, and only what exceeds that
allowance is checked against RLIMIT_MEMLOCK. sysctl/kernel.rst
describes the allowance as not counted against the mlock limit, yet
it sits in the counter that secretmem now enforces. perf record sizes
its buffers to the allowance by default, 516 KiB per CPU, so on 16 or
more CPUs one recording uses up the default 8 MiB limit on its own,
and on fewer CPUs it leaves correspondingly less for secretmem.

Reproducer, as root on a 16 vCPU x86_64 guest with the default
ulimit -l 8192, while "perf record -o /tmp/p.data -- sleep 300" runs
in another shell:

  fd = syscall(SYS_memfd_secret, 0);
  ftruncate(fd, 4096);
  p = mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0);
  read(open("/dev/zero", O_RDONLY), p, 4096);   /* EFAULT */
  p[0] = 1;                                     /* SIGBUS */

The commit closes a real hole, unbounded pinning of unevictable memory
by unprivileged users. The question is whether the perf_event_mlock_kb
allowance is meant to count against the RLIMIT_MEMLOCK budget that
secretmem and the other subsystems accounting to user->locked_vm
enforce, or whether perf should keep it in a counter of its own, which
would leave the hole closed and secretmem usable during a recording.

#regzbot introduced: 97d34aa65c29

Thanks,
Ameer Hamza

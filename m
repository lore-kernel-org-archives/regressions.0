Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793075615;
	b=46jLwAYMBDLBfA1+nUx6YYTatjPPIRGPqIiZLOZ3fCwQ6BWPdQFZQWt3LVmCSPPEt4h+
	 x+pSQgMwsYrkMAgr2MtWhg2MTSruq3d1D8IJ40VVWrD/4QRKCd3xdfLHKYTI2TTBcZEkq
	 p7VgwCYiaWS/OhJXx3wCgbIOVN8/QQGcfHLs/ncMEj3HRCLiGkzOo9o1PwlQ6yWmK6MGd
	 n5vAXPAmMYkPq75/TofYxJzkYEcpULP1KophbZlmwfRgCTlGIJQjIuvf5A3p9HJCxqM4V
	 PuxyNaYgjQFH6i1lm5dQFmROSaxdGEexb6X/draRrjX2g7m/gE2JmKpKSI139TqNyeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793075615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dH+o3CTt+7i0neteTltn9mysqIJlLAgcAX45rIORgHI=;
	b=Okbx789vJx/kLwneqBGcXh2FguiJTJZSEupQxVCTKjwEqLxAhKZq0fRKLSpGNt1Ps5jh
	 yEmQu2d8RwbssTyMVQAmhCEjAUIGDUbTefLZIwU5ZyjcXXlKDJrpG3+YLL9j3WKaBb9K3
	 XX+Vi+Wif4cse0wiHCF18hLDzLiLnOCDJrZUCxKiPhrxD+S3PgfHQIQ1g16RnL0e4vQpX
	 coqLe7jSUFVTppF0aUIePlL18l2Ru0ET1nNs7DoSPu75gdW3e/W9n/GfDt1BsqxpWkq08
	 BX2yCak81uQ4/9imf1QEdq5WsXo8lQVoIQeww6u+7jNRzBgL+siDLhz0jDzvGfNuuZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fIUT+lcx;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8853606A31D
	for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 04:33:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8853606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fIUT+lcx
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e0d1da913so500014f8f.1
        for <regressions@lists.linux.dev>; Mon, 26 Oct 2026 21:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793075613; x=1793680413; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dH+o3CTt+7i0neteTltn9mysqIJlLAgcAX45rIORgHI=;
        b=fIUT+lcxKKVlZu0Z03saHaposDZmkBXmlt+UeR6ykaskP8wihpKjmL5uQCQI+nU+Wg
         2Dr0IpnEYQitgsKyowWfF4Gqn+MLYW69Yt5ySZCW/nuuP5mvVcLFd+hve4PAP/rbDrXM
         jwAWqndjzkdlYsKLWl+1sq9Rnd1Y0ar5IMC5/bSo2pPDLDFNWY1yLZnaee8BvkLz0DmN
         w7j71+W0C+mOzIywhWBncGNzE37EPg945Eu+URIEcMRdu00LCMU4j0jUyrZQ+46jyeDN
         NJa+1dN+XKDCBU9yLLtPV7Gj8xcRxdMeDSDX2A8O7MSAKjQrI3R088b88OHd+naSqgkS
         jZyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793075613; x=1793680413;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dH+o3CTt+7i0neteTltn9mysqIJlLAgcAX45rIORgHI=;
        b=jEi/jqkFc4LHbzTcsGTjO2GISSSSCR7p0rufk5c827+qzspWRg3RbfQtqM/ZcmDkRO
         YrsGy4y8yIdNt3Xkx1lvsopL6Y9aUysMXmnnyVyiLGIOta/2nqUagEDIhVo+D3f3liCD
         AzPqEnyeSm3cDcHNaFqXFvBEzzICe3U90ktZayv47N2NJ4j8iFCGTsZaMYU6xaln+CG5
         UeJ4zjbVUto/AUflEi2AyRznD9z1TSE8jms5mDRQnTt69nqGWmBMx04JtPEh1q9Xf24o
         y73g7qu0vXGofaw4msspHL62+nujc+hs+L92TFZCGbMqRYuIWiyWWSvx3i6i82dJ2r6H
         6jOw==
X-Forwarded-Encrypted: i=1; AKwUvBwIK7vTLsirCl/sQwAO/wGJGz+BMLH1yxp/zXwHxsKsbpNBmyCquoA22hasLA0GnMSeoxUhC79Ue52gJQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKxGoFkhnIWMdMnbuVcRsrzNhAFu09NZLaEu181P8JXrUCUC7la
	/Qs6ZvOay4LcMYg4UUtxMsRUenYonLeK3P3gEMf2Gsemv1r2qATcMIrt
X-Gm-Gg: AYBFou0slNB30egdkh5oEsZaTNnVk7hPliHIhV843tWohJ2D7NgdgfLC0GBl3W0Qar4
	+jlWsaMVoDh0qO/GXqp5sDxsW2MeJ6ZjJN9d+LlIFy2ibwfMJl0fub9iaCuzgEQKvDPORqqO8gw
	bNsqdMpUZBBhGa14MwGQepMTmj+r4+K1KRSN9ngC4swZWgL0t8NxqkueM/UN3nugDaG9qm93Yq3
	QZ04sdMCPRMlwvgJsOtyqrYGLdNV1lY18LrrCdTzkL+9qtnvCj7MuobhiR7CmisgujxNcv8LQnO
	xCAcXUoyP10UTeGC4mEJ9F+r664RXeA/yvZmxJ+f0VcDuUJW4XtN+EEZy3u9vI7stqDnFxJakBy
	5HoVg1Rwycbc5TTlX5+XZdMP9S8rTAnMlUdurMAi/8xmBsj2/WknpXGTBb1N2atEl42tyPL1E3l
	sT/2mDXBw0cyChDpc1ozrc24ub1GaMIzQMZwMlawI2nU0ahuEXC09uW06ytqOW8vq0JSXnclXce
	dGzYD+VDV1+OvQ2vnYgyUbgkOJgBIQ3nF9/qJcuzCvX4OZ/EEKbJQGOLxl3lgCWXjS+BIddURNW
	+dEyYobw4SOGHZpbza1KxKJ32lJiH1O3Ps8CaXNbze0Ev4SuoNJkRVm3kxGIkHl5NH3kggLlVJB
	LjNRYfOCLzMj3N65pNkUnZayEw0YGOe9fnmDUwB8YKonvdsYdZaWzctGVa26dyFXAoN421zgL1Z
	jjmvmGzKO45A==
X-Received: by 2002:a05:6000:4008:b0:48a:fe00:ad1 with SMTP id ffacd0b85a97d-48e55a0afa3mr3439452f8f.6.1793075612981;
        Mon, 26 Oct 2026 21:33:32 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b2ac-9b01-6900-1f92-d182-4435.310.pool.telefonica.de. [2a02:3100:b2ac:9b01:6900:1f92:d182:4435])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecde7easm20594253f8f.52.2026.10.26.21.33.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 21:33:32 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	io-uring@vger.kernel.org,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [REGRESSION] io_uring: requests can overtake consecutive drains
Date: Tue, 27 Oct 2026 05:33:23 +0100
Message-Id: <20261027043323.98916-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit ecb6817b769f ("io_uring: end the drain when the drain request
completes") lets a request submitted after one drain overtake a second
drain that is still running. This breaks IOSQE_IO_DRAIN ordering for
both standalone and linked drains.

An LLM helped with the review and reproducer.

#regzbot introduced: ecb6817b769fd7d71af2c9f446188649020b2e53

Last good: v7.3, c03c1a14507dfaf8b856c2608f9ac216021fc222
Tested bad: d135ab453a7400a34930bdda1ef4bdc8acfac80e
            (master as of 2026-10-27)

The reproducer uses a default ring and two empty pipes:

  1. Submit P0, a poll on the first pipe.
  2. Submit D1, a drain NOP.
  3. Submit D2, a drain poll on the second pipe.
  4. Wake P0 and wait for D1's CQE.
  5. Submit an ordinary NOP while D2 remains blocked.

The NOP should remain behind D2. Instead, its CQE appears before the
second pipe is woken. The same failure occurs when D2 is linked to a NOP.
An ordinary non-drain poll control still allows the NOP to overtake, as
expected.

Tested with QEMU 11.0.2, arm64 virt/cortex-a57, two vCPUs,
CONFIG_IO_URING=y, and CONFIG_PREEMPT=y:

  v7.3: standalone and linked NOPs stayed blocked for 250 ms
  d135ab453a74: standalone and linked NOPs completed before D2 was woken

No privilege, special device, SQPOLL, or unusual setup flag is required.

Regards,
Karl

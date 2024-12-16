Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC0F1CEAD8
	for <regressions@lists.linux.dev>; Mon, 16 Dec 2024 16:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734366860; cv=none; b=kU/k+HsCUKhYNstWmyRX++GZAPuuRFP6Hjxe4Y/DWh7dtuH33PRnEJiS7M+9kcVXWiPHi63RwsFg8LdBMfByzmv+Rn8qtir2MaYuMMADeTw+mBQUR2xy+YcraXWGa5niXvicKjrSfoVIZIBe/YqMnTTD8WhgSNypgycAKpIWubs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734366860; c=relaxed/simple;
	bh=J4P8Yn+HmBStOiyf7871d8RgqIDPsmAX5U/1I64nh6s=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=n4CBQ/+8mUPc5CsIKFzRf8Uqe3GRAjXobJ1+xf7TFrZmpwR7j6M68BbI4F0hIvIOFzemT/8NBKdV4FcmTN5MZtkjGGM5r0J9ooe+HNlx45vnpCagG4+1dxxdpA4Zkj09my2JGuUvnEbgvA1FeVm9WWrg95Q2bVOinA3QgZEItzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZcNpFABj; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZcNpFABj"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5161d5b8650so1087131e0c.3
        for <regressions@lists.linux.dev>; Mon, 16 Dec 2024 08:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734366856; x=1734971656; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=voYB97BSoIttk6TNFpCBTpCkCub3HvTPki1P0fPd0XM=;
        b=ZcNpFABj6LnPIUSUI27fEhdMmoRTlvg7wO5pcH8kSvUhR6RV+/Bf+KPxoZOpKOIm9i
         Zox2nw5gtsDEPzPNQUAI1fwBj9AEEdRqbZxbGrsNaFWYWkM+3sheqcHyUuexLFyUDdiC
         /SRZTRk7qDnnBzn+0JgHnxA9LbmemPqUIkX2/xZRSyr9kzaaZBXVK5vXkDWc9TUro2wX
         dgNr5HVFHLC64POW5HCYs703QeHz7qAPOHe4uRUvxb3ATmI7sCP0UT+6ZOWPCG3ZqUOM
         S/Z1hOrhaC02Ql5RTgmz8pmznQxcWX7CdjxHmKhLLkqZ5jF6HThbUALejVHu0elJG8Qa
         1Idg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734366856; x=1734971656;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=voYB97BSoIttk6TNFpCBTpCkCub3HvTPki1P0fPd0XM=;
        b=RyeSUJPuzlEjHyPJ5k0zqxUM9FqD7eI6KvAgyUBxRPtU4+VVC+A66drg0Guu5AwJpJ
         LFy6onVB2B6/sC4Mv8Bg35aUdbHTds8vBolV4oTxntGbLBmzkz4824oJJXhqVumqdQ5s
         q3lxnfC420Ngs2PAwhdvFaoy7gdqWhdwbbe42lrFTFtgaTL1AcZ59eWLrpcKwtU++Boi
         oR4BQK5GEyGqwN7W+Xu2m52EUfAIgmKuwtUixw+13QiX2UnJiOK/zP8iCNJVClD50kjW
         q+vVpW9AoGp1GhNOqYJaLs4so+kfGJpEIZhcxVU0NYzwTa6s6fVuclWzyQ7La0Z8JwsK
         CNMw==
X-Forwarded-Encrypted: i=1; AJvYcCVbLDlXst59PwoTu5o5s6XtugZf2AKITkAslxfL+3Owoip6rAMvFFN95Ok/EozQMkpzAjLefIQ8YyDWGg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/6UW03AlEQQHYFeNBiTmlwL57UinYJ4fb7j05YSrLAsgGdpLH
	Efnmu5DNKO/C21HIHEc1zFeGId5x3dyPztLP/QMDuwJBz3yrHYtzclCUopQ/pKcDUQ1L/tnw0lY
	FBLZjx2hJKv/2MbL01rC8CKP7JhrXR6I7S0P76Q==
X-Gm-Gg: ASbGnctNwNOFIVGqCgz2i0lc0vm+pw+9z9Hiwi7SAFiQp0Q8wCiPVZj7vMd+ZF9XxjB
	RWvPhz7uc8inlcEq+LM0WlLpqWAayAZD6jU8HdkhEkNUGp7ujVaZZfXG/aNApSCQ7nbjQdLw=
X-Google-Smtp-Source: AGHT+IHwcIqoyILkP+1sx25KZjFSaAGwKZBXcw1KXTOsA6DOwlBCczCOTJUK1dfVqLl4hiOpY/+Ngz4hZael7fpPyHY=
X-Received: by 2002:a05:6122:1e01:b0:516:18cd:c1fc with SMTP id
 71dfb90a1353d-518ca30617amr12733009e0c.8.1734366856629; Mon, 16 Dec 2024
 08:34:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 16 Dec 2024 22:04:05 +0530
Message-ID: <CA+G9fYtpAwXa5mUQ5O7vDLK2xN4t-kJoxgUe1ZFRT=AGqmLSRA@mail.gmail.com>
Subject: next-20241216: drivers/crypto/qce/sha.c:365:3: error: cannot jump
 from this goto statement to its label
To: open list <linux-kernel@vger.kernel.org>, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, clang-built-linux <llvm@lists.linux.dev>
Cc: thara gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

The arm and arm64 builds failed on Linux next-20241216 due to following
build warnings / errors with clang-19 and clang-nightly toolchain.
Whereas the gcc-13 builds pass.

arm, arm64:
  * build/clang-19-defconfig
  * build/clang-nightly-defconfig

First seen on Linux next-20241216.
  Good: next-20241216
  Bad:  next-20241213

Build log:
-----------
fs/netfs/read_retry.c:235:20: warning: variable 'subreq' is
uninitialized when used here [-Wuninitialized]
  235 |         if (list_is_last(&subreq->rreq_link, &stream->subrequests))
      |                           ^~~~~~
fs/netfs/read_retry.c:28:36: note: initialize the variable 'subreq' to
silence this warning
   28 |         struct netfs_io_subrequest *subreq;
      |                                           ^
      |                                            = NULL
1 warning generated.
drivers/crypto/qce/sha.c:365:3: error: cannot jump from this goto
statement to its label
  365 |                 goto err_free_ahash;
      |                 ^
drivers/crypto/qce/sha.c:373:6: note: jump bypasses initialization of
variable with __attribute__((cleanup))
  373 |         u8 *buf __free(kfree) = kzalloc(keylen + QCE_MAX_ALIGN_SIZE,
      |             ^
1 error generated.

Links:
-------
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241216/testrun/26350650/suite/build/test/clang-19-defconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241216/testrun/26350650/suite/build/test/clang-19-defconfig/history/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241216/testrun/26351207/suite/build/test/clang-19-defconfig/details/
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2qHsa6j5c1HY3GRZFGrxu2ELo3f/

Steps to reproduce:
------------
# tuxmake --runtime podman --target-arch arm64 --toolchain clang-19
--kconfig defconfig LLVM=1 LLVM_IAS=1

metadata:
----
  git describe: next-20241216
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git sha: e25c8d66f6786300b680866c0e0139981273feba
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2qHsa8wFmfrlj0VdDqAG408o3l2/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2qHsa8wFmfrlj0VdDqAG408o3l2/
  toolchain: clang-19
  config: clang-19-defconfig
  arch: arm64, arm

 --
Linaro LKFT
https://lkft.linaro.org

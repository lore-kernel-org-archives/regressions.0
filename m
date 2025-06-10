Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D66C17E
	for <regressions@lists.linux.dev>; Tue, 10 Jun 2025 23:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749599948; cv=none; b=gylEdlQp+gqWa+XFjENnEJhj+fGoSxGfIzG1IZhcsHn0rP1Efnabtli6Z7r/OSRxlm/d0MtFxqeXCh3enk8edZnVpJncyP5JGij/MNcJf+uCCPZMx+DchGpvnkhy7m4LH1rAjMvwzpAuLKvN12u1P4DkKDS31QuwVEtZsdsrBvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749599948; c=relaxed/simple;
	bh=z5WyjtQvpOVnWid1zD3GWAqwMxt9Ntt7L8mM93Ga3CA=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=ZbZ/DKtHqjshzX2EQC6Cq0AuS43rD/OpALvjznQEEBIwnSuPPaIYCZRPRS3xJXeKC/eAFs/hq97aFSX9WkzR97ILCYtYN2Vk++UfznXtagGByo7rvkBMhmowCpptzSmhQqsXtpi+hyzRbV+yYmp9sl3rX5+NyRxDkLFmoUi1h4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=le1DZVjt; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="le1DZVjt"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-70e3e0415a7so4254927b3.0
        for <regressions@lists.linux.dev>; Tue, 10 Jun 2025 16:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1749599945; x=1750204745; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=olgWeMj7EndQ8OWo1QPDEey8Yr/ckL1+BPV3lAYM4Yw=;
        b=le1DZVjtCfQsjmoQrJDpVpG97k6arpQTGPUD08oI4RjfHZPzpAuuXTEPlg0qgQA85X
         rc2jbcqQgsXk7sbgN9/ATOug8NhGfWTcGHxb8NGEFPAPxR7ouiRVdL+hmpIQbA2QpFfL
         25CPQ/3bZnEwh/elF0mjyKY/0Y2N+rFYtLCUoPMM7X5BUibH3lJCGo7pksd9SDriSFRH
         uLgZjUDGl0wM2V4hyvgESGF3McbFw51G5G3pDdJHVj0nz8rT0tCiMhIHF0/KmhpZTa2l
         O+PEkCoDA5tDi+vzzJ2v+NRbZDIJ/qbIZwkZ4TVkYYNwOXI+vLKj3HtR8J/nRYbq3ii9
         XReg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749599945; x=1750204745;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=olgWeMj7EndQ8OWo1QPDEey8Yr/ckL1+BPV3lAYM4Yw=;
        b=oLBQ/6i511NTG/1r/eas6on8eDFMQxf5WgxWeOZ7SA/f4++nu+pdOc/zIwnLEntoLh
         5iO0IZ6Gzg3gBOhN6cRzK6q2pA5Ak+OAG5irE8zphSHid++rbkdrEyOervfoDORc6Iuf
         XvUDb5Vj5CoyHShaUXjXCqyk1odeDclPWvII1LnBP+hYcp8EVzwzcskVPmUmpFzwU+xY
         xfNAoDAuyqfAkszINGF9cEMAN9GGG2KndvAv+PiymTOZF9TiYiNqYPlvFUTIgQt446Ad
         ypS/s5i8BkVcGqnQowxcG+SaqWMiEIbdNNIkeEqTvl/CRiynNgSqVbFEZU9XM4CPSsBU
         KOPA==
X-Gm-Message-State: AOJu0YxSX7b1w5D63QKyOpVavcTQsQqgvyKMksIMmf4RX5jwTMny26FT
	73WjUH/JIHxOb7Tu9ZViOfOfeHYLoOU5OMBKh0SC3ODIex0n2ozrgP1zuDYi4Zpg1nPdB5le+ri
	B4PQ/xBxI94nL1L0Z+4ZwpI4EnlIPn9SOpKpaTIoMog==
X-Gm-Gg: ASbGncseVqkU8R10DbB+/4zYNOduqjhW6kr7ZbUB6TkWWJ9iO+LrVLE9A/LBncM8Nem
	6oEteauqmee0IHy7/wIMCsEjQRaT1L8B6MiwRaX4jre+IWCGU2nTFLaZ5UrIxccao048qces3EX
	qPj1cEV56MKxBqdcwRlnVlFrzwwAXbCEk4Jxd+3NvWxg==
X-Google-Smtp-Source: AGHT+IFC+ZF6xHBVgNkZAR1tmfwmZ8T4SDvI7HVrr9DyI/hIw7XgRgPG+fBNLIDnKL9UMyEEQfht82vmqycVNzKq400=
X-Received: by 2002:a05:690c:b05:b0:70e:345:d58a with SMTP id
 00721157ae682-711409e119emr21589087b3.2.1749599944402; Tue, 10 Jun 2025
 16:59:04 -0700 (PDT)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 10 Jun 2025 16:59:03 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Tue, 10 Jun 2025 16:59:03 -0700
X-Gm-Features: AX0GCFvzRopJjRwTwgwu3nVdZnYsgb5AJJ4AdTQxNioBXYtLlVQ8iXlpBCvPEd4
Message-ID: <CACo-S-09221BBL3rdgNAr10oj_wo17eimVfs_Ry7SNQg03JcQw@mail.gmail.com>
Subject: [REGRESSION] mainline/master: (build) stack frame size (2336) exceeds
 limit (2048) in 'curve25519_generi...
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, laura.nao@collabora.com, 
	shreeya.patel@collabora.com, broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

New build issue found on mainline/master:

---
 stack frame size (2336) exceeds limit (2048) in 'curve25519_generic'
[-Werror,-Wframe-larger-than] in lib/crypto/curve25519-hacl64.o
(lib/crypto/curve25519-hacl64.c)
[logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:5256d3cef2bb7857d77cf7592fbc192694c82574
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  aef17cb3d3c43854002956f24c24ec8e1a0e3546


Log excerpt:
=====================================================
lib/crypto/curve25519-hacl64.c:757:6: error: stack frame size (2336)
exceeds limit (2048) in 'curve25519_generic'
[-Werror,-Wframe-larger-than]
  757 | void curve25519_generic(u8 mypublic[CURVE25519_KEY_SIZE],
      |      ^
1 error generated.

=====================================================


# Builds where the incident occurred:

## defconfig+allmodconfig on (arm64):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:6848a760dba9af5ad6290429


#kernelci issue maestro:5256d3cef2bb7857d77cf7592fbc192694c82574

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

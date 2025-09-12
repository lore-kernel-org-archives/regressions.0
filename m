Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3002D8798
	for <regressions@lists.linux.dev>; Fri, 12 Sep 2025 09:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757669273; cv=none; b=azLitSX0SQKJnMfWWrMzwcv/8rtqUptiHImEgoJ/rCT6folwe/W1ct0uP6IKAAtYSYqimBSqGxm3/Azy10ffIx58zMcF2hyoHSbPpyndGaWwgkDlmRIfrMKCSx2Rf1Qp6xCGYsixO7kmSP34U5CljyIJsHr8ERNzhD2bNpBIBeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757669273; c=relaxed/simple;
	bh=3tSH5UPTW11Y9XuzBfniGHAKTRbqqxgrANUoPyfLX9A=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=pgn6pT1gTIsbkjJGwGBkPd8cV+hLScRO5POCDY4Xl4nzUMPllSRQlVzA2P4crLQK+Pf8FYvStmpZvf8v4p0fij/YPHFySNAwd5CVMsA3HDBySPhTBXpxY5nqBH66U5wWmsIDCfzJe6oHfAOy/IpQi48WGZlOZUzXusoVyrv1/KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lkRnZkBi; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lkRnZkBi"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-24c8ef94e5dso13397025ad.1
        for <regressions@lists.linux.dev>; Fri, 12 Sep 2025 02:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757669271; x=1758274071; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3tSH5UPTW11Y9XuzBfniGHAKTRbqqxgrANUoPyfLX9A=;
        b=lkRnZkBie+OORuAsp0z/QVmz4DCM5JRV+s7kS/j2ayrEcCnTxYGlBBlByX0L5Hjcch
         ixV57TFmXClUGpJpWffYcdkDXrbku2xCh8OaOKdZy5ZvYjf4eDC2wajRN91mMb6Pu88N
         dvL49i7v342YR+MlwsWbhbyHhyu8of486zXbChjBEgcg+5HLR+tz/RFhCInM1QmhDpWl
         iQIsVyyjxd4QeZa2DYWJaHkjkz/zxeKZal46vJ//C7e9eqB4Dh5Q6eWRKLgfsWU0eWIV
         W+sxJcJ7IT86Js/iW7n2SIj+vMvoI4SXXVuzfKggLafUqPtkgHDV7KVDsORcHxIkG/5W
         qSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757669271; x=1758274071;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3tSH5UPTW11Y9XuzBfniGHAKTRbqqxgrANUoPyfLX9A=;
        b=lzTdRK6FaHsN0xf/IZ3oYZZRAMlr6iQkBsuVnwlqs4KkWZHb3rc4XdJG4vgUMJOs0R
         jq+a3x9kSWyyf6R2/1LLU8w3q41JpjD5/+xMKcXUwyFuk4f6XtMBKzRynQAc5WEovvRB
         i05RCDzAXpuHfQvWkLidEIc1xFWJYkps0UK28+ESS5cJT8DBlOPgRTt6mf4Tmp7wga0M
         c0J9ZnfeK56qR1HgsP85Ri34EUyEbWMM0SfTJYQJhaSk1SA1A+MqyW5MtUmx3j5olxh4
         4WoUGSCE8qfnf7vGve90/Q/DqSX5ye1Hk5kwV3XfPoQ0DVIlx63EiRm7JlGL7p0cCkPE
         TZMg==
X-Forwarded-Encrypted: i=1; AJvYcCWsJE1SYZuQnpfR6kDeWgfZrV/fFgeHu22hIQCU3LYetDMdvCrO3SIXPWDnq8sh9jjVOyUDVmq6XFpGVg==@lists.linux.dev
X-Gm-Message-State: AOJu0YybzkFBqxdlSRvUDyS6zQvnVLFQgXditogeLzvPKREukO6DDo7A
	2FJin0SzjLeRNKTbmM6WacvCtm6sZJzT/8DE3CAlHFAfeR2hy9v+tw1YayC3y2v62aRFo3++Ej5
	Eri0qzdG50i2oMeJw7i23p2Djb/DaYYjtOENWAUmYBQ==
X-Gm-Gg: ASbGncsXzjP6+/erFkmAcS9nobRl2Yiqvfubyrk+TmGn/KnZp/CpU6uKqQPJpTiMWkr
	s52LejbU2vWMEIB02xFC+sybTK/MD5gyoXwAq7DMOvA8JodNIMOQscBG3SivFxIn0uWZzWf886v
	O0b0hugWcm1dUZu7yYVCAW7F4OrUDHF8PxV9H6n760KPzZFR5wfKbouZBoFx00up5dS/472ST1j
	hudh8uDkSQlR38LPsXK7W8TeBmzym0gh5eSPLftMT0GYDdhL7AHRPj6qtunuwjEtHtfXAng
X-Google-Smtp-Source: AGHT+IGZ9/J/gRux6Yk+W24Z34To2Mx5yS/AKLrFXbt6lRuuYYcUiQ9kDBNt6XBpcfyt0QsI4mIodpEyYI0UUJ58oww=
X-Received: by 2002:a17:902:a718:b0:25c:4d67:4deb with SMTP id
 d9443c01a7336-25d2ab3e054mr18239165ad.8.1757669271042; Fri, 12 Sep 2025
 02:27:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 12 Sep 2025 14:57:39 +0530
X-Gm-Features: AS18NWC_BexFmwLhPfYunrkIwo54ALG6qwusgzRfQHujBXuhNkTXAN-rFLSveGY
Message-ID: <CA+G9fYv0rvRLMM+20vNSdzVWoT4skpoJ9EjD0LyY6dD1TqjTzg@mail.gmail.com>
Subject: next-20250912: rustgcc: x86_64-linux-gnu-ld: error: unplaced orphan
 section `.sframe' from `vmlinux.o'
To: rust-for-linux@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The following build warnings / errors noticed on x86_64 rust config
with rustgcc toolchains on the Linux next-20250912 tag.

The change in the build environment noticed as rustgcc version upgrade
gcc (Debian 14.3.0-5) 14.3.0 to gcc (Debian 15.2.0-3) 15.2.0

Regression Analysis:
- New regression? yes
- Reproducibility? yes

Test regression: next-20250912: x86_64-linux-gnu-ld: error: unplaced
orphan section `.sframe' from `vmlinux.o'

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Test log
x86_64-linux-gnu-ld: error: unplaced orphan section `.sframe' from `vmlinux.o'

## Source
* Kernel version: 6.17.0-rc5
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git describe: 6.17.0-rc5-next-20250912
* Git commit: 590b221ed4256fd6c34d3dea77aa5bd6e741bbc1
* Architectures: x86_64
* Toolchains: gcc (Debian 15.2.0-3) 15.2.0
* Kconfigs: rustgcc-lkftconfig-kselftest

## Build
* Build log: https://qa-reports.linaro.org/api/testruns/29861691/log_file/
* Build details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250912/build/rustgcc-lkftconfig-kselftest/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/32aTGwi7jsx5icm9sDcpfJLbJQB
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/32aTGwi7jsx5icm9sDcpfJLbJQB/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/32aTGwi7jsx5icm9sDcpfJLbJQB/config

--
Linaro LKFT

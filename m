Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18D92D6603
	for <regressions@lists.linux.dev>; Fri, 17 Oct 2025 09:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760692845; cv=none; b=Jxh4lo0ytMcVkqsIeGmgODaeDgy2GEarOiPct7s8H56ghrsJQJS2aWGHz4EuV4JEUi13S6LJi47y0KXAISVgcgYYc9nhhJAU0QT2or9e57sIBnCfQEsQLEPf7+PUOfNvhVKVSoCY4XKVHypg0uXn61h0tb7YSPlYpRC/DPqdp3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760692845; c=relaxed/simple;
	bh=arpQCWK126GMa9425WGmA2NWCbIvN4MCYLjOgF9A6W8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jT1KSTyZscJ6tlLr0vSx7zwBHuTBmKpkfRtbhOGfD3FQ65bdRqehFzS4g6ytT2/X/UcRP0af7iv6RHf7SEk+GWoHMLGZ1/y+ZMPl8Ef9sJOZ1wPJzcyv2yyx6uIUY1AvcIsKBJmuKsebhgzGph14Nz5IQVCwB+eljpxiReGE+ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hQpCJ/+s; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hQpCJ/+s"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7811a02316bso1239993b3a.3
        for <regressions@lists.linux.dev>; Fri, 17 Oct 2025 02:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760692843; x=1761297643; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LhknjiEqyUugoHigEu5rPV98JBjQEuOdpnABFTzWfmA=;
        b=hQpCJ/+spegbMeTw93f+Dg66w0rgV2xyxDMueODKBBQAnrFDFzO2YZw5l6XaM6i7tX
         Va4oCzBzyR9AJauVuipIhrXyU9eopu6lf6dQ6ZoqegPWfcXfDtG+Yezyfdr9m/IykwXI
         gvWvW3uCZLM5VweKTk76jbNjv3bCDWmuWc5YfuqvqSSg4q39EkD49oquQkmQpe1rMq/f
         +e15Q3be0YrcaYy2g6D5Hbfckj+SkAuC4cQ3n/Arm1K1UdDpqfWyRissGk2Uju2nmEIi
         t8Myjkj/6uTL+wh1hQcuxYYv1cFcMHZQZvlmRCpTxJ8OCyQZYluHoOTh/Y5yYDfPpA7z
         4ZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760692843; x=1761297643;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LhknjiEqyUugoHigEu5rPV98JBjQEuOdpnABFTzWfmA=;
        b=sNfF2pYARpy+miPCpodnXmHdgWWYFtIrsceKyVJKWWCDkwGK28HZ6txXq1dygKAXQf
         YTHGTZkCTnr0caFAuB0wGc8m8aX8ifJA5urzCewbh7eio8iBc3/5rG5kxtrDkz8xlz4z
         fXgN+99BEFGvm5FldvjB97Fqjr9aIfM+ul+Z8HIIBDCD4FZAc0pylMtT/945ack4Uyb7
         3n5ZxrdccphS8p8c2g6nx+LZXcjFEarlPDiqIEONItxU87WV6CoP1enRjrZ1zKru1USz
         Jmp2FiRsyKoSOpwf9Js9RsGZhypX7T+6UqPsK/0CIZ9OFSgOUogbRzAAKxOXtAQkbNiw
         uWRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcz1yIkI7H6hoYdRlkn1r3+SMhWNFYKTevWRCxI85LcurrjOmX39Da0GTba3CFLykL9uBaQSvoBVimOg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw3x2TCALcF3VePui7SjkxQvsiTbWyDCQGusLN1x+yV8Eybn2zJ
	+A/YrEveCrjsKXzejIWxQpN6faICQ3sDY+tbUGioiVeT79qIazCgYTZDhwJKCOLMwOnEgIOT/R2
	2BPblhdPmI+W3en8ogkGEHIkDbE/L3iPauc5diEtNbw==
X-Gm-Gg: ASbGncv7Lh+fchDTc0N937w6xD+h5ev7AqKixbHcWHpgXQEvpF6NC2AxO+aP1w5w16D
	hY9/g74uLn5DWGUt2Bx5kKs4eBwyrQSwfdC/iKnVhRM7ERhzh7fWaNVUi2tb7R7TzjY9vCMLFtL
	lq1y5LZT0lP4SJZUfz9b+/ShIaDde7RNSCjIDcGz/usOXxbhLKXMU5aPpsdzw9Ob6IZTAxBYfE3
	arSUwTSjXCeq9fu8biBPJUxd7JEtoKReZu+hJ4k+5B7t8BGHISFSbclGfxRCkFNi7ttZh3GWhDb
	EpWCwJjReLnmm5jm4De2U1gQJojjhke+QV5GuephXin7ElJWXg==
X-Google-Smtp-Source: AGHT+IH8McWMlP4j6h/In61PzhIcYXxJLdaulFUt4hQVbIPHKC+IElEF8O1paYDYvmL7uBRRfha5zKIJziU3JZlwoqY=
X-Received: by 2002:a17:903:b0e:b0:25c:d4b6:f111 with SMTP id
 d9443c01a7336-290cb65b633mr37181575ad.47.1760692843202; Fri, 17 Oct 2025
 02:20:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYuF44WkxhDj9ZQ1+PwdsU_rHGcYoVqMDr3AL=AvweiCxg@mail.gmail.com>
In-Reply-To: <CA+G9fYuF44WkxhDj9ZQ1+PwdsU_rHGcYoVqMDr3AL=AvweiCxg@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 17 Oct 2025 14:50:31 +0530
X-Gm-Features: AS18NWDlNGurivO1eFZTkxH5OkdGuvePuO7Z9_9bbaV5WCId2Ea8RDnwy82C9Ic
Message-ID: <CA+G9fYtUp3Bk-5biynickO5U98CKKN1nkE7ooxJHp7dT1g3rxw@mail.gmail.com>
Subject: Re: 6.18.0-rc1: LTP syscalls ioctl_pidfd05: TFAIL: ioctl(pidfd,
 PIDFD_GET_INFO_SHORT, info_invalid) expected EINVAL: ENOTTY (25)
To: open list <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>, 
	LTP List <ltp@lists.linux.it>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, Jan Kara <jack@suse.cz>, Arnd Bergmann <arnd@arndb.de>, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>, chrubis <chrubis@suse.cz>, 
	Petr Vorel <pvorel@suse.cz>, Andrea Cervesato <andrea.cervesato@suse.com>
Content-Type: text/plain; charset="UTF-8"

+ LTP mailing list,

On Fri, 17 Oct 2025 at 14:21, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> The LTP syscalls ioctl_pidfd05 test failed due to following error on
> the Linux mainline
> kernel v6.18-rc1-104-g7ea30958b305 on the arm64, arm and x86_64.
>
> The Test case is expecting to fail with EINVAL but found ENOTTY.

[Not a kernel regression]

From the recent LTP upgrade we have newly added test cases,
ioctl_pidfd()

The test case is meant to test,

Add ioctl_pidfd05 test
Verify that ioctl() raises an EINVAL error when PIDFD_GET_INFO
 is used.
 This happens when:
   - info parameter is NULL
   - info parameter is providing the wrong size

However, we need to investigate the reason for failure.

Test case: https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/syscalls/ioctl/ioctl_pidfd05.c

>
> Please investigate this reported regression.
>
> First seen on v6.18-rc1-104-g7ea30958b305
> Good: 6.18.0-rc1
> Bad: 7ea30958b3054f5e488fa0b33c352723f7ab3a2a
>
> Regression Analysis:
> - New regression? yes
> - Reproducibility? yes
>
> Test regressions: 6.18.0-rc1: LTP syscalls ioctl_pidfd05: TFAIL:
> ioctl(pidfd, PIDFD_GET_INFO_SHORT, info_invalid) expected EINVAL:
> ENOTTY (25)
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> ## Test error log
> tst_buffers.c:57: TINFO: Test is using guarded buffers
> tst_test.c:2021: TINFO: LTP version: 20250930
> tst_test.c:2024: TINFO: Tested kernel: 6.18.0-rc1 #1 SMP PREEMPT
> @1760657272 aarch64
> tst_kconfig.c:88: TINFO: Parsing kernel config '/proc/config.gz'
> tst_kconfig.c:676: TINFO: CONFIG_TRACE_IRQFLAGS kernel option detected
> which might slow the execution
> tst_test.c:1842: TINFO: Overall timeout per run is 0h 21m 36s
> ioctl_pidfd05.c:45: TPASS: ioctl(pidfd, PIDFD_GET_INFO, NULL) : EINVAL (22)
> ioctl_pidfd05.c:46: TFAIL: ioctl(pidfd, PIDFD_GET_INFO_SHORT,
> info_invalid) expected EINVAL: ENOTTY (25)
> Summary:
> passed   1
> failed   1
>
> ## Source
> * Kernel version: 6.18.0-rc1
> * Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> * Git describe: v6.18-rc1-104-g98ac9cc4b445
> * Git commit: 98ac9cc4b4452ed7e714eddc8c90ac4ae5da1a09
> * Architectures: arm64, x86_64
> * Toolchains: gcc-13 clang
> * Kconfigs: defconfig+lkftconfig
>
> ## Build
> * Test log: https://lkft.validation.linaro.org/scheduler/job/8495154#L15590
> * Test details:
> https://regressions.linaro.org/lkft/linux-mainline-master/v6.18-rc1-104-g98ac9cc4b445/ltp-syscalls/ioctl_pidfd05/
> * Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/tests/34AVGrBMrEy9qh7gqsguINdUFFt
> * Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/34AVFcbKDpJQfCdAQupg3lZzwFY/
> * Kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/34AVFcbKDpJQfCdAQupg3lZzwFY/config
>
> --
> Linaro LKFT

- Naresh

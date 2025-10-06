Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E8126C399
	for <regressions@lists.linux.dev>; Mon,  6 Oct 2025 11:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759749972; cv=none; b=qxFx5JbCmIe15ao1B4tbFlmrAaeISdc35vKoy05C1gtqxIKAt+KjCjJ4h6wdUSVQuOWzCYPCzKi7MYNc229p/ZwDJ+6xaZKclEBUVAZJiu1KNmr2gOLVB1LmloeUxayxGmW/kJvdlz7R8RZFM/Pdf83uzdecBe4oE7xbqXct4fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759749972; c=relaxed/simple;
	bh=GeecThNQ93ggam84Jge/WQIwJ0tpZbNxDJpSZaYQFg0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=nyFgM9Jc1yOpOSiRqt8LV3z4L+7QidPN9dXauCzrd0a81tTVYP0Be54UneUO0mFFZ7z50r8rvR+n9H2wlzuNxiy6fvMC0zAKK6G9NHCUD1kRnpKzGUmWSnbA7wzdYKatp1hrQKvp5cjQa2jutcRfm2Q0gG9d3WgzvCMb/dReioU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OvaQDgTV; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OvaQDgTV"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b553412a19bso3448663a12.1
        for <regressions@lists.linux.dev>; Mon, 06 Oct 2025 04:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759749969; x=1760354769; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fDtmvvD2FXzwZvAyeoxJfV+MQOeVHERP3mbNxwWBmas=;
        b=OvaQDgTV+GVEZ4v/hvdZFrM3juVL8mEae3JE8dyRxoQbSyEP1QMRZvUjwBE2KBEsyX
         glqic3BGX5xgW5DXqNRSsNWDs4nY9KWR5py0saYjGDE4FndVKDgflUaBpiobXB9axIy9
         VPn4fYswJp8U44dH6DigdKA8H/I4zbsLDD9zDhKkqzp0tSkMzg/6mLnqN6epHEwEaNsb
         TpUvrimSWKG8u1KEdbZoodvwdku1L06qWZ5Dz9rwVFVZnPSmmvGDmZTFW1kh5neFjhhv
         ol7tVq8W3rJVXHrDm6WQlg0plrFLagwN4Zzuq370Iv8dq2asJqoUzir4m1us6bqo6gxb
         c4DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759749969; x=1760354769;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fDtmvvD2FXzwZvAyeoxJfV+MQOeVHERP3mbNxwWBmas=;
        b=EMOI5fBQOZZY/YxImQvYqs9PRL0nCVdbKQYN369iiKeT+fWBEMA9Vxp3ViOF0Eh5dE
         aEgA++HiyCN+JiJZ7dDAqrSvzihxJ7DSdKW6cCjs5bJ2jtcMxvRI2KIehDnhwLKxNIcj
         uyTYDQxHBYl0CskFLyIrR2EWQOCkzqp6sMMRFsRk5lijRjTpWmJqer9rQ6yARczBccjF
         CrWBz8y/5ZmB7OQqsGHD2GcIgunBPy4xNdfal596zfO/BOzm6oTz8/tM3Q4J7j1vmsA3
         IfTU6uUTng4DHtfmwQrWapZ/iijLL4In4d96Yp8WB55TOEq5LLB3QFqJRNLDXT2dZH+w
         0DBw==
X-Forwarded-Encrypted: i=1; AJvYcCVopcycvnRRCCA6QVZrFKFnl5Aba1ok1Tmo/hGd55L3DCVomtd9rJK6K87X1dysRUSBIJLm2k9vqbKvng==@lists.linux.dev
X-Gm-Message-State: AOJu0YyVXT3+L5+F77PyAGudG+gcvfxJFn7utNya5cYxfQin8oSpsIIb
	FvuAhtMd3OhbatJswx5nZ1Rjt99JaM7P974VVDKYYS9OQdlm5RLPNxVcoxxOSqocBbKrrcmZ2z4
	6bT/F6FCa69OTK6esi1bBzQXltLwtl28MMnjFbhTbwA==
X-Gm-Gg: ASbGncv5p/l9BGIXULqTEcHf0yYlEpmSV+mMf2Ql7YUrdYM6nSaMyW3vuJwQ6X4VclA
	N9lvH3dwGFPuZA23iHIIvM5LtmbsSlrkumRmCTk8YYJ3pqnkProX1aghb6Ct+74CKpF2y0nnqTT
	9wxQMTSD4UTzbC+otRtHWgqoKJ9qn4i8KOPH/LXQdtsN83KcymjNrGj00NqvF5bmgi+QinUG0Hm
	xaXVl5kYIKXkPqb6rCZPhvsWjhfap1O3FeoF2Uaoc8VgoCNs2FnjhfV5hL0/zOImvpcdHtmaq+m
	et38Z0kI6tTnt27Ctop33YK3EOzWjne2sA==
X-Google-Smtp-Source: AGHT+IGTQs8jxKC++oU6C7/YISQ0AZ0FYt8ko5S/A8BiDUATldLpn8X/+jXVOkZW/HIc7ypJ3iFUxkMCCjEPr5Zxmk0=
X-Received: by 2002:a17:903:15c7:b0:25c:4b44:1f30 with SMTP id
 d9443c01a7336-28e9a6568dbmr128417825ad.45.1759749968905; Mon, 06 Oct 2025
 04:26:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 6 Oct 2025 16:55:56 +0530
X-Gm-Features: AS18NWBff_p2Nu8Juw5fKubeZaQNxL-VRN3bmyXdcvgFsaNarPe272yd7yfV4Co
Message-ID: <CA+G9fYvVktRhFtZXdNgVOL8j+ArsJDpvMLgCitaQvQmCx=hwOQ@mail.gmail.com>
Subject: next-20251002: S390: gcc-8-defconfig: symbol `.modinfo' required but
 not present - no symbols
To: linux-s390@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Ben Copeland <benjamin.copeland@linaro.org>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"

The S390 defconfig builds failed on the Linux next-20251002 tag build due
to following build warnings / errors with gcc-8 toolchain.

* S390, build
  - gcc-8-defconfig

First seen on next-20251002
Good: next-20250929
Bad: next-20251002..next-20251003

Regression Analysis:
- New regression? yes
- Reproducibility? yes

Test regression: next-20251002: S390: gcc-8-defconfig: symbol
`.modinfo' required but not present - no symbols

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

### Build error log
s390x-linux-gnu-ld: .tmp_vmlinux1: warning: allocated section
`.got.plt' not in segment
s390x-linux-gnu-ld: .tmp_vmlinux2: warning: allocated section
`.got.plt' not in segment
s390x-linux-gnu-ld: vmlinux.unstripped: warning: allocated section
`.got.plt' not in segment
s390x-linux-gnu-objcopy: vmlinux: warning: allocated section
`.got.plt' not in segment
s390x-linux-gnu-objcopy: stM7JmYX: warning: allocated section
`.got.plt' not in segment
s390x-linux-gnu-objcopy: stM7JmYX: symbol `.modinfo' required but not present
s390x-linux-gnu-objcopy:stM7JmYX: no symbols
make[3]: *** [scripts/Makefile.vmlinux:97: vmlinux] Error 1


## Source
* Kernel version: 6.17.0
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git commit: 47a8d4b89844f5974f634b4189a39d5ccbacd81c
* Architectures: S390
* Toolchains: gcc-8
* Kconfigs: defconfig

## Build
* Build log: https://storage.tuxsuite.com/public/linaro/lkft/builds/33YUHdDpSLSMJfU4MFvRyEUQuDn/build.log
* Build details:
https://regressions.linaro.org/lkft/linux-next-master/next-20251003/build/gcc-8-defconfig/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/33YUHdDpSLSMJfU4MFvRyEUQuDn
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/33YUHdDpSLSMJfU4MFvRyEUQuDn/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/33YUHdDpSLSMJfU4MFvRyEUQuDn/config


## Steps to reproduce
  tuxmake --runtime podman --target-arch s390 --toolchain gcc-8
--kconfig defconfig --kconfig-add CONFIG_DEBUG_INFO_BTF=n

--
Linaro LKFT

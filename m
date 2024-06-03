Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F4A12DDBA
	for <regressions@lists.linux.dev>; Mon,  3 Jun 2024 14:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717423791; cv=none; b=HRufmdK6AZs5k6MmVK4ltyhJhOUOwxUSpHUyH5JBBwLdXTpwXwYAPbh+UrVCw7sloq9XWP3inwwSDyEkyk1EInM6LSWlM/md0/+Wvb+gYuXCbvUOqMxfx+v5tH552v1uIUbKpELPjMjy5KwnbGrHtuHkBGNqxoojjRqUizG3imY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717423791; c=relaxed/simple;
	bh=YyRPCKbfkwQ1wrNaEwDVnzUmUDH6XRribciN2yI0W8I=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=QzOGSPoC8J0DjoRP9dhTf9wb4jj8VpKWlCEcsrh+rt/qbfjwSudx/tXHarpFSELPQms2+Osr1NIKEIt4hoGL6CmHlVZIHKP/C6yRXcrTsRNJcHjJT7OWJUnPNBpNW3yPRqvIgNYoPkIkYbUSL4IcX8lL4dW95bQrBQZgj6kgkBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q0HpmeSI; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q0HpmeSI"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-57a4ce82f30so2134443a12.0
        for <regressions@lists.linux.dev>; Mon, 03 Jun 2024 07:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717423788; x=1718028588; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cMBySiVcTX3BrHRQ0ZZ8x1UxOKdXwr5BWpTZuLbvO8Q=;
        b=q0HpmeSIXF3nrHb+CWEULva6w1vPqsc+LWqFLLVzsSh66yu2VGxEKMWfPTBGTrup9V
         mYDUnXLjGQom6GHttiJVp86Nql1W0hq4CQNlzr9Go6dnUwMocnyFI1DdMWAEyGhzvBXX
         LY+N7+8YEznTpbzUtmBmSCkpN3aLpl330MGhM3Gu7JsYqEVsKZAPZQSFwf2ci5aYGU/h
         dDfKQyp2HqJivnAuxoOTlRAh7+GPIzFHvrD5kMTTZZQLbGBiCWLWbxDHiQJXKG5xf0Cr
         DEDL608Fex68vQiwKOxI8gzawC0wT83hl8xr0UncPpaAOuL3FxpC/F11fh1udKO70RNm
         0LHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717423788; x=1718028588;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cMBySiVcTX3BrHRQ0ZZ8x1UxOKdXwr5BWpTZuLbvO8Q=;
        b=UPGOOTTX3hX0ippNTrX7vxTrpnRTeOqmIB8vuzrHycdznMtC7IWuTjGRlHkX0IpFmo
         sMMcNsUAR+zV8rSEUWMBNiEHiq5Wp8ePw+oFE4mxdN3FPgkmbnzC+slGp3N1AfvvGRkv
         XLhDZIM4PO2x+NgKRAIdx1m8n2v3TQcjgkm7XPM5fhPDVkBWWQJp+KblRE33q0C8clUj
         quIGhbFTK5Z53m5DuFOM/+4pORRPUOGBjMSo0ouLRTZPdho0TASSfa6JVY5ZPDMi1Wf7
         HXQpVdeqpyGK/3mY6mlDAtb0k4pJ5wxyJL+Q4kRCqGyw68L8Pfnw9I7q+I5nDEEdAMQ0
         I+6g==
X-Forwarded-Encrypted: i=1; AJvYcCWs/AeYxfWfvHHQrkHUiAjUXp7KuXBXGN+fRTD9/Rhmth/wOJYClvKo+Az4scTDHyaZGEogGCUb9dfmvaPDBKBB+ZEMqpHEUJIUoLE=
X-Gm-Message-State: AOJu0YxStrtW2awbVf35o1wHpXxLghimvK8RS8QvAl6mg/rJIS3MCXDz
	Pb13v5kDxJFOx+WdbMfajqj25LDgmtaHCZcRjV/BfAvIrIwBpPwvH+PJ1o49qKQrAWwWyUcQNrm
	IVNYrA1YafvFUnC9FDFsMxXNlVHstoqPVJe1qRAchjwSXw1hMunDXOw==
X-Google-Smtp-Source: AGHT+IEVz9Q9THonmg55KCp1sWeRzvHp+0nI4wBgSoPvuH6SA7/QZc+rrtiLGD4Lofvv3X7rXOoQpL7AB0+gVX88cg8=
X-Received: by 2002:a50:9e05:0:b0:57a:2400:3a56 with SMTP id
 4fb4d7f45d1cf-57a3651f208mr6341450a12.23.1717423787864; Mon, 03 Jun 2024
 07:09:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 3 Jun 2024 19:39:24 +0530
Message-ID: <CA+G9fYuJtUV_Z4x74qYZDDOkbHP3SJbGvHskFNnsOCxOmPvr=Q@mail.gmail.com>
Subject: kunit_test: KASAN: null-ptr-deref in range - kunit_generic_run_threadfn_adapter
 on qemu_arm64
To: open list <linux-kernel@vger.kernel.org>, kunit-dev@googlegroups.com, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: smayhew@redhat.com, David Gow <davidgow@google.com>, Rae Moar <rmoar@google.com>, 
	Ivan Orlov <ivan.orlov0322@gmail.com>, npache@redhat.com, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The following kernel null pointer dereference is noticed on qemu-arm64
while running
kunit tests with the Linux next-20240603 tag kernel.

This is always reproducible and the system is stable after this.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Boot log:
-----------
<6>[  114.143436]     # Subtest: kunit_fault
<6>[  114.143983]     # module: kunit_test
<6>[  114.144252]     1..1
<1>[  114.150801] Unable to handle kernel paging request at virtual
address dfff800000000000
<1>[  114.151837] KASAN: null-ptr-deref in range
[0x0000000000000000-0x0000000000000007]
<1>[  114.153897] Mem abort info:
<1>[  114.154370]   ESR = 0x0000000096000005
<1>[  114.155537]   EC = 0x25: DABT (current EL), IL = 32 bits
<1>[  114.156222]   SET = 0, FnV = 0
<1>[  114.157238]   EA = 0, S1PTW = 0
<1>[  114.157971]   FSC = 0x05: level 1 translation fault
<1>[  114.158886] Data abort info:
<1>[  114.159543]   ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
<1>[  114.161296]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
<1>[  114.161892]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
<1>[  114.162950] [dfff800000000000] address between user and kernel
address ranges
<0>[  114.164434] Internal error: Oops: 0000000096000005 [#1] PREEMPT SMP
<4>[  114.164730] Modules linked in:
<4>[  114.164974] CPU: 0 PID: 601 Comm: kunit_try_catch Tainted: G
B            N 6.10.0-rc1-next-20240603 #1
<4>[  114.165058] Tainted: [B]=BAD_PAGE, [N]=TEST
<4>[  114.165088] Hardware name: linux,dummy-virt (DT)
<4>[  114.165198] pstate: 12400009 (nzcV daif +PAN -UAO +TCO -DIT
-SSBS BTYPE=--)
<4>[  114.165290] pc : kunit_test_null_dereference+0x70/0x170
<4>[  114.165390] lr : kunit_generic_run_threadfn_adapter+0x88/0x100
<4>[  114.165446] sp : ffff800082d97dc0
<4>[  114.165513] x29: ffff800082d97e20 x28: 0000000000000000 x27:
0000000000000000
<4>[  114.165678] x26: 0000000000000000 x25: 0000000000000000 x24:
fff00000c1dec280
<4>[  114.165763] x23: ffff9bc22413e7c0 x22: ffff9bc2241469f8 x21:
fff00000c1dec288
<4>[  114.165846] x20: 1ffff000105b2fb8 x19: ffff8000800879f0 x18:
0000000000000068
<4>[  114.165929] x17: ffff9bc2231cf524 x16: ffff9bc2231cf29c x15:
ffff9bc2240feb9c
<4>[  114.166014] x14: ffff9bc22384b8d0 x13: 6461657268745f68 x12:
fffd8000195d88b2
<4>[  114.166098] x11: 1ffe0000195d88b1 x10: fffd8000195d88b1 x9 :
ffff9bc22413e848
<4>[  114.166219] x8 : ffff800082d97cb8 x7 : 0000000000000000 x6 :
0000000041b58ab3
<4>[  114.166302] x5 : ffff7000105b2fb8 x4 : 00000000f1f1f1f1 x3 :
0000000000000003
<4>[  114.166383] x2 : dfff800000000000 x1 : fff00000caec3cc0 x0 :
ffff8000800879f0
<4>[  114.166494] Call trace:
<4>[  114.166526]  kunit_test_null_dereference+0x70/0x170
<4>[  114.166585]  kunit_generic_run_threadfn_adapter+0x88/0x100
<4>[  114.166638]  kthread+0x24c/0x2d0
<4>[  114.166687]  ret_from_fork+0x10/0x20
<0>[  114.167025] Code: b90004a3 d5384101 52800063 aa0003f3 (39c00042)
<4>[  114.167311] ---[ end trace 0000000000000000 ]---
<3>[  114.184100]     # kunit_test_fault_null_dereference: try
faulted: last line seen lib/kunit/kunit-test.c:95
<6>[  114.189639]     ok 1 kunit_test_fault_null_dereference

metadata:
 git_ref: master
 git_describe: next-20240603
 git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next

Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240603/testrun/24170958/suite/log-parser-boot/tests/
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2hM1PsJeaL7kuebSowrouZKyCLa/
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2hM1PsJeaL7kuebSowrouZKyCLa/config

--
Linaro LKFT
https://lkft.linaro.org

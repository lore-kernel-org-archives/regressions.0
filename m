Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE4A2BE051
	for <regressions@lists.linux.dev>; Tue, 16 Sep 2025 05:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758001690; cv=none; b=LsUku5XTDfy3sVmeGmzBtdYGit9yjnr4CtfBaGoHMDSpWbLFg71ovBQ9I6cZ1IXlk19no80+ZIu4Anzmcqte9dW26PEldxg4O27tpipzfu2Z9pAkhUBVpxTYY+lhxBK08m42Sx6q6mTt27ilT/XadJx2URF7vdCNyW49IUFpip8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758001690; c=relaxed/simple;
	bh=E2uWLYg3FMkNgpZTrHVVVc4rBvzh5/YBlD80cZCv3AA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=qbQhbbB3DIibQicNQV273NhBmCk0kAyes6kvi1Iqs7JG1ddmms8WOryERh1gVVB1CLnzDcEj6PdoDmEVcoX5AeGLGcvcTEKCIzfJKqIaX5F8fTzuv8Zu+03g3jiJz9dBMSIxupprA9bdQDPmVwQkIJSBfARMpIbsMrEaRFdCmO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NQ32z+dn; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NQ32z+dn"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-267dff524d1so409725ad.3
        for <regressions@lists.linux.dev>; Mon, 15 Sep 2025 22:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758001688; x=1758606488; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6I4vQkRpdnZ7dgAYiGmYLTNrTd2ZtFDNajrfOoR45L0=;
        b=NQ32z+dnHEJH326xWHYc/ib5dYRNecxGBtJjzcV1/G9kfwSKvfbqyI7m5PUIF1pvr0
         HWU1o6RAVWSl8k1t911N7GCEuPOKodmzB7LfCEt0DSvvHvb+B5PoFjicMH/qTwIWDLFB
         uat1GahyFYqSWrCoimt7Yy1kKrAJLX0TeKQToC1h8jtKDmrjTndetYNx0F2Q+aDQvVpc
         FOaGFuQf518heb+gV2EiRaIXu3EUVT6yC4YReEVODR/CQ86B4PH/c0btZE580CB+/rKk
         yQQyZectQBbFx6RFpyvDW9FaSI1Xrn8WSHYSsCwtlYqfsCXvhtfw6r6u2QSJhAiBo3Ql
         TAiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758001688; x=1758606488;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6I4vQkRpdnZ7dgAYiGmYLTNrTd2ZtFDNajrfOoR45L0=;
        b=RhS3d2JETfly/HudO95neG8aE/XHbXNqxNFOV4B308byCqB2oZBOpzARAQroK0o6mR
         KVpGU/vAUgoT1malVkGOzCJNvjKzExUtJDS4K0jzk4InpovRlHI504MyWWdtmDIudUVG
         rNnoz/L+TU6RSF8q5CqHYs4xl7PqsIi29HtXoPzULMjMYDEGd1w7UzZ+2aSn+Dd+SuPk
         59nKMJftFmUUaua2/2AyTEbRwPCPIJWGoAoI6747t3/VxwrcQ3Kss28ZZPnC1aWaH1Ga
         bNeUD3VHaJU0/i5b1wpHFJzYsm+8NTwo+0JkFqck3eW799GIQAsaloGIuZCV2cRnxD1j
         r1QA==
X-Forwarded-Encrypted: i=1; AJvYcCV9S5FFXhql6F9QbMCkFlMbGdZql+SKgYzyZ/3cogF4/pplGsheYEjkv7d8BtMGxOW0FQ8qsstkwrCKNw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyPla7FLcXJhKPoAVLITYuYRWJ3QgT5NmPDCn/ebHPUP7fjLQ/b
	oLaISFgL2hrgzyDoRJF44J5iEGWJCJDSduz3E4RpdiWapc0vtte7D4HmHMaFaweC8a5/HmW2DXI
	uvjR3KN7uqzWT3jyKZu2KC/nIbsojeI4+2a3GwVgjK2K4u9IKBxD1qZw=
X-Gm-Gg: ASbGnct1npfJQygdD9lqnEL6Hu16lb18amfD9ICK8y5KFA3qjZq5p5yeqia+9dqmVPO
	xeelHu0W6ubQpKRkiR8mxawQdb2jvJi+JqAXAGxFYeNEKm5joPRJKwzW3lz9lDA2HVM8q6fG7CW
	JhhJ+08XC2gC8oPkFwigRxDLd15VfMBZgR6QLdwJKzf2YVB2texaKfg1CtaBBSMWoqDo/SQ9RB2
	OjYHXC94EXroMBdM3IXPVOtW7oIk9NnxGNnX/PK1fw9ooAVxZ+X9qj2lw6OVEhMr/EKi1wV
X-Google-Smtp-Source: AGHT+IGlyV0fslNXwltIa0zfwhqmtTg9Rcz2i3N9litNb3DEzz9VPq/c8d7ozuUucZC+Rr2ydlzIY5gSnStEkKTFv64=
X-Received: by 2002:a17:903:4b0c:b0:24c:965a:f97e with SMTP id
 d9443c01a7336-25d23e10c8dmr195037845ad.2.1758001688493; Mon, 15 Sep 2025
 22:48:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 16 Sep 2025 11:17:57 +0530
X-Gm-Features: AS18NWChJdvp4Jcne5Z1CbUS1ZAGIP4hD5Fge2myTdRe9ZSVPsYDAB_gGWhrEME
Message-ID: <CA+G9fYtT7HNBM2XBbePeZ-Fw+ig7SJ+JE_NpQ1VuHR_TvAjX2w@mail.gmail.com>
Subject: next-20250915: error[E0425]: cannot find function `atomic_read_acquire`
 in crate `bindings`
To: rust-for-linux@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, lkft-triage@lists.linaro.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Alice Ryhl <aliceryhl@google.com>, Benno Lossin <lossin@kernel.org>, 
	Elle Rhumsaa <elle@weathered-steel.dev>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The following build warnings / errors noticed on the arm arm64 and x86_64
with rust config build on the Linux next-20250915 tag.

First seen on next-20250915
Good: next-20250912
Bad: next-20250915

Regression Analysis:
- New regression? yes
- Reproducibility? yes

* arm, build
  - rustclang-lkftconfig-kselftest
  - rustgcc-lkftconfig-kselftest

* arm64, build
  - rustclang-lkftconfig-kselftest
  - rustgcc-lkftconfig-kselftest

* x86_64, build
  - rustgcc-lkftconfig-kselftest
  - rustclang-nightly-lkftconfig-kselftest

Build regression: next-20250915: error[E0425]: cannot find function
`atomic_read_acquire` in crate `bindings`

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
error[E0425]: cannot find function `atomic_read_acquire` in crate `bindings`
   --> rust/kernel/sync/atomic/internal.rs:124:37
    |
124 |                   $unsafe { bindings::[< $ctype _ $func >]($($c_arg,)*) }
    |                                       ^^^^^^^^^^^^^^^^^^^^ not
found in `bindings`
...
201 | / declare_and_impl_atomic_methods!(
202 | |     /// Basic atomic operations
203 | |     pub trait AtomicBasicOps {
204 | |         /// Atomic read (load).
...   |
216 | | );
    | |_- in this macro invocation
    |
    = note: this error originates in the macro `impl_atomic_method`
which comes from the expansion of the macro
`declare_and_impl_atomic_methods` (in Nightly builds, run with -Z
macro-backtrace for more info)
error: aborting due to 34 previous errors

For more information about this error, try `rustc --explain E0425`.
make[3]: *** [rust/Makefile:553: rust/kernel.o] Error 1


## Source
* Kernel version: 6.17.0-rc6
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git describe: 6.17.0-rc6-next-20250915
* Git commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
* Architectures: arm, arm64 and x86_64
* Toolchains: gcc (Debian 15.2.0-3) 15.2.0
* Kconfigs: rust config

## Build
* Build log: https://qa-reports.linaro.org/api/testruns/29894207/log_file/
* Build details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250915/build/rustgcc-lkftconfig-kselftest/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/32l4UDzp0FMtS73JeG3kWpcoQrm
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/32l4UDzp0FMtS73JeG3kWpcoQrm/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/32l4UDzp0FMtS73JeG3kWpcoQrm/config

--
Linaro LKFT

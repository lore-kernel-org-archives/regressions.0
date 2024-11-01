Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8507B14F121
	for <regressions@lists.linux.dev>; Fri,  1 Nov 2024 09:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730451693; cv=none; b=db5OWm9fRXa/yL1FIuY2B0KdJ64kL6DSdjGdC14ktZcmMZXRsgN72/Drj0p+0CBcYSEmO9uI+R9xnrM/0uoflUKVd2QyNnUDKMb9bsoPqlljF/hU1TEI5qjga+ubOfRnxXbABTWBO94jihIk3d0cqTW6Umr57EnFRgs3w31b0Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730451693; c=relaxed/simple;
	bh=NwXYkU476LZtGluB4lV1HIV7sAeNYigHhuApbCJpgyI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=k/IISFhYGsNo665y17VtNYdhBtGBc7+/wvOz0RYsUtrwQXAyJleq4i8yOyfS6Zpw26A62OtWo7YaS/ZVfhrE7ZbaZCHkFHLea//y1ZLp44WuRLCzjOsU+K5rTU+YJQH3I3W4ud0JQE2Vmcky3lTqzoCpDtKwbXASzAmgIMIQrpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cE73xzV5; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cE73xzV5"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3e6048bc23cso1042176b6e.3
        for <regressions@lists.linux.dev>; Fri, 01 Nov 2024 02:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730451689; x=1731056489; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7hAIS5ePVJ+LyF/EPZq+6vW+8bpoW4OU+Q4L+IGQdhM=;
        b=cE73xzV5dA/j1x/jQCRAc8eed60MNQ1frIOXJeMH2hxr//2bTOcTXwsYlk364oMUCT
         sG5xlQnlh9PpSPX69hw+JTuRBDuXQAq0PUcF9465En4xbRkW3Cpi70TqcySf1bVYEvSx
         nSmS37JJCkREQ0Kf1e2Xe1DQhdVNUS8Kg2ibNEZzdkn0H9+KH2sO3ZpCt78Xr6nR8TsK
         8f+TqCCKkMyT4+0UFHky2Az3kWw0AwDfTcZ4N7ZtnHygfvXCBk3syWk6Es4zFCj/L660
         cOZjUdZxVNLrMYaGSmyctCvKQPd/kSWrKMHGVFzclRTFp3zA3Q9xHGXkM8UFnRuQzF0a
         z90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730451689; x=1731056489;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7hAIS5ePVJ+LyF/EPZq+6vW+8bpoW4OU+Q4L+IGQdhM=;
        b=I7RACPdcgQJOvXEqKhfXjMer0v/ioOn9z7GjUCnvBnYS11SJZCoxnSu+LxvRGfJnHr
         HneL3zSYouz4Jv2L3ALsQc2tKwKlm93SammjLCBftKl36lpvw05VxOo5i1JZKQ29B1md
         1XxRuYBZF3JC1vXut/B9seTR/2RQzY9oFz4SEUwOvhoU8L2vTtfxFIOqOjTnBQz6jcA+
         IIa7kSYn3Jpuddwk3TdBH6CvNS5xNwBeJ666R/yZq9MQLrZu142j8IJXfmDkC16iIwRG
         OWy2F7+p7SL+Vl3RvcVLk3D1R8D54WZJ4eB93bH6/BQRkIoumSMF0wxnsi7d1DQ71l+0
         uvMw==
X-Forwarded-Encrypted: i=1; AJvYcCUunaLCGA3SCfyj4+NaYwhpzkNC50KKph/GHf/B7DMgc5q3I4jgN3VRfooHPdGGlEL1/nYU1NGMI6jxoQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzfRQxyBIjmQ0hknkiPiwcQy+VzdDM4c8bQ1pzi5gDIPk8DqAMr
	uT0QKvx0+bMHc1ZePLbIJNQcicWLklaknXc+J/v3bOU++WKP80dDtd1Bc+uW80c8L2EWC3UCKDV
	AvDDJ86Fjec/4rJwYs0VeJMqcj3C48rCL6tCHQQ==
X-Google-Smtp-Source: AGHT+IGaH57iqzcu6+LLy0GxLcoHNVWRsTAHclSdPzMpgspZ7/pcrULQzVzWxa4HnMZnY5zXwOjo7nllXmEuskDaKpw=
X-Received: by 2002:a05:6808:338b:b0:3e6:3867:b630 with SMTP id
 5614622812f47-3e63867b653mr18725783b6e.6.1730451689515; Fri, 01 Nov 2024
 02:01:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 1 Nov 2024 14:31:18 +0530
Message-ID: <CA+G9fYv_Y2tzs+uYhMGtfUK9dSYV2mFr6WyKEzJazDsdk9o5zw@mail.gmail.com>
Subject: next-20241101: rust/kernel/security.rs - error[E0061]: this function
 takes 2 arguments but 3 arguments were supplied
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	rust-for-linux@vger.kernel.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, aliceryhl@google.com, Miguel Ojeda <ojeda@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, Paul Moore <paul@paul-moore.com>, kees@kernel.org, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The rustclang-lkftconfig-kselftest builds failed with rust clang on the
Linux next-20241101 tag.

First seen on Linux next-20241101 tag.
  Good: next-20241031
  Bad:  next-20241101

arm64:
  build:
    * rustclang-lkftconfig-kselftest

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
---------
error[E0061]: this function takes 2 arguments but 3 arguments were supplied
     --> rust/kernel/security.rs:32:28
      |
32    |         to_result(unsafe {
bindings::security_secid_to_secctx(secid, &mut secdata, &mut seclen)
})?;
      |                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                    ----------- unexpected argument #3 of type `&mut
u32`
      |
note: expected `*mut lsm_context`, found `&mut *mut _`
     --> rust/kernel/security.rs:32:70
      |
32    |         to_result(unsafe {
bindings::security_secid_to_secctx(secid, &mut secdata, &mut seclen)
})?;
      |
      ^^^^^^^^^^^^
      = note:    expected raw pointer `*mut bindings::lsm_context`
              found mutable reference `&mut *mut _`
note: function defined here
     --> /home/tuxbuild/.cache/tuxmake/builds/1/build/rust/bindings/bindings_generated.rs:76185:12
      |
76185 |     pub fn security_secid_to_secctx(secid: u32_, cp: *mut
lsm_context) -> core::ffi::c_int;
      |            ^^^^^^^^^^^^^^^^^^^^^^^^
help: consider removing the borrow
      |
32    -         to_result(unsafe {
bindings::security_secid_to_secctx(secid, &mut secdata, &mut seclen)
})?;
32    +         to_result(unsafe {
bindings::security_secid_to_secctx(secid, secdata, &mut seclen) })?;
      |
help: remove the extra argument
      |
32    -         to_result(unsafe {
bindings::security_secid_to_secctx(secid, &mut secdata, &mut seclen)
})?;
32    +         to_result(unsafe {
bindings::security_secid_to_secctx(secid, /* *mut
bindings::lsm_context */) })?;
      |

error[E0061]: this function takes 1 argument but 2 arguments were supplied
     --> rust/kernel/security.rs:72:18
      |
72    |         unsafe {
bindings::security_release_secctx(self.secdata, self.seclen as u32) };
      |                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  ------------------ unexpected argument #2 of type `u32`
      |
note: expected `*mut lsm_context`, found `*mut i8`
     --> rust/kernel/security.rs:72:52
      |
72    |         unsafe {
bindings::security_release_secctx(self.secdata, self.seclen as u32) };
      |                                                    ^^^^^^^^^^^^
      = note: expected raw pointer `*mut bindings::lsm_context`
                 found raw pointer `*mut i8`
note: function defined here
     --> /home/tuxbuild/.cache/tuxmake/builds/1/build/rust/bindings/bindings_generated.rs:76201:12
      |
76201 |     pub fn security_release_secctx(cp: *mut lsm_context);
      |            ^^^^^^^^^^^^^^^^^^^^^^^
help: remove the extra argument
      |
72    -         unsafe {
bindings::security_release_secctx(self.secdata, self.seclen as u32) };
72    +         unsafe { bindings::security_release_secctx(/* *mut
bindings::lsm_context */) };
      |

error: aborting due to 2 previous errors

For more information about this error, try `rustc --explain E0061`.
make[3]: *** [rust/Makefile:405: rust/kernel.o] Error 1

Build image:
-----------
- https://storage.tuxsuite.com/public/linaro/lkft/builds/2oEm06IqsdrtzGl1UIGSDghznWx/
- https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20241101/testrun/25629042/suite/build/test/rustclang-lkftconfig-kselftest/log

Steps to reproduce:
------------
 - # tuxmake --runtime podman --target-arch arm64 --toolchain rustclang \
             --kconfig defconfig \
             --kconfig-add
https://gitlab.com/Linaro/lkft/kernel-fragments/-/raw/main/systemd.config
\
             --kconfig-add tools/testing/selftests/rust/config \
             LLVM=1 LLVM_IAS=1 TARGETS=rust \
             debugkernel dtbs dtbs-legacy headers kernel kselftest modules
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2oEm06IqsdrtzGl1UIGSDghznWx/tuxmake_reproducer.sh

metadata:
----
  git describe: next-20241101
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
  git sha: c88416ba074a8913cf6d61b789dd834bbca6681c
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2oEm06IqsdrtzGl1UIGSDghznWx/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2oEm06IqsdrtzGl1UIGSDghznWx/
  toolchain: rustclang
  config: defconfig
  arch: arm64

--
Linaro LKFT
https://lkft.linaro.org

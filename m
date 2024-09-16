Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC403B796
	for <regressions@lists.linux.dev>; Mon, 16 Sep 2024 19:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726514251; cv=none; b=h3GxKWp/T2FyKWot8h1CiJARLLd1Jg+iexmddTztqJStPLw3/SfqqsiGtVx8AMaIJ/oo1xZk1rm6QbM85GB3MYA+4Kj9/mLbxyIeDFzMMBXloc7LT5xukZXME9gRF8rTY9NA1l+wIUcOnRM+TWb8J6xXnPa1plwMy4BG1mZnjRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726514251; c=relaxed/simple;
	bh=e0ST16hFS8BD4t8TE1aEuiovt67c4WgIofkhonJHDoY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=FmKSjO1Y4g4hRVXsdq+PY9aMQ5twg61ggznutX8+JOU/r3sBEqjnRfkea0kO7Wd66XMxLqXcVP/5oeSIYrV/Ab4TvdUFnc/0nLp+ZOUaXsMy15w8QdL0eXC3g3ppeEnRX+jjRInV+nyLz1PDYWZCUF7mty+jNacL1vUXBD89oCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UrsmhaAJ; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UrsmhaAJ"
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-49bd27b3507so1507108137.2
        for <regressions@lists.linux.dev>; Mon, 16 Sep 2024 12:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726514249; x=1727119049; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Vqx3usVPpKT0iyvBpApWWwNta7RIraSs6wvkWJ44Agc=;
        b=UrsmhaAJf+VMwtoQtyc/Qnpn5Z/1cacWXuGdUA9/nEKzhBbwHcGYx22G5Tnzit+xVc
         VdLcDYxZlUwLXp8ME47lBgF75PLlA4AvPC2z1ObKYJsoKBrP4eKAoHHJ+po/8j3nxgen
         4BK8HEGn6mEqnuTPxg7WnvM9fmsPxwUHx7RxvvMl/MsDuRZ69OwodG6kxYWTyMGbvLyE
         l/H2YqFiuscXH7MK+UV8gA5bSuyKEabA19WfyS7MG80P+XtuzhcLDzjcFdB81yzVOXft
         vvTqLf6AdiYaeVtJ4lPYf+m8hNdoQbdj20EgFTUbIbxrYMvZEJx5ukvEJb75RypcCbxs
         p3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726514249; x=1727119049;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vqx3usVPpKT0iyvBpApWWwNta7RIraSs6wvkWJ44Agc=;
        b=MDaR/M4owtH17xvKbzMYv0v8XyHhmqZU5g8F6rJSmgpICNNqBhj2/6521uxW7VTceZ
         B898erAdodzyMecP3pfPPBSa8KgBL43JnDfz2TxXEw+CXbZMDgd+laFVkohECopVuL12
         N1MP1Hx1rAFybydU8q42+AssD1O2HbP6u+IpkqObOFw9K0Iov8aFeDt7uLRYiIEsuqL6
         0yZTw3OMho18GtVUrljoCDdXiGnbtIspJoyPgzqQgn1ZhTim9qD2ZcJ8AJi9AO5Cs8bg
         uZAejFI6m5wXSIDbZ/mgy+qIC857g/wpRmtlMeiBd413bPEwipDRVjpAyuqD4M9DIEKI
         BIRA==
X-Forwarded-Encrypted: i=1; AJvYcCU2rS64MGgYNtk91IdCesWVAs6ojUk2CuxoK9UOhefiBp9w/9Pbg3A935bvMivkCv/bdiXD24vatmRwCg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxgxwFgl10skvFt6MU4H2FA1t42RHpCNwJW3HzKuivxqsQQvipc
	Lxnkz2AKQSHGitC0QH1PEssgsPrUMctMxs4AJlCq+Cc7QHUjG/UVUqOCYeXoWj4RW7PR59ST4UM
	+PUwlvn99FX9aEuqFu809JwrF+aKnCNKd9kWfHg==
X-Google-Smtp-Source: AGHT+IFS9//ZCamdnpFlaBqZvxOqDw7qKjCs+is9WBT+P2HGRgdKr849Izo3HFvk8azXHKlcu7vS45+Ic9quvSm42II=
X-Received: by 2002:a67:f41a:0:b0:49d:43d0:9913 with SMTP id
 ada2fe7eead31-49d43d09d07mr9444822137.19.1726514248829; Mon, 16 Sep 2024
 12:17:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 17 Sep 2024 00:47:17 +0530
Message-ID: <CA+G9fYuaDUCxseqCW8BO0KhLKn6F0VHYaAhu-T9v-MJHzJebcQ@mail.gmail.com>
Subject: rustgcc-kselftest: error: unknown unstable option: `patchable-function-entry`
To: rust-for-linux@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, aliceryhl@google.com, Shuah Khan <shuah@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The x86 rust gcc builds failed on the Linux next-20240917 due to following build
warnings / errors with rustgcc for selftests rust builds.

First seen on next-20240917
  Good: next-20240913
  BAD:  next-20240917

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

build log:
--------
error: unknown unstable option: `patchable-function-entry`

make[3]: *** [rust/Makefile:392: rust/core.o] Error 1

Build Log links,
--------
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240916/testrun/25144919/suite/build/test/rustgcc-lkftconfig-kselftest/log

Build failed comparison:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240916/testrun/25144919/suite/build/test/rustgcc-lkftconfig-kselftest/history/

metadata:
----
  git describe: next-20240917
  git repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git sha: 7083504315d64199a329de322fce989e1e10f4f7
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2m9CHpK6gWVXL2Rjt0R5TdMRwKg/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2m9CHpK6gWVXL2Rjt0R5TdMRwKg/
  toolchain: rustgcc
  config-name: rustgcc-lkftconfig-kselftest
  arch: x86

Steps to reproduce:
---------
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2m9CHpK6gWVXL2Rjt0R5TdMRwKg/tuxmake_reproducer.sh
 - tuxmake --runtime podman \
           --target-arch x86_64 \
           --toolchain rustgcc \
           --kconfig
https://storage.tuxsuite.com/public/linaro/lkft/builds/2m9CHpK6gWVXL2Rjt0R5TdMRwKg/config
\
           TARGETS=rust debugkernel cpupower headers kernel kselftest modules

--
Linaro LKFT
https://lkft.linaro.org

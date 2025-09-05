Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA45E34AB04
	for <regressions@lists.linux.dev>; Fri,  5 Sep 2025 12:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757075341; cv=none; b=Ij5hfoO2e9OQHSIlViDFwUfo3sZnVo+MWaWkkdD6PiZkGvgu5hVwZgO1uu8GfryiF0EXx1ucCp1oTpw/X7RQYGc0u3pN0jmDXzeAAfKSseQD5oX4P/f9KXy9w6vrBGTxU+I7sicvqOXwhcaGMDIxbeGUvRKTkULCuLg8Xsgo5XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757075341; c=relaxed/simple;
	bh=1e+7pVVhym3gaMFer/Sr7WBp0M9KyyXCLvjyMZeZThc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=H6ipUvNDYFNG57HH+e9CXXXJ0y2lVPQHoekdZby1ms/ISH5WQC603RyfAHd0e3t2LJWz9kjC6BxiQwOuZlxFlHPlRnt46ktArxERe1MT74AsBda337qSRe1JodRVDJdHkbRfdTjRKNcQutlTgqG5iOaKnCMHSLR7lBzYBeElYO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bWc1WyzD; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bWc1WyzD"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-244582738b5so17200315ad.3
        for <regressions@lists.linux.dev>; Fri, 05 Sep 2025 05:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757075339; x=1757680139; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Vt2kS9Ofun09w/F1kEUInf1+goE6RJwp8Jq2yr6GTno=;
        b=bWc1WyzDUkw/E3rIv+X5AJF444XiOHLjzzgGmvdxn123lZbOo5aQ3KwiGOqSLxZBql
         SofT3JfRg/v7JqIVdAsncS0gnlrTxqB6nB6FZu64d7NtV008V6SxOunPo6PQT7khGVBz
         TSxVFhJLNw6roW7FgjCwcMpjip3qCzII6lbcQH2VZNXPM7Rxpguqrld8U4YnZETLFbk3
         dCg5BuotcQLOzQNUg6Fcx7IZP6DQYnMCD9+8c8srbcpCNObKmCra9knFqUiVpAjjz2eh
         zQvwvSjMIIEmSWcOQtfiYmFB6NHc5/esNGijxnKCtgBSl0+BynxapYbDyN6uVme9uSHR
         CuIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757075339; x=1757680139;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vt2kS9Ofun09w/F1kEUInf1+goE6RJwp8Jq2yr6GTno=;
        b=RTwf0IxTr+oHFOnCEf7pDIlaWq4+p3NY88HQW6SpZYidWXmdr4ImvlA/CGSJ5w+Qbf
         T2iGOmF4pby8T5CKF84ofQtVOmZtJfjCbIeU/1OJckYSXH6p4bEhiFE2agmCRjggjlgq
         jWidyui4kxb1+GAilsSgDuoUDvmjV8auFto55NzOixTVCgyw40vAeMwKm9gfRPqCjvkk
         FnMAyy7Ddd33Nbha5SDFt9pwXgYAHhD/T2MTNu38vurXPg23Ja8jLUCSTwoLHYOSRayp
         4VFEX/fwLpWgWTdRBi+uFOzMd5eyGJb59LpBW0w+aljrnQXebGEtx8Taldbcm0tqi9tF
         dPGw==
X-Forwarded-Encrypted: i=1; AJvYcCXc2u3btqPiBARMXIjxZK4ky7hDGqDMWONfws6sWNZE4S9fbBu2NTgPkhkydbF75xwxnVrUP1FB7phdIA==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywwo+DrzicRbAM1inO5CbEJmexGGaHtKyleTvo30/HWOOFuwGQD
	3lUAyKy/zrWCmyN3rXBlaZ8l+VmqZvtzHiMqKCcHoeop9ULSeyQdquN/k9P2j7MKLA3vwUmwt3K
	yuZSz8jPDqT0tqFoYNef5i8bB9+8QEgd48JbLHkA9Yg==
X-Gm-Gg: ASbGncu2fyi/Ppujudf8f9bwjA0VanONIR5q0OygZlaTEv8hhzpOad6zusfFCUUdOHf
	pKH4C2QbXqM7H8fvaV5kiH8gDqDZdTvkdBzS75zlETOrq3OSM0hmUTYiQ0NrDZqqh58Nwwbm/HA
	JBjGAIjCFJidbFwvxs4+P5UmljtULv7JXWTuiTyQ+V1YjIHsw4o3ygQnhfUSD+RLdtaYVhTF1Nv
	EL0PPIBSAwmqnHtfn+gvBo5xvd3Jwwq8PnAexMI
X-Google-Smtp-Source: AGHT+IF2VyihlpYLlMLSpcAIk2s/i+EE+s5Gnsq5S4v8IDPjr3MF6OBdBjnQtI+Tuw5M38cyKFUCV97IWUQkg/iXocw=
X-Received: by 2002:a17:903:2385:b0:246:80ef:87fc with SMTP id
 d9443c01a7336-24944af38c7mr260768135ad.45.1757075339192; Fri, 05 Sep 2025
 05:28:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 5 Sep 2025 17:58:45 +0530
X-Gm-Features: Ac12FXw7Gdb40oCU__VJhJHzl8UybprNIkBlFrRCtJMXzI7n6pFfMa6roDMYZnY
Message-ID: <CA+G9fYsT3b3Qd-m6tSDOgAXpgLPWz0QD_Z6a+_ff4oTecA85PQ@mail.gmail.com>
Subject: kvm-unit-tests hang on Arm FVP with protected mode
To: kvmarm@lists.linux.dev, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Fuad Tabba <tabba@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Anders Roxell <anders.roxell@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>, Mark Brown <broonie@kernel.org>, 
	Aishwarya TCV <Aishwarya.TCV@arm.com>
Content-Type: text/plain; charset="UTF-8"

kvm-unit-tests consistently hang on Arm FVP when booted with
kvm-arm.mode=protected across both 4K and 64K page-size kernel builds.

Running the same tests with kvm-arm.mode=vhe completes successfully.

Anders, bisected and identified the first bad commit as:

  066daa8d3bc2694c392e14091978043aed7b1f23
  KVM: arm64: Initialize HCRX_EL2 traps in pKVM

Regression Analysis:
- Reproducibility? yes

Test regression: kvm-unit-tests hang on Arm FVP with kvm-arm.mode=protected

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Environment:
Platform: Arm FVP base-revc
Kernel: arm64 (tested with 4K and 64K page sizes)
Mode: kvm-arm.mode=protected (hangs) vs kvm-arm.mode=vhe (passes)
Test suite: kvm-unit-tests (./run_tests.sh -a -t -v)
Cmdline args : kvm-arm.mode=protected
Kernel: Mainline master and Linux next master

Test run log:
INFO: running kvm unit tests ...
+ [ True = false ]
+ ./run_tests.sh -a -t -v
+ tee -a /lava-1/0/tests/0_kvm-unit-tests/automated/linux/kvm-unit-tests/output/result_log.txt
TAP version 13

Links:
https://regressions.linaro.org/lkft/linux-mainline-master/v6.17-rc4/lava/kvm-unit-tests/history/?page=1
https://qa-reports.linaro.org/api/testruns/29720932/log_file/

--
Linaro LKFT
https://lkft.linaro.org

Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEDD345ED3
	for <regressions@lists.linux.dev>; Fri, 21 Aug 2026 18:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787338770; cv=none; b=Wl6d+19ncPId04WPDm2BJOR5J5cSGqMMmir8gSeobX4pjuZjSyGXfbuFVfPh5vM3Vn/dCkDQARWn6yPSoO6J5Q1sTL1f6MDhkcdxD1WEe0pmNXZ0OGu9LsMq7g+bf5SZf1qzoO1km6iEp83+IXl8oAix8Jf7xtTBIejpe1BziXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787338770; c=relaxed/simple;
	bh=XpeSPu/rf8CWW3HNN9vtE9Rqo+PX7tSWMEbFHxcZhUw=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=Aaw1sROvkSD/sBAbZaeHrXHxWk8pwhwylEKsfu57a+/2J0wH8oTkSe4v3H0cI02JtDXCXOOrPYCyhI7SAB2bj141Gq8qWUEu2ebXs+Y8GLhkoSmNuK77JZ8hmXGC0zV9BebYT3muIwRJnS9rvNTRUnSX2FvUuVHbScG/fdnDlbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org; spf=pass smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b=SQEg/F+a; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci.org header.i=@kernelci.org header.b="SQEg/F+a"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so1417424a91.3
        for <regressions@lists.linux.dev>; Fri, 21 Aug 2026 11:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci.org; s=google; t=1787338768; x=1787943568; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wL/wEqEgEjZ3aGqFYe6PgAbWjPcG8c8LS4/jl6CFY/w=;
        b=SQEg/F+aChwYwcxWG9svC+q1LFgJWvFwlBgorCkcr87vVek0NdYwAbLkB/DLPArkMw
         pamCKTIIUxDYQ4JIWC2gfMi0M2FDLWUzUo7CegQVl6hfLVwu8N5GKVGAnAgmtHNi6FJ4
         Dta/wRu8OPpXH1ta5ed5xZL9N1GWQ7PMEQX+ETMAO/7ZQrRQQSQRu/xmNu0IMmaujKw8
         4twwb88YzEnSahL6zEJ5XoxUu0mSoGZ0dMoF8rkRp9nlMW0YZ+nTsB5MofScxaM0cYLw
         Y4eJC5d3kez3L7f+JtosGpypwJDUrknWWQA5oEsoyR+T1DdmKbYs9QE51mj1SalVvDM9
         BfCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787338768; x=1787943568;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wL/wEqEgEjZ3aGqFYe6PgAbWjPcG8c8LS4/jl6CFY/w=;
        b=DPlDmPgPDpqgLGq7BOz7PAL5cjxqg+QuJG7CBkcc42ZFsZJk+q9MdBWoC7pg4dU93y
         zrTbjRNNo5tYvV8+IEECnpbZiousQjiLz42LLJmPhC+84dV62rinCm2sjgCwVXImVMYS
         VvlFhOCZ4ewcpyKeAliEsyv+dpsAyctHyVvRxfRpkV29IttjhMsG6K92Tlvpax/c5Mvh
         /oTzuWZxjohrUadf4IshHg6uxar4GM5JJKKTDlHvXpc1o3nw5NyzBLDxJq0ZUBVenQYI
         IN7Ih2PS8Xt5x9nKE25yNV8lkq7BcVkW4jaMDNXRxNJLZJ2/fjJG7SFLocDFqWT4w5EH
         8o1A==
X-Gm-Message-State: AFuF++m64i4Nr1YpKPBjLhS/LUP49XdOE3XrVnOinL9ROmQFfB/gtGHr
	boHxFHSb9cqhmH3odx5AVa5see4FWjQOGh+Mwa1SC0vDdqhXYEIyD+6O4UgV85o88zU=
X-Gm-Gg: AR+sD13CB8YhWkZ2fkd5WsW1Vm1t4VJ2i13AqNdheM9rIqDZhtVPduXCdNlB3349haf
	7l/lxqNgZEYaMu/Z8VUtnw/KuDswPa3rKe8apH29rwmvxZONTGRYrjpTLWtPtayPII2nEjRO8fO
	c2VO9Fx0qL/d2VwWRB+Fq3rMoKJHuyTFZ9rEDxtSphDZLQ3FsRHepVq3+PVOYFUz7pbeZorhHp2
	a6In9S+h2L6NQc6SdEDlK6rAn/pkP/01ZNkbQZttBpkqp4rqDLEKbs8f2+ZPkuebFnz06ljb1a9
	qmitRJfqfvT87V4081+dgU3462LmExvDkuTXZeBzBROdVQcG3ud47ieD5akHMxF2wLlVCLGC28D
	pmQkkbAEGwxvPO3oq+ulwEehNYKqecpiIN2UKTgxDDzRe95IwJ9g/5oB/SeqKSxaWoM/BBwAHNl
	P3tUVxax2f7bnGhiqMjstOoKLGr+NOeKitAcqdGUIGW+MiSwNGIEB7JYSQDw==
X-Received: by 2002:a17:90a:c107:b0:37f:bfa2:1887 with SMTP id 98e67ed59e1d1-395deee4081mr1277053a91.8.1787338767988;
        Fri, 21 Aug 2026 11:59:27 -0700 (PDT)
Received: from b455de3d9de8 ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141860fe08csm304035c88.8.2026.08.21.11.59.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 11:59:27 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] mainline/master: (build) in
 arch/x86/include/generated/asm/cpufeaturemasks.h (arch/x86/Make...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, laura.nao@collabora.com,
 shreeya.patel@collabora.com, broonie@kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 21 Aug 2026 18:59:27 -0000
Message-ID: <178733874460.1338.14907565015998697320@kernelci.org>

New build issue found on mainline/master:

---
 in arch/x86/include/generated/asm/cpufeaturemasks.h (arch/x86/Makefile:269) [logspec:kbuild,kbuild.other]
---

Log excerpt:
=====================================================
Kernel: arch/x86/boot/bzImage is ready  (#1)
+ stage=2
+ cd ..
+ echo job:build_kernel=done
++ date +%s
+ echo jobets:build_kernel=1787335473
+ echo -----log:build_modules-----
-----log:build_modules-----
+ echo job:build_modules=running
++ date +%s
+ echo jobsts:build_modules=1787335473
+ cd /tmp/kci/linux
+ set +eE -o pipefail
+ trap - ERR
+ grep CONFIG_MODULES=y .config
CONFIG_MODULES=y
+ '[' 0 -eq 0 ']'
+ set -eE -o pipefail
+ trap 'case $stage in
+ stage=1
++ nproc
+ make -j16 modules
++ tee /tmp/kci/artifacts/build_modules.log
++ tee /tmp/kci/artifacts/build_modules_stderr.log
mv: cannot stat 'arch/x86/include/generated/asm/.tmp_cpufeaturemasks.h': No such file or directory

=====================================================

When fixing this issue, please attribute this report according to the
patch submission rules:

Reported-by: kernelci.org bot <bot@kernelci.org>
Link: https://lore.kernel.org/all/178733874460.1338.14907565015998697320@kernelci.org/

For complete logs and details about the environment used, see the issue
on the KernelCI dashboard:

- dashboard: https://d.kernelci.org/i/maestro:4f457c5cde619e65f938d53b68735abd5858719f
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  531ed942bb0df04f6747983fecdedce76a22d07f

# Builds where the incident occurred:

## i386_defconfig+allnoconfig on (i386):
- compiler: clang-21
- config: https://files.kernelci.org/kbuild-clang-21-i386-allnoconfig-6a888db362f33761c0fe21dc/.config
- dashboard: https://d.kernelci.org/build/maestro:6a888db362f33761c0fe21dc

## i386_defconfig+kselftest on (i386):
- compiler: gcc-14
- config: https://files.kernelci.org/kbuild-gcc-14-i386-kselftest-6a888e4262f33761c0fe2442/.config
- dashboard: https://d.kernelci.org/build/maestro:6a888e4262f33761c0fe2442

#regzbot introduced: 818bebeb63dd6bf5f4e07e145f6cdbace520a34c..531ed942bb0df04f6747983fecdedce76a22d07f
#regzbot link: https://d.kernelci.org/i/maestro:4f457c5cde619e65f938d53b68735abd5858719f

#kernelci issue maestro:4f457c5cde619e65f938d53b68735abd5858719f

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

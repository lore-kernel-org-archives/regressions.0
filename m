Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71297142654
	for <regressions@lists.linux.dev>; Thu, 13 Jun 2024 12:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718282615; cv=none; b=Zz27CAQL7YJJgdCZEN2qrKAzT5SUSH5Ubxo3+sztjz7FCDUgubWp6w8eD3bPZL8twa0V2GWi77rBvAdAcYBiFqWVWH3DFA1aX7EgKWIvss058DLWfsj4pyhyumRGlmWKBZdF0uugL2cfyvFyxxPBrCtK5gU7WpdnEU4Bg9tOgKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718282615; c=relaxed/simple;
	bh=9vhByrYTddCz5w69wCkBjEj1ybXh+NO+Xa1LhTP6Elw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=cYtrM4qm9ebfxpLNZpUUopp0AkPq3QD6zvYyteQyK5vJDiVILJ22jloVLZZPAd8HNDBoAWbc7BIAlCTDR6kcOH35fN/Q+HOieA80fMJxdz8I205VWIUTBRd7VotH5akPj/JvphiEuNtCyMr0fVSRrATSq7Htk0KRdUB6lfSJcA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M1T5Qk6m; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M1T5Qk6m"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-4eb5ea8dba6so291094e0c.0
        for <regressions@lists.linux.dev>; Thu, 13 Jun 2024 05:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718282612; x=1718887412; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=r/LfTxCOrGd7G5G1GEt1IaEmUTPInNVaJpu9fMewn5A=;
        b=M1T5Qk6mfNh0DX2YR4PDkztLAJMvwWA0bJ/bl3ZaIAlITxO+QotulrrJ0hkffDlYXp
         6zJ7Rp/Ogz3QyB/D36oFGyuH5yPGUQbTZKyiAeerIK3owoUlnKheDRCO3MT479NsK6fb
         rqZ2JyNehN812K0oB5ntYGkAKRm23q8nHE21FfP7gRDFpUhlR/fC6IQY8wPxXqdk+Ove
         PAV8dFduJpPkY4Z4AVXbEN3IoJUcZzHO48qF77Me8RqgqZAKpxc8/8lk/ZyInQzoNOp2
         2je6xOaKOM31wAPiPPOIGjq0rZ3e2zpXRlvAZLuAowTgxCE1l+SgiUDkqsGogxs8RfKD
         ZAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718282612; x=1718887412;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r/LfTxCOrGd7G5G1GEt1IaEmUTPInNVaJpu9fMewn5A=;
        b=clSWOzQHjjPXLl/TnhpSnolbSSJKRAP65BwUnpjNvfQXmQnFik7tUD8CI7tLCAmGGx
         lCclnC9RDxvKA+cNYEy4We5v6smCIkliWhUw8QmyCSsyhl/VVu1y5pqIQYlYnPAfrZSx
         vr4GWiT6+nn4keo3medM6Zo8XVruyeD0pD9egQ2IOPwKLChTn/SBrCIxqspq4pOMSpo+
         4rEfInriSuTWHNcDnQFF2D2IE2zDWYnP6hLTijGqmlOF5SWQxg+tfD8k4Wq+lEubg0Wz
         agzNjWHmLmv6LXolcyLqR3cbqOkKq439f8omiwIhcAl7caesUzA21xDFVtC9cIW335FR
         Z6Qw==
X-Forwarded-Encrypted: i=1; AJvYcCUlauQ6my1AVVeYjv/Jjtc5Qv4TTBKmPotFXT/4jUsrnAg9pU4UQ3750hRcFeMHK+R1bLiPu1wD/gwmDEyjjrriKIhf5G2uhOibTN0=
X-Gm-Message-State: AOJu0YxlqCeP0GxSquEWlcVOWmJmnjgknvR9hDwOunjC5+mlNunQzCgK
	qP2Lk37H0d8kb6v8WsJvkOCSgsFiAUNTrmwHOhCGQX6jD4JnvlekaSiNpkWNg+LFfabhgGQMJhw
	vfHQpQjCf3m/HQism8U1k2wlCndprhQuhdT0ccg==
X-Google-Smtp-Source: AGHT+IE1yzoIiBI1Uass7Fh36Cfm7FBqITloTOhLEjBJOxttNrRWFltwQCAkGGTWxxFwSvpyp4qmtBdDb528xiWr3+U=
X-Received: by 2002:a05:6122:324:b0:4ec:f175:8703 with SMTP id
 71dfb90a1353d-4ed077296c4mr4733182e0c.0.1718282610792; Thu, 13 Jun 2024
 05:43:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 13 Jun 2024 18:13:18 +0530
Message-ID: <CA+G9fYvWXuWyd3NiX3WwRyorRiDRbxGmRW_7aVnBVKUVA_TaGg@mail.gmail.com>
Subject: security: ima_policy.c:427:17: error: too many arguments to function 'ima_filter_rule_init'
To: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Paul Moore <paul@paul-moore.com>, GUO Zihua <guozihua@huawei.com>, 
	John Johansen <john.johansen@canonical.com>, Mimi Zohar <zohar@linux.ibm.com>, 
	Casey Schaufler <casey@schaufler-ca.com>
Content-Type: text/plain; charset="UTF-8"

The arm and arm64 kselftests builds started failing on Linux next-20240613 tag.
Please find the build log and related links below.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build error:
--------
security/integrity/ima/ima_policy.c: In function 'ima_lsm_copy_rule':
security/integrity/ima/ima_policy.c:427:17: error: too many arguments
to function 'ima_filter_rule_init'
  427 |                 ima_filter_rule_init(nentry->lsm[i].type, Audit_equal,
      |                 ^~~~~~~~~~~~~~~~~~~~

metadata:
------
  git_describe: next-20240613
  git_ref: master
  git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
  git_sha: 6906a84c482f098d31486df8dc98cead21cce2d0
  git_short_log: 6906a84c482f ("Add linux-next specific files for 20240613")
  arch: arm and arm64
  config: kselftest merge
  build_name: gcc-13-lkftconfig-kselftest
  config: https://storage.tuxsuite.com/public/linaro/lkft/builds/2hoLwDXEx5rCFxECYqQmkKEEurs/config
  toolchain: gcc-13

Build log:
---------
  - https://storage.tuxsuite.com/public/linaro/lkft/builds/2hoLwDXEx5rCFxECYqQmkKEEurs/
  - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240613/testrun/24303459/suite/build/test/gcc-13-lkftconfig-kselftest/details/

--
Linaro LKFT
https://lkft.linaro.org

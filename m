Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CE81CBE8B
	for <regressions@lists.linux.dev>; Wed, 23 Oct 2024 14:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729694365; cv=none; b=ZCKoT1pck0wRB3U+mkO7Yaqh2mrBDpfPEapnLBFu69oIZ7zMEU9EtfcBQ+KuTMQAsg1pOFWjYCxl5/NKHLB+93vQv/xwUX1IvSYGq+mLByungYYRQXjNkjP7goH0HZ03jpkiU0DfwwqAC78wFrDqeoaSVkdnMXQmkyWhfLzTf4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729694365; c=relaxed/simple;
	bh=odby0jjqoFFOhNqsHsqZcbKiEYm2n7Gl+WYrvBNHbTA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=AZ+1tPIoFk5mLpR2o8LmnmodiFZHh5DYe1tlHcn9RjxwPPvL2ZerXr9k4VhJBsZCfWIk3OayFlpGf0OymaOwM9Zpl63h5ieHvt+TUqoAmR1Wgz4XMZAd0oqCsSoi8umkpDdCoUk87XbtQlKh/xqDyUp35N1698xAwoS7fBuj45Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b957GsyF; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b957GsyF"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-84fd01c9defso2111588241.0
        for <regressions@lists.linux.dev>; Wed, 23 Oct 2024 07:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729694363; x=1730299163; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WhPKDbFTUZYFFVIAP/OH1JPHMZdUigC397OHZv1u/EA=;
        b=b957GsyF9hE0GStjQ9v3i2fvjzaElkf7GGovkjMq04AFTsfVu5aLEjjr+VEbMEhr1b
         vYbUian0VrZcoaJMCEQ6e5oRzyOY3wTCx7qICU1RoC0tlsmIidC9i6zQ798llJzDnBzA
         PjBvJP086Vc5ugA5gR4Guhqm/JhElSRmQDdEpqk+8Ib+aWCAvjz2KyheI/IsowckPZV8
         73dh6S/Y+iS3v1W21p4HAy/Dc64IdAZsjb+IdMrCQcwjdW5ex34SUb3zZBHF+KwYiYwx
         eFkcbyI8vrYaiXdaHwUtWHPzvmqAY3nlit6f1g4wNqK+UjZOexvlu3sUHlcq83TSwnOX
         h5CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729694363; x=1730299163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WhPKDbFTUZYFFVIAP/OH1JPHMZdUigC397OHZv1u/EA=;
        b=BhXKt0g3Md7CijUNcgmk5g8m8QA+U1JwABX6KVxJvQ27Vxd1lyQyW20DkvE/G3ohtM
         HrW1a2qG0mfInDyTHCK0VbvQpds2d2BejhcXYLOhcV4ViFJT+mwoRsbdaTU56+mgL+Bg
         CuZHie38c0JZdxkaM/oU/7g2RMEdOWP00d7H4WTBq4wugpVS9tgfB/DrjzgqUWfUZkce
         EGUwM7ceNnGJheLQE2Rq9cG5iNWiB+XsRmdd5FlBOWsJh+MAfWG4rK3POSL9ur/DzriH
         ysEJ35c+AxheuzKyD9DDZf9yZrKBj6H9LONF+AG19OmUkJ/z7FOLixHN22kJkaPW5L0M
         IX1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWletpy53euR365yKXh8TyQGYlC++DGjTTJlG754fOv6cQkOwcI0ejAaw/5uIGsKJXCDf/p/bYtaZdyUw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyqQIESSrSwsGUJCQoWoEWBdjbHsV6hKPXvXWmCvCAnVMBUlUTJ
	aV/eKIdP4OqLx+FoAPKJ0aKkK3zVHh4kKDRMRU1btLXC41VtWEkeQUnDbdXswYGgWoPcpgeU+uO
	PXxRNmS/qRkc8FovXpKgGcqmfgcF/Y5HMM9ej7w==
X-Google-Smtp-Source: AGHT+IEGxTvgFJQKGjPndiT4g1UmrIbaruLgKpKg20RzOuGPbLbHepYglwQf3SmW4/COXfCydu/3Ww6v3WefxwQ10jU=
X-Received: by 2002:a05:6122:2a53:b0:50d:60fa:183e with SMTP id
 71dfb90a1353d-50fd037aecemr2859533e0c.11.1729694363103; Wed, 23 Oct 2024
 07:39:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 23 Oct 2024 20:09:11 +0530
Message-ID: <CA+G9fYt19NZ=8wY9aQRdYjtsPgiaywUQ2ff+TGkX-6zLBUGsNA@mail.gmail.com>
Subject: axm55xx_defconfig: ld.lld: error: undefined symbol: lockdown_reasons
To: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, linux-security-module@vger.kernel.org
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Paul Moore <paul@paul-moore.com>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	"Serge E. Hallyn" <serge@hallyn.com>, James Morris <jmorris@namei.org>, 
	Casey Schaufler <casey@schaufler-ca.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The following build regressions are noticed on arm due to following
Warnings and errors with gcc-13, clang-19 and clang-nightly with
axm55xx_defconfig.

Started happening on next-20241023.
Good:  next-20241022
Bad:   next-20241023

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
=E2=80=94-------
ld.lld: error: undefined symbol: lockdown_reasons
>>> referenced by lsm_audit.c:417 (security/lsm_audit.c:417)
>>>               security/lsm_audit.o:(audit_log_lsm_data) in archive vmli=
nux.a
>>> referenced by lsm_audit.c:417 (security/lsm_audit.c:417)
>>>               security/lsm_audit.o:(audit_log_lsm_data) in archive vmli=
nux.a

Links:
=E2=80=94---
Download_url:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2npIko0KV1uYFA7CZM7n=
R9jHBBO/

Metadata:
=E2=80=94----
Git_describe: next-20241023
Git_repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it
Git_sha: ceab669fdf7b7510b4e4997b33d6f66e433a96db
Build_name: clang-19
Compiler: clang-19 and gcc-13
Config: https://storage.tuxsuite.com/public/linaro/lkft/builds/2npIko0KV1uY=
FA7CZM7nR9jHBBO/config
Download_url:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2npIko0KV1uYFA7CZM7n=
R9jHBBO/
arch: arm
config: axm55xx_defconfig

--
Linaro LKFT
https://lkft.linaro.org

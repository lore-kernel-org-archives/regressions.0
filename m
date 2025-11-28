Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E10A54654
	for <regressions@lists.linux.dev>; Fri, 28 Nov 2025 23:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764374346; cv=none; b=Ked1YE1kzPgrWx8Xz5a5avrzyZPXsVR09GQaafp2ExUTCuLdu7Demp8o4sVPDYsizYb+bnwhzQXiETrznjh3uIhCTNRPK8fkgxc876RgVJ4OZ6REAFYqCvwnRKTO2O328njlSuQIpcWBa2jwSsHZzFKx2BUXeY0jRcNgRQJhVf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764374346; c=relaxed/simple;
	bh=sfOKsFRWKR/+AcSXVKIAXrSo1GIrzFFrdUciEYj5q8s=;
	h=Content-Type:MIME-Version:Subject:From:To:Cc:Date:Message-ID; b=VNo21DRk6F3QUTqq9ezqKSayL1Kb/3vg+pdPwrAkFuGdpu5WNiGhyQtPALEkcI836VsC3Axlj8uUoQhLFp8LeSzjy5SKPVjHJjys3pLgkyvT/Plkmn1HvS13alMzUUxnmHCwXmWbaqsLm6gO5XEd3/U7JWO+Gk6o9BWzpk2j/PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=diUekmB4; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="diUekmB4"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7baf61be569so2772203b3a.3
        for <regressions@lists.linux.dev>; Fri, 28 Nov 2025 15:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1764374344; x=1764979144; darn=lists.linux.dev;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iNq2QIgVaRzPFi1mONVi+tQT9fppnUbycN9YT9rHQIg=;
        b=diUekmB44bg+v43yKbTvGsSynJJh+00B1c91vDIoKAJPjCd3pZhq4cLzuX4vTCNCF6
         YCJUN+ZojDIxpuHGKcAi3IrvOORnJx/ZcJdImzuNdzkUd1DL6WJKa8YV7NiZ+h9cqeNE
         5BW9Js2iCgbqb0yGhQY1+zsEyssMd5IvjQ3JMVb3R/uMWyGiB6te+u7RpiWlUZNjCWN3
         erqukw3lMJ9CSHoYiaTHUEVhWXCcBkZpln51PlHqhqF0k3hddj62pl1TcEweMjHbrldC
         2iScIILJwlTN3MELyNBIViEzeaEnRJv77212mTd0g91jS3WUvHZoVkmBQxta4csnnoZu
         f1cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764374344; x=1764979144;
        h=message-id:date:reply-to:cc:to:from:subject
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iNq2QIgVaRzPFi1mONVi+tQT9fppnUbycN9YT9rHQIg=;
        b=wRRD0XWkYqrLqjLW2+2w6nGYQvn4pMmiH7RU4hnM2XpLGKev1zcNzoPI/rlA4R2e5S
         Nnw31HBDa/T8Z8R7c3uiNuHovyTIGAOSvVuKzlTcMk+NZRXHxMqtOeAetu++h1Ig8yj6
         YvVdjlGNkXH+Jp29BWE0buY1YzYK2k1RJwm9dnh75LJ2wEnWm1tLB1JNnOIZN6meTftS
         ZIQWqeuHITdJHcLNCOswtNI5mQpXDc0MmmzBo/GBEHGQHnJuBkSDw+Y+bNQoKAYp+Xmb
         3eKx75fl7IzEePx5IbvE561OPbpCrvpezg6r5nNaD+VC3A07mn8IP9iD21UzyJKPDIX0
         gifw==
X-Gm-Message-State: AOJu0Yz+jR8oChfTHgoQrNf0ENwBY/dFRTHdq3oby/Y9CYhHpieMgjK4
	x4jGH65QPNJXT+dSyE23wb7KJ9Jfy27eNTDtMehtQY3vzgoo/lr0HB5T18MKlrhLcMM=
X-Gm-Gg: ASbGncsCBu/wM8JNccNo6P2+TEEJ8ky+GoZfRoawJ1goCEysKdC2DTZbABa+8wT8hC0
	N2TMUlfEHywfEDV5CEyQlYFEoL8aIKWBsRpqnT7Q4wc3L3jjdEgBs3TRWvOO+SiWzWsTj33FHVj
	cxRl6riCEQvHhJbPg1O3tiUNjEf4KzKsHsGBmx2tigXY613VfEGlrK7sQhixjFlRky7Jk32re5G
	2MCoccYPZxp2dEYo//hPYoetq5H766Jsuk3yylC7zlfaQbSroP9wVWnGmWX8yUovxl3svTjVl6l
	voWTZHvtk4/+rzHyJ6VqGblKgrh1k4YamKD4yJfeBTkxRXijvfB7KjWgSoelYzG8Do3BlrnjMWF
	vrFdzHP0hoFvehzn6ytk1O2/rw49GiNzws5B7irEDsnOT0R2k8qY74Ko4N5siaaS8dSMCda9TFj
	gnbgaJAiWvvcIM2Qg=
X-Google-Smtp-Source: AGHT+IGHZ3kethrV7DwOkPLSvYzToRpn8JWjTImNa1+vxh53D106S6DyYwBXIn/PuHBNgpV5NOnCvg==
X-Received: by 2002:a05:7022:3c12:b0:119:e569:f260 with SMTP id a92af1059eb24-11c9d70a113mr15618732c88.9.1764374344321;
        Fri, 28 Nov 2025 15:59:04 -0800 (PST)
Received: from 1ece3ece63ba ([20.38.40.137])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11dcae73bedsm23110106c88.0.2025.11.28.15.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 15:59:03 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [REGRESSION] mainline/master: (build) variable 'key' is used
 uninitialized
 whenever 'if' condition is fa...
From: KernelCI bot <bot@kernelci.org>
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, laura.nao@collabora.com,
 shreeya.patel@collabora.com, broonie@kernel.org
Reply-To: kernelci@lists.linux.dev
Date: Fri, 28 Nov 2025 23:59:03 -0000
Message-ID: <176437434287.1622.6417487641535262111@1ece3ece63ba>





Hello,

New build issue found on mainline/master:

---
 variable 'key' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized] in fs/afs/security.o (fs/afs/security.c) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:264468cfe38c2c5d659457a6a6eadfce2acf59c7
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  9917bf8e7f5a9efbab844cf06cfd8da8eb7e13b6


Please include the KernelCI tag when submitting a fix:

Reported-by: kernelci.org bot <bot@kernelci.org>


Log excerpt:
=====================================================
fs/afs/security.c:29:6: error: variable 'key' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
   29 |         if (!cell->anonymous_key) {
      |             ^~~~~~~~~~~~~~~~~~~~
fs/afs/security.c:36:13: note: uninitialized use occurs here
   36 |         if (IS_ERR(key))
      |                    ^~~
fs/afs/security.c:29:2: note: remove the 'if' if its condition is always true
   29 |         if (!cell->anonymous_key) {
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~
fs/afs/security.c:26:17: note: initialize the variable 'key' to silence this warning
   26 |         struct key *key;
      |                        ^
      |                         = NULL
1 error generated.

=====================================================


# Builds where the incident occurred:

## defconfig+allmodconfig+CONFIG_FRAME_WARN=2048 on (arm):
- compiler: clang-21
- config: https://files.kernelci.org/kbuild-clang-21-arm-allmodconfig-692a14b1f5b8743b1f69fcbf/.config
- dashboard: https://d.kernelci.org/build/maestro:692a14b1f5b8743b1f69fcbf

## i386_defconfig+allmodconfig+CONFIG_FRAME_WARN=2048 on (i386):
- compiler: clang-21
- config: https://files.kernelci.org/kbuild-clang-21-i386-allmodconfig-692a150ef5b8743b1f69fdae/.config
- dashboard: https://d.kernelci.org/build/maestro:692a150ef5b8743b1f69fdae


#kernelci issue maestro:264468cfe38c2c5d659457a6a6eadfce2acf59c7

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

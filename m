Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A560137932
	for <regressions@lists.linux.dev>; Sun, 30 Mar 2025 21:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743371948; cv=none; b=nXTZaoySOFiavb7Kb8CCCBuUICWqkr2q4G+W/SjML/cC4CBXSofMGoyGdsF9WXZv2MFtxTbljHFRZe2MaXCUh4rsNolA9oWsNfpFQHBy8+Yu9mY/haUW+RXCos+JTPiUw7+j9mqtdvM/lBMj+g3ktqMip+nAiigDnj3AmyhQvLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743371948; c=relaxed/simple;
	bh=92zObJaor0Z8SxyMjhWbm/HHDLuwnDiwczUvcgEe5f4=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=Brrmf5hpUFnZUbgVBAOKd3LKB3FWxSXusEcjIMsIMVMBZoogfu7OgTrTzc0xp4sZiH8H3K1U08HjHJG41mgC4UnogYFrQbSdT4wK6Xb/Uni0287qugFujaaEylL40Z8Kxdh7cu558vQa/KKWSyv9TO4H0ZQgqkNu1KEZWdGoOlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=Ip58cVG7; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="Ip58cVG7"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6febbd3b75cso34288567b3.0
        for <regressions@lists.linux.dev>; Sun, 30 Mar 2025 14:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1743371945; x=1743976745; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vWQyx5iYGqf40B1J4EraL4UEjgKym4vzzeRVJ61WBXk=;
        b=Ip58cVG7JS3lnCQoXOPoNO9fdSpl1g7MP4SDh/dFjWVBSDEKNI6DxOD4afldn/FS3K
         I2aaTUh+5FnO+jZ8zq2kUvX/WikMyXyYFNwm4KdNg9Yg8JIQ95TW4LL09qN/3hWjf5jk
         06HJmCbNFBsgNrH0IV9cKCP6uauBFRc6qUlP/vJEyEhtkRhe13a1ptjBapkZgIEcrRYC
         r+9VBd3Uc2bCs0GsYnSDm54eUuBbwWTHusRnrHlp12Eb9XZSslznyfcQ5cu2xxrPfvfW
         UCBBalndWlQl3kuKmF2QJAS4VyQZ2LhatOR827AGC6hcI7srynsJBJtH8+86lv9rpA4C
         j/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743371945; x=1743976745;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vWQyx5iYGqf40B1J4EraL4UEjgKym4vzzeRVJ61WBXk=;
        b=xLxB/u15iPjrdXKNPQBBrx//qlpYHrbiAQeFwxZLNRlR+ZcFJad+/Mr3HIUOqUZQ29
         zS94H2dwi5Eb7gmdQvZfIovAAraC3dQnXcEPLINu8bh487pWgfIZLpbYQkw8DLNXrV/8
         iba7/uJ82WII0sCkRPHFpAkYiR9bCZgb5HRNXkooMEfT0XRdl0wfhKbqlLmUlQmbntJN
         1m+PFy5p2HOmDXr4+rd6GuRa5p+UrgUktoytLzpeXVdD1HfbYpChW/4z3eRC9enY+ZH4
         P6xgT41/EmQdtLexQB/aMv9KQxF7gZ9nSFwPwtuF4hpuUP5WC862HuY1UImtwiUDlzBf
         v1rg==
X-Gm-Message-State: AOJu0YzvOutBmiKEmQfb07IUpq+XzNl1wrJ9BhxyBjn+N2Ewqno1JS7H
	exoEaMlhws+H/sCZdTV7jEbexh3LQi+LwRQxOrk23bbmJAnTwqtrLnfYnisqrYJU9vSdcOSDOSb
	3OenZ+YNRth3TjqZ316TVy9p9ugLUJpMo+No2tg==
X-Gm-Gg: ASbGncvXQZxm+QjvxUm3goM7vow2oIO7W7loH1JqZjPoSj8fD9MxvAdJcLXqS9cVdvx
	IP0d8iW/7wkjPbxB4GisAo7as8VCtOxpDFXA5N/ctCG5CFr9rCGKZ+akI9pBvg10nF4HJL62Yy4
	fusCHjK+JDnravYVQARm/PesuK
X-Google-Smtp-Source: AGHT+IGarEYufXDZDW78dh8cUhz3IqAZorsgq8uLso31VP1xtq2PSmpo55p3CS6+1FdmQ3EfVZPRSIPuS6K7tMZiEwI=
X-Received: by 2002:a05:690c:3708:b0:6f7:55a2:4cd8 with SMTP id
 00721157ae682-702570d7eccmr85342147b3.5.1743371944904; Sun, 30 Mar 2025
 14:59:04 -0700 (PDT)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 30 Mar 2025 17:59:03 -0400
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 30 Mar 2025 17:59:03 -0400
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Sun, 30 Mar 2025 17:59:03 -0400
X-Gm-Features: AQ5f1JpjXB0Wgm4lm7PTEA5hvZDNDsjN9MkWrIijcBz8U_0JSJ1mFq2Pw4Iol60
Message-ID: <CACo-S-35c2Pu5gO70w5iUbPqTwd8NhUgdd7A08PKFCjcWNhjbg@mail.gmail.com>
Subject: [REGRESSION] mainline/master: (build) ./usr/include/cxl/features.h:11:10:.
 fatal error: 'uuid/uuid.h' fi...
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, laura.nao@collabora.com, 
	shreeya.patel@collabora.com, broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

New build issue found on mainline/master:

---
 ./usr/include/cxl/features.h:11:10:. fatal error: 'uuid/uuid.h' file
not found in usr/include/cxl/features.hdrtest
(usr/include/cxl/features.h) [logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:f0199ae405a66fa69687080d252f7be6b12854a3
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
- commit HEAD:  aa918db707fba507e85217961643281ee8dfb2ed


Log excerpt:
=====================================================
./usr/include/cxl/features.h:11:10:. fatal error: 'uuid/uuid.h' file not found
   11 | #i.nclude <u.uid/uuid..h>
      |          ^~~~~~~~~~~~~
.1 error generated.
.....
=====================================================


# Builds where the incident occurred:

## x86_64_defconfig+allmodconfig on (x86_64):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:67e9b6bf67593f2aa04004a2


#kernelci issue maestro:f0199ae405a66fa69687080d252f7be6b12854a3

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

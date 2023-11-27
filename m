Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9862820F9
	for <regressions@lists.linux.dev>; Mon, 27 Nov 2023 08:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q5iNwI+r"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-4af5ea40b7bso1133598e0c.2
        for <regressions@lists.linux.dev>; Mon, 27 Nov 2023 00:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701075471; x=1701680271; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Q3a/gp0k8Xr24VWAVkFjnZAQbXQVNc8sm8eV5Fej3d0=;
        b=q5iNwI+rLNYZJYXKkRauFjE9+f43P6JvX2U7M1mYFxKhbZBSS8zs3dN3bOQxiaMJC/
         oUuETdlfTDF0jzzwJ3hmcbA3C/hWz31EKMUhJqYwkiJ+BxOfraDiODRryUHZL2aFNOE8
         +iBB4Obp/xAykN8cCUSF9iW4IY0/f3jO5Kzthwo5donxajAyHAFXQmT0Py3Rwb9c1BhN
         HtgGvienXQt6IGN21deyt7CksQihYG1a5ZxxJYgBrMvoqv2b5EdX8fDx+HXjI1jLRoU5
         HQScmUBLAf6Jawawe7NyWTbSamc2J6vNjrSa66v3L1CrcgJIB5JBqK0bcLhDkSEJTe8b
         NYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701075471; x=1701680271;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q3a/gp0k8Xr24VWAVkFjnZAQbXQVNc8sm8eV5Fej3d0=;
        b=kayhwM0jmsYuehMbAsqy4j5NVaSpp5r8wGgCqQ/QlhVYUAnh7OhYXuTPq0nslUNniu
         8S1BJGTGiiIWFR5zL52boK3PDLnzyH6N6WRWJzpH55XOVDCFTNBPf8Q18xC78Go30cZ1
         Ww1nXH/Fd4hpw5rYkiBEM8kZgqCF3RHETePnEb5l8nFmrTOamceqKF5PC9gcnXmQ8Fs6
         hfx7eU3qk6hqPCYrQtsrsqQuLlNzhe5oz3ZJDmfi5ieilYiL0YTzUYOphUwZPafCmGyW
         BzVhU4tQfoccxdCnXc/+sXG2GSWmzD0nuO+05P50f3XEr4FmcC/JOf4Aabr4C2BvOtC0
         Nbhw==
X-Gm-Message-State: AOJu0YwtXNfxf4q8Y6QDDmfjrziwXhpU6c2RtovWhTu271PXvZAr5rcc
	0r0leKJz1C9aCuYsUoMkLX7ufYoGj9JiDhexDlo7xg==
X-Google-Smtp-Source: AGHT+IFv95af33s1Ivrbna3UuLQx1RVxE1lA8CxAKNGR1f+9OlWM5+Mw0oXtBMJb+qYB4sJZRWgnDMtvK5EbVnJyJ9Q=
X-Received: by 2002:a05:6122:3106:b0:496:2e22:29e3 with SMTP id
 cg6-20020a056122310600b004962e2229e3mr11176649vkb.1.1701075471346; Mon, 27
 Nov 2023 00:57:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 27 Nov 2023 14:27:40 +0530
Message-ID: <CA+G9fYsM4Aa1smp2Xahf=z2WOGpXsAC3GzUW06HJN9pucm837Q@mail.gmail.com>
Subject: parisc: bug.h:71:17: error: invalid 'asm': operand number out of range
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	linux-parisc <linux-parisc@vger.kernel.org>, regressions@lists.linux.dev
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Helge Deller <deller@gmx.de>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, 
	John David Anglin <dave.anglin@bell.net>
Content-Type: text/plain; charset="UTF-8"

The parisc tinyconfig built with gcc-11 failed on mainline v6.7-rc3.

git_describe: v6.7-rc3
git_repo: https://gitlab.com/Linaro/lkft/mirrors/torvalds/linux-mainline

parisc:
  build:
    * gcc-11-tinyconfig

In file included from lib/math/int_log.c:14:
lib/math/int_log.c: In function 'intlog2':
arch/parisc/include/asm/bug.h:71:17: error: invalid 'asm': operand
number out of range
   71 |                 asm volatile("\n"
         \
      |                 ^~~


Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Links:
 - https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.7-rc3/testrun/21323529/suite/build/test/gcc-11-tinyconfig/log
 - https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.7-rc3/testrun/21323529/suite/build/test/gcc-11-tinyconfig/history/
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2Yk9c7RsS6V5pdDdOYzHSrlpZQk/

--
Linaro LKFT
https://lkft.linaro.org

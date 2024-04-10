Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA3C156C67
	for <regressions@lists.linux.dev>; Wed, 10 Apr 2024 10:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712746586; cv=none; b=PcI2goeOpcQMPYhwzvCY0z47R34Bfyk9jn97OySlyfLdDEmzwVSznBpedvDy5bqj0fXRcLBwWCfdhWMZ6Vg31f4cQg//7Iy6u9+dqZVph0ehjz/8ltHKqi4X0fL6tNSQbgmr5Xt1138v30ydxmdB3kXgtIopCqoaMtNWhscSRts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712746586; c=relaxed/simple;
	bh=PkLomg3XZoAJg3TSd9x2y2XkV+U9wN5WgCjvRqpTvr4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=kKWLzUjyE7Z19G8sy4ze1/EyMwZ5oD9l0U2YOWaV7W7GZlmJzfb+dFwFkAOB/Q7ab95VblcE3QwDfiRtiQVHD2yXp7PHyO2VEbTf/5710sA0RRGWyEZs+34+Q0gVADzpkDM5GkiOUqgk+CZHXw1IR4H/NgIvZ00afnk7gN3toIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lPoqH4o9; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lPoqH4o9"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-4dad331b828so1151688e0c.2
        for <regressions@lists.linux.dev>; Wed, 10 Apr 2024 03:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712746584; x=1713351384; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=A4P1zHA79cNSOqe5dhAPt9YiRo8Ig2ZEUFz6PytxSbs=;
        b=lPoqH4o9Nc2UB9ANjGZcsn1iyTrGR0Cy/68wWxonS5HgbXwY4tCPLnPZaY5G+VrrdW
         kOXel9THsR4bvBEcQTL+7H5PKCQJumiI1VNbd9ZCsmtzo5MwydqrKIma1ZonphY6ASjF
         pzi5NNasXE1C/MY1abu34Hdxrdj0hv5jYZUnAbkuwGi2BlsjIPoKuacmfKaabYS1zMhX
         kliGTl+gD4m6NGWuWePFr1pPjdl6uXDWnO+y3MhT/LGwZTJvb2z1G2LPa4bwQIxGCynH
         A4ezHXDwinq4KZ/7O/us1V+GaM0ZOMXGCFduh6Zrv8Ob0Dy6oJS8g8dDXKIk2QrWyN9E
         ytBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712746584; x=1713351384;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A4P1zHA79cNSOqe5dhAPt9YiRo8Ig2ZEUFz6PytxSbs=;
        b=grt/ArnmpXpQfywI0jyd5qwA6SJuunkFzuqcQpVezzMlYXmoWWFQr2EbmMK6rFhh4l
         cLQZ0XawxprrGT9dk5OoEvSZobHq6VgiDuXO3ndg45Z2Ou8O/u9ZbPicyDu5lIU1k1bf
         iNcp4TT63miJDOGKWd3hpZQ2NNSMp8OwsomlaDusNBKK8H3elLQpTQkgfzpSdxBBmbRA
         f4nGMZ+iCH7UqJYCM+Frp+oRKseZpCY7e1tZoOETrZOTBzqJdMbY6IpfCQAD4EIItloS
         vSBIyqtpXexphjHpnIta09AiUNC1D+3lBXWrdNkV03YscsxedBWmcbhzCIijEFxkroTl
         Km3w==
X-Forwarded-Encrypted: i=1; AJvYcCUqPOX190nMbTUjwcHXP/0GT/Vs1fOi7DumGiuIqrOmk8jvjS/7lY+m5TY1icj7kPB4H21vmlPFAZddPitys3JAqnS/AvWgWU+3WrI=
X-Gm-Message-State: AOJu0YzkeYfnXlJZlp/chjT0RytY3zbJc0197s2dPt4qXGP7uj8Bynax
	yoLDVXa9qGGZM3cycu01Ed7rGKv4frfVdJU6E7hW+WKdgAjBT9/Yh0XjzfpXLeHkVExLeefTPwe
	rrp2Dgqcav/+c4on43Km5SvaBHBl7B1vimnKAwQ==
X-Google-Smtp-Source: AGHT+IGvDtSipGLN4V+a5OK8F15/LzzDmS0siND2Ax9vMFlFPnR/b9TAjNiJAXVFQnE88ZlIPrSPfifC/IbqQFAdzjw=
X-Received: by 2002:a05:6122:a22:b0:4cd:20ea:35aa with SMTP id
 34-20020a0561220a2200b004cd20ea35aamr2414982vkn.8.1712746584230; Wed, 10 Apr
 2024 03:56:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 10 Apr 2024 16:26:12 +0530
Message-ID: <CA+G9fYvjdZCW=7ZGxS6A_3bysjQ56YF7S-+PNLQ_8a4DKh1Bhg@mail.gmail.com>
Subject: tinyconfig: kernel/time/timekeeping.c:286:1: error: no return
 statement in function returning non-void [-Werror=return-type]
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Thomas Gleixner <tglx@linutronix.de>, Adrian Hunter <adrian.hunter@intel.com>, 
	Stephen Boyd <sboyd@kernel.org>, John Stultz <jstultz@google.com>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The powerpc,s390, superSh and sparc tinyconfig builds failed due to
following build
warnings / errors on the Linux next-20240410 with gcc-13 and gcc-11.

List build failures:
---
* s390, build
  - gcc-13-tinyconfig - failed
  - gcc-8-tinyconfig - failed

* sh, build
  - gcc-11-tinyconfig - failed

* sparc, build
  - gcc-11-tinyconfig - failed

* mips, build
  - gcc-12-tinyconfig - failed
  - gcc-8-tinyconfig - failed

* powerpc, build
  - gcc-13-tinyconfig - failed
  - gcc-8-tinyconfig - failed

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
--------
kernel/time/timekeeping.c: In function 'timekeeping_debug_get_ns':
kernel/time/timekeeping.c:286:1: error: no return statement in
function returning non-void [-Werror=return-type]
  286 | }
      | ^
cc1: some warnings being treated as errors

steps to reproduce:
---
# tuxmake --runtime podman --target-arch powerpc --toolchain gcc-13
--kconfig tinyconfig

Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240410/testrun/23380322/suite/build/test/gcc-13-tinyconfig/details/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240410/testrun/23380301/suite/build/test/gcc-11-tinyconfig/history/
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240410/testrun/23380301/suite/build/tests/

--
Linaro LKFT
https://lkft.linaro.org

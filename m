Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E182B84E0A
	for <regressions@lists.linux.dev>; Tue, 16 Apr 2024 09:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713259986; cv=none; b=o66dqNkMQJZh6hI+HuZX7h6Qwny9LBAxCHYFbyFnpykcueA9DVEDedGqO4/3UHfF7tk/dpPstgloMRPcDqp9xxEJmmfuyINEFRIMjiQlE44qW9WRmAxa6qbagQ7ddUHijzx9NIhojjTB1QcAzaUPeW82I5ZZRFVjKqH9dLB907o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713259986; c=relaxed/simple;
	bh=0Gl50EmCLVOMt6kqv6vYCIWrekR2zOz/+FuL5NWpOck=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=RBcFZ232fLyKIAOCPAGKZPBPznKEOIBLeCBAHDzV3UFcjUsK93gCul/yNXJ0pzM8yCUbFaTZUVclGG1yn60WRf3yUlf686emEtzxA7SgCMqa/OTej3JUFApfNIpKAx1881EUDNCgp/VUdvbP/DbZP1VQyJ/HT1fGK/LvYVh6N9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BCvdH2AK; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BCvdH2AK"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-4daa5d0afb5so1434962e0c.0
        for <regressions@lists.linux.dev>; Tue, 16 Apr 2024 02:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713259984; x=1713864784; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ndrnd625fhH+o+1Q6bsYpoaFuC2gIYmA4glyfnWSIIc=;
        b=BCvdH2AKhfPH7LqmFE+u9BdmVChzqLYC7vY0v38JWjUXgBL8HEeuMI0KfMbpCdNBKr
         rRaNL3CKUz7eRrAmXr26SlDl5zW62pbirgAsS1uyEsWFEA6BOxrzRDvI2iOesMRMnw6b
         GeWOM9+BX7lMhoebZNnNzXP95ufQ+0w+qTcRVWfW/Dm9E8QnEdApyITBpYh2GwRwQanX
         xVm2uhSm+6dsmwKUD6Z4kZB2xSFR7s5UP1tM5t2wCwJJmxUxuS377uUAg0G23ZwZBzpk
         nsHOock1Tfn67rsAOipV/wnbYGJenrUD5MYnFAutzLSTaQLu7JoSnZztRFkrmcYKwWit
         1W1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713259984; x=1713864784;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ndrnd625fhH+o+1Q6bsYpoaFuC2gIYmA4glyfnWSIIc=;
        b=ky176doEkIb1R9+PKTR96SsKBRJeOjws7S2paKc2d4DQ5dlPDE/F6AtRu9YZHoNMPE
         hAH9YzfeVYu5p5uzTuwCamHIBnj/Vcfz0xg4ytqiej5qltOXqtgmaVLX5/1N37syGpJy
         3X0QI8XwyHixgtV8jXE31g7FmJYIfe5m2J/QaR6qVKZeaMjAbxIDd/Zaox2ZOWvQUDjD
         mdE4FrX7fS+dD2zaowbLcff9GyMqINOQ3Es813wLx2TpTwsJy354CScl3JyQO4TQqss2
         eXZUz08vFrOUCCvC8RVHRnne5YkUInP6SLQkbSN0oFu1s8WvypAovnmJivbL9YYs435Z
         PoxA==
X-Forwarded-Encrypted: i=1; AJvYcCWcUaWqxVq/XKciT3+ZSawbAKtyP62X5BcWHGPQ8JbhcQdt5A9i+mPK9vh5a7OfMOUq+7x5wzpPOMHqgJAhnHMAcQ77C+vajusu/hU=
X-Gm-Message-State: AOJu0YyQPUimh2WxKj7WDaxW0fVglh05/swCexVdfrVFHnkMcRSrJ8bG
	vj0493oq256rv/FE4TOTCeMXj+1+TJ4jVKBQ8fDnBG1Os0FHM5KuOGJItQSqRzSI5xrtovr6ypX
	46yaUgM9ko+Trk72gpOltg0sfV9g4+C7NtMkjTw==
X-Google-Smtp-Source: AGHT+IG8D9vuAHmYC+KaM43JW5eMv7zVIbneQHVp8QBSV8dIrkMNPPOSsaQF76mhGJzEt5W5Jxc6s2f74IzVPZ0IMx8=
X-Received: by 2002:a05:6122:31a9:b0:4da:aabe:6f6c with SMTP id
 ch41-20020a05612231a900b004daaabe6f6cmr10367344vkb.7.1713259983821; Tue, 16
 Apr 2024 02:33:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 16 Apr 2024 15:02:52 +0530
Message-ID: <CA+G9fYtEh8zmq8k8wE-8RZwW-Qr927RLTn+KqGnq1F=ptaaNsA@mail.gmail.com>
Subject: powerpc: io-defs.h:43:1: error: performing pointer arithmetic on a
 null pointer has undefined behavior [-Werror,-Wnull-pointer-arithmetic]
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, clang-built-linux <llvm@lists.linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	Jeff Xu <jeffxu@chromium.org>, Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"

The Powerpc clang builds failed due to following warnings / errors on the
Linux next-20240416 tag.

Powerpc:
 - tqm8xx_defconfig + clang-17 - Failed
 - allnoconfig + clang-17 - Failed
 - tinyconfig + clang-17 - Failed

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
--------
In file included from arch/powerpc/kernel/ptrace/ptrace.c:19:
In file included from include/linux/syscalls.h:93:
In file included from include/trace/syscall.h:7:
In file included from include/linux/trace_events.h:9:
In file included from include/linux/hardirq.h:11:
In file included from arch/powerpc/include/asm/hardirq.h:6:
In file included from include/linux/irq.h:20:
In file included from include/linux/io.h:14:
In file included from arch/powerpc/include/asm/io.h:672:
arch/powerpc/include/asm/io-defs.h:43:1: error: performing pointer
arithmetic on a null pointer has undefined behavior
[-Werror,-Wnull-pointer-arithmetic]
   43 | DEF_PCI_AC_NORET(insb, (unsigned long p, void *b, unsigned long c),
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   44 |                  (p, b, c), pio, p)
      |                  ~~~~~~~~~~~~~~~~~~

Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240416/testrun/23495171/suite/build/test/clang-17-tqm8xx_defconfig/details/
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2fAvI3mKJ0dTHcazPrLl2zNF9JO/

--
Linaro LKFT
https://lkft.linaro.org

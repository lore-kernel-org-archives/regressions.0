Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03487EEFD
	for <regressions@lists.linux.dev>; Thu, 28 Mar 2024 13:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711632965; cv=none; b=G5KaPgJYH5lLBkmGUpsVzE5/Ce6ByF2uS9JAwFv1TgITMRw5+wu/AHzdTzLyOcejWHILJEtQFPP/areZRcJwYbqzM+xl1FWso6/wDMIShhjGCsfdTnKYq4+4h/+MatZgnpR5QWIrKCQUMfmcvFHiv+jI7we+n6cpCYp9/Cm/rxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711632965; c=relaxed/simple;
	bh=qPSo9SyuNPKLPGiduEGiKIv2kZsIHdaIyrrQp+mxrXo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=iw+9LmTwaskDoLLTjDjTbwUv2paCFQDYipVfVVJAqfCUW59Iz4tgZ8pH4QnYQOFaS/F2G+GERQ1P48qJMs30CBT8pszfr8UXngHDioSP7vqOL4MOJJCpF2zc/nkAEmIBklPyYGq3saYunHQ4ZAWaAxbtJeTdIw92EFlwiRNNlH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UzUOUr1S; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UzUOUr1S"
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-7e0ae718e36so237355241.2
        for <regressions@lists.linux.dev>; Thu, 28 Mar 2024 06:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711632963; x=1712237763; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HuxlR8CvEOXqyHj+Qq7Cj7wAF1B8kiKsrY6NRMdaszA=;
        b=UzUOUr1SbtNUNNYXadZcQ/yIySybro2gtwTkbqz9sDCiLYDeudopKkeP8wAGnlZU+M
         4KX/lalu1IADSL5gsS6EwicMByCVEfAZqKNyGWbpTkxK6i9XJ46NkpDPd8rHUfPea8x6
         6WRoj945DeqfIKyzpSTsOeURY77koTT7s55+5DdExZdU9fymJva7H8bx7/8cqhNGK1kr
         Ioj+9R37Uobftod6EJWPulPi0XRqXu8163508JJJjqlfJxAUEZqKhV7Hnci5DmQWrcr0
         HfJMUxUz2vlUMUQ2oc/+LXHisiWdLA11O46Ku3GhhjMUf4SpxfaCXxs7C4Lv2WHcjYgo
         exgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711632963; x=1712237763;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HuxlR8CvEOXqyHj+Qq7Cj7wAF1B8kiKsrY6NRMdaszA=;
        b=KeaGmFpxLFUtrdHc8KyRNRONNib3uqRcPb3+F1qGAitV2SOjB96D5+jTgv4msuk1Vk
         M5v1b3KqKf5+SKws2LdnYPK3dIcgQLdA/w9QpfbMnOU5Ttap6X1m7takvqTfGwaQe3tY
         v/9E7FTh/0zRoKqKtdDwJJY0ck0VwOm8LyjxpX59wSv6QuHFnM9nqsWv4URvxKKtTfQO
         I0fI8+3NlGg9qrykEAyhMr96JPepTOynosfdp6OC8GbK5+M0IOdaqbpNLb7eLoPTZQ43
         o3SzsP6eoc/8VssMzaXaCQYIMSw1TrUoX48SYpF1gtSunsyUSi9U+5MVWSF8e4EDGEO1
         COeA==
X-Forwarded-Encrypted: i=1; AJvYcCX30WehUnu1wOTsp+OzGPMoDdT/+DDYLeSpwHERl6Rqbv07UueDMYL/PUox2ixfvtO4Cm3zXldfGiGcnMC2rNyEi5rOHEfWV/VTekQ=
X-Gm-Message-State: AOJu0YyNyriB6M/+Zh+VBO2hdmWy67MoYGgVZeTboD/ny0tHLbwVQOYX
	d3l+7FnlRMegLwcDcFzfq1Btl9R0Y2PLS/AuKwAE8pSqLfe0ajfqppeJZwFfStRxuG5fefW1xCB
	AzfBE5Cf4j054wcfI3hi53XIebWo5WhhNb/iZNA==
X-Google-Smtp-Source: AGHT+IHu7K7lWRnHw3NgjJmNDEaFubXFArdguKWXHksy1hC4QSKCDsGBXOPEsK+90ZnaUJkZYzR6GUfytoXhOk105Yo=
X-Received: by 2002:a05:6122:1698:b0:4d8:9541:41a0 with SMTP id
 24-20020a056122169800b004d8954141a0mr3518206vkl.12.1711632962732; Thu, 28 Mar
 2024 06:36:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 28 Mar 2024 19:05:51 +0530
Message-ID: <CA+G9fYvbFMMCmk91vzVXcS5T2Ezkwg8tQDgt_TfF-8Q=c0B0PQ@mail.gmail.com>
Subject: next: x86_64 defconfig with clang-17 failed
To: open list <linux-kernel@vger.kernel.org>, linux-mm <linux-mm@kvack.org>, 
	Linux Regressions <regressions@lists.linux.dev>, lkft-triage@lists.linaro.org, 
	clang-built-linux <llvm@lists.linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	willy@infradead.org, David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"

While building x86_64 defconfig with clang-17 the following build warnings /
errors noticed on Linux next-20240328 tag.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build error:
---------
mm/memory.c:5094:25: error: variable 'pte' is uninitialized when used
here [-Werror,-Wuninitialized]
 5094 |                         writable = pte_write(pte);
      |                                              ^~~
mm/memory.c:5083:3: note: variable 'pte' is declared here
 5083 |                 pte_t pte, old_pte;
      |                 ^
1 error generated.

steps to reproduce:
----------
# tuxmake --runtime podman --target-arch x86_64 --toolchain clang-17
--kconfig x86_64_defconfig LLVM=1 LLVM_IAS=1


Links:
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240328/testrun/23230289/suite/build/test/clang-17-x86_64_defconfig/log
 - https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20240328/testrun/23230289/suite/build/test/clang-17-x86_64_defconfig/details/
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2eIseG3mebbz7v0HESNW2YOTmiu/

--
Linaro LKFT
https://lkft.linaro.org

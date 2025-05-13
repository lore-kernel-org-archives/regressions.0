Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E24A1DED6D
	for <regressions@lists.linux.dev>; Tue, 13 May 2025 13:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747142790; cv=none; b=DYVtCPDawO4hYo9no6svWNZCLb+P7wYJRdyOSOaP8w8LaHrsni7Sb/dRnSmKhn54f9REz5C/we/qwgfD4A26rdMYor7KDwAheFNit98SZWa8SCXFI5U71HZIK51hJ+7O94IqxBYHXRWsg8Yk2pfCXFgOKveT1bR55zCK6WaS0Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747142790; c=relaxed/simple;
	bh=DlRA5C7gjOm56yHzbiMmIPmAtDQ26goKgMcNcb34uXk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=bOCqZblS2pDSKnPDSoxjuG7kBsBQegc4HHaAQ4Y3tEoo9DsziKYNm8/MIYDxjjWbOxGzbo9jzCeqcLlz/IqmsvhW9xgy2FQ49OCFkUeqfpviG0TM7XqOBcf3VwiwHtAgq4iU06knm+wqrYaOeOWyzXZ2sL5SU+DYg63Z8Xsuu7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi; spf=pass smtp.mailfrom=profusion.mobi; dkim=pass (2048-bit key) header.d=profusion.mobi header.i=@profusion.mobi header.b=SdXFZnlr; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=profusion.mobi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=profusion.mobi header.i=@profusion.mobi header.b="SdXFZnlr"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-326c9bbf029so3377111fa.1
        for <regressions@lists.linux.dev>; Tue, 13 May 2025 06:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=profusion.mobi; s=google; t=1747142785; x=1747747585; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=roE8koJy2Zbfm1te10JDWRu81vDFSZexIZbV95ucPSc=;
        b=SdXFZnlrsue9yT4mHusVHeaZeg/R5PGh9GWP3QnIggzW0BmRf3D+8hxOAwQuaCmSug
         xZ6mfG12uHsG2tho4JwDTLqjdB0hN7PpjjO9Siyz2Mebuc6kZjKfqTlZkwPFKyumkeqO
         aSYlVwwDBkXVWuDGhmnGWz9LCkASJ0txcwurx4tvnvnT/TGTIY3erJ6uoZaVHqcF7aSx
         CZlq373EEM42xJZlTcQzmtjQ/64ESuIQxvNI0Sh0UOaeqx4ge7s1/W58bekkhlr9RuIY
         9Q7USoOU1tgdNmwWL96Z9Zjmr8zIsigZrDJHhKg1MfMqn60GPXTwhMQNXyqvCpM8uUMP
         7zXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747142785; x=1747747585;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=roE8koJy2Zbfm1te10JDWRu81vDFSZexIZbV95ucPSc=;
        b=Yt0KVPuIoB3XBWfJyW/IEFfweAniMs8oJ+EX1AY7EXTM1MOX6CvFbDLfwmCBoJ4hJr
         IDfu63xW8C3T23Pn89t2zRKdOQP9R2Fl0NhbiPKHJpmf0WdRT9lgfUDj5ysLacvtPd9q
         EvSEX0fTRO4TnZVN6sSwwKNRul8bUHBUqruyQMwDfqYompsHKW6qH/Ydq7qnM1u00AcV
         9sJUyzSrzKsbEjDXr+22hDFX6HeYkVsmftQIFn6UCadopB/13UyliHuv0PvQT8EhMo9U
         3Rz6jZSBeIgZ+xk/sjlDKtjlxTlVv9b3dg2jklhY6Kz59UQ3GgLbei49qRJNsAoFT1L4
         U9OA==
X-Gm-Message-State: AOJu0YwBV4icCpT7qASVKqTGdUB/GyFEzyzdvq+zw+wYwRDB/7aqcXpS
	2IT1SCXN/8OG1tn/BUxyzvWH6bIF3wezhKBi60usdta3yy/ow+KoKBkQ3fbYe6xlWopHzZjd9ZI
	DLnDOinoHg4bDVObM7vDFJ5RmiGsPHspAbyV7e3nuiCi4RuKf
X-Gm-Gg: ASbGncvMpM3MOdgEcCocs87Z9xA0b8N3OJfJSpmWHAcTl3jSoPbX5BFiemsWWxoIfE2
	y9euRxJOFGvKppjq82Qcw/d49XmliwZQYpBmtscySCsppBp6Vf7QhLT7tDsla+w3wHxiEEcAwKX
	YJfOhdIvRccOkh95+J3+0A+bRef8oMb0BYP/4=
X-Google-Smtp-Source: AGHT+IEf5RMiCkeG03jX1fAC+e9NXVnCtrvoNen8O+gEtmVu3TduaYAxNB5vZxGx9rsuo5UZnu9ES03fgXNVnPfGBS0=
X-Received: by 2002:a05:651c:543:b0:31f:8659:dc16 with SMTP id
 38308e7fff4ca-326c469228emr19926661fa.12.1747142785215; Tue, 13 May 2025
 06:26:25 -0700 (PDT)
Received: from 778980076690 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 13 May 2025 13:26:23 +0000
Received: from 778980076690 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 13 May 2025 13:26:23 +0000
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: marcelo.santos@profusion.mobi
Reply-To: kernelci@lists.linux.dev
Date: Tue, 13 May 2025 13:26:23 +0000
X-Gm-Features: AX0GCFvd0cfJXAKn2hTK2apMKRsFyaH4pojw3Lte7o1kBvrii-Hpq8AzHjs_4i4
Message-ID: <CAMVAkEvhR+Z28zhxBvnQ64VmXYuP0ZvFg_14e2VuFPQDEpSa+g@mail.gmail.com>
Subject: [REGRESSION] next/master: (build) implicit truncation from 'int' to
 bit-field changes value from -1 ...
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, marcelo.santos@profusion.mobi
Content-Type: text/plain; charset="UTF-8"

Hello,

New build issue found on next/master:

---
 implicit truncation from 'int' to bit-field changes value from -1 to
15 [-Werror,-Wbitfield-constant-conversion] in
drivers/net/wireless/intel/iwlwifi/pcie/drv.o
(drivers/net/wireless/intel/iwlwifi/pcie/drv.c)
[logspec:kbuild,kbuild.compiler.error]
---

- dashboard: https://d.kernelci.org/i/maestro:ecc72e92f69bce29c117a8d1dd72c86119058492
- giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
- commit HEAD:  aa94665adc28f3fdc3de2979ac1e98bae961d6ca


Log excerpt:
=====================================================
drivers/net/wireless/intel/iwlwifi/pcie/drv.c:669:24: error: implicit
truncation from 'int' to bit-field changes value from -1 to 15
[-Werror,-Wbitfield-constant-conversion]
  668 |         IWL_DEV_INFO(iwl6005_n_cfg, iwl6005_2agn_sff_name,
      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  669 |                      DEVICE(0x0082), SUBDEV_MASKED(0xC000, 0xF000)),
      |                      ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/net/wireless/intel/iwlwifi/pcie/drv.c:576:21: note: expanded
from macro 'SUBDEV_MASKED'
  576 |                         .subdevice_m_h = _HIGHEST_BIT(m)
      |                                          ^
drivers/net/wireless/intel/iwlwifi/pcie/drv.c:569:25: note: expanded
from macro '_HIGHEST_BIT'
  569 | #define _HIGHEST_BIT(n) (__builtin_ffs((n) + 1) - 2)
      |                         ^
drivers/net/wireless/intel/iwlwifi/pcie/drv.c:564:29: note: expanded
from macro 'IWL_DEV_INFO'
  564 |         _IWL_DEV_INFO(_cfg, _name, __VA_ARGS__)
      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
drivers/net/wireless/intel/iwlwifi/pcie/drv.c:561:2: note: expanded
from macro '_IWL_DEV_INFO'
  561 |         __VA_ARGS__                             \
      |         ^~~~~~~~~~~
1 error generated.

=====================================================


# Builds where the incident occurred:

## x86_64_defconfig+kselftest+x86-board on (x86_64):
- compiler: clang-17
- dashboard: https://d.kernelci.org/build/maestro:68233591fef071f536b61289


#kernelci issue maestro:ecc72e92f69bce29c117a8d1dd72c86119058492

Reported-by: kernelci.org bot <bot@kernelci.org>

--
This is an experimental report format. Please send feedback in!
Talk to us at kernelci@lists.linux.dev

Made with love by the KernelCI team - https://kernelci.org

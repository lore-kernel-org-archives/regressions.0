Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A75228DF0E
	for <regressions@lists.linux.dev>; Tue, 13 May 2025 12:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747141150; cv=none; b=UnbkoGK/fuKupni8D5TJ0Y096jzCwBWRc+wdV4JeGRvhCvqSxxVT+CqVrn3TlPMwYM7rcIaOYF2A+bGvXqCaGyQvUSdULezLcL2AY7jGDgF5md9nny1ExbhT/mYisZeC/PtyyM2pDtGmnqhBgbydxWnv73yvIj+k/HZsdADb7PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747141150; c=relaxed/simple;
	bh=DlRA5C7gjOm56yHzbiMmIPmAtDQ26goKgMcNcb34uXk=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Cc:Content-Type; b=akMBqiIivoU3nVe9NWMJA7UJgYD6Dp3AQnD/J0OMfOnvhaJ7pr0tb/n1WgGNkfVvO8xnf7ikz/N1DP3l5Fy59K5OTrla1S12AL7qc9fZxZErzJrxnnastawopmiZSA4u+YG7Wl3qUVWc34jVzZO9Y7hAq2sDN104AZ1Z326rqUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org; spf=none smtp.mailfrom=kernelci.org; dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b=KBhtxgos; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernelci.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kernelci.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernelci-org.20230601.gappssmtp.com header.i=@kernelci-org.20230601.gappssmtp.com header.b="KBhtxgos"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-708ac7dfc19so48933557b3.3
        for <regressions@lists.linux.dev>; Tue, 13 May 2025 05:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernelci-org.20230601.gappssmtp.com; s=20230601; t=1747141146; x=1747745946; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=roE8koJy2Zbfm1te10JDWRu81vDFSZexIZbV95ucPSc=;
        b=KBhtxgosuxiUU4B4IyqwtKmIuwd2G2NA7hIrKIXOnwk9LMXZq5iCmuzfhwvwM6mOXC
         RzJ5le1AOWPBjkcWaEdo1+OhcMsLwLxmvXFeJ5CwCOubNRD+db4dJ28MIufR1kbv9Ta6
         Sor6a3uhf5EBmyapZtkOBAiriyWgJNpJNt3OlzwaNiOk1ZKBlLZeL83dsWki0wYiC5Qs
         5/PwEGGB3lEdL8NwYRJNCfDbsAfvpxS5qaMyv/gHvZAY0afprGU7AM2Zj6xkGMxRCR5G
         +NzTftP8sbFLuhc5OepMu4cQcjI7gQ4fc2K2OEWYWkhU0Qb4/oDLDZES8e7uwblpP/NB
         qKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747141146; x=1747745946;
        h=cc:to:subject:message-id:date:reply-to:from:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=roE8koJy2Zbfm1te10JDWRu81vDFSZexIZbV95ucPSc=;
        b=L2nBo1vPcu7CeYMLGBv5ZpqMp6eEukZeszNbSb1u08sr3VpYCvbBYQ39z8qEu6cmIZ
         L0RBENA9+SVmDgqTL1kz4zOG83h/IIBxw9rfzJqSQJLFuK8IagIbur0B5lFbw/SZTCke
         94hDv6+SHYc1z/siaLcZJov1udzwuBOw31V4iCgHrg31mm8PQ6Q+WTsoqXyKDunywqC7
         yLirJL79qKFOsfanJzSKCl8XGl7dke/K9PKLWUJABa/KfnNzFMB5tI96dQjjfPHzXBYH
         IjTwxSH1KA/ypt3gaXsxZdhJJmm4t6+Z7k9wroEnbM4ELahLZc/PszuDvUY0tSw0aGXU
         YJSA==
X-Gm-Message-State: AOJu0YyAfGYo540d8ly5w90dpt5AAeL2H/gZDyyqGZ+xE758VX5LOW6W
	vqT9S3fqtM9b71igOL7MGLmUmNj2WUNaaOrAErq4ZgoeZEpPknBI1FUFaZixApqCRiXxhkRht+p
	DKPgINH1bdqKvJqc1TiU4IWWz7SRDdBSCDZrf7g==
X-Gm-Gg: ASbGncsyW/YXJlQW4DPLg41n7Z2GLuJsugAiO5R1yevxg28ZIQ//xKkjZiL8ZI/9hvm
	gF2kVNXnDfDJBbt68qKjjGR4S+fG30zeXjqcsJiOhprMKBZIIfWUDlK1yVlKu359TYIggjldp8+
	hnrphxqJTPk5AQOPEFmP3iuEnDs76/LzRbIIrDVdVGxQ==
X-Google-Smtp-Source: AGHT+IEQXRq1LMK5InzjweUb9pbaMp6znQ3r3ji0PnbZJbFowKhM3nxyPetxcu/d/hlsStwl4eDsrc4XOOw1PBTqwBs=
X-Received: by 2002:a05:6902:15c1:b0:e7a:b37b:725e with SMTP id
 3f1490d57ef6-e7ab37b76f6mr12917994276.24.1747141146495; Tue, 13 May 2025
 05:59:06 -0700 (PDT)
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 13 May 2025 05:59:05 -0700
Received: from 415818378487 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 13 May 2025 05:59:05 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
from: KernelCI bot <bot@kernelci.org>
Reply-To: kernelci@lists.linux.dev
Date: Tue, 13 May 2025 05:59:05 -0700
X-Gm-Features: AX0GCFvyxc0vbZgvTMdq2-oJTi_onEMQw1FlZBe9vA05kerB6vu-a44Ck6LoOYQ
Message-ID: <CACo-S-0GVFPOW60XRF89kE-hgoLLJku5BiiqLPt3yXztYMpwxw@mail.gmail.com>
Subject: [REGRESSION] next/master: (build) implicit truncation from 'int' to
 bit-field changes value from -1 ...
To: kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com
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

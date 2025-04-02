Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC811FC08
	for <regressions@lists.linux.dev>; Wed,  2 Apr 2025 08:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743584107; cv=none; b=GtSTDmZzuh0yn9Q7z7mZeKhLivpDRVqVn57R9Ubd0tdhW4g/Z+r2zsGRVmIaOoZ14x5ExUr+1PE74VWaKfTDuPZguRRcVSdIDxDMdO+tNlLPrZciL1Glyk4oL4T6Tg4yoHnwaEJiKiOkMvMmHqPHUk6k6XhNCyuROY5xLtQzbfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743584107; c=relaxed/simple;
	bh=ncAJeBOeuZgyrT06rISriwnLImcatJr0GbyJS11FwwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pbXpvq0Fr3j1mI2JwTBRmOImEvNljHc6pX1F0vBSwCLrVpIPwTmBMja5iK8QaqDbfJYzqzeAUojDqHEO//qoZ9pfHHRUg0X/LjGE7hO/QcfS9lZiCy65dkqwZLuoNjhefLc0011OKtzMnsztJL7B55MUVeCJpC/+sW5Wrn3KP4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X1fuuDLq; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X1fuuDLq"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-524125f6cadso6205031e0c.2
        for <regressions@lists.linux.dev>; Wed, 02 Apr 2025 01:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743584104; x=1744188904; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KkfXltEk1Iw8yonvOKbajZ01xoVadwQJF27RtKU8KBs=;
        b=X1fuuDLqFbKRIaV4VfCa95f4AJH/zRgLEhySkM8J6vSYKT9I7er5kFjVDVj/I9mdmo
         MyBAyhK5NebXYvAUMWgwNbiOZS3Amf4shdDD8zGAH8T+1n1wGiARg04zKx6KrHt6hMpL
         bnF2EHsK4VB9/y0ovINdnuQSXgmIB3xFfXilJ/nmPinxKTAVyWCMjf05UsxxO8qd3d/L
         n8N6YUt6a+Fe7losksiJsSGM68DPt36+g/JegrRqw2NMUU39Fii7qohqBmZbDP6Z3Hw4
         c9mRD2blF/sNFEhSEz3lUQGI0G12NX1TxYjMDWSh31fcj1RXYwouFQxqijJ8Iem9NbSi
         g+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743584104; x=1744188904;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KkfXltEk1Iw8yonvOKbajZ01xoVadwQJF27RtKU8KBs=;
        b=KJq65150F2Qa85YvZBdQBmzgIQgbdRb/n1ecJIJAs1HeRZqiR3nraDOekNqlW5mUy8
         27Gv0YtkXf1ppY/WozR0IlAObyhMhxdfLcY359HF7GcmedW0z4lavV6LUbPgaRKoVLUi
         9SENgJqkkL9JwEBJdE6KzMsgyDh0O9IMpyDoMmIALgMhHgabocyhLmhL9EZ0WKs58nkT
         5o12sCeGRWCSNyrnGhbR5P/4crOcXES7wdjOPurH1SuFQ1ucnYq/YWL4750uZaYGI6ZP
         WN7EP5MDrMiczMjjgmB2YadC8CHyKdq1GizNC9X1ajW7uZJA9WfT0blj6yg/6gOCYhzu
         YtJA==
X-Forwarded-Encrypted: i=1; AJvYcCW5xhNo5TejbNhmjQgZzgj7NR67rQJnDJLS5mm9vsDlocPPkdMDTSYcU+u3GtSPmnumbWAZ0TiMM+XEZA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxIC+70Ql51a4YwHDMvJJ0FXaq8V/g1H5zlOXMn+LFmg8Np9pRP
	2BIuDzZr35slMqBbBskebhwnZGuQs6j/JnSU6ql5hdmu56nOWaW110Z9gCL/66u7FTr6jSxUiiV
	CsU6IcY5GfqBPhdE3Luad6yEZN+/IQFEY5U0wIw==
X-Gm-Gg: ASbGncurT194gKwTC/NXWLNOrqEMTJHilanDm0+fK/bDknJvGFbF+qPdMalEX41uHAQ
	+vHzaUm4e+WKaNLE1ei71Na1iPEuKPlsn4WuieAfAtiZOHdzL1Sfx5kYOw7HOTjxhrjIYDKhkKo
	X3Jd/sEdhad9RiOWWZZdq0aZMPPn6nYf+HRAhfGL9nWN9A1EnWQHwdfuYjdt0=
X-Google-Smtp-Source: AGHT+IEievB+pp1aNxi9woKq2lfHUjZwC1Q1KFIgh0dT/EWXbvXwXWvmBfX/gMYpQN/riDxOkHL1mr2rJfv84pPBaGk=
X-Received: by 2002:a05:6102:c47:b0:4bb:eb4a:f9f0 with SMTP id
 ada2fe7eead31-4c6d3a16ccbmr11902354137.24.1743584104537; Wed, 02 Apr 2025
 01:55:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYtdXHVuirs3v6at3UoKNH5keuq0tpcvpz0tJFT4toLG4g@mail.gmail.com>
In-Reply-To: <CA+G9fYtdXHVuirs3v6at3UoKNH5keuq0tpcvpz0tJFT4toLG4g@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 2 Apr 2025 14:24:53 +0530
X-Gm-Features: AQ5f1Jrtv4W-Ik8Dy7MY8QPUm434a5sVsFhaoy_XcVSO_jLH2XT5qCr7_O_JHjg
Message-ID: <CA+G9fYuHhz2YCafabKK+QMJiDuM65OcxpaW9TN-=u56r_kyGSA@mail.gmail.com>
Subject: Re: qemu-i386 boot failed on mainline master - no console output
To: open list <linux-kernel@vger.kernel.org>, X86 ML <x86@kernel.org>, 
	linux-mm <linux-mm@kvack.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Vinod Koul <vkoul@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"

+ Linus
+ Greg KH

On Wed, 2 Apr 2025 at 14:14, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> Regressions on qemu-i386 devices boot tests failed with defconfig on
> the mainline master no console output.
>

The qemu-i386 boot failed with no console output and is still happening on
the latest mainline master branch.

> First seen on the char-misc-6.15-rc1 merge 25601e85441d ("Merge tag
> 'char-misc-6.15-rc1' of...)
>  Good: [08733088b566b58283f0f12fb73f5db6a9a9de30] Merge tag
> 'rust-fixes-6.15-merge'
>  Bad:  [91e5bfe317d8f8471fbaa3e70cf66cae1314a516] Merge tag 'dmaengine-6.15-rc1'
>
> * qemu-i386
>  - boot
>
> Regression Analysis:
>  - New regression? Yes
>  - Reproducibility? Yes
>
> Test regression: qemu-i386 boot failed on mainline master
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> Anders bisected this to,
>   # first bad commit:
>     [eb0ece16027f8223d5dc9aaf90124f70577bd22a]
>     Merge tag 'mm-stable-2025-03-30-16-52' of
> git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>
> ## Test log
> <No console output.>
>
> ## Source
> * Kernel version: 6.14.0
> * Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> * Git sha: 91e5bfe317d8f8471fbaa3e70cf66cae1314a516
> * Git describe: v6.14-12245-g91e5bfe317d8
>
> ## Test
> * Test log: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/anders/tests/2vAGjk1bqJ8kqDGEyo2jXerYOcR/logs?format=txt
> * Build link: https://storage.tuxsuite.com/public/linaro/anders/builds/2vAGjX8EjBsjTTOgIxZswnitDbF/
> * Kernel config:
> https://storage.tuxsuite.com/public/linaro/anders/builds/2vAGjX8EjBsjTTOgIxZswnitDbF/config
>
> --
> Linaro LKFT
> https://lkft.linaro.org

Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B0A20A5F0
	for <regressions@lists.linux.dev>; Tue, 12 Nov 2024 09:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731404823; cv=none; b=mT/xUJTJd7BvYXvpAsEdvib67i83kt/GPvv83ZQW4Log+XMBC6xteJ5wsqGU9i8CckGuqi/6pkYiJ13tEFTYVBnF/pao99LcmBdEVEOEqg3oLviW9k4engtPNe3Pv3J3qZdGVjQYjUn+RqiCQggmKaPpZRQeV1NEzmB60Ov8XqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731404823; c=relaxed/simple;
	bh=XYiQLfyZ4xkJqt5907YaTI5zra5ibcQREQSBOSTNAn8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ngGqK31ESydHzLFi+/J0WABRqnFO6nP7e+HS1mpG2QzYlcHCF1NSFAuJrEPQ50KdDAxZ5ydpUGK6I9YNF5WeDkj1cxP3Ros/mKzpUkoaCkExVXCjc/EaQvuz6nAimZhIK6KzszmB8vyxoVkCM61HSGJlADcIzjAKP7HEudhlZEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DCAfhB7O; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DCAfhB7O"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb59652cb9so44235241fa.3
        for <regressions@lists.linux.dev>; Tue, 12 Nov 2024 01:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731404819; x=1732009619; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cxrUQLUGDquIvwNL+3vOZkd1Knzam6KbtGh2rdlC0zA=;
        b=DCAfhB7O1a2YdiMvzxZE+Ey5s2t4kD+mZcCAghacCFVlHXr19HLOISww2g+danScgh
         Q452zC1fWsxoQnDvY+tQ6++5T6V4s1UUQj8os52Xd3r/L1zCFC+Bwh16bU8FfOGRm7AE
         oCb5gz4QkrLJHrxOtp/8ow6uQt8EWEmeLhnHz2pyFf1AJtCpxFOZFM3Hlak3VRfmJi4h
         fKVGWdmKn8CXTKiCSBs7XkGzpTz9o4j4gkjI//tgiBvQt7McY/tMSm91LosKMd05vTp4
         VeaGC9lgFG7TKxsY05qK5lUCKqB7HZEKqeO8tsV2Eows55BnxPM6DXUln56LrM/OoN40
         izNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731404819; x=1732009619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cxrUQLUGDquIvwNL+3vOZkd1Knzam6KbtGh2rdlC0zA=;
        b=hgFXsXvX0+NByOyh/nLyjjVdPG1+OdG0xmcPFIqv3KynNUhDZtrlcmglhV/nc387ao
         3s0vQNegX+hPbOipl8eSwdseTbVldEplHGtS9QxheFoNBqaUgkoTtUFvXEd3T2PrB+yz
         JFiAtZXVtIcsr7o4IhMOU9jO/CsviUA1g05jgQoF3BqwgwfeDq+N1Y556H6HCP2Kp8mX
         d8o2TIHfnXkW6wx6dVN2E1BhfM+LTxcfXJFYSF7tSOpIfjRki/9mnyoqEkySi6/Ch5WF
         WPG1B4hCJUFiCppqLVPSRZHFZ7W+Hv3JhJ7kmKQCRWN7EnKAVB4lZuL7RBr1EVKFMQmG
         MZEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUfVyqU7Efnd4SKu9WxQz8j7DhSdFEmWuAc10u/LEkJ4Ax8kGz7rh9a+7dd4Sf99FtAnxg4dXuvgcuTg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwW07Ethj4viWPZvCUv0slQs2QCL7Tb4DYg1X9ynWA7pmAyD6O8
	z7ouuDJJeUt1a8vL1iyGrFelKexAcfakWrIHjovWuUUvIdf8b8xP
X-Google-Smtp-Source: AGHT+IE3pBqKFb6Yk8oEomko/aK/XSjtZ84xqvYa+rvcJru0YumfUY5+WY9OLJopre3IfMt0ghRnSQ==
X-Received: by 2002:a05:651c:248:b0:2fb:57b7:5cd with SMTP id 38308e7fff4ca-2ff201e6cc1mr71712251fa.7.1731404819101;
        Tue, 12 Nov 2024 01:46:59 -0800 (PST)
Received: from foxbook (bff246.neoplus.adsl.tpnet.pl. [83.28.43.246])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff179d85e3sm19798631fa.116.2024.11.12.01.46.58
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 12 Nov 2024 01:46:58 -0800 (PST)
Date: Tue, 12 Nov 2024 10:46:55 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Linus Walleij" <linus.walleij@linaro.org>,
 linux-arm-kernel@lists.infradead.org, "Catalin Marinas"
 <catalin.marinas@arm.com>, "Linux kernel regressions list"
 <regressions@lists.linux.dev>, "Kees Cook" <kees@kernel.org>
Subject: Re: cacheflush completely broken, suspecting PAN+LPAE
Message-ID: <20241112104655.777b0578@foxbook>
In-Reply-To: <014edf04-a5ac-4a02-af76-ca2616c3c4ab@app.fastmail.com>
References: <20241111233817.2f824c19@foxbook>
	<CACRpkdYsgnBFsyF9upr=xoLdMJ25DCXMEJ-co7rJTnRanJncug@mail.gmail.com>
	<014edf04-a5ac-4a02-af76-ca2616c3c4ab@app.fastmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

On Tue, 12 Nov 2024 07:41:12 +0100, Arnd Bergmann wrote:
> I would guess that the problem is not the access_ok() but
> the actual access in v7_coherent_user_range() that does
> not appear to call uaccess_save_and_enable() or its assembler
> equivalent around the lines
> 
>       USER(  mcr     p15, 0, r12, c7, c11, 1 )
> ...
>       USER(  mcr     p15, 0, r12, c7, c5, 1  )
>

Yes, this is what fails and where I got stuck tracing this code because
I'm not exactly an ARM MMU wizard.

What I could tell is that this code hasn't changed much since the 3.10
vendor kernel which works fine with LPAE on the same CPU and userspace,
so I started looking for recent changes in arch/arm and found PAN.

According to comments, this routine is meant to return an error when it
catches a pagefault, so that's what I suppose happens here and that's
why PAN immediately caught my attention.

Disabling PAN fixes cacheflush for me.

> It's unclear to me if this problem is specific to the TTBR0
> PAN variant, or if it can also happen on any variant of the
> CPU_SW_DOMAIN_PAN. It seems unlikely that CPU_SW_DOMAIN_PAN
> has been broken for this long without anyone noticing, but
> I also don't see why it doesn't trap in the cache flush
> when the TTBR0 version does.

I don't know, but I booted the first kernel image I made for this
machine, which lacks LPAE and a few other things and barely works,
but it runs gdb without issues (and cacheflush returns 0).

--- config.good 2024-11-11 20:22:16.604586266 +0100
+++ config.bad  2024-11-11 20:22:10.641511948 +0100
+CONFIG_ARCH_DMA_ADDR_T_64BIT=y
+CONFIG_ARCH_HAS_PTE_SPECIAL=y
+CONFIG_ARCH_SUPPORTS_HUGETLBFS=y
+CONFIG_ARM_LPAE=y
+CONFIG_CFG80211_WEXT=y
-CONFIG_CPU_SW_DOMAIN_PAN=y
+CONFIG_CPU_TTBR0_PAN=y
+CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
+CONFIG_HAVE_GUP_FAST=y
+CONFIG_MMU_GATHER_RCU_TABLE_FREE=y
+CONFIG_MMU_GATHER_TABLE_FREE=y
-CONFIG_PGTABLE_LEVELS=2
+CONFIG_PGTABLE_LEVELS=3
+CONFIG_PHYS_ADDR_T_64BIT=y
+CONFIG_SWIOTLB=y
+CONFIG_WEXT_CORE=y
+CONFIG_WEXT_PROC=y
+CONFIG_ZONE_DMA=y

Regards,
Michal

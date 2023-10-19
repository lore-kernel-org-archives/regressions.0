Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71774D262
	for <regressions@lists.linux.dev>; Thu, 19 Oct 2023 07:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="NbjujWKa"
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 61DFA3F68F
	for <regressions@lists.linux.dev>; Thu, 19 Oct 2023 07:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1697700069;
	bh=x91R+lC/YKZONC3H6UuQ7fgHRxPTzGFAHyvdz6tJ5Ok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=NbjujWKamNxRpk++bgNvdmxAzRf1qrraIXMy/AY2AftCYRqkhI/mVOjBOMPCHxvYQ
	 JYFYZTVfREqx/GvdDCH/EvjsXXbwrF5oo1lXa5/LDNPVHd+Kba+rAU8eIVfYw3CaGd
	 tleEQDpv1naBH+alzZ6bcknhqM/GTlxRpTqs2qrK80TBLKLI/hN/RW3gfiQJOf9mfs
	 uDvhZqytnVkvimXh+241NkY7Gk2ctFdc6mVDxgj86vg1rz4fXwr7QcQgcpWEMoSvC5
	 yQLPK9kXFhYBL082Ik1uzdk6J3sO0YZFWuWEkMp2o4TzMtxgy5fd/k5R8gaM851VPL
	 /Iejod2zSyQIA==
Received: by mail-lj1-f199.google.com with SMTP id 38308e7fff4ca-2c51a7df557so45977091fa.0
        for <regressions@lists.linux.dev>; Thu, 19 Oct 2023 00:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697700069; x=1698304869;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x91R+lC/YKZONC3H6UuQ7fgHRxPTzGFAHyvdz6tJ5Ok=;
        b=eU4Tw5EI+aJQ8khR/KwqzdsVnym9mOF2pLpFb7jLSnPDo86NYYcxy0lvzy7wQ31D+w
         jU88EaZdRczL7OVuAM4FETocQGOjjF2iKdQYkBatPSlpok9luCaZ3gjV4p0epX2JuyVS
         5TjvpTDad/LpzZcsWw35hn0+/AL+rB5gJK3BcClSBAjLjnGasecb4wZp9ChsCDdUhDHs
         4VC+wixPKQuoi05OKFkk3XEUXnWGUGA4o7eBHSELbo5Y9VZ2Se7AK7XNpWt6QfvG8l81
         BM6hcTTH4rpG96SEH12TuLI80fNP4265WVZsmKWl0hcsgpXkzEpTx8iyClFy9cQWoEB4
         TTpQ==
X-Gm-Message-State: AOJu0YyzKgszY/NnWfHUb75/ScP3ETKXIJHKV681BnHe/zDKZ988Xk3A
	HrgIsbTyq8ErCrCpAtfk35+fgHTOvLNThW7vlKWwLYPmzJO6tpelFm/3sqFUYTY+1ZWjfx8ZucA
	KMZ09Hs42dFNd6UJMB2d0F1SqifbOOjN0/Hv4vMwP
X-Received: by 2002:a05:651c:1507:b0:2bc:f252:6cc4 with SMTP id e7-20020a05651c150700b002bcf2526cc4mr1042795ljf.10.1697700068812;
        Thu, 19 Oct 2023 00:21:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGrEU16y5JLCrQA1zLjr1UsCW+KYgjOi+xUvCvHEVOlrHclgBiPupWNCqAkJ1xwc+J1xs6X/A==
X-Received: by 2002:a05:651c:1507:b0:2bc:f252:6cc4 with SMTP id e7-20020a05651c150700b002bcf2526cc4mr1042779ljf.10.1697700068371;
        Thu, 19 Oct 2023 00:21:08 -0700 (PDT)
Received: from [192.168.123.94] (ip-178-202-040-247.um47.pools.vodafone-ip.de. [178.202.40.247])
        by smtp.gmail.com with ESMTPSA id m13-20020a7bca4d000000b00402ff8d6086sm3610975wml.18.2023.10.19.00.21.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Oct 2023 00:21:07 -0700 (PDT)
Message-ID: <57062702-f858-46d3-bccc-f0f96891128b@canonical.com>
Date: Thu, 19 Oct 2023 09:21:13 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] boot fails for EFI boot stub loaded by u-boot
To: Ben Schneider <ben@bens.haus>
Cc: Regressions <regressions@lists.linux.dev>,
 Linux Efi <linux-efi@vger.kernel.org>, Stable <stable@vger.kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>
References: <Nh-DzlX--3-9@bens.haus>
 <CAMj1kXFKe6piagNLdSUhxUhwLB+RfNHqjNWt8-r2CNS-rBdJKA@mail.gmail.com>
 <817366c2-33e0-4908-90ec-57c63e3eb471@canonical.com>
 <CAC_iWjJB3OTWiYX5YsJmNcPQw+rHSm955c1Z5pUajedWGM5QgA@mail.gmail.com>
 <Nh30qsF--3-9@bens.haus>
Content-Language: en-US, de-DE
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <Nh30qsF--3-9@bens.haus>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/19/23 03:51, Ben Schneider wrote:
>> How old is the u-boot build on this platform?
> 
> U-Boot 2018.03-devel-18.12.3-g926d08c7ce (Apr 11 2022 - 15:48:13 +0800)
> 
> This appears to be the most recent version the manufacturer has released for this device. Source: https://github.com/globalscaletechnologies/u-boot-marvell.
> 
>>> arch/arm64/boot/marvell/armada-3720-espressobin-ultra.dts
>> This is a uboot path, right? Not a linux path? Are you sure this DTS is compatible with the v6.5 kernel?
> 
> Sorry for the confusion; that is the path in the linux source to the DTS used to compile the DTB that I am using to boot the device. I booted v5.15.135 using the DTB compiled from v6.5.7 source and that works fine. I also tried to boot v6.5.7 with the factory DTB and that failed.

To which kernel and device-tree are the messages below related?

> 
>> Please add message inside the update_fdt() routine...
> 
> I added a bunch and here's what I got back:
> 
> EFI stub: Booting Linux Kernel...
> EFI stub: ERROR: FIRMWARE BUG: efi_loaded_image_t::image_base has bogus value
> EFI stub: ERROR: FIRMWARE BUG: kernel image not aligned on 64k boundary
> EFI stub: ERROR: Failed to install memreserve config table!
> EFI stub: Using DTB from configuration table
> EFI stub: Exiting boot services...
> EFI stub: Starting update_fdt()...
> EFI stub: fdt_num_mem_rsv() returned 1
> EFI stub: fdt_subnode_offset() returned 8944
> EFI stub: Setting bootargs=console=ttyMV0,115200 earlycon=ar3700_uart,0xd0012000 root=/dev/sda1 rw rootwait
> EFI stub: Adding FDT entries...
> EFI stub: fdt_setprop_var() for linux,uefi-system-table returned 0
> EFI stub: fdt_setprop_var() for linux,uefi-mmap-start returned -11

11 = FDT_ERR_BADSTRUCTURE
This is probably set in scripts/dtc/libfdt/fdt_ro.c.
Something in the structure of your device-tree is invalid.

Please, check the load addresses in U-Boot. Is something overwriting the 
tail of the device-tree?

Compiling upstream U-Boot's qemu_arm64_defconfig yields 
lib/efi_loader/dtbdump.efi. If you run this instead of the kernel, you 
can write the device-tree as it is passed in a configuration table to 
the ESP.

Best regards

Heinrich

> EFI stub: update_fdt() failed with status -11
> EFI stub: ERROR: Unable to construct new device tree.
> EFI stub: ERROR: Failed to update FDT and exit boot services
> 
> That's as far as I could get today but hopefully that starts to narrow it down. Appreciate the help!
> 
> Sincerely,
> 
> Ben


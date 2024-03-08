Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741C854792
	for <regressions@lists.linux.dev>; Fri,  8 Mar 2024 14:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709907879; cv=none; b=UU7StwlZK32+qWAGwyovofjiOnSEvVGYjbigow3O1ID2Tv2QpMW4wnL6KQhi4tkNwGj7CBZUVSa7RJSZjvmLa3t04OaNBhybjMgkTdptYEM8FV3Ribrg5VNA4bayj1/c7J1RnGfZJ06ub4ZgdNRcaLT32y4mVf2iTePtp3VLY1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709907879; c=relaxed/simple;
	bh=v9cRkdI5jAK3eu+qT4iedc4Fdgx1f6W2zIzGsH1nv6Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jZCLYc3LsPHGGxQGU8uH3SKBDWi2HGkGiYOWhQ2RrLthEVIJKC4lvnOnkoYyk+nkMyJqjq45kIz3G2i2wUFVcHRicaO8xUai5RVBEUuKoAkADWuv0g2HCU5ygcaNAaVLjL9qV5phOOHusn6b6ro+1ov4lW0SlC66Y7HGCngepcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y6x9LYUT; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y6x9LYUT"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-4d341065550so277717e0c.0
        for <regressions@lists.linux.dev>; Fri, 08 Mar 2024 06:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709907876; x=1710512676; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j07AdFyDsNhDCYkdkkGVmfRz5UiC0GfBE3W6LoymUMY=;
        b=Y6x9LYUTJI4sJXNj6PaVH3CK2ACmV9mOR0i6LxnJatL70StF+hY0/+na9wh8FGGejE
         8f+BZViaEckgENsazk9zv5wT5TeWuRDz3hixmgd52lkzpiGdJmPqDv5R52slONAkK4AU
         SeORx3dZiwRQDx+GhqzmdeVdq6o5vlB1T2+prZ+MR3hrfowLo2fCuRFE2PXMSauqLJTV
         6NIj6jiVHbp0+H7NAIhCAFq3a6dhs8umc37+gGoAhWzsyjLjSt6DP9j5hn437bW/F/V2
         CMeu0nHuWWLjWchqY5hxCXzTjj5vzVJD9I2Hu6khfLs/PqdRf6KpFVb8u/5QzC4PQO5s
         miNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709907876; x=1710512676;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j07AdFyDsNhDCYkdkkGVmfRz5UiC0GfBE3W6LoymUMY=;
        b=YcpwbgU3AJGMSvHpPmX2/oReplAeFU7zhu373EFS9MIvq0fhHBF/PFvi7q5XlZCluP
         9N0DGnQBLrazBWQvCakBCJ71OwzxI9+oiA9so0GQ32T6JFKiCUmkvO/9nWv39Y3vFnnP
         Xy5x8WdtBZvWopd2nTJ8fx2DqtXq2yNNPwjatvV2oE7TcS/P23rpnWAGCWnB5jdmDGen
         NoGh3gKECjZ/NvVzI8tB2K3czCpEFTbuz82RhHWtVfu/BIWon/bepPqFKDo002e6Ly2A
         N4j+jr4ZeOQvFmHWYjd9uphJqbVR8r81v+f4FoOZvRHbPMaEpYF3EQOOuVmNnwTu07A/
         sgfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqtSAuEH5b1BaTGV3Qea6AcANxP7w+c03nKv19bs1wf/0qUjCywvhVDFL6eTv1VdhtC/B7EuRZ+8V9NdEWNnpNVRB35Yg0LHaSt3M=
X-Gm-Message-State: AOJu0YwrEtzULcJvhyyMwhsTswcK3rZjEIIZj2C4i2pn6ekQVkFGHN1S
	Do/0hnXs5MV3EdBTNBrjnRA1Wr2/T9/PzJqGSy6TrhmlRK4P06tq21PeO0RIPcp1/5w1065yrxB
	FQB9KLsp8A/Q3bxxu0MZVY9stwt5vdnGyk6MpQQ==
X-Google-Smtp-Source: AGHT+IGUBklf5nU6+Ip54om6re+77r/16TEnFf7hsXTe6NPhJTrKSybxJQySskKt/7oYDhLEEnuimhm4sP5b9yJ8qkc=
X-Received: by 2002:a05:6122:4e8c:b0:4c0:9ec7:b324 with SMTP id
 gf12-20020a0561224e8c00b004c09ec7b324mr9889385vkb.0.1709907876270; Fri, 08
 Mar 2024 06:24:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYsVni7x6AuP97i10oxcusUrB4+m2wpM4Z3mTzWsnMz-Mg@mail.gmail.com>
 <8f69d1f2-0ce3-4851-a784-c76b274dd9ff@app.fastmail.com>
In-Reply-To: <8f69d1f2-0ce3-4851-a784-c76b274dd9ff@app.fastmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Fri, 8 Mar 2024 19:54:24 +0530
Message-ID: <CA+G9fYvhxJ_Tokrc3zxgP4UNjrRXjhxjfqMtSbMOoURCF1GjmQ@mail.gmail.com>
Subject: Re: arm64: WARNING: at mm/vmalloc.c:315 ioremap_page_range
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm <linux-mm@kvack.org>, linux-next <linux-next@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, lkft-triage@lists.linaro.org, 
	Andrew Morton <akpm@linux-foundation.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 Mar 2024 at 17:34, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, Mar 8, 2024, at 12:53, Naresh Kamboju wrote:
> > The following warning was noticed while boot arm and arm64 devices.
> > The below log is extracted from arm64 ROCK Pi 4B while booting and
> > another issue is kernel oops noticed while testing selftests:  kvm:
> > memslot_perf_test.
> >
> > 1) WARNING: CPU: 1 PID: 201 at mm/vmalloc.c:315 ioremap_page_range
> > 2)  Unable to handle kernel NULL pointer dereference at virtual address
> >   Internal error: Oops: 0000000096000006 [#1] PREEMPT SMP
> >   Kernel panic - not syncing: Oops: Fatal exception in interrupt
> >
> > Please find steps to reproduce, logs and config file links below.
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

<trim>

> The warning was added by commit 3e49a866c9dc ("mm: Enforce
> VM_IOREMAP flag and range in ioremap_page_range.").
>
> This indeed uses a special memory area at a fixed physical address,
> but I don't see where the vm_struct comes from.

Thanks for your explanation.

> No idea here, but it seems unrelated to the first one.

I will reproduce this issue a few more times and get back to you.

>
> Something is wrong with your address decoding, there are no line
> numbers.

Sorry for previous warning lines without line number.
Here is the generated warning log with more information.

<4>[    1.657402] ------------[ cut here ]------------
<4>[    1.657810] vm_area at addr ffffffffc0800000 is not marked as VM_IOREMAP
<4>[ 1.659792] WARNING: CPU: 1 PID: 1 at mm/vmalloc.c:315
ioremap_page_range (mm/vmalloc.c:3114)
<4>[    1.661271] Modules linked in:
<4>[    1.662912] CPU: 1 PID: 1 Comm: swapper/0 Not tainted
6.8.0-rc7-next-20240307 #1
<4>[    1.663816] Hardware name: linux,dummy-virt (DT)
<4>[    1.666004] pstate: 62400009 (nZCv daif +PAN -UAO +TCO -DIT
-SSBS BTYPE=--)
<4>[ 1.667123] pc : ioremap_page_range (mm/vmalloc.c:3114)
<4>[ 1.667602] lr : ioremap_page_range (mm/vmalloc.c:3114)

<trim>

<4>[    1.683829] Call trace:
<4>[ 1.684158] ioremap_page_range (mm/vmalloc.c:3114)
<4>[ 1.684596] pci_remap_iospace (drivers/pci/pci.c:4138)
<4>[ 1.685355] devm_pci_remap_iospace (drivers/pci/devres.c:43)
<4>[ 1.687499] devm_of_pci_bridge_init (drivers/pci/of.c:592
drivers/pci/of.c:606)
<4>[ 1.687932] devm_pci_alloc_host_bridge (drivers/pci/probe.c:2726
drivers/pci/probe.c:2704)
<4>[ 1.688364] pci_host_common_probe
(drivers/pci/controller/pci-host-common.c:64)
<4>[ 1.688795] platform_probe (drivers/base/platform.c:1411)
<4>[ 1.689557] really_probe (drivers/base/dd.c:623 (discriminator 1))
<4>[ 1.689914] __driver_probe_device (drivers/base/dd.c:808)
<4>[ 1.691509] driver_probe_device (drivers/base/dd.c:831)
<4>[ 1.691902] __driver_attach (drivers/base/dd.c:1217)
<4>[ 1.692265] bus_for_each_dev (drivers/base/bus.c:445)
<4>[ 1.693324] driver_attach (drivers/base/dd.c:1234)
<4>[ 1.693634] bus_add_driver (drivers/base/bus.c:711)
<4>[ 1.693945] driver_register (drivers/base/driver.c:258)
<4>[ 1.694247] __platform_driver_register (drivers/base/platform.c:868)
<4>[ 1.694639] gen_pci_driver_init
(drivers/pci/controller/pci-host-generic.c:87)
<4>[ 1.694969] do_one_initcall (init/main.c:1255)
<4>[ 1.695316] do_initcall_level+0xa8/0x158
<4>[ 1.696868] do_initcalls+0x60/0xa8
<4>[ 1.697734] do_basic_setup+0x28/0x40
<4>[ 1.698282] kernel_init_freeable (init/main.c:1343 (discriminator
1) init/main.c:1537 (discriminator 1))
<4>[ 1.699075] kernel_init (init/main.c:1439)
<4>[ 1.699840] ret_from_fork (arch/arm64/kernel/entry.S:861)
<4>[    1.701010] ---[ end trace 0000000000000000 ]---


- Naresh

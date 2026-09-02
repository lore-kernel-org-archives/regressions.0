Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C742A4AD4C0
	for <regressions@lists.linux.dev>; Wed,  2 Sep 2026 17:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788368769; cv=none; b=ENxqvIMeRlqDGCTD0WaDZ/frkEeMadRZrxdOOSuSMhnKlDzE4T2n4qx+qCzbXjV1jEMvHjnsDIuUekIkjsgVAl03f+R8kdHDdZ2j78NikmpFZdtTkeC0Tl4C9Cg6FbpnXbS6ox4VFC/qR23xbESzubPhlwCopgKdzgjVjo+UrgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788368769; c=relaxed/simple;
	bh=1qyWm9FBS4lwMn+l0z/+FmSGpRC7Wsn68Pil4y+CNuo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=b6R/QBTO3uzJEQAiZubvJtSU0gU3BiF/mkg6jR6k/bTCOKKG/2sp4b6G9LIifgtxTpsKaBIEpP8vG6xwpyYuf8ld6VOioAxAdGSnvcM5WDGQM3tMjRZm2VK7MVRa2pzq5lt0JRoKnYa+ngXNnoPo9Mgkrk2Tnhh225tMqF8wLEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PJFhr9Xp; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PJFhr9Xp"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc42a07d04aso959004a12.1
        for <regressions@lists.linux.dev>; Wed, 02 Sep 2026 10:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788368767; x=1788973567; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2OU53ojU8l8wGUtd3KV+CqsYwkI7GFM3tHWbQYKqcr0=;
        b=PJFhr9XpaYxdHlUdqp7lcdvIeGqzVAZ3LEXoHo8zW8wkf8+44uAa+jwp/IRs5X9+pK
         doaMszpFWPpC6idzRBL21sy69s8upe7sLOjkM2n72YOsIP/5VtPqAYgQBvwZK3aq8gkp
         Yu0DIXE6EfO8sfTY5HkikAuzZFmQjZ2CFkDi0Vrg24SbMUTUSNDjMo+ATvTEuWI+LQLF
         ZXAXDOnBdjf2p7BMEcaOxMOg9MictCdBiPR9c8vlgVGsDdAVFRUMRyn5E9gKkgy1Z1gd
         LG5uRaUsHxLeGlbC2CxzK4HnignLeR/Ng7dcm4InSAKiVLllgDpr7S5P2cnvnVOm3FB2
         Mjyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788368767; x=1788973567;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2OU53ojU8l8wGUtd3KV+CqsYwkI7GFM3tHWbQYKqcr0=;
        b=LLGnH4mt84tfqQu40bZ77xE8VTKwRYPZggq/QeN6vcOxfX4+99oqkkxLQ6/8a0qI98
         DeRsPdgQf5sZ2udNVsbAtry8mc+/yEXX+DhuWVHgW+P36LuJC8ZfsYeJkmd9XmhHzW5V
         NWJbAYWst5VlTxSpUiSmfFZth4p1ON6V1192a/KDiqZeLvSLgPsRkzRfLV5b96SInanc
         8lZiR2cXgkvWxrzclJ4KAiMTzPdeehs8uTsXVgwsgu7MvYSLUfZj9m7csIATgMFUaKHb
         +aZKXnl8BgfUxgh3TjR9kqaj/OpD9PJWG5dNuwT03QGBSU+DiXtSzic6lHBBYzHVJFNM
         K61w==
X-Forwarded-Encrypted: i=1; AKwUvByfGX8Po78h1s1MiLFkyrsv+E75Xw03k565i4Owlx4+pisC/5XulJnT7VXFCiZMsQxIahCHNk7oYpmm+A==@lists.linux.dev
X-Gm-Message-State: AFuF++nMqTCiuRzZVxY4mrmvERu5maW8ZJOqi4UxXW3I84Nu0qSkEsdJ
	S8GaqZQHifXvhS6QUNTy4NAmyzBd7kvkn2IMuCCE6yvcxUYJFKtATxPo6nlyN8novsRLpSynUq/
	3xiXrvA==
X-Received: from pjbie23.prod.google.com ([2002:a17:90b:4017:b0:398:d6ef:84d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:c106:b0:380:f85c:94b4
 with SMTP id 98e67ed59e1d1-39aedf1a98dmr10201213a91.7.1788368766542; Wed, 02
 Sep 2026 10:06:06 -0700 (PDT)
Date: Wed, 2 Sep 2026 10:06:05 -0700
In-Reply-To: <CALAyJWrn7OQyQMd5OPoifn_3qe6iWNf1+xSSg_six-+po9kpvQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <CALAyJWrn7OQyQMd5OPoifn_3qe6iWNf1+xSSg_six-+po9kpvQ@mail.gmail.com>
Message-ID: <aphXfTJicnEde3R4@google.com>
Subject: Re: [REGRESSION] [6.12.y] crypto: ccp - Move SEV/SNP Platform
 initialization to KVM breaks SEV-ES VM launch
From: Sean Christopherson <seanjc@google.com>
To: Andrew Wilson <wizlonex@gmail.com>
Cc: ashish.kalra@amd.com, aik@amd.com, herbert@gondor.apana.org.au, 
	stable@vger.kernel.org, regressions@lists.linux.dev, thomas.lendacky@amd.com, 
	john.allen@amd.com, davem@davemloft.net, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 1145026@bugs.debian.org
Content-Type: text/plain; charset="us-ascii"

On Wed, Sep 02, 2026, Andrew Wilson wrote:
> #regzbot introduced: 3f8f0133a5fc9b32d0c308530320c3f2430ba5ab
> 
> Hi all,
> 
> I am writing to report a regression affecting AMD SEV-ES VM launches
> on the 6.12 stable branch (first noticed in 6.12.97+ / 6.12.101).
> 
> I completed a git bisect between working and failing kernels, which pointed to:
> 
> Commit: bb1c84647025 ("crypto: ccp - Move SEV/SNP Platform
> initialization to KVM")
> Upstream commit: 3f8f0133a5fc9b32d0c308530320c3f2430ba5ab
> 
> ### Bisect & Verification Details:
> * Last Known Working: 8a599f4f74d4
> * First Broken Commit: bb1c84647025
> * Tested on 6.12.101: Cleanly reverting bb1c84647025 immediately
> resolves the issue and allows SEV-ES guests to boot normally.

Can you try v6.12.104 or later?  I'm pretty sure this is fixed by commit
6b748c39d18e ("KVM: SVM: Add support to initialize SEV/SNP functionality in KVM"),
i.e. is the same thing as:
https://lore.kernel.org/all/20260814100652.225499-1-jinpu.wang@ionos.com

Note, SNP is still buggered on 6.12.y if CONFIG_KVM_AMD=y, I'll try and send a
backport for that soonish.
https://lore.kernel.org/all/521b22fa-ef09-4449-909f-0120edfc4b24@oracle.com

> ### Failure Description:
> With commit bb1c84647025 applied, `sev_platform_init(&args)` is
> removed from `sev_pci_init()`, assuming KVM handles on-demand
> initialization.
> 
> On bare metal, the PSP firmware appears to remain uninitialized (does
> not reach SEV_STATE_INIT at probe time). When QEMU initializes KVM and
> queries host SEV-ES capabilities, the ioctl fails with -EPERM:
> 
>   qemu-system-x86_64: -accel kvm: sev_common_kvm_init: guest policy
> requires SEV-ES, but host SEV-ES support unavailable
>   qemu-system-x86_64: -accel kvm: failed to initialize kvm: Operation
> not permitted
> 
> ### Hardware & Environment:
> * Tested on: AMD EPYC (Rome / Milan) Supermicro platforms
> * Kernel: Linux 6.12.101
> * Hypervisor: QEMU / KVM
> 
> I have access to Naples, Rome, and Milan test hardware and am happy to
> test any patches, provide dmesg traces, or assist with debugging.  I
> am not a tech-expert of any kind, but I have time to do some testing
> if it helps.  THANK YOU for the great work.
> 
> Original Debian bug reference:
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1145026

Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793623063;
	b=Aze2+ZISOF3s84BSCS0szHiMB9PH0uYNx/GbNSombG0OnvgUTMifwvShDBVCXCOlML3q
	 91vc7ZUYbB8abf8jAwD5Gp+f5XM5SfmeoEwLbDJGYdSN5B1O1frWT9Wrw7gEUjxycx1QJ
	 foXWcMIO353icZ9FMBs/u4zPLg99C19CUaK28DdHYdQ0Bzs7omEt3MMwyXhp3mHRGVg2E
	 lrOMbOYkjEi1KANXxOI1ikkIntHHeb/MFsi0bpWYWUMQyd/aIiQiYTISgOPY67Yt1keOa
	 iaM7fAnknFW8Sp0b4F4aQN/ROsXULySFJEppOkFLKNCzUw2OJ9rolS/WahN8F1pRtIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793623063;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=P9Xe5ApGw7AVptOI+b4XC9GSYWhLs3jwBpvKf/2EdnM=;
	b=prVwO1VGuDtfoRwbVzCTfsuqP8RJ4kj+Dnjw/INMpZUMNvT2T9T6pR6MGQTRg6s5F5Ux
	 PPikYpM9xVubNrUuvmH35amXuL0ihxDHc8FOUsqsiHLTtXV79eIIPJX5EUAxgycnyUXYr
	 lNgPCbRve7WVh5CO0DGBg5SgwCEJmohIOmuNW6hpbh0YAQXZH/9nFnlrt/sA35K6AqbEm
	 od7Shy1/qiDAtH+0PbPsn38TObaEUETw4raAY8SxlwfBQGblZzUrCNDlR41LiDYh8z+Yg
	 G74tEPYLab91jdl6l3IYWfCI2Xqnw+VaBVeSNdiwb20/VYs4uKMQQhObBXmBa7aylMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ybd/QGfG";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B41606A330
	for <regressions@lists.linux.dev>; Mon,  2 Nov 2026 12:37:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09B41606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ybd/QGfG
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48df160bb9cso369758f8f.1
        for <regressions@lists.linux.dev>; Mon, 02 Nov 2026 04:37:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793623061; cv=none;
        d=google.com; s=arc-20260327;
        b=aDbsuYFpbGfF958n7mCNrNei1x1/QKSa+XWzDMNQRHrp3m2cz6QzIZIAAEoqaYPYgx
         4g7hmitu8tm6EdtW2+m1TZsSERHYBE0fSJ0DW8UzmRrFXs9v4biZWTxUXrVsYZJY0ei8
         DRd/V5DDm43/avvwvpoECsp4WaUSXJ2b9sJiUNDuFQwiDZ7OvG7ZlOqBoctriGWHBLxQ
         fEL6LuRz05d22OOJ8H59wHPkvwxQf9H9ov1ivov6jY9RTSJCpzDoxayKSgRBwemuXrWr
         hK5/Zb0BVkjYS3LkKKet1A27lJD4cPldbPY+vepg30JseE9MOIUv2uIdWUcN3SuojZvr
         27BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=P9Xe5ApGw7AVptOI+b4XC9GSYWhLs3jwBpvKf/2EdnM=;
        fh=wM54xiIVofzDtH7ms7EwoPuwAFGyRPDYChmVRn7kDMI=;
        b=VFfnfbUduiGB8zOHeq/qSvitLeu0TogCA6fgCZsgpXUuugWSgiMI9LKAs1TtYsnDvg
         8GgumDSSt4cbBzFKhIdSjQhukFxZtQazcikpE8cPfp3E+uDsTmwgVoq3WGbvhxLjiMzI
         oXnN9eU4HK7ConMtXaVfBr9ylE/Z6OpMZR6DyhPSnhOIDhJD3e2XaGIXCXKeacmZ9rUN
         5LkOv08YmNN/Wwqf8AHkZVH6pcutZZTTv9eIjl5do/3BSYrQwg/X/r942LFovNUUOOwJ
         aVbi8vgwCFZPa4AEIxAdYuFP3xj9NIq4da9Etvx/SFaUfaMz6CbZaijyDo2TcFbVirfP
         5s/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793623061; x=1794227861; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P9Xe5ApGw7AVptOI+b4XC9GSYWhLs3jwBpvKf/2EdnM=;
        b=ybd/QGfGa5nTzzR8JNHxSfA8dRWrshvC4VDlax2e2YgKhrwoQ0VpYoYS8GLimBTg00
         sZgNo/K4UwFNxuZwm4q9hOsUBPJuVGnDEWOOhdVgkKqayPEpA1yMD7ircylNC0P1jgZ5
         LLy/7x6Zs2E22ENTGftTql81f/AXEcdZFMTApoIa1D5IxCxBOh6otEPWvu5mJvPMZtMy
         BVoln6Ah2sseUkcgO91FjeZi1YfHksZU1aQkBuTLT7AakesyfN6FjNbN96bSoQ1t3Bvk
         +XRK0+F1R9d83qhfJmentSL0U0OwJvzFvY2pPs4QshKnyReuDqPHrhsHNau+qcG5XVkm
         ZYDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793623061; x=1794227861;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P9Xe5ApGw7AVptOI+b4XC9GSYWhLs3jwBpvKf/2EdnM=;
        b=15vUTK7+Jngb3pabCOxB/346KvebbnXA3ijSkGWcWXBC67Qk2ATGXTmoUZV4fIDTF7
         RkhYUc019859lUcg9uUYLcqmpQyEUVMS62jCNrQ0Gt5FnkR/stGsESwoNxkyQElHoqv5
         ViOeAkWKhg+Gsrt1Y6ugFzkc4ZCsR5TY8HBK8kU5WgEenU3rVHWmHcB7hFSSMlRqwuPH
         XSprUNjb+BLim6X+5EQCSrum4K8Gd+9cGUAStAA9RnFhmovsiCm2s7Brm2UQTgR2WMfE
         hm9kKPy5v4wH5RWTokYLiX6wdrf+pjfSKUIXsBziX4rKQ6QPYOdT7ENSGndgkwXn/8oK
         uB5g==
X-Gm-Message-State: APuU4Z+n7r5o5AAaq7ZEiJC7UAfhK4YmGn29tqApTO9jya8TwXAQzJtR
	9brgIpz1T9oI+4wQbV6L7tY0CcZQeCruJyXZP2gEkHB2dIc6i9QuufA3nAtaViIO5xDKsCB4s3/
	mOkBWaearG1VmEVWYbQ+OTIlk9yN8DkM=
X-Gm-Gg: AYBFou1I8376U/LieUG+2CsYi5n8xU5gV89D9atDkzuQDeqphk9sNaSfHtJT9ohtXLD
	44eMWLdR9NsUSAICf7j93NiLRbW22BGpC6gckegxyAyWGpMtZoc5rlGuioHZpzY6jQpALsqqOlY
	9oW3XRaN1DxcVsJzXe1+H6W1518ABycYfxP0w9G0OME+eh3PNF3gu1mc6O0uK1/1THymy+SqFnw
	uu/1CTVa+laTh0C++7TC81sCJnaVH3WRg9nD3k+9APm4+ifrylGq/dfeklGfD4oGl7DCF+ljDJi
	xUuL/+S54LP7x10bhF2pFJG0gRISkeDmq4WPF0yIOH/hs8pxyWb4caujV0pRnWBQQ5KL2gH/Vm1
	C3KKPQS3cuonY9wDYLGSKZBXe7gjkKp+g5a5kKe6i/sEzpHx4550BjdIHcy4c4xp+zCBh/nscxh
	4mscVFG+iJvIlAqUs=
X-Received: by 2002:adf:e708:0:b0:48a:f41d:83c with SMTP id
 ffacd0b85a97d-48e6e262d4amr20344295f8f.0.1793623061185; Mon, 02 Nov 2026
 04:37:41 -0800 (PST)
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CACOV87VBmya0PKjni5xEYxUaEczk9X_UoUHXSR_HDS2kSJnM2g@mail.gmail.com>
 <00da317f-ec33-4084-a48a-1a6b4e10dfc8@leemhuis.info>
In-Reply-To: <00da317f-ec33-4084-a48a-1a6b4e10dfc8@leemhuis.info>
From: Nathan Blomquist <nblomquist@gmail.com>
Date: Mon, 2 Nov 2026 07:37:30 -0500
X-Gm-Features: AclHuK-Bb80BdPxE_BV90SywTLD5EIBW_cZcuIJ-QheO2IIocit-nkZxgYaYNVg
Message-ID: <CACOV87VsAxi_xY2Zghysv7hjqL8ppmpaut7S0JEnDHvH8HuKEQ@mail.gmail.com>
Subject: Re: [REGRESSION] amdgpu: Navi 23 passthrough fails after ef5fcf2a6c32
To: regressions@leemhuis.info, amd-gfx@lists.freedesktop.org
Cc: regressions@lists.linux.dev, alexander.deucher@amd.com, 
	christian.koenig@amd.com
Content-Type: text/plain; charset="UTF-8"

Hi Thorsten,

On Mon, Nov 2, 2026, Thorsten Leemhuis wrote:
> Have you tried if 7.3 is affected as well? You also might want to check
> if 7.4-rc1 might have fixed it.

Thanks for pointing this out. The original regression reproduces on
unmodified upstream 7.3.1. I also attempted 7.4-rc1, but an earlier host
GPU initialization failure prevented testing the handoff.

For 7.3.1, I used the signed kernel.org release source, corresponding
to commit:

    79a907609d53d5cd645b42c11550d295d43abf99

The trace shows BACO supported=1 but enabled=0, followed by
amdgpu_device_baco_exit() returning -524 without ULPS re-arming. Both
functions subsequently undergo VFIO D3/resume and have valid PCI IDs
immediately before secondary-bus reset, but both read 0xffffffff
afterward and the reset helper returns -25.

This happens with all guest CPUs held at their reset vectors. The
trace contains 9,716 events with no lost events or missed probes;
kernel taint remains zero throughout.

For 7.4-rc1, I built Linus's signed tag at:

    6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

That attempt failed during host GPU initialization:

    AMD-Vi: Event logged [IO_PAGE_FAULT domain=0x0000
address=0xffa00000 flags=0x0007]
    PSP load kdb failed!
    PSP firmware loading failed
    hw_init of IP block <psp> failed -22
    Fatal error during GPU init

Failed-probe cleanup then emitted amdgpu_irq_put() warnings, leaving
taint 512/W. I stopped before starting the VM, so this attempt is
inconclusive for the original handoff regression. I have not established
the cause or repeatability of this initialization failure.

Neither build included downstream patches, my candidate correction,
reset-timing changes, or external modules. Userspace, firmware and guest
configuration were held fixed between the attempts. Configs and logs
are available.

Is the 7.4-rc1 initialization failure a known issue, or should I report
it separately?

Thanks,
Nathan



On Mon, 2 Nov 2026 10:01:54 +0100, Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
> On 11/1/26 21:05, Nathan Blomquist wrote:
> >
> > I can reproduce a Navi 23 / RX 6600 (1002:73ff) passthrough failure on
> > unmodified upstream Linux 7.2.10. It happens during the amdgpu-to-VFIO
> > handoff, before any guest code runs.
> >
> > Revert/add-back tests on Proxmox kernels isolate ef5fcf2a6c32
> > ("drm/amdgpu: fix autosuspend cleanup during removal") as the trigger.
> > Removing its added call from -20 works; adding it to working -19 fails.
> > [...]
>
> ef5fcf2a6c32 is a 7.3 commit, but you only specify that 7.2.y is
> affected, which might be caused by a failed backport. And 7.2.y is EOL,
> so it won't be fixed anyway. Hence:
>
> Have you tried if 7.3 is affected as well? You also might want to check
> if 7.4-rc1 might have fixed it.
>
> Ciao, Thorsten

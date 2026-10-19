Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792424539;
	b=eUjGGVOeRrKGDsqejkvDwCzB2DS452stSuj1Xx4MFP/jbh0vjZBtetqczBVOV+yBYevP
	 aXEaelUaFPjqpPytQ3WnZfjOzmLzmbWz0zg9NpoMtUsNyZduI5oImwAsVw8V+c+ogV1BH
	 yH8hjB7LejafYgW/H7JHR6RhBmrZDleBi8J7ohqtLCpkGr3mCZ4CFgTuMHpOy2v7l6COC
	 LpZ9ogRk2IQgRPzHwpgSIUdQ4LEB6YRibJ2O6uu/BBROtHXio7ysKLs1OZniwkKioNv1v
	 HA7VGFsMkJsJuZjrjRZ213shw+CrSJtaofXBg6WA3po8GtaN12uhraPrPc5fENlGHeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792424539;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=iMgrhjGDM6hEQh8Aw9yzZbHzALMwxiGfaVEBL4NiDa0=;
	b=CqInXp5dRN6f7fpHxPjIt/w6j6+B03HLBPJ07sWbC2hvfI7Dg6vlna0cT5CgEMUw7RSM
	 J9ZzP+1zJA00EUfd96fXVGzwNu247qABFJjCigLGj8x2YJZApYvo6TYVKGTL7u77Bv1XG
	 lp+6pNop81vKLyYBekddy9gsO5OIsBozLRrdYU71Ga77LYmIe04HYZjlXKI4xcM1gBg7x
	 F0vBuQsgC5xH8yyhuu5p2y8dCe5sh4j3ruJZ+s79zM5b04z6UpkJ5CFUYhXzZQ2sdNGj/
	 HigdtsOnzHspx2AbU4/0g7HfRRjInOhTkXKqWN9QsMA1GRFjd0bsWP6eZB3KEP9jD7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X3aynwzV;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73082607BF1C
	for <regressions@lists.linux.dev>; Mon, 19 Oct 2026 15:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73082607BF1C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=X3aynwzV
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd5e2d696e0so1536466a12.1
        for <regressions@lists.linux.dev>; Mon, 19 Oct 2026 08:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792424539; x=1793029339; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iMgrhjGDM6hEQh8Aw9yzZbHzALMwxiGfaVEBL4NiDa0=;
        b=X3aynwzVMyDWALoIyJ7DtD/SxntC3f7dsuLbGLlSU0Kdab59n327h01v7W74VyVWMV
         dbICdEjk4aQkLwzMlWQbuGZPDVxZFMtRnS32Ltpe14kvAF0XZ8jUIAGjdCyK4VBO9tU2
         XcX572jRnnwe2A8OyKFGjo6w/nn7v2mEjIikl2oy9DhrwCcmUf1EM+qiW0jmYHBy1IeH
         +8rHQGKB+DnwKGa5TyhdjDuUrPRYX9EbCT1NxKH2jQ35hVC6nRHSB1u8rXm08RhXHTz5
         FAKya/Hg0rB4Tw4qDixa0/7RLxIWg6Aw8HRFYbFIyXKSx91i+x68X6eoZsRHVFDL1tJp
         mD5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792424539; x=1793029339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iMgrhjGDM6hEQh8Aw9yzZbHzALMwxiGfaVEBL4NiDa0=;
        b=LZTx+E0KXVkazzSGBRsIhxZnyDUZmeGPZzQvI3utNmOTVREu3IO9r5+Y8u6SlOXYhw
         IoXO/deYYHcxtDi/lzwMWH3Gu3LdrhtQdQmc4SXi+hfZHoMJHbQjmF0mZ5y7yccO52JE
         tjx6gXuV3SuZFWQSbG3X4CLSemvWiPpQRiJMhQEszG9clCgg62Jv9APWb9Cs5N7IFX8s
         KGmvnbW2c6PR3mi7BpnvBZOmCwa3xPqs1PAwyQtXDSXvuja6T5UG7MwQDF33QASS523T
         NQm1HaDPax9sKa6Fl8GA6u9EBqVZdu0dlgppi1zCKPQ18i8r/uQsuPb2aM4Ba4FOXzp+
         nVAw==
X-Forwarded-Encrypted: i=1; AKwUvBxU0eqje3WTqU9RKC4UeQYAt+MJNAT/rPT0UAQ5wIJvgYBL6PEu8+wP9GGhoGSisFMR1R90KrhwX700Xw==@lists.linux.dev
X-Gm-Message-State: AFq9FYKKLcvsFA7FBghWNc5rmMeoDcN0oQXGnvnnMW4Ghrrv69ur5FGE
	i5BQJ6shtAXq/QjgaZ+lnZRp0/W5t+JK+bHe+bCQv+3Lk7EDDCqcCrLz
X-Gm-Gg: AYBFou1vmkWmQ7auNL2ivTGcSUzv2clMPhyXujxTLvIm9bK1G0bu/BKlOcz5xJnS4uV
	eH9W8cGbQB9cwWnKeULyEuG6GXSuiPMkNWQpnHgEpMadXbQtUW+DqcW+vWVynTeBQR6uZHRrMTg
	uMhoekv0dAZ3dlm33hPajNAzDy43s8VIPaMCbBWrt2hBS8034nu9fJJ13/R3y6YhB+acJvZMXMD
	E+pFMn96juD7guorHq822pw8fTBH/R/IgbqdjZayZ/Pg3ATVRal1J1Tg2t+4csSAb5Jz/o50BcJ
	r5IXPtl2zuxAV/wKKEh+QpGiV+VrQkB6FR5GRlazzT6mECphyHNerIlhtZJwWa/BN9cz6hZr2N6
	+mIhJOZtk9UAnBS9cvOM6w3qnog/O8IE0D8DpKEM3BFMFfgPdPZK5mZJXGZUFPaCMGBDdqgBeza
	qtyuGe+F/UzG97l7AfkkLEoX1+KAaQn2BN0F7euRRR0rI4OtLqpnWj2zBvGuPTzDHj9hHQ
X-Received: by 2002:a17:90b:3d4e:b0:3ab:2c2b:1026 with SMTP id 98e67ed59e1d1-3acef0c8911mr6398917a91.34.1792424538542;
        Mon, 19 Oct 2026 08:42:18 -0700 (PDT)
Received: from hachimi ([101.5.170.156])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549ee946sm3926364a12.20.2026.10.19.08.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 08:42:18 -0700 (PDT)
From: Lanfeng Wei <xlfylawarthur@gmail.com>
To: tzimmermann@suse.de
Cc: airlied@gmail.com,
	decui@microsoft.com,
	dri-devel@lists.freedesktop.org,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	longli@microsoft.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	regressions@lists.linux.dev,
	simona@ffwll.ch,
	ssengar@linux.microsoft.com,
	stable@vger.kernel.org,
	xlfylawarthur@gmail.com
Subject: Re: Re: [PATCH] drm/hyperv: add a parameter to disable the vblank timer
Date: Mon, 19 Oct 2026 23:40:43 +0800
Message-ID: <20261019154121.6257-1-xlfylawarthur@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <c238f4ff-d5d8-4a9a-8773-793bd9056c9b@suse.de>
References: <c238f4ff-d5d8-4a9a-8773-793bd9056c9b@suse.de>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Thomas, 

> Yeah, what's the cause of it? Switching off features does not fix any
> bugs or improve the status quo.

You are right that the module parameter is only a workaround for users
affected; it does not fix the underlying scheduling problem.

The cause is that the synthetic vblank timer is used to pace completion
of atomic updates triggered by dirtyfb, in addition to providing
synthetic vblank events. In Xorg's software-cursor path, pointer motion
damages the primary framebuffer and the damage is instantly submitted
via DRM_IOCTL_MODE_DIRTYFB. The Hyper-V dirtyfb path performs a
synchronous atomic commit, and with the vblank timer enabled that commit
can wait for the next simulated vblank. Under continuous pointer motion,
these commits dominate the update path and delay normal client updates,
resulting in sever frame-rate drops. 

This particular regression results from the combination of the blocking
dirtyfb path, synthetic vblank pacing, and the absence of a Linux DRM
cursor plane in Hyper-V. While the Hyper-V video protocol does have a
hardware-cursor command path, the upstream hyperv_drm driver currently
exposes only a primary plane. Cursor plane support was deferred during
the initial upstreaming [1]. Without a cursor plane, Xorg has to fall
back to software cursor-rendering path and it competes with periodic
graphical updates on the primary plane.

So the proper long-term fix could be adding cursor plane support in the
Hyper-V DRM driver, which may take some time. Providing that the stated
purpose of the offending commit is to rate-limit display updates, while
its current implementation regresses the existing software-cursor path,
I think adding a switch or reverting the commit until the requested
features in the driver is ready, is a reasonable short-term fix. 

> We had another fix for a problem with vblank timers:
>
> https://lore.kernel.org/dri-devel/20260914110004.211027-1-tzimmermann@suse.de/
>
> Did you validate that this fix is unrelated?

Yes I tested that fix and confirmed that it is irrelevant. It solves
issues with excessively long frame durations, however this problem is
found in normal frame updates (in my case 60Hz / 16.7 ms per frame, way
below INT_MAX).

Best regards,

Lanfeng Wei

[1] https://lore.kernel.org/dri-devel/20200622110623.113546-1-drawat.floss@gmail.com/ 

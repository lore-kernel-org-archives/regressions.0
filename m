Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793140247;
	b=04PkQo1XEg6Sgz5MVzP13lXcGK95kd0ihmwtnI+2bwcMo5ZunkEeYon4raWiC7A1reQ7
	 gXvC5a1wJ/hQy4RUAP6sYyuv3LDVdk9e6p1dpzp3D+yucO0dEtQnX9XvvbD/YWItdAci3
	 Qk0ZVCyQrqCNl7sKgb/0tVIMZpZOjIKgqawBhSZGM2XaL+iKm2D14g9FOT4ouqtC9YAVp
	 7lEGJBH5BJ9m7s1hyTlpKpCbMiLpvoDexW8qFfg19Riy6iB6ixk1iKHrFY99JQKjXlCJC
	 X+1VRaURCt6kSjrPscR0kmqlM4HXq97QHe09lbKnD9sq/9GKwuJKGlbdXxGFH9Kdkqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793140247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fF+hhLhhGF6DZRpl45mUYSu/W2Cwx5CQUq9wX62q4sI=;
	b=On/17griSD7ncC8JwZz6isUzYqwB+Jssn2k+pRuM52pEQE1wPdVNJIKlB6v0jEkeTUeP
	 3/sz6xxAAwbFCU/RXeF682vAiu4lPd7kyDeHaVpY0vnE4jWha6HROWChLrYgY5iWB9BFn
	 DZ3RuKEvQa/nU89w18jKYPzLWyWlWDYggBgym2BAL0v3yPiEkTK3oAAs+z2HdWMIa3NwZ
	 0Ezjl5LuPPYEXINigMAi+gCnFStY0DlWY57f0cQKuVHswCpEDqg1/MLVqX9qAm2Kq9fX6
	 V7k9RvFL/oqCmoyzEEzstkjzy1mBChu5187/EyFNEpuJR99u5D+85bJzgUKThlxN9RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IcKjFboC;
	arc=none smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C8C606A33D
	for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 22:30:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90C8C606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IcKjFboC
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bfa686881fso362184e87.2
        for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 15:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793140245; x=1793745045; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fF+hhLhhGF6DZRpl45mUYSu/W2Cwx5CQUq9wX62q4sI=;
        b=IcKjFboCw/jNuZhKj2SPWtFgkcC6gPM61WbQ5TwV8TpsjkkVDeQGDibvnCNZa6YQaN
         6Bud5i1tKv2e691j+bhZihOeCdT1jVtvm9lOSpU3G85at4K6cpEdSxHBJk4/4ASWXTUO
         CzWFxn/rcJEOBd236tiGKhClC3nGmLemKedFoAVB8umeQud3zpJpIQOGXTj1nbxBpnV3
         Cfivoytcvi+1RgJiAWzfzUkBbVSyXR2QX/ujn82zoWWTZIFoNzZFbXbCg0zxU7Mhr3vQ
         rrpBSxAivWQi32+58A+24sFsjLeoHsN8IVScMZzsWr2pV+joQ+NFxLCR/65xOTVVgUJV
         vd2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793140245; x=1793745045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fF+hhLhhGF6DZRpl45mUYSu/W2Cwx5CQUq9wX62q4sI=;
        b=y6xnNZgCllVSx/R8a6gLko7vccZLm0VZtiyGipATEoCb7d+HPYoIhWaQTXHqpwgGEX
         hhvCcWMfnnxmgT0m1lPPZ6iPzWQqkHVapkqxhvvlp6OnLEfdz+gyEEXBtSTyuAuSPuYE
         t2i05y9fZMJAfjw+NBNtGglbDBzSrJ8bUlFJ+piXF7++rV4KlJTv+Lh5glRu9CS++uTl
         dSCkUGeaiwOPeh647X5sKilvD4iWfaghWmyJpFy6CcvGhXEZ59cmBMtx2ZeEDcXThz4S
         up92uc1Ws/GtJOPlNFMk5PwAD9iZ1RGBKS48by0/Spt/3p9CMhYiFSjaPOqNEOfKMnhL
         QUgQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0+GYgF+/ZTYR3A1T86EqHbz7TyNiUeurMC/91ULQzZ0k7BH/orBMp3ghrYvhdT5+zP5yE1QKGEsSFUA==@lists.linux.dev
X-Gm-Message-State: AFq9FYLx/72xvI/ZaAgY+J5yXnVQW7G9narfO+/xG6R4vxZUNZTTFyK4
	yDXWMTyaKbUppHJ3YQyewJ1tgt3iGtunIa6Os16DEO7LPMQS1G+vgQHZ
X-Gm-Gg: AYBFou2ZkCP1G3VDaw4l+BeZp/VtKEU9Yf8JCcR21s0fNScLgNy3/m0JpGYlkMBAWIy
	C+lLYj0MJAJocjSPsWGTEEaJQhF5IxFutiuxUCe4I8+dUqakr7mYpn3nJQoRr1zOkluvdipzqhB
	vS6hlCTDaXk1snHBwrSIicMRynaK8c22dhdLIBJiBO4ttLtgwVAz3kk1HizP9OliETkxDkD2369
	WUOt0kT22IWcu9kmujsn2104xv9VLouRd+ZLs9vXWxSp7EufvxxifayzdMe6k5va3qHGUwQzEN9
	xneZ6gJvU9gpct6yI9cbvyWPXL0wLtFPanD7LUz4XGKgscc43eBGGlayzaXEUdGPUzI1305rkkH
	X6OfwGMN+qDcALELqB183aLFt5KMHFXMcqK5e3V6g0+dq+JeJ7WlxZT13pND2GgC2IdA/EGpjt8
	Wo6TNg18m34hTtJaHcypTGjPNvq7ZWRgs2m7IVoT0Xj+yzIE12nK02m+usbEijcV1bCqfNlGkjq
	rvw/4Z4/1himAfhpCqiiv7vB+Ka2FfF+CyqjxC+m/y0QV/O/vi+hjVj55sgKxcTDMP9suSliyrS
	SDpQkuxF3rmvcoY3Ay26qTZW2yH/s8HQVPXsiLKRDKqu4e59m0EdrQ==
X-Received: by 2002:ac2:4e11:0:b0:5bc:c9e3:d5bc with SMTP id 2adb3069b0e04-5bfcad1f499mr228031e87.29.1793140244602;
        Tue, 27 Oct 2026 15:30:44 -0700 (PDT)
Received: from localhost ([178.214.243.78])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfca5c9ebdsm205370e87.84.2026.10.27.15.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 15:30:43 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Calvin Owens <calvin@wbinvd.org>
Cc: linux-kernel@vger.kernel.org,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Alex Hung <alex.hung@amd.com>,
	amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Aurabindo Pillai <aurabindo.pillai@amd.com>,
	Fangzhi Zuo <Jerry.Zuo@amd.com>,
	George Zhang <george.zhang@amd.com>,
	regressions@lists.linux.dev
Subject: Re: [PATCH] Revert "drm/amd/display: Allocate DCN32/1 dmub memory to GTT"
Date: Wed, 28 Oct 2026 03:30:37 +0500
Message-ID: <20261027223038.299768-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <25995707c39c0c191e3ac46c4813f55a7f928403.1793131583.git.calvin@wbinvd.org>
References: <25995707c39c0c191e3ac46c4813f55a7f928403.1793131583.git.calvin@wbinvd.org>
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

I see the same kind of single-frame band across the whole screen on an
RX 7900 XTX driving a 3840x2160 TV over HDMI, and measured a637a140ab86
against the same parent: 35 times more events, over about eleven hours
each [1].  What I found since may help decide how to fix it: here the
band needs both the commit and DC switching the memory clock through
sub-viewport (SubVP).  With either one missing, the rate stays at the
same low level.

Events per 1000 eligible frames (frames whose neighbours show unchanged
content), counted with the CRTC CRC as described in my report [4]:

  kernel                 refresh  SubVP  events / eligible  per 1000
  1d8327353de6 (parent)  4K@120   yes       7 / 3,019,571     0.0023
  a637a140ab86           4K@120   yes     293 / 3,632,444     0.0807
  7.3-rc6                4K@120   no        5 / 1,582,072     0.0032
  7.3-rc6                4K@100   yes     139 /   712,333     0.195

7.3-rc6 contains the commit.  The 4K@120 runs with and without SubVP
differ in the TV's VRR setting, which decides whether DC may use SubVP
at that rate; without SubVP, DC keeps the memory clock at its
maximum [2].  In the 4K@100 run, 138 of the 139 bad frames have CRCs
that occur nowhere else in the capture, so the content of the band is
new nearly every time, which fits your "non-framebuffer data".

A second user, on an RX 7900 XT, sees the band over HDMI and over
DisplayPort whenever amdgpu_dm_capabilities reports SubVP enabled, and
not when it is disabled [3].  The DC debugging documentation describes
this kind of symptom: "a horizontal fillet of flickering happens in some
specific part of the screen.  This could be an indication of
Sub-Viewport issues" (Documentation/gpu/amdgpu/display/dc-debug.rst).
It suggests force_disable_subvp to check; on a stock kernel that is
amdgpu.dcdebugmask=0x20000.

Since it reproduces within 30 minutes for you, could you check three
things on an unreverted kernel?

  1. The refresh rate, HDMI or DisplayPort, whether VRR/FreeSync is
     on, and what amdgpu_dm_capabilities says:

       sudo sh -c 'head -v /sys/kernel/debug/dri/0000:*/amdgpu_dm_capabilities'

  2. Whether the bars always appear in the same part of the screen,
     as in the documentation's description, and if so, where.

  3. Whether they come back when booted with amdgpu.dcdebugmask=0x20000.
     amdgpu_dm_capabilities should then say "sub-viewport supported:
     yes, enabled: no", and the memory clock may stay at its maximum.

I have not run the third test myself.

The commit moved DMUB memory to GTT because data from DMCUB sometimes
reached the driver late, after DMCUB had signalled it.  SubVP is a path
where DMCUB itself works to a deadline: DC budgets 15 us for its
processing when it sizes the SubVP region (subvp_fw_processing_delay_us
in dcn32_resource.c).  Since the commit, the windows the driver sets up
for the firmware's data, mailbox and state are in system memory.
Whether that can make the firmware miss its deadline is what I asked
AMD earlier [2]; it is still open.

If this goes in, Fixes: a637a140ab86 with Cc: stable would take it to
7.3.y, and a Closes: tag pointing at my report [4] would let the
regression tracker close it.

[1] https://lore.kernel.org/all/20260919200820.799243-1-mikhail.v.gavrilov@gmail.com/
[2] https://lore.kernel.org/all/20261011201833.853907-1-mikhail.v.gavrilov@gmail.com/
[3] https://gitlab.freedesktop.org/drm/amd/-/work_items/5714
[4] https://lore.kernel.org/all/20260829010525.29935-1-mikhail.v.gavrilov@gmail.com/

-- 
Thanks,
Mikhail

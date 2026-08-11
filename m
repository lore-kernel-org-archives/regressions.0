Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE005399360
	for <regressions@lists.linux.dev>; Tue, 11 Aug 2026 07:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786434420; cv=none; b=IYS6ZOkQaPMSbP02WuUzE1XlBDKOSjPUs7hMnl0aP/Gzl35sdYVQzy41BG+jffE5TZIYNaFgBFP9MyS7HkIgx4n57oJ5lUmpKn8B7DuZnzjR9TRayiWKQ9lfv37BOPi2Y+8FZLT8MMHBaidShdHrhngupYTpyv6Y9EdD2MBm+Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786434420; c=relaxed/simple;
	bh=gh28cZ/JOE/QjfFZwgADfO812BSRMhjlzTaQe5JzexE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zsue8lWhatIJhZIdogsV+lkQ4d31i459+dKVkdJ7+/2TNzdEu+qfSPb56BgX+SMBm1wSBzlqI0PnrjFfY+ZyJrraxE/2PCKBkuDFbMyQM4v3qwOWOlllnqLzma5tp+z+fwjCMHYM86Uvxuu+1Zml/iFuped6Vg9BQ5f9aJwTe7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=pass smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b=iqu2LT7u; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ursulin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin.net header.i=@ursulin.net header.b="iqu2LT7u"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so20875925e9.0
        for <regressions@lists.linux.dev>; Tue, 11 Aug 2026 00:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin.net; s=google; t=1786434417; x=1787039217; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lb5ET+WzzMHF6IHDftmOMyIKThUmSRKYzy1eFtIR7Vs=;
        b=iqu2LT7uTOraNAbb7TfzA0QApgU9FFNxv+G7z6nprOfp2wULd6mEZNeWgx8x4ngjQN
         5W7XQfUi5Px1gaKe1aKD7mqK1zGWjEBCu37n6UfkU5ihH8WQYq64iXNxn0uC9TzfKW+p
         LX/VcCq5nQ3yxosqFuqz/xJJ9vEbs1Af6K6URDvn5kE3IQs+IsDA7sZIxSqr/D1Cqort
         jPKDUFznvcNpM0ITjr4ylKV+RhKdYaPaxPy/ZwTowQsF3PeHT46UEXGU3V6eg5NuPhSz
         4MtCeO5Kh6WPOMGzobWAV03d9DP1Yx+4aXnSk4/lAzrZiwDRS9bJ9BJShGD9RqSNtOaV
         39XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786434417; x=1787039217;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lb5ET+WzzMHF6IHDftmOMyIKThUmSRKYzy1eFtIR7Vs=;
        b=QblJdMQy5dqOuFvPilQiT9KDIwSlV5cH20mjNfyla/yFbUNy4EsDm5H2z8eCVkjdTl
         iREqD1GV2MLP8FadoLYRuD+sOu4qQuDL80BlMEebMLKPtb88cDCS0QQDhCAM4QMDEm6o
         ambfU8q6BqRz/su1FCvEz26jINyI1QpJJ6o5653nnKbgprMnysXzLBjzTkpSWhqiMeak
         JGIyTAQKiYWC+CRRsLOk9V3RQ71sNb0vKLCmoAV5FUU8pGy7rEZUX7UnHlHqUM1oUvh6
         Hq80ahv+E4CPpH34+1WdqX59Ni0j4lt55YrmYuA7rESowxwdhYJZSZyh/7Ycc4f66rIF
         yxeQ==
X-Gm-Message-State: AOJu0Yxmv0q4+RzSKtrvW5BF3gL+V2nQ1ZvfG5xXs0NrID4bWc6VL/aH
	IJqaEsJCjB3yL32Ve0l5k+Dw3cVACphrvzgoyH2nmhllcPyINOvJJ6FdePSCSnLFqVw=
X-Gm-Gg: AR+sD13mut5hP0Kmfpisa86LebEsCVopX8ycUFtOz5snr7ev3XHXKX6CKD5uIpTnbzU
	qaFArnhKvarzQ/FDjSRxbEDe9JUQE34qh3S53y/RzqadGLiry1pJaMPDHyDYnbQJWDgxpMBXKw+
	7DUNi4X4llWZvX31X0jdaaPCdqdEQomAhM8JKAHoWc1Y1b9dx71R3JkZQhxi9vymaqVLgwHu16e
	XaJmEP873vp0OwC6BgSwfx2F1X8m4g5xjIxtbHqoVJNChe+IDv1Pouj0YVHQ+f64P3CQ6KOr/p/
	3lL2PU3yb/vv1+FB0ENEg/uiw8/wVhHwUIYd9P7GbN9eogWCRvgOGMF77AjoFljpwW/agMjoxf7
	D8AQF14lfgK5uLMUFCyyPMuqVgiYb7eA1cMswhwoUf+ZvlqDVwxWnLE95VD7zwjE5ZWgTYHitNq
	mML2GBpQYHDVHswU9H4mRGSkv50sngyKBlSlu68wK3+wBxRcMG7czHijlT8+utNdF3Jm91HYIYD
	ebGe8FTcA==
X-Received: by 2002:a05:600c:3114:b0:495:6e68:5df2 with SMTP id 5b1f17b1804b1-4997844f628mr20367895e9.12.1786434416734;
        Tue, 11 Aug 2026 00:46:56 -0700 (PDT)
Received: from [192.168.0.116] ([90.249.211.112])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49977e647acsm21670595e9.3.2026.08.11.00.46.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 00:46:55 -0700 (PDT)
Message-ID: <938ef65f-231f-40e9-a9b1-327d5d91e53a@ursulin.net>
Date: Tue, 11 Aug 2026 08:46:54 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] drm/sched: FAIR policy causes serious performance
 degradation at max GPU load on 9070XT
To: Luke.Wildhardt@proton.me,
 "matthew.brost@intel.com" <matthew.brost@intel.com>,
 "dakr@kernel.org" <dakr@kernel.org>, "phasta@kernel.org"
 <phasta@kernel.org>,
 "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <TfhgV1W0W5LI6RWUO6J35B3R8QIYH_FN3Eihzdo_9PH39hfn1AVByT-QBPHmWiAR-L0Kqi2sppM_EhFPKwZPGmb5pFgpF2MrzeFzkZDmpG8=@proton.me>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <TfhgV1W0W5LI6RWUO6J35B3R8QIYH_FN3Eihzdo_9PH39hfn1AVByT-QBPHmWiAR-L0Kqi2sppM_EhFPKwZPGmb5pFgpF2MrzeFzkZDmpG8=@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 09/08/2026 00:33, Luke.Wildhardt@proton.me wrote:
> Since the DRM scheduler default policy was switched to FAIR in 7.2, sustained 100% GPU load in-game on my RX 9070 XT causes severe performance degradation. In the example title running through Proton, Project Silverfish, the foreground application degrades to roughly 10 fps or freezes outright while audio continues, and the KDE Plasma Wayland session can lock up entirely, requiring a reboot or killing the compositor to recover. The problem is not limited to games. Running the game in the background + alt tabbing, then playing a YouTube video can also cause the entire desktop to freeze.

Was there anything interesting in dmesg then the total UI lockup happened?

> 
> Then, if the game starts to stutter, either alt-tabbing, or opening up a menu in game (which reduced the load on the GPU) immediately stops the stuttering.
> 
> The issue is reliably reproducible under sustained GPU saturation, although the time-to-failure varies. Increasing shadow load (which decreases in-game frame rate) substantially shortens the time-to-failure.
> 
> In game, MangoHud does not reveal any frametime discrepancy.

What exactly did you mean by not revealing discrepancy? Game is at 10fps 
and HUD shows 10fps? Or game appears to stutter but HUD shows "normal" fps?

> Bisection / test matrix
> 
> Reproducer: Project Silverfish (Proton) at settings that saturate the GPU, with a second GPU client active (browser video). Other titles show the same symptom under sustained load; I have not yet re-tested those specific titles against the fix.

Could you list the other titles which showed the issue?

Regards,

Tvrtko

> 
> Kernel	Result
> torvalds/master stock	FAIR (default)	FAIL
> same as above + reverts below	gpu_sched.sched_policy=2 (FAIR)	FAIL
> same as above + reverts below	gpu_sched.sched_policy=1 (FIFO)	PASS
> 7.1.5 release	PASS
> drm-next	FAIR (default)	FAIL
> 
> Reverted Commits:
> 
> d09339388b77 drm/sched: Remove drm_sched_init_args->num_rqs
> 2833a0512b4c drm/sched: Remove drm_sched_init_args->num_rqs usage
> 16e7698bc04d drm/sched: Embed run queue singleton into the scheduler
> 77a6809f1dc3 drm/sched: Remove FIFO and RR and simplify to a single run queue
> 45c211ddf92a drm/sched: Switch default policy to fair
> 2462a0ce23b0 drm/amdgpu: Remove drm_sched_init_args->num_rqs usage
> 
> 
> 
> Kernel (failing):  7.2.0-rc6 (stock), also current drm-next
> Kernel (working):  7.2.0-rc6-default-revert-00006-g7e5de9b07e3d with sched_policy=1
>                     7.1 release
> Distro:            Arch Linux
> Session:           KDE Plasma 6.7.4 / Wayland (KWin), Qt 6.11.1, KF 6.28.0
> CPU:               AMD Ryzen 9 9950X3D
> RAM:               64 GiB
> GPU:               Sapphire Pulse Radeon RX 9070 XT
>                     03:00.0 [1002:7550] rev c0, subsys Sapphire 1478
> Motherboard:       ASUS (AM5 / 800-series chipset)
> Mesa:              26.1.6-arch1.1 (RADV, driverVersion 26.1.6)
> Vulkan:            instance 1.4.357 / device 1.4.354
> 
> 
> 
> 
> On the same reverted kernel build, changing only gpu_sched.sched_policy from 2 (FAIR) to 1 (FIFO) changes the result from reliably failing to passing extended stress testing.
> 
> 
> 
> Possible mitigation options
> 
> Given that 7.2 is late in the release cycle and 77a6809f1dc3 removes FIFO/RR as selectable policies, there is currently no runtime workaround for affected systems.
> 
> 
> Revert 45c211ddf92a so FIFO remains the default while FAIR remains available for further testing.
> 
> If necessary, also revert 77a6809f1dc3 and dependent changes to restore runtime policy selection.
> 
> Alternatively, fix the underlying FAIR regression if a suitable fix can be identified in time for 7.2.
> 
> 
> I mention the revert options because the justification for removing FIFO/RR included the absence of known regressions relative to those policies. This report appears to provide at least one counterexample.
> 
> 
> I am willing to test patches responsively and collect data if necessary.
> 


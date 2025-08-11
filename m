Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0B21A01C6
	for <regressions@lists.linux.dev>; Mon, 11 Aug 2025 08:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754900468; cv=none; b=oydU4B+yrDECKLR9WGhrJ2Z2iqD5TVC3ZKkPiGGDSuFQ3BWjTRxXkacGPDThxfgabi7+qYyZhhf52Nxreb52F1yN4MzVmivRG/jIgIxzx8M9rKqKL1n8TkZXfyxX2GxH6ahAvQDJua8ORU4QzF2Ay2vx5EXYQC/ow6HKJ07F/6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754900468; c=relaxed/simple;
	bh=+Vwyu2PLKkLHoC8Hj51g7arKuaINHSi8vcDy8FdWvPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iuAO5HlSdmuoa+llFnbnp9934fZ9qc9njnlQChN1+1TlX31GjFTfOxFKD+ROedxmUUHmgn6Jms8/Bdf3hJLzDXSZlN9ln9THAEtIeO8qAxbEGseeDwdtZj40itwSnwfDYPPOkU8y7JWK66UJJP0HoYQLJZ1+mdkGoCMRPrr3cfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CMpdTIsq; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CMpdTIsq"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-24063eac495so30399665ad.0
        for <regressions@lists.linux.dev>; Mon, 11 Aug 2025 01:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754900466; x=1755505266; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KtvUcm8eKqLg5xx/IzAnE0CR0VtQIYJM5TEZnjUYa44=;
        b=CMpdTIsqZKRsDW/k2lQigjXuNQfptydp32CVJ9eeWYUl6EdEJR7dHrZnDQw5VVqEzz
         KEs1+0cS+WI8CKac0eWEcouXEvDTKouRd4h34hQpqBG3bEz0QUAaSAL+dBpQTjNNzklg
         Usyg2X+TlnxGj619L4BO9hwp77fWrCFrdHo7VCWKk538FK9ZOkTPVQFgD4DjBT8jGwOY
         +fnw23Iei4DATYFJ68sntVgMyc0dmQjM8vCbyZjL55h58loxTsYCuyZ0RqPo9DSOqpef
         a8LanL8U5GdUO1ByVhN3pZYVDjoTjZrJ3nfIR0qZMemFUeZyZkz6/BlqVGmDIBhcxgPK
         nEWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754900466; x=1755505266;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KtvUcm8eKqLg5xx/IzAnE0CR0VtQIYJM5TEZnjUYa44=;
        b=bwCWAV2Pnp8DQVnzHPUbXpM1Lb2+t/9SjWmvRbLOILAhX69OpXtyIOeDUEk8yIwa9V
         bYDNRk3EBe6+xJVu9TjOhJtCpBBxGhKygH+6AwWH/NauuGb1tDW35VzpciOk2ifJ9KFo
         Jxp7av8mK5ogVKZpByY57HgJJejHxUkgiVW9CoJLwKqLtTaSJR9MEUoyA/jzm6RSVxXr
         z9d5sVnHyzn9V0X57KMRH9uqy7UOMBxvJcFYiznkmIfuuWjM9ZPyOJrslSYGQ3SbH771
         z5TrFpYcvFY8tD0VpND8mnE3pE2IHouD0Dh62KTdaAZtKkKSqHs22g0yCDdgIT20Sn5K
         V9zg==
X-Forwarded-Encrypted: i=1; AJvYcCXdI4EUyEtbiQ1dMJj/1OtKheKjN43/iEsXBQ2bvnljfbeY34Z5LGXMHgxgNNiTsr6ze2edfY9BP++VgQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzi4Oj0p5AWa+NBGXJbLWJeul6wUOBE4D8j3D4fEZNAGXCeIdOV
	V7CSNSC6/blIVMirOn7D7j1O5CNMSiuQ5SMhqWvKFXwLclMnR+BK/h+bGc4GksqOVoYbKCa9Eq7
	p0NSxGAuWAL9NEw5T+/kST5v6LVn5B8XCZy5xy7YN8A==
X-Gm-Gg: ASbGncsce8mRdWlYdfTgnWFV/YJXYAx+H9N9iskLRIU1sQJiKHgN5a8yrBIgeExxkNN
	eYW/eadYBdPfFl1wetu++uBeuL2wnDtfX9r9SK3+pHXUn3fG09citFS2JNKhuUJgHbYp4yA8u9t
	m89h7Qzns7DBZqa3mYTstqBS4GmI6ZCuqdNwbFo0rluReWN9+MHjLQhyTzAaMkKOKp6i9fBvCzO
	YB/doCkmrcHp9cZI76Rj1kNWkA5/VEha4aD1CSl
X-Google-Smtp-Source: AGHT+IG/wrH/Z4PP0pZIy9wjFLr0/V/zaFYS1NMbhK2es383D8DYO570WjTh+eTKECcdm1aWBgEKS2c59dA6CxPHBHA=
X-Received: by 2002:a17:902:d54f:b0:240:7247:f738 with SMTP id
 d9443c01a7336-242c1ecb81cmr194687925ad.1.1754900465618; Mon, 11 Aug 2025
 01:21:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYumD2MGjECCv0wx2V_96_FKNtFQpT63qVNrrCmomoPYVQ@mail.gmail.com>
 <aJXebTmgnrWw7Ks4@willie-the-truck>
In-Reply-To: <aJXebTmgnrWw7Ks4@willie-the-truck>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 11 Aug 2025 13:50:53 +0530
X-Gm-Features: Ac12FXw5lvgF03ojOkscaSZZ8MEt6jPVgnO3qRgJ61gr4N1xTZBfV52fTLslDqU
Message-ID: <CA+G9fYseoJU0TNmvSEU4sQTye575Jnq5XiwZZrK9K5z_snVM1A@mail.gmail.com>
Subject: Re: next-20250729: PREEMPT_RT: rock Pi 4b Internal error Oops
 kmem_cache_alloc_bulk_noprof - kernel locking rtmutex.c at __rt_mutex_slowlock_locked
To: Will Deacon <will@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mm <linux-mm@kvack.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, Thomas Gleixner <tglx@linutronix.de>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Vlastimil Babka <vbabka@suse.cz>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Hi Will,

On Fri, 8 Aug 2025 at 16:54, Will Deacon <will@kernel.org> wrote:
>
> Hi Naresh,
>
> On Sat, Aug 02, 2025 at 03:45:51PM +0530, Naresh Kamboju wrote:
> > ## Test log
> > [  527.570253] Unable to handle kernel paging request at virtual
> > address 003f0020f94020a1
> > [  527.570274] Mem abort info:
> > [  527.570277]   ESR = 0x0000000096000004
> > [  527.570282]   EC = 0x25: DABT (current EL), IL = 32 bits
> > [  527.570288]   SET = 0, FnV = 0
> > [  527.570292]   EA = 0, S1PTW = 0
> > [  527.570297]   FSC = 0x04: level 0 translation fault
> > [  527.570302] Data abort info:
> > [  527.570305]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> > [  527.570310]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> > [  527.570316]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> > [  527.570322] [003f0020f94020a1] address between user and kernel address ranges
> > [  527.570330] Internal error: Oops: 0000000096000004 [#1]  SMP
> > [  527.570336] Modules linked in: brcmfmac rockchip_dfi brcmutil
> > cfg80211 snd_soc_hdmi_codec dw_hdmi_i2s_audio dw_hdmi_cec
> > snd_soc_simple_card snd_soc_audio_graph_card hci_uart
> > snd_soc_rockchip_i2s snd_soc_es8316 snd_soc_spdif_tx
> > snd_soc_simple_card_utils btqca rtc_rk808 rockchipdrm btbcm
> > snd_soc_core dw_hdmi_qp bluetooth snd_compress reset_gpio analogix_dp
> > snd_pcm_dmaengine panfrost hantro_vpu dw_mipi_dsi rfkill rockchip_rga
> > drm_shmem_helper drm_dp_aux_bus snd_pcm gpu_sched dw_hdmi pwrseq_core
> > videobuf2_dma_sg v4l2_vp9 snd_timer drm_display_helper v4l2_h264
> > v4l2_jpeg phy_rockchip_pcie snd v4l2_mem2mem cec videobuf2_dma_contig
> > soundcore videobuf2_memops drm_client_lib videobuf2_v4l2
> > drm_dma_helper videobuf2_common rockchip_saradc drm_kms_helper
> > industrialio_triggered_buffer kfifo_buf rockchip_thermal
> > pcie_rockchip_host coresight_cpu_debug fuse drm backlight
> > [  527.570493] CPU: 3 UID: 0 PID: 34254 Comm: mkdir Not tainted
> > 6.16.0-next-20250801 #1 PREEMPT_RT
> > [  527.570502] Hardware name: Radxa ROCK Pi 4B (DT)
> > [  527.570506] pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > [  527.570512] pc : kmem_cache_alloc_bulk_noprof (mm/slub.c:5343
> > (discriminator 1) mm/slub.c:5403 (discriminator 1))
> > [  527.570527] lr : kmem_cache_alloc_bulk_noprof
> > (include/linux/atomic/atomic-arch-fallback.h:457
> > include/linux/atomic/atomic-instrumented.h:33
> > include/linux/kfence.h:127 mm/slub.c:5307 mm/slub.c:5403)
> > [  527.570533] sp : ffff80008e24b8f0
> > [  527.570536] x29: ffff80008e24b930 x28: 00ff000000584610 x27: ffff800082b30538
> > [  527.570545] x26: ffff8000816b64dc x25: 0000000000000cc0 x24: 0000000000000000
> > [  527.570554] x23: 0000000000000004 x22: ffff0000f7579d20 x21: 0000000000000001
> > [  527.570563] x20: 0000000000000001 x19: ffff000000405b00 x18: ffff80008e24bcd0
> > [  527.570572] x17: 0000000000000000 x16: ffff800081e18420 x15: 0000ffffa2670fff
> > [  527.570582] x14: 0000000000000000 x13: 1fffe000017942e1 x12: 0000ffffa2470fff
> > [  527.570591] x11: ffff00000bca1708 x10: 0000000000000001 x9 : ffff8000816e41a4
> > [  527.570600] x8 : ffff80008e24b850 x7 : fefefefefefefefe x6 : ffff800082b30000
> > [  527.570608] x5 : d63f0020f9402021 x4 : ffff0000f7579d58 x3 : 0000000000000000
> > [  527.570617] x2 : 0000000000000000 x1 : 0000000000000100 x0 : 0000000000000080
> > [  527.570627] Call trace:
> > [  527.570631] kmem_cache_alloc_bulk_noprof (mm/slub.c:5343
> > (discriminator 1) mm/slub.c:5403 (discriminator 1)) (P)
> > [  527.570639] mas_alloc_nodes (lib/maple_tree.c:1278)
> > [  527.570651] mas_node_count_gfp (lib/maple_tree.c:1339)
> > [  527.570661] mas_preallocate (lib/maple_tree.c:5538 (discriminator 1))
> > [  527.570667] __split_vma (mm/vma.c:528 (discriminator 1))
> > [  527.570677] vma_modify (mm/vma.c:1633)
> > [  527.570685] vma_modify_flags (mm/vma.c:1650)
> > [  527.570694] mprotect_fixup (mm/mprotect.c:819)
> > [  527.570704] do_mprotect_pkey (mm/mprotect.c:993)
> > [  527.570713] __arm64_sys_mprotect (mm/mprotect.c:1011)
> > [  527.570722] invoke_syscall (arch/arm64/include/asm/current.h:19
> > arch/arm64/kernel/syscall.c:54)
> > [  527.570731] el0_svc_common.constprop.0
> > (include/linux/thread_info.h:135 (discriminator 2)
> > arch/arm64/kernel/syscall.c:140 (discriminator 2))
> > [  527.570737] do_el0_svc (arch/arm64/kernel/syscall.c:152)
> > [  527.570744] el0_svc (arch/arm64/include/asm/irqflags.h:82
> > (discriminator 1) arch/arm64/include/asm/irqflags.h:123 (discriminator
> > 1) arch/arm64/include/asm/irqflags.h:136 (discriminator 1)
> > arch/arm64/kernel/entry-common.c:169 (discriminator 1)
> > arch/arm64/kernel/entry-common.c:182 (discriminator 1)
> > arch/arm64/kernel/entry-common.c:880 (discriminator 1))
> > [  527.570752] el0t_64_sync_handler (arch/arm64/kernel/entry-common.c:899)
> > [  527.570760] el0t_64_sync (arch/arm64/kernel/entry.S:596)
> > [ 527.570772] Code: 1400000c f94002c5 b4000aa5 b9402a60 (f86068a0)
> > All code
> > ========
> >    0: 1400000c b 0x30
> >    4: f94002c5 ldr x5, [x22]
> >    8: b4000aa5 cbz x5, 0x15c
> >    c: b9402a60 ldr w0, [x19, #40]
> >   10:* f86068a0 ldr x0, [x5, x0] <-- trapping instruction
> >
> > Code starting with the faulting instruction
> > ===========================================
> >    0: f86068a0 ldr x0, [x5, x0]
> > [  527.570778] ---[ end trace 0000000000000000 ]---
> > [  527.570800] ------------[ cut here ]------------
>
> If you're able to repro this, please could you see if the patch below
> helps at all?

I applied the patch as suggested, tested it, and confirmed that the reported
regressions are now resolved.

I applied the patch as suggested, tested it, and confirmed the reported
regressions are resolved. Our LKFT CI will continue monitoring and report
back if the issue reoccurs.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

>
> https://lore.kernel.org/r/20250806145611.3962-1-dev.jain@arm.com
>
> Cheers,
>
> Will

- Naresh

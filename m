Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924544A3B
	for <regressions@lists.linux.dev>; Mon, 22 Aug 2022 20:39:27 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-32a09b909f6so327680377b3.0
        for <regressions@lists.linux.dev>; Mon, 22 Aug 2022 13:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=azYpYNhsQdFZ4hTXixgIKWt06patLToUHV+Y876Ymo0=;
        b=EvsqbE/Il9kLi6nxChedGykxC38feEtm+cXu2oDwyfRd19JEPvBdhsxa1fKY75U3Td
         M2NWeIk45MM39nIpoRwg+RTGGhMsb6znDaWf2ukwE61WpsS22xac85KnlmIpkYVG76di
         4NoFxOs+7/wb86ni2UVbyfg/wqnL5eIALu59olOrOFefixudrAgwaFMVJZ1wbg3xUQdr
         IEKFg7gm0RnUUHE8TAy3A2vrbpURpv/25BL84fIXy4CX4Kt7scZoB6yENtNrijGyg0dG
         Afc9Ydgm132+7M3paR7DsI40oMRizvVrXg8+zgzVONiWeqkMqt8wPjb8JYJsbNNsNxsC
         4PKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=azYpYNhsQdFZ4hTXixgIKWt06patLToUHV+Y876Ymo0=;
        b=Mtri8EWtknXe/jU+n8EnLd9hAFIrWktCpDiAci4h1Ne9/ZNDMQdojvYjyfhfJn1+9X
         YsRU2qg8PrPQmw5cdpwX/+AW7I3RD8+YHZm92uOhgmxzVnnAKsl00TZwdDNpoHQnqrsO
         xd751I3mzzxn2Jiro2QS3C+SzAutDjHmuFrWJ8SrTaQZhrb00ligaT/4FeRpmpvYSsyf
         GGOCdGbwWdvKhB4XQgQ1vDpBa/0xaxKKJVqKyxLWC8HWiPUyFONJsZwwWpvXlycG5wGr
         v8TTUhuAhH28FZsF8K4ZLg+cvMQ0SWPuEBdWxG0LFxkTvQnv44df21p9ptS+Nc5i6hQO
         eE2A==
X-Gm-Message-State: ACgBeo3NGijY0kCFmgJ+6I26dvrTym1V+ZEAaTPe+EPN1v8HCRWvrWbC
	HasiXZfPnEDkpZ0TCn2YC1CfgzZ2NY8L2yg0Td3H5w==
X-Google-Smtp-Source: AA6agR4E7Ell9PoZYflisbEDkzwB19P3GP2Kt4RqgwkK7wTEAhZpP/xjVKDvjd6wumEt/3csxI3OKVh3XyTccx/RmPg=
X-Received: by 2002:a25:ef0f:0:b0:695:b3d1:15c1 with SMTP id
 g15-20020a25ef0f000000b00695b3d115c1mr6357909ybd.80.1661200766338; Mon, 22
 Aug 2022 13:39:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYuecPu-n-ujLsv7vL8RjEJA-6rOZjc363+p1oo6v-FKKQ@mail.gmail.com>
In-Reply-To: <CA+G9fYuecPu-n-ujLsv7vL8RjEJA-6rOZjc363+p1oo6v-FKKQ@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Mon, 22 Aug 2022 13:38:50 -0700
Message-ID: <CAGETcx_EpQx-QRtCbbcEDpLHSnNeYysNEnmTOQL4+vb4zzvk4Q@mail.gmail.com>
Subject: Re: Unable to handle kernel NULL pointer dereference at virtual
 address 0000000000000008
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev, Russell King <linux@armlinux.org.uk>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Wang Kefeng <wangkefeng.wang@huawei.com>, 
	Rob Herring <robh@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, Lu Baolu <baolu.lu@linux.intel.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 22, 2022 at 7:00 AM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> The arm64 Qualcomm db410c device boot failed intermittently on
> Linux next-20220822 and Linux mainline 6.0.0-rc1.
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>
> [    0.000000] Linux version 6.0.0-rc1 (tuxmake@tuxmake)
> (aarch64-linux-gnu-gcc (Debian 11.3.0-3) 11.3.0, GNU ld (GNU Binutils
> for Debian) 2.38.90.20220713) #1 SMP PREEMPT @1661110347
> [    0.000000] Machine model: Qualcomm Technologies, Inc. APQ 8016 SBC
> <trim>
> [    3.609382] Loading compiled-in X.509 certificates
> [    3.702306] Unable to handle kernel NULL pointer dereference at
> virtual address 0000000000000008
> [    3.702380] Mem abort info:
> [    3.710225]   ESR = 0x0000000096000004
> [    3.711454] s3: Bringing 0uV into 375000-375000uV
> [    3.712713]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    3.717378] s4: Bringing 0uV into 1800000-1800000uV
> [    3.721289]   SET = 0, FnV = 0
> [    3.727634] l1: Bringing 0uV into 375000-375000uV
> [    3.731266]   EA = 0, S1PTW = 0
> [    3.731278]   FSC = 0x04: level 0 translation fault
> [    3.735046] l2: Bringing 0uV into 1200000-1200000uV
> [    3.739166] Data abort info:
> [    3.742737] l4: Bringing 0uV into 1750000-1750000uV
> [    3.746980]   ISV = 0, ISS = 0x00000004
> [    3.746991]   CM = 0, WnR = 0
> [    3.752504] l5: Bringing 0uV into 1750000-1750000uV
> [    3.754966] [0000000000000008] user address but active_mm is swapper
> [    3.754981] Internal error: Oops: 96000004 [#1] PREEMPT SMP
> [    3.754991] Modules linked in:
> [    3.755002] CPU: 1 PID: 10 Comm: kworker/u8:1 Not tainted 6.0.0-rc1 #1
> [    3.760279] l6: Bringing 0uV into 1800000-1800000uV
> [    3.763370] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
> [    3.763378] Workqueue: events_unbound deferred_probe_work_func
> [    3.767152] l7: Bringing 0uV into 1750000-1750000uV
> [    3.771188] pstate: 40000005 (nZcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    3.771199] pc : pl011_probe+0x30/0x154
> [    3.778480] l8: Bringing 0uV into 1750000-1750000uV
> [    3.783073] lr : amba_probe+0x11c/0x1b0
> [    3.783086] sp : ffff800008073b50
> [    3.783090] x29: ffff800008073b50 x28: 0000000000000000
> [    3.787102] l9: Bringing 0uV into 1750000-1750000uV
> [    3.792712]  x27: 0000000000000000
> [    3.792720] x26: ffff80000af7a368 x25: ffff00000341f00d x24: ffff00003fcdce60
> [    3.798382] l10: Bringing 0uV into 1750000-1750000uV
> [    3.804432] x23: ffff80000adf0fb8 x22: 0000000000000000 x21: ffff000003c02800
> [    3.804449] x20: ffff000003c029b0 x19: 0000000000000000
> [    3.811003] l11: Bringing 0uV into 1750000-1750000uV
> [    3.814850]  x18: ffffffffffffffff
> [    3.814858] x17: 0000000000000000 x16: ffff00003fc4d040 x15: ffff000003c6fb8a
> [    3.814874] x14: ffffffffffffffff
> [    3.822730] l12: Bringing 0uV into 1750000-1750000uV
> [    3.825611]  x13: 00000000000005cf x12: 071c71c71c71c71c
> [    3.825623] x11: 00000000000005cf x10: 0000000000000c00 x9 : ffff8000088ead60
> [    3.831391] l13: Bringing 0uV into 1750000-1750000uV
> [    3.834290]
> [    3.834293] x8 : ffff00000367ad60 x7 : ffff00003fc69ccc x6 : 0000000000000001
> [    3.834310] x5 : ffff80000aa8f000
> [    3.838735] l14: Bringing 0uV into 1750000-1750000uV
> [    3.842798]  x4 : ffff80000aa8f2e8 x3 : 0000000000000000
> [    3.842810] x2 : ffff80000b035380 x1 : 0000000000000000 x0 : ffff000003c02800
> [    3.848640] l15: Bringing 0uV into 1750000-1750000uV
> [    3.851134]
> [    3.851138] Call trace:
> [    3.859837] l16: Bringing 0uV into 1750000-1750000uV
> [    3.863375]  pl011_probe+0x30/0x154
> [    3.863389]  amba_probe+0x11c/0x1b0
> [    3.863400]  really_probe+0xc8/0x3e0
> [    3.871415] l17: Bringing 0uV into 3300000-3300000uV
> [    3.875438]  __driver_probe_device+0x84/0x190
> [    3.875450]  driver_probe_device+0x44/0x100
> [    3.881633] l18: Bringing 0uV into 1750000-1750000uV
> [    3.883860]  __device_attach_driver+0xa4/0x150
> [    3.989109]  bus_for_each_drv+0x84/0xe0
> [    3.992982]  __device_attach+0xb0/0x1f0
> [    3.996714]  device_initial_probe+0x20/0x30
> [    4.000533]  bus_probe_device+0xa4/0xb0
> [    4.004699]  deferred_probe_work_func+0xa8/0xfc
> [    4.008521]  process_one_work+0x1dc/0x450
> [    4.013034]  worker_thread+0x2d0/0x450
> [    4.017200]  kthread+0x108/0x110
> [    4.020844]  ret_from_fork+0x10/0x20
> [    4.024237] Code: 910e0042 d2800013 a9025bf5 aa0003f5 (f9400436)
> [    4.027801] ---[ end trace 0000000000000000 ]---
> [  137.808813] random: crng init done
>

Hi Naresh,

Thanks for the report!

These two patches together should fix the issue:
https://lore.kernel.org/lkml/20220818172852.3548-1-isaacmanjarres@google.com/
https://lore.kernel.org/lkml/20220817184026.3468620-1-isaacmanjarres@google.com/

Can you give them a shot please?

Also, in general, it'd be nice if you could report issues in the
original thread of the patch causing issues. It would make it easier
to keep track of all the issues.

Thanks,
Saravana

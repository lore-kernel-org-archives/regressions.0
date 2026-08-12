Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148B6286409
	for <regressions@lists.linux.dev>; Wed, 12 Aug 2026 05:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786513567; cv=pass; b=pc0sDo01w5WNHuXB1RB2/qkZn3qLntgaWPiJRlnRkQ2rmh8b6GZEswp3aQxFLLdOsYFJO9G+7d/Iae81eST4FbB3sQyMcGGzY9boW6V8bZMmpDaqdL22ZDz+HbLzSTdoifhaaXoKl1V1piG2MjhmUnDTuhP8EWhl1R/qLXNk7Uk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786513567; c=relaxed/simple;
	bh=bFAEj3oT5Ot0NB01sLAK5dFKYoPrSPcsaKh02uyDIVo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nVjY5+SYZbwTYxWdqg3sOdXadB1NERzrZ2akfsPgR0B2xJKipVm0sXZ2SFkXvFQ3XtePg1Od9wDcmhgbiDLNFYbo+ufDdv25rT8V9DHp3Pscsod57gCOKR3RPOArOr/C6v0lPWPgnOGQsnww/YLCFBMvEwcNO7uXRnUqdRVOdbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eCosPS9V; arc=pass smtp.client-ip=74.125.224.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eCosPS9V"
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-66807ba2f0fso1043263d50.3
        for <regressions@lists.linux.dev>; Tue, 11 Aug 2026 22:46:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786513565; cv=none;
        d=google.com; s=arc-20260327;
        b=EeSQzxxGqUCBCRGPi38ky6ciSGRjbzLpLO15bZn8iZkc4UzfzbXmjER13eUtv86EI+
         F2TTEbAFIiGBk/NWmcNPBPEJFZnufAAtOgdT54sWb0Wang+cIT3R6zGnyA/8xI3cDr/7
         Vc+M0w3WtAF5TzVmTgkKMtJcJnp4ZpVwLilc3hRUe/aLXkS0y5PZmZshzdew2D6KZGER
         EY7MNAyB5jq2VcFn0Lrc4VhBa57HM2H4g/TppbLBXm6hRq5WXipeKvG/RPTwf/iFiV2z
         czlVgHU4ZuRwbMWQQ2G/fTizipoWDjSusyM/1+TpZobeMBzR08s5fclCyt3v5izAZdYJ
         hZSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nbAf1OH6bskQS8gheHwIfaPlihycwpspEeaErmRr+CI=;
        fh=l+PH4ic9z9XqOD9FKDAYIZgepHgfXuVo9iKWFWDp7cY=;
        b=r4PYuN+1mfWi0M5knTtZGtchftde0g37EriNXUVeny+plAR2Iz0+Wr6V9BnM5cCQt9
         GOIzCRsrMIuFzI280sRB5sdiPgmnfDya7L2mtqYach9NrNfwUqBzIz20l2JoPEPiuQRx
         62whOTDq5SBat1p3VpbeM6SQiV5WkeYy17AcItZ1rCn6AFJrU5hoSITGaJ3QQSxSzg0j
         qEPooYKoFKEj+ZwGppEpSzQAOEE9kDguVfp2WZdEUlK3EoacwL5Ixy7j+IAXUbkP/aL+
         ftDOa4VHRCKpNMIU3nr1Xk0Dm8YRV/c04ywqh5velPagS0z4UzBNFCUFojbEXk/XQBiG
         I4ig==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786513565; x=1787118365; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nbAf1OH6bskQS8gheHwIfaPlihycwpspEeaErmRr+CI=;
        b=eCosPS9VgssnXccf975uB/sYWrrdlQHYNjaYQxuSRrVbEhN+E9eOVjehrhkfuSz/ig
         gOylS3vybt4XsPMWm0k4eeqnNgxLmKSYJ3rAYYOEB3FDgnkLqPaoTJRXfdnlO5T81XSm
         b6l8oE8CCQDahgnZUJBr/NKBIHDxGkpc24a3Wr5uORFtHAlDApPw3/Sye0WudrUMqZM/
         eZRdN/T6VdmbR/de6X1WT/X5Q7uFrSmEUtKJ3r53dM+M/6nJRvAskS0ZhRkHp3Ir3vrU
         /C9CNwxc0GXGU03sgb2Q8DvO9OgQk/ErgzJnJndLffWgT+J9rWzkJu3bgcIFQe0OpKwd
         6q+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786513565; x=1787118365;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nbAf1OH6bskQS8gheHwIfaPlihycwpspEeaErmRr+CI=;
        b=Fb8Os+4USBmEEHjqwDAebWYDnaXZSIfrc8BrCEeHdBh004C1x8qhQlqjhdK0BAJgIn
         BeBGK0cZa6k2i1ynqVK/mimGW3SFGCxI+wdealTV0M9mV0rbZ1+q8h80xlcYZfG9P969
         iW5RnNhXGuDvPsOSdDgX8eG0wsKbuKKrEsbViD7uMK5ADghBmOgIGk3R2dQQAs6Lsl1y
         iVJZZRwTCMP6I/GDNIvDawudTix7IgJTkJhTMp3hEMeTn+tGUgGGZ+1q5iAFUqyZl2YP
         TgiBOCec2jHpsZ3xgoGDfqfNTfVGSEN2D+NzpLiiJ+hHArD8M4ekVtilYqsFK0XgSysy
         Lnjw==
X-Forwarded-Encrypted: i=1; AHgh+RpQt+0M5iGoo1CW4g4tQznqC7v8PVrejcVaZwRgH2ykl3/rlsSJg/JhOzBEJR0dpzd21RhdOFqdqsC9Ng==@lists.linux.dev
X-Gm-Message-State: AOJu0YybshfRdoIcn5qTQWoj6G1NnFLtwV5rKE8b01q5fMWgP3U4JsmC
	Jr/FRUdgZeVFiJUX9VlReBTlTgtZKe1xrc8AgaeRKEwWoCfxPkHYbGYkrwP9hpLi+3sbI7p4thR
	6v1/8qadRej29ctMOU4N8YG1wGUke35A=
X-Gm-Gg: AR+sD11paPh8n3AZ5hCCQZJf7U+8Jv36YKO4OuwZR1iZK957fLNqu6ktu52kYpMjzHE
	nySINUohNy74YflZqhZRCGESKk3dFSNUN6+IsB6rrp/Nf7nfz8MsGClaykCZw49QSYewiKV88Gl
	ie6XfS7s6xMBoHAFR9+Qo7Ltxk0eDnjO+PHVbAASXp2+zTpy8VcOXyWYbGjC+EKg78KInANEA5f
	dW+04AEf9u8laJ+0oZnV61qY/c+Cb/N5vbdbZei0SCo2JmVgy0y1z3UxLe5/j9Dy3hONfSzI20h
	S2muJIdqc/VCjpSgjUFV1ETbEMQxZF2rnPmkE8mk5p43+tWnpGaBYlM5KEarQZVSLJVqm+niu1u
	VnkGRQ3fYt7wfvJS/qxHAXgX17mdTELJ1gWHAQG+2PJ8saY77i4gTv0zsZAGgzezDgq4HM6OFoz
	XvDWUYi2BAdBBIsS3OM9neFkeoSf708F4=
X-Received: by 2002:a53:e317:0:b0:66b:331c:b040 with SMTP id
 956f58d0204a3-66b34308774mr945065d50.31.1786513564817; Tue, 11 Aug 2026
 22:46:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260718054330.8975-2-hardikprakash.official@gmail.com>
 <amhodWpAI3K6aeBH@zenone.zhora.eu> <b4a4eadb-282f-464c-843a-19d415a34d0c@leemhuis.info>
 <CANTFpSW+w1GZMbLXszuqZFCZjeVJfFG2bc1vJad+OMzsy-CPCg@mail.gmail.com>
 <aneQvMN_Zet2b62n@ashevche-desk.local> <b5b95476-636f-40b1-8575-47918169b7bb@leemhuis.info>
 <CANTFpSWzV9tzMwc2cURCQBhpZmrv1SsZqnwBEu0jt=ZQWfvWgQ@mail.gmail.com>
 <1a209e14-05c6-4796-a8fc-d0c3a776520d@leemhuis.info> <CANTFpSWnTjoTS8hBOvVM_w3pWHyOiBhch_GXe_mG-d56WeF-0w@mail.gmail.com>
 <5a5f7f58-b35b-407f-a5e5-293a88cafcc0@leemhuis.info> <CANTFpSWTkwmb3F9UnZmeaLizH-cC6evXD=kd1eNwJWkCfyj8DQ@mail.gmail.com>
 <a23375c9-d188-4737-bfa0-f10e66ae7f08@leemhuis.info>
In-Reply-To: <a23375c9-d188-4737-bfa0-f10e66ae7f08@leemhuis.info>
From: Hardik Prakash <hardikprakash.official@gmail.com>
Date: Wed, 12 Aug 2026 11:15:51 +0530
X-Gm-Features: AUfX_mxGcSh0iydmWZRih7TWDVib4qa26X7gdx5wLOHjLubMgF3h3r3F1m25t1M
Message-ID: <CANTFpSWhqkw4735EFyQ4XoSEiqsgCKt4jTxH4SDO-m3=ybwccw@mail.gmail.com>
Subject: Re: i2c designware change broke touchpad of a thinkpad
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Andi Shyti <andi.shyti@kernel.org>, 
	linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org, wsa@kernel.org, 
	mario.limonciello@amd.com, brgl@bgdev.pl, basavaraj.natikar@amd.com, 
	linusw@kernel.org, nathan@kernel.org, chaitanya.kumar.borah@intel.com, 
	Linux kernel regressions list <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Wed, 12 Aug 2026, Thorsten Leemhuis wrote:
> While we wait for Mario a quick question: Should we revert
> the culprit for 7.2 and reapply it later once we sorted this out? Of
> course I'll continue to help debugging this.
>
> If it was just me I'd say "don't bother", but these kind of Thinkpads
> are what some Linux users frequently buy, so I fear that other people
> will run into this if the culprit makes it into 7.2.

I agreed, I'd rather have this reverted than ship a known regression.

Andi, WSA -- given 7.2 is close, could this go out as a revert now? I'll
keep working the AMD bus-timing angle with Thorsten and Mario, and
we can resubmit a corrected fix for a later release once it's actually
understood.

Thanks,
Hardik

On Wed, 12 Aug 2026 at 10:51, Thorsten Leemhuis
<regressions@leemhuis.info> wrote:
>
> On 8/12/26 06:59, Hardik Prakash wrote:
> > On Mon, 10 Aug 2026, Thorsten Leemhuis wrote:
> >> Did a fresh boot and uploaded the dmesg again as well just in case:
> >> https://www.leemhuis.info/files/misc/dmesg_patch_dyndbg2
> >> https://www.leemhuis.info/files/misc/lsmod
> >> https://www.leemhuis.info/files/misc/interrupts
> >
> > Thanks. Second boot reproduces the identical pattern: device_is_bound()
> > =true at 1.132s, lost arbitration at 2.139s -- same ~1s gap as the first
> > capture, so this is consistent and reproducible, not a one-off.
> >
> > interrupts rules out simple IRQ-line sharing: AMDI0010:01 has its own
> > dedicated line (IRQ 11), separate from AMDI0010:00 (IRQ 10) and every
> > amd_gpio ACPI:Event line. psp-1 exists (IR-PCI-MSIX-0000:c3:00.2) but
> > shows zero recorded activity on any CPU.
> >
> > Since lost arbitration means an actual SDA/SCL-level collision (not an
> > IRQ conflict), and there's no shared IRQ or visible PSP activity, if
> > something else is touching this bus it's happening below what Linux's
> > interrupt accounting can see -- which is why I wanted your take, Mario.
> > Does this match a known pattern of firmware (PSP/EC) briefly taking
> > this bus during boot on AMD platforms?
>
> Thx again. While we wait for Mario a quick question: Should we revert
> the culprit for 7.2 and reapply it later once we sorted this out? Of
> course I'll continue to help debugging this.
>
> If it was just me I'd say "don't bother", but these kind of Thinkpads
> are what some Linux users frequently buy, so I fear that other people
> will run into this if the culprit makes it into 7.2.
>
> Ciao, Thorsten
>
> > On Mon, 10 Aug 2026 at 12:18, Thorsten Leemhuis <linux@leemhuis.info> wrote:
> >>
> >> On 8/10/26 07:54, Hardik Prakash wrote:
> >>> On Sun, 9 Aug 2026, Thorsten Leemhuis wrote:
> >>>> Sorry, picked the wrong file while preparing the mail, it's here:
> >>>> https://www.leemhuis.info/files/misc/dmesg_patch_dyndbg
> >>>
> >>> Thanks, that's the one. Full timeline from that boot:
> >>>
> >>>   0.619s  AMDI0010:00 and AMDI0010:01 defer (AMDI0030:00 not registered)
> >>>   1.136s  Retry succeeds: device_is_bound()=true for AMDI0030:00,
> >>>           confirmed for all three children (XXXX0000:00, SYNA8018:00,
> >>>           NXP1001:00)
> >>>   2.222s  lost arbitration on AMDI0010:01 (x3)
> >>>   3.260s  controller timed out, HID descriptor fetch fails
> >>>
> >>> The dependency check itself is behaving correctly here -- it defers,
> >>> then correctly confirms AMDI0030:00 is bound before letting probe
> >>> continue. The arbitration failure happens over a second *after* that,
> >>> when the touchpad attempts its actual first transaction.
> >>>
> >>> So this doesn't look like a logic bug in the check itself. My read: by
> >>> delaying dw_i2c_plat_probe() by ~500ms (correctly, for GPIO's sake),
> >>> something else ends up contending for the AMDI0010:01 bus by the time
> >>> the touchpad's first transaction actually happens -- a window that
> >>> the original (undeferred, earlier) probe attempt apparently avoided.
> >>>
> >>> Mario -- does this look like a known AMD I2C/PSP semaphore contention
> >>> pattern to you? Wondering if there's a shared bus/firmware consumer
> >>> that could explain a ~1s-later collision like this, independent of
> >>> the GPIO controller itself being ready.
> >>>
> >>> Thorsten, if you have it handy: /proc/interrupts and lsmod from this
> >>> boot would help narrow down what else might be touching that bus
> >>> around the 2.2s mark.
> >>
> >> Did a fresh boot and uploaded the dmesg again as well just in case:
> >>
> >> https://www.leemhuis.info/files/misc/dmesg_patch_dyndbg2
> >> https://www.leemhuis.info/files/misc/lsmod
> >> https://www.leemhuis.info/files/misc/interrupts
> >>
> >> Ciao, Thorsten
> >>> On Mon, 10 Aug 2026 at 11:06, Thorsten Leemhuis <linux@leemhuis.info> wrote:
> >>>>
> >>>> On 8/10/26 07:23, Hardik Prakash wrote:
> >>>>> On Sat, 8 Aug 2026, Thorsten Leemhuis wrote:
> >>>>>> https://www.leemhuis.info/files/misc/dmesg-master-plus_revert
> >>>>>>
> >>>>>> [    0.619018] i2c-dw-gpio-dbg: i2c_dw_check_gpio_dependencies(AMDI0010:00)
> >>>>>> [...]
> >>>>>> [    1.136010] i2c-dw-gpio-dbg: device_is_bound()=true for AMDI0030:00
> >>>>>
> >>>>> Thanks, this trace looks correct on its face (defer at 0.619s, retry
> >>>>> succeeds at 1.122-1.136s), but the link above points to the same file
> >>>>> you sent last round (the master+revert baseline, no debug patch, no
> >>>>> i2c-dw-gpio-dbg lines in it at all) rather than this new capture.
> >>>>>> Could you share the full, unfiltered dmesg from this exact boot (the
> >>>>> one with the debug patch applied)? I need to see where
> >>>>> "lost arbitration" falls relative to the trace above.
> >>>>
> >>>> Sorry, picked the wrong file while preparing the mail, it's here:
> >>>> https://www.leemhuis.info/files/misc/dmesg_patch_dyndbg
> >>>>
> >>>> Ciao, Thorsten
> >>>>
> >>>>> Separately, from your DSDT: NFC1 (NXP1001), which shows up as a child
> >>>>> of AMDI0010:01 in your trace, declares its _CRS as a raw resource
> >>>>> buffer containing three GPIO resources referencing \_SB.GPIO -- one
> >>>>> GpioIo and two separate GpioInt entries. Not sure yet if that's
> >>>>> relevant, but it's a pattern I haven't seen on my hardware
> >>>>> which I've tested against.
> >>>>>
> >>>>> Thanks,
> >>>>> Hardik
> >>>>>
> >>>>> On Sun, 9 Aug 2026 at 21:49, Thorsten Leemhuis <linux@leemhuis.info> wrote:
> >>>>>>
> >>>>>> On 8/8/26 22:25, Andy Shevchenko wrote:
> >>>>>>> On Sat, Aug 08, 2026 at 10:31:28PM +0530, Hardik Prakash wrote:
> >>>>>>>> On Fri, 7 Aug 2026, Thorsten Leemhuis wrote:
> >>>>>>>>> This became 0a4bb2abc3e56d ("i2c: designware: defer probe if child
> >>>>>>>>> GpioInt controllers are not bound") and causes a regression for me: the
> >>>>>>>>> Touchpad in my ThinkPad T14s Gen 4 (AMD) stopped working. From the
> >>>>>>>>> kernel log:
> >>>>>>>>>
> >>>>>>>>> i2c_designware AMDI0010:01: i2c_dw_handle_tx_abort: lost arbitration
> >>>>>>>>> i2c_designware AMDI0010:01: controller timed out
> >>>>>>>>> i2c_hid_acpi i2c-SYNA8018:00: failed to fetch HID descriptor: -110
> >>>>>>>>> i2c_hid_acpi i2c-SYNA8018:00: Failed to fetch the HID Descriptor
> >>>>>>>>>
> >>>>>>>>> Reverting this change in current mainline/master (f9a2394a23482) fixed
> >>>>>>>>> things for me. Full dmesg of current master and master+revert can be
> >>>>>>>>> found here:
> >>>>>>>>>
> >>>>>>>>> https://www.leemhuis.info/files/misc/dmesg-master
> >>>>>>>>> https://www.leemhuis.info/files/misc/dmesg-master-plus_revert
> >>>>>>>> [...]
> >>>>>>>> Two things that would help narrow this down, whenever you have a moment:
> >>>>>>
> >>>>>> Thx for looking into this. Here we go:
> >>>>>>
> >>>>>>>> 1. A DSDT dump
> >>>>>>
> >>>>>> https://www.leemhuis.info/files/misc/dsdt.dsl
> >>>>>>
> >>>>>>>> 2. A dmesg with dynamic debug from a kernel built with the attached
> >>>>>>>>    patch on top of current mainline/master
> >>>>>>
> >>>>>> https://www.leemhuis.info/files/misc/dmesg-master-plus_revert
> >>>>>>
> >>>>>> [    0.619018] i2c-dw-gpio-dbg: i2c_dw_check_gpio_dependencies(AMDI0010:00)
> >>>>>> [    0.619018] i2c-dw-gpio-dbg: check_child_gpioint(adev=XXXX0000:00)
> >>>>>> [    0.619076] i2c-dw-gpio-dbg: GpioInt resource_source=\_SB.GPIO (len=10)
> >>>>>> [    0.619079] i2c-dw-gpio-dbg: acpi_fetch_acpi_dev() succeeded,
> >>>>>> device=AMDI0030:00
> >>>>>> [    0.619080] i2c-dw-gpio-dbg: gpio_device_find_by_fwnode() returned
> >>>>>> NULL, deferring
> >>>>>> [    0.619082] i2c-dw-gpio-dbg: check_child_gpioint ret=-517 (defer)
> >>>>>> [    0.619102] i2c-dw-gpio-dbg: i2c_dw_check_gpio_dependencies(AMDI0010:01)
> >>>>>> [    0.619104] i2c-dw-gpio-dbg: check_child_gpioint(adev=SYNA8018:00)
> >>>>>> [    0.619159] i2c-dw-gpio-dbg: GpioInt resource_source=\_SB.GPIO (len=10)
> >>>>>> [    0.619162] i2c-dw-gpio-dbg: acpi_fetch_acpi_dev() succeeded,
> >>>>>> device=AMDI0030:00
> >>>>>> [    0.619162] i2c-dw-gpio-dbg: gpio_device_find_by_fwnode() returned
> >>>>>> NULL, deferring
> >>>>>> [    0.619164] i2c-dw-gpio-dbg: check_child_gpioint ret=-517 (defer)
> >>>>>> [    1.122517] i2c-dw-gpio-dbg: i2c_dw_check_gpio_dependencies(AMDI0010:00)
> >>>>>> [    1.122523] i2c-dw-gpio-dbg: check_child_gpioint(adev=XXXX0000:00)
> >>>>>> [    1.122625] i2c-dw-gpio-dbg: GpioInt resource_source=\_SB.GPIO (len=10)
> >>>>>> [    1.122636] i2c-dw-gpio-dbg: acpi_fetch_acpi_dev() succeeded,
> >>>>>> device=AMDI0030:00
> >>>>>> [    1.122639] i2c-dw-gpio-dbg: gpio_device_find_by_fwnode() succeeded
> >>>>>> [    1.122642] i2c-dw-gpio-dbg: device_is_bound()=true for AMDI0030:00
> >>>>>> [    1.135894] i2c-dw-gpio-dbg: i2c_dw_check_gpio_dependencies(AMDI0010:01)
> >>>>>> [    1.135898] i2c-dw-gpio-dbg: check_child_gpioint(adev=SYNA8018:00)
> >>>>>> [    1.135976] i2c-dw-gpio-dbg: GpioInt resource_source=\_SB.GPIO (len=10)
> >>>>>> [    1.135980] i2c-dw-gpio-dbg: acpi_fetch_acpi_dev() succeeded,
> >>>>>> device=AMDI0030:00
> >>>>>> [    1.135983] i2c-dw-gpio-dbg: gpio_device_find_by_fwnode() succeeded
> >>>>>> [    1.135985] i2c-dw-gpio-dbg: device_is_bound()=true for AMDI0030:00
> >>>>>> [    1.135987] i2c-dw-gpio-dbg: check_child_gpioint(adev=NXP1001:00)
> >>>>>> [    1.136005] i2c-dw-gpio-dbg: GpioInt resource_source=\_SB.GPIO (len=10)
> >>>>>> [    1.136008] i2c-dw-gpio-dbg: acpi_fetch_acpi_dev() succeeded,
> >>>>>> device=AMDI0030:00
> >>>>>> [    1.136009] i2c-dw-gpio-dbg: gpio_device_find_by_fwnode() succeeded
> >>>>>> [    1.136010] i2c-dw-gpio-dbg: device_is_bound()=true for AMDI0030:00
> >>>>>>
> >>>>>> HTH, Ciao, Thorsten
> >>>>>>
> >>>>>>>> On Fri, 7 Aug 2026 at 19:37, Thorsten Leemhuis <linux@leemhuis.info> wrote:
> >>>>>>>>> On 7/28/26 10:30, Andi Shyti wrote:
> >>>>>>>>>> On Sat, Jul 18, 2026 at 11:13:31AM +0530, Hardik Prakash wrote:
> >>>>>>>>>>> I2C controllers may have child devices with GpioInt resources that
> >>>>>>>>>>> depend on GPIO controllers being fully initialized. If the I2C
> >>>>>>>>>>> controller probes and enumerates children before the referenced GPIO
> >>>>>>>>>>> controller has completed probe, GPIO interrupts may not be properly
> >>>>>>>>>>> configured, leading to device failures.
> >>>>>>>>>>>
> >>>>>>>>>>> On Lenovo Yoga 7 14AGP11, the WACF2200 touchscreen (child of
> >>>>>>>>>>> AMDI0010:02) has a GpioInt resource pointing to GPIO 157 on the
> >>>>>>>>>>> pinctrl-amd controller (AMDI0030:00). When i2c-designware probes
> >>>>>>>>>>> AMDI0010:02 before pinctrl-amd finishes initializing, I2C transactions
> >>>>>>>>>>> fail with lost arbitration errors:
> >>>>>>>>>>>
> >>>>>>>>>>>   0.285952  amd_gpio_probe: registering gpiochip  <- GPIO chip visible
> >>>>>>>>>>>   0.287121  amd_gpio_probe: requesting parent IRQ <- probe still running
> >>>>>>>>>>>   0.301454  AMDI0010:02 dw_i2c_plat_probe: start  <- races here
> >>>>>>>>>>>   2.348157  lost arbitration
> >>>>>>>>>>>
> >>>>>>>>>>> Add a dependency check that walks ACPI child devices and defers probe
> >>>>>>>>>>> until any referenced GPIO controller is bound.
> >>>>>>>
> >>>>>>> [...]
> >>>>>>>
> >>>>>>>>> #regzbot introduced: 0a4bb2abc3e56d
> >>>>>>>>> #regzbot title i2c: designware: ThinkPad touchpad broke
> >>>>>>>
> >>>>>>
> >>>>>
> >>>>
> >>>
> >>
> >
>

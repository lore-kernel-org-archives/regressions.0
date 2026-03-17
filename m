Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6290033290F
	for <regressions@lists.linux.dev>; Tue, 17 Mar 2026 17:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773768103; cv=none; b=KtOpejEehuUKo+T/JaEmqNtggdBiTWBF8P35QUu3EdiRaUppw1W0dDfdSSYKPm55uUKCCrvG/+8DCfV6wjW6zWESeMmtsFOvj7MANq1NA5K6Gbv83DyhnylH2jwpkYhkA/Kny/urOPLNbPpR8U0XgX2PuKAOlFgY28NRz44V6gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773768103; c=relaxed/simple;
	bh=vX1kx7VM5hkljShUyb582SJ3E0ltV+g/Ivrd5dmpxBU=;
	h=Date:To:From:Subject:Message-ID:MIME-Version:Content-Type; b=WYPwUkGt5XyDDGws8vEQKpgCOV66crewfhQ8KcsxQSGmQtLq8OMFNmWaytaPWfFjWd7Y3d/ktNpmVk+aOE13PVBOiFPyk6/IKTFCdr4zA8SJzmSNvNzHKJ/mJvyq8eaarm/TzZq7pnNvrSgHhACjcV4p3e02LPKPZynYtLtXRQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=JHikKbXm; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="JHikKbXm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1773768090; x=1774027290;
	bh=ormOhq7y7cFOvw2DX0AmoKb1gOKEJgoMDD9goXSLiok=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=JHikKbXm7BUHKdMSZzwzn0CzvxiemMTeG4H5Bw/A9BXP3iDQbIFJNuEVxlwsAwk4E
	 81qUTnnM9cLnSQ9QKgOZAtlpr00ZGuOc6tGSUbIKhufojJV1pgUBFuOoe4U9GWpUyT
	 ZUE//pciDwFnG6UVJt0v5lGPDJelT5WkxZvFfad3rfnEb3rGVKLZbCI7juxFPs3FM/
	 UDzkK19cZaQ2/ffHFOlfiv0CeOOPnPDe/9wYulq4cBL6Iifyb1v5fbRBYUwh8kbD3Q
	 qsbuwxWT9iZRmzNmDh0A91+z+MBRQD6kgr7kZnNsEp4Ubz5dmSp67T66abb+J7gZ0F
	 lUbuOEGbMHXHg==
Date: Tue, 17 Mar 2026 17:21:26 +0000
To: regressions@lists.linux.dev
From: Tj <tj.iam.tj@proton.me>
Subject: Regression: scsi: ufs: core: Avoid IRQ thread wakeup during active UIC command
Message-ID: <abmNkRC_vSVaP2sC@mail.iam.tj>
Feedback-ID: 113488376:user:proton
X-Pm-Message-ID: d5fa4b915663b355b53e7f60a42c17cc115ec5fa
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

#regzbot ^introduced: 6475cfb81fc4f6175b6d15d1c205a5168dc10b46

I've had to revert this commit because it breaks UFS on Samsung Book2
W737 sdm850. Below is transcribed from a blurry video so apologies if it
is not exact:

| BUG: Invalid wait context |
ufshcd-qcom 1d84000.ufshc: uic cmd 0x1 with arg3 0x0 completion timeout
7.0.0-rc3-next-202603110sdm845 #103 Not tainted
-----------------------------
ufshcd-qcom 1d84000.ufshc: dme-get: attr-id 0x41 failed 0 retries
swapper/0/0 is trying to lock:
ffff000087ba4048 (shost->host_lock)(....)-(3:3). at: ufshcd_sl_intr+0x3dc/0=
x7a0
other info that might help us debug this:
ufshcd-qcom 1d84000.ufshc: uic cmd 0x1 with arg3 0x0 completion timeout
context-(2:2)
ufshcd-qcom 1d84000.ufshc: dme-get: sttr-id 0x41 failed 0 retries
no locks held by swapper/0/0.
ufshcd-qcom 1d84000.ufshc: ufs_wcom_check_hibern8: unable to get TX_FSM_STA=
TE, err -110
stack backtrace:
CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 7.0.0-rc3-next-20260311-sd=
m845 #103 PREEMPTLAZY ...${unclear}
Hardware name: SAMSUNG ELECTRONICS CO,. LTD. Galaxy Book2/SM-W737YZSBTEL, B=
IOS P02AHG.005.190624.WY.1359 06/24/2019
Call trace:
  show_stack+
  dump_stack_lvl
  dump_stack
ufshcd-qcom 1d84000.ufshc: uic cmd 0x1 with arg3 0x0 completion timeout
  __lock_acquire
  lock_acquire
  _raw_spin_lock_irqsave
  ufshcd_sl_intr
  ufshcd_intr
  __handle_irq_event_percpu
  handle_irq_event
  handle_fast???_irq
ufshcd-qcom 1d84000.ufshc: dme-get: attr-id 0xa00b failed 0 retries
  handle_irq_desc
  generic_handle_domain_irq
  gic_handle_irq
  do_interrupt_handler
ufshcd-qcom 1d84000.ufshc: hw clk gating enabled failed
  el1_interrupt
  el1h_64_irq_handler
  el1h_64_irq
scsi host0: ufshcd
  handle_softirqs
  __do_softirq
  ___do_softirq
  do_softirq_own_stack
  __irq_exit_rcn
  irq_exit_rcn
ufshcd-qcom 1d84000.ufshc: uic cmd 0x1 with arg3 0x0 completion timeout
  el1_interrupt
  el1h_64_irq_handler
  el1h_64_irq
  cpuidle_enter_state
  cpuidle_enter
  do_idle
  cpu_startup_entry
  rest_init
  start_kernel
  __primary_switched
ufshcd-qcom 1d84000.ufshc: cfg core clk ctrl failed
ufshcd-qcom 1d84000.ufshc: No active UIC command. Maybe a timeout occurred?
ufshcd-qcom 1d84000.ufshc: No active UIC command. Maybe a timeout occurred?
ufshcd-qcom 1d84000.ufshc: ufshcd_threaded_intr: Unhadled interrupt 0x00000=
000 (0x00000400, 0x00000400)



Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADC8130E58
	for <regressions@lists.linux.dev>; Mon, 23 Jun 2025 14:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750690607; cv=none; b=NNSS75FxZg70zI2uhNuI+j28bgKHVqc1EXp/6t3LOO81CLCiQUwl5njifQskZb7ZU4dC5q31aYekXttG6aw3JAN4b4BsiaOSqe2UJkN51owjIRnfnIg0csKVWhoEPEN18teh6e1PpZ1OxUHxfMmbkLGPyYRq/jd1ehIwJzEdVuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750690607; c=relaxed/simple;
	bh=PTheay7cqvAMWhBs58Vb6OQ7Z7KjQixzFF93fRAnSyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZAOjGuOTkf9umv7g2BT8uFjoaiYg/UvkBSyBE1Ma0UbXVOn5cyqNKKRCkLnsr6geR4vSU+BaA5fQLvONL8dy18FB/iDn81ETN3ue6zSkloDlyV4+VN7A48HSFpwTeJZ/JXcXbFv5WhfrPuH/1T844YBkgcBsNdXyFYsseZFzqT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PmOm9TTp; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PmOm9TTp"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2366e5e4dbaso35021575ad.1
        for <regressions@lists.linux.dev>; Mon, 23 Jun 2025 07:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750690605; x=1751295405; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KTLGxkEd9m/ohum4J2ofOjH/RIT6fhplw5eh9xDXXuk=;
        b=PmOm9TTpAaKqk5AjJ7GgK9o8AsUc8wE7PBFMxzoypmDnTFXI7GOntMSlbnB8kZgn9o
         j9OOie46XdUgOYBhshEXQ7b5/vbS7d1LFSMmazmGM1RwxFhrB56frqBaiTdzpdgk1EBr
         nPHJvDWlamZWz+Yu9AegNV+wbpATxzLPVEJREtPKXcgzNwG7CSSqxplY5tvr4aSBKuE/
         mEEWouWqBGjWPxlq8DjQebTyPe1tPLTE+iavVHuQg7ZAO5ydl++UFvLFf3jOGl1mrO3+
         ejkVCKBVd05MQDNbLm1VNjiOaJFyK7+hqG3njbRyOEziT8VD6mNNsMPFW1rJ0ehw85vI
         M8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750690605; x=1751295405;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KTLGxkEd9m/ohum4J2ofOjH/RIT6fhplw5eh9xDXXuk=;
        b=tuL3QnHY1qm0/lkeXw6pnlDSI2zP1H6h18ZQBCSEAEuTdpSshY0J3U0gnnxSRvItl/
         BoAvhQWTlOHZ529VOXpjqHoA5BP3rXV8eD5JCSzzz4wvO+K1MMny+rS3Lw7DZB3wDEMb
         tuArOdgAWlV+lYSuDTbj/g6yW2GO+0vAeyGWme1s6HB97uaw8bo1IY8uZzSfHA1cEPR2
         eH2KoIsN2q1d33mI+4mkd7frji19hCD9mm6ujH/HFLKucVFgXCxANF879ar34jUq/5Wt
         xWhP7Yn9YY0r6n0QLEQFeYLKDoTiXHeKXHlVDrvX3A7VfpXr4hcR+dFpega70VHu12yW
         Ws5w==
X-Forwarded-Encrypted: i=1; AJvYcCUyhmYSXnN8y/uuk+4kx0mOBnP3VjCtK3n+eQzuozNNPQt7mvwJGUgdqbkxiPPqYnvWh67XFEbar8vj4Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzU5fjjcKtCM0S0QdAqfq5aoI3QJ90g2+Rd8z31COMnM2q2ML78
	Dfvh+jtao6H7SRa5pVdIk3CI9c8fz9ivwDTwhNvdmMklgICdTPEqCj4S4PX9qnBs5eWLiy8qFK0
	N+MvjuWgC7dSinxEtU8HY24XMkW96GV0yk8iK4a0bLw==
X-Gm-Gg: ASbGncuq1UXBWF844cYSU1p1wglrsKExFzZinV4Ymde7+M28nzsJSMGoWS/3eU2xVcU
	prieFK1BkJEntAx73UFwtuybsM6kA4bibQI+ehYLvxlTR1QTxf00yrUOBmYUTDrxuFtyJIPSBcB
	37T0R0cfNKWaORAfLbrkWt5AR0Wfdh1ysdepjn6z49Os/h0V5ZuZAhDn0Dbzb/EZ1f/UNOVgtwz
	u3Z
X-Google-Smtp-Source: AGHT+IGN6hc0miGmfJoHfDU2FV0k8m6pfGQp/A0ZiCKWE/+McAFvqhxhob22QI70xmwcMwgDJ9SU8M+KsoVRIAs1OaU=
X-Received: by 2002:a17:90b:2e51:b0:313:f995:91cc with SMTP id
 98e67ed59e1d1-3159f44ecf0mr17824061a91.2.1750690605304; Mon, 23 Jun 2025
 07:56:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYt0MfXMEKqHKHrdfqg3Q5NgQsuG1f+cXRt83d7AscX5Fw@mail.gmail.com>
 <20250623-salat-kilowatt-3368c5e29631@brauner>
In-Reply-To: <20250623-salat-kilowatt-3368c5e29631@brauner>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 23 Jun 2025 20:26:32 +0530
X-Gm-Features: Ac12FXyxH7JtOsEuDOUVutNxwzlGKjtIs9Inv83qyi2-2ZPb1hg6eu6Cm1sN6DE
Message-ID: <CA+G9fYsfOg9uiwgYA1mHkBzwEkU6eLweneWJhFybt+X1Ekp55Q@mail.gmail.com>
Subject: Re: next-20250623: arm64 devices kernel panic Internal error Oops at
 pidfs_free_pid (fs/pidfs.c:162)
To: Christian Brauner <brauner@kernel.org>
Cc: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, linux-fsdevel@vger.kernel.org, 
	Jann Horn <jannh@google.com>, Josef Bacik <josef@toxicpanda.com>, 
	Alexander Mikhalitsyn <alexander@mihalicyn.com>, Jeff Layton <jlayton@kernel.org>, 
	Daan De Meyer <daan.j.demeyer@gmail.com>, Lennart Poettering <lennart@poettering.net>, 
	Mike Yuan <me@yhndnzj.com>, =?UTF-8?Q?Zbigniew_J=C4=99drzejewski=2DSzmek?= <zbyszek@in.waw.pl>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Jun 2025 at 18:26, Christian Brauner <brauner@kernel.org> wrote:
>
> On Mon, Jun 23, 2025 at 05:29:38PM +0530, Naresh Kamboju wrote:
> > Regressions on arm64 devices and qemu-arm64 while running LTP controllers
> > and selftests cgroup test cases the following kernel Panic Internal error oops
> > found on the Linux next-20250623 tag.
> >
> > Regressions found on arm64 device
> >   - Kernel Panic Internal oops @ LTP controllers
> >   - Kernel Panic Internal oops @ selftest cgroups
> >
> > Test environments:
> >  - Dragonboard-410c
> >  - e850-96
> >  - FVP
> >  - Juno-r2
> >  - rk3399-rock-pi-4b
> >  - qemu-arm64
> >
> > Regression Analysis:
> >  - New regression? Yes
> >  - Reproducibility? Yes
> >
> > Boot regression: arm64 devices kernel panic Internal error Oops at
> > pidfs_free_pid (fs/pidfs.c:162)
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > ## Test log
> > [   67.087303] Internal error: Oops: 0000000096000004 [#1]  SMP
> > [   67.094021] Modules linked in: snd_soc_hdmi_codec venus_enc
> > venus_dec videobuf2_dma_contig pm8916_wdt qcom_wcnss_pil
> > coresight_cpu_debug coresight_tmc coresight_replicator qcom_camss
> > coresight_stm snd_soc_lpass_apq8016 msm qrtr coresight_funnel
> > snd_soc_msm8916_digital snd_soc_lpass_cpu coresight_tpiu
> > snd_soc_msm8916_analog videobuf2_dma_sg stm_core coresight_cti
> > snd_soc_lpass_platform snd_soc_apq8016_sbc venus_core
> > snd_soc_qcom_common qcom_q6v5_mss v4l2_fwnode coresight snd_soc_core
> > qcom_pil_info v4l2_async snd_compress llcc_qcom snd_pcm_dmaengine
> > ocmem qcom_q6v5 v4l2_mem2mem videobuf2_memops snd_pcm qcom_sysmon
> > drm_exec adv7511 snd_timer videobuf2_v4l2 gpu_sched qcom_common snd
> > videodev drm_dp_aux_bus qcom_glink_smem soundcore qcom_spmi_vadc
> > mdt_loader drm_display_helper qnoc_msm8916 qmi_helpers
> > videobuf2_common qcom_vadc_common qcom_spmi_temp_alarm rtc_pm8xxx
> > qcom_pon qcom_stats mc cec drm_client_lib qcom_rng rpmsg_ctrl
> > display_connector rpmsg_char phy_qcom_usb_hs socinfo drm_kms_helper
> > rmtfs_mem ramoops
> > [   67.094437]  reed_solomon fuse drm backlight ip_tables x_tables
> > [   67.189084] CPU: 3 UID: 0 PID: 0 Comm: swapper/3 Not tainted
> > 6.16.0-rc3-next-20250623 #1 PREEMPT
> > [   67.194810] Hardware name: Qualcomm Technologies, Inc. APQ 8016 SBC (DT)
> > [   67.234078] pc : pidfs_free_pid (fs/pidfs.c:162)
>
> Thanks, I see the issue. I'm pushing out a fix. Please let me know if
> that reproduces in the next few days.

Thanks. Please share the proposed fix patches.
I would like to build and test in LKFT test framework.

- Naresh

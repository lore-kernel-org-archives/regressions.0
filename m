Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A368BE3
	for <regressions@lists.linux.dev>; Sun, 12 Nov 2023 11:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscv-rocks.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=tometzki.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscv-rocks.de header.i=@riscv-rocks.de header.b="Dg44ktMy"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-9c53e8b7cf4so539316866b.1
        for <regressions@lists.linux.dev>; Sun, 12 Nov 2023 03:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscv-rocks.de; s=google; t=1699789896; x=1700394696; darn=lists.linux.dev;
        h=organization:user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:mail-followup-to
         :reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=njG1LYfJ1D0t6Vnt8KfjPbd1G+JUclxWyfb0D2370WQ=;
        b=Dg44ktMyt0qLykoZkiKvE1eRKayju0KOQmZkwF51voDsIAwE/EdZ3RsarQVDLcdCxP
         uQ/Dqn8vV2Hb/KYmwLqD+IhnrIWqiRgbz/OKc/lLBpJ1oAJ9NjLvB2FW6ngBXui6Yb57
         DfM5tnKXr/EolPrt2mJt/C+zyb4OdLggBvrkLikShyoCb8n9xXB9GgMslxoSGRLQ76Za
         DtaCg87BFeGLqm1ujKpM05hOmNuKr3uy8Q6iTc9fN4gkd1q4lPFEmDtbYMK4faiqjiV8
         +350yJCXBmJlbUzrXje22KWBIHaW+nr0uYCbjCKDV+KQxt1aNpu3j7cxX5llZJvU8PVs
         UQlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699789896; x=1700394696;
        h=organization:user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:mail-followup-to
         :reply-to:message-id:subject:cc:to:from:date:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=njG1LYfJ1D0t6Vnt8KfjPbd1G+JUclxWyfb0D2370WQ=;
        b=Zmx/9DrhfCBa9gCbX/IgbVFKaJC41J8hST1GihYViG/hB3XAoRjp/yPbkuanySltFq
         tdhVJLmyoEU8bMw+W1ZlPec7H+dNvsgTZmd5f4z9Fej13sm95bA8LHObAxmZ+4mlOOez
         HKIxF4qATJE/Fo+tEURYHbcbrW/qQEi1cIZ6OArtSImtEi1oazPCiUCHjOTV/jDvyvCV
         vC0iXJxM9XrsiwoI6GsconXTJ7n9scCYkwQAJgRN8DR58+33RFdlqmek+s8Tv5WucUn2
         Ur51BcZuKi9NIJnEg8V1QleONvHM/VjkcJKivgj2q1mOrUmY+J9u5IkNwWDtiC3xSmic
         hapA==
X-Gm-Message-State: AOJu0Yy4DcqdV0+yFPuFBd5vxIeVqkZ8b6Tq6fQOclEpnZ9V0wXtTzF3
	TT3M5L4ZH3fhbWAt4R2lWiGLJA==
X-Google-Smtp-Source: AGHT+IFXwHmCb8+UXbJDQr9mH+3v47qKITPoQeDJPOTrs+Qqpsv15+ofpjrqITGfl4QURg1o8GL9sQ==
X-Received: by 2002:a17:906:d8b:b0:9da:b1f1:ef47 with SMTP id m11-20020a1709060d8b00b009dab1f1ef47mr2667277eji.30.1699789895904;
        Sun, 12 Nov 2023 03:51:35 -0800 (PST)
Received: from fedora.fritz.box (p5494469c.dip0.t-ipconnect.de. [84.148.70.156])
        by smtp.gmail.com with ESMTPSA id un1-20020a170907cb8100b009a9fbeb15f5sm2401633ejc.46.2023.11.12.03.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Nov 2023 03:51:35 -0800 (PST)
Date: Sun, 12 Nov 2023 12:51:33 +0100
From: Damian Tometzki <damian@riscv-rocks.de>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Wireless <linux-wireless@vger.kernel.org>,
	=?utf-8?B?TmlrbMSBdnMgS2/EvGVzxYZpa292cw==?= <pinkflames.linux@gmail.com>,
	Fabio Comolli <fabio.comolli@gmail.com>,
	Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Subject: Re: Fwd: iwlmvm: Linux 6.7 pre-rc1 prints stack trace of
 iwl_op_mode_mvm_start; caused by commit b6e3d1ba4fcf
Message-ID: <ZVC8RbKEmulf2MsD@fedora.fritz.box>
Reply-To: Damian Tometzki <damian@riscv-rocks.de>
Mail-Followup-To: Bagas Sanjaya <bagasdotme@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Wireless <linux-wireless@vger.kernel.org>,
	=?utf-8?B?TmlrbMSBdnMgS2/EvGVzxYZpa292cw==?= <pinkflames.linux@gmail.com>,
	Fabio Comolli <fabio.comolli@gmail.com>,
	Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
References: <2fa930bb-54dd-4942-a88d-05a47c8e9731@gmail.com>
 <ZVC0iq1FS02FjeTX@archie.me>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZVC0iq1FS02FjeTX@archie.me>
User-Agent: Mutt
X-Operating-System: Linux Fedora release 39 (Thirty Nine) (Kernel 6.6.0)
Organization: Linux hacker

On Sun, 12. Nov 18:18, Bagas Sanjaya wrote:
> Hi Niklāvs and Fabio,
> 
> On Fri, Nov 03, 2023 at 08:13:39PM +0700, Bagas Sanjaya wrote:
> > Hi,
> > 
> > I notice a regression report on Bugzilla [1]. Quoting from it:
> > 
> > > When testing the branch that will become Linux 6.7-rc1, ever since commit b6e3d1ba4fcf02176846d03a930203d8133c0aaf I have observed the following abbreviated kernel stack trace (please see attachments for the full trace):
> > > 
> > > ```
> > > [    6.733281]  ? __warn+0xc3/0x1d0
> > > [    6.733284]  ? iwl_op_mode_mvm_start+0x9c4/0x9d0 [iwlmvm]
> > > [    6.733299]  ? report_bug+0x167/0x220
> > > [    6.733301]  ? handle_bug+0x3d/0x90
> > > [    6.733304]  ? exc_invalid_op+0x1a/0x60
> > > [    6.733306]  ? asm_exc_invalid_op+0x1a/0x20
> > > [    6.733309]  ? iwl_op_mode_mvm_start+0x9c4/0x9d0 [iwlmvm]
> > > [    6.733325]  _iwl_op_mode_start+0x66/0xe0 [iwlwifi]
> > > [    6.733338]  iwl_opmode_register+0x87/0xd0 [iwlwifi]
> > > [    6.733350]  ? __cfi_init_module+0x10/0x10 [iwlmvm]
> > > [    6.733364]  init_module+0x22/0xff0 [iwlmvm]
> > > [    6.733378]  ? __cfi_init_module+0x10/0x10 [iwlmvm]
> > > [    6.733392]  do_one_initcall+0x129/0x380
> > > [    6.733395]  ? idr_alloc_cyclic+0x148/0x1e0
> > > [    6.733397]  ? security_kernfs_init_security+0x41/0x80
> > > [    6.733399]  ? __kernfs_new_node+0x1be/0x250
> > > [    6.733401]  ? preempt_count_add+0x55/0xb0
> > > [    6.733404]  ? up_write+0x4a/0xe0
> > > [    6.733406]  ? preempt_count_add+0x55/0xb0
> > > [    6.733408]  ? sysvec_call_function+0xa4/0xb0
> > > [    6.733410]  ? asm_sysvec_call_function+0x1a/0x20
> > > [    6.733411]  ? free_unref_page_prepare+0xf3/0x410
> > > [    6.733413]  ? preempt_count_add+0x62/0xb0
> > > [    6.733415]  ? _raw_spin_trylock+0x19/0x60
> > > [    6.733417]  ? _raw_spin_unlock+0x11/0x30
> > > [    6.733419]  ? __kmem_cache_free+0x29a/0x3c0
> > > [    6.733421]  ? vfree+0xd2/0x150
> > > [    6.733422]  ? slab_post_alloc_hook+0x76/0x3d0
> > > [    6.733425]  ? do_init_module+0x3f/0x230
> > > [    6.733427]  ? __kmem_cache_alloc_node+0x1fe/0x2f0
> > > [    6.733430]  do_init_module+0x7a/0x230
> > > [    6.733432]  __se_sys_init_module+0x1a0/0x220
> > > [    6.733435]  do_syscall_64+0x7a/0x100
> > > [    6.733438]  ? syscall_exit_to_user_mode+0x2d/0x1d0
> > > [    6.733440]  ? do_syscall_64+0x89/0x100
> > > [    6.733442]  ? do_user_addr_fault+0x4e7/0x680
> > > [    6.733444]  ? exc_page_fault+0x61/0x150
> > > [    6.733446]  entry_SYSCALL_64_after_hwframe+0x6e/0x76
> > > ```
> > > 
> > > I did try reverting the offending commit but the result did not compile and I did not want to dig deeper to identify any subsequent commits what would need reverting to fix compilation.
> > > 
> > > If it's relevant, I'm building the kernel with Clang 17.0.4 toolchain by setting the LLVM=1 variable. CFI is enabled but I'm not sure if it's actually functional.
> > 
> > See Bugzilla for the full thread.
> > 
> > Anyway, I'm adding this regression to regzbot:
> > 
> > #regzbot introduced: b6e3d1ba4fcf02 https://bugzilla.kernel.org/show_bug.cgi?id=218095
> > #regzbot title: new iwlwifi firmware statistics API triggers stack trace
> > 
> 
> Emmanuel had sent a proposed fix at [1]. Please test.
Hello together,

i tested this fix and the dump is gone. It works. 

Tested-by: Damian Tometzki <damian@riscv-rocks.de>

Many thanks
Damian
> 
> Thanks.
> 
> [1]: https://lore.kernel.org/regressions/20231112100944.21177-1-emmanuel.grumbach@intel.com/
> 
> -- 
> An old man doll... just what I always wanted! - Clara



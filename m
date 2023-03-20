Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64581846
	for <regressions@lists.linux.dev>; Mon, 20 Mar 2023 09:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HzXvmC2F0T5mOMMv6x8KeywsvUERmK/G2sfhdowiBaE=; b=VEdPFF1L3XL5QWODFVRVVr1Nd+
	pz3zoP9eTAI42unK5OIQjyHYwYY49MjaoWY02CRgVDwdLhpAt4qMGWjBvOqYBebIByZ8MblPF82DW
	lfVOQ+ltP8NtT6R866hDoq89ADKv8uAEDUStOBDX/0d0wsgcyv2mklroyJfgPJthsGXVEgh9pLwwf
	rrc1nwT9MHG557hpGjmvVMT0YqXiwchuS77kT4GjLA+B33aVyjWBOM96Vi0x8uzAmQ8NQ+MdkPXo8
	1kCK7WeJJ7pKcvxgf0dtBx7UoORivD67g6w4e3asVGktsdqLymjSfOUUNUxQTMD0xVkymfQErtw+F
	genFaJUg==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1peBiw-003sZz-0s;
	Mon, 20 Mar 2023 09:22:38 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 414B1300288;
	Mon, 20 Mar 2023 10:22:36 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 275B920DD879E; Mon, 20 Mar 2023 10:22:36 +0100 (CET)
Date: Mon, 20 Mar 2023 10:22:36 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: draszik@google.com, peter.griffin@linaro.org, willmcvicker@google.com,
	mingo@kernel.org, ulf.hansson@linaro.org, tony@atomide.com,
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
	axboe@kernel.dk, alim.akhtar@samsung.com,
	regressions@lists.linux.dev, avri.altman@wdc.com,
	bvanassche@acm.org, klimova@google.com
Subject: Re: [REGRESSION] CPUIDLE_FLAG_RCU_IDLE, blk_mq_freeze_queue_wait()
 and slow-stuck reboots
Message-ID: <20230320092236.GA2196776@hirez.programming.kicks-ass.net>
References: <20230314230004.961993-1-alexey.klimov@linaro.org>
 <20230315111606.GB2006103@hirez.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230315111606.GB2006103@hirez.programming.kicks-ass.net>

On Wed, Mar 15, 2023 at 12:16:06PM +0100, Peter Zijlstra wrote:

> So ARM has a weird 'rule' in that idle state 0 (wfi) should not have
> RCU_IDLE set, while others should have.
> 
> Of the dt_init_idle_driver() users:
> 
>  - cpuidle-arm: arm_enter_idle_state()
>  - cpuidle-big_little: bl_enter_powerdown() does ct_cpuidle_{enter,exit}()
>  - cpuidle-psci: psci_enter_idle_state() uses CPU_PM_CPU_IDLE_ENTER_PARAM_RCU()
>  - cpuidle-qcom-spm: spm_enter_idle_state() uses CPU_PM_CPU_IDLE_ENTER_PARAM()
>  - cpuidle-riscv-sbi: sbi_cpuidle_enter_state() uses CPU_PM_CPU_IDLE_ENTER_*_PARAM()
> 
> All of them start on index 1 and hence should have RCU_IDLE set, but at
> least the arm, qcom-spm and riscv-sbi don't actually appear to abide by
> the rules.
> 
> Fixing that gives me the below; does that help?

FWIW..  I got the meaning of CPU_PM_CPU_IDLE_*'s _RCU thing inverted
last week; they're actually ok as is.

Specifically _RCU wants the @low_level_idle_enter to do
ct_cpuidle_{enter,exit}(). And since the ones I audited didn't in fact
do that, they should not be using the _RCU version.

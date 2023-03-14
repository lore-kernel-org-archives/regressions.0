Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904D5D2F6
	for <regressions@lists.linux.dev>; Tue, 14 Mar 2023 23:21:18 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id y2so16958891pjg.3
        for <regressions@lists.linux.dev>; Tue, 14 Mar 2023 16:21:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678836078;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CTQ7I6gEq/wz6ZhaT13oVoyn1XK6+uvwTMIlBtJLUPo=;
        b=IwxScq1sL/kYAT7T5nrZjevRXGSOA8P1n3dSST/yJiABa+J5HvjIkbeCTxhmIkmL36
         Ez0J0aoopMuRzx1NhUR0heX30Da3pyFho7TG/PFsjaSq0NfrXVpodLI8pHNSVGNBfNXK
         9raiHSYuDBKAo3ANoLqsCBY5uTnP7WeGn7VcHjOtGxu1CFH13kBZcAc3CcqiQQUyifzh
         XcvLfPSfiqvgOcNsD1LX6NS4KqMBwRCl/Z/lJzvjuj5AaMI2OeQpwvTLN1BhMg+Tp171
         mhPU27f9y9RurA6bVEPgsJKRzBk/vk2c02iCJXbZ3wU5MuoPXZkkGYnTWJgcjI0otyTE
         AbVA==
X-Gm-Message-State: AO0yUKXKRrqCbVz6wzcP9yJq6ugNQT2+18r7DBYoWTA3zYluVhVvMnWp
	RoCgtrAw42NFyExbHa41y0A=
X-Google-Smtp-Source: AK7set/NyLqv5k2p0JDFsAd2z1ShpVSrNW3r+zoLi8Lj2uvXgRFdLpqo2Yl7oH6prG4ifjoXU1JLgg==
X-Received: by 2002:a05:6a20:63a1:b0:c7:4bf5:fa0a with SMTP id m33-20020a056a2063a100b000c74bf5fa0amr32385885pzg.48.1678836077941;
        Tue, 14 Mar 2023 16:21:17 -0700 (PDT)
Received: from [192.168.51.14] ([98.51.102.78])
        by smtp.gmail.com with ESMTPSA id k17-20020aa78211000000b005cdbd9c8825sm2116947pfi.195.2023.03.14.16.21.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 16:21:17 -0700 (PDT)
Message-ID: <c98a3741-273b-8a69-016d-5f3e79f8a71e@acm.org>
Date: Tue, 14 Mar 2023 16:21:15 -0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [REGRESSION] CPUIDLE_FLAG_RCU_IDLE, blk_mq_freeze_queue_wait()
 and slow-stuck reboots
Content-Language: en-US
To: Alexey Klimov <alexey.klimov@linaro.org>, peterz@infradead.org
Cc: draszik@google.com, peter.griffin@linaro.org, willmcvicker@google.com,
 mingo@kernel.org, ulf.hansson@linaro.org, tony@atomide.com,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, axboe@kernel.dk,
 alim.akhtar@samsung.com, regressions@lists.linux.dev, avri.altman@wdc.com,
 klimova@google.com
References: <20230314230004.961993-1-alexey.klimov@linaro.org>
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20230314230004.961993-1-alexey.klimov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/14/23 16:00, Alexey Klimov wrote:
> The delay is found to be in device's ->shutdown() methods called from kernel_restart():
> void kernel_restart_prepare(char *cmd)
> {
> 	blocking_notifier_call_chain(&reboot_notifier_list, SYS_RESTART, cmd);
> 	system_state = SYSTEM_RESTART;
> 	usermodehelper_disable();
> 	device_shutdown();	<---- here
> }
> 
> The driver in question is ufshcd and its ufshcd_wl_shutdown() shutdown method. It often blocks on scsi_device_quiesce() and upon manual checking it seems that it sleeps on blk_mq_freeze_queue_wait()/wait_event() in blk_freeze_queue():
> 
> scsi_device_quiesce(struct scsi_device *sdev)
> {
> 	...
> 	blk_mq_freeze_queue(q);
> 	...
> }
> 	||
> 	V
> void blk_freeze_queue(struct request_queue *q)
> {
> 	/*
> 	 * In the !blk_mq case we are only calling this to kill the
> 	 * q_usage_counter, otherwise this increases the freeze depth
> 	 * and waits for it to return to zero.  For this reason there is
> 	 * no blk_unfreeze_queue(), and blk_freeze_queue() is not
> 	 * exported to drivers as the only user for unfreeze is blk_mq.
> 	 */
> 	blk_freeze_queue_start(q);
> 	blk_mq_freeze_queue_wait(q);	<--- sleeps on wait_event() here
> }

Please let me know if you want me to resubmit patch "scsi: ufs: Remove 
the LUN quiescing code from ufshcd_wl_shutdown()" 
(https://lore.kernel.org/linux-scsi/20220331223424.1054715-14-bvanassche@acm.org/).

Thanks,

Bart.


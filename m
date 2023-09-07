Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEBB1C33
	for <regressions@lists.linux.dev>; Thu,  7 Sep 2023 08:59:30 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-68becf931d0so626402b3a.3
        for <regressions@lists.linux.dev>; Thu, 07 Sep 2023 01:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1694077170; x=1694681970; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l1CUVSUE/g7AfxRwMSaLzU3EKx7ahKOV7VYgsEDqqhY=;
        b=Y0luD7wYeIz6Sp1mXiC5fSwLgfaKRwywR7rohe86GGFXRUrU5+/xRcj0hWgDvfrBgW
         cq/rTQc8NI0FJLhh8eMcifgF1NJqc0KeKsStIoHeohMU0j/iFcZ9tkqeCuT2kNCfQBhn
         crbsASrhOilvMXC/+4QFvjW5dCE3q3S8TJEsuFdB9L3/iW8hDCi0nXV7BnNPjaiFgjQp
         GRYgwPzDTjE3yDUnbN9RStiXAkeghnBio+jiqQ+7tB69RYVsdCV05DDB7gyJ5shSKDGs
         Sp4VKagsqQIgAYRc57Qzrlm/5CMS0zZb4F5ID4DgU99rmR+8rBuHmz0+256CxSNNr78Z
         16ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694077170; x=1694681970;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l1CUVSUE/g7AfxRwMSaLzU3EKx7ahKOV7VYgsEDqqhY=;
        b=BvlVtaNCX1QqaAseuHMOfnjGUTk9Ak1twYKo/N/Ax36NjtoRuf8mTRHczutmWu6RCo
         C0+8zP7zySxl0x4Ug2NsSRyV7hv+VCrmVaEyX9x+RlgQjS2GcrvLvD4Swe2XzuFxCbmg
         UujlytJ8bCJNp+0qtMG7fco1XYImG1TcqGO7LUChn7juiq3v/utJJjx4LCHXx7bl7cQ0
         Calmurrmp9QVf1rt9CU8C+M3Z1nq08BbaUDYZSev1hXezmxoE/qKWqWC0firFTpJMIzK
         yqK4J5RTSpXQhaYtsri0Rp1hAm8y+YfuRVvZwwnUn80qDmzep4vfXtmpxtuhKGiUUkC6
         3r2w==
X-Gm-Message-State: AOJu0Yyhps92LvRWYWngz1EApe9a+wIK0SHBUzY7w0QRbyMpkDvhKfjB
	Gn1jdppxaxIwp3vMvhX/onplNQ==
X-Google-Smtp-Source: AGHT+IEhSwixRwMFJ/PEPA+HuSWv/jCCwwmhpvjeHTvgxdJeu9Oz8P1U41uftIqVJn6ThXvamkVttA==
X-Received: by 2002:a05:6a21:7889:b0:153:a00b:dca0 with SMTP id bf9-20020a056a21788900b00153a00bdca0mr4104800pzc.11.1694077170404;
        Thu, 07 Sep 2023 01:59:30 -0700 (PDT)
Received: from [10.84.158.67] ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id t23-20020a1709028c9700b001bdb85291casm12313579plo.208.2023.09.07.01.59.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Sep 2023 01:59:29 -0700 (PDT)
Message-ID: <3544d5e3-3070-9ddc-fa6c-a05ed35dfd14@bytedance.com>
Date: Thu, 7 Sep 2023 16:59:22 +0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [External] Re: Fwd: WARNING: CPU: 13 PID: 3837105 at
 kernel/sched/sched.h:1561 __cfsb_csd_unthrottle+0x149/0x160
To: Peter Zijlstra <peterz@infradead.org>
Cc: Benjamin Segall <bsegall@google.com>, Bagas Sanjaya
 <bagasdotme@gmail.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 Igor Raits <igor.raits@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Stable <stable@vger.kernel.org>
References: <a5dd536d-041a-2ce9-f4b7-64d8d85c86dc@gmail.com>
 <xm26cyz4ibnb.fsf@google.com>
 <55e2861e-9722-08f8-2c49-966035ff4218@bytedance.com>
 <20230904222351.GC2568@noisy.programming.kicks-ass.net>
From: Hao Jia <jiahao.os@bytedance.com>
In-Reply-To: <20230904222351.GC2568@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2023/9/5 Peter Zijlstra wrote:
> On Thu, Aug 31, 2023 at 04:48:29PM +0800, Hao Jia wrote:
> 
>> If I understand correctly, rq->clock_update_flags may be set to
>> RQCF_ACT_SKIP after __schedule() holds the rq lock, and sometimes the rq
>> lock may be released briefly in __schedule(), such as newidle_balance(). At
>> this time Other CPUs hold this rq lock, and then calling
>> rq_clock_start_loop_update() may trigger this warning.
>>
>> This warning check might be wrong. We need to add assert_clock_updated() to
>> check that the rq clock has been updated before calling
>> rq_clock_start_loop_update().
>>
>> Maybe some things can be like this?
> 
> Urgh, aside from it being white space mangled, I think this is entirely
> going in the wrong direction.
> 
> Leaking ACT_SKIP is dodgy as heck.. it's entirely too late to think
> clearly though, I'll have to try again tomorrow.

Hi Peter,

Do you think this fix method is correct? Or should we go back to the 
beginning and move update_rq_clock() from unthrottle_cfs_rq()?

Thanks,
Hao

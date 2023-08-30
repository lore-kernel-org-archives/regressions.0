Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109A37482
	for <regressions@lists.linux.dev>; Wed, 30 Aug 2023 19:16:29 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1b52875b8d9so23595ad.0
        for <regressions@lists.linux.dev>; Wed, 30 Aug 2023 12:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693422989; x=1694027789; darn=lists.linux.dev;
        h=mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=neliSw7qoh+YUhiPFUyH0EEqS3rYdeTkzSKzjqUjw8A=;
        b=b2NBiu5KMAr1ZRmb6iV2dtGbzEDCWKGd+DjkPZv7INjw8UPpWbPwVHX4jSAiX/Mv5I
         1sZInU0bPz14L9MUQqKTOoQ+SkgkzeRGYvoRYIbapEuNRjjM1USSrc7RoSosxkqiOwkB
         TBgmSq8Z0pxhduyqNoiSYd1XsK762DptLHp8jnfiR1JhWxnFMdE9zoQbrECdCUz8e+ji
         gKrZu6HIwBVXzQrW03HP1wht7eyLkSF1mndedjVEyvZ9CzmBzW+qnxAwzDMmXLIrhsTD
         swW03K78eegqf1UflDbN7yC7/zix37OCawixFLBJSDkc9KtZ3lckxNG9te0/ug0SGO0D
         laDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693422989; x=1694027789;
        h=mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=neliSw7qoh+YUhiPFUyH0EEqS3rYdeTkzSKzjqUjw8A=;
        b=lIJm9vRc7rryEJZSWl9mMANOzgcpSOefKP1pX1TL8nJeeaG/HXjo68Je/wLvtf8Zyj
         9EzitHXqQKW8Qg9Y9/HZxCNiJdsIw41AYdPEfpykH7o6RNgqMKOQpn5nP0nI7VYgt6HQ
         qkIEUpfk8B+RO7eriPC5C0Ih4yMC7uw1JXf8hb5XM5x777fTKhV1Jf4kHv1yYuiYc7Mg
         hOktPMYmdcbFJRwlHHhLWHtxWImiCjiAeyFjwhfBm8+IR6kOFtkiFMY1gvWvHltTVlL4
         HD24r8D7+5H615qtGHuKkSl3rQC9ThdAbXyBMFc4z7K/G2KkmvDYuxrFdGjkBQvTTB5h
         19Hg==
X-Gm-Message-State: AOJu0YyP6NRJg8bEzU2WEuI8kTu8B8etJIFitgtNok3LCBkT1BOavW1P
	jivv5JXyhx8vLbmrWZFFbZ/IxA==
X-Google-Smtp-Source: AGHT+IEtPBJyW+fxDSwfhZLVKMbrw+fx+hC8DUP+9B7LnqUilulxgXIOq0VIs7hNfhDbzxT0E54wrg==
X-Received: by 2002:a17:902:e551:b0:1c1:efe5:cce5 with SMTP id n17-20020a170902e55100b001c1efe5cce5mr28280plf.3.1693422989246;
        Wed, 30 Aug 2023 12:16:29 -0700 (PDT)
Received: from bsegall-glaptop.localhost (c-73-158-249-138.hsd1.ca.comcast.net. [73.158.249.138])
        by smtp.gmail.com with ESMTPSA id f4-20020aa782c4000000b0068a0922b1f0sm10343368pfn.137.2023.08.30.12.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 12:16:28 -0700 (PDT)
From: Benjamin Segall <bsegall@google.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Hao Jia <jiahao.os@bytedance.com>,  Vincent Guittot
 <vincent.guittot@linaro.org>,  "Peter Zijlstra (Intel)"
 <peterz@infradead.org>,  Igor Raits <igor.raits@gmail.com>,  Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>,  Linux Regressions
 <regressions@lists.linux.dev>,  Linux Stable <stable@vger.kernel.org>
Subject: Re: Fwd: WARNING: CPU: 13 PID: 3837105 at kernel/sched/sched.h:1561
 __cfsb_csd_unthrottle+0x149/0x160
References: <a5dd536d-041a-2ce9-f4b7-64d8d85c86dc@gmail.com>
Date: Wed, 30 Aug 2023 12:16:24 -0700
In-Reply-To: <a5dd536d-041a-2ce9-f4b7-64d8d85c86dc@gmail.com> (Bagas Sanjaya's
	message of "Wed, 30 Aug 2023 07:37:49 +0700")
Message-ID: <xm26cyz4ibnb.fsf@google.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Bagas Sanjaya <bagasdotme@gmail.com> writes:

> Hi,
>
> I notice a regression report on Bugzilla [1]. Quoting from it:
>
>> Hello, we recently got a few kernel crashes with following backtrace. Happened on 6.4.12 (and 6.4.11 I think) but did not happen (I think) on 6.4.4.
>> 
>> [293790.928007] ------------[ cut here ]------------
>> [293790.929905] rq->clock_update_flags & RQCF_ACT_SKIP
>> [293790.929919] WARNING: CPU: 13 PID: 3837105 at kernel/sched/sched.h:1561 __cfsb_csd_unthrottle+0x149/0x160
>> [293790.933694] Modules linked in: [...]
>> [293790.946262] Unloaded tainted modules: edac_mce_amd(E):1
>> [293790.956625] CPU: 13 PID: 3837105 Comm: QueryWorker-30f Tainted: G        W   E      6.4.12-1.gdc.el9.x86_64 #1
>> [293790.957963] Hardware name: RDO OpenStack Compute/RHEL, BIOS edk2-20230301gitf80f052277c8-2.el9 03/01/2023
>> [293790.959681] RIP: 0010:__cfsb_csd_unthrottle+0x149/0x160
>
> See Bugzilla for the full thread.
>
> Anyway, I'm adding this regression to regzbot:
>
> #regzbot introduced: ebb83d84e49b54 https://bugzilla.kernel.org/show_bug.cgi?id=217843
>
> Thanks.
>
> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=217843

The code in question is literally "rq_lock; update_rq_clock;
rq_clock_start_loop_update (the warning)", which suggests to me that
RQCF_ACT_SKIP is somehow leaking from somewhere else?

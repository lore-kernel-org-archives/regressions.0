Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AEAA29
	for <regressions@lists.linux.dev>; Fri, 10 Feb 2023 08:53:03 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id l37-20020a05600c1d2500b003dfe46a9801so3549204wms.0
        for <regressions@lists.linux.dev>; Fri, 10 Feb 2023 00:53:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z3l+hMqKIzNRCJe3tRhl8lxJJZlE8xLurwYnQLcxQ5A=;
        b=BTKJdVo0hG4Oinv4/ni77AuWWs18pvs9/DEVVmcD7oG+JKKlfAANbtTW2i7G6B/kJs
         TBMYWhd/tf3WNS83qJbMt12tIKUlDCz3we7yI05kgPLga6LZ5TTxHkqbP3qbeeF+IDCf
         L4r0XKKSSx9ANrLaXqKDk74fSmvTh5vcZVDTcf2wK/AzszlanC8p8q0T1Z6+IxKC6Hoc
         G3hWBzib0uBpxEi33RutkB2EF9muVwWtMUv22jKN8SQtOwS9RBFSh8kfo9nloPUcEJCb
         tQwnEV7rAjxkmkPUg2+t7ojnAiaQ4IHWoSB3c2rpvraxN5snC5zBZPmys6T+dEPWuKnW
         r1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z3l+hMqKIzNRCJe3tRhl8lxJJZlE8xLurwYnQLcxQ5A=;
        b=MSJlO1AGEmXaASYC26oPUeU0MdB6KEgzBCsQcjqDvobKCWJrEt3TSUPB0E4bo7kbtc
         tKirKKW4gW5cjGu4fcBWcgDxoH6WYCLhhhGeRurFvqzWW8UkPmHFcHrpTCfqhgHhVRCY
         a5FyNrCKMyom3OV7+Uw2Plv3Qh9XljhYNUcACkKkb+ECohFjDEoJ2ZSeFzc91/+AagA/
         ft+WPP/2+F1P1UzX96O3dSu1tz1KIL0ne6tdNMyFVOS/ZXK7VU5sr5tXzQRGlCxbya94
         7R2XuW47oDJrWsGNb94OQ7DKTBG9/06GBrvYm7Frfwq9CM1JgzLAi+/cm1YMPP5p76XU
         JK3g==
X-Gm-Message-State: AO0yUKXcFEqsvWhLXyNcvvTmSDAuPJ007j14LaZ8KB5kTgrLMrbkAgbQ
	RYj4bcb7hEY9CoZq6Ez2ni3gMw==
X-Google-Smtp-Source: AK7set/DLPn8t0TUUJ/2Wxg7FZ+ui+DEImKtiuVIP6RzEmRxJcPoNDVFcRoxtHTtMtlUEK3QqfsfJw==
X-Received: by 2002:a05:600c:80f:b0:3d2:2d2a:d581 with SMTP id k15-20020a05600c080f00b003d22d2ad581mr12379128wmp.30.1676019182070;
        Fri, 10 Feb 2023 00:53:02 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id h4-20020a1ccc04000000b003dc4a47605fsm7706319wmb.8.2023.02.10.00.53.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 00:53:01 -0800 (PST)
Message-ID: <2f285607-cbf9-6abc-f436-edb6e9a3938b@linaro.org>
Date: Fri, 10 Feb 2023 09:53:00 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: Regression: NULL pointer dereference after NFS_V4_2_READ_PLUS
 (commit 7fd461c47)
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Anna Schumaker <schumaker.anna@gmail.com>
Cc: Trond Myklebust <trondmy@hammerspace.com>,
 Anna Schumaker <Anna.Schumaker@netapp.com>,
 linux-nfs <linux-nfs@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <f591b13c-4600-e2a4-8efa-aac6ad828dd1@linaro.org>
 <82526863-d07a-0a5d-2990-1555b1387f26@linaro.org>
 <2C5E9725-F152-4D2E-882E-CF92A35481BF@hammerspace.com>
 <7ba38377-7992-7f0f-d905-cceb42510f39@linaro.org>
 <51430925-8046-7066-84ed-2ff0db835347@linaro.org>
 <CAFX2Jf=5X3zyZEWQmD6Rg9jQAD7ccDbae5LQCwrAyPCVVoFumg@mail.gmail.com>
 <2add1769-1458-b185-bc78-6d573f61b6fc@linaro.org>
 <CAFX2JfnKy7juGQaDTzqosN9SF-zd+XrhSL9uh_Xg0GpJGDux-A@mail.gmail.com>
 <32530c36-91d0-d351-0689-aed6a0975a4b@linaro.org>
In-Reply-To: <32530c36-91d0-d351-0689-aed6a0975a4b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/02/2023 09:41, Krzysztof Kozlowski wrote:
> 
> 
>>
>> I was also wondering if it would be possible to turn on KASAN in your
>> kernel, which should give us a little more info?
> 
> I'll try with KASAN.

Not much from the KASAN, except that kernel
continues to boot and runs:

[   44.722846] vdd_vmem: disabling
[   44.793465] systemd[1]: Hostname set to <odroidhc1>.
[   45.357929] systemd[1]: bpf-lsm: BPF LSM hook not enabled in the kernel, BPF LSM not supported
[   45.980476] ==================================================================
[   45.986372] BUG: KASAN: null-ptr-deref in xdr_inline_decode+0x140/0x200
[   45.992929] Read of size 4092 at addr 00000004 by task kworker/u16:3/71
[   45.999513] 
[   46.000940] CPU: 6 PID: 71 Comm: kworker/u16:3 Not tainted 6.2.0-rc7-00018-g0983f6bf2bfc #222
[   46.009504] Hardware name: Samsung Exynos (Flattened Device Tree)
[   46.015542] Workqueue: rpciod rpc_async_schedule
[   46.020123]  unwind_backtrace from show_stack+0x10/0x14
[   46.025323]  show_stack from dump_stack_lvl+0x58/0x70
[   46.030301]  dump_stack_lvl from kasan_report+0xa8/0xe0
[   46.035501]  kasan_report from kasan_check_range+0x94/0x1a0
[   46.041048]  kasan_check_range from memcpy+0x28/0x68
[   46.045985]  memcpy from xdr_inline_decode+0x140/0x200
[   46.051098]  xdr_inline_decode from nfs4_xdr_dec_read_plus+0x298/0x5b8
[   46.057602]  nfs4_xdr_dec_read_plus from call_decode+0x39c/0x530
[   46.063581]  call_decode from __rpc_execute+0x1f4/0xc5c
[   46.068776]  __rpc_execute from rpc_async_schedule+0x2c/0x4c
[   46.074411]  rpc_async_schedule from process_one_work+0x51c/0xc44
[   46.080478]  process_one_work from worker_thread+0x9c/0x7c0
[   46.086022]  worker_thread from kthread+0x16c/0x1b8
[   46.090872]  kthread from ret_from_fork+0x14/0x2c
[   46.095550] Exception stack(0xf0ba3fb0 to 0xf0ba3ff8)
[   46.100580] 3fa0:                                     00000000 00000000 00000000 00000000
[   46.108740] 3fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[   46.116885] 3fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   46.123461] ==================================================================
[   46.130774] Disabling lock debugging due to kernel taint
[   50.848579] systemd[1]: Queued start job for default target Graphical Interface.
[   50.877068] systemd[1]: Created slice Slice /system/getty.


Decoded stacktrace is (this is master branch):

[   46.020123] unwind_backtrace from show_stack (arch/arm/kernel/traps.c:258) 
[   46.025323] show_stack from dump_stack_lvl (lib/dump_stack.c:107 (discriminator 4)) 
[   46.030301] dump_stack_lvl from kasan_report (mm/kasan/report.c:184 mm/kasan/report.c:519) 
[   46.035501] kasan_report from kasan_check_range (mm/kasan/generic.c:173 mm/kasan/generic.c:189) 
[   46.041048] kasan_check_range from memcpy (mm/kasan/shadow.c:65) 
[   46.045985] memcpy from xdr_inline_decode (net/sunrpc/xdr.c:1419 net/sunrpc/xdr.c:1454) 
[   46.051098] xdr_inline_decode from nfs4_xdr_dec_read_plus (fs/nfs/nfs42xdr.c:1063 fs/nfs/nfs42xdr.c:1149 fs/nfs/nfs42xdr.c:1360 fs/nfs/nfs42xdr.c:1343) 
[   46.057602] nfs4_xdr_dec_read_plus from call_decode (net/sunrpc/clnt.c:2595) 
[   46.063581] call_decode from __rpc_execute (include/asm-generic/bitops/generic-non-atomic.h:128 net/sunrpc/sched.c:954) 
[   46.068776] __rpc_execute from rpc_async_schedule (include/linux/sched/mm.h:336 net/sunrpc/sched.c:1035) 
[   46.074411] rpc_async_schedule from process_one_work (kernel/workqueue.c:2294) 
[   46.080478] process_one_work from worker_thread (include/linux/list.h:292 kernel/workqueue.c:2437) 
[   46.086022] worker_thread from kthread (kernel/kthread.c:376) 
[   46.090872] kthread from ret_from_fork (arch/arm/kernel/entry-common.S:149) 


Best regards,
Krzysztof


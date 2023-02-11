Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2AD10FD
	for <regressions@lists.linux.dev>; Sat, 11 Feb 2023 11:23:26 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id ba1so7625035wrb.5
        for <regressions@lists.linux.dev>; Sat, 11 Feb 2023 03:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=509YsbfSRxRhwVrB3ujZKFgTxveap/RV0wTuof5gtnI=;
        b=Z6Jq0HCoHdSZL9Iq0BYg/yqg6NX+G5xZfOjaEvYDcUYwHEi3uQfP61Q7r8fQAUS2qN
         t2w7qFvvEbvoxJ8/oiSsTGg1W0i32DEGY5VPVXmFtXXVphXnjeoq+SZUQGx1SzGV4Siq
         tmQAfU5/2QF53UYgxL+ZoznZEioCVl2XR/NuMom5UvwkwbE6hicwC7VyF3F81lXSb95v
         X75vg47/ie8ypISp5KZlDE2NGdZs4GRF66o1K6NpY7utfVnXQnpuPjciqIC3X3BN24b/
         9RzE4NBLA+cVG9uV41fI7ts/i9/X9ryuc/W9oiy+Iro4k3yqiV1bR6S3olDx0APGIXLO
         SE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=509YsbfSRxRhwVrB3ujZKFgTxveap/RV0wTuof5gtnI=;
        b=UaMvigKzaKFaEUrD0WLk+4bYz2kHSF4B+JQcPnTRkhYhwynetT7OpcFm+umXYdzpnz
         gP3kar+eH+9DQ1hFJ5l/oHmEyHkc3E+n5e7apn90pnbPMCBj4FKvNsRKaQ0P5IhsBj01
         XreDeCUNoMHbye6VI40AqWmlHnxyA62QyhGkykVnVrT6Rn57oDGuenEjzpjiRg6sDeA/
         Xf66aPENA1SGokPvn8Zj9kszYtXQdyfcOErOxcf/r/MdZVo7+kz9HA7kAUcdpBhy2ToG
         JcMUUvVZP3PiZn1iNfnFfnnPC+a+Thns4XB8dzviB8N1+YOcWljpS5H27VSw3iyAAKyZ
         ZkJw==
X-Gm-Message-State: AO0yUKUU1SqZOn2RCJ90yOTn0+pKXlWNUbEjCqEcrV+q2ltfolWubfE9
	0j4WgRWCnrnGAriXgQhy3Q23nA==
X-Google-Smtp-Source: AK7set+3iv4xqXpUwg18UQU2HQzqg0hNuwqwP5UEoSDdBp11uM1gD0Sk8/trPnIAdkepnV8RVJNuTA==
X-Received: by 2002:adf:f9cc:0:b0:2c3:e308:7673 with SMTP id w12-20020adff9cc000000b002c3e3087673mr18756507wrr.35.1676114604402;
        Sat, 11 Feb 2023 03:23:24 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n18-20020a5d4012000000b002b57bae7174sm6013940wrp.5.2023.02.11.03.23.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Feb 2023 03:23:23 -0800 (PST)
Message-ID: <4fe39d77-eb7c-a578-aefa-45b76e2247c2@linaro.org>
Date: Sat, 11 Feb 2023 12:23:22 +0100
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
 <2f285607-cbf9-6abc-f436-edb6e9a3938b@linaro.org>
 <CAFX2Jfmz7QqZBEdzbPUhPs0yctnXVaVF68tX1c57YX=6ki=0TA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAFX2Jfmz7QqZBEdzbPUhPs0yctnXVaVF68tX1c57YX=6ki=0TA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/02/2023 21:55, Anna Schumaker wrote:
> Hi Krzysztof,
> 
> On Fri, Feb 10, 2023 at 3:53 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 10/02/2023 09:41, Krzysztof Kozlowski wrote:
>>>
>>>
>>>>
>>>> I was also wondering if it would be possible to turn on KASAN in your
>>>> kernel, which should give us a little more info?
>>>
>>> I'll try with KASAN.
>>
>> Not much from the KASAN, except that kernel
>> continues to boot and runs:
>>
>> [   44.722846] vdd_vmem: disabling
>> [   44.793465] systemd[1]: Hostname set to <odroidhc1>.
>> [   45.357929] systemd[1]: bpf-lsm: BPF LSM hook not enabled in the kernel, BPF LSM not supported
>> [   45.980476] ==================================================================
>> [   45.986372] BUG: KASAN: null-ptr-deref in xdr_inline_decode+0x140/0x200
>> [   45.992929] Read of size 4092 at addr 00000004 by task kworker/u16:3/71
>> [   45.999513]
>> [   46.000940] CPU: 6 PID: 71 Comm: kworker/u16:3 Not tainted 6.2.0-rc7-00018-g0983f6bf2bfc #222
>> [   46.009504] Hardware name: Samsung Exynos (Flattened Device Tree)
>> [   46.015542] Workqueue: rpciod rpc_async_schedule
>> [   46.020123]  unwind_backtrace from show_stack+0x10/0x14
>> [   46.025323]  show_stack from dump_stack_lvl+0x58/0x70
>> [   46.030301]  dump_stack_lvl from kasan_report+0xa8/0xe0
>> [   46.035501]  kasan_report from kasan_check_range+0x94/0x1a0
>> [   46.041048]  kasan_check_range from memcpy+0x28/0x68
>> [   46.045985]  memcpy from xdr_inline_decode+0x140/0x200
>> [   46.051098]  xdr_inline_decode from nfs4_xdr_dec_read_plus+0x298/0x5b8
>> [   46.057602]  nfs4_xdr_dec_read_plus from call_decode+0x39c/0x530
>> [   46.063581]  call_decode from __rpc_execute+0x1f4/0xc5c
>> [   46.068776]  __rpc_execute from rpc_async_schedule+0x2c/0x4c
>> [   46.074411]  rpc_async_schedule from process_one_work+0x51c/0xc44
>> [   46.080478]  process_one_work from worker_thread+0x9c/0x7c0
>> [   46.086022]  worker_thread from kthread+0x16c/0x1b8
>> [   46.090872]  kthread from ret_from_fork+0x14/0x2c
>> [   46.095550] Exception stack(0xf0ba3fb0 to 0xf0ba3ff8)
>> [   46.100580] 3fa0:                                     00000000 00000000 00000000 00000000
>> [   46.108740] 3fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
>> [   46.116885] 3fe0: 00000000 00000000 00000000 00000000 00000013 00000000
>> [   46.123461] ==================================================================
>> [   46.130774] Disabling lock debugging due to kernel taint
>> [   50.848579] systemd[1]: Queued start job for default target Graphical Interface.
>> [   50.877068] systemd[1]: Created slice Slice /system/getty.
>>
>>
>> Decoded stacktrace is (this is master branch):
>>
>> [   46.020123] unwind_backtrace from show_stack (arch/arm/kernel/traps.c:258)
>> [   46.025323] show_stack from dump_stack_lvl (lib/dump_stack.c:107 (discriminator 4))
>> [   46.030301] dump_stack_lvl from kasan_report (mm/kasan/report.c:184 mm/kasan/report.c:519)
>> [   46.035501] kasan_report from kasan_check_range (mm/kasan/generic.c:173 mm/kasan/generic.c:189)
>> [   46.041048] kasan_check_range from memcpy (mm/kasan/shadow.c:65)
>> [   46.045985] memcpy from xdr_inline_decode (net/sunrpc/xdr.c:1419 net/sunrpc/xdr.c:1454)
> 
> Actually, this part is really useful. net/sunrpc/xdr.c:1419 points to
> the memcpy in xdr_copy_to_scratch(), which has me wondering if I'm
> incorrectly setting up the xdr scratch buffer that READ_PLUS uses for
> decoding. Can you try this patch and let me know if it helps?
> 
> From ac2d6c501dbcdb306480edaee625b5496f1fb4f5 Mon Sep 17 00:00:00 2001
> From: Anna Schumaker <Anna.Schumaker@Netapp.com>
> Date: Fri, 10 Feb 2023 15:50:22 -0500
> Subject: [PATCH] NFSv4.2: Rework scratch handling for READ_PLUS
> 

Patch is corrupted - maybe mail program reformatted it when sending:

Applying: NFSv4.2: Rework scratch handling for READ_PLUS
error: corrupt patch at line 12
Patch failed at 0001 NFSv4.2: Rework scratch handling for READ_PLUS


Best regards,
Krzysztof


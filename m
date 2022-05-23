Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628BD7C
	for <regressions@lists.linux.dev>; Mon, 23 May 2022 11:22:20 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id p5-20020a1c2905000000b003970dd5404dso8343762wmp.0
        for <regressions@lists.linux.dev>; Mon, 23 May 2022 04:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=EhOQGg1mWeCy/lfVLf7GwzqHA1hMMv05+TaoM0mW9F8=;
        b=sOoZ8mX2X9p1Xl73lr3Zcs5b7MmT0J3eRouAiK6GyN2poK2+owyeg9G88p/veeV2G7
         tIR+LFlloX+inF6DfDeV/f74MxuCHf1fXrZHPWJBc7bpH+aFf3G7ySEHBZLanS9MgRnj
         23HG8DRhv7q0c8Zqu7911qHNLGWpk9I1ny/+dVshWeWofQm2QArvxpyf+oB5Nlppxt5r
         76akydWhU61p0TfnUSjvTNOiMXjaBH523uhSchQWGVqB72+ZvnOKh0O+fKYfV3W8rKAl
         wUceihSvxkLHAnILZNFqGXhoulDhZ2pQJifMtp9sNzqLznIZdbZaqEvOU78p5WB59xie
         HUkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=EhOQGg1mWeCy/lfVLf7GwzqHA1hMMv05+TaoM0mW9F8=;
        b=u73croF6ujRiRHci3CYUatwY7h47/dMtcvPPmX2XDenJBBnnkEoqDdFuFm40ZYPLhe
         zDNufuJGYN8bExzmQFhdqrj4Btjs+06PMh+EG8wl09VZEm3ZVKd7Dya3rZnX7LwcNf9Z
         3FHVcxxFriNEvgabkWcFWZN6xU2PJ1PfO5vbmjDTvG/T6a1GmpWwdEIm/yiOtxpTMq6D
         6oBe5G2LIFOgoF5U8oI+bAFpps/34XbVHLygTu2gBNotcgaXBNQnnO4zGk7wVERQDAqs
         51ZEGlnxxzHee7rb6UMXHKyjHOFw8qmPmKCWu1UJft/WzdvQPVIw4x4Yfa1/szeEPPJj
         YDbA==
X-Gm-Message-State: AOAM531Mj2DbuUwohDootbzATQ28y8rexV9oDVWSbCu087yJEp8rSlhm
	7Ty3Ydfv/Rg3sn7tFwHh1CjHsg==
X-Google-Smtp-Source: ABdhPJxb3aRoKOzbx4sz11+NBNpWEFJdvJRVFypDKroEMtQkotBuB1WkeE3RwCI8PFIloWSuNV0K/A==
X-Received: by 2002:a1c:4d0d:0:b0:397:30f6:b62b with SMTP id o13-20020a1c4d0d000000b0039730f6b62bmr18074451wmh.155.1653304938731;
        Mon, 23 May 2022 04:22:18 -0700 (PDT)
Received: from ?IPV6:2a00:1098:3142:14:3110:d736:2a7:6aff? ([2a00:1098:3142:14:3110:d736:2a7:6aff])
        by smtp.gmail.com with ESMTPSA id q4-20020adfbb84000000b0020c5253d90esm11838361wrg.90.2022.05.23.04.22.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 04:22:18 -0700 (PDT)
Message-ID: <c8762830-444b-5b9e-bddb-a7c700209308@raspberrypi.com>
Date: Mon, 23 May 2022 12:22:18 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: vchiq: Performance regression since 5.18-rc1
To: Stefan Wahren <stefan.wahren@i2se.com>, paulmck@kernel.org
Cc: Marcelo Tosatti <mtosatti@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nicolas Saenz Julienne <nsaenzju@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Minchan Kim <minchan@kernel.org>,
 Mel Gorman <mgorman@techsingularity.net>, Juri Lelli
 <juri.lelli@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 regressions@lists.linux.dev, riel@surriel.com, viro@zeniv.linux.org.uk
References: <77d6d498-7dd9-03eb-60f2-d7e682bb1b20@i2se.com>
 <20220521234616.GO1790663@paulmck-ThinkPad-P17-Gen-1>
 <bfad3d08-3268-5528-17c1-c17ef3949d96@i2se.com>
 <20220523044818.GS1790663@paulmck-ThinkPad-P17-Gen-1>
 <e0503433-615d-3834-4392-d0868caf47cf@i2se.com>
 <58cb7fbb-d317-83e6-0427-d3f3944b24b8@raspberrypi.com>
 <d7837ac0-fe6f-3bb2-c073-86e4864c5b5e@i2se.com>
 <aa19a0e1-2742-d74f-50b2-e81ba1fed7a6@raspberrypi.com>
 <2ddd354e-a2b6-077c-25be-6ef1b2118d04@i2se.com>
From: Phil Elwell <phil@raspberrypi.com>
In-Reply-To: <2ddd354e-a2b6-077c-25be-6ef1b2118d04@i2se.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/05/2022 12:15, Stefan Wahren wrote:
> Hi Phil,
> 
> Am 23.05.22 um 13:01 schrieb Phil Elwell:
>> Hi Stefan,
>>
>> On 23/05/2022 11:48, Stefan Wahren wrote:
>>> Hi Phil,
>>>
>>> Am 23.05.22 um 11:29 schrieb Phil Elwell:
>>>> Hi Stefan,
>>>>
>>>> On 23/05/2022 07:19, Stefan Wahren wrote:
>>>>> Hi Paul,
>>>>>
>>>>> Am 23.05.22 um 06:48 schrieb Paul E. McKenney:
>>>>>> On Sun, May 22, 2022 at 05:11:36PM +0200, Stefan Wahren wrote:
>>>>>>> Hi Paul,
>>>>>>>
>>>>>>> Am 22.05.22 um 01:46 schrieb Paul E. McKenney:
>>>>>>>> On Sun, May 22, 2022 at 01:22:00AM +0200, Stefan Wahren wrote:
>>>>>>>>> Hi,
>>>>>>>>>
>>>>>>>>> while testing the staging/vc04_services/interface/vchiq_arm driver with my
>>>>>>>>> Raspberry Pi 3 B+ (multi_v7_defconfig) i noticed a huge performance
>>>>>>>>> regression since [ff042f4a9b050895a42cae893cc01fa2ca81b95c] mm:
>>>>>>>>> lru_cache_disable: replace work queue synchronization with synchronize_rcu
>>>>>>>>>
>>>>>>>>> Usually i run "vchiq_test -f 1" to see the driver is still working [1].
>>>>>>>>>
>>>>>>>>> Before commit:
>>>>>>>>>
>>>>>>>>> real    0m1,500s
>>>>>>>>> user    0m0,068s
>>>>>>>>> sys    0m0,846s
>>>>>>>>>
>>>>>>>>> After commit:
>>>>>>>>>
>>>>>>>>> real    7m11,449s
>>>>>>>>> user    0m2,049s
>>>>>>>>> sys    0m0,023s
>>>>>>>>>
>>>>>>>>> Best regards
>>>>>>>>>
>>>>>>>>> [1] - https://github.com/raspberrypi/userland
>>>>>>>> Please feel free to try the patch shown below.  Or the pair of patches
>>>>>>>> from Rik here:
>>>>>>>>
>>>>>>>> https://lore.kernel.org/lkml/20220218183114.2867528-2-riel@surriel.com/
>>>>>>>> https://lore.kernel.org/lkml/20220218183114.2867528-3-riel@surriel.com/
>>>>>>> I tried your patch and Rik's patches but in both cases vchiq_test runs 7
>>>>>>> minutes instead of ~ 1 second.
>>>>>> That is surprising.  Do you boot with rcupdate.rcu_normal=1?
>>>>> No, not explicit.
>>>>>>    That would
>>>>>> nullify my patch, but I would expect that Rik's patch would still provide
>>>>>> increased performance even in that case.
>>>>> I will retest with a fresh SD card image.
>>>>>>
>>>>>> Could you please characterize where the slowdown is occurring?
>>>>>
>>>>> Unfortunately i don't have a deep insight into driver and vchiq_test tool. 
>>>>> Just a user view.
>>>>>
>>>>> Do you think an strace would be a good starting point?
>>>>>
>>>>> @Phil Any advices to analyse this issue?
>>>>
>>>> Sending many small control packets:
>>>>
>>>>    vchiq_test -c 1 10000
>>>>
>>>> essentially tests interrupt latency. Using a small number of large bulk 
>>>> transfers:
>>>>
>>>>    vchiq_test -b 10000 1
>>>>
>>>> becomes a test of how long it takes to lock down pages. It also tests DMA 
>>>> transfer speeds, but since the DMA is run by the firmware (which you aren't 
>>>> changing), I think you can rule that.
>>> Thanks i will try.
>>>>
>>>> You may also find it helpful to include "force_turbo=1" in config.txt for 
>>>> more predictable results.
>>>>
>>>> By the way, running our 5.18-rc7-based branch on a 3B+ I'm not seeing any 
>>>> performance problems:
>>> I assume you are using arm/bcm2709_defconfig and not arm/multi_v7_defconfig 
>>> as me?
>>
>> That's correct. Simply switching to multi_v7_defconfig breaks vchiq 
>> completely, presumably because it doesn't define CONFIG_BCM2835_VCHIQ.
> sorry, forgot to mention. I that i enable VCHIQ as module on top of 
> multi_v7_defconfig.

Downstream tree with multi_v7_defconfig + CONFIG_BCM2835_VCHIQ:

pi@raspberrypi:~$ time vchiq_test -f 1
Functional test - iters:1
======== iteration 1 ========
Testing bulk transfer for alignment.
Testing bulk transfer at PAGE_SIZE.

real    0m0.566s
user    0m0.037s
sys     0m0.166s

Phil

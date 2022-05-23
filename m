Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4447C
	for <regressions@lists.linux.dev>; Mon, 23 May 2022 11:01:05 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id h5so19660558wrb.11
        for <regressions@lists.linux.dev>; Mon, 23 May 2022 04:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=message-id:date:mime-version:user-agent:subject:to:cc:references
         :from:in-reply-to:content-transfer-encoding;
        bh=7Gj0myDG7Upk1Lm/yIITVfKpkM1xaCwFPb15m2KrOlA=;
        b=SJc2DPtddEaRZtuiQIVwI9U6g2Kqmyg3NynK+fD7QTldXAL63VcMRo+aMpJExYDpea
         U61wuSKnmZudN9/aPDkW+8q2i6sI42HdU+daRbOBydwTH/40cNUSgVlse0Y2aAyMf2c5
         M84vKj+sPSwuuOPh+WMeLIkLYg5u0mh0YUqnX4r/H0MM7ztqP4pL9mX9GZMSDnCcC/Eb
         JGCq9NAZ7xkWCQurfiXYTq3ZBPfihEm7fptSmT/Td81FKIlPYQCJRIcieZ7zpDRZQWaW
         wJJlN3j/UIGTboshXaa5yTkQil2BreC2vL3dzzRVBrCLzj0GOELRnczy6unvHZKSluZg
         mP2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :to:cc:references:from:in-reply-to:content-transfer-encoding;
        bh=7Gj0myDG7Upk1Lm/yIITVfKpkM1xaCwFPb15m2KrOlA=;
        b=lRs6MSeCidb4iAuw5FX4lKoyS4ecmE5Mxi3esOk96NUDn/IHYSO6awMSyAfbK0V0WE
         AUO2n8SmCUdzzWwEPBJ7bsgx9fwXRnInZEwUtys802gfSPSP81hKDRg2DGjlxRJGciGj
         6islOT02ZLC0QGLL4KO89IXm6ObMtV6XxsXRCbZ7aeKP5Luslyk7QU/agUc2mOHMflLZ
         YY7dRjD3bi876FzW5pq4ydYYdEMzqOGo0T5A9pIQ85uLuKxz3Ls7x1qfR9+4cRAOqexC
         +xTQLOISBIEkYZcNeQk60gsEBJrQU95dcU3hYK4nBidB0k6Ar+/jR8HAo2qBRHvCzP6i
         VllA==
X-Gm-Message-State: AOAM533bOreMyc9E92fQlIg9xutSE70zr2CoV/XqDewYX9eWGnm8pXm2
	doPM6vbKbf9PtrawzPv2+yEPpg==
X-Google-Smtp-Source: ABdhPJx6MdtFMgPpDDHtWkV8+ZFaWG7x/MF24zzfaJQeetYugRp7nIBEH/k2SC8JHmNUjXnyYkNFsw==
X-Received: by 2002:a5d:6406:0:b0:20e:5bf9:8e31 with SMTP id z6-20020a5d6406000000b0020e5bf98e31mr18094381wru.432.1653303663852;
        Mon, 23 May 2022 04:01:03 -0700 (PDT)
Received: from ?IPV6:2a00:1098:3142:14:3110:d736:2a7:6aff? ([2a00:1098:3142:14:3110:d736:2a7:6aff])
        by smtp.gmail.com with ESMTPSA id g10-20020adfa58a000000b0020e60baffd1sm6477332wrc.52.2022.05.23.04.01.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 May 2022 04:01:03 -0700 (PDT)
Message-ID: <aa19a0e1-2742-d74f-50b2-e81ba1fed7a6@raspberrypi.com>
Date: Mon, 23 May 2022 12:01:03 +0100
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
From: Phil Elwell <phil@raspberrypi.com>
In-Reply-To: <d7837ac0-fe6f-3bb2-c073-86e4864c5b5e@i2se.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefan,

On 23/05/2022 11:48, Stefan Wahren wrote:
> Hi Phil,
> 
> Am 23.05.22 um 11:29 schrieb Phil Elwell:
>> Hi Stefan,
>>
>> On 23/05/2022 07:19, Stefan Wahren wrote:
>>> Hi Paul,
>>>
>>> Am 23.05.22 um 06:48 schrieb Paul E. McKenney:
>>>> On Sun, May 22, 2022 at 05:11:36PM +0200, Stefan Wahren wrote:
>>>>> Hi Paul,
>>>>>
>>>>> Am 22.05.22 um 01:46 schrieb Paul E. McKenney:
>>>>>> On Sun, May 22, 2022 at 01:22:00AM +0200, Stefan Wahren wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> while testing the staging/vc04_services/interface/vchiq_arm driver with my
>>>>>>> Raspberry Pi 3 B+ (multi_v7_defconfig) i noticed a huge performance
>>>>>>> regression since [ff042f4a9b050895a42cae893cc01fa2ca81b95c] mm:
>>>>>>> lru_cache_disable: replace work queue synchronization with synchronize_rcu
>>>>>>>
>>>>>>> Usually i run "vchiq_test -f 1" to see the driver is still working [1].
>>>>>>>
>>>>>>> Before commit:
>>>>>>>
>>>>>>> real    0m1,500s
>>>>>>> user    0m0,068s
>>>>>>> sys    0m0,846s
>>>>>>>
>>>>>>> After commit:
>>>>>>>
>>>>>>> real    7m11,449s
>>>>>>> user    0m2,049s
>>>>>>> sys    0m0,023s
>>>>>>>
>>>>>>> Best regards
>>>>>>>
>>>>>>> [1] - https://github.com/raspberrypi/userland
>>>>>> Please feel free to try the patch shown below.  Or the pair of patches
>>>>>> from Rik here:
>>>>>>
>>>>>> https://lore.kernel.org/lkml/20220218183114.2867528-2-riel@surriel.com/
>>>>>> https://lore.kernel.org/lkml/20220218183114.2867528-3-riel@surriel.com/
>>>>> I tried your patch and Rik's patches but in both cases vchiq_test runs 7
>>>>> minutes instead of ~ 1 second.
>>>> That is surprising.  Do you boot with rcupdate.rcu_normal=1?
>>> No, not explicit.
>>>>    That would
>>>> nullify my patch, but I would expect that Rik's patch would still provide
>>>> increased performance even in that case.
>>> I will retest with a fresh SD card image.
>>>>
>>>> Could you please characterize where the slowdown is occurring?
>>>
>>> Unfortunately i don't have a deep insight into driver and vchiq_test tool. 
>>> Just a user view.
>>>
>>> Do you think an strace would be a good starting point?
>>>
>>> @Phil Any advices to analyse this issue?
>>
>> Sending many small control packets:
>>
>>    vchiq_test -c 1 10000
>>
>> essentially tests interrupt latency. Using a small number of large bulk 
>> transfers:
>>
>>    vchiq_test -b 10000 1
>>
>> becomes a test of how long it takes to lock down pages. It also tests DMA 
>> transfer speeds, but since the DMA is run by the firmware (which you aren't 
>> changing), I think you can rule that.
> Thanks i will try.
>>
>> You may also find it helpful to include "force_turbo=1" in config.txt for more 
>> predictable results.
>>
>> By the way, running our 5.18-rc7-based branch on a 3B+ I'm not seeing any 
>> performance problems:
> I assume you are using arm/bcm2709_defconfig and not arm/multi_v7_defconfig as me?

That's correct. Simply switching to multi_v7_defconfig breaks vchiq completely, 
presumably because it doesn't define CONFIG_BCM2835_VCHIQ.

Phil

>>
>> pi@raspberrypi:~$ time vchiq_test -f 1
>> Functional test - iters:1
>> ======== iteration 1 ========
>> Testing bulk transfer for alignment.
>> Testing bulk transfer at PAGE_SIZE.
>>
>> real    0m0.512s
>> user    0m0.042s
>> sys     0m0.165s
>>
>> Phil

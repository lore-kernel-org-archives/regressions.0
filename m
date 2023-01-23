Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A597C
	for <regressions@lists.linux.dev>; Mon, 23 Jan 2023 18:38:42 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id g10so9789446wmo.1
        for <regressions@lists.linux.dev>; Mon, 23 Jan 2023 10:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WTk0I1+zDNETlCuyCHI7lHTcIiaDgd+2OizKfkWjUYU=;
        b=JQgevstJzf6j9hiSW0UOQPg9tt4rOipWq3pEbKBhN7qpvpBQGQLFQr9VSqvJe9np4H
         FoRPZLi7MxOG/Hnb5dVFyx4Lq2Sra6gCudQDima0wxFCXFfPxIgfIZWOYB8GYTWPlg0g
         s7+oQoReYld0lHbCOI9wM951ZTf5F/NLr6CDLX3dAh4y5PNRacI5qvr1pkFFYYW6PJfj
         TJLYTocekrUdTFZIbF40vQjX56b3PgG+ygRkQGXZlEag+QWbUk4uk8ZCCeR95mIusTaL
         KipsqAOqeTDvju17X15pJAfGAFTAJJ+CI4xblpdto1bvdmlxBtxV/i1fMFERBjyrrRhW
         wcdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WTk0I1+zDNETlCuyCHI7lHTcIiaDgd+2OizKfkWjUYU=;
        b=hRKPITFZMS8+a6Uz25xtSsw97VSRj/VM8gjX2nZo0DR7vFGdNRDnJZW5FZ2vHNrgYS
         dhxY33qrTKoiLi4+Fwi5Gf7tI1xy7uWjXIfmpVPAe0c3QEUs7gmi4heimjvwSrBo1rl5
         fD2XhDBjh34+/POALwSXeTMKBxuA+vt4BmqISKiWkHi7PMvP7rUX9ffS7tIbNFo5suOh
         oGa8DhNuMMaEBUdKtAwjrsJPYiknvwxgwSXElPHxxkvqZvOUWbvEohOfdPw6PJXC6XSH
         6mTi8AedZ9lEC0v9v3Dav7t0tdYwfz9JLvv5O8AAVC3H7wG+Dspk+4LsEWbjckRvM82o
         FvqA==
X-Gm-Message-State: AFqh2kpzSuGoRqcB2pu7856s2L4VbEyD5wLrwTGLGX4hhcC9ezFufsCj
	0cad/4xjfFt8URJtb30iGp3PpLYqQbo=
X-Google-Smtp-Source: AMrXdXtfj4uALubaxEP8mxGbo0mFxd7xxZQj6mrLU/+J4z7M8aUIK/u66CxzokoDedM6G3rT82h5RQ==
X-Received: by 2002:a05:600c:a54:b0:3db:887:8c8c with SMTP id c20-20020a05600c0a5400b003db08878c8cmr23357939wmq.27.1674499120924;
        Mon, 23 Jan 2023 10:38:40 -0800 (PST)
Received: from [10.0.1.21] ([91.231.125.82])
        by smtp.gmail.com with ESMTPSA id f14-20020a05600c154e00b003daff80f16esm15752400wmg.27.2023.01.23.10.38.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 10:38:40 -0800 (PST)
Message-ID: <a3be4866-5689-1276-5db4-168885a97091@gmail.com>
Date: Mon, 23 Jan 2023 19:38:39 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-wired-lan] Supermicro AOC-STGN-I1S (Intel 82599EN based
 10G adapter) - poor network perfomance after moving to Debian 11.5
Content-Language: pl
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: intel-wired-lan@osuosl.org, regressions@lists.linux.dev
References: <d1530cba-1a72-cae8-6a04-ed8ec0f82e6e@gmail.com>
 <652bf236-d97e-832c-e0f3-24927a46d7ad@molgen.mpg.de>
 <744de70c-782d-5d36-87fc-e6b92ac84190@gmail.com>
 <30de7b89-6a4f-8dab-d671-027140bbb52b@gmail.com>
 <d20a0ae8-d46e-2b8a-5587-5416e9013643@molgen.mpg.de>
 <3b957674-a559-ac1e-27b8-b81e6eeffe75@gmail.com>
 <05d381af-5ccb-0d87-97d3-e2fc4ce870fc@molgen.mpg.de>
From: Bartek Kois <bartek.kois@gmail.com>
In-Reply-To: <05d381af-5ccb-0d87-97d3-e2fc4ce870fc@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


W dniu 22.01.2023 o 21:28, Paul Menzel pisze:
> Dear Bartek,
>
>
> Am 19.01.23 um 18:17 schrieb Bartek Kois:
>> W dniu 19.01.2023 o 18:09, Paul Menzel pisze:
>
>>> Am 19.01.23 um 17:58 schrieb Bartek Kois:
>>>> W dniu 19.01.2023 o 13:24, Bartek Kois pisze:
>>>>>
>>>>> W dniu 19.01.2023 o 11:17, Paul Menzel pisze:
>>>>>>
>>>>>> #regzbot ^introduced: 4.9.88..5.10.149
>>>
>>>>>> Am 14.01.23 um 11:23 schrieb Bartek Kois:
>>>>>>
>>>>>>> After moving from Debian 9.7 to 11.5 as soon as I perform "ip 
>>>>>>> link set enp1s0 up" for my 10G adapter (AOC-STGN-I1S - Intel 
>>>>>>> 82599EN based 10G adapter) I am experiencing high cpu load (even 
>>>>>>> if no traffic is passing through the adapter) and network 
>>>>>>> performance is low (when network is connected).
>>>>>>
>>>>>> How do you test the network performance? Please give exact 
>>>>>> numbers for comparison.
>>>>>>
>>>>> I am using this server as a router for my subscribers with 
>>>>> iptables (for NAT and firewall) and hfsc (for QoS). First I 
>>>>> encountered this problem while migrating form Debian 9.7 to 11.5. 
>>>>> Routers based  on Supermicro X11SSL-F (Intel® C232 chipset) works 
>>>>> with no problems after that migration, but routers based on 
>>>>> Supermicro X9SCL (Intel C202 PCH) and Supermicro X10SLL+-F (Intel 
>>>>> C222 Express PCH) starts behaving strangely with high cpu load 
>>>>> (0.5-0.8 while before it was around 0.0-0.1) and subscribers not 
>>>>> being able to utilize their plans. I tried to strip down the 
>>>>> problem and ends up with clean system with no iptables or hfsc 
>>>>> rules behaving the same (higher load) right after setting the 10G 
>>>>> link upeven if no traffic is passing by.
>>>>>
>>>>>>> The cpu load is oscillating between 0.1 and 0.3 on vanilla system
>>>>>>> with no network attached. The problem can be observed on the 
>>>>>>> following platforms: Supermicro X9SCL (Intel C202 PCH) and
>>>>>>> Supermicro X10SLL+-F (Intel C222 Express PCH), but for the 
>>>>>>> Supermicro
>>>>>>> X11SSL-F (Intel® C232 chipset) everything is working well.
>>>>>>>
>>>>>>> Tested environments:
>>>>>>> Debian 9.7 - Linux 4.9.0-6-amd64 #1 SMP Debian 4.9.88-1+deb9u1 
>>>>>>> (2018-05-07) x86_64 GNU/Linux [all platforms working well with 
>>>>>>> no problems: Supermicro X9SCL (Intel C202 PCH), Supermicro 
>>>>>>> X10SLL+-F (Intel C222 Express PCH), Supermicro X11SSL-F (Intel® 
>>>>>>> C232 chipset)]
>>>>>>
>>>>>>> Debian 11.5 - Linux 5.10.0-19-amd64 #1 SMP Debian 5.10.149-2 
>>>>>>> (2022-10-21) x86_64 GNU/Linux [older platforms: Supermicro X9SCL 
>>>>>>> (Intel C202 PCH), Supermicro X10SLL+-F (Intel C222 Express PCH) 
>>>>>>> behave problematic as described above | newer platform: 
>>>>>>> Supermicro X11SSL-F (Intel® C232 chipset) working well with no 
>>>>>>> problems]
>>>>>>
>>>>>> Maybe create a bug at the Linux kernel bug tracker [1], where you 
>>>>>> can attach all the logs (`dmesg`, `lspci -nnk -s …`, …).
>>>>>>
>>>>> I`ve already reported that to the Debian team 
>>>>> ttps://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1024763, but so 
>>>>> far nobody took care of this issue so far.
>>>>>
>>>>>>> So far to solve the problem I was trying to upgrade system to 
>>>>>>> the newest stable version, upgrade kernel to version 6.x, 
>>>>>>> upgrade ixgbe driver to the newest version but with no luck.
>>>>>>
>>>>>> Thank you for checking that. Too bad it’s still present. To rule 
>>>>>> out some user space problem, could you test Debian 9.7 with a 
>>>>>> stable Linux release, currently 6.1.7?
>>>>>>
>>>>>> What does `sudo perf top --sort comm,dso` show, where the time is 
>>>>>> spent?
>>>>>
>>>>> During my first test in real enviroment with subscribers I gether 
>>>>> the following data through the perf:
>>>>>
>>>>>   27.83%  [kernel]                   [k] strncpy
>>>>>   14.80%  [kernel]                   [k] nft_do_chain
>>>>>    7.61%  [kernel]                   [k] memcmp
>>>>>    5.63%  [kernel]                   [k] nft_meta_get_eval
>>>>>    3.14%  [kernel]                   [k] nft_cmp_eval
>>>>>    2.79%  [kernel]                   [k] asm_exc_nmi
>>>>>    1.07%  [kernel]                   [k] module_get_kallsym
>>>>>    0.92%  [kernel]                   [k] 
>>>>> kallsyms_expand_symbol.constprop.0
>>>>>    0.85%  [kernel]                   [k] ixgbe_poll
>>>>>    0.75%  [kernel]                   [k] format_decode
>>>>>    0.61%  [kernel]                   [k] number
>>>>>    0.56%  [kernel]                   [k] menu_select
>>>>>    0.54%  [kernel]                   [k] clflush_cache_range
>>>>>    0.52%  [kernel]                   [k] cpuidle_enter_state
>>>>>    0.51%  [kernel]                   [k] vsnprintf
>>>>>    0.50%  [kernel]                   [k] u32_classify
>>>>>    0.49%  [kernel]                   [k] fib_table_lookup
>>>>>    0.40%  [kernel]                   [k] dma_pte_clear_level
>>>>>    0.39%  [kernel]                   [k] domain_mapping
>>>>>    0.36%  [kernel]                   [k] ixgbe_xmit_fram
>>>>>
>>>>>
>>>>>     PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM TIME+ 
>>>>> COMMAND
>>>>>      18 root      20   0       0      0      0 S  28.2 0.0 7:06.27 
>>>>> ksoftirqd/1
>>>>>      12 root      20   0       0      0      0 R  12.0 0.0 4:10.88 
>>>>> ksoftirqd/0
>>>
>>> […]
>>>
>>> Do you see different behavior in `/proc/interrupts`?
>>>
>> This is how it looks like for Debian 11.5 - Linux 5.10.0-19-amd64 #1 
>> SMP Debian 5.10.149-2 (2022-10-21) x86_64 GNU/Linux on Supermicro 
>> X10SLL+-F (Intel C222 Express PCH):
>>
>>        1 root      20   0  163948  10288   7696 S   0.0   0.1 0:39.58 
>> systemd
>
> […]
>
> The content of `/proc/interrupts` has a different format on my system.
>
> ```
> $ head -3 /proc/interrupts
>            CPU0       CPU1       CPU2       CPU3
>   1:      55560          0        113          0  IR-IO-APIC 1-edge    
> i8042
>   8:          0          0          0          0  IR-IO-APIC 8-edge    
> rtc0
> ```
> […]
>
>> and for Debian 9.7 - Linux 4.9.0-6-amd64 #1 SMP Debian 
>> 4.9.88-1+deb9u1 on Supermicro X10SLL+-F (Intel C222 Express PCH)
>>
>> 31659 root      20   0       0      0      0 S   0.3  0.0 0:00.92 
>> kworker/7:0
>>      1 root      20   0   57032   6736   5256 S   0.0  0.1 2:28.14 
>> systemd
>
> […]
>>>>>>> Supermicro support suggested as follows:
>>>>>>> it might be kernel related debian 11.5 has kernel 5.10 which is 
>>>>>>> a recent kernel it might not properly support the chipsets for 
>>>>>>> X9 therefore i suggest to use RHEL or CentOS as they use much 
>>>>>>> older kernel versions. I expect that with ubuntu 20.04 you see 
>>>>>>> the same problem it uses kernel 5.4
>>>>>> >>> Testing another GNU/Linux distribution for another data 
>>>>>> point, might
>>>>>> be a good idea.
>>>>>>
>>>>>> As nobody has responded yet, bisecting the issue is probably the 
>>>>>> fastest way to get to the bottom of this. Luckily the problem 
>>>>>> seems reproducible and you seem to be able to build a Linux 
>>>>>> kernel yourself, so that should work. (For testing purposes you 
>>>>>> could also test with Ubuntu, as they provide Linux kernel builds 
>>>>>> for (almost) all releases in their Linux kernel mainline PPA [2].)
>>>>>>
>>>>> Of course  I can try Ubuntu and report how it is working.
>>>>>
>>>> Ubuntu (5.15.0-43-generic) seems to be working in the same way 
>>>> generating higher load after executing "ip link set enp1s0 up".
>>>
>>> That is good to know. (Is this Ubuntu 22.04?) What about Ubuntu 
>>> 20.04 with Linux 5.4, and Ubuntu 18.04 with 4.15?
>>>
>>> Anyway, I think, you won’t come around bisecting. Another hint, make 
>>> sure that you can build a 4.9 Linux kernel yourself, that does not 
>>> exhibit that issue.
>>>
>> That`s right, it is 22.04. I don`t have to build it. Standard kernel 
>> Linux 4.9.0-6-amd64 from Debian 9.7 worked without problems for past 
>> 4 years.
>
> If nobody of the developers/maintainers is going to step up, you are 
> on your own. Again, as you can reproduce this easily, the fastest way 
> is to bisect the issue, which you can do on your own.

How can I invastigate that futher? I thought about trying to change some 
of the parameters related to ixgbe driver and observe if anything is 
changing, but when I am trying to do:

sudo modprobe ixgbe IntMode=0

I get the following error in the dmesg:

[ 2137.324772] ixgbe: unknown parameter 'IntMode' ignored <<<<<<<<<
[ 2137.324848] ixgbe: Intel(R) 10 Gigabit PCI Express Network Driver
[ 2137.324848] ixgbe: Copyright (c) 1999-2016 Intel Corporation.
[ 2138.505751] ixgbe 0000:02:00.0: Multiqueue Enabled: Rx Queue count = 
4, Tx Queue count = 4 XDP Queue count = 0
[ 2138.506049] ixgbe 0000:02:00.0: 32.000 Gb/s available PCIe bandwidth 
(5.0 GT/s PCIe x8 link)
[ 2138.506134] ixgbe 0000:02:00.0: MAC: 2, PHY: 1, PBA No: 0210FF-0FF
[ 2138.506137] ixgbe 0000:02:00.0: ac:1f:6b:ab:fa:70
[ 2138.510537] ixgbe 0000:02:00.0 enp2s0: renamed from eth0
[ 2138.537452] ixgbe 0000:02:00.0: Intel(R) 10 Gigabit Network Connection

How should I use those parameters?

Best regards

Bartek Kois

>
> Kind regards,
>
> Paul
>
>
>>>>>> [1]: https://bugzilla.kernel.org/
>>>>>> [2]: https://kernel.ubuntu.com/~kernel-ppa/mainline/

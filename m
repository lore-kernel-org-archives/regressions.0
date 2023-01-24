Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A2E10E9
	for <regressions@lists.linux.dev>; Tue, 24 Jan 2023 09:40:59 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id b3so22490094lfv.2
        for <regressions@lists.linux.dev>; Tue, 24 Jan 2023 01:40:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BUCg03vc+4UkHjO1gSN+Ah/K3kc4MqJeUbczoBWLWXo=;
        b=cHmDjkLpxPhPcTLpol8ob+v9dH5ySzFXeyS7la+9umuyBUM2X1gWehuKqEAoTO3xl0
         Vndy/s3+3fszpOKdtqojbV3Ilk/qZKS8UonwdPA27KRwb31p2UyjFpgc8dFyKu0n4+FJ
         WeDksUHMljRiaKSP2YuZM0b6InRQ+eDZWXKM0/AjChL0ei/0JSsjoUuBQtClwEEWlOhA
         zwXZj3L+9ecAtwMRnUDquTHYkAsfU/iHhgsKYI1FUZJoKlnlrCKtHV4LuBRnXp6FTAn4
         Gb44c3HA8vFhdp4YYuOXJuBV7aE9daFwgaDrAEIJls6nvxC68gzjnUPr/sRC3p4ncvzN
         61MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BUCg03vc+4UkHjO1gSN+Ah/K3kc4MqJeUbczoBWLWXo=;
        b=uHjSifZU69ikhtVLbppjCEhTPVoG7eHetpKpQKLVQ969IlffiDWlHdgQCE/cvmh1dx
         +D14Jb8TXEoncmouzc8C4Og3diQ9AkXBW0koOx3Rk9Q9ClLx+FkKbaC4rr87pIdF25vR
         mTaJngCJgltivqAO/qjQqF86ojkxeM9wZ6ALsTsNfFz6SPTTRlP6o24juuoIRdd4TabK
         k4f6AHPbTFRkdaDwdF9ZDsSpTnXek4KHSBI9EgmfgNWWTTsok/11wNVWu5puqpmxszKJ
         Y6/VCYCk36dm0r5+F6DzN89+PtoQ+dM5e6WMvOdwZu0dj5l+v+r53Ydeo89NRynJ+NcN
         I5+g==
X-Gm-Message-State: AFqh2krw9zCDR7Qr236WWIyz/PRDRIB9UckKY8DyVP1bdW9fQ7K8wb9N
	X8jwSA++P2Vx8ig/5dBTIj8MGIV7fpM=
X-Google-Smtp-Source: AMrXdXsd+j05Zq4ueKzukaxCz1Mwq7yWo5GGBr2Mc7/CrAlwiy3ofaSVDnZI86+CUs9yc/nCw/cKLg==
X-Received: by 2002:a05:6512:145:b0:4d5:640b:7e6b with SMTP id m5-20020a056512014500b004d5640b7e6bmr6976372lfo.42.1674553257139;
        Tue, 24 Jan 2023 01:40:57 -0800 (PST)
Received: from [10.0.20.244] ([91.224.119.190])
        by smtp.gmail.com with ESMTPSA id o21-20020a056512051500b004d59210f3e7sm147380lfb.289.2023.01.24.01.40.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 01:40:56 -0800 (PST)
Message-ID: <ead1e9eb-944d-fa9b-e8ff-c087f8718c47@gmail.com>
Date: Tue, 24 Jan 2023 10:40:55 +0100
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
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Paul Menzel <pmenzel@molgen.mpg.de>
Cc: intel-wired-lan@osuosl.org
References: <d1530cba-1a72-cae8-6a04-ed8ec0f82e6e@gmail.com>
 <652bf236-d97e-832c-e0f3-24927a46d7ad@molgen.mpg.de>
 <744de70c-782d-5d36-87fc-e6b92ac84190@gmail.com>
 <30de7b89-6a4f-8dab-d671-027140bbb52b@gmail.com>
 <d20a0ae8-d46e-2b8a-5587-5416e9013643@molgen.mpg.de>
 <3b957674-a559-ac1e-27b8-b81e6eeffe75@gmail.com>
 <05d381af-5ccb-0d87-97d3-e2fc4ce870fc@molgen.mpg.de>
 <a3be4866-5689-1276-5db4-168885a97091@gmail.com>
 <04793400-b368-ecd8-ce52-009e60533753@molgen.mpg.de>
 <8da81bdb-80e1-f1b8-1d49-af7cf7072128@gmail.com>
 <26c4008e-d9de-0250-57ba-97d050fb405f@molgen.mpg.de>
 <7d1347f4-4cf0-e8a8-000e-9128933181b9@leemhuis.info>
From: Bartek Kois <bartek.kois@gmail.com>
In-Reply-To: <7d1347f4-4cf0-e8a8-000e-9128933181b9@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


W dniu 24.01.2023 o 10:33, Linux kernel regression tracking (Thorsten 
Leemhuis) pisze:
> On 23.01.23 20:03, Paul Menzel wrote:
>> Am 23.01.23 um 19:58 schrieb Bartek Kois:
>>
>>> W dniu 23.01.2023 o 19:53, Paul Menzel pisze:
>>>> Am 23.01.23 um 19:38 schrieb Bartek Kois:
>>>>> W dniu 22.01.2023 o 21:28, Paul Menzel pisze:
>>>>>> Dear Bartek,
>>>>>>
>>>>>>
>>>>>> Am 19.01.23 um 18:17 schrieb Bartek Kois:
>>>>>>> W dniu 19.01.2023 o 18:09, Paul Menzel pisze:
>>>>>>>> Am 19.01.23 um 17:58 schrieb Bartek Kois:
>>>>>>>>> W dniu 19.01.2023 o 13:24, Bartek Kois pisze:
>>>>>>>>>> W dniu 19.01.2023 o 11:17, Paul Menzel pisze:
>>>>>>>>>>> #regzbot ^introduced: 4.9.88..5.10.149
>>>>>>>>>>> Am 14.01.23 um 11:23 schrieb Bartek Kois:
>>>>>>>>>>>
>>>>>>>>>>>> After moving from Debian 9.7 to 11.5 as soon as I perform "ip
>>>>>>>>>>>> link set enp1s0 up" for my 10G adapter (AOC-STGN-I1S - Intel
>>>>>>>>>>>> 82599EN based 10G adapter) I am experiencing high cpu load
>>>>>>>>>>>> (even if no traffic is passing through the adapter) and
>>>>>>>>>>>> network performance is low (when network is connected).
>>>>>>>>>>> How do you test the network performance? Please give exact
>>>>>>>>>>> numbers for comparison.
>>>>>>>>>>>
>>>>>>>>>> I am using this server as a router for my subscribers with
>>>>>>>>>> iptables (for NAT and firewall) and hfsc (for QoS). First I
>>>>>>>>>> encountered this problem while migrating form Debian 9.7 to
>>>>>>>>>> 11.5. Routers based  on Supermicro X11SSL-F (Intel® C232
>>>>>>>>>> chipset) works with no problems after that migration, but
>>>>>>>>>> routers based on Supermicro X9SCL (Intel C202 PCH) and
>>>>>>>>>> Supermicro X10SLL+-F (Intel C222 Express PCH) starts behaving
>>>>>>>>>> strangely with high cpu load (0.5-0.8 while before it was
>>>>>>>>>> around 0.0-0.1) and subscribers not being able to utilize their
>>>>>>>>>> plans. I tried to strip down the problem and ends up with clean
>>>>>>>>>> system with no iptables or hfsc rules behaving the same (higher
>>>>>>>>>> load) right after setting the 10G link upeven if no traffic is
>>>>>>>>>> passing by.
>>>>>>>>>>
>>>>>>>>>>>> The cpu load is oscillating between 0.1 and 0.3 on vanilla
>>>>>>>>>>>> system
>>>>>>>>>>>> with no network attached. The problem can be observed on the
>>>>>>>>>>>> following platforms: Supermicro X9SCL (Intel C202 PCH) and
>>>>>>>>>>>> Supermicro X10SLL+-F (Intel C222 Express PCH), but for the
>>>>>>>>>>>> Supermicro
>>>>>>>>>>>> X11SSL-F (Intel® C232 chipset) everything is working well.
>>>>>>>>>>>>
>>>>>>>>>>>> Tested environments:
>>>>>>>>>>>> Debian 9.7 - Linux 4.9.0-6-amd64 #1 SMP Debian
>>>>>>>>>>>> 4.9.88-1+deb9u1 (2018-05-07) x86_64 GNU/Linux [all platforms
>>>>>>>>>>>> working well with no problems: Supermicro X9SCL (Intel C202
>>>>>>>>>>>> PCH), Supermicro X10SLL+-F (Intel C222 Express PCH),
>>>>>>>>>>>> Supermicro X11SSL-F (Intel® C232 chipset)]
>>>>>>>>>>>> Debian 11.5 - Linux 5.10.0-19-amd64 #1 SMP Debian 5.10.149-2
>>>>>>>>>>>> (2022-10-21) x86_64 GNU/Linux [older platforms: Supermicro
>>>>>>>>>>>> X9SCL (Intel C202 PCH), Supermicro X10SLL+-F (Intel C222
>>>>>>>>>>>> Express PCH) behave problematic as described above | newer
>>>>>>>>>>>> platform: Supermicro X11SSL-F (Intel® C232 chipset) working
>>>>>>>>>>>> well with no problems]
>>>>>>>>>>> Maybe create a bug at the Linux kernel bug tracker [1], where
>>>>>>>>>>> you can attach all the logs (`dmesg`, `lspci -nnk -s …`, …).
>>>>>>>>>>>
>>>>>>>>>> I`ve already reported that to the Debian team
>>>>>>>>>> ttps://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1024763, but
>>>>>>>>>> so far nobody took care of this issue so far.
>>>>>>>>>>
>>>>>>>>>>>> So far to solve the problem I was trying to upgrade system to
>>>>>>>>>>>> the newest stable version, upgrade kernel to version 6.x,
>>>>>>>>>>>> upgrade ixgbe driver to the newest version but with no luck.
>>>>>>>>>>> Thank you for checking that. Too bad it’s still present. To
>>>>>>>>>>> rule out some user space problem, could you test Debian 9.7
>>>>>>>>>>> with a stable Linux release, currently 6.1.7?
>>>>>>>>>>>
>>>>>>>>>>> What does `sudo perf top --sort comm,dso` show, where the time
>>>>>>>>>>> is spent?
>>>>>>>>>> During my first test in real enviroment with subscribers I
>>>>>>>>>> gether the following data through the perf:
>>>>>>>>>>
>>>>>>>>>>    27.83%  [kernel]                   [k] strncpy
>>>>>>>>>>    14.80%  [kernel]                   [k] nft_do_chain
>>>>>>>>>>     7.61%  [kernel]                   [k] memcmp
>>>>>>>>>>     5.63%  [kernel]                   [k] nft_meta_get_eval
>>>>>>>>>>     3.14%  [kernel]                   [k] nft_cmp_eval
>>>>>>>>>>     2.79%  [kernel]                   [k] asm_exc_nmi
>>>>>>>>>>     1.07%  [kernel]                   [k] module_get_kallsym
>>>>>>>>>>     0.92%  [kernel]                   [k]
>>>>>>>>>> kallsyms_expand_symbol.constprop.0
>>>>>>>>>>     0.85%  [kernel]                   [k] ixgbe_poll
>>>>>>>>>>     0.75%  [kernel]                   [k] format_decode
>>>>>>>>>>     0.61%  [kernel]                   [k] number
>>>>>>>>>>     0.56%  [kernel]                   [k] menu_select
>>>>>>>>>>     0.54%  [kernel]                   [k] clflush_cache_range
>>>>>>>>>>     0.52%  [kernel]                   [k] cpuidle_enter_state
>>>>>>>>>>     0.51%  [kernel]                   [k] vsnprintf
>>>>>>>>>>     0.50%  [kernel]                   [k] u32_classify
>>>>>>>>>>     0.49%  [kernel]                   [k] fib_table_lookup
>>>>>>>>>>     0.40%  [kernel]                   [k] dma_pte_clear_level
>>>>>>>>>>     0.39%  [kernel]                   [k] domain_mapping
>>>>>>>>>>     0.36%  [kernel]                   [k] ixgbe_xmit_fram
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>>      PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM
>>>>>>>>>> TIME+ COMMAND
>>>>>>>>>>       18 root      20   0       0      0      0 S  28.2 0.0
>>>>>>>>>> 7:06.27 ksoftirqd/1
>>>>>>>>>>       12 root      20   0       0      0      0 R  12.0 0.0
>>>>>>>>>> 4:10.88 ksoftirqd/0
>>>>>>>> […]
>>>>>>>>
>>>>>>>> Do you see different behavior in `/proc/interrupts`?
>>>>>>>>
>>>>>>> This is how it looks like for Debian 11.5 - Linux 5.10.0-19-amd64
>>>>>>> #1 SMP Debian 5.10.149-2 (2022-10-21) x86_64 GNU/Linux on
>>>>>>> Supermicro X10SLL+-F (Intel C222 Express PCH):
>>>>>>>
>>>>>>>         1 root      20   0  163948  10288   7696 S   0.0 0.1
>>>>>>> 0:39.58 systemd
>>>>>> […]
>>>>>>
>>>>>> The content of `/proc/interrupts` has a different format on my system.
>>>>>>
>>>>>> ```
>>>>>> $ head -3 /proc/interrupts
>>>>>>             CPU0       CPU1       CPU2       CPU3
>>>>>>    1:      55560          0        113          0  IR-IO-APIC 1-edge
>>>>>> i8042
>>>>>>    8:          0          0          0          0  IR-IO-APIC 8-edge
>>>>>> rtc0
>>>>>> ```
>>>>>> […]
>>>>>>
>>>>>>> and for Debian 9.7 - Linux 4.9.0-6-amd64 #1 SMP Debian
>>>>>>> 4.9.88-1+deb9u1 on Supermicro X10SLL+-F (Intel C222 Express PCH)
>>>>>>>
>>>>>>> 31659 root      20   0       0      0      0 S   0.3  0.0 0:00.92
>>>>>>> kworker/7:0
>>>>>>>       1 root      20   0   57032   6736   5256 S   0.0  0.1 2:28.14
>>>>>>> systemd
>>>>>> […]
>>>>>>>>>>>> Supermicro support suggested as follows:
>>>>>>>>>>>> it might be kernel related debian 11.5 has kernel 5.10 which
>>>>>>>>>>>> is a recent kernel it might not properly support the chipsets
>>>>>>>>>>>> for X9 therefore i suggest to use RHEL or CentOS as they use
>>>>>>>>>>>> much older kernel versions. I expect that with ubuntu 20.04
>>>>>>>>>>>> you see the same problem it uses kernel 5.4
>>>>>>>>>>>>>> Testing another GNU/Linux distribution for another data
>>>>>>>>>>> point, might be a good idea.
>>>>>>>>>>>
>>>>>>>>>>> As nobody has responded yet, bisecting the issue is probably
>>>>>>>>>>> the fastest way to get to the bottom of this. Luckily the
>>>>>>>>>>> problem seems reproducible and you seem to be able to build a
>>>>>>>>>>> Linux kernel yourself, so that should work. (For testing
>>>>>>>>>>> purposes you could also test with Ubuntu, as they provide
>>>>>>>>>>> Linux kernel builds for (almost) all releases in their Linux
>>>>>>>>>>> kernel mainline PPA [2].)
>>>>>>>>>>>
>>>>>>>>>> Of course  I can try Ubuntu and report how it is working.
>>>>>>>>>>
>>>>>>>>> Ubuntu (5.15.0-43-generic) seems to be working in the same way
>>>>>>>>> generating higher load after executing "ip link set enp1s0 up".
>>>>>>>> That is good to know. (Is this Ubuntu 22.04?) What about Ubuntu
>>>>>>>> 20.04 with Linux 5.4, and Ubuntu 18.04 with 4.15?
>>>>>>>>
>>>>>>>> Anyway, I think, you won’t come around bisecting. Another hint,
>>>>>>>> make sure that you can build a 4.9 Linux kernel yourself, that
>>>>>>>> does not exhibit that issue.
>>>>>>>>
>>>>>>> That`s right, it is 22.04. I don`t have to build it. Standard
>>>>>>> kernel Linux 4.9.0-6-amd64 from Debian 9.7 worked without problems
>>>>>>> for past 4 years.
>>>>>> If nobody of the developers/maintainers is going to step up, you
>>>>>> are on your own. Again, as you can reproduce this easily, the
>>>>>> fastest way is to bisect the issue, which you can do on your own.
>>>>> How can I investigate that further?
>>>> I repeat myself, please bisect the issue. It’s the fastest way.
>>>>
>>>>> I thought about trying to change some of the parameters related to
>>>>> ixgbe driver and observe if anything is changing, but when I am
>>>>> trying to do:
>>>>>
>>>>> sudo modprobe ixgbe IntMode=0
>>>>>
>>>>> I get the following error in the dmesg:
>>>>>
>>>>> [ 2137.324772] ixgbe: unknown parameter 'IntMode' ignored <<<<<<<<<
>>>> […]
>>>>
>>>> `modinfo ixgbe` shows the supported parameters.
>>>> PS: If you need help bisecting, please ask. Otherwise, I am out of
>>>> this thread.
>>> Ok, how exactly I can bisect this issue?
>> What have you tried so far? As written in the past, I’d first try more
>> distributions, for example, older Ubuntu versions. Then, if you have
>> some range, I’d use the Ubuntu PPA, and then between the release
>> candidate versions, only then start doing `git bisect` as documented in
>> the documentation [3].
> Hmmm. I'm not an expert in that area, but if you follow Paul's advice
> keep in mind that a deliberate config change by the distro might have an
> impact here. Hence it might be a good idea to rule that out first by
> taking a config from a working kernel and using it (with the help of
> "make olddefconfig") to build your own kernel from the version that is
> known to fail. But over such a wide range of versions this can be
> tricky. :-/
>
> But apart from that Paul is right afaics: nobody yet had an idea what
> might cause this regression, hence we need a bisection to pin-point the
> problem.

Thanks for the advice. I`ll try my best to find out which commit caused 
the problem, but it will take me some time as I have never done 
bisecting especially on that scale. What`s wondering me the most is that 
nobody reported this issue so far taking into account that these 
platforms along with Debian and Intel 82599EN NIC is quite common 
configuration I think.

Best regards

Bartek Kois

> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
>
>
>
>>>>>>>>>>> [1]: https://bugzilla.kernel.org/
>>>>>>>>>>> [2]: https://kernel.ubuntu.com/~kernel-ppa/mainline/
>> [3]: https://www.kernel.org/doc/html/latest/admin-guide/bug-bisect.html
>>
>>

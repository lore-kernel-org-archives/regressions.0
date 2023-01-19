Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69C5A93E
	for <regressions@lists.linux.dev>; Thu, 19 Jan 2023 17:17:38 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id j17so2124242wms.0
        for <regressions@lists.linux.dev>; Thu, 19 Jan 2023 09:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M5fB904RJZhhvOHmc+szRIsZEQHfGsIcryAvElxiTf8=;
        b=O8Nd3gbPzOpQN4qPZSlvOOE/QfwfhnDkL6/w7Xdtrf86w92eQl11+s9AuIUwIa/+Kc
         XINkVAV+guSD877jq8YiQhBjTuABigjKbECQ3LIG+/ePqoiu0hVpWRGqz1ICXzhNu7gE
         fK6XTa+vmL2NJP4CXNzZ9Ax4od7oAm5ZpteHNznI1BE2wWyX7P6ZD9t1+FtnHuNPky8S
         9/SqFaG33as8XSyvAdLrm5HfJ+zKzDqAZriOq8HcqY1dNt6UbFDHaK5/wdFp+hl3x++S
         KcwRvGLGOFjYHnQJ7V9Pj7OsFppAYiFiuQSr26ZV04QAKpeAaWDI02dVhIqTL4BgZwv7
         CLdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M5fB904RJZhhvOHmc+szRIsZEQHfGsIcryAvElxiTf8=;
        b=okIwhhk4nzHLdwLh4foY2O+OhrzTNd/R/APZWpsyLGt7A1Mz+8icu+nCDpwIJK1r1s
         sRi6BNG/O920dxMcuJGlO9e7HIU6rAkJQ5QH832sM1Lohh5G7zJu3mFf0hPvLfzqMwPI
         nnilbZvHhH3UHPjplmgbrMr1D/AW+hnJA7sCv6qEM+hyyZazzH9V1jLI/kgHf9pQP5H6
         o+2SHxJGUeVnK5GBqM82Q1mNKqQ+S4i7KSKhMgontisoujpFDhYiy2sKA4LnRT8HmMjX
         9sKSI0IPiZKxrIRzHqtgBwxvNgkTRicwc/uM+oMULo4rCyVyMkdH5QQXfDJ8ZfBSrQme
         Q4og==
X-Gm-Message-State: AFqh2kpqePcpJ2QWnFsGQQBKi9bPyaGPSqxZsOUtu7jcvGKEYk/3nq3p
	OqRphAwIdF5OznxvOF9/mXgEosTn83I=
X-Google-Smtp-Source: AMrXdXsnvq6BjBfMLwTsB8KTBomSejPUrW1D+Zy81QTNhtMGu8CYSTAAsNVvDcXKH3MAwVZ8DwJAMg==
X-Received: by 2002:a05:600c:c07:b0:3da:ff60:f5c9 with SMTP id fm7-20020a05600c0c0700b003daff60f5c9mr10892046wmb.40.1674148657044;
        Thu, 19 Jan 2023 09:17:37 -0800 (PST)
Received: from [10.0.1.21] ([91.231.125.82])
        by smtp.gmail.com with ESMTPSA id w10-20020a05600c474a00b003db00747fdesm5497163wmo.15.2023.01.19.09.17.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 09:17:36 -0800 (PST)
Message-ID: <3b957674-a559-ac1e-27b8-b81e6eeffe75@gmail.com>
Date: Thu, 19 Jan 2023 18:17:35 +0100
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
From: Bartek Kois <bartek.kois@gmail.com>
In-Reply-To: <d20a0ae8-d46e-2b8a-5587-5416e9013643@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

W dniu 19.01.2023 o 18:09, Paul Menzel pisze:
> Dear Bartek,
>
>
> Am 19.01.23 um 17:58 schrieb Bartek Kois:
>> W dniu 19.01.2023 o 13:24, Bartek Kois pisze:
>>>
>>> W dniu 19.01.2023 o 11:17, Paul Menzel pisze:
>>>>
>>>> #regzbot ^introduced: 4.9.88..5.10.149
>
>>>> Am 14.01.23 um 11:23 schrieb Bartek Kois:
>>>>
>>>>> After moving from Debian 9.7 to 11.5 as soon as I perform "ip link 
>>>>> set enp1s0 up" for my 10G adapter (AOC-STGN-I1S - Intel 82599EN 
>>>>> based 10G adapter) I am experiencing high cpu load (even if no 
>>>>> traffic is passing through the adapter) and network performance is 
>>>>> low (when network is connected).
>>>>
>>>> How do you test the network performance? Please give exact numbers 
>>>> for comparison.
>>>>
>>> I am using this server as a router for my subscribers with iptables 
>>> (for NAT and firewall) and hfsc (for QoS). First I encountered this 
>>> problem while migrating form Debian 9.7 to 11.5. Routers based  on 
>>> Supermicro X11SSL-F (Intel® C232 chipset) works with no problems 
>>> after that migration, but routers based on Supermicro X9SCL (Intel 
>>> C202 PCH) and Supermicro X10SLL+-F (Intel C222 Express PCH) starts 
>>> behaving strangely with high cpu load (0.5-0.8 while before it was 
>>> around 0.0-0.1) and subscribers not being able to utilize their 
>>> plans. I tried to strip down the problem and ends up with clean 
>>> system with no iptables or hfsc rules behaving the same (higher 
>>> load) right after setting the 10G link upeven if no traffic is 
>>> passing by.
>>>
>>>>> The cpu load is oscillating between 0.1 and 0.3 on vanilla system
>>>>> with no network attached. The problem can be observed on the 
>>>>> following platforms: Supermicro X9SCL (Intel C202 PCH) and
>>>>> Supermicro X10SLL+-F (Intel C222 Express PCH), but for the Supermicro
>>>>> X11SSL-F (Intel® C232 chipset) everything is working well.
>>>>>
>>>>> Tested environments:
>>>>> Debian 9.7 - Linux 4.9.0-6-amd64 #1 SMP Debian 4.9.88-1+deb9u1 
>>>>> (2018-05-07) x86_64 GNU/Linux [all platforms working well with no 
>>>>> problems: Supermicro X9SCL (Intel C202 PCH), Supermicro X10SLL+-F 
>>>>> (Intel C222 Express PCH), Supermicro X11SSL-F (Intel® C232 chipset)]
>>>>
>>>>> Debian 11.5 - Linux 5.10.0-19-amd64 #1 SMP Debian 5.10.149-2 
>>>>> (2022-10-21) x86_64 GNU/Linux [older platforms: Supermicro X9SCL 
>>>>> (Intel C202 PCH), Supermicro X10SLL+-F (Intel C222 Express PCH) 
>>>>> behave problematic as described above | newer platform: Supermicro 
>>>>> X11SSL-F (Intel® C232 chipset) working well with no problems]
>>>>
>>>> Maybe create a bug at the Linux kernel bug tracker [1], where you 
>>>> can attach all the logs (`dmesg`, `lspci -nnk -s …`, …).
>>>>
>>> I`ve already reported that to the Debian team 
>>> ttps://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1024763, but so far 
>>> nobody took care of this issue so far.
>>>
>>>>> So far to solve the problem I was trying to upgrade system to the 
>>>>> newest stable version, upgrade kernel to version 6.x, upgrade 
>>>>> ixgbe driver to the newest version but with no luck.
>>>>
>>>> Thank you for checking that. Too bad it’s still present. To rule 
>>>> out some user space problem, could you test Debian 9.7 with a 
>>>> stable Linux release, currently 6.1.7?
>>>>
>>>> What does `sudo perf top --sort comm,dso` show, where the time is 
>>>> spent?
>>>
>>> During my first test in real enviroment with subscribers I gether 
>>> the following data through the perf:
>>>
>>>   27.83%  [kernel]                   [k] strncpy
>>>   14.80%  [kernel]                   [k] nft_do_chain
>>>    7.61%  [kernel]                   [k] memcmp
>>>    5.63%  [kernel]                   [k] nft_meta_get_eval
>>>    3.14%  [kernel]                   [k] nft_cmp_eval
>>>    2.79%  [kernel]                   [k] asm_exc_nmi
>>>    1.07%  [kernel]                   [k] module_get_kallsym
>>>    0.92%  [kernel]                   [k] 
>>> kallsyms_expand_symbol.constprop.0
>>>    0.85%  [kernel]                   [k] ixgbe_poll
>>>    0.75%  [kernel]                   [k] format_decode
>>>    0.61%  [kernel]                   [k] number
>>>    0.56%  [kernel]                   [k] menu_select
>>>    0.54%  [kernel]                   [k] clflush_cache_range
>>>    0.52%  [kernel]                   [k] cpuidle_enter_state
>>>    0.51%  [kernel]                   [k] vsnprintf
>>>    0.50%  [kernel]                   [k] u32_classify
>>>    0.49%  [kernel]                   [k] fib_table_lookup
>>>    0.40%  [kernel]                   [k] dma_pte_clear_level
>>>    0.39%  [kernel]                   [k] domain_mapping
>>>    0.36%  [kernel]                   [k] ixgbe_xmit_fram
>>>
>>>
>>>     PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM TIME+ 
>>> COMMAND
>>>      18 root      20   0       0      0      0 S  28.2   0.0 7:06.27 
>>> ksoftirqd/1
>>>      12 root      20   0       0      0      0 R  12.0   0.0 4:10.88 
>>> ksoftirqd/0
>
> […]
>
> Do you see different behavior in `/proc/interrupts`?
>
This is how it looks like for Debian 11.5 - Linux 5.10.0-19-amd64 #1 SMP 
Debian 5.10.149-2 (2022-10-21) x86_64 GNU/Linux on Supermicro X10SLL+-F 
(Intel C222 Express PCH):

       1 root      20   0  163948  10288   7696 S   0.0   0.1 0:39.58 
systemd
       2 root      20   0       0      0      0 S   0.0   0.0 0:00.17 
kthreadd
       3 root       0 -20       0      0      0 I   0.0   0.0 0:00.00 rcu_gp
       4 root       0 -20       0      0      0 I   0.0   0.0 0:00.00 
rcu_par_gp
       6 root       0 -20       0      0      0 I   0.0   0.0 0:00.00 
kworker/0:0H-kblockd
       9 root       0 -20       0      0      0 I   0.0   0.0 0:00.00 
mm_percpu_wq
      10 root      20   0       0      0      0 S   0.0   0.0 0:00.00 
rcu_tasks_rude_
      11 root      20   0       0      0      0 S   0.0   0.0 0:00.00 
rcu_tasks_trace
      12 root      20   0       0      0      0 S   0.0   0.0 6:07.13 
ksoftirqd/0
      13 root      20   0       0      0      0 I   0.0   0.0 4:15.28 
rcu_sched
      14 root      rt   0       0      0      0 S   0.0   0.0 0:03.20 
migration/0
      15 root      20   0       0      0      0 S   0.0   0.0 0:00.00 
cpuhp/0
      16 root      20   0       0      0      0 S   0.0   0.0 0:00.00 
cpuhp/1
      17 root      rt   0       0      0      0 S   0.0   0.0 0:02.75 
migration/1
      18 root      20   0       0      0      0 S   0.0   0.0 4:35.84 
ksoftirqd/1
      20 root       0 -20       0      0      0 I   0.0   0.0 0:00.00 
kworker/1:0H-events_highpri
      21 root      20   0       0      0      0 S   0.0   0.0 0:00.00 
cpuhp/2
      22 root      rt   0       0      0      0 S   0.0   0.0 0:01.37 
migration/2
      23 root      20   0       0      0      0 S   0.0   0.0 8:18.23 
ksoftirqd/2
      25 root       0 -20       0      0      0 I   0.0   0.0 0:00.00 
kworker/2:0H-events_highpri
      26 root      20   0       0      0      0 S   0.0   0.0 0:00.00 
cpuhp/3
      27 root      rt   0       0      0      0 S   0.0   0.0 0:01.76 
migration/3
      28 root      20   0       0      0      0 S   0.0   0.0 8:45.46 
ksoftirqd/3
      30 root       0 -20       0      0      0 I   0.0   0.0 0:00.00 
kworker/3:0H-events_highpri
      31 root      20   0       0      0      0 S   0.0   0.0 0:00.00 
cpuhp/4
      32 root      rt   0       0      0      0 S   0.0   0.0 0:04.39 
migration/4
      33 root      20   0       0      0      0 S   0.0   0.0 3:44.08 
ksoftirqd/4
      35 root       0 -20       0      0      0 I   0.0   0.0 0:00.00 
kworker/4:0H-events_highpri
      36 root      20   0       0      0      0 S   0.0   0.0 0:00.00 
cpuhp/5
      37 root      rt   0       0      0      0 S   0.0   0.0 0:02.44 
migration/5
      38 root      20   0       0      0      0 S   0.0   0.0 4:04.34 
ksoftirqd/5
      40 root       0 -20       0      0      0 I   0.0   0.0 0:00.00 
kworker/5:0H-events_highpri
      41 root      20   0       0      0      0 S   0.0   0.0 0:00.00 
cpuhp/6
      42 root      rt   0       0      0      0 S   0.0   0.0 0:01.95 
migration/6
      43 root      20   0       0      0      0 S   0.0   0.0 3:35.38 
ksoftirqd/6
      45 root       0 -20       0      0      0 I   0.0   0.0 0:00.00 
kworker/6:0H-kblockd
      46 root      20   0       0      0      0 S   0.0   0.0 0:00.00 
cpuhp/7
      47 root      rt   0       0      0      0 S   0.0   0.0 0:01.07 
migration/7
      48 root      20   0       0      0      0 S   0.0   0.0 0:00.16 
ksoftirqd/7
      50 root       0 -20       0      0      0 I   0.0   0.0 0:00.00 
kworker/7:0H-kblockd
      59 root      20   0       0      0      0 S   0.0   0.0 0:00.00 
kdevtmpfs
      60 root       0 -20       0      0      0 I   0.0   0.0 0:00.00 netns
      61 root      20   0       0      0      0 S   0.0   0.0 0:00.00 
kauditd
      62 root      20   0       0      0      0 S   0.0   0.0 0:00.09 
khungtaskd
      63 root      20   0       0      0      0 S   0.0   0.0 0:00.00 
oom_reaper
      64 root       0 -20       0      0      0 I   0.0   0.0 0:00.00 
writeback
      65 root      20   0       0      0      0 S   0.0   0.0 0:07.72 
kcompactd0
      66 root      25   5       0      0      0 S   0.0   0.0 0:00.00 ksmd
      67 root      39  19       0      0      0 S   0.0   0.0 0:01.19 
khugepaged
      85 root       0 -20       0      0      0 I   0.0   0.0 0:00.00 
kintegrityd
      86 root       0 -20       0      0      0 I   0.0   0.0 0:00.00 
kblockd
      87 root       0 -20       0      0      0 I   0.0   0.0 0:00.00 
blkcg_punt_bio
      88 root       0 -20       0      0      0 I   0.0   0.0 0:00.00 
edac-poller
      89 root       0 -20       0      0      0 I   0.0   0.0 0:00.00 
devfreq_wq
      91 root       0 -20       0      0      0 I   0.0   0.0 0:02.57 
kworker/1:1H-kblockd
      92 root      20   0       0      0      0 S   0.0   0.0 0:00.00 
kswapd0
      93 root       0 -20       0      0      0 I   0.0   0.0 0:00.00 
kthrotld
      94 root       0 -20       0      0      0 I   0.0   0.0 0:00.00 
acpi_thermal_pm
      96 root       0 -20       0      0      0 I   0.0   0.0 0:00.00 
ipv6_addrconf
     104 root       0 -20       0      0      0 I   0.0   0.0 0:00.68 
kworker/2:1H-kblockd
     109 root       0 -20       0      0      0 I   0.0   0.0 0:00.00 kstrp
     112 root       0 -20       0      0      0 I   0.0   0.0 0:00.00 
zswap-shrink
     113 root       0 -20       0      0      0 I   0.0   0.0 0:00.00 
kworker/u17:0

and for Debian 9.7 - Linux 4.9.0-6-amd64 #1 SMP Debian 4.9.88-1+deb9u1 
on Supermicro X10SLL+-F (Intel C222 Express PCH)

31659 root      20   0       0      0      0 S   0.3  0.0 0:00.92 
kworker/7:0
     1 root      20   0   57032   6736   5256 S   0.0  0.1 2:28.14 systemd
     2 root      20   0       0      0      0 S   0.0  0.0 0:00.19 kthreadd
     3 root      20   0       0      0      0 S   0.0  0.0 0:35.42 
ksoftirqd/0
     5 root       0 -20       0      0      0 S   0.0  0.0 0:00.00 
kworker/0:0H
     7 root      20   0       0      0      0 S   0.0  0.0 2:36.16 rcu_sched
     8 root      20   0       0      0      0 S   0.0  0.0 0:00.00 rcu_bh
     9 root      rt   0       0      0      0 S   0.0  0.0 0:00.28 
migration/0
    10 root       0 -20       0      0      0 S   0.0  0.0 0:00.00 
lru-add-drain
    11 root      rt   0       0      0      0 S   0.0  0.0 0:00.25 
watchdog/0
    12 root      20   0       0      0      0 S   0.0  0.0 0:00.00 cpuhp/0
    13 root      20   0       0      0      0 S   0.0  0.0 0:00.00 cpuhp/1
    14 root      rt   0       0      0      0 S   0.0  0.0 0:00.31 
watchdog/1
    15 root      rt   0       0      0      0 S   0.0  0.0 0:25.69 
migration/1
    16 root      20   0       0      0      0 S   0.0  0.0 1:10.62 
ksoftirqd/1
    18 root       0 -20       0      0      0 S   0.0  0.0 0:00.00 
kworker/1:0H
    19 root      20   0       0      0      0 S   0.0  0.0 0:00.00 cpuhp/2
    20 root      rt   0       0      0      0 S   0.0  0.0 0:00.26 
watchdog/2
    21 root      rt   0       0      0      0 S   0.0  0.0 0:10.18 
migration/2
    22 root      20   0       0      0      0 S   0.0  0.0 0:51.08 
ksoftirqd/2
    24 root       0 -20       0      0      0 S   0.0  0.0 0:00.00 
kworker/2:0H
    25 root      20   0       0      0      0 S   0.0  0.0 0:00.00 cpuhp/3
    26 root      rt   0       0      0      0 S   0.0  0.0 0:00.23 
watchdog/3
    27 root      rt   0       0      0      0 S   0.0  0.0 0:00.32 
migration/3
    28 root      20   0       0      0      0 S   0.0  0.0 0:48.46 
ksoftirqd/3
    30 root       0 -20       0      0      0 S   0.0  0.0 0:00.00 
kworker/3:0H
    31 root      20   0       0      0      0 S   0.0  0.0 0:00.00 cpuhp/4
    32 root      rt   0       0      0      0 S   0.0  0.0 0:00.21 
watchdog/4
    33 root      rt   0       0      0      0 S   0.0  0.0 0:00.25 
migration/4
    34 root      20   0       0      0      0 S   0.0  0.0 0:36.35 
ksoftirqd/4
    36 root       0 -20       0      0      0 S   0.0  0.0 0:00.00 
kworker/4:0H
    37 root      20   0       0      0      0 S   0.0  0.0 0:00.00 cpuhp/5
    38 root      rt   0       0      0      0 S   0.0  0.0 0:00.22 
watchdog/5
    39 root      rt   0       0      0      0 S   0.0  0.0 0:04.02 
migration/5
    40 root      20   0       0      0      0 S   0.0  0.0 0:41.43 
ksoftirqd/5
    42 root       0 -20       0      0      0 S   0.0  0.0 0:00.00 
kworker/5:0H
    43 root      20   0       0      0      0 S   0.0  0.0 0:00.00 cpuhp/6
    44 root      rt   0       0      0      0 S   0.0  0.0 0:00.22 
watchdog/6
    45 root      rt   0       0      0      0 S   0.0  0.0 0:01.53 
migration/6
    46 root      20   0       0      0      0 S   0.0  0.0 0:41.66 
ksoftirqd/6
    48 root       0 -20       0      0      0 S   0.0  0.0 0:00.00 
kworker/6:0H
    49 root      20   0       0      0      0 S   0.0  0.0 0:00.00 cpuhp/7
    50 root      rt   0       0      0      0 S   0.0  0.0 0:00.24 
watchdog/7
    51 root      rt   0       0      0      0 S   0.0  0.0 0:00.27 
migration/7
    52 root      20   0       0      0      0 S   0.0  0.0 0:46.13 
ksoftirqd/7
    54 root       0 -20       0      0      0 S   0.0  0.0 0:00.00 
kworker/7:0H
    55 root      20   0       0      0      0 S   0.0  0.0 0:00.00 kdevtmpfs
    56 root       0 -20       0      0      0 S   0.0  0.0 0:00.00 netns
    57 root      20   0       0      0      0 S   0.0  0.0 0:00.07 
khungtaskd
    58 root      20   0       0      0      0 S   0.0  0.0 0:00.00 
oom_reaper
    59 root       0 -20       0      0      0 S   0.0  0.0 0:00.00 writeback
    60 root      20   0       0      0      0 S   0.0  0.0 0:00.00 
kcompactd0
    62 root      25   5       0      0      0 S   0.0  0.0 0:00.00 ksmd
    63 root      39  19       0      0      0 S   0.0  0.0 0:00.00 
khugepaged
    64 root       0 -20       0      0      0 S   0.0  0.0 0:00.00 crypto
    65 root       0 -20       0      0      0 S   0.0  0.0 0:00.00 
kintegrityd
    66 root       0 -20       0      0      0 S   0.0  0.0 0:00.00 bioset
    67 root       0 -20       0      0      0 S   0.0  0.0 0:00.00 kblockd
    75 root       0 -20       0      0      0 S   0.0  0.0 0:00.00 
devfreq_wq
    76 root       0 -20       0      0      0 S   0.0  0.0 0:00.00 watchdogd
    77 root      20   0       0      0      0 S   0.0  0.0 0:00.00 kswapd0
    78 root       0 -20       0      0      0 S   0.0  0.0 0:00.00 vmstat
    90 root       0 -20       0      0      0 S   0.0  0.0 0:00.00 kthrotld
    91 root       0 -20       0      0      0 S   0.0  0.0 0:00.00 
ipv6_addrconf
   121 root       0 -20       0      0      0 S   0.0  0.0 0:00.00 
acpi_thermal_pm
   130 root       0 -20       0      0      0 S   0.0  0.0 0:00.00 ata_sff
   139 root       0 -20       0      0      0 S   0.0  0.0 0:00.00 ixgbe
   166 root      20   0       0      0      0 S   0.0  0.0 0:00.00 scsi_eh_0
   167 root       0 -20       0      0      0 S   0.0  0.0 0:00.00 
scsi_tmf_0
   168 root      20   0       0      0      0 S   0.0  0.0 0:00.00 scsi_eh_1
   169 root       0 -20       0      0      0 S   0.0  0.0 0:00.00 
scsi_tmf_1
   170 root      20   0       0      0      0 S   0.0  0.0 0:00.00 scsi_eh_2
   171 root       0 -20       0      0      0 S   0.0  0.0 0:00.00 
scsi_tmf_2
   172 root      20   0       0      0      0 S   0.0  0.0 0:00.00 scsi_eh_3
   173 root       0 -20       0      0      0 S   0.0  0.0 0:00.00 
scsi_tmf_3
   174 root      20   0       0      0      0 S   0.0  0.0 0:00.00 scsi_eh_4
   175 root       0 -20       0      0      0 S   0.0  0.0 0:00.00 
scsi_tmf_4
   176 root      20   0       0      0      0 S   0.0  0.0 0:00.00 scsi_eh_5

>>>>> Supermicro support suggested as follows:
>>>>> it might be kernel related debian 11.5 has kernel 5.10 which is a 
>>>>> recent kernel it might not properly support the chipsets for X9 
>>>>> therefore i suggest to use RHEL or CentOS as they use much older 
>>>>> kernel versions. I expect that with ubuntu 20.04 you see the same 
>>>>> problem it uses kernel 5.4
>>>> >>> Testing another GNU/Linux distribution for another data point, 
>>>> might
>>>> be a good idea.
>>>>
>>>> As nobody has responded yet, bisecting the issue is probably the 
>>>> fastest way to get to the bottom of this. Luckily the problem seems 
>>>> reproducible and you seem to be able to build a Linux kernel 
>>>> yourself, so that should work. (For testing purposes you could also 
>>>> test with Ubuntu, as they provide Linux kernel builds for (almost) 
>>>> all releases in their Linux kernel mainline PPA [2].)
>>>>
>>> Of course  I can try Ubuntu and report how it is working.
>>>
>> Ubuntu (5.15.0-43-generic) seems to be working in the same way 
>> generating higher load after executing "ip link set enp1s0 up".
>
> That is good to know. (Is this Ubuntu 22.04?) What about Ubuntu 20.04 
> with Linux 5.4, and Ubuntu 18.04 with 4.15?
>
> Anyway, I think, you won’t come around bisecting. Another hint, make 
> sure that you can build a 4.9 Linux kernel yourself, that does not 
> exhibit that issue.
>
That`s ringht, it is 22.04. I don`t have to build it. Standard kernel 
Linux 4.9.0-6-amd64 form Debian 9.7 worked without problems for past 4 
years.

Best regards

Bartek Kois

>
> Kind regards,
>
> Paul
>
>
>>>> [1]: https://bugzilla.kernel.org/
>>>> [2]: https://kernel.ubuntu.com/~kernel-ppa/mainline/

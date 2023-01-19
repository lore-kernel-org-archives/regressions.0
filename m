Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5590A93E
	for <regressions@lists.linux.dev>; Thu, 19 Jan 2023 16:58:54 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id h16so2459678wrz.12
        for <regressions@lists.linux.dev>; Thu, 19 Jan 2023 08:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vK89mhd87RS0XPzLgAAUPiNh++BiED59eavT/v8R4cM=;
        b=Jq5UfiW9bk1xDjr1RW6gF77xsjqC4qBZkTxaJmMetcNws+G96o1juICbPcYzhsO6F4
         iJfLqWYshx0nChTBcq7ArYxLi/DpboT24w2rn6VATkByj+jzQ21Snnb/+PjBjocs/KbZ
         7CPhzN4EYyEMbJOu4A4WYkOIamYuoAOBW6AC9jZbsUXmbL/SPF+Q82K3FAm5RQyLq66D
         xn4rDbG9wrHTepXj//yE8Jqp2wK5zr1/7yd2fz+hwWHpdt7krfO6RxlQYKhV3j/B+lWE
         8Fh9LO0KIO50mwGwejNoVSTbOaxuNwULdEEz0+S7HW53x3W8v22T6QahK3NbUxbQT2l5
         NAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vK89mhd87RS0XPzLgAAUPiNh++BiED59eavT/v8R4cM=;
        b=ziPo7k/kKbQcxKQ1TvcK1rgJ13JBmIWwHi4E4AGV8sQhQT3YVX3HwABWhuOEoDTZh1
         PYyYf/pNFcx/e74hug8ypltsgaisqaXfM6iLDC0i6HGQicAZnM3ANTtWxyRsqGopRd9O
         DHZA5N1DqLXyVtKzw3PJTgJuOzYAPGNcfDReleSZHLyc433afnxUlOvIVCGJprnFO2Ns
         +PfETBE3s9LQgNeLRb2PjBpT2uul5R4xsQmg8wFpAIYTQQfwekciTw9n1R87R4dpT7yJ
         QKNLZjAav7n2H+zjBGgQewSDB2U/5X24Y1U/bZGU19ipeNhrjeJHq7d8Omaewb0RnDtn
         F3Ig==
X-Gm-Message-State: AFqh2koRP1KvJzEVNt0IM03BSNJxPV5o8tKWCB5zXAuJa0RVtcv05sZj
	na/nHMCZBniDMXk8h/D6/ys=
X-Google-Smtp-Source: AMrXdXvVjNpuu39mx7+j+XXAvMwed+4mKL9je69XIbhwLVOnKkvo9hTyBiwKBUkUyQLytARatN+b+w==
X-Received: by 2002:a5d:5e85:0:b0:2bd:ec14:9c8 with SMTP id ck5-20020a5d5e85000000b002bdec1409c8mr10498543wrb.40.1674147533191;
        Thu, 19 Jan 2023 08:58:53 -0800 (PST)
Received: from [10.0.1.21] ([91.231.125.82])
        by smtp.gmail.com with ESMTPSA id w10-20020adfde8a000000b002be34f87a34sm3591308wrl.1.2023.01.19.08.58.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 08:58:52 -0800 (PST)
Message-ID: <30de7b89-6a4f-8dab-d671-027140bbb52b@gmail.com>
Date: Thu, 19 Jan 2023 17:58:51 +0100
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
From: Bartek Kois <bartek.kois@gmail.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: intel-wired-lan@osuosl.org, regressions@lists.linux.dev
References: <d1530cba-1a72-cae8-6a04-ed8ec0f82e6e@gmail.com>
 <652bf236-d97e-832c-e0f3-24927a46d7ad@molgen.mpg.de>
 <744de70c-782d-5d36-87fc-e6b92ac84190@gmail.com>
In-Reply-To: <744de70c-782d-5d36-87fc-e6b92ac84190@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

W dniu 19.01.2023 o 13:24, Bartek Kois pisze:
>
> W dniu 19.01.2023 o 11:17, Paul Menzel pisze:
>>
>> #regzbot ^introduced: 4.9.88..5.10.149
>>
>> Dear Bartek,
>>
>>
>> Am 14.01.23 um 11:23 schrieb Bartek Kois:
>>
>>> After moving from Debian 9.7 to 11.5 as soon as I perform "ip link 
>>> set enp1s0 up" for my 10G adapter (AOC-STGN-I1S - Intel 82599EN 
>>> based 10G adapter) I am experiencing high cpu load (even if no 
>>> traffic is passing through the adapter) and network performance is 
>>> low (when network is connected).
>>
>> How do you test the network performance? Please give exact numbers 
>> for comparison.
>>
> I am using this server as a router for my subscribers with iptables 
> (for NAT and firewall) and hfsc (for QoS). First I encountered this 
> problem while migrating form Debian 9.7 to 11.5. Routers based  on 
> Supermicro X11SSL-F (Intel® C232 chipset) works with no problems after 
> that migration, but routers based on Supermicro X9SCL (Intel C202 PCH) 
> and Supermicro X10SLL+-F (Intel C222 Express PCH) starts behaving 
> strangely with high cpu load (0.5-0.8 while before it was around 
> 0.0-0.1) and subscribers not being able to utilize their plans. I 
> tried to strip down the problem and ends up with clean system with no 
> iptables or hfsc rules behaving the same (higher load) right after 
> setting the 10G link upeven if no traffic is passing by.
>
>>> The cpu load is oscillating between 0.1 and 0.3 on vanilla system
>>> with no network attached. The problem can be observed on the 
>>> following platforms: Supermicro X9SCL (Intel C202 PCH) and
>>> Supermicro X10SLL+-F (Intel C222 Express PCH), but for the Supermicro
>>> X11SSL-F (Intel® C232 chipset) everything is working well.
>>>
>>> Tested environments:
>>> Debian 9.7 - Linux 4.9.0-6-amd64 #1 SMP Debian 4.9.88-1+deb9u1 
>>> (2018-05-07) x86_64 GNU/Linux [all platforms working well with no 
>>> problems: Supermicro X9SCL (Intel C202 PCH), Supermicro X10SLL+-F 
>>> (Intel C222 Express PCH), Supermicro X11SSL-F (Intel® C232 chipset)]
>>
>>> Debian 11.5 - Linux 5.10.0-19-amd64 #1 SMP Debian 5.10.149-2 
>>> (2022-10-21) x86_64 GNU/Linux  [older platforms: Supermicro X9SCL 
>>> (Intel C202 PCH), Supermicro X10SLL+-F (Intel C222 Express PCH) 
>>> behave problematic as described above | newer platform: Supermicro 
>>> X11SSL-F (Intel® C232 chipset) working well with no problems]
>>
>> Maybe create a bug at the Linux kernel bug tracker [1], where you can 
>> attach all the logs (`dmesg`, `lspci -nnk -s …`, …).
>>
> I`ve already reported that to the Debian team 
> ttps://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1024763, but so far 
> nobody took care of this issue so far.
>
>>> So far to solve the problem I was trying to upgrade system to the 
>>> newest stable version, upgrade kernel to version 6.x, upgrade ixgbe 
>>> driver to the newest version but with no luck.
>>
>> Thank you for checking that. Too bad it’s still present. To rule out 
>> some user space problem, could you test Debian 9.7 with a stable 
>> Linux release, currently 6.1.7?
>>
>> What does `sudo perf top --sort comm,dso` show, where the time is spent?
>
> During my first test in real enviroment with subscribers I gether the 
> following data through the perf:
>
>   27.83%  [kernel]                   [k] strncpy
>   14.80%  [kernel]                   [k] nft_do_chain
>    7.61%  [kernel]                   [k] memcmp
>    5.63%  [kernel]                   [k] nft_meta_get_eval
>    3.14%  [kernel]                   [k] nft_cmp_eval
>    2.79%  [kernel]                   [k] asm_exc_nmi
>    1.07%  [kernel]                   [k] module_get_kallsym
>    0.92%  [kernel]                   [k] 
> kallsyms_expand_symbol.constprop.0
>    0.85%  [kernel]                   [k] ixgbe_poll
>    0.75%  [kernel]                   [k] format_decode
>    0.61%  [kernel]                   [k] number
>    0.56%  [kernel]                   [k] menu_select
>    0.54%  [kernel]                   [k] clflush_cache_range
>    0.52%  [kernel]                   [k] cpuidle_enter_state
>    0.51%  [kernel]                   [k] vsnprintf
>    0.50%  [kernel]                   [k] u32_classify
>    0.49%  [kernel]                   [k] fib_table_lookup
>    0.40%  [kernel]                   [k] dma_pte_clear_level
>    0.39%  [kernel]                   [k] domain_mapping
>    0.36%  [kernel]                   [k] ixgbe_xmit_fram
>
>
>     PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM TIME+ 
> COMMAND
>      18 root      20   0       0      0      0 S  28.2   0.0 7:06.27 
> ksoftirqd/1
>      12 root      20   0       0      0      0 R  12.0   0.0 4:10.88 
> ksoftirqd/0
>      23 root      20   0       0      0      0 S   6.0   0.0 4:36.08 
> ksoftirqd/2
>      28 root      20   0       0      0      0 S   5.3   0.0 6:46.47 
> ksoftirqd/3
>  846449 root      20   0       0      0      0 I   1.0   0.0 0:01.61 
> kworker/0:0-events_power_efficient
>      13 root      20   0       0      0      0 I   0.3   0.0 0:13.50 
> rcu_sched
>    8264 root      20   0  101536   6944   4824 S   0.3   0.2 0:07.77 
> dhcpd
>       1 root      20   0  164048  10184   7672 S   0.0   0.3 0:04.52 
> systemd
>       2 root      20   0       0      0      0 S   0.0   0.0 0:00.00 
> kthreadd
>       3 root       0 -20       0      0      0 I   0.0   0.0 0:00.00 
> rcu_gp
>       4 root       0 -20       0      0      0 I   0.0   0.0 0:00.00 
> rcu_par_gp
>       6 root       0 -20       0      0      0 I   0.0   0.0 0:00.00 
> kworker/0:0H-events_highpri
>       9 root       0 -20       0      0      0 I   0.0   0.0 0:00.00 
> mm_percpu_wq
>      10 root      20   0       0      0      0 S   0.0   0.0 0:00.00 
> rcu_tasks_rude_
>      11 root      20   0       0      0      0 S   0.0   0.0 0:00.00 
> rcu_tasks_trace
>      14 root      rt   0       0      0      0 S   0.0   0.0 0:00.26 
> migration/0
>
>>
>>> Supermicro support suggested as follows:
>>> it might be kernel related debian 11.5 has kernel 5.10 which is a 
>>> recent kernel it might not properly support the chipsets for X9 
>>> therefore i suggest to use RHEL or CentOS as they use much older 
>>> kernel versions. I expect that with ubuntu 20.04 you see the same 
>>> problem it uses kernel 5.4
>> Testing another GNU/Linux distribution for another data point, might 
>> be a good idea.
>>
>> As nobody has responded yet, bisecting the issue is probably the 
>> fastest way to get to the bottom of this. Luckily the problem seems 
>> reproducible and you seem to be able to build a Linux kernel 
>> yourself, so that should work. (For testing purposes you could also 
>> test with Ubuntu, as they provide Linux kernel builds for (almost) 
>> all releases in their Linux kernel mainline PPA [2].)
>>
> Of course  I can try Ubuntu and report how it is working.
>
Ubuntu (5.15.0-43-generic) seems to be working in the same way 
generating higher load after executing "ip link set enp1s0 up".

Best regards

Bartek Kois

> Best regards
>
> Bartek Kois
>
>>
>> Kind regards,
>>
>> Paul
>>
>>
>> [1]: https://bugzilla.kernel.org/
>> [2]: https://kernel.ubuntu.com/~kernel-ppa/mainline/

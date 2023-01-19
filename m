Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391AD6FC2
	for <regressions@lists.linux.dev>; Thu, 19 Jan 2023 12:24:17 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id f19-20020a1c6a13000000b003db0ef4dedcso3439235wmc.4
        for <regressions@lists.linux.dev>; Thu, 19 Jan 2023 04:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FX9Mfb24gJlsHgP4a0XeQNRlaL2qfOwNv92m+typ/N8=;
        b=EjyrwTQV2Uxkw5+IYFQVyabv07socjV7JD9qoNWI7WGpQoWtdZZzV2hw2RIYIInkCS
         Tqt3nlwS5cFpxuZwph73GXB99gFcJ+HBmuuP9zT6tYdkx7uirGVWbMT6MHraMEed7AyC
         c+0bb4Vdippv1uG28Q6+S3EaXqGsVWaT7lT8CFXmLlw0x8IHIKWYU4iOeKF/fhGPiG5f
         AT746iEhWiiefL1jtWCeEXWvxYcHC8DKqAknx8vNC8YNVeTkgKJysRQGWm33qtYGdubI
         KEGnqNvzhUmneX9Pfo287GpFoWdXwKBusXKr74r+WTX/n00ipLu/Dd0W0R/ijKOiJeLs
         bqrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FX9Mfb24gJlsHgP4a0XeQNRlaL2qfOwNv92m+typ/N8=;
        b=w7sPWqIKzF8jfLccwNlw9uIzcda2NCHRDYSAo8/uMAGy3GETB+C7T2vV+QfkLKNFQr
         yXr6L6cjzktgZNJwrBt9ZO8X04HXaaoUhEg0jEyTUPVDRD82Pu/cG/BOj2h/LwwQR+yz
         8ueHHSVdlj43iwVDOSUDmc6zbCLcrI/C0S4od3WcPD9X+5g3p77ljOnwvFz6mYdn+ofs
         dcu/CvdeC4J0C2MpSry7yIf52Z0fNueqv/Hy9CPWOkboj1z+h/sTVZsIz1g0zmyNt+2t
         cuZa28eN6ZDx3sTKIxJZIwO4LBBLD5uFntQds3wGTp3lz1FahbvB1YtVXkUrgg23fZB5
         Yybg==
X-Gm-Message-State: AFqh2krdZaFhReZ522Ljr3+bUggNWZ2vSW3+Os9kioFLMPZ6X3uhhlBD
	hGRldlGXz7D9xmE+7p2OuRk=
X-Google-Smtp-Source: AMrXdXtL0Czzu3r5rTHxGVeZDdrr/t86wi3Oz99Him2TnvwyX48P5OCan+l3t7eBv9N/HUKLXcg1Fw==
X-Received: by 2002:a05:600c:3d96:b0:3db:26b7:2fc8 with SMTP id bi22-20020a05600c3d9600b003db26b72fc8mr1125857wmb.39.1674131055307;
        Thu, 19 Jan 2023 04:24:15 -0800 (PST)
Received: from [10.0.10.31] (rejtana.telefonserwis.pl. [91.231.125.228])
        by smtp.gmail.com with ESMTPSA id bp28-20020a5d5a9c000000b00273cd321a1bsm33725760wrb.107.2023.01.19.04.24.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 04:24:14 -0800 (PST)
Message-ID: <744de70c-782d-5d36-87fc-e6b92ac84190@gmail.com>
Date: Thu, 19 Jan 2023 13:24:13 +0100
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
From: Bartek Kois <bartek.kois@gmail.com>
In-Reply-To: <652bf236-d97e-832c-e0f3-24927a46d7ad@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


W dniu 19.01.2023 o 11:17, Paul Menzel pisze:
>
> #regzbot ^introduced: 4.9.88..5.10.149
>
> Dear Bartek,
>
>
> Am 14.01.23 um 11:23 schrieb Bartek Kois:
>
>> After moving from Debian 9.7 to 11.5 as soon as I perform "ip link 
>> set enp1s0 up" for my 10G adapter (AOC-STGN-I1S - Intel 82599EN based 
>> 10G adapter) I am experiencing high cpu load (even if no traffic is 
>> passing through the adapter) and network performance is low (when 
>> network is connected).
>
> How do you test the network performance? Please give exact numbers for 
> comparison.
>
I am using this server as a router for my subscribers with iptables (for 
NAT and firewall) and hfsc (for QoS). First I encountered this problem 
while migrating form Debian 9.7 to 11.5. Routers based  on Supermicro 
X11SSL-F (Intel® C232 chipset) works with no problems after that 
migration, but routers based on Supermicro X9SCL (Intel C202 PCH) and 
Supermicro X10SLL+-F (Intel C222 Express PCH) starts behaving strangely 
with high cpu load (0.5-0.8 while before it was around 0.0-0.1) and 
subscribers not being able to utilize their plans. I tried to strip down 
the problem and ends up with clean system with no iptables or hfsc rules 
behaving the same (higher load) right after setting the 10G link upeven 
if no traffic is passing by.

>> The cpu load is oscillating between 0.1 and 0.3 on vanilla system
>> with no network attached. The problem can be observed on the 
>> following platforms: Supermicro X9SCL (Intel C202 PCH) and
>> Supermicro X10SLL+-F (Intel C222 Express PCH), but for the Supermicro
>> X11SSL-F (Intel® C232 chipset) everything is working well.
>>
>> Tested environments:
>> Debian 9.7 - Linux 4.9.0-6-amd64 #1 SMP Debian 4.9.88-1+deb9u1 
>> (2018-05-07) x86_64 GNU/Linux [all platforms working well with no 
>> problems: Supermicro X9SCL (Intel C202 PCH), Supermicro X10SLL+-F 
>> (Intel C222 Express PCH), Supermicro X11SSL-F (Intel® C232 chipset)]
>
>> Debian 11.5 - Linux 5.10.0-19-amd64 #1 SMP Debian 5.10.149-2 
>> (2022-10-21) x86_64 GNU/Linux  [older platforms: Supermicro X9SCL 
>> (Intel C202 PCH), Supermicro X10SLL+-F (Intel C222 Express PCH) 
>> behave problematic as described above | newer platform: Supermicro 
>> X11SSL-F (Intel® C232 chipset) working well with no problems]
>
> Maybe create a bug at the Linux kernel bug tracker [1], where you can 
> attach all the logs (`dmesg`, `lspci -nnk -s …`, …).
>
I`ve already reported that to the Debian team 
ttps://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1024763, but so far 
nobody took care of this issue so far.

>> So far to solve the problem I was trying to upgrade system to the 
>> newest stable version, upgrade kernel to version 6.x, upgrade ixgbe 
>> driver to the newest version but with no luck.
>
> Thank you for checking that. Too bad it’s still present. To rule out 
> some user space problem, could you test Debian 9.7 with a stable Linux 
> release, currently 6.1.7?
>
> What does `sudo perf top --sort comm,dso` show, where the time is spent?

During my first test in real enviroment with subscribers I gether the 
following data through the perf:

   27.83%  [kernel]                   [k] strncpy
   14.80%  [kernel]                   [k] nft_do_chain
    7.61%  [kernel]                   [k] memcmp
    5.63%  [kernel]                   [k] nft_meta_get_eval
    3.14%  [kernel]                   [k] nft_cmp_eval
    2.79%  [kernel]                   [k] asm_exc_nmi
    1.07%  [kernel]                   [k] module_get_kallsym
    0.92%  [kernel]                   [k] kallsyms_expand_symbol.constprop.0
    0.85%  [kernel]                   [k] ixgbe_poll
    0.75%  [kernel]                   [k] format_decode
    0.61%  [kernel]                   [k] number
    0.56%  [kernel]                   [k] menu_select
    0.54%  [kernel]                   [k] clflush_cache_range
    0.52%  [kernel]                   [k] cpuidle_enter_state
    0.51%  [kernel]                   [k] vsnprintf
    0.50%  [kernel]                   [k] u32_classify
    0.49%  [kernel]                   [k] fib_table_lookup
    0.40%  [kernel]                   [k] dma_pte_clear_level
    0.39%  [kernel]                   [k] domain_mapping
    0.36%  [kernel]                   [k] ixgbe_xmit_fram


     PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM TIME+ COMMAND
      18 root      20   0       0      0      0 S  28.2   0.0 7:06.27 
ksoftirqd/1
      12 root      20   0       0      0      0 R  12.0   0.0 4:10.88 
ksoftirqd/0
      23 root      20   0       0      0      0 S   6.0   0.0 4:36.08 
ksoftirqd/2
      28 root      20   0       0      0      0 S   5.3   0.0 6:46.47 
ksoftirqd/3
  846449 root      20   0       0      0      0 I   1.0   0.0 0:01.61 
kworker/0:0-events_power_efficient
      13 root      20   0       0      0      0 I   0.3   0.0 0:13.50 
rcu_sched
    8264 root      20   0  101536   6944   4824 S   0.3   0.2 0:07.77 dhcpd
       1 root      20   0  164048  10184   7672 S   0.0   0.3 0:04.52 
systemd
       2 root      20   0       0      0      0 S   0.0   0.0 0:00.00 
kthreadd
       3 root       0 -20       0      0      0 I   0.0   0.0 0:00.00 rcu_gp
       4 root       0 -20       0      0      0 I   0.0   0.0 0:00.00 
rcu_par_gp
       6 root       0 -20       0      0      0 I   0.0   0.0 0:00.00 
kworker/0:0H-events_highpri
       9 root       0 -20       0      0      0 I   0.0   0.0 0:00.00 
mm_percpu_wq
      10 root      20   0       0      0      0 S   0.0   0.0 0:00.00 
rcu_tasks_rude_
      11 root      20   0       0      0      0 S   0.0   0.0 0:00.00 
rcu_tasks_trace
      14 root      rt   0       0      0      0 S   0.0   0.0 0:00.26 
migration/0

>
>> Supermicro support suggested as follows:
>> it might be kernel related debian 11.5 has kernel 5.10 which is a 
>> recent kernel it might not properly support the chipsets for X9 
>> therefore i suggest to use RHEL or CentOS as they use much older 
>> kernel versions. I expect that with ubuntu 20.04 you see the same 
>> problem it uses kernel 5.4
> Testing another GNU/Linux distribution for another data point, might 
> be a good idea.
>
> As nobody has responded yet, bisecting the issue is probably the 
> fastest way to get to the bottom of this. Luckily the problem seems 
> reproducible and you seem to be able to build a Linux kernel yourself, 
> so that should work. (For testing purposes you could also test with 
> Ubuntu, as they provide Linux kernel builds for (almost) all releases 
> in their Linux kernel mainline PPA [2].)
>
Of course  I can try Ubuntu and report how it is working.

Best regards

Bartek Kois

>
> Kind regards,
>
> Paul
>
>
> [1]: https://bugzilla.kernel.org/
> [2]: https://kernel.ubuntu.com/~kernel-ppa/mainline/

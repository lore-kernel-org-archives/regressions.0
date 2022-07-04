Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310487E
	for <regressions@lists.linux.dev>; Mon,  4 Jul 2022 10:56:49 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1o8Jl1-0004dY-7H; Mon, 04 Jul 2022 12:56:47 +0200
Message-ID: <73d98a7c-6781-3729-89b4-b1498f919ae4@leemhuis.info>
Date: Mon, 4 Jul 2022 12:56:46 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [REGRESSION] r8169: RTL8168h "transmit queue 0 timed out" after
 ASPM L1 enablement #forregzbot
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <9ebb43ee-52a1-c77d-d609-ca447a32f3e6@posteo.at>
 <60f4d5b4-804d-dfb3-5810-bacf1e3401cb@web.de>
 <93000ee0-7c9b-c636-c21a-eaade2ba1f6c@leemhuis.info>
In-Reply-To: <93000ee0-7c9b-c636-c21a-eaade2ba1f6c@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1656932209;0a61b3fd;
X-HE-SMSGID: 1o8Jl1-0004dY-7H

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 20.06.22 08:40, Thorsten Leemhuis wrote:
> On 08.06.22 09:30, Heiner Kallweit wrote:
>> On 08.06.2022 02:44, Bernhard Hampel-Waffenthal wrote:
>>> #regzbot introduced: 4b5f82f6aaef3fa95cce52deb8510f55ddda6a71
>>>
>>> since the last major kernel version upgrade to 5.18 on Arch Linux I'm unable to get a usable ethernet connection on my desktop PC.
>>>
>>> I can see a timeout in the logs
>>>
>>>> kernel: NETDEV WATCHDOG: enp37s0 (r8169): transmit queue 0 timed out
>>>
>>> and regular very likely related errors after
>>>
>>>> kernel: r8169 0000:25:00.0 enp37s0: rtl_rxtx_empty_cond == 0 (loop: 42, delay: 100).
>>>
>>> The link does manage to go up at nominal full 1Gbps speed, but there is no usable connection to speak of and pings are very bursty and take multiple seconds.
>>>
>>> I was able to pinpoint that the problems were introduced in commit 4b5f82f6aaef3fa95cce52deb8510f55ddda6a71 with the enablement of ASPM L1/L1.1 for ">= RTL_GIGA_MAC_VER_45", which my chip falls under. Adding pcie_aspm=off the kernel command line or changing that check to ">= RTL_GIGA_MAC_VER_60" for testing purposes and recompiling the kernel fixes my problems.
>>>
>>> I'm using a MSI B450I GAMING PLUS AC motherboard with a RTL8168h chip as per dmesg:
>>>
>>>> r8169 0000:25:00.0 eth0: RTL8168h/8111h, 30:9c:23:de:97:a9, XID 541, IRQ 101
>>>
>>> lspci says:
>>>
>>>> 25:00.0 Ethernet controller [0200]: Realtek Semiconductor Co., Ltd. RTL8111/8168/8411 PCI Express Gigabit Ethernet Controller [10ec:8168] (rev 15)
>>>         Subsystem: Micro-Star International Co., Ltd. [MSI] Device [1462:7a40]
>>>         Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx+
>>>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>>>         Latency: 0, Cache Line Size: 64 bytes
>>>         Interrupt: pin A routed to IRQ 30
>>>         IOMMU group: 14
>>>         Region 0: I/O ports at f000 [size=256]
>>>         Region 2: Memory at fcb04000 (64-bit, non-prefetchable) [size=4K]
>>>         Region 4: Memory at fcb00000 (64-bit, non-prefetchable) [size=16K]
>>>         Capabilities: <access denied>
>>>         Kernel driver in use: r8169
>>>         Kernel modules: r8169
>>>
>> Thanks for the report. On my test systems RTL8168h works fine with ASPM L1 and L1.1, so it seems to be
>> a board-specific issue.
> 
> Well, we already removed changes like the one causing this if things
> like ASPM cause regressions only for some users because their HW is
> flawky. But I'd prefer to avoid that myself.
> 
>> Some reports in the past indicated that changing IOMMU settings may help,
>> you can also use the ASPM sysfs link attributes to disable selected ASPM states for just this link.
> 
> Bernhard, did this or the suggestions from Hans help to solve the
> problem for you?
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> 
> P.S.: As the Linux kernel's regression tracker I deal with a lot of
> reports and sometimes miss something important when writing mails like
> this. If that's the case here, don't hesitate to tell me in a public
> reply, it's in everyone's interest to set the public record straight.

#regzbot invalid: reporter didn't reply, might be satisfied with the
help he got, and a tricky situation anyway

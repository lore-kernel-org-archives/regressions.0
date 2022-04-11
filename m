Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4027D1363
	for <regressions@lists.linux.dev>; Mon, 11 Apr 2022 10:23:32 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ndrCk-0006XD-Cw; Mon, 11 Apr 2022 12:23:30 +0200
Message-ID: <a2033bb9-8c80-6090-5e7a-56bf507bb06c@leemhuis.info>
Date: Mon, 11 Apr 2022 12:23:29 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Bug 215678 - vmwgfx: probe of 0000:00:0f.0 failed with error -16
 #forregzbot
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <08e3a9b1-5ed3-be89-1d48-5d1061253789@leemhuis.info>
In-Reply-To: <08e3a9b1-5ed3-be89-1d48-5d1061253789@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1649672612;142469d4;
X-HE-SMSGID: 1ndrCk-0006XD-Cw

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

#regzbot fixed-by: 27599aacbaefcbf2af7b06b0029459bbf682000d

On 18.03.22 08:12, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker.
> 
> I noticed a regression report in bugzilla.kernel.org that afaics nobody
> acted upon since it was reported about a week ago, that's why I decided
> to forward it to the lists and a few relevant people to the CC. To quote
> from https://bugzilla.kernel.org/show_bug.cgi?id=215678 :
> 
>> With latest kernel, i notice this:
>>
>> dmesg | grep vmwgfx
>> [    2.959200] vmwgfx 0000:00:0f.0: vgaarb: deactivate vga console
>> [    2.959764] vmwgfx 0000:00:0f.0: BAR 1: can't reserve [mem 0xf0000000-0xf7ffffff pref]
>> [    2.959766] vmwgfx: probe of 0000:00:0f.0 failed with error -16
>>
>>
>> lspci -s 0000:00:0f.0 -nnvv
>> 00:0f.0 VGA compatible controller [0300]: VMware SVGA II Adapter [15ad:0405] (prog-if 00 [VGA controller])
>>         Subsystem: VMware SVGA II Adapter [15ad:0405]
>>         Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
>>         Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>>         Interrupt: pin A routed to IRQ 16
>>         Region 0: I/O ports at 2140 [size=16]
>>         Region 1: Memory at f0000000 (32-bit, prefetchable) [size=128M]
>>         Region 2: Memory at fb800000 (32-bit, non-prefetchable) [size=8M]
>>         Expansion ROM at 000c0000 [disabled] [size=128K]
>>         Capabilities: [40] Vendor Specific Information: Len=00 <?>
>>         Capabilities: [44] PCI Advanced Features
>>                 AFCap: TP+ FLR+
>>                 AFCtrl: FLR-
>>                 AFStatus: TP-
>>         Kernel modules: vmwgfx
>>
>> Driver version:
>> #define VMWGFX_DRIVER_DATE "20211206"
>>
>> Host: Windows 11 & VMware Workstation 16 Pro 16.2.0 build-18760230
>> Guest: Debian 11
> 
> Could somebody take a look into this? Or was this discussed somewhere
> else already? Or even fixed?
> 
> Anyway, to get this tracked:
> 
> #regzbot introduced: v5.16..v5.17-rc7
> #regzbot from: sander44 <ionut_n2001@yahoo.com>
> #regzbot title: "vmwgfx: probe of 0000:00:0f.0 failed with error -16" in
> guest
> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215678
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> 
> P.S.: As the Linux kernel's regression tracker I'm getting a lot of
> reports on my table. I can only look briefly into most of them and lack
> knowledge about most of the areas they concern. I thus unfortunately
> will sometimes get things wrong or miss something important. I hope
> that's not the case here; if you think it is, don't hesitate to tell me
> in a public reply, it's in everyone's interest to set the public record
> straight.
> 

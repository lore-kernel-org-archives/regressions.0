Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A897ED1
	for <regressions@lists.linux.dev>; Sun, 10 Apr 2022 09:11:48 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ndTbm-0005d0-8O; Sun, 10 Apr 2022 11:11:46 +0200
Message-ID: <ee42d869-bf2a-e9fd-6fa7-ad630f17f7fb@leemhuis.info>
Date: Sun, 10 Apr 2022 11:11:45 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: Bug 215715 - PCI device (iwlwifi) is not working due to PCI power
 state change issues #forregzbot
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <ad13371f-2883-bcf2-a62c-78104bfd615c@leemhuis.info>
 <07541714-5d44-dd84-5ab2-a9ce91bba715@leemhuis.info>
In-Reply-To: <07541714-5d44-dd84-5ab2-a9ce91bba715@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1649581908;b8924464;
X-HE-SMSGID: 1ndTbm-0005d0-8O

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

#regzbot monitor: https://lore.kernel.org/all/11980172.O9o76ZdvQC@kreacher/

On 29.03.22 10:49, Thorsten Leemhuis wrote:
> On 28.03.22 15:33, Thorsten Leemhuis wrote:
>> Hi, this is your Linux kernel regression tracker.
>>
>> Rafael, I noticed a regression report in bugzilla.kernel.org that afaics
>> nobody acted upon since it was reported about a week ago, that's why I
>> decided to forward it to the lists, maintainers, and the author of the
>> culprit. To quote from
>> https://bugzilla.kernel.org/show_bug.cgi?id=215715 :
>>
>>>  Stefan Gottwald 2022-03-21 13:31:43 UTC
>>>
>>> Created attachment 300589 [details]
>>> dmesg output from error case
>>>
>>> We got a Elo AIO i2 device which most current BIOS where WiFi was working with Kernel 5.12.x but stopped working since Kernel 5.13.19 and newer (5.17.0-rc5).
>>>
>>> The kernel error message is:
>>>
>>> [    3.419766] iwlwifi 0000:01:00.0: can't change power state from D3cold to D0 (config space inaccessible)
>>> [    3.419781] iwlwifi 0000:01:00.0: can't change power state from D3cold to D0 (config space inaccessible)
>>> [    3.419975] iwlwifi 0000:01:00.0: HW_REV=0xFFFFFFFF, PCI issues?
>>> [    3.420911] iwlwifi: probe of 0000:01:00.0 failed with error -5
>>>
>>> The issue can be solved by adding the iwlwifi driver to the initramfs so it is loaded much earlier and seems to work.
>>>
>>> To narrow down the issue I did an git bisect between v5.13.18 and v5.13.19 mainline kernel version which got me to following commit which if reverted fix the issue on this device.
>>>
>>> Reverting commit d0660d8ab123ea471064f0828f290bec9593e16b : PCI: Use pci_update_current_state() in pci_enable_device_flags()
>>
>> FWIW, that afaics is d0660d8ab123 ("PCI: Use pci_update_current_state()
>> in pci_enable_device_flags()") in mainline.
> 
> Sorry, I made a (obvious) cut-n-paste error there: the stable commit
> mentioned by the reporter is 14858dcc3b35 ("PCI: Use
> pci_update_current_state() in pci_enable_device_flags()") in mainline.
> 
> #regzbot introduced: 14858dcc3b35
> 
>>> resolve the issue also in the newer kernels. Seems like the function platform_pci_get_power_state is always returning PCI_D3cold on this device also if this is not true.
>>
>> Could somebody take a look into this? Or was this discussed somewhere
>> else already? Or even fixed?
>>
>> Anyway, to get this tracked:
>>
>> #regzbot introduced: d0660d8ab123ea471064f0828f290bec9593e16b
>> #regzbot from: Stefan Gottwald <gottwald@igel.com>
>> #regzbot title: pci/iwlwifi: wifi is not working due to PCI power state
>> change issues
>> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215715
>>
>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>>
>> P.S.: As the Linux kernel's regression tracker I'm getting a lot of
>> reports on my table. I can only look briefly into most of them and lack
>> knowledge about most of the areas they concern. I thus unfortunately
>> will sometimes get things wrong or miss something important. I hope
>> that's not the case here; if you think it is, don't hesitate to tell me
>> in a public reply, it's in everyone's interest to set the public record
>> straight.
>>

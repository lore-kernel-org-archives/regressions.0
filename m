Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB99648DB
	for <regressions@lists.linux.dev>; Fri, 18 Feb 2022 12:42:14 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nL2aS-0000Fk-QI; Fri, 18 Feb 2022 13:42:12 +0100
Message-ID: <e39fb4bd-e89f-b3be-ff17-f359db541a19@leemhuis.info>
Date: Fri, 18 Feb 2022 13:42:11 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Bug in Memory Layout of rx_desc for QCA6174 #forregzbot
Content-Language: en-BS
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <CAH4F6usFu8-A6k5Z7rU9__iENcSC6Zr-NtRhh_aypR74UvN1uQ@mail.gmail.com>
 <87o88muvvz.fsf@codeaurora.org>
 <e355589e-3162-76ed-edec-5cffc1f77356@leemhuis.info>
 <CAH4F6usEL+u9va-UD96F1-jQLJNou-jhxPgQuAB2tM8+8oKwHA@mail.gmail.com>
 <dc6e97ce-2fda-5872-40b5-f72d43e9ced3@leemhuis.info>
In-Reply-To: <dc6e97ce-2fda-5872-40b5-f72d43e9ced3@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1645188135;85f89bb6;
X-HE-SMSGID: 1nL2aS-0000Fk-QI

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

Hi, this is your Linux kernel regression tracker speaking.

Top-posting for once, to make this easy accessible to everyone.

Putting this on backburner, as the fix will only be merged in the next
cycle, which shouldn't be a problem, as the culprit was merged for v4.16-rc1

#regzbot backburner
#regzbot ignore-activity

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=master&id=6bae9de622d3ef4805aba40e763eb4b0975c4f6d

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I'm getting a lot of
reports on my table. I can only look briefly into most of them and lack
knowledge about most of the areas they concern. I thus unfortunately
will sometimes get things wrong or miss something important. I hope
that's not the case here; if you think it is, don't hesitate to tell me
in a public reply, it's in everyone's interest to set the public record
straight.




On 31.10.21 08:05, Thorsten Leemhuis wrote:
> On 29.10.21 16:23, Francesco Magliocca wrote:
>> Hi, sorry for the late reply, have had rough times.
> 
> No worries, I have no interested in this particular matter, I only try
> to make sure regression reports do not fall through the cracks unnoticed.
> 
> Anyway, many thx for working on this! :-D
> 
> Ciao, Thorsten
> 
>> Yes I can work on a patch, I'll try to get something working by the
>> end of the week.
>>
>>> Heh, I was also about to ask about that as well :) The firmware is
>>> supposed to handle length differences but clearly it's not.
>>
>> In fact, I see that the driver notifies the firmware about the offset
>> of the various fields of the data structure,
>> so this made me think about the firmware. I still can't figure out
>> what wifi packet is causing this problem...
>>
>> Anyways I'll work on a patch abstracting the various representations out.
>> I just ask that you be a little bit patient with me, because this is
>> the first time I contribute to the kernel,
>> so I may be making mistakes
>>
>> Il giorno ven 29 ott 2021 alle ore 11:07 Thorsten Leemhuis
>> <regressions@leemhuis.info> ha scritto:
>>>
>>> On 21.09.21 11:21, Kalle Valo wrote:
>>>> (adding linux-wireless and regression lists)
>>>
>>> thx for that, this made be add the regression to regzbot
>>> (https://linux-regtracking.leemhuis.info/regzbot/mainline/ ). That's why
>>> I noticed there hasn't been any recent activity wrt to this regression
>>> -- at least in this thread. Was progress made somewhere else? If not:
>>> what can be done to get things moving again? Sure, it's an old
>>> regression, but nevertheless it would be nice to get it fixed.
>>>
>>> Ciao, Thorsten
>>>
>>> #regzbot ignore-activity
>>>
>>>> Francesco Magliocca <franciman12@gmail.com> writes:
>>>>
>>>>> Hello everyone,
>>>>> I have a QCA6174 PCIe board, I am using linux kernel 5.12.10.
>>>>> The firmware loaded is:
>>>>>> [ 4.483131] ath10k_pci 0000:02:00.0: qca6174 hw3.2 target 0x05030000
>>>>>> chip_id 0x00340aff sub 1a56:143a
>>>>>> [ 4.483136] ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 1
>>>>>> tracing 0 dfs 0 testmode 0
>>>>>> [ 4.483567] ath10k_pci 0000:02:00.0: firmware ver
>>>>>> WLAN.RM.4.4.1-00157-QCARMSWPZ-1 api 6 features wowlan,ignore-otp,mfp
>>>>>> crc32 90eebefb
>>>>>> [    4.572730] ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A crc32 318825bf
>>>>>> [ 4.665592] ath10k_pci 0000:02:00.0: htt-ver 3.60 wmi-op 4 htt-op 3
>>>>>> cal otp max-sta 32 raw 0 hwcrypto 1
>>>>>
>>>>> around six months ago I reported a bug which is still haunting me:
>>>>> When I am connected to my home's Wi-Fi network and my father's Huawei
>>>>> smartphone is connected too
>>>>> my Wi-Fi card hangs and gets stuck, I have to force restart of the device.
>>>>>
>>>>> Note that this problem does not happen if my pc and the smartphone are
>>>>> connected to different networks (for example
>>>>> I tried connecting my pc to the 2.4GHz network and the smartphone to
>>>>> the 5GHz network, and the bug does not appear).
>>>>>
>>>>> Now, I tried bisecting driver changes, and I found the faulty one,
>>>>> it is the commit: e3def6f7ddf88636febb12e1e3e86387a4ce5452
>>>>
>>>> Ok, so this is the commit:
>>>>
>>>> commit e3def6f7ddf88636febb12e1e3e86387a4ce5452
>>>> Author:     Govind Singh <govinds@qti.qualcomm.com>
>>>> AuthorDate: Thu Dec 21 14:30:51 2017 +0530
>>>> Commit:     Kalle Valo <kvalo@qca.qualcomm.com>
>>>> CommitDate: Wed Dec 27 12:05:35 2017 +0200
>>>>
>>>>     ath10k: Update rx descriptor for WCN3990 target
>>>>
>>>>     WCN3990 rx descriptor uses different offset of msdu start, msdu end,
>>>>     ppdu end, rx pkt end and rx frag info.
>>>>     To accommodate different offsets, define respective fields in
>>>>     rx descriptor of WCN3990 target.
>>>>
>>>>     Signed-off-by: Govind Singh <govinds@qti.qualcomm.com>
>>>>     Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
>>>>
>>>>> It adds some fields to structures like rx_msdu_start, rx_frag_info, etc..
>>>>> The changes modify the size of these structures!
>>>>>
>>>>> If I revert this commit changes, the bug does not happen
>>>>> (I tested it for two weeks, while the bug happens at least once in 2-3 hours
>>>>> from when the smartphone is connected to the wifi network).
>>>>
>>>> Good, I was just about to ask about that.
>>>>
>>>>> Also, if I selectively remove some of the changes introduced by the
>>>>> faulty commit, the bug does not go away, so it looks like the problem
>>>>> is in the change of size of the data structures.
>>>>
>>>> Heh, I was also about to ask about that as well :) The firmware is
>>>> supposed to handle length differences but clearly it's not.
>>>>
>>>>> Now, I'd like to ask you what we can do to fix this problem... Is
>>>>> there something I am doing wrong? Or is there a bug in the firmware?
>>>>>
>>>>> If the firmware can't be easily fixed, I was thinking that we can
>>>>> abstract the htt_rx_desc (in the same way we do with ops in other
>>>>> parts of the driver) to have two versions: one for 32-bit descriptors
>>>>> (like my QCA6174) and one for 64-bit descriptors (i.e. WCN3990, which
>>>>> was the cause of this change).
>>>>>
>>>>> I'd be really happy to help, but I am not sure I fully understand what
>>>>> is going on, so what do you think is happening and what should we do?
>>>>
>>>> Getting the firmware fixed is difficult. I would first try abstracting
>>>> the htt_rx_desc, can you send a patch?
>>>>
>>

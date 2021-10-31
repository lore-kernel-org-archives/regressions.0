Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0203C2C81
	for <regressions@lists.linux.dev>; Sun, 31 Oct 2021 06:55:44 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1mh4kj-00051C-Gl; Sun, 31 Oct 2021 07:55:37 +0100
Message-ID: <db81dd41-5c60-bfe7-0bc2-337759fede46@leemhuis.info>
Date: Sun, 31 Oct 2021 07:55:36 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: Bug in Memory Layout of rx_desc for QCA6174
Content-Language: en-BS
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <CAH4F6usFu8-A6k5Z7rU9__iENcSC6Zr-NtRhh_aypR74UvN1uQ@mail.gmail.com>
 <87o88muvvz.fsf@codeaurora.org>
 <e355589e-3162-76ed-edec-5cffc1f77356@leemhuis.info>
In-Reply-To: <e355589e-3162-76ed-edec-5cffc1f77356@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1635663345;55c8105d;
X-HE-SMSGID: 1mh4kj-00051C-Gl

TWIMC, Francesco replied to this thread without a proper reply-to here:

#regzbot monitor
https://lore.kernel.org/ath10k/CAH4F6uvX=xtTnBDaj1BVHSx_FDSUbpc4TRC2DGTHBmGJSD2oEA@mail.gmail.com/

On 29.10.21 11:07, Thorsten Leemhuis wrote:
> On 21.09.21 11:21, Kalle Valo wrote:
>> (adding linux-wireless and regression lists)
> 
> thx for that, this made be add the regression to regzbot
> (https://linux-regtracking.leemhuis.info/regzbot/mainline/ ). That's why
> I noticed there hasn't been any recent activity wrt to this regression
> -- at least in this thread. Was progress made somewhere else? If not:
> what can be done to get things moving again? Sure, it's an old
> regression, but nevertheless it would be nice to get it fixed.
> 
> Ciao, Thorsten
> 
> #regzbot ignore-activity
> 
>> Francesco Magliocca <franciman12@gmail.com> writes:
>>
>>> Hello everyone,
>>> I have a QCA6174 PCIe board, I am using linux kernel 5.12.10.
>>> The firmware loaded is:
>>>> [ 4.483131] ath10k_pci 0000:02:00.0: qca6174 hw3.2 target 0x05030000
>>>> chip_id 0x00340aff sub 1a56:143a
>>>> [ 4.483136] ath10k_pci 0000:02:00.0: kconfig debug 0 debugfs 1
>>>> tracing 0 dfs 0 testmode 0
>>>> [ 4.483567] ath10k_pci 0000:02:00.0: firmware ver
>>>> WLAN.RM.4.4.1-00157-QCARMSWPZ-1 api 6 features wowlan,ignore-otp,mfp
>>>> crc32 90eebefb
>>>> [    4.572730] ath10k_pci 0000:02:00.0: board_file api 2 bmi_id N/A crc32 318825bf
>>>> [ 4.665592] ath10k_pci 0000:02:00.0: htt-ver 3.60 wmi-op 4 htt-op 3
>>>> cal otp max-sta 32 raw 0 hwcrypto 1
>>>
>>> around six months ago I reported a bug which is still haunting me:
>>> When I am connected to my home's Wi-Fi network and my father's Huawei
>>> smartphone is connected too
>>> my Wi-Fi card hangs and gets stuck, I have to force restart of the device.
>>>
>>> Note that this problem does not happen if my pc and the smartphone are
>>> connected to different networks (for example
>>> I tried connecting my pc to the 2.4GHz network and the smartphone to
>>> the 5GHz network, and the bug does not appear).
>>>
>>> Now, I tried bisecting driver changes, and I found the faulty one,
>>> it is the commit: e3def6f7ddf88636febb12e1e3e86387a4ce5452
>>
>> Ok, so this is the commit:
>>
>> commit e3def6f7ddf88636febb12e1e3e86387a4ce5452
>> Author:     Govind Singh <govinds@qti.qualcomm.com>
>> AuthorDate: Thu Dec 21 14:30:51 2017 +0530
>> Commit:     Kalle Valo <kvalo@qca.qualcomm.com>
>> CommitDate: Wed Dec 27 12:05:35 2017 +0200
>>
>>     ath10k: Update rx descriptor for WCN3990 target
>>     
>>     WCN3990 rx descriptor uses different offset of msdu start, msdu end,
>>     ppdu end, rx pkt end and rx frag info.
>>     To accommodate different offsets, define respective fields in
>>     rx descriptor of WCN3990 target.
>>     
>>     Signed-off-by: Govind Singh <govinds@qti.qualcomm.com>
>>     Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>
>>
>>> It adds some fields to structures like rx_msdu_start, rx_frag_info, etc..
>>> The changes modify the size of these structures!
>>>
>>> If I revert this commit changes, the bug does not happen
>>> (I tested it for two weeks, while the bug happens at least once in 2-3 hours
>>> from when the smartphone is connected to the wifi network).
>>
>> Good, I was just about to ask about that.
>>
>>> Also, if I selectively remove some of the changes introduced by the
>>> faulty commit, the bug does not go away, so it looks like the problem
>>> is in the change of size of the data structures.
>>
>> Heh, I was also about to ask about that as well :) The firmware is
>> supposed to handle length differences but clearly it's not.
>>
>>> Now, I'd like to ask you what we can do to fix this problem... Is
>>> there something I am doing wrong? Or is there a bug in the firmware?
>>>
>>> If the firmware can't be easily fixed, I was thinking that we can
>>> abstract the htt_rx_desc (in the same way we do with ops in other
>>> parts of the driver) to have two versions: one for 32-bit descriptors
>>> (like my QCA6174) and one for 64-bit descriptors (i.e. WCN3990, which
>>> was the cause of this change).
>>>
>>> I'd be really happy to help, but I am not sure I fully understand what
>>> is going on, so what do you think is happening and what should we do?
>>
>> Getting the firmware fixed is difficult. I would first try abstracting
>> the htt_rx_desc, can you send a patch?
>>
> 
> 

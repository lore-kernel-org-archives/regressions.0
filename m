Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB4710954
	for <regressions@lists.linux.dev>; Mon, 10 Jul 2023 11:54:50 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qIpTb-0008OJ-JV; Mon, 10 Jul 2023 13:54:47 +0200
Message-ID: <84231ffe-14c3-2d94-378f-e546f8b9f74b@leemhuis.info>
Date: Mon, 10 Jul 2023 13:54:45 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: ath11k: QCN9074: low HE-MCS index
Content-Language: en-US, de-DE
To: Tanguy Serrat <tanguy@squaremind.io>
Cc: ath11k@lists.infradead.org,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <CAPr+0Hb5b_CEihVH+Mo-uR4+Wp-ACkoCySkyLrk=mkzme6ezPg@mail.gmail.com>
 <fba6f326-679b-d160-5ab6-3f885bacb5a2@leemhuis.info>
 <CAPr+0HY2iyPiZwABc6+5dBc+MA6CYd6v1hT-QyzApokogFTVvw@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <CAPr+0HY2iyPiZwABc6+5dBc+MA6CYd6v1hT-QyzApokogFTVvw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1688990090;399781fa;
X-HE-SMSGID: 1qIpTb-0008OJ-JV

[CCing Manikanta Pubbisetty, the author of the culprit; and Kalle, but
just for the record, as he afaik is unavailable for some time ]

On 10.07.23 13:01, Tanguy Serrat wrote:
>> FWIW for anyone seeing this that might wonder: yes, this is the same
>> issue that is already brought up on the lists here:
> 
>> https://lore.kernel.org/all/1326a6e4-758d-3344-d90c-8a126748b034@gmail.com/
> 
> Thank you Thorsten. This is a separate new issue. I have opened a new
> ticket here with my latest findings:
> https://bugzilla.kernel.org/show_bug.cgi?id=217652

Sorry, I didn't notice, it was somewhat confusing from the outside. If
you report the same issue to both the list and bugzilla please interlink
them clearly near the top.

> Any help would be greatly appreciated, this is quite blocking in our
> product development.

Sounds like this thread aka
https://bugzilla.kernel.org/show_bug.cgi?id=217652 are not a regression.
If that's not correct please state so, but if it is: sorry, then I'm out
of here, I only try to ensure that regressions are fixed, everything
else is up to the regular developers of the code in question.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.


> Le lun. 26 juin 2023 à 15:50, Linux regression tracking (Thorsten
> Leemhuis) <regressions@leemhuis.info> a écrit :
>>
>> On 26.06.23 14:27, Tanguy Serrat wrote:
>>>
>>> In my quest to get 2x QCN9074 paired and achieving high throughput
>>> data transfers, I am now facing issues with the AP configuration.
>>>
>>> Specifically, I cannot get more than HE-MCS 5 (AP and client 50cm
>>> apart) although SNR and RSSI are always very strong and supposedly in
>>> specs (SNR > 40db or RSSI < -48db).
>>
>> FWIW for anyone seeing this that might wonder: yes, this is the same
>> issue that is already brought up on the lists here:
>>
>> https://lore.kernel.org/all/1326a6e4-758d-3344-d90c-8a126748b034@gmail.com/
>>
>> Sadly nothing much came from it (and coincidentally I tried to revive
>> that thread a few minutes after Tanguy Serrat sent the quoted mail,
>> which was an hour before I saw it -- aka: race condition). Well, maybe
>> one of these mails hopefully will help.
>>
>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>> --
>> Everything you wanna know about Linux kernel regression tracking:
>> https://linux-regtracking.leemhuis.info/about/#tldr
>> If I did something stupid, please tell me, as explained on that page.
>>
>> #regzbot ^backmonitor: d90c-8a126748b034@gmail.com/
>>
>>> iw wlp6s0 link
>>> Connected to 00:15:61:27:cd:dc (on wlp6s0)
>>> SSID: Space
>>> freq: 5745
>>> RX: 1073584482 bytes (708567 packets)
>>> TX: 355824214 bytes (256143 packets)
>>> signal: -40 dBm
>>> rx bitrate: 1729.3 MBit/s 160MHz HE-MCS 4 HE-NSS 4 HE-GI 0 HE-DCM 0
>>> tx bitrate: 1729.3 MBit/s 160MHz HE-MCS 4 HE-NSS 4 HE-GI 0 HE-DCM 0
>>>
>>> In this case iperf3 shows ~950Mbits/s transfer speed. I am hoping to
>>> get at least twice as much.
>>>
>>> It seems to me that either mac80211, ath11k or hostapd are not
>>> advertising the available capabilities correctly. I have tried setting
>>> hostapd he_basic_mcs_set=65530 or others but did not help.
>>>
>>> I have added ieee80211_regdom=FR option to cfg80211 module on the AP
>>> side. Channel selection is done with ACS survey. I also tried other
>>> channels/frequencies without success eg. 5500Mhz.
>>>
>>> iw reg get
>>> global
>>> country FR: DFS-ETSI
>>> (2400 - 2483 @ 40), (N/A, 20), (N/A)
>>> (5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
>>> (5250 - 5350 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
>>> (5470 - 5725 @ 160), (N/A, 26), (0 ms), DFS
>>> (5725 - 5875 @ 80), (N/A, 13), (N/A)
>>> (5945 - 6425 @ 160), (N/A, 23), (N/A), NO-OUTDOOR
>>> (57000 - 71000 @ 2160), (N/A, 40), (N/A)
>>>
>>> phy#0 (self-managed)
>>> country US: DFS-FCC
>>> (2402 - 2472 @ 40), (6, 30), (N/A)
>>> (5170 - 5250 @ 80), (N/A, 30), (N/A), AUTO-BW
>>> (5250 - 5330 @ 80), (N/A, 24), (0 ms), DFS, AUTO-BW
>>> (5490 - 5730 @ 160), (N/A, 24), (0 ms), DFS, AUTO-BW
>>> (5735 - 5895 @ 160), (N/A, 30), (N/A), AUTO-BW
>>> (5945 - 7125 @ 160), (N/A, 27), (N/A), NO-OUTDOOR, AUTO-BW
>>>
>>> Current setup is:
>>> - Intel x86
>>> - Ubuntu 22.04
>>> - Kernel built from ath 6.4.0-rc6-wt-ath+ (commit:
>>> c60d15f389ef9832a8da410e438d81b10327751f)
>>> with commit reverted from the bug ticket I opened
>>> (https://bugzilla.kernel.org/show_bug.cgi?id=217536).
>>> - 1x QCN9074 as AP, 1x as managed client 50cm apart
>>> - Both AP and Client are running with the latest 2.7.0 FW.
>>>
>>> I have started from this ticket
>>> (https://bugzilla.kernel.org/show_bug.cgi?id=217286) hostapd config
>>> file, and adapted, please find attached.
>>>
>>> Anyone seeing what could be my issue / how I could debug further ?
>>>
>>> Thank you !
>>> Tanguy
>>>
>>>
> 
> 

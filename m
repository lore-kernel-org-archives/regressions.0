Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7DD2F44
	for <regressions@lists.linux.dev>; Sat, 31 Dec 2022 15:35:20 +0000 (UTC)
Received: from [192.168.1.139] ([37.4.248.41]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N7RDn-1okVUy3vTh-017m4O; Sat, 31 Dec 2022 16:29:54 +0100
Message-ID: <9229905f-e7a5-aa86-c3f6-887046b8e663@i2se.com>
Date: Sat, 31 Dec 2022 16:29:52 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Regression in brcmfmac for 6.1/6.2-rc1 for SDIO devices
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Justin Forbes <jforbes@fedoraproject.org>, regressions@lists.linux.dev,
 linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
 Hante Meuleman <hante.meuleman@broadcom.com>,
 Franky Lin <franky.lin@broadcom.com>, Arend van Spriel <aspriel@gmail.com>,
 "Ivan T. Ivanov" <iivanov@suse.de>
References: <CALeDE9O1+qgn_9z=zTVKbWx3FphEa4y8Dn9f5ORoQgW_gL1dqg@mail.gmail.com>
 <d88f4aff-45ad-db10-ada3-f7f5b34a6620@i2se.com>
 <CALeDE9O_qX_Gu1vwCLW_PbMdgnSoHTA5LhxYQrsUqwGHRwv-Eg@mail.gmail.com>
Content-Language: en-US
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <CALeDE9O_qX_Gu1vwCLW_PbMdgnSoHTA5LhxYQrsUqwGHRwv-Eg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:vQEiGX7l7+mEyKlwRl7Ar70SIEAhyIYDiKrKNpoolUwJX7LiSIp
 MKb+iMl+hw81MUJXITCEPBUe52/06bFE9yfJGKrqD9dP86WZtzqHxQo362JoLJAOtn/T82w
 h4ehfDGyKSzxKBp+5/y7gxFZkBwpGgNlQCzNUmmo6LSzvBebn4Axp5DSEi43tj4mH4t31uP
 c9ARu3CLeVIusD+UCoxow==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:yC8B2aFjGes=;HaTPcyGSKMd5/24nWugQfWjnwzA
 QVp22K5CMuUchvwCZg11h/aHf+EWFIW+YrranwMqOV2SpCRtHpcmJvMJBniY9VUUcfz6IUnrv
 +EMskyVf8m96nTFG/5e00ItNMOMtw/9xLzYX5tER4pLqvCj+b/j4kOZqryMPSw+2A4MUeyGOJ
 XbpTdeZgVOwAnuT9St3LKV+EGY9taEGjc/LDhKAeC56C3iQNIybdi+QQRoegsyKffXQSphH9l
 GAAvopNhkX/XZgtQku8/zV6R3kGZKV/rU7DIBSPLc6mbEpi0x1wZekkiVzVzPDah7jwDwAm9f
 q+Lc+mVPw2027S119VA73a7RkgC9gqYz8JHWZ6XTgbFzJvxlJF+2sX60jw6VZ7hvhM3WGhzmJ
 /pGRZ6oJZuyjz0OaazCQp/mdZWRQ44ApAlvjRTrtKqWMT4f7okJhahNBO8XuTHGJ4F3kS0WEE
 jhCnCna4apwtXelifyV4dwOfPFuebYNtslWnLvMKQ/2NY+x4LmLJXhAuJeBFPw8YPcFk74o24
 NBhDoL6NbXt5R8s9peNskSoDE2CyTRYJP+UxupR4wIfJbfYl2su8D7Fx5clH9GmRLl8DGxBDw
 7ynxLfurQ6Pgup6aHYjA9TEvsUK9yYV9d6y/khh+XIWdTi/PnSepCzefzT53ciiStjaHGsXw4
 EXGoM0+Ha8YtIGs4Fiv9ARolBv4M8/3pkkgzOmL90Q==

Hi Peter,

Am 31.12.22 um 15:33 schrieb Peter Robinson:
> Hi Stefan,
>
>> could you please provide a "bad case" file list of all firmware files
>> for the Raspberry Pi 3 B+ which worked before Linux 6.1, so i can
>> reproduce it?
> What do you mean by the file list?

if you look into the firmware directory which files for 
brcmfmac43455-sdio do you have? Just the bin file?

I'm using the rootfs of Raspberry Pi OS which contains:

$ ls brcmfmac43455-sdio*
brcmfmac43455-sdio.bin  brcmfmac43455-sdio.clm_blob brcmfmac43455-sdio.txt

I didn't say please add some files, i only need a test scenario :-)

>   We're running the latest upstream
> firmware, we do used compressed firmware but that hasn't regressed
> with any of the other firmware, this is very much brcmfmac. With the
> same firmware it was working on 6.0.x and reboot into a 6.1+ kernel
> and it stops with nothing else changed.

Yes, i agree this is a regression and yes it's definitely brcmfmac, but 
based on your bug report i wasn't able to reproduce.

Regards

>
>> Also OpenSuSE seems to be affected [1].
>>
>> [1] - https://bugzilla.suse.com/show_bug.cgi?id=1206697
>>
>> Regards
>> Stefan
>>

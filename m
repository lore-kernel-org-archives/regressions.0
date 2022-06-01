Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C122592
	for <regressions@lists.linux.dev>; Wed,  1 Jun 2022 21:02:33 +0000 (UTC)
Received: from [192.168.41.150] ([46.114.146.95]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1Mv2pC-1nehWB2b56-00r4FC for <regressions@lists.linux.dev>; Wed, 01 Jun 2022
 23:02:31 +0200
Message-ID: <79bb603e-37cb-d1dd-1e12-7ce28d7cfdae@i2se.com>
Date: Wed, 1 Jun 2022 23:02:30 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: vchiq: Performance regression since 5.18-rc1
Content-Language: en-US
From: Stefan Wahren <stefan.wahren@i2se.com>
To: regressions@lists.linux.dev
References: <77d6d498-7dd9-03eb-60f2-d7e682bb1b20@i2se.com>
 <YoszE8lQ9VcofLtX@linutronix.de> <Yo41ggMvkI1B9TeM@fuller.cnet>
 <69590289-58ef-d32b-0459-36fa00627605@i2se.com>
In-Reply-To: <69590289-58ef-d32b-0459-36fa00627605@i2se.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:phRpW5te+24a6IM9LQKTV/Cmho826c2xnzbN/kpNljmPl/r4m+P
 jR/ek3KaUc5r1eYYNlZQ+vJhifAxj/RerZm+p+axX2NZFt9uz8x4qkQLxB8wntcMJXqrpyp
 Q7F/uUW+9E749SCTqWL1v++psTlgtNaN7qL9M1LKTgwbmUmEGA9FCrsqMgP3SVw9v8TAuRY
 kKKNxf7HXMpQSq+k/qzqw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ffk7JCtDkTE=:eN8YG6IeWJvMIIzMoLKN+K
 /tudUpMkTWlOtPTEAqdLB7f/Huoo9rCfdfD09Vnf488FpdEmDE7TMfxhkY7Kv1jMQc1Y6cDwE
 JWDbnL9xspXgEpr7fg3uVRZ2A3P4EjlopnlyzrtEGzea/sYb6je42h9JamUNpuqhbcSLhs7cI
 mDNKuaS3STLOfiTuH2qGkvSvWr2qW+aUWshBXYV3mosJnuii6a0bouxjUhiaYVV6BKWBw/XgV
 XWWUK/55Yqr3X1AdPPGxo1xQKbungaj0dikJgulwOKQNsyJrwBHSoGTfiP5jOR1kdqS6zonCB
 yNLmIm1xbNTWxAUgCmywdRjrhDmyXGOAFI2n7TkVBvArDD+f5l8lJF628MB5GhSjt/wFoNclL
 9CXF4MfFCNjPaXfhd57NulJZJgUbIpGKGcbYTOde7FqiXqJkGBw05qblz9bFTyMuvnOJVnO3l
 UET24sEAXRaJKEN3KB4yosTSheXe8OGqT/fIbJKikQhOd45DWkYaM082Yv3RuZhKmiJIZNIpa
 /WU6SW1qkh0aAWagWCuGtiTNlygPv25M30Vwrips3nkkE5AQoxmkyI1Uei4a2jjlqu8+r1yG9
 XnlvCkIz/55DUQ6bS8JzRhrMf6X2RYZbnLmgzdvq8B/rFbq8TaDaSpvlZ85jOte2vyMmk5TP0
 pkurXf8B0vmC5+3DpQdk2QoffJCJAYMy7iIawMIfaT4yFvvj1p2NCGRuicX28Pwza1g5Nd9oY
 CWbQ1MvWENHTWi06242jtM1kZttaB3e40POZjv4Oo01m/ByxOqqFgbRq/8E=

|||#regzbot fixed-by: 350e15124ee3|

Am 30.05.22 um 11:54 schrieb Stefan Wahren:
> Hi Marcelo,
> hi Sebastian,
>
> Am 25.05.22 um 15:56 schrieb Marcelo Tosatti:
>> On Mon, May 23, 2022 at 09:09:07AM +0200, Sebastian Andrzej Siewior 
>> wrote:
>>> On 2022-05-22 01:22:00 [+0200], Stefan Wahren wrote:
>>>> Hi,
>>> Hi,
>>>
>>>> while testing the staging/vc04_services/interface/vchiq_arm driver 
>>>> with my
>>>> Raspberry Pi 3 B+ (multi_v7_defconfig) i noticed a huge performance
>>>> regression since [ff042f4a9b050895a42cae893cc01fa2ca81b95c] mm:
>>>> lru_cache_disable: replace work queue synchronization with 
>>>> synchronize_rcu
>>>>
>>>> Usually i run "vchiq_test -f 1" to see the driver is still working 
>>>> [1].
>>> What about
>>>     https://lore.kernel.org/all/YmrWK%2FKoU1zrAxPI@fuller.cnet/
>>>
>>> Sebastian
>> Stefan,
>>
>> Can you please try the patch above ?
>
> this patch fixes the regression. Great
>
> Best regards
>
>>
>>
>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

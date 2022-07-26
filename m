Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC444C8B
	for <regressions@lists.linux.dev>; Tue, 26 Jul 2022 16:19:58 +0000 (UTC)
Received: from [192.168.1.107] ([37.4.248.80]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N4hBx-1nIvtA3s4l-011jIV; Tue, 26 Jul 2022 17:54:48 +0200
Message-ID: <e9aa5629-b6a8-3e5d-422e-eb79ac333fdc@i2se.com>
Date: Tue, 26 Jul 2022 17:54:46 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [Regression] ext4: changes to mb_optimize_scan cause issues on
 Raspberry Pi
Content-Language: en-US
To: Ojaswin Mujoo <ojaswin@linux.ibm.com>
Cc: linux-ext4@vger.kernel.org,
 Harshad Shirwadkar <harshadshirwadkar@gmail.com>,
 Theodore Ts'o <tytso@mit.edu>, Ritesh Harjani <riteshh@linux.ibm.com>,
 linux-fsdevel@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Geetika.Moolchandani1@ibm.com, regressions@lists.linux.dev
References: <0d81a7c2-46b7-6010-62a4-3e6cfc1628d6@i2se.com>
 <Yt6xsyy3+qEMn08y@li-bb2b2a4c-3307-11b2-a85c-8fa5c3a69313.ibm.com>
 <0840b428-3a77-2339-354f-7fbd3295bb4d@i2se.com>
 <Yt+M+JgW6KuZFMvc@li-bb2b2a4c-3307-11b2-a85c-8fa5c3a69313.ibm.com>
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <Yt+M+JgW6KuZFMvc@li-bb2b2a4c-3307-11b2-a85c-8fa5c3a69313.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+dY6Kw53OPA/ANxTwrXbadLr9BxDgCp9BdmptMzwrzBDV6TzFUo
 mkson++S3IEVczYGDV9ClD/8+EP1JZx3x0G/BaBCLVSJrK7U2ORxtS2cqh7iO+DvtEuaJOz
 hc37biZ6ZyLTX2JQibCW/SJZ65Qg5CWwRjeGwaTua88x8GNXrbQN5d/QU7fruTA9juG7c3a
 N9k8PSHjlB0rCMUY/CZZA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2LXStBRJMyk=:8b7Jvzhlz0Wac88NY0AcWi
 ole77AYOknZ9fgYTtVk+nKXozbvgYm8jUZgKSOlcsaDWnsWms2FFupysfgYqh/369P/MsSc77
 sYJY6AGESYrcqHFZWx+oUKYm0f1cr3KRK6GxR6UA3qqAj2uZ8ibVjTd4v7SwoTVnzkL8HhRex
 fb/UX3FxiLouUQeFlP/1srvOMg9+lZz/odOFvrXj29JjECfIjP2Uu2r19QQF7CZtMCep2i5ia
 puP1cHG0WPveuwQ4otKSyCU0+RI4Gy/683z03hMakckIl/vfZR1n6jwz0cJfEhhLy9jhV9XzI
 q9WEyZq+k6O09A47kmd+aL+rRGoYOJI7y2ZB49UJvKzdtNTuLv80sdwQJoCB3BB0LhZ6mimlA
 brvGQxs5ayC9cwHEdpQ6yAyjrqy8lhRENXUScYvV06d1/cEYA10VLEe8+qhK5MNpfyDBOBwvv
 NEBaz8M1ZqG18xzjO9hZGec4K3NX3Q0vjyJ6H37dOEKSaNZOLmMtfH/gBZcDXTVqf1m4MPSyP
 4uL3iJbQYKfaWgwI6dS+jIWfDpEMrV4UiZHWx9FaVNLxrnDWfMQiydaFQX+UANuF9S1AkO2p6
 v1ZHfykWkO6wC7bOCVFD3YQ3P/e47IOB7HnakDq1xD+kAt0jWwAaDD+v1fp862/723pNrkfER
 8hLDBcaAMdpcAE2DKH0G6865M9KIGVsN/5lUCVby2FLT6DCwEAIhCTUCs9Z1tsw9e40wk+5WJ
 o5ulyJEBu3vpQ9vwWY/bkITXUN3QWbTLuWQaiosAB8c76bjfXLu8VXmwPT0=

Hi Ojaswin,

Am 26.07.22 um 08:43 schrieb Ojaswin Mujoo:
> On Mon, Jul 25, 2022 at 09:09:32PM +0200, Stefan Wahren wrote:
>> Hi Ojaswin,
>>
>> Am 25.07.22 um 17:07 schrieb Ojaswin Mujoo:
>>> On Mon, Jul 18, 2022 at 03:29:47PM +0200, Stefan Wahren wrote:
>>>> Hi,
>>>>
>>>> i noticed that since Linux 5.18 (Linux 5.19-rc6 is still affected) i'm
>>>> unable to run "rpi-update" without massive performance regression on my
>>>> Raspberry Pi 4 (multi_v7_defconfig + CONFIG_ARM_LPAE). Using Linux 5.17 this
>>>> tool successfully downloads the latest firmware (> 100 MB) on my development
>>>> micro SD card (Kingston 16 GB Industrial) with a ext4 filesystem within ~ 1
>>>> min. The same scenario on Linux 5.18 shows the following symptoms:
>>>>
>>>> - download takes endlessly much time and leads to an abort by userspace in
>>>> most cases because of the poor performance
>>>> - massive system load during download even after download has been aborted
>>>> (heartbeat LED goes wild)
>>>> - whole system becomes nearly unresponsive
>>>> - system load goes back to normal after > 10 min
>>>> - dmesg doesn't show anything suspicious
>>>>
>>>> I was able to bisect this issue:
>>>>
>>>> ff042f4a9b050895a42cae893cc01fa2ca81b95c good
>>>> 4b0986a3613c92f4ec1bdc7f60ec66fea135991f bad
>>>> 25fd2d41b505d0640bdfe67aa77c549de2d3c18a bad
>>>> b4bc93bd76d4da32600795cd323c971f00a2e788 bad
>>>> 3fe2f7446f1e029b220f7f650df6d138f91651f2 bad
>>>> b080cee72ef355669cbc52ff55dc513d37433600 good
>>>> ad9c6ee642a61adae93dfa35582b5af16dc5173a good
>>>> 9b03992f0c88baef524842e411fbdc147780dd5d bad
>>>> aab4ed5816acc0af8cce2680880419cd64982b1d good
>>>> 14705fda8f6273501930dfe1d679ad4bec209f52 good
>>>> 5c93e8ecd5bd3bfdee013b6da0850357eb6ca4d8 good
>>>> 8cb5a30372ef5cf2b1d258fce1711d80f834740a bad
>>>> 077d0c2c78df6f7260cdd015a991327efa44d8ad bad
>>>> cc5095747edfb054ca2068d01af20be3fcc3634f good
>>>> 27b38686a3bb601db48901dbc4e2fc5d77ffa2c1 good
>>>>
>>>> commit 077d0c2c78df6f7260cdd015a991327efa44d8ad
>>>> Author: Ojaswin Mujoo <ojaswin@linux.ibm.com>
>>>> Date:   Tue Mar 8 15:22:01 2022 +0530
>>>>
>>>> ext4: make mb_optimize_scan performance mount option work with extents
>>>>
>>>> If i revert this commit with Linux 5.19-rc6 the performance regression
>>>> disappears.
>>>>
>>>> Please ask if you need more information.
>>> Hi Stefan,
>>>
>>> Apologies, I had missed this email initially. So this particular patch
>>> simply changed a typo in an if condition which was preventing the
>>> mb_optimize_scan option to be enabled correctly (This feature was
>>> introduced in the following commit [1]). I think with the
>>> mb_optimize_scan now working, it is somehow causing the firmware
>>> download/update to take a longer time.
>>>
>>> I'll try to investigate this and get back with my findings.
>> thanks. I wasn't able to reproduce this heavy load symptoms with every SD
>> card. Maybe this depends on the write performance of the SD card to trigger
>> the situation (used command to measure write performance: dd if=/dev/zero
>> of=/boot/test bs=1M count=30 oflag=dsync,direct ).
>>
>> I tested a Kingston consumer 32 GB which had nearly constant write
>> performance of 13 MB/s and didn't had the heavy load symptoms. The firmware
>> update was done in a few seconds, so hard to say that at least the
>> performance regression is reproducible.
>>
>> I also tested 2x Kingston industrial 16 GB which had a floating write
>> performance between 5 and 10 MB/s (wear leveling?) and both had the heavy
>> load symptoms.
>>
>> All SD cards has been detected as ultra high speed DDR50 by the emmc2
>> interface.
>>
>> Best regards
>>
>>> Regard,
>>> Ojaswin
>>>
>>> [1]
>>> 	commit 196e402adf2e4cd66f101923409f1970ec5f1af3
>>> 	From: Harshad Shirwadkar <harshadshirwadkar@gmail.com>
>>> 	Date: Thu, 1 Apr 2021 10:21:27 -0700
>>> 	
>>> 	ext4: improve cr 0 / cr 1 group scanning
>>>
>>>> Regards
>>>>
> Thanks for the info Stefan, I'm still trying to reproduce the issue but
> it's slightly challenging since I don't have my RPi handy at the moment.
>
> In the meantime, would you please try out the mb_optmize_scan=0 command
> line options to see if that helps bypass the issue. This will help
> confirm if the issue lies in mb_optmize_scan itself or if its something
> else.
>
I run the firmware update 5 times with mb_optimize_scan=0 on my 
Raspberry Pi 4 and the industrial SD card and everytime the update worked.
>
> Regards,
> Ojaswin

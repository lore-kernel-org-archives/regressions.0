Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4156807
	for <regressions@lists.linux.dev>; Mon, 27 Mar 2023 07:56:21 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.153])
	by gateway (Coremail) with SMTP id _____8Dx3tokTCFk6j0SAA--.16519S3;
	Mon, 27 Mar 2023 15:56:20 +0800 (CST)
Received: from [10.20.42.153] (unknown [10.20.42.153])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxdbwhTCFkkf8NAA--.7069S3;
	Mon, 27 Mar 2023 15:56:18 +0800 (CST)
Subject: Re: [regression] Bug 217069 - Wake on Lan is broken on r8169 since
 6.2
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Huacai Chen <chenhuacai@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Huacai Chen
 <chenhuacai@loongson.cn>, Bob Moore <robert.moore@intel.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 acpica-devel@lists.linuxfoundation.org,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>
References: <e6aaddb9-afec-e77d-be33-570f9f10a9c2@leemhuis.info>
 <53e8b4db-e8dd-4dfa-f873-7dcbeac09149@leemhuis.info>
 <3089214d-292b-885d-9bc1-c81d0101d5f0@leemhuis.info>
 <CAAhV-H5j29CnCN+F8Oz0qh1UCqp+CmL=aQXCSjqgX8CZ5sXTtg@mail.gmail.com>
 <b39064e3-4f8b-f607-b270-1e0c8539d391@loongson.cn>
 <57a944b3-6255-38bf-e53e-6a838e1f8ddf@leemhuis.info>
From: Jianmin Lv <lvjianmin@loongson.cn>
Message-ID: <c63b9aa6-df87-e4e3-c3b1-a46ed060b0a9@loongson.cn>
Date: Mon, 27 Mar 2023 15:56:17 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <57a944b3-6255-38bf-e53e-6a838e1f8ddf@leemhuis.info>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxdbwhTCFkkf8NAA--.7069S3
X-CM-SenderInfo: 5oymxthqpl0qxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxCF1ftr1DtFW3Kr48Gr13CFg_yoWrXw15pF
	WrtF4UKr4Dtr1UAws2y3W0gr4jvrn5tr1Y9rn8Wr4rX3s0vFyrXr1Igr43uFyUZryxGw4j
	gr1jvrn2gryUJaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bIxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
	IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4U
	McvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487Mx
	AIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
	Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwI
	xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8
	JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcV
	C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU1MKZJUUUUU==



On 2023/3/25 下午9:31, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 24.03.23 11:09, Jianmin Lv wrote:
>> Please try the following patch:
>> https://github.com/acpica/acpica/pull/784/commits/0e66e6aae972dac3833bdcbd223aa6a8b1733176
> 
> To interact with the reporters, please comment here:
> https://bugzilla.kernel.org/show_bug.cgi?id=217069
> 
> Sorry, I wish it was different, but I can't CC the reporters here
> without their permission, because bugzilla.kernel.org tells users upon
> registration their "email address will never be displayed to logged out
> users".
> 
> FWIW, I forwarded your request yesterday and one reporter commented that
> it didn't help. But having me as a man-in-the-middle is not a good idea.
> 

Ok, I has transformed and adjusted the patch from ACPICA and post it 
into https://bugzilla.kernel.org/show_bug.cgi?id=217069.

Thanks!

> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
> 
>> On 2023/3/24 下午5:50, Huacai Chen wrote:
>>> Hi, Thorsten,
>>>
>>> I'm sorry I ignored this email, and Jianmin, could you please
>>> investigate this problem? Thank you.
>>>
>>> Huacai
>>>
>>> On Fri, Mar 24, 2023 at 5:46 PM Thorsten Leemhuis
>>> <regressions@leemhuis.info> wrote:
>>>>
>>>> On 19.03.23 08:20, Linux regression tracking (Thorsten Leemhuis) wrote:
>>>>> Hi, Thorsten here, the Linux kernel's regression tracker.
>>>>>
>>>>> On 22.02.23 08:57, Thorsten Leemhuis wrote:
>>>>>>
>>>>>> I noticed a regression report in bugzilla.kernel.org. As many (most?)
>>>>>> kernel developer don't keep an eye on it, I decided to forward it by
>>>>>> mail. Quoting from
>>>>>> https://bugzilla.kernel.org/show_bug.cgi?id=217069 :
>>>>>
>>>>> An issue that looked like a network bug was now bisected and it turns
>>>>> out it's cause by 5c62d5aab875 ("ACPICA: Events: Support fixed PCIe
>>>>> wake
>>>>> event") which Huacai Chen provided. Could you take a look at the ticket
>>>>> linked above?
>>>>
>>>> Huacai Chen, did you look into this? Would be good to have this
>>>> regression fixed rather sooner than later, as it seems to annoy quite a
>>>> few people.
>>>>
>>>> Should we maybe simply revert the problematic change for now and reapply
>>>> it later once the root-issue was found and fixed?
>>>>
>>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
>>>> -- 
>>>> Everything you wanna know about Linux kernel regression tracking:
>>>> https://linux-regtracking.leemhuis.info/about/#tldr
>>>> If I did something stupid, please tell me, as explained on that page.
>>>>
>>>> #regzbot poke
>>>>
>>>>> FWIW, the whole story started like this:
>>>>>
>>>>>>> Ivan Ivanich 2023-02-22 00:51:52 UTC
>>>>>>>
>>>>>>> After upgrade to 6.2 having issues with wake on lan on 2 systems: -
>>>>>>> first is an old lenovo laptop from 2012(Ivy Bridge) with realtek
>>>>>>> network adapter - second is a PC(Haswell refresh) with PCIE realtek
>>>>>>> network adapter
>>>>>>>
>>>>>>> Both uses r8169 driver for network.
>>>>>>>
>>>>>>> On laptop it's not possible to wake on lan after poweroff On PC it's
>>>>>>> not possible to wake on lan up after hibernate but works after
>>>>>>> poweroff
>>>>>>>
>>>>>>> In both cases downgrade to 6.1.x kernel fixes the issue.
>>>>>
>>>>> Meanwhile a few others that ran into the same problem with NICs from
>>>>> different vendors joined the ticket
>>>>>
>>>>> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker'
>>>>> hat)
>>>>> -- 
>>>>> Everything you wanna know about Linux kernel regression tracking:
>>>>> https://linux-regtracking.leemhuis.info/about/#tldr
>>>>> If I did something stupid, please tell me, as explained on that page.
>>
>>
>>


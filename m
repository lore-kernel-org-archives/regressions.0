Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF7B110FB
	for <regressions@lists.linux.dev>; Sun, 16 Apr 2023 12:35:31 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.153])
	by gateway (Coremail) with SMTP id _____8CxidmK6ztkHnkdAA--.34278S3;
	Sun, 16 Apr 2023 20:35:23 +0800 (CST)
Received: from [10.20.42.153] (unknown [10.20.42.153])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Cx+72H6ztk1VApAA--.48745S3;
	Sun, 16 Apr 2023 20:35:20 +0800 (CST)
Subject: Re: [regression] Bug 217069 - Wake on Lan is broken on r8169 since
 6.2
To: Linux regressions mailing list <regressions@lists.linux.dev>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Huacai Chen
 <chenhuacai@loongson.cn>, Bob Moore <robert.moore@intel.com>,
 acpica-devel@lists.linuxfoundation.org,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>
References: <e6aaddb9-afec-e77d-be33-570f9f10a9c2@leemhuis.info>
 <53e8b4db-e8dd-4dfa-f873-7dcbeac09149@leemhuis.info>
 <13aea525-108a-e018-987d-2447ff1d42df@leemhuis.info>
From: Jianmin Lv <lvjianmin@loongson.cn>
Message-ID: <754225a2-95a9-2c36-1886-7da1a78308c2@loongson.cn>
Date: Sun, 16 Apr 2023 20:35:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux loongarch64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <13aea525-108a-e018-987d-2447ff1d42df@leemhuis.info>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Cx+72H6ztk1VApAA--.48745S3
X-CM-SenderInfo: 5oymxthqpl0qxorr0wxvrqhubq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxJr4fZr4rAryUWw4rtFWkJFb_yoW8tFWfpF
	W5Kws8Xw4DGr18tan7Gw4v9ayj9wn8JF90kr9rXr4rXa45XasYvFyIgr43WFyUCr92ka13
	ta13ZryFgr9rAaDanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	bf8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
	x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8JVW8Jr1ln4kS
	14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
	AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C2
	67AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI
	8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWU
	CwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r
	1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsG
	vfC2KfnxnUUI43ZEXa7IU8fsqJUUUUU==

 From the feedbacks, the WOL issue has been fixed, and I have submitted 
a fixed patch to ACPICA, which has been reviewing in last week (Rafael 
also looked into the fixed patch).

There are two kinds of issues in the bug, one is WOL failed in kexec 
reboot, another is WOL failed in cold reboot. The former one still exist 
after reverted patch(5c62d5aab8752e5ee7bfbe75ed6060db1c787f98),
so this issue is not caused by the reverted patch. The second is caused 
by the reverted patch, and has been fixed with my provided patch.

Please see:
https://bugzilla.kernel.org/show_bug.cgi?id=217069#c54
https://bugzilla.kernel.org/show_bug.cgi?id=217069#c59

Thanks.


On 2023/4/14 下午8:48, Thorsten Leemhuis wrote:
> On 19.03.23 08:20, Linux regression tracking (Thorsten Leemhuis) wrote:
>> On 22.02.23 08:57, Thorsten Leemhuis wrote:
>>>
>>> I noticed a regression report in bugzilla.kernel.org. As many (most?)
>>> kernel developer don't keep an eye on it, I decided to forward it by
>>> mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=217069 :
>>
>> An issue that looked like a network bug was now bisected and it turns
>> out it's cause by 5c62d5aab875 ("ACPICA: Events: Support fixed PCIe wake
>> event") which Huacai Chen provided. Could you take a look at the ticket
>> linked above?
> 
> Jianmin did get close to a proper fix a while ago
> (https://bugzilla.kernel.org/show_bug.cgi?id=217069#c46 ), but it
> appears there wasn't any progress to fix this during the last week. Or
> did I miss it?
> 
> This is kinda unsatisfying, as the culprit is now known for nearly four
> weeks; especially as this is a issue that is present in 6.2 since it was
> released and would have been possible to fix there and in mainline with
> a simple revert. We even got close to one two weeks ago already
> (https://bugzilla.kernel.org/show_bug.cgi?id=217069#c49 ).
> 
> #sigh
> 
> I'd say we should revert this. Rafael, what's your opinion here?
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
> --
> Everything you wanna know about Linux kernel regression tracking:
> https://linux-regtracking.leemhuis.info/about/#tldr
> If I did something stupid, please tell me, as explained on that page.
> 
> #regzbot poke
> 


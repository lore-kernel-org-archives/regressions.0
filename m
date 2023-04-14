Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E6036B
	for <regressions@lists.linux.dev>; Fri, 14 Apr 2023 12:48:38 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pnIqu-0007Am-AC; Fri, 14 Apr 2023 14:48:32 +0200
Message-ID: <13aea525-108a-e018-987d-2447ff1d42df@leemhuis.info>
Date: Fri, 14 Apr 2023 14:48:31 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [regression] Bug 217069 - Wake on Lan is broken on r8169 since
 6.2
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Jianmin Lv <lvjianmin@loongson.cn>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Huacai Chen <chenhuacai@loongson.cn>, Bob Moore <robert.moore@intel.com>,
 acpica-devel@lists.linuxfoundation.org,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
References: <e6aaddb9-afec-e77d-be33-570f9f10a9c2@leemhuis.info>
 <53e8b4db-e8dd-4dfa-f873-7dcbeac09149@leemhuis.info>
In-Reply-To: <53e8b4db-e8dd-4dfa-f873-7dcbeac09149@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1681476518;9b74d5a0;
X-HE-SMSGID: 1pnIqu-0007Am-AC

On 19.03.23 08:20, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 22.02.23 08:57, Thorsten Leemhuis wrote:
>>
>> I noticed a regression report in bugzilla.kernel.org. As many (most?)
>> kernel developer don't keep an eye on it, I decided to forward it by
>> mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=217069 :
> 
> An issue that looked like a network bug was now bisected and it turns
> out it's cause by 5c62d5aab875 ("ACPICA: Events: Support fixed PCIe wake
> event") which Huacai Chen provided. Could you take a look at the ticket
> linked above?

Jianmin did get close to a proper fix a while ago
(https://bugzilla.kernel.org/show_bug.cgi?id=217069#c46 ), but it
appears there wasn't any progress to fix this during the last week. Or
did I miss it?

This is kinda unsatisfying, as the culprit is now known for nearly four
weeks; especially as this is a issue that is present in 6.2 since it was
released and would have been possible to fix there and in mainline with
a simple revert. We even got close to one two weeks ago already
(https://bugzilla.kernel.org/show_bug.cgi?id=217069#c49 ).

#sigh

I'd say we should revert this. Rafael, what's your opinion here?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke

Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E35701855
	for <regressions@lists.linux.dev>; Thu, 31 Aug 2023 05:44:10 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qbaTQ-0007eD-L3; Thu, 31 Aug 2023 07:44:08 +0200
Message-ID: <a2e995aa-8c21-c78c-f4b1-ef5bf2eed1b6@leemhuis.info>
Date: Thu, 31 Aug 2023 07:44:07 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: mainline build failure due to c8171a86b274 ("csky: Fixup
 -Wmissing-prototypes warning")
Content-Language: en-US, de-DE
To: Guo Ren <guoren@kernel.org>,
 Linux regressions mailing list <regressions@lists.linux.dev>
Cc: "Sudip Mukherjee (Codethink)" <sudipm.mukherjee@gmail.com>,
 Guo Ren <guoren@linux.alibaba.com>, Oleg Nesterov <oleg@redhat.com>,
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <ZO8qkS0Skg9L4xzr@debian>
 <527df158-7d32-42ba-d5f1-9dad30704cc1@leemhuis.info>
 <CAJF2gTQWWi_Cb1iQiLOr4114kZW7L93KNwjCu3ArKb7ffxcO+A@mail.gmail.com>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <CAJF2gTQWWi_Cb1iQiLOr4114kZW7L93KNwjCu3ArKb7ffxcO+A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1693460651;cf22bc02;
X-HE-SMSGID: 1qbaTQ-0007eD-L3

On 31.08.23 03:15, Guo Ren wrote:
> On Wed, Aug 30, 2023 at 9:07 PM Linux regression tracking (Thorsten
> Leemhuis) <regressions@leemhuis.info> wrote:
>>
>> On 30.08.23 13:40, Sudip Mukherjee (Codethink) wrote:
>>>
>>> The latest mainline kernel branch fails to build csky allmodconfig with
>>> the error:
>>
>> Thx for the report and involving regzbot. To make one thing more obvious:
>>
>> Guo Ren, it seems to be caused by a commit of yours.
>>
>> And fun fact: seem 0day bot found the same problem nearly thee weeks
>> ago, but nobody cared afaics:
>> https://lore.kernel.org/all/202308120502.MXpchFC1-lkp@intel.com/
>>
>>> In file included from ./arch/csky/include/asm/ptrace.h:7,
>>>                  from ./arch/csky/include/asm/processor.h:8,
>>>                  from ./include/linux/prefetch.h:15,
>>>                  from drivers/net/ethernet/intel/i40e/i40e_txrx.c:4:
>>> ./arch/csky/include/asm/traps.h:43:11: error: expected ';' before 'void'
>>>    43 | asmlinkage void do_trap_unknown(struct pt_regs *regs);
>>>       |           ^~~~~
>>>       |           ;
>>> [...]
>>>
>>> git bisect pointed to c8171a86b274 ("csky: Fixup -Wmissing-prototypes warning").
>>>
>>> Reverting the commit has fixed the build failure.
>>>
>>> I will be happy to test any patch or provide any extra log if needed.
>>>
>>> #regzbot introduced: c8171a86b27401aa1f492dd1f080f3102264f1ab
>>
>> #regzbot monitor:
>> https://lore.kernel.org/all/202308120502.MXpchFC1-lkp@intel.com/
> 
> Sorry, Fixes have been sent, I'm waiting for it into the linux-next,
> and then I will send 2nd pull request.
> 
> https://lore.kernel.org/linux-csky/20230830094653.2833443-1-guoren@kernel.org/

Ohh, it seems Guenter ran into this as well... Whatever, things happen.

Thx for taking care of this.

#regzbot monitor:
https://lore.kernel.org/all/20230830094653.2833443-1-guoren@kernel.org/
#regzbot monitor:
https://lore.kernel.org/all/cd3924fb-8639-4fa5-8aae-bc2b20a63dec@roeck-us.net/
#regzbot fix: csky: Fixup compile error

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

#regzbot ignore-activity

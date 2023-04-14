Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC2120F6
	for <regressions@lists.linux.dev>; Fri, 14 Apr 2023 14:11:44 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pnK9O-00007C-Ei; Fri, 14 Apr 2023 16:11:42 +0200
Message-ID: <2ace46f4-b9c4-855c-f186-04e7d4566cf8@leemhuis.info>
Date: Fri, 14 Apr 2023 16:11:42 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: Linux 6.3-rc2
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Guenter Roeck <linux@roeck-us.net>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <CAHk-=wii6BZtVKYfvQCQqbE3+t1_yAb-ea80-3PcJ4KxgpfHkA@mail.gmail.com>
 <d915df60-d06b-47d4-8b47-8aa1bbc2aac7@roeck-us.net>
 <73b7867a-8a1f-d521-d290-77bc7fcb2226@leemhuis.info>
In-Reply-To: <73b7867a-8a1f-d521-d290-77bc7fcb2226@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1681481505;977240ef;
X-HE-SMSGID: 1pnK9O-00007C-Ei

On 19.03.23 15:06, Linux regression tracking #adding (Thorsten Leemhuis)
wrote:
> 
> On 13.03.23 16:53, Guenter Roeck wrote:
>> On Sun, Mar 12, 2023 at 04:45:57PM -0700, Linus Torvalds wrote:
>>
>> Runtime:
>>
>> Warning backtraces in calls from ct_nmi_enter(),
>> seen randomly.
>>
> 
> I had expected this would be quickly resolved, but as the fix is not yet
> heading towards mainline, lets better ensure this regression is tracked:
> 
> #regzbot ^introduced 62b95a7b44d1
> #regzbot title arm: vfp: random Warning backtraces in calls from
> ct_nmi_enter()
> #regzbot fix: ARM: vfp: Fix broken softirq handling with instrumentation
> enabled
> #regzbot ignore-activity

TWIMC: the fix (ARM: 9294/2: vfp: Fix broken softirq handling with
instrumentation enabled) is in linux-next since a few days. And Guenter
stated the problem doesn't happen anymore since -rc3:

https://lore.kernel.org/linux-arm-kernel/629f3d60-3200-6da3-1d84-220d2b9ae1e8@roeck-us.net/

I'll thus remove this issue from the tracking for now to reduce the
noise; hope that's okay for everybody

#regzbot inconclusive: problem vanished, but there is a fix in
linux-next now, too
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.


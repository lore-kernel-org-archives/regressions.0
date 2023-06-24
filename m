Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514D01384
	for <regressions@lists.linux.dev>; Sat, 24 Jun 2023 13:44:11 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qD3Yf-00060A-0M; Sat, 24 Jun 2023 15:44:09 +0200
Message-ID: <f78c38f6-9c8d-9c4c-75be-9d9b5fe5024b@leemhuis.info>
Date: Sat, 24 Jun 2023 15:44:08 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Fwd: kernel fault on hibernation: get_zeroed_page/swsusp_write
Content-Language: en-US, de-DE
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Elmar Stellnberger <estellnb@elstel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Memory Management <linux-mm@kvack.org>,
 Linux Stable <stable@vger.kernel.org>
References: <5d4959b7-61da-8ab0-6bc6-21305d37c7aa@gmail.com>
 <ZJXFgfldS6W_LCiI@mail.dotplex.com> <ZJZGE4ZxJzrhRznA@debian.me>
 <ZJbDqStCNfdpwObE@mail.dotplex.com>
 <c125ec63-f7ba-3fd6-c286-05854fa1a07a@gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <c125ec63-f7ba-3fd6-c286-05854fa1a07a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1687614252;523d7889;
X-HE-SMSGID: 1qD3Yf-00060A-0M

On 24.06.23 14:15, Bagas Sanjaya wrote:
> On 6/24/23 17:21, Elmar Stellnberger wrote:
>> Hi Bagas S., Hi all
>>
>> concerns: Bug 217544 - kernel fault on hibernation: get_zeroed_page/swsusp_write 
>> https://bugzilla.kernel.org/show_bug.cgi?id=217544
>>
>>   Bisection does not make sense here, since I can not reproduce the
>> issue. Packing the kernel binaries and symbol files was meant to invoke
>> gdb directly on the kcore:
> 
> Thorsten: Should this be marked as invalid/inconclusive?

Not as invalid, as there might be a real issue here; but it's hard to
say, as among others it also quite possible that something else went
wrong (compiler? hardware?). Someone would have to investigate. But
given the fact that this happened with a stable kernel[1] and is
impossible to reproduce, I suspect no developer will be motivated enough
to do so. Then it's not worth tracking[2]:

#regzbot inconclusive: impossible to reproduce

Elmar, that's nothing bad. In case this turns out to be something you
can reproduce and bisect, just let us know and we'll add it back.

[1] see the sections about stable kernels
https://linux-regtracking.leemhuis.info/post/frequent-reasons-why-linux-kernel-bug-reports-are-ignored/

[2] side note: due to limited resources I consider to stop tracking all
non-bisected issues in general (expect those that started to happen in
mainline since the last mainline release) – or put them in a special
category that signals "those are collected here JFYI until they are
bisected, as the regression tracker due to limited resources for now
can't keep a close eye on these"

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.


Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BC9110F
	for <regressions@lists.linux.dev>; Thu, 26 Jan 2023 11:47:50 +0000 (UTC)
Received: from [2a02:8108:963f:de38:4bc7:2566:28bd:b73c]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pL0jH-0007Co-LV; Thu, 26 Jan 2023 12:47:43 +0100
Message-ID: <483d0045-f71c-5a85-fb4d-5eee3010da7c@leemhuis.info>
Date: Thu, 26 Jan 2023 12:47:43 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [bisected] clang 15 built kernel fails to boot, stuck at "Loading
 Linux 6.1.1 ...", gcc 12 built kernel with same config boots fine
Content-Language: en-US, de-DE
From: "Linux kernel regression tracking (#update)" <regressions@leemhuis.info>
To: "Erhard F." <erhard_f@mailbox.org>, sandipan.das@amd.com
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <20230119022303.177052e4@yea>
 <27bd67f4-8b08-6c5b-137c-e9ef543e6d56@leemhuis.info>
In-Reply-To: <27bd67f4-8b08-6c5b-137c-e9ef543e6d56@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1674733671;6d5d7497;
X-HE-SMSGID: 1pL0jH-0007Co-LV

[TLDR: a developer afaics forgot to use proper Link: tags when
submitting changes that apparently address the regression discussed in
this thread. This forces me to write this mail, which sole purpose it to
update the state of this tracked Linux kernel regression.]

On 19.01.23 15:44, Linux kernel regression tracking (#adding) wrote:
> On 19.01.23 02:23, Erhard F. wrote:
>> Hi!
>>
>> I did a kernel bisect for an issue I originally posted on https://github.com/ClangBuiltLinux/linux/issues/1774
>>
>> It is about kernel 6.1.x not booting on my machines when built with clang. A gcc built kernel with the same config just works fine. Turns out kernel v6.2-rc4 and earlier v6.2-rc are still affected.
>>
>> I did a kernel bisect which revealed this commit:
> [...]
> 
> #regzbot introduced 706460a96fc654e80b6be ^
> https://github.com/ClangBuiltLinux/linux/issues/1774
> #regzbot title perf/x86/amd/core: clang 15 built kernel fails to boot
> #regzbot ignore-activity

#regzbot monitor:
https://lore.kernel.org/all/20230123205915.751729592@infradead.org/
#regzbot fix: x86/static_call: Add support for Jcc tail-calls
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

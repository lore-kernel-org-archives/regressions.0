Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 289E3E4C6
	for <regressions@lists.linux.dev>; Sun, 19 Mar 2023 14:07:06 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pdtgX-0002ug-6Z; Sun, 19 Mar 2023 15:06:57 +0100
Message-ID: <73b7867a-8a1f-d521-d290-77bc7fcb2226@leemhuis.info>
Date: Sun, 19 Mar 2023 15:06:55 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: Linux 6.3-rc2
Content-Language: en-US, de-DE
To: Guenter Roeck <linux@roeck-us.net>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <CAHk-=wii6BZtVKYfvQCQqbE3+t1_yAb-ea80-3PcJ4KxgpfHkA@mail.gmail.com>
 <d915df60-d06b-47d4-8b47-8aa1bbc2aac7@roeck-us.net>
From: "Linux regression tracking #adding (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <d915df60-d06b-47d4-8b47-8aa1bbc2aac7@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1679234827;b85a1078;
X-HE-SMSGID: 1pdtgX-0002ug-6Z

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

On 13.03.23 16:53, Guenter Roeck wrote:
> On Sun, Mar 12, 2023 at 04:45:57PM -0700, Linus Torvalds wrote:
>
> Runtime:
> 
> Warning backtraces in calls from ct_nmi_enter(),
> seen randomly.
>

I had expected this would be quickly resolved, but as the fix is not yet
heading towards mainline, lets better ensure this regression is tracked:

#regzbot ^introduced 62b95a7b44d1
#regzbot title arm: vfp: random Warning backtraces in calls from
ct_nmi_enter()
#regzbot fix: ARM: vfp: Fix broken softirq handling with instrumentation
enabled
#regzbot ignore-activity

FWIW, latest patchset to fix it afaics is here:

https://lore.kernel.org/all/20230316082007.652669-1-ardb@kernel.org/

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

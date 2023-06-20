Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ABEAC8F9
	for <regressions@lists.linux.dev>; Tue, 20 Jun 2023 12:36:25 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qBaas-0001lH-AH; Tue, 20 Jun 2023 14:36:22 +0200
Message-ID: <90bf1d9d-1df3-acd1-5ecb-0c4e343ceffd@leemhuis.info>
Date: Tue, 20 Jun 2023 14:36:21 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: Fwd: kernel/cpu.c: linux misses the initialization of one CPU
 (off-by-one regression)
Content-Language: en-US, de-DE
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>, Linux x86 <x86@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>, Thomas Gleixner
 <tglx@linutronix.de>, "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Michael Kelley <mikelley@microsoft.com>,
 Oleksandr Natalenko <oleksandr@natalenko.name>, Helge Deller
 <deller@gmx.de>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Vincent Donnefort <vdonnefort@google.com>, Bert Karwatzki <spasswolf@web.de>
References: <6a10ec48-3940-cd8d-5e34-b9ade9f87b82@gmail.com>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <6a10ec48-3940-cd8d-5e34-b9ade9f87b82@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1687264585;696d7c21;
X-HE-SMSGID: 1qBaas-0001lH-AH

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 29.05.23 03:50, Bagas Sanjaya wrote:

> I notice a regression report on Bugzilla [1]. Quoting from it:
> [...]
> #regzbot introduced: 18415f33e2ac4a https://bugzilla.kernel.org/show_bug.cgi?id=217498
> #regzbot title: Off-by-one CPU initalization when CONFIG_NR_CPUS equal to actual system CPU count

Fix in next (just like the culprit):

#regzbot fix: 06c6796e0304234
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.


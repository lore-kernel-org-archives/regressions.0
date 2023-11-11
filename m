Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E4513FFA
	for <regressions@lists.linux.dev>; Sat, 11 Nov 2023 11:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1r1mWt-0004G2-2z; Sat, 11 Nov 2023 12:51:59 +0100
Message-ID: <0adb772c-e8d2-4444-92b0-00cbfdaf1fac@leemhuis.info>
Date: Sat, 11 Nov 2023 12:51:58 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: paul.gortmaker@windriver.com
Cc: bp@alien8.de, linux-kernel@vger.kernel.org, peterz@infradead.org,
 richard.purdie@linuxfoundation.org, tglx@linutronix.de, x86@kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <ZUEgAAGDVqXz2Seo@windriver.com>
Subject: Re: 32 bit qemu regression from v6.5 tip pull [6c480f222128
 x86/alternative: Rewrite optimize_nops() some]
Content-Language: en-US, de-DE
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <ZUEgAAGDVqXz2Seo@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1699703540;61df4798;
X-HE-SMSGID: 1r1mWt-0004G2-2z

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

> [Re: 32 bit qemu regression from v6.5 tip pull [6c480f222128 x86/alternative: Rewrite optimize_nops() some]] On 30/10/2023 (Mon 20:30) Thomas Gleixner wrote:
> 
>> On Mon, Oct 30 2023 at 19:24, Thomas Gleixner wrote:
> 
>> > Can you add "debug-alternative" to the kernel command line and log both
>> > a working and the non-working kernel output. It's noisy :)
>> >
>> > Also do you have a .config and the qemu command line handy?
>> 
>> Forgot to ask: Does the probkem persist with 6.6 ?
> 
> My bad, should have mentioned v6.6 and linux-next is impacted. Always a
> conflict between burying the lead and boring people with details.

Paul, was this regression ever solved? I wonder as I could not find
anything with a "Fixes: 6c480f222128 [...]" tag on lore and this thread
looks stalled.

Ciao, Thorsten

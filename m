Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4096FBB
	for <regressions@lists.linux.dev>; Fri, 24 Feb 2023 16:08:58 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pVact-0004Mr-GB; Fri, 24 Feb 2023 17:08:51 +0100
Message-ID: <9e210dcb-cd65-2213-ceab-9ba7b4ea0e81@leemhuis.info>
Date: Fri, 24 Feb 2023 17:08:51 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [Regression] mqueue performance degradation after "The new cgroup
 slab memory controller" patchset.
Content-Language: en-US, de-DE
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <PH0PR11MB562641BC03630B4B7A227FD7E9189@PH0PR11MB5626.namprd11.prod.outlook.com>
 <PH0PR11MB56260B78ED0C1255D7B5EE21E9189@PH0PR11MB5626.namprd11.prod.outlook.com>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <PH0PR11MB56260B78ED0C1255D7B5EE21E9189@PH0PR11MB5626.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1677254939;a9468122;
X-HE-SMSGID: 1pVact-0004Mr-GB

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

#regzbot ignore-activity

On 05.12.22 16:05, Luther, Sven wrote:
> #regzbot ^introduced 10befea91b61c4e2c2d1df06a2e978d182fcf792
> 
> We are making heavy use of mqueues, and noticed a degradation of performance between 4.18 & 5.10 linux kernels.
> 
> After a gross per-version tracing, we did kernel bisection between 5.8 and 5.9
> and traced the issue to a 10 patches (of which 9 where skipped as they didn't boot) between:

#regzbot inconclusive: not fixed, but cause by a trade-off and a likely
corner-case anyway; more optimizations planned to improve things
#regzbot ignore-activity

For details, see:

https://lore.kernel.org/all/Y+%2FGxJcNykVQxcG+@P9FQF9L96D.corp.robot.car/

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

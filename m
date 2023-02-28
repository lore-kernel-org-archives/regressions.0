Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CBE2CA2
	for <regressions@lists.linux.dev>; Tue, 28 Feb 2023 11:11:18 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pWxt6-0005iO-7n; Tue, 28 Feb 2023 12:11:16 +0100
Message-ID: <ae9753d2-6bc5-b99e-6462-ed83f8cad474@leemhuis.info>
Date: Tue, 28 Feb 2023 12:11:15 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [REGRESSION] 5.15.88 and onwards no longer return EADDRINUSE from
 bind
Content-Language: en-US, de-DE
To: Winter <winter@winter.cafe>, stable@vger.kernel.org
Cc: regressions@lists.linux.dev
References: <EF8A45D0-768A-4CD5-9A8A-0FA6E610ABF7@winter.cafe>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <EF8A45D0-768A-4CD5-9A8A-0FA6E610ABF7@winter.cafe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1677582678;6b55824e;
X-HE-SMSGID: 1pWxt6-0005iO-7n

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 13.02.23 04:38, Winter wrote:
> Hi all,
> 
> I'm facing the same issue as https://lore.kernel.org/stable/CAFsF8vL4CGFzWMb38_XviiEgxoKX0GYup=JiUFXUOmagdk9CRg@mail.gmail.com/, but on 5.15. I've bisected it across releases to 5.15.88, and can reproduce on 5.15.93.
> 
> However, I cannot seem to find the identified problematic commit in the 5.15 branch, so I'm unsure if this is a different issue or not.
> 
> There's a few ways to reproduce this issue, but the one I've been using is running libuv's (https://github.com/libuv/libuv) tests, specifically tests 271 and 277.
> 
> #regzbot introduced v5.15.88..

#regzbot fix: fdaf88531cfd17b
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.




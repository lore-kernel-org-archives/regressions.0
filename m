Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B061182DC
	for <regressions@lists.linux.dev>; Wed, 22 Nov 2023 09:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1r5jCP-0007Zc-Qq; Wed, 22 Nov 2023 10:07:09 +0100
Message-ID: <8b1cc069-b395-401a-aeff-85dd0c1cd8b0@leemhuis.info>
Date: Wed, 22 Nov 2023 10:07:09 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Bisected stability regression in 6.6
Content-Language: en-US, de-DE
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux PA-RISC Mailing List <linux-parisc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Sam James <sam@gentoo.org>, Linux Memory Management List
 <linux-mm@kvack.org>, Linux Regressions <regressions@lists.linux.dev>
References: <75318812c588816e0c741b4cd094524f@matoro.tk>
 <ZU8nGV4sg-l9-pkf@archie.me>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <ZU8nGV4sg-l9-pkf@archie.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1700644039;35e829dd;
X-HE-SMSGID: 1r5jCP-0007Zc-Qq

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 11.11.23 08:02, Bagas Sanjaya wrote:
> On Sat, Nov 11, 2023 at 01:31:01AM -0500, matoro wrote:
>> Hi Helge, I have bisected a regression in 6.6 which is causing userspace
>> segfaults at a significantly increased rate in kernel 6.6. 
> #regzbot ^introduced: 3033cd4307681c

#regzbot fix: 5f74f820f6fc844b95f9
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.


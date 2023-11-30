Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA844643B
	for <regressions@lists.linux.dev>; Thu, 30 Nov 2023 14:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1r8hpr-0007K2-AY; Thu, 30 Nov 2023 15:16:11 +0100
Message-ID: <63da0e45-12b4-4ab4-b66c-9fadf8251ee1@leemhuis.info>
Date: Thu, 30 Nov 2023 15:16:10 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: REGRESSION linux-next since Nov 16th, perf tool broken (at least
 on s390)
Content-Language: en-US, de-DE
To: Bagas Sanjaya <bagasdotme@gmail.com>,
 Linux Regressions <regressions@lists.linux.dev>
References: <aca1eb79-5dee-4634-8727-eebb251c9e1e@linux.ibm.com>
 <ZV22eWivHWOkKxGB@archie.me>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <ZV22eWivHWOkKxGB@archie.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1701353779;dc2e6d2f;
X-HE-SMSGID: 1r8hpr-0007K2-AY

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 22.11.23 09:06, Bagas Sanjaya wrote:
> On Wed, Nov 22, 2023 at 08:38:28AM +0100, Thomas Richter wrote:
>> perf tool fails on linux-next since Nov 16th on s390 when invoking perf on
>> any PMU event, as in
> 
> #regzbot ^introduced: 652ffc2104ec1f
> #regzbot title: event syntax error due to narrow startup race fix

Bagas, I currently lack resources to handle regressions in next, please
don't add them, for the foreseeable future that's not worth the trouble.

#regzbot fix: perf: Fix the nr_addr_filters fix
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

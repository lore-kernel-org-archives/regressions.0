Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9540B2F31
	for <regressions@lists.linux.dev>; Tue, 21 Feb 2023 14:50:15 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pUTy9-0008GZ-Jt; Tue, 21 Feb 2023 15:50:13 +0100
Message-ID: <1a7d95b0-f148-a60c-21a9-3e331f07a53d@leemhuis.info>
Date: Tue, 21 Feb 2023 15:50:13 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: Bug 216930 - closing laptop lid wakes from suspend Lenovo Slim 7
 Pro
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <a4c166c1-d987-6966-8027-55ddd16e7d5d@leemhuis.info>
In-Reply-To: <a4c166c1-d987-6966-8027-55ddd16e7d5d@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1676991015;92118ba2;
X-HE-SMSGID: 1pUTy9-0008GZ-Jt

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 30.01.23 10:36, Linux kernel regression tracking (Thorsten Leemhuis)
wrote:
> 
> I noticed a regression reported in bugzilla.kernel.org that seems to be
> handled there already, nevertheless I'd like to add to the tracking to
> ensure it's doesn't fall through the cracks in the end:
> 
> #regzbot introduced: v5.19..v6.0
> https://bugzilla.kernel.org/show_bug.cgi?id=216930
> #regzbot title: closing laptop lid wakes from suspend Lenovo Slim 7 Pro
> #regzbot ignore-activity

#regzbot inconclusive: unfixed, reporter doesn't care anymore (and
nobody ever bisected this)
#regzbot ignore-activity

https://bugzilla.kernel.org/show_bug.cgi?id=216930#c23

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

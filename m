Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7454E10954
	for <regressions@lists.linux.dev>; Wed,  1 Nov 2023 10:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qy8wt-0006AC-4r; Wed, 01 Nov 2023 11:59:47 +0100
Message-ID: <0f256363-430c-49c9-b395-94c3c7ceab06@leemhuis.info>
Date: Wed, 1 Nov 2023 11:59:46 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] resume with a Thunderbolt dock broke with commit
 e8b908146d44 "PCI/PM: Increase wait time after resume"
Content-Language: en-US, de-DE
To: Kamil Paral <kparal@redhat.com>, linux-pci@vger.kernel.org
Cc: regressions@lists.linux.dev
References: <CA+cBOTeWrsTyANjLZQ=bGoBQ_yOkkV1juyRvJq-C8GOrbW6t9Q@mail.gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <CA+cBOTeWrsTyANjLZQ=bGoBQ_yOkkV1juyRvJq-C8GOrbW6t9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1698836389;f180921b;
X-HE-SMSGID: 1qy8wt-0006AC-4r

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking.]

On 21.08.23 12:39, Kamil Paral wrote:
> = Summary =
> A Thinkpad T480s laptop with a Thinkpad Thunderbolt 3 Dock connected
> can no longer resume from suspend. The problem was introduced in
> e8b908146d44 "PCI/PM: Increase wait time after resume".
> [...]
> #regzbot introduced: e8b908146d44

Kamil, It looks like you found a workaround and lack time to further
look into this. Nobody else seems to have run into this and it seems
this is a odd corner case. Hence I guess there is not much value in
tracking this regression further for now. Please speak up if you disagree.

#regzbot inconclusive: workaround found, debugging stuck
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.



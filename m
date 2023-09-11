Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D0CF9D9
	for <regressions@lists.linux.dev>; Mon, 11 Sep 2023 12:21:13 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qffug-0007nd-WF; Mon, 11 Sep 2023 14:21:11 +0200
Message-ID: <41deab3f-3dd8-449e-ba68-1aca4e38cd46@leemhuis.info>
Date: Mon, 11 Sep 2023 14:21:10 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] Bug 216646 - having TRANSPARENT_HUGEPAGE enabled
 hangs some applications
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
Cc: LKML <linux-kernel@vger.kernel.org>, Linux-MM <linux-mm@kvack.org>
References: <37cd0a8d-bbd1-baf3-9c37-0cb8325b4cb3@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <37cd0a8d-bbd1-baf3-9c37-0cb8325b4cb3@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1694434873;ebb3d1db;
X-HE-SMSGID: 1qffug-0007nd-WF

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 03.11.22 14:51, Thorsten Leemhuis wrote:
> 
> Matthew, I noticed a regression report in bugzilla.kernel.org. As many
> (most?) kernel developer don't keep an eye on it, I decided to forward
> it by mail. Quoting from
> https://bugzilla.kernel.org/show_bug.cgi?id=216646 :
>
> #regzbot introduced: 56a4d67c264
> https://bugzilla.kernel.org/show_bug.cgi?id=216646
> #regzbot ignore-activity

#regzbot fix: cbc02854331edc6dc22d8b77b6e22e38ebc7dd51
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.


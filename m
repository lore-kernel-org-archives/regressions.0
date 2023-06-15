Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6F113AD3
	for <regressions@lists.linux.dev>; Thu, 15 Jun 2023 12:22:18 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1q9lzV-00038R-0f; Thu, 15 Jun 2023 14:22:17 +0200
Message-ID: <743bfe19-5be8-1ad9-6ad2-4411ce53d585@leemhuis.info>
Date: Thu, 15 Jun 2023 14:22:16 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [regression] kernel 6.3.x logitech unify receiver still not
 working properly
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <15e5d50f-95fc-c7c9-0918-015f24c6fc6d@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <15e5d50f-95fc-c7c9-0918-015f24c6fc6d@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1686831739;e3cd7c71;
X-HE-SMSGID: 1q9lzV-00038R-0f

On 04.06.23 10:21, Thorsten Leemhuis wrote:
> 
> Hi, Thorsten here, the Linux kernel's regression tracker. I noticed a
> regression reported in bugzilla.kernel.org that seems to be handled
> there already, nevertheless I'd like to add to the tracking to ensure
> it's doesn't fall through the cracks in the end:
> 
> #regzbot introduced: 586e8fede7953b1695b5ccc6112
> https://bugzilla.kernel.org/show_bug.cgi?id=217523
> #regzbot title: input: hid: logitech unify receiver not working properly
> #regzbot monitor:
> https://lore.kernel.org/all/nycvar.YFH.7.76.2305311042150.29760@cbobk.fhfr.pm/
> #regzbot ignore-activity

#regzbot fix: 7c28afd5512e371773d
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

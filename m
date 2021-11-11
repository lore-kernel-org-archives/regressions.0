Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E572C80
	for <regressions@lists.linux.dev>; Thu, 11 Nov 2021 06:09:27 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1ml3H3-0005Xs-4Z; Thu, 11 Nov 2021 07:09:25 +0100
Message-ID: <87711d0d-b53c-29c7-b96f-b87d405733ff@leemhuis.info>
Date: Thu, 11 Nov 2021 07:09:24 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: kernel 5.15.1: AMD RX 6700 XT - Fails to resume after screen
 blank
Content-Language: en-US
To: Mark Boddington <lkml@badpenguin.co.uk>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <dbadfe41-24bf-5811-cf38-74973df45214@badpenguin.co.uk>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <dbadfe41-24bf-5811-cf38-74973df45214@badpenguin.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1636610967;3692dec5;
X-HE-SMSGID: 1ml3H3-0005Xs-4Z

On 10.11.21 17:27, Mark Boddington wrote:
> 
> I run the mainline Linux kernel on Ubuntu 20.04, built from
> https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.15.1/
> 
> There appears to be a regression in 5.15.1 which causes the GPU to fail
> to resume after power saving.
> 
> Could it be this change??:

Mark, thx for CCing the regression list. To be sure this issue doesn't
fall through the cracks unnoticed, I'm adding it to regzbot, the Linux
kernel regression tracking bot:

#regzbot ^introduced f17dca0ab3f38b19c0f1b935f417f62d4a528723
#regzbot ignore-activity

FYI: I removed everyone else and the other lists from the To or CC to
avoid noise, as this mail is meaningless for them.

Ciao, Thorsten, your Linux kernel regression tracker.

P.S.: If you want to know more about regzbot, check out its
web-interface, the getting start guide, and/or the references documentation:

https://linux-regtracking.leemhuis.info/regzbot/
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/getting_started.md
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/reference.md

But note, regzbot is doing its first field-testing now and thus still
has some bugs. Adding this regression will help be to find them, hence
feel free to ignore it and any errors in the web-ui.

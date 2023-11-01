Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2D211CB5
	for <regressions@lists.linux.dev>; Wed,  1 Nov 2023 12:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qyADQ-0004TX-S7; Wed, 01 Nov 2023 13:20:56 +0100
Message-ID: <81b96729-7a7f-491c-bad2-82b2f7458d50@leemhuis.info>
Date: Wed, 1 Nov 2023 13:20:56 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kernel 6.5.0-10-generic USB-C monitor regression
Content-Language: en-US, de-DE
To: Rafael Tappe Maestro
 <rafael.tappe-maestro@student.medicalschool-hamburg.de>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <AM7PR07MB70111F33C82516181769CF54BBA0A@AM7PR07MB7011.eurprd07.prod.outlook.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <AM7PR07MB70111F33C82516181769CF54BBA0A@AM7PR07MB7011.eurprd07.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1698841258;5b42bcee;
X-HE-SMSGID: 1qyADQ-0004TX-S7

Hi! Many thx for your report.

On 31.10.23 15:23, Rafael Tappe Maestro wrote:
> 
> Moving from Ubuntu 23.04 to 23.10 came alongside a kernel update
> from 6.2.0-36-generic to 6.5.0-10-generic. 

Those are Ubuntu kernels that differ a lot from upstream Linux kernel
code. You thus have to report the problem to Ubuntu or check if things
worked with an upstream vanilla kernel and also broke (and are still
broken with latest mainline; waiting for 6.7-rc1 might be a good idea).

For details see:

https://docs.kernel.org/admin-guide/reporting-regressions.html
https://linux-regtracking.leemhuis.info/post/frequent-reasons-why-linux-kernel-bug-reports-are-ignored/

Sorry, I wish I could give you a better answer and an easier way to
report you bug to get closer to a resolution. But that's how it is
currently in the world we live in. :-/

Ciao, Thorsten

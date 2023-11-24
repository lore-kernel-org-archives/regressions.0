Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3E614F76
	for <regressions@lists.linux.dev>; Fri, 24 Nov 2023 06:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1r6PMD-0003D0-Bo; Fri, 24 Nov 2023 07:08:05 +0100
Message-ID: <2b2c006f-6044-45a5-b66e-d42bbd327375@leemhuis.info>
Date: Fri, 24 Nov 2023 07:08:05 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: AW: Kernel 6.5.0-10-generic USB-C monitor regression
Content-Language: en-US, de-DE
To: Rafael Tappe Maestro
 <rafael.tappe-maestro@student.medicalschool-hamburg.de>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <AM7PR07MB70111F33C82516181769CF54BBA0A@AM7PR07MB7011.eurprd07.prod.outlook.com>
 <81b96729-7a7f-491c-bad2-82b2f7458d50@leemhuis.info>
 <AM7PR07MB70112608EE47BA395A381296BBB9A@AM7PR07MB7011.eurprd07.prod.outlook.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <AM7PR07MB70112608EE47BA395A381296BBB9A@AM7PR07MB7011.eurprd07.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1700806087;e9daa96c;
X-HE-SMSGID: 1r6PMD-0003D0-Bo

On 23.11.23 19:40, Rafael Tappe Maestro wrote:

Side note: please stop sending HTML mails, they are rejected by the
lists and some developers, too. Due to the former even I now don't have
your initial report at hand anymore.

> Thank you for your prompt response, and apologies for getting back to
> this quite late. I've now tested original Linux kernels 6.2, 6.4, 6.5
> and 6.6.1. 
>
> The problem doesn't occur on 6.2 and 6.4, but does occur on 6.5 and
> 6.6.1. Am I correct to assume that this might be an upstream kernel
> issue after all? The kernels were installed via the mainline linux
> kernel app https://github.com/bkw777/mainline
> <https://github.com/bkw777/mainline>

Not totally sure, but I assume that those are indeed mainline vanilla
kernels.

The problem here is: that is important to know, but doesn't bring us far
enough, as the root of of can be in various areas of the kernel (PCI,
USB, Graphics, ...). Hence I guess no developer will look into this.
What we really need it for you do perform a "git bisect" between 6.4 and
6.5 to find the change that broke things. That is some work (there are
some docs about it on the net) and you'll have to compile your own
kernel for that, but without it we are almost certainly stuck here.

Ciao, Thorsten

> In particular, I tested the following versions
> 
>   * 6.6.1-060601.202311151749
>   * 6.5.0-060500.202308271831
>   * 6.4.0-060400.202306271339
>   * 6.2.0-060200.202302191831
> 
> The machine is the same as before.
> OS: Ubuntu 23.10 x86_64
> Host: 81Q9 Lenovo Yoga C940-14IIL
> CPU: Intel i7-1065G7 (8) @ 1.300GHz
> 
> 
> Sincerely,
> Rafael
> ------------------------------------------------------------------------
> *Von:* Thorsten Leemhuis <regressions@leemhuis.info>
> *Gesendet:* Mittwoch, 1. November 2023 13:20
> *An:* Rafael Tappe Maestro
> <rafael.tappe-maestro@student.medicalschool-hamburg.de>;
> regressions@lists.linux.dev <regressions@lists.linux.dev>
> *Betreff:* Re: Kernel 6.5.0-10-generic USB-C monitor regression
>  
> Hi! Many thx for your report.
> 
> On 31.10.23 15:23, Rafael Tappe Maestro wrote:
>> 
>> Moving from Ubuntu 23.04 to 23.10 came alongside a kernel update
>> from 6.2.0-36-generic to 6.5.0-10-generic. 
> 
> Those are Ubuntu kernels that differ a lot from upstream Linux kernel
> code. You thus have to report the problem to Ubuntu or check if things
> worked with an upstream vanilla kernel and also broke (and are still
> broken with latest mainline; waiting for 6.7-rc1 might be a good idea).
> 
> For details see:
> 
> https://docs.kernel.org/admin-guide/reporting-regressions.html
> <https://docs.kernel.org/admin-guide/reporting-regressions.html>
> https://linux-regtracking.leemhuis.info/post/frequent-reasons-why-linux-kernel-bug-reports-are-ignored/ <https://linux-regtracking.leemhuis.info/post/frequent-reasons-why-linux-kernel-bug-reports-are-ignored/>
> 
> Sorry, I wish I could give you a better answer and an easier way to
> report you bug to get closer to a resolution. But that's how it is
> currently in the world we live in. :-/
> 
> Ciao, Thorsten

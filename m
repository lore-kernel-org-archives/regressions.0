Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD7C72
	for <regressions@lists.linux.dev>; Thu, 25 Nov 2021 11:15:14 +0000 (UTC)
Received: from ip4d173d4a.dynamic.kabel-deutschland.de ([77.23.61.74] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1mqCie-00061p-O3; Thu, 25 Nov 2021 12:15:12 +0100
Message-ID: <a392e70f-b630-15f7-d87e-aef89ce45312@leemhuis.info>
Date: Thu, 25 Nov 2021 12:15:12 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [REGRESSION] Kernel 5.15 reboots / freezes upon ifup/ifdown
Content-Language: en-BS
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <924175a188159f4e03bd69908a91e606b574139b.camel@gmx.de>
 <e694f9fe-56a9-aaec-f802-0f7a06b10ee5@leemhuis.info>
In-Reply-To: <e694f9fe-56a9-aaec-f802-0f7a06b10ee5@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1637838914;54d79d1d;
X-HE-SMSGID: 1mqCie-00061p-O3




On 24.11.21 08:48, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker speaking.
> 
> On 24.11.21 08:28, Stefan Dietrich wrote:
>> Summary: When attempting to rise or shut down a NIC manually or via
>> network-manager under 5.15, the machine reboots or freezes.
>>
>> Occurs with: 5.15.4-051504-generic and earlier 5.15 mainline (
>> https://kernel.ubuntu.com/~kernel-ppa/mainline/v5.15.4/) as well as
>> liquorix flavours.
>> Does not occur with: 5.14 and 5.13 (both with various flavours)
> 
> Thx for the report. Small detail: you CCed the stable list, but this
> afaics is a mainline regression. Likely one in the network subsystem, so
> it might be good to get the mailing list where the network developer
> hang out in the loop. But as Greg already said: a bisection would help a
> lot to find the root cause and thus the developers that need to take
> care of this.
> 
> Anyway, to be sure this issue doesn't fall through the cracks unnoticed,
> I'm adding it to regzbot, my Linux kernel regression tracking bot:
> 
> #regzbot ^introduced v5.14..v5.15
> #regzbot ignore-activity
> 
> Ciao, Thorsten, your Linux kernel regression tracker.
> 
> P.S.: If you want to know more about regzbot, check out its
> web-interface, the getting start guide, and/or the references documentation:
> 
> https://linux-regtracking.leemhuis.info/regzbot/
> https://gitlab.com/knurd42/regzbot/-/blob/main/docs/getting_started.md
> https://gitlab.com/knurd42/regzbot/-/blob/main/docs/reference.md

Update the status:

#regzbot introduced a90ec84837325df4b9a6798c2cc0df202b5680bd
#regzbot ignore-activity

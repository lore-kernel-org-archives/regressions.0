Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680472C9C
	for <regressions@lists.linux.dev>; Thu, 13 Oct 2022 12:58:02 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oixmi-00056x-Ao; Thu, 13 Oct 2022 14:58:00 +0200
Message-ID: <bbee1e7c-8ae1-aebf-30ce-1060cb2220a9@leemhuis.info>
Date: Thu, 13 Oct 2022 14:57:59 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US, de-DE
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Bug 212389 - Kernel panic on VIA Nano L2200
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1665665882;6b1dc845;
X-HE-SMSGID: 1oixmi-00056x-Ao

Hi, this is your Linux kernel regression tracker speaking.

I noticed a regression report in bugzilla.kernel.org I'd like to add to
the tracking: https://bugzilla.kernel.org/show_bug.cgi?id=212389

> I ran into this issue after upgrading my debian kernel from 4.19 to
> 5.10. Debian bugreport:
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=979765
> 
> It probably started with kernel 5.8, when the Zhaoxin PMU driver was
> added, but I've not tested that. The problem also occurs with
> upstream linux kernels and I re-tested today with upstream
> 5.12.0-rc4
> 
> No panic occurs when kernel boot parameter
> 'initcall_blacklist=init_hw_perf_events' is used.

See the ticket for more details.

#regzbot introduced: v4.19..v5.10
https://bugzilla.kernel.org/show_bug.cgi?id=212389
#regzbot monitor:
https://lore.kernel.org/all/20210607013109.7870-1-CodyYao-oc@zhaoxin.com/
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.



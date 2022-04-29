Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDCF1385
	for <regressions@lists.linux.dev>; Fri, 29 Apr 2022 12:03:33 +0000 (UTC)
Received: from [2a02:8108:963f:de38:6624:6d8d:f790:d5c]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nkPLP-00068i-GK; Fri, 29 Apr 2022 14:03:31 +0200
Message-ID: <0b09b35a-64d3-5ba3-dabc-1e36ace1c275@leemhuis.info>
Date: Fri, 29 Apr 2022 14:03:31 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
X-Mozilla-News-Host: news://nntp.lore.kernel.org:119
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: tboot suspend broken on Lenovo T460p
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1651233813;b8e41faf;
X-HE-SMSGID: 1nkPLP-00068i-GK

Hi, this is your Linux kernel regression tracker speaking.

About a week ago a regression was reported to bugzilla.kernel.org that
seems to be handled there already, nevertheless I'd like to add to the
tracking to ensure it's not forgotten.

#regzbot introduced: 453e41085183980087f8a80dada523caf1131c3c
#regzbot from: Derek Dolney <z23@posteo.net>
#regzbot title: tboot suspend broken on Lenovo T460p
#regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215867

Quote:

> I am using tboot (v1.10.5) to make use of intel-txt and all was
> working fine with the Linux kernel 5.10 series. However later in 5.12
> release candidates, I have  proper booting however suspend is broken.
> I am using a Lenovo T460p. Usually when suspending on this machine
> the power button LED will blink 8 times and then it goes into a sleep
> state. With newer kernels I get power LED and caps lock LED blinking,
> cpu fan runs fast, and can't get out of that state without hard
> powerdown.
> 
> I did a git bisect on and found that commit
> 453e41085183980087f8a80dada523caf1131c3c is the one that breaks
> tboot+suspend to ram. It is part of a series of some cpu hotplug
> commits.
> 
> Just to be clear: if I build a kernel from the commit just before
> this one, I can suspend and resume, but if I build with this commit I
> can not suspend, laptop gets stuck on blinking power LED. Let me also
> mention that, given the above commit, if I do not use tboot, I can
> suspend and resume ok. It is only within the tboot boot context that
> I have suspend&resume problems.


See the ticket for details, there were a few replies already.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.

-- 
Additional information about regzbot:

If you want to know more about regzbot, check out its web-interface, the
getting start guide, and the references documentation:

https://linux-regtracking.leemhuis.info/regzbot/
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/getting_started.md
https://gitlab.com/knurd42/regzbot/-/blob/main/docs/reference.md

The last two documents will explain how you can interact with regzbot
yourself if your want to.

Hint for reporters: when reporting a regression it's in your interest to
CC the regression list and tell regzbot about the issue, as that ensures
the regression makes it onto the radar of the Linux kernel's regression
tracker -- that's in your interest, as it ensures your report won't fall
through the cracks unnoticed.

Hint for developers: you normally don't need to care about regzbot once
it's involved. Fix the issue as you normally would, just remember to
include 'Link:' tag in the patch descriptions pointing to all reports
about the issue. This has been expected from developers even before
regzbot showed up for reasons explained in
'Documentation/process/submitting-patches.rst' and
'Documentation/process/5.Posting.rst'.

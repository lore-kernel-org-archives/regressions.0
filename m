Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8E320E5
	for <regressions@lists.linux.dev>; Tue, 29 Mar 2022 08:33:17 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nZ7Hv-0005q3-GQ; Tue, 29 Mar 2022 10:33:15 +0200
Message-ID: <5f660108-8812-383c-83e4-29ee0558d623@leemhuis.info>
Date: Tue, 29 Mar 2022 10:33:14 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 az0123456@gmx.de, Linux Media Mailing List <linux-media@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Bug 215726 - si2157.c: mention name of the missing firmware file
To: Antti Palosaari <crope@iki.fi>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Robert Schlabbach <robert_s@gmx.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1648542798;bfa706d1;
X-HE-SMSGID: 1nZ7Hv-0005q3-GQ

Hi, this is your Linux kernel regression tracker.

I noticed a regression report in bugzilla.kernel.org that afaics nobody
acted upon since it was reported about a week ago, that's why I decided
to forward it to the lists and all people that seemed to be relevant
here. To quote from https://bugzilla.kernel.org/show_bug.cgi?id=215726 :

> I get the following error messages when trying to use si2157.ko in linux 5.17:
> si2157 13-0060: found a 'Silicon Labs Si2157-A30 ROM 0x50'
> si2157 13-0060: Can't continue without a firmware
> I did work in linux 5.16.16 without a firmware file. Unfortunately the driver does not tell me the name of the missing firmware file.

Could somebody take a look into this? Or was this discussed somewhere
else already? Or even fixed?

Anyway, to get this tracked:

#regzbot introduced: v5.16..v5.17
#regzbot from: az0123456@gmx.de <az0123456@gmx.de>
#regzbot title: media: si2157.c: mention name of the missing firmware file
#regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215726

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I'm getting a lot of
reports on my table. I can only look briefly into most of them and lack
knowledge about most of the areas they concern. I thus unfortunately
will sometimes get things wrong or miss something important. I hope
that's not the case here; if you think it is, don't hesitate to tell me
in a public reply, it's in everyone's interest to set the public record
straight.

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

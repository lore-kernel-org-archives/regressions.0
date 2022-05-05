Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C00625
	for <regressions@lists.linux.dev>; Thu,  5 May 2022 09:52:53 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nmYAF-0007lg-8h; Thu, 05 May 2022 11:52:51 +0200
Message-ID: <941f292d-2ce2-d7aa-3d70-01a11ba171cf@leemhuis.info>
Date: Thu, 5 May 2022 11:52:50 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Samuel Clark <slc2015@gmail.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: regression: Null pointer exception on resume from S3 with i2c
 DesignWare driver
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1651744375;845ee30a;
X-HE-SMSGID: 1nmYAF-0007lg-8h

Hi, this is your Linux kernel regression tracker.

I noticed a regression report in bugzilla.kernel.org that afaics nobody
acted upon since it was reported about a week ago, that's why I decided
to forward it to the lists and all people that seemed to be relevant. To
quote from https://bugzilla.kernel.org/show_bug.cgi?id=215907 :

> Running Manjaro on a Gigabyte B660M DS3H DDR4 with custom 5.17 kernel. Confirmed on other distributions and kernels back to 5.12; issue is not present on most recent 5.11 kernel. dmesg traceback points to i2c DesignWare driver, specifically drivers/i2c/busses/i2c-designware-master.c:369. It seems the msgs struct passed in to i2c_dw_xfer_msg is null.
> 
> Similar issue seems to be reported here:  https://lore.kernel.org/lkml/YY5BRrE8bLyvd3PB@smile.fi.intel.com/t/  
> 
> lspci output: https://pastebin.com/MwFM2VBJ
> dmesg from crashed kernel: https://pastebin.com/t6GsHjkq
> kernel config: https://pastebin.com/awrSve5u

Could somebody take a look into this? Or was this discussed somewhere
else already? Or even fixed?

Anyway, to get this tracked:

#regzbot introduced: v5.11..v5.12
#regzbot from: Samuel Clark <slc2015@gmail.com>
#regzbot title: i2c: designware: Null pointer exception on resume from S3
#regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215907

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

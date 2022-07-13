Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FACA17C3
	for <regressions@lists.linux.dev>; Wed, 13 Jul 2022 06:10:06 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oBVZS-0004oy-Nz; Wed, 13 Jul 2022 08:10:02 +0200
Message-ID: <87ddc25d-9c80-399f-3378-aa5594318dce@leemhuis.info>
Date: Wed, 13 Jul 2022 08:10:01 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: Regression in v5.19-rc4 Sound Distortion
Content-Language: en-US
To: Daniel Exner <dex@dragonslave.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
References: <46fd7a73-06fd-a8a0-8530-0ecf9b18c08d@dragonslave.de>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <46fd7a73-06fd-a8a0-8530-0ecf9b18c08d@dragonslave.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1657692606;e878d452;
X-HE-SMSGID: 1oBVZS-0004oy-Nz

[TLDR: I'm adding this regression report to the list of tracked
regressions; all text from me you find below is based on a few templates
paragraphs you might have encountered already already in similar form.]

Hi, this is your Linux kernel regression tracker.

On 12.07.22 18:02, Daniel Exner wrote:
> 
> Since  v5.19-rc4 this box got some *loud* distorting sound on boot and
> after some time without any sound if something plays sound again from
> the integrated speakers in my monitor.
> 
> 
> I managed to bisect this down to:
> 
>> commit 202773260023b56e868d09d13d3a417028f1ff5b
>> Author: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>> Date:   Fri Jun 17 15:24:02 2022 +0300
>>
>>    PM: hibernate: Use kernel_can_power_off()
>>
> 
> Reverting that commit on top of v5.19-rc6 does indeed fix the problem here.
> 
> Any ideas?

CCing the regression mailing list, as it should be in the loop for all
regressions, as explained here:
https://www.kernel.org/doc/html/latest/admin-guide/reporting-issues.html

Thanks for the report. To be sure below issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
tracking bot:

#regzbot ^introduced 202773260023b56e868d09d13d3a417028f1f
#regzbot title PM: hibernate: Sound Distortion on boot
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply -- ideally with also
telling regzbot about it, as explained here:
https://linux-regtracking.leemhuis.info/tracked-regression/

Reminder for developers: When fixing the issue, add 'Link:' tags
pointing to the report (the mail this one replies to), as explained for
in the Linux kernel's documentation; above webpage explains why this is
important for tracked regressions.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.

Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26A2173
	for <regressions@lists.linux.dev>; Fri, 21 Jan 2022 09:57:14 +0000 (UTC)
Received: from ip4d173d02.dynamic.kabel-deutschland.de ([77.23.61.2] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nAqfL-000142-D1; Fri, 21 Jan 2022 10:57:07 +0100
Message-ID: <cc5eac25-7680-c5a4-16d3-fba988c8525a@leemhuis.info>
Date: Fri, 21 Jan 2022 10:57:05 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: drm: amdgpu: s0ix suspend stopped working #forregzbot
Content-Language: en-BS
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <f3aa1e12-c65f-8668-772c-b25dca79b642@leemhuis.info>
 <3fbb3ac9-fcb5-372c-b8e5-b8b1c34b3079@leemhuis.info>
In-Reply-To: <3fbb3ac9-fcb5-372c-b8e5-b8b1c34b3079@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1642759034;5f0a9e61;
X-HE-SMSGID: 1nAqfL-000142-D1

On 16.01.22 08:35, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker speaking.
> 
> For the record:
> 
> #regzbot fixed-by: e8521d0cd984897

Fix in the end got a different commit-id:

#regzbot fixed-by: c4849f88164b13dd1

> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=master&id=e8521d0cd984897b4fa58e7837afebd04e44f0b3
> 
>> drm/amd/display: Revert W/A for hard hangs on DCN20/DCN21
>> The WA from commit 2a50edbf10c8 ("drm/amd/display: Apply w/a for hard hang
>> on HPD") and commit 1bd3bc745e7f ("drm/amd/display: Extend w/a for hard
>> hang on HPD to dcn20") causes a regression in s0ix where the system will
>> fail to resume properly on many laptops.  Pull the workarounds out to
>> avoid that s0ix regression in the common case.  This HPD hang happens with
>> an external device in special circumstances and a new W/A will need to be
>> developed for this in the future.
>>
>> Cc: Qingqing Zhuo <qingqing.zhuo@amd.com>
>> Reported-by: Scott Bruce <smbruce@gmail.com>
>> Reported-by: Chris Hixon <linux-kernel-bugs@hixontech.com>
>> Reported-by: spasswolf@web.de
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=215436
>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1821
>> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1852
>> Fixes: 2a50edbf10c8 ("drm/amd/display: Apply w/a for hard hang on HPD")
>> Fixes: 1bd3bc745e7f ("drm/amd/display: Extend w/a for hard hang on HPD to dcn20")
>> Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> 
> 
> TWIMC: this mail is primarily send for documentation purposes and for
> regzbot, my Linux kernel regression tracking bot. These mails usually
> contain '#forregzbot' in the subject, to make them easy to spot and filter.
> 
> On 01.01.22 11:22, Thorsten Leemhuis wrote:
>> Hi, this is your Linux kernel regression tracker speaking.
>>
>> There are two reports about s2idle regression on AMD systems. They are
>> already being worked on.
>>
>> I'm writing this mail just for getting it tracked by regzbot and to make
>> it easier for people to find the issue.
>>
>> #regzbot ^introduced 2a50edbf10c8c56e930bfb53d8f9f00a33fd837e
>> #regzbot title drm: amdgpu: s0ix suspend stopped working
>> #regzbot Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1821
>> #regzbot Link: https://bugzilla.kernel.org/show_bug.cgi?id=215436
>>
>> Ciao, Thorsten
>>
>> P.S.: As a Linux kernel regression tracker I'm getting a lot of reports
>> on my table. I can only look briefly into most of them. Unfortunately
>> therefore I sometimes will get things wrong or miss something important.
>> I hope that's not the case here; if you think it is, don't hesitate to
>> tell me about it in a public reply, that's in everyone's interest.
>>
>> BTW, I have no personal interest in this issue, which is tracked using
>> regzbot, my Linux kernel regression tracking bot
>> (https://linux-regtracking.leemhuis.info/regzbot/). I'm only posting
>> this mail to get things rolling again and hence don't need to be CC on
>> all further activities wrt to this regression.
>>
>> ---
>> Additional information about regzbot:
>>
>> If you want to know more about regzbot, check out its web-interface, the
>> getting start guide, and/or the references documentation:
>>
>> https://linux-regtracking.leemhuis.info/regzbot/
>> https://gitlab.com/knurd42/regzbot/-/blob/main/docs/getting_started.md
>> https://gitlab.com/knurd42/regzbot/-/blob/main/docs/reference.md
>>
>> The last two documents will explain how you can interact with regzbot
>> yourself if your want to.
>>
>> Hint for reporters: when reporting a regression it's in your interest to
>> tell #regzbot about it in the report, as that will ensure the regression
>> gets on the radar of regzbot and the regression tracker. That's in your
>> interest, as they will make sure the report won't fall through the
>> cracks unnoticed.
>>
>> Hint for developers: you normally don't need to care about regzbot once
>> it's involved. Fix the issue as you normally would, just remember to
>> include a 'Link:' tag to the report in the commit message, as explained
>> in Documentation/process/submitting-patches.rst
>> That aspect was recently was made more explicit in commit 1f57bd42b77c:
>> https://git.kernel.org/linus/1f57bd42b77c
>>
>>
>>
>>

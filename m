Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24CB7F
	for <regressions@lists.linux.dev>; Wed,  4 May 2022 13:16:46 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nmEs0-0000pA-QB; Wed, 04 May 2022 15:16:44 +0200
Message-ID: <a1b901c8-e9ea-3bd8-69d0-8b288495e37b@leemhuis.info>
Date: Wed, 4 May 2022 15:16:44 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Intel_backlight does not work after updating from 5.10.89 to
 latest 5.15.17 (fwd from bugzilla) #forregzbot
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <74ee2216-a295-c2b6-328b-3e6d0cc1847e@leemhuis.info>
 <e3b27243-ccd2-5d03-4826-de2a6eddd976@leemhuis.info>
 <a6dbd6a1-b862-e19d-bef6-4e41e2caf778@leemhuis.info>
In-Reply-To: <a6dbd6a1-b862-e19d-bef6-4e41e2caf778@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1651670206;d623c6ae;
X-HE-SMSGID: 1nmEs0-0000pA-QB

On 22.04.22 11:49, Thorsten Leemhuis wrote:
> On 24.03.22 15:51, Thorsten Leemhuis wrote:
>> TWIMC: this mail is primarily send for documentation purposes and for
>> regzbot, my Linux kernel regression tracking bot. These mails usually
>> contain '#forregzbot' in the subject, to make them easy to spot and filter.
>>
>> On 31.01.22 07:36, Thorsten Leemhuis wrote:
>>> Hi, this is your Linux kernel regression tracker speaking.
>>>
>>> There is a regression in bugzilla.kernel.org I'd like to add to the
>>> tracking:
>>>
>>> #regzbot introduced: v5.10.89..v5.15.17
>>> #regzbot from:  Filippo Falezza <filippo.falezza@outlook.it>
>>> #regzbot title: backlight: Intel_backlight does not work after updating
>>> from 5.10.89 to latest 5.15.17
>>> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215553
>>
>> #regzbot link: https://gitlab.freedesktop.org/drm/intel/-/issues/5284
>> #regzbot ignore-activity
> 
> #rebzbot fixed-by: b4b157577cb1de13

Trying this again, without a typo:

#regzbot fixed-by: b4b157577cb1de13

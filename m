Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980D87C
	for <regressions@lists.linux.dev>; Sun, 28 Aug 2022 11:59:59 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oSGxG-0000QA-1t; Sun, 28 Aug 2022 13:59:54 +0200
Message-ID: <3470af88-a3bf-eb0c-c9db-ec1101b456f5@leemhuis.info>
Date: Sun, 28 Aug 2022 13:59:53 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: Regression: PM: domains: Delete usage of
 driver_deferred_probe_check_state #forregzbot
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <DU0PR04MB941735271F45C716342D0410886B9@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <2c69b2bb-418c-ac78-703a-79c6a30f7a35@leemhuis.info>
In-Reply-To: <2c69b2bb-418c-ac78-703a-79c6a30f7a35@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1661687999;a9d3dc1d;
X-HE-SMSGID: 1oSGxG-0000QA-1t

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

On 17.08.22 12:47, Thorsten Leemhuis wrote:
> [TLDR: I'm adding this regression report to the list of tracked
> regressions; all text from me you find below is based on a few templates
> paragraphs you might have encountered already already in similar form.]
> 
> Hi, this is your Linux kernel regression tracker.
> 
> On 16.08.22 08:21, Peng Fan wrote:
>> Hi Saravana,
>>
>> The following two patches breaks NXP i.MX8ULP, but I think
>> it may break others use SCMI.
>> [...]
>> When sdhc driver probe, the scmi power domain provider has not
>> been registered. So __genpd_dev_pm_attach directly return
>> -ENODEV.
>>
>> device_links_check_suppliers should already check suppliers,
>> but scmi protocol device not have compatible, so 
>> of_link_to_phandle
>>       |-> of_get_compat_node
>> use the parent node of scmi protocol as supplier if I understand
>> correct.
>>
>> I am not sure whether we need to revert the above two patches,
>> or do you have other suggestions?
> 
> Thanks for the report. To be sure the issue doesn't fall through the
> cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
> tracking bot:
> 
> #regzbot ^introduced 5a46079a9645
> #regzbot title pm: booting on NXP i.MX8ULP broke
> #regzbot monitor:
> https://lore.kernel.org/all/20220727185012.3255200-1-saravanak@google.com/
> #regzbot duplicate: https://lore.kernel.org/all/Yvpd2pwUJGp7R+YE@euler/
> #regzbot ignore-activity

#regzbot fixed-by: 13a8e0f6b01b1

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.

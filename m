Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C0014F6C
	for <regressions@lists.linux.dev>; Tue, 29 Aug 2023 13:43:59 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qaz0f-00085O-NH; Tue, 29 Aug 2023 15:43:57 +0200
Message-ID: <d8758169-9f98-e050-61e5-7109176bb5d2@leemhuis.info>
Date: Tue, 29 Aug 2023 15:43:57 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: Regression: ALS/ACS stops working on amd-sfh
Content-Language: en-US, de-DE
To: Linux Regressions <regressions@lists.linux.dev>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Input Devices <linux-input@vger.kernel.org>
References: <0ea231a1-e510-903d-22a0-998234426462@gmail.com>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <0ea231a1-e510-903d-22a0-998234426462@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1693316639;980976aa;
X-HE-SMSGID: 1qaz0f-00085O-NH

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 04.08.23 14:45, Bagas Sanjaya wrote:
> Hi,
> 
> I notice a very concise regression report on Bugzilla [1]. That is,
> quoting from it:
> 
>> Since commit a33e5e393171ae8384d3381db5cd159ba877cfcb ("HID: amd_sfh: Fix illuminance value"), the in_illuminance_raw is 0 all the time.
>>
>> Before that commit, the ACS/ALS has normal value.
> 
> See Bugzilla for the full thread.
> 
> Anyway, I'm adding this regression to be tracked by regzbot:
> 
> #regzbot introduced: a33e5e393171ae https://bugzilla.kernel.org/show_bug.cgi?id=217762
> #regzbot title: Fixing in_illuminance_raw value hard-codes ACS/ALS to 0

#regzbot inconclusive: developer closed ticket as RESOLVED
UNREPRODUCIBLE (likely "firmware bug for your platform" and reporter
didn't complain
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.


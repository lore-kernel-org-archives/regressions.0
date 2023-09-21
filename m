Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859468F55
	for <regressions@lists.linux.dev>; Thu, 21 Sep 2023 09:14:20 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qjFlH-0004qZ-T2; Thu, 21 Sep 2023 11:14:15 +0200
Message-ID: <e583d026-9401-482d-8f3d-025a952c32c4@leemhuis.info>
Date: Thu, 21 Sep 2023 11:14:14 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: hwmon: (nct6775) Regression Bisected
Content-Language: en-US, de-DE
To: Bagas Sanjaya <bagasdotme@gmail.com>, Doug Smythies
 <dsmythies@telus.net>, 'Ahmad Khalifa' <ahmad@khalifa.ws>,
 'Guenter Roeck' <linux@roeck-us.net>
Cc: 'Jean Delvare' <jdelvare@suse.com>,
 Linux Hardware Monitoring <linux-hwmon@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <002101d9e7e0$f67c4490$e374cdb0$@telus.net>
 <ZQVzdlHgWdFhOVyQ@debian.me>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <ZQVzdlHgWdFhOVyQ@debian.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1695287660;3ddae2ae;
X-HE-SMSGID: 1qjFlH-0004qZ-T2

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 16.09.23 11:20, Bagas Sanjaya wrote:
> On Fri, Sep 15, 2023 at 07:28:57AM -0700, Doug Smythies wrote:
>> Kernel 6.6-rc1 has an error during boot. The guilty commit is:
>> b7f1f7b2523a6a4382f12fe953380b847b80e09d
>> hwmon: (nct6775) Additional TEMP registers for nct6799
> [...]
> Thanks for the regression report. I'm adding it to regzbot:
> 
> #regzbot ^introduced: b7f1f7b2523a6a
> #regzbot title: shift out-of-bounds in nct6799's additional TEMP registers

Fix doesn't use a link regzbot is able to handle, thus point to it manually:

#regzbot fix: hwmon: (nct6775) Fix non-existent ALARM warning
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.



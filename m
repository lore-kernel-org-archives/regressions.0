Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4901FA3
	for <regressions@lists.linux.dev>; Thu,  2 Nov 2023 08:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qyTFj-0006qe-4a; Thu, 02 Nov 2023 09:40:35 +0100
Message-ID: <f8d48009-cf9c-411d-9753-1b01b5aae168@leemhuis.info>
Date: Thu, 2 Nov 2023 09:40:34 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Possibly broken Linux 5.10.198 backport spi: spi-zynqmp-gqspi:
 Fix runtime PM imbalance in zynqmp_qspi_probe
Content-Language: en-US, de-DE
Cc: Linux Stable <stable@vger.kernel.org>
References: <9afe9285-6f46-46d9-bd21-2ea5c4dc43c0@denx.de>
 <ZSjYC_ATX193mJOA@debian.me> <ZSrERw6ucvl1wLWX@sashalap>
 <ZSt4wfx1EMeC0lnX@debian.me>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
To: Linux Regressions <regressions@lists.linux.dev>
In-Reply-To: <ZSt4wfx1EMeC0lnX@debian.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1698914437;a689c69c;
X-HE-SMSGID: 1qyTFj-0006qe-4a

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 15.10.23 07:29, Bagas Sanjaya wrote:
> On Sat, Oct 14, 2023 at 12:39:35PM -0400, Sasha Levin wrote:
>> On Fri, Oct 13, 2023 at 12:39:23PM +0700, Bagas Sanjaya wrote:
>>> On Thu, Oct 12, 2023 at 06:39:10PM +0200, Marek Vasut wrote:
>>>> Linux 5.10.198 commit
>>>> 2cdec9c13f81 ("spi: spi-zynqmp-gqspi: Fix runtime PM imbalance in
>>>> zynqmp_qspi_probe")
>>>>
>>>> looks very different compared to matching upstream commit:
>>>> a21fbc42807b ("spi: spi-zynqmp-gqspi: Fix runtime PM imbalance in
>>>> zynqmp_qspi_probe")
>>>>
>>>> The Linux 5.10.198 change breaks a platform for me and it really looks like
>>>> an incorrect backport.
>>>>
>>>> Dinghao, can you have a look ?
>>>>
>>>
>>> Thanks for the regression report. I'm adding it to regzbot (as stable-specific
>>> one):
>>>
>>> #regzbot ^introduced: 2cdec9c13f81
>>
>> I'm going to revert it from 5.10.
>>
> 
> OK, thanks!
> 
> Don't forget to add Link: to this regression report and most importantly,
> Fixes: to the culprit commit when reverting.

That did not happen, but no big deal:

#regzbot fix: 1ceaf0d3a883bd5f
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

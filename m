Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780AD79DB
	for <regressions@lists.linux.dev>; Sun, 27 Aug 2023 13:52:43 +0000 (UTC)
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1qaGBu-0008S7-Pl; Sun, 27 Aug 2023 15:52:34 +0200
Message-ID: <4690e4ba-fb45-dcde-af32-d9908906b47b@leemhuis.info>
Date: Sun, 27 Aug 2023 15:52:34 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: REGRESSION WITH BISECT: v6.5-rc6 TPM patch breaks S3 on some
 Intel systems
Content-Language: en-US, de-DE
Cc: Linux Regressions <regressions@lists.linux.dev>
References: <485e8740385239b56753ce01d8995f01f84a68e5.camel@linux.intel.com>
 <ZN63CG6d3d7ifq7U@debian.me>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <ZN63CG6d3d7ifq7U@debian.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1693144363;eba104ba;
X-HE-SMSGID: 1qaGBu-0008S7-Pl

On 18.08.23 02:10, Bagas Sanjaya wrote:
> On Thu, Aug 17, 2023 at 02:09:00PM -0700, Todd Brandt wrote:
>> While testing S3 on 6.5.0-rc6 we've found that 5 systems are seeing a
>> crash and reboot situation when S3 suspend is initiated. To reproduce
>> it, this call is all that's required "sudo sleepgraph -m mem -rtcwake
>> 15".
> #regzbot ^introduced: 554b841d470338
> #regzbot title: Disabling RNG for AMD fTPMs breaks S3 on some Intel systems

#regzbot dup-of: https://bugzilla.kernel.org/show_bug.cgi?id=217804
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F8083D9DDC
	for <regressions@lists.linux.dev>; Fri, 24 Jul 2026 16:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784911889; cv=none; b=lEw26x2ewId2iz1l/irg7/5eeNAnVZeXhuXv7sUu+jwnjTES331PPeFv4T3gIJBcU3oVfmYHb0UZf/KpJIABcKBK82YhE1wkPFXpgWErMlDFCe4wZmFb/3sRdxB5YOMP2Pw+82HZdxsdBUoyqgbn0r0hocnly99mDemvSsUqN6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784911889; c=relaxed/simple;
	bh=+nizwDeG+1kJYzR1smRhk8dFW94xvgwgY/3S1X2YHPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l/lCfNMC5CmdNuC9o97zj1HU7dU4WnKlyFutqtiKWaitd9Xckh1MRhBmJTNFxgy/OzzxGRaSHVfSIhxCdhndTKmA/m2rn/rxJ1DewOOzQ/rU66EJjeIJrPpX2h13tO1WexLJwcEIt4aqUDClAqyPyPo9Vkf3B5N4vqdGMMBZJAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ACiegJql; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ACiegJql"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B89B41F000E9;
	Fri, 24 Jul 2026 16:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784911887;
	bh=6DaUHSrWjgsQtlgDMux59Kr3eqRtmX4eV1O33te3wRw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ACiegJqlc2wifyeDQmtbASArtoOeemSzPemVnPsdq87/olSOcLMSij8aIOyr/Qs5l
	 R+4RUZF4+lZ10KT6X6hrwk30bLpWgiTz5YAsfGGltcxvMT+WU0xrg1aJQ2rCLJgbYA
	 QDBBd8Bn+eb43fXwlhbg5VyGKbhWklwHNfVA1wZAYa2wN8yh8TK3sJ+RzfPYtIoKim
	 w+qHmXnRSEAfiaOl4hHzXzpTzBHordv8KFo3MzHI9eucJFlYiYzSkoi6mPNvpMww+/
	 +hOR0bXLdl7TASi5VCX/OxxWxtEx+ABjCvVL737bQgobBCqvJOfvnu5e6K8qF3MzDO
	 tWqqLpF3A0p3g==
Message-ID: <f8dd5c7c-7088-4860-a00f-2e63c87c78c9@kernel.org>
Date: Fri, 24 Jul 2026 11:51:25 -0500
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogW1JFR1JFU1NJT05dIHNuZF9oZGFfaW50ZWw6IDE1?=
 =?UTF-8?Q?s_audio_resume_delay_on_AMD_Conexant_SN6140?=
Content-Language: en-US
To: Demon Player <DemonPlayer0@outlook.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: "regressions@leemhuis.info" <regressions@leemhuis.info>,
 Mingyou Chen <qby140326@gmail.com>,
 "Vijendar.Mukunda@amd.com" <Vijendar.Mukunda@amd.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <MWHPR04MB102982652A66D828B734EBC4C92CF2@MWHPR04MB10298.namprd04.prod.outlook.com>
 <MWHPR04MB1029801AFD77D790D33C53E1592CF2@MWHPR04MB10298.namprd04.prod.outlook.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <MWHPR04MB1029801AFD77D790D33C53E1592CF2@MWHPR04MB10298.namprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/24/26 06:31, Demon Player wrote:
> 
> Subject: Re: [REGRESSION] snd_hda_intel: 15s audio resume delay on AMD Conexant SN6140
> 
> Hi,
> 
> Please allow me to correct a detail in my original report.
> 
> The suspend state used during testing is S2idle (Modern Standby), not S3 (Suspend to RAM).
> 
> I confirmed this with:
> $ cat /sys/power/mem_sleep
> [s2idle]
> 
> All bisect and test results were conducted under the S2idle state. The regression remains reproducible exclusively under S2idle.
> 
> Apologies for the confusion. Please let me know if any additional logs are needed.
> 

Can you please capture an amd-s2idle report with the commit vs without 
the commit?  Share both.  This will help explain a few things.

https://pypi.org/project/amd-debug-tools/

Ideally please attach the reports to a bug either:

https://bugzilla.kernel.org/
or
https://gitlab.freedesktop.org/drm/amd/-/work_items

Thanks!

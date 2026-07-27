Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BCE7420460
	for <regressions@lists.linux.dev>; Mon, 27 Jul 2026 16:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785170713; cv=none; b=sYb10fT01rB1i+jGT1DVWQeKKplrHdy8Yfy/dnxZ/8Im0WHjqR4hwwbeWt5kERu5sV2dWzbuzS7ouZs6e4ovNCYunI9A2Xc/ZazB/+eTLN2CxplTovoQaZ1JHKohlfPomYpHemctA8rEeSlP1B5+ZvdtGM6a5B9CpcIE19Yhh3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785170713; c=relaxed/simple;
	bh=0RB8M3MC/b4jokRNNWex9mQt0HjF+6onHpRwDwd9syA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HnsQ7RBhOxk1jyuoTKZUFk3ci3zpuneUT8ir8RLqYgxe+g4u415o6L7Lx7UmR8P+6fSHCahiQ3GWfF1T+JJVkBd15Aahzvf7mabSZ7mSRriDKmpPi6UhcYCtWQUqS08/TdHq4qwxatSyYiF5Fol1/O7L2VPbusmw4b9aAqfPx08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=odywitLI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="odywitLI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE8571F00A3A;
	Mon, 27 Jul 2026 16:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785170711;
	bh=TKOOM86XxKOCiHijm3BsfizzFZ4rMc0SXPRk5xFvoJo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=odywitLI+s0//F/MiCmIGi7NL1j8DHKu/J0GjlK6R/FNhPfe2I17CZOK76p8THDoq
	 s1IR7gy6eGUJiHM5UZJ49gjATegoakcBPyAAUyux5a1ar/1UEZ+jLYug2sK/O5WRIL
	 6/KPhDm6ogh+kxrohYvquZiOcJnlQ8xWa6esuWZYUpyujK7/H5ipQPsnL6eMA5FUd/
	 f/M6TjQ7j2lJ1jmsQSxK+mIhUzmEO3ptkSgRASBAvPMU7ZxLqy8JaAUlUI86V33CDC
	 9lyDyJVcuQVFQ2b11gtLEu/jAG9//BKZP/iNuvcgHRlu5AumgtxPw3GV6jZLty18P8
	 RxlhK+ml1hKTQ==
Message-ID: <97a17ad9-3e2c-4839-a28e-51706f321414@kernel.org>
Date: Mon, 27 Jul 2026 11:45:09 -0500
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOWbnuWkjTog5Zue5aSNOiBbUkVHUkVTU0lPTl0gc25kX2hkYV9p?=
 =?UTF-8?Q?ntel=3A_15s_audio_resume_delay_on_AMD_Conexant_SN6140?=
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
 <f8dd5c7c-7088-4860-a00f-2e63c87c78c9@kernel.org>
 <MWHPR04MB102980F54F9465597DC602D4792CD2@MWHPR04MB10298.namprd04.prod.outlook.com>
From: Mario Limonciello <superm1@kernel.org>
In-Reply-To: <MWHPR04MB102980F54F9465597DC602D4792CD2@MWHPR04MB10298.namprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/25/26 20:07, Demon Player wrote:
> 
> Hi Mario,
> 
> As requested, I have uploaded the amd-s2idle reports to a GitLab work item:
> https://gitlab.freedesktop.org/drm/amd/-/work_items/5529
> 
> Please let me know if you need anything else.
> 

There are going to be more artifacts needed.  We'll continue the triage 
on that bug tracker.

Thanks,

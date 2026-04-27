Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB762D9481
	for <regressions@lists.linux.dev>; Mon, 27 Apr 2026 09:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777282685; cv=none; b=XFG1wFTcenW/aXn6JsuCFukJ9MPgME0EIOyS0rNuDU9fIxK3M8ZvxiWMPDjyvNTgbtl9KR1CtNbxvvGemBhyDjficVDIN3AdktkW7Lpo5PNLL8B0mpR6HD7nXBdpcKRflTfZAj7v9RGL/heyOeWCICC4XlimXlhg+fsZ1mYX/Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777282685; c=relaxed/simple;
	bh=ofNF5C7Ug4dk2ZiNcdA825bSUg2IVrEKLOPUt5sOPEo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=m1cpwHAEL9KCWgeAx0aq2RfLp/0VEG1QzK8I7xUa4jwbV/5kqyu2cc9VPR9ZOQNSxp7EAyvlymfJu0gXcTuS6rclb7W5Dj/KBJsqqXy8sgy/dcSn5GKPAOPWW/JqULdj8l8SEpzlFH0oHVdKUcuooLC9ZEQGKKWd8fLu9JsSD28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=XbJ7JEvD; arc=none smtp.client-ip=188.68.63.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="XbJ7JEvD"
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4g3z4y62dpz66Bc;
	Mon, 27 Apr 2026 11:37:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1777282674;
	bh=ofNF5C7Ug4dk2ZiNcdA825bSUg2IVrEKLOPUt5sOPEo=;
	h=Date:Subject:From:To:Cc:Reply-To:References:In-Reply-To:From;
	b=XbJ7JEvDAEf49zY+0mXxAqAcKFSa5521gAyCKZh0qNAJxgPw/aA5RYomIYjsIM05F
	 nA0CmSfmkkW6uSb7znaHUrpzsm5CF7mCbTGQgS3xUEEFSUYwYH1N6iGUn5Yvoma8KS
	 rZQ+ChxV6M0D/XIH4X/nPYKT9RgyzkXLhvCetxxTb0JoIinRykSLttNaSuPIWT3+eP
	 Ha3L1UmlW0mVfBudWSfxoW0kIUzlxWSCVFJDjvHTAGKj6osOUxYwmC+0QfHGySLb3J
	 bKQH4Brel0IWc8V6KJasFMSu9ihFMWTPRjywuXiPNGKJiwrBdS4Q32zmz5spk0yNbJ
	 Pnox/TDNmathA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4g3z4y5JxLz4xD3;
	Mon, 27 Apr 2026 11:37:54 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4g3z4y0KD8z8sgT;
	Mon, 27 Apr 2026 11:37:54 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 70EC3632B7;
	Mon, 27 Apr 2026 11:37:53 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <ed3171ef-eda8-4907-a35b-2e2b8185e574@leemhuis.info>
Date: Mon, 27 Apr 2026 11:37:53 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] amdgpu error -22 first encountered in kernel 6.19,
 not fixed in 7.0
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Brandon Taylor <br.ta.2818@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 Alex Deucher <alexander.deucher@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Timo Lindfors <timo.lindfors@iki.fi>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
References: 
 <CAMYTvdA+yCqU4_9mzMUkX_3S=myExKMBCyB88dYWCMwA1edsrw@mail.gmail.com>
 <6c48aff5-b6ee-40af-98f0-c26ded3095bc@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <6c48aff5-b6ee-40af-98f0-c26ded3095bc@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <177728267378.279541.17168315814522822753@mxe9fb.netcup.net>
X-NC-CID: exb88VKTz+PlWa+wzr8qsiERlTM7i2TLbBJx2nuWy+7sQEOlb1U=

[note: please remove Timo Lindfors when replying to this mail and
include Timur Kristóf – sorry everyone and especially Timo, my mailers
address book tricked me]

On 4/27/26 11:35, Linux regression tracking (Thorsten Leemhuis) wrote:
> On 4/26/26 01:22, Brandon Taylor wrote:
>> I have an AMD Radeon R9 270X GPU (yes, I know it's old) which used to
>> default to the `radeon` firmware
> 
> FYI, as using the wrong terms can lead to confusion while dealing with
> bugs: that's not a firmware, that's the driver (sometimes also called
> kernel module)
> 
>> on kernel versions up to and
>> including 6.18. I could manually change this behavior to use the new
>> `amdgpu` firmware by setting `radeon.si_support=0 amdgpu.si_support=1`
>> as kernel parameters in the GRUB bootloader. Everything worked fine,
>> and I was able to play my Windows games without any problems.
>>
>> That was, until kernel version 6.19 came out.>
>> 6.19, from what I was able to Google, was supposed to have AMD GPUs to
>> default to the new `amdgpu` firmware. Unfortunately, when I updated
>> the kernel and rebooted, I got a black screen.
>>
>> Further Google searches led me to reboot, set `nomodeset` in the
>> kernel parameters, switch to a TTY, login, and investigate the output
>> of a `dmesg` command — and what I saw ... Well, let's just say it's
>> the kind of thing that would make Linus go Chernobyl:
>>
>> `amdgpu: probe with driver amdgpu failed with error -22`
> 
> Please provide a full kernel log, this is needed to full understand the
> problem
> 
>> And this issue has not been fixed in kernel version 7.0, which I guess
>> is set to be the next LTS kernel.
> 
> No, it's not.
> 
>> Now, I hope to God that this email finds whoever is responsible for
>> breaking this `amdgpu` firmware before the same thing happens to Linus
>> via Fedora 44, and he goes berserk. I realize that's not a heck of a
>> lot of time, but God only knows HOW many Linux users with AMD GPUs are
>> pissed off by this kind of issue — and I for one can only imagine how
>> Linus' reaction will compare when it happens to HIM!
> 
> FWIW, you seem to assume that the problem hits everyone with a AMD GPUs.
> That's not the case, we'd know this by now. Maybe it's not even
> something that hits everyone with a card/gpu like yours, as some falires
> only show up in certain environments, for example in combination with a
> specific mainboard chipset or firmware.
> 
> Anyway: I CCed a few people that might be able to help. But they likely
> will need at least the full kernel log mentioned above .
> 
> Ciao, Thorsten


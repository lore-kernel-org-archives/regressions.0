Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63DE290D
	for <regressions@lists.linux.dev>; Fri, 27 Jan 2023 12:52:51 +0000 (UTC)
Received: from [2a02:8108:963f:de38:4bc7:2566:28bd:b73c]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pLODp-0001vu-Om; Fri, 27 Jan 2023 13:52:49 +0100
Message-ID: <cea5051b-1a13-45a9-6cbe-a664a9cd1d88@leemhuis.info>
Date: Fri, 27 Jan 2023 13:52:49 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] ALSA: hda/hdmi: Use only dynamic PCM device allocation
 #forregzbot
Content-Language: en-US, de-DE
From: "Linux kernel regression tracking (#update)" <regressions@leemhuis.info>
To: ALSA development <alsa-devel@alsa-project.org>
Cc: amd-gfx@lists.freedesktop.org,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <20220922084017.25925-1-perex@perex.cz>
 <1c9c00dec72c241a399b3b7c0a305382a5712529.camel@bi-co.net>
 <163d5366-35d9-f7db-cf50-796d6b011c0a@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <163d5366-35d9-f7db-cf50-796d6b011c0a@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1674823971;dfef2cc9;
X-HE-SMSGID: 1pLODp-0001vu-Om

[TLDR: This mail in primarily relevant for Linux kernel regression
tracking. See link in footer if these mails annoy you.]

On 26.12.22 14:26, Thorsten Leemhuis wrote:
> On 25.12.22 13:14, Michael Laß wrote:
>> CC'ing amd-gfx as this might be an issue in the amd driver.
>>
>> This change causes a regression in Linux 6.1 at least on some AMD APUs.
>> There are reports from users with Ryzen 4750U, 5800U and 5850U chips
>> where the HDMI sound devices don't show up anymore. I'm affected by
>> this as well.
>>
>> Reverting this commit (ef6f5494) makes the HDMI audio devices show up
>> again. I verified that this is still an issue in current Linux git
>> (72a85e2b).
> 
> Thanks for the report. To be sure below issue doesn't fall through the
> cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
> tracking bot:
> 
> #regzbot ^introduced ef6f5494faf6a37c74990689a
> #regzbot title alsa: hda/hdmi: HDMI sound devices don't show up anymore
> with some AMD APUs
> #regzbot ignore-activity

#regzbot fix: 090ddad4c7a9
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.


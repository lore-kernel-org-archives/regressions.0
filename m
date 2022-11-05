Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1FFF1FA6
	for <regressions@lists.linux.dev>; Sat,  5 Nov 2022 10:13:26 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1orGB2-0007lr-7a; Sat, 05 Nov 2022 11:13:24 +0100
Message-ID: <d4662501-c93e-bc17-e4f0-7bce6110d76f@leemhuis.info>
Date: Sat, 5 Nov 2022 11:13:23 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH] Fix kbl_rt5663_rt5514_max98927 regression #forregzbot
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: regressions@lists.linux.dev, alsa-devel@alsa-project.org
References: <20221102200527.4174076-1-jmontleo@redhat.com>
 <302e95d4-2a0d-7d2a-177c-82923c14c654@leemhuis.info>
In-Reply-To: <302e95d4-2a0d-7d2a-177c-82923c14c654@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1667643206;ba0b99f9;
X-HE-SMSGID: 1orGB2-0007lr-7a

On 03.11.22 12:57, Thorsten Leemhuis wrote:
> [Note: this mail is primarily send for documentation purposes and/or for
> regzbot, my Linux kernel regression tracking bot. That's why I removed
> most or all folks from the list of recipients, but left any that looked
> like a mailing lists. These mails usually contain '#forregzbot' in the
> subject, to make them easy to spot and filter out.]
> 
> On 02.11.22 21:05, Jason Montleon wrote:
>> Starting with 6.0-rc1 these messages are logged and the sound card
>> is unavailable. Adding legacy_dai_naming to the rt5514-spi causes
>> it to function properly again.
>>
>> [   16.928454] kbl_r5514_5663_max kbl_r5514_5663_max: ASoC: CPU DAI
>> spi-PRP0001:00 not registered
>> [   16.928561] platform kbl_r5514_5663_max: deferred probe pending
> 
> Thanks for the report. To be sure below issue doesn't fall through the
> cracks unnoticed, I'm adding it to regzbot, my Linux kernel regression
> tracking bot:
> 
> #regzbot introduced v5.19..v6.0 ^
> https://bugzilla.kernel.org/show_bug.cgi?id=216641
> #regzbot title sound: asoc: kbl_r5514_5663_max: sound broken
> #regzbot ignore-activity

#regzbot fixed-by: a1dca8774faf3f77eb34fa0ac6f3e2b82

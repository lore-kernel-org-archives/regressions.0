Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E585C90C
	for <regressions@lists.linux.dev>; Tue,  5 Dec 2023 13:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rAVXK-0005dK-0Y; Tue, 05 Dec 2023 14:32:30 +0100
Message-ID: <670a7310-8098-4083-9f30-96987cc5d0aa@leemhuis.info>
Date: Tue, 5 Dec 2023 14:32:28 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression apparently caused by commit
 088a40980efbc2c449b72f0f2c7ebd82f71d08e2 "ASoC: amd: acp: add pm ops support
 for acp pci driver"
Content-Language: en-US, de-DE
To: syed saba kareem <ssabakar@amd.com>, Marian Postevca
 <posteuca@mutex.one>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
 Vijendar.Mukunda@amd.com, Basavaraj.Hiregoudar@amd.com,
 Sunil-kumar.Dommati@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Yang Yingliang <yangyingliang@huawei.com>,
 Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
 ye xingchen <ye.xingchen@zte.com.cn>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <87a5v8szhc.fsf@mutex.one> <ZUQssoD2rUHSYQ2v@debian.me>
 <610d562f-0bbc-485c-ad63-9534fa4ba937@amd.com>
 <d002ad6f-d908-4cf6-afcf-bf0989418e72@leemhuis.info>
 <6085d2e3-f28e-4d1d-9863-8275931430e6@amd.com> <87fs0x4fn7.fsf@mutex.one>
 <ac9d4f7b-c7af-4d21-b0b8-d0f188b94b0f@amd.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <ac9d4f7b-c7af-4d21-b0b8-d0f188b94b0f@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1701783154;62a499c1;
X-HE-SMSGID: 1rAVXK-0005dK-0Y

On 23.11.23 14:58, syed saba kareem wrote:
> 
> On 11/23/23 03:25, Marian Postevca wrote:
>> syed saba kareem <ssabakar@amd.com> writes:
>>
>>> Hi , We have up streamed the patch it is in review.
>>>
>>> Please find the below link for the patch details.
>>>
>>> https://patchwork.kernel.org/project/alsa-devel/patch/20231113123345.2196504-2-Syed.SabaKareem@amd.com/
>>>
>> Sorry maybe I'm not understanding here something, when you are saying
>> that the patch is in review, where is this review being done?
>>
>> As far as I can tell Mark Brown only pulled the first patch from your
>> series:
> 
> We got comments for the second patch and we addressed them.
> 
> It seems it may be stuck at review stage as one patch got merged.
> 
> Will resend the patch again.
> 
> You can find the received review comments for the patch in the below link.

Any news? From a quick look it seems this didn't make any progress at
all, but I might be missing something.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

#regzbot poke

>>> Applied to
>>>
>>>     https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git
>>> for-next
>>>
>>> Thanks!
>>>
>>> [1/2] ASoC: amd: acp: add Kconfig options for acp7.0 based platform
>>> driver
>>>        commit: d3534684ada99ef8c0899eb28c62b4462483ee19
>>> [2/2] ASoC: amd: acp: add pm ops support for renoir platform
>>>        (no commit info)
>>>
>> I don't see the second patch in for-next.
> 
> 

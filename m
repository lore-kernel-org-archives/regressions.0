Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E783B10EF
	for <regressions@lists.linux.dev>; Mon, 19 Dec 2022 09:41:54 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1p7CeT-0001HF-Qv; Mon, 19 Dec 2022 10:41:41 +0100
Message-ID: <e23ec080-9fe4-ee28-1d4c-879127803660@leemhuis.info>
Date: Mon, 19 Dec 2022 10:41:41 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 0/2] ASoC: SOF: remove unregister calls from shutdown
Content-Language: en-US, de-DE
To: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: yung-chuan.liao@linux.intel.com, tiwai@suse.de, daniel.baluta@nxp.com,
 Oliver Neukum <oneukum@suse.com>, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com, Zhen Ni <nizhen@uniontech.com>,
 ranjani.sridharan@linux.intel.com, Ricardo Ribalda <ribalda@chromium.org>,
 Archana Patni <archana.patni@intel.com>, peter.ujfalusi@linux.intel.com,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <20221209114529.3909192-1-kai.vehmanen@linux.intel.com>
 <167102472177.27755.10161077455234852195.b4-ty@kernel.org>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <167102472177.27755.10161077455234852195.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1671442915;652a0409;
X-HE-SMSGID: 1p7CeT-0001HF-Qv

Hi, this is your Linux kernel regression tracker.

On 14.12.22 14:32, Mark Brown wrote:
> On Fri, 09 Dec 2022 13:45:27 +0200, Kai Vehmanen wrote:
>> This patchset is an alternative solution to problems
>> reported by Ricardo Ribalda <ribalda@chromium.org> and
>> Zhen Ni <nizhen@uniontech.com>, as discussed in
>>
>> - "[PATCH] ALSA: core: Fix deadlock when shutdown a frozen userspace"
>>  https://mailman.alsa-project.org/pipermail/alsa-devel/2022-November/209248.html
>>
>> [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> 
> Thanks!
> 
> [1/2] ASoC: SOF: Intel: pci-tgl: unblock S5 entry if DMA stop has failed"
>       commit: 2aa2a5ead0ee0a358bf80a2984a641d1bf2adc2a
> [2/2] ASoC: SOF: Revert: "core: unregister clients and machine drivers in .shutdown"
>       commit: 44fda61d2bcfb74a942df93959e083a4e8eff75f
> 
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
> [...]

I noticed a regression report in bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=216820

```
> My laptop started to hang on hibernation (sleep and shutdown are
> fine). I bisected it to commit 83bfc7e793b555291785136c3ae86abcdc046887,
> which appears to be related to ALSA.
```

That's a commit the second patch from this series reverts. To my
untrained eyes it thus looks a lot like these change will resolve the
reported issue, which made me wonder:

* these patches afaics are not yet in mainline, is the plan to still
send it this cycle?

* there are no "CC: <stable..." tags in these patches. Is the plan to
manually ask for a backport? Or how can we get the regression fixed in
older releases?

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.

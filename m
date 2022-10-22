Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67387C
	for <regressions@lists.linux.dev>; Sat, 22 Oct 2022 06:36:11 +0000 (UTC)
Received: from [77.247.85.102] (helo=[192.168.44.12]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1om86p-0006gD-1E; Sat, 22 Oct 2022 08:35:51 +0200
Message-ID: <2c028797-b313-be93-7b1e-8d838e694948@leemhuis.info>
Date: Sat, 22 Oct 2022 08:35:47 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: [Regression] Bug 216613 - Sound stopped working with v6.0.3 on Lenovo
 T14 Gen2i: ASoC: error at snd_soc_component_probe
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: =?UTF-8?Q?Grzegorz_Alibo=c5=bcek?= <grzegorz.alibozek@gmail.com>,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1666420572;a9ea66c0;
X-HE-SMSGID: 1om86p-0006gD-1E

Hi, this is your Linux kernel regression tracker speaking.

I noticed a regression report in bugzilla.kernel.org. As many (most?)
kernel developer don't keep an eye on it, I decided to forward it by
mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=216613 :

>  Grzegorz Alibożek 2022-10-21 19:26:43 UTC
> 
> After upgrade kernel from 6.0.2 to 6.0.3 on Lenovo T14 Gen2i, sound stopped working.
> dmesg:
> 
> paź 21 21:11:45 kernel: snd_hda_codec_hdmi ehdaudio0D2: failed to create hda codec -12
> paź 21 21:11:45 kernel: snd_hda_codec_hdmi ehdaudio0D2: ASoC: error at snd_soc_component_probe on ehdaudio0D2: -12
> paź 21 21:11:45 kernel: skl_hda_dsp_generic skl_hda_dsp_generic: ASoC: failed to instantiate card -12
> 
> [reply] [−] Comment 1 Grzegorz Alibożek 2022-10-21 19:56:43 UTC
> 
> Created attachment 303070 [details]
> trace

See the ticket for more details.

BTW, let me use this mail to also add the report to the list of tracked
regressions to ensure it's doesn't fall through the cracks:

#regzbot introduced: v6.0.2..v6.0.3
https://bugzilla.kernel.org/show_bug.cgi?id=216613
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I deal with a lot of
reports and sometimes miss something important when writing mails like
this. If that's the case here, don't hesitate to tell me in a public
reply, it's in everyone's interest to set the public record straight.

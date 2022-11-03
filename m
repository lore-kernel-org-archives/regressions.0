Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBCA7488
	for <regressions@lists.linux.dev>; Thu,  3 Nov 2022 15:00:31 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1oqbhY-0005Y3-F7; Thu, 03 Nov 2022 16:00:16 +0100
Message-ID: <63521d44-bba4-5795-fd44-fb55b9ced99f@leemhuis.info>
Date: Thu, 3 Nov 2022 16:00:15 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-US, de-DE
To: Takashi Iwai <tiwai@suse.de>, Jason Montleon <jmontleo@redhat.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 broonie@kernel.org, cezary.rojewski@intel.com,
 ckeepax@opensource.cirrus.com, oder_chiou@realtek.com,
 regressions@lists.linux.dev, tiwai@suse.com
References: <87v8nwmgso.wl-tiwai@suse.de>
 <20221103131144.2942-1-jmontleo@redhat.com> <87k04cmavy.wl-tiwai@suse.de>
 <87iljwmarm.wl-tiwai@suse.de>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [PATCH v2 1/2] ASoC: rt5514: fix legacy dai naming
In-Reply-To: <87iljwmarm.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1667487632;7e32df29;
X-HE-SMSGID: 1oqbhY-0005Y3-F7

On 03.11.22 14:24, Takashi Iwai wrote:

> - Link (or BugLink tag) to pointing to the kernel bugzilla URL

No, not BugLink. To quote Linus from here:
https://lore.kernel.org/all/CAHk-=wgs38ZrfPvy=nOwVkVzjpM3VFU1zobP37Fwd_h9iAD5JQ@mail.gmail.com/

```
> BugLink: https://lore.kernel.org/r/20220610205038.GA3050413@paulmck-ThinkPad-P17-Gen-1
> BugLink: https://lore.kernel.org/r/CAMdYzYpF4FNTBPZsEFeWRuEwSies36QM_As8osPWZSr2q-viEA@mail.gmail.com

[...]

please stop making up random tags that make no sense.

Just use "Link:"
```

Ciao, Thorsten

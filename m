Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC43362
	for <regressions@lists.linux.dev>; Mon, 21 Mar 2022 06:48:50 +0000 (UTC)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nWBqR-0005fY-Nd; Mon, 21 Mar 2022 07:48:47 +0100
Message-ID: <420bd395-10e7-b5de-97da-56d90fb82654@leemhuis.info>
Date: Mon, 21 Mar 2022 07:48:47 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [regression] Headphone output gets unproperly powered down - Mi
 Notebook Pro 2020 (ALC256) (fwd of b.k.o bug #215484; starting with 5.14.14)
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: itsbytebites@tutanota.com, alsa-devel@alsa-project.org,
 "kai.heng.feng@canonical.com" <kai.heng.feng@canonical.com>,
 kailang@realtek.com
References: <fbfbdedd-21b5-5b6f-c03c-80027acbe2f5@leemhuis.info>
In-Reply-To: <fbfbdedd-21b5-5b6f-c03c-80027acbe2f5@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1647845330;fc013610;
X-HE-SMSGID: 1nWBqR-0005fY-Nd

Hi, this is your Linux kernel regression tracker. Top-posting for once,
to make this easily accessible to everyone.

Could anybody please finally look into this bisected regression from
5.14.13 to 5.14.14 (f8d3c17e1c37 ("ALSA: hda/realtek - ALC236 headset
MIC recording issue")) that according to a recent bugzilla comment from
reporter is still present in recent 5.16 kernels?

Ciao, Thorsten

On 12.01.22 08:15, Thorsten Leemhuis wrote:
> 
> Hi, this is your Linux kernel regression tracker speaking.
> 
> I'm forwarding a regression reported in bugzilla.kernel.org to the list,
> to make sure all parties interested in this are aware of it. The
> reporter is CCed. Not CCing the stable list in this case, as 5.14 is EOL
> already.
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=215484
> 
>> With headphones (or an auxiliary jack) plugged in, the audio output
>> is fine when anything is playing, but when that's stopped a loud pop
>> can be heard after some seconds and if the jack is connected to an
>> external amplifier it gets really noisy. Everything gets back to
>> normal whenever audio playback is resumed, although with another loud
>> pop at the start.
>>
>> This has been happening since kernel 5.14.14, whereas 5.14.13 is
>> fine. I suspect it has to do with the ALC256 mute logic implemented
>> in that version
>> (https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/diff/sound/pci/hda/patch_realtek.c?id=v5.14.14&id2=v5.14.13)
>>
>> OS: Fedora Linux 35 Kernel: 5.16.0-60 Vanilla Hardware: Xiaomi Mi
>> Notebook Pro Enhanced 2020 (i7 10510U, ALC256)
> 
> Ciao, Thorsten
> 
> #regzbot introduced v5.14.13..v5.14.14
> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215484
> #regzbot from: Emanuele Melzi <itsbytebites@tutanota.com>

Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391F3168
	for <regressions@lists.linux.dev>; Wed, 12 Jan 2022 07:15:32 +0000 (UTC)
Received: from ip4d173d02.dynamic.kabel-deutschland.de ([77.23.61.2] helo=[192.168.66.200]); authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1n7Xqu-0007Ja-A9; Wed, 12 Jan 2022 08:15:24 +0100
Message-ID: <fbfbdedd-21b5-5b6f-c03c-80027acbe2f5@leemhuis.info>
Date: Wed, 12 Jan 2022 08:15:23 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-BS
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: [regression] Headphone output gets unproperly powered down - Mi
 Notebook Pro 2020 (ALC256) (fwd of b.k.o bug #215484; starting with 5.14.14)
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: itsbytebites@tutanota.com, alsa-devel@alsa-project.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1641971732;dc618dbb;
X-HE-SMSGID: 1n7Xqu-0007Ja-A9


Hi, this is your Linux kernel regression tracker speaking.

I'm forwarding a regression reported in bugzilla.kernel.org to the list,
to make sure all parties interested in this are aware of it. The
reporter is CCed. Not CCing the stable list in this case, as 5.14 is EOL
already.

https://bugzilla.kernel.org/show_bug.cgi?id=215484

> With headphones (or an auxiliary jack) plugged in, the audio output
> is fine when anything is playing, but when that's stopped a loud pop
> can be heard after some seconds and if the jack is connected to an
> external amplifier it gets really noisy. Everything gets back to
> normal whenever audio playback is resumed, although with another loud
> pop at the start.
> 
> This has been happening since kernel 5.14.14, whereas 5.14.13 is
> fine. I suspect it has to do with the ALC256 mute logic implemented
> in that version
> (https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/diff/sound/pci/hda/patch_realtek.c?id=v5.14.14&id2=v5.14.13)
> 
> OS: Fedora Linux 35 Kernel: 5.16.0-60 Vanilla Hardware: Xiaomi Mi
> Notebook Pro Enhanced 2020 (i7 10510U, ALC256)

Ciao, Thorsten

#regzbot introduced v5.14.13..v5.14.14
#regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215484
#regzbot from: Emanuele Melzi <itsbytebites@tutanota.com>

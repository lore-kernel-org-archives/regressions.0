Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C22320E4
	for <regressions@lists.linux.dev>; Tue,  3 Jan 2023 09:07:44 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1pCdGo-0004iD-ON; Tue, 03 Jan 2023 10:07:42 +0100
Message-ID: <bf646395-1231-92f6-7c5a-5b7765596358@leemhuis.info>
Date: Tue, 3 Jan 2023 10:07:42 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: USB-Audio regression on behringer UMC404HD
Content-Language: en-US, de-DE
To: Michael Ralston <michael@ralston.id.au>, alsa-devel@alsa-project.org,
 regressions@lists.linux.dev, stable@vger.kernel.org
References: <CAC2975JXkS1A5Tj9b02G_sy25ZWN-ys+tc9wmkoS=qPgKCogSg@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <CAC2975JXkS1A5Tj9b02G_sy25ZWN-ys+tc9wmkoS=qPgKCogSg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1672736865;d4298c71;
X-HE-SMSGID: 1pCdGo-0004iD-ON

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; all text you find below is based on a few templates
paragraphs you might have encountered already already in similar form.
See link in footer if these mails annoy you.]

[CCing alsa maintainers]

On 02.01.23 18:29, Michael Ralston wrote:
> I'm currently experiencing a regression with the audio on my Behringer
> U-Phoria UMC404HD.
> 
> Alsa info is at:
> http://alsa-project.org/db/?f=f453b8cd0248fb5fdfa38e1b770e774102f66135
> 
> I get no audio in or out for this device with kernel versions 6.1.1 and 6.1.2.
> 
> The versions I have tried that work correctly include 5.15.86 LTS,
> 5.19.12, and 6.0.13–16.
> 
> When I run this on 6.1.1, it will just hang until I ctrl+c:
> aplay -D plughw:1,0 /usr/share/sounds/alsa/Front_Center.wav
> 
> I've run strace on that command, and its output is at:
> https://pastebin.com/WaxJpTMe
> 
> Nothing out of the ordinary occurs when aplay is run, according to the
> kernel logs.
> 
> Please let me know how I can provide additional debugging information
> if necessary.

Thanks for the report. To be sure the issue doesn't fall through the
cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
tracking bot:

#regzbot ^introduced v6.0..v6.1
#regzbot title alsa: usb: audio stopped working
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply and tell me -- ideally
while also telling regzbot about it, as explained by the page listed in
the footer of this mail.

Reminder for developers: When fixing the issue, add 'Link:' tags
pointing to the report (see page linked in footer for details).

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

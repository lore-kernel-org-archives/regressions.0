Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A935F79C5
	for <regressions@lists.linux.dev>; Tue,  3 Jan 2023 13:05:02 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id y18-20020a0568301d9200b0067082cd4679so19044993oti.4
        for <regressions@lists.linux.dev>; Tue, 03 Jan 2023 05:05:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zFWumH4KGoJlzNmef6ZMjYRxtRsQ29aHRzvDO3z+tjc=;
        b=gkqcLNSyQ1SoNGqsQulv14lK6VLDieljM1vMmMHcBBEj9FvyUJ3xHp86HLZ+XEQu23
         Ajd2INzfS1b+m3xeLAzvp3xVpYqVn0ct/+2skVuSzJcMC//FmDnjZ8/wlAAu60oIfZ5o
         KYrUqEpgJxbAXZ471IAK8m9q7VPTHWMBHF2GyVSUbAaSMQlgXZfIL406ja5fh5TUVbuY
         +J3A9lHDPxjtU1DdMqCg+wTY0KvH8sZTsCelZUOvVQ7Hi1eBDoKmz3Z0lq8QTAIoGKoD
         TaOmxAzPkksr07Ufd/qeBx6dLWAusB2cqkB5jkqGDBU4X/M41tEGYOUaYvX/zcAh3dkY
         PuDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zFWumH4KGoJlzNmef6ZMjYRxtRsQ29aHRzvDO3z+tjc=;
        b=5oui0gteAyWJuxPVfo7mpVmWNHR2x7rQor2mEDP+SuGCJEcM24O51ywknuBd/osmDm
         OUhoXkSyKcBjMHsnJd0YhaJJ3z6Cb2hcgNgE875TF8Z6uqEcur7nxcW59/exzjkmS7RJ
         gCjY69D9GTj6VR+LDs5yDQgfjyShD7eGKyY85aLU1La6K7qcBFB8+C/aXbchAvCDqIEb
         GLPgRi2TapFW0dc8Wew82JPO4OqkfHZ1XkhXj/EpV06ivFNhGUiWwfBmaagYY82KCA3y
         y23edLrjtYN4RqkA3RmNuYH4NV0Si+tsllnbdVV+X9mz9Uxo5BKe8+pt4iLZaiwyv9ec
         /G7A==
X-Gm-Message-State: AFqh2krG552duX3r1Ud8kl3OPV96hwVVc6tPv6AjxmjF9c5fH0xvyjMc
	P5pBF5y92tcvsX70QKqeKxbLx+WNgWNJousCcj0=
X-Google-Smtp-Source: AMrXdXsGYVYpKbI6S6663PlQdTnmgt06lm9E/ZDIAC1Rp+m7YS1pi2lxmj7Z5ARv3PUGlUQfOsRhvMKw34pLbAAb7gQ=
X-Received: by 2002:a05:6830:1443:b0:66d:8e24:8038 with SMTP id
 w3-20020a056830144300b0066d8e248038mr2182829otp.9.1672751101733; Tue, 03 Jan
 2023 05:05:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <bebd692d-7d21-6648-6b7a-c91063bb51c2@leemhuis.info>
 <Y7K1WDmPYi3EMOn1@eldamar.lan> <87wn65umye.wl-tiwai@suse.de> <CALp6mkJhM1zDcNr9X_7WL09+uqcaAhNFFMhrjme0r7584O+Lgw@mail.gmail.com>
In-Reply-To: <CALp6mkJhM1zDcNr9X_7WL09+uqcaAhNFFMhrjme0r7584O+Lgw@mail.gmail.com>
From: =?UTF-8?B?UMOBTEZGWSBEw6FuaWVs?= <dpalffy@gmail.com>
Date: Tue, 3 Jan 2023 14:04:50 +0100
Message-ID: <CALp6mk+rdqGXySUowxZv3kEEVWrh96m_x-h8xcFNQ9YZPkbc5w@mail.gmail.com>
Subject: Re: [regression, 5.10.y] Bug 216861 - sound disappearance on Acer
 Swift 3 SF314-59-78UR after update to 5.10.157
To: Takashi Iwai <tiwai@suse.de>
Cc: Salvatore Bonaccorso <carnil@debian.org>, Thorsten Leemhuis <regressions@leemhuis.info>, 
	Alsa-devel <alsa-devel@alsa-project.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>, 
	Takashi Iwai <tiwai@suse.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, 
	Mark Brown <broonie@kernel.org>, Sergey <zagagyka@basealt.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

And confirming, 5.10.161 with e8444560b4d9302a511f0996f4cfdf85b628f4ca
and 636110411ca726f19ef8e87b0be51bb9a4cdef06 cherry-picked works for
me.

On Tue, Jan 3, 2023 at 1:05 PM P=C3=81LFFY D=C3=A1niel <dpalffy@gmail.com> =
wrote:
>
> Another report: https://bugs.archlinux.org/task/76795
> Apparently, folks at alsa-devel traced down the dependencies of that patc=
h, see the mail thread at https://lore.kernel.org/all/dc65501c-c2fd-5608-c3=
d9-7cea184c3989%40opensource.cirrus.com/
>
> On Mon, Jan 2, 2023 at 1:42 PM Takashi Iwai <tiwai@suse.de> wrote:
>>
>> On Mon, 02 Jan 2023 11:43:36 +0100,
>> Salvatore Bonaccorso wrote:
>> >
>> > Hi,
>> >
>> > [Adding as well Richard Fitzgerald and P=C3=81LFFY D=C3=A1niel to reci=
pients]
>> >
>> > On Fri, Dec 30, 2022 at 09:08:57AM +0100, Thorsten Leemhuis wrote:
>> > > Hi, this is your Linux kernel regression tracker speaking.
>> > >
>> > > I noticed a regression report in bugzilla.kernel.org. As many (most?=
)
>> > > kernel developer don't keep an eye on it, I decided to forward it by
>> > > mail. Quoting from https://bugzilla.kernel.org/show_bug.cgi?id=3D216=
861 :
>> > >
>> > > >  Sergey 2022-12-29 10:07:51 UTC
>> > > >
>> > > > Created attachment 303497 [details]
>> > > > pulseaudio.log
>> > > >
>> > > > Sudden sound disappearance was reported for some laptops, e.g.
>> > > >
>> > > > Acer Swift 3 SF314-59-78UR 11th Gen Intel(R) Core(TM) i7-1165G7 @ =
2.80GHz
>> > > >
>> > > > # lspci
>> > > > 0000:00:1f.3 Multimedia audio controller: Intel Corporation Tiger =
Lake-LP Smart Sound Technology Audio Controller (rev 20)
>> > > >         Subsystem: Acer Incorporated [ALI] Device 148c
>> > > >         Flags: bus master, fast devsel, latency 32, IRQ 197, IOMMU=
 group 12
>> > > >         Memory at 601f270000 (64-bit, non-prefetchable) [size=3D16=
K]
>> > > >         Memory at 601f000000 (64-bit, non-prefetchable) [size=3D1M=
]
>> > > >         Capabilities: [50] Power Management version 3
>> > > >         Capabilities: [80] Vendor Specific Information: Len=3D14 <=
?>
>> > > >         Capabilities: [60] MSI: Enable+ Count=3D1/1 Maskable- 64bi=
t+
>> > > >         Kernel driver in use: sof-audio-pci
>> > > >
>> > > > I am attaching the pulseaudio and dmesg logs
>> > > >
>> > > > This bug started reproducing after updating the kernel from 5.10.1=
56 to 5.10.157
>> > > >
>> > > > Bisection revealed the commit being reverted:
>> > > >
>> > > > c34db0d6b88b1da95e7ab3353e674f4f574cccee is the first bad commit
>> > > > commit c34db0d6b88b1da95e7ab3353e674f4f574cccee
>> > > > Author: Richard Fitzgerald <rf@opensource.cirrus.com>
>> > > > Date:   Fri Nov 4 13:22:13 2022 +0000
>> > > >
>> > > >     ASoC: soc-pcm: Don't zero TDM masks in __soc_pcm_open()
>> > > >
>> > > >     [ Upstream commit 39bd801d6908900e9ab0cdc2655150f95ddd4f1a ]
>> > > >
>> > > >     The DAI tx_mask and rx_mask are set by snd_soc_dai_set_tdm_slo=
t()
>> > > >     and used by later code that depends on the TDM settings. So
>> > > >     __soc_pcm_open() should not be obliterating those mask values.
>> > > >
>> > > > [...]
>> > > > Original bug report: https://bugzilla.altlinux.org/44690
>> > >
>> > > See the ticket for more details.
>> > >
>> > > BTW, let me use this mail to also add the report to the list of trac=
ked
>> > > regressions to ensure it's doesn't fall through the cracks:
>> > >
>> > > #regzbot introduced: c34db0d6b88b1d
>> > > https://bugzilla.kernel.org/show_bug.cgi?id=3D216861
>> > > #regzbot title: sound: asoc: sudden sound disappearance
>> > > #regzbot ignore-activity
>> >
>> > FWIW, we had as well reports in Debian after having updated the kernel
>> > from 5.10.149 based one to 5.10.158 based one in the last point
>> > releases, they are at least:
>> >
>> > https://bugs.debian.org/1027483
>> > https://bugs.debian.org/1027430
>>
>> I got another report while the commit was backported to 5.14-based
>> openSUSE Leap kernel, and I ended up with dropping it.
>>
>> So, IMO, it's safer to drop this patch from the older stable trees.
>> As far as I see, 5.15.y and 5.10.y got this.
>>
>> Unless anyone gives a better fix, I'm going to submit a revert patch
>> for those trees.
>>
>>
>> thanks,
>>
>> Takashi

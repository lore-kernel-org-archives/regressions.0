Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B2D7A
	for <regressions@lists.linux.dev>; Fri, 22 Apr 2022 12:36:58 +0000 (UTC)
Received: from [2a02:8108:963f:de38:6624:6d8d:f790:d5c]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1nhsWu-0000eC-IC; Fri, 22 Apr 2022 14:36:56 +0200
Message-ID: <bc4c0a1e-5f0b-adb3-b663-de580632aad9@leemhuis.info>
Date: Fri, 22 Apr 2022 14:36:56 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [regression] Headphone output gets unproperly powered down - Mi
 Notebook Pro 2020 (ALC256) (fwd of b.k.o bug #215484; starting with 5.14.14)
 #forregzbot
Content-Language: en-US
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <fbfbdedd-21b5-5b6f-c03c-80027acbe2f5@leemhuis.info>
 <43a7c1df-d20c-e975-1312-3561c18228f8@leemhuis.info>
In-Reply-To: <43a7c1df-d20c-e975-1312-3561c18228f8@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1650631018;e6aed18b;
X-HE-SMSGID: 1nhsWu-0000eC-IC

On 16.01.22 10:33, Thorsten Leemhuis wrote:
> For the record:
> 
> #regzbot introduced f8d3c17e1c3720a1497b5c5db514a832834610d1
> 
> TWIMC: this mail is primarily send for documentation purposes and for
> regzbot, my Linux kernel regression tracking bot. These mails usually
> contain '#forregzbot' in the subject, to make them easy to spot and filter.

#regzbot introduced 5aec98913095
#regzbot fixed-by f30741cded62f87bb4b1cc58bc627f076abcaba8

> On 12.01.22 08:15, Thorsten Leemhuis wrote:
>>
>> Hi, this is your Linux kernel regression tracker speaking.
>>
>> I'm forwarding a regression reported in bugzilla.kernel.org to the list,
>> to make sure all parties interested in this are aware of it. The
>> reporter is CCed. Not CCing the stable list in this case, as 5.14 is EOL
>> already.
>>
>> https://bugzilla.kernel.org/show_bug.cgi?id=215484
>>
>>> With headphones (or an auxiliary jack) plugged in, the audio output
>>> is fine when anything is playing, but when that's stopped a loud pop
>>> can be heard after some seconds and if the jack is connected to an
>>> external amplifier it gets really noisy. Everything gets back to
>>> normal whenever audio playback is resumed, although with another loud
>>> pop at the start.
>>>
>>> This has been happening since kernel 5.14.14, whereas 5.14.13 is
>>> fine. I suspect it has to do with the ALC256 mute logic implemented
>>> in that version
>>> (https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/diff/sound/pci/hda/patch_realtek.c?id=v5.14.14&id2=v5.14.13)
>>>
>>> OS: Fedora Linux 35 Kernel: 5.16.0-60 Vanilla Hardware: Xiaomi Mi
>>> Notebook Pro Enhanced 2020 (i7 10510U, ALC256)
>>
>> Ciao, Thorsten
>>
>> #regzbot introduced v5.14.13..v5.14.14
>> #regzbot link: https://bugzilla.kernel.org/show_bug.cgi?id=215484
>> #regzbot from: Emanuele Melzi <itsbytebites@tutanota.com>

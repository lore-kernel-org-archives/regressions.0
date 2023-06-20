Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B031FA9
	for <regressions@lists.linux.dev>; Tue, 20 Jun 2023 06:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1687242275; x=1687847075; i=deller@gmx.de;
 bh=P4yET/ii6laUO0c0nA2w7JL4IyFthpA/vzXPBsUXChM=;
 h=X-UI-Sender-Class:Date:To:Cc:References:From:Subject:In-Reply-To;
 b=hEfNUGv4oZFo6i7NeRr66V8+HC0Z19w49eyJegnYHUaTis3VcK+QjCzm+nxZIARZybq5iz1
 E2brAqU4PyV11XT8w/2ofjvNvlpPCS4FOh6ilx2VTUCYYYZbHNGkqulblBDBZfLxVRhFcTK7B
 oIMUzsgLqTjDzFde63HcfJdgSahV4I4F2cDi82he1WBLKot5r3sgNB1GMQ25Dsm1wa0Hz3jZz
 kg0v5NHrrU4wWOq0AXG7YQuLdN1rRb9rwI+Y7qc1x1Qp+bTCCguNJidtuRxxBkyDpY6nxxZWi
 iseO8qo1qex/MTeK1HCZptluKskuwvN/FM2DGJCSpNA7LLTbc/OQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.157.8]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MpUYu-1pkBv518uK-00ps7o; Tue, 20
 Jun 2023 08:24:35 +0200
Message-ID: <3d8c3a8c-68be-422a-c4ff-6d2e99c3f01b@gmx.de>
Date: Tue, 20 Jun 2023 08:24:34 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: Cyril Brulebois <cyril@debamax.com>, Rob Herring <robh@kernel.org>
Cc: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Salvatore Bonaccorso <carnil@debian.org>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org
References: <20230412095509.2196162-1-cyril@debamax.com>
 <20230412095509.2196162-2-cyril@debamax.com> <ZDvrY7X9mpJ7WZ3z@eldamar.lan>
 <11b342dc-1a46-d1be-5fdd-c6eee661e15a@leemhuis.info>
 <fe3b90b0-b52f-9677-0245-a201975c3e0c@suse.de>
 <20230615132107.GA9196@kitsune.suse.cz>
 <20230615200901.GA1572644-robh@kernel.org>
 <20230615211924.cf2qs52cfaf7m3f7@debamax.com>
From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 1/2] fbdev/offb: Update expected device name
In-Reply-To: <20230615211924.cf2qs52cfaf7m3f7@debamax.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/5EbFHqdTR5VZsqWRgQuO1B3pFhNypJeYz67/Gfk+zk8oU7VQHh
 +VZIjwowX5PZ3z2zjHqKgFfyQGf8bdNU9PEU7PzE3mCVgiKu5kTkeUxVi7c1Bvp5pOoxEwF
 3BCkiWoE7TRt3R514QqSXbDTf0vyL2jyRzqdymHfNt2l8YdEAYAiOyQKzzEmymdGqa0m8mY
 SNP16ZtzRxLCfHo3AYECg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zbmZ87N98Vw=;mfvc1cgsO73dUvNLnQLh1n/hqru
 ji2qD0q7adNzvSs2na/gU8PIC28GNHDnx4Gy+NZgMC8n5dQenxQz9nkoKM/2RQXMQTZDpbBN6
 AIPFsSouYdTtry00NaNzIqPz4blCvHHsUA52OOkrk+OimQ4eZd0DebT9+e1fUUmdcRg8YtbHy
 pF2S9PXcNKeQs+p/4wNGuUptSi+CE5+AG6dKYqVMJLJWiwF0yhf2EKqdceS7zl4YP2t9QPake
 NNZpU9qann2QCr4BoAAyjCakXodNYUQmltm8jNbEYpjwY6HtuLBzI4QSLrfdUwHGqQwEkViRc
 RpIKXO0ii+pBneR7zu5u7sGY95DotNxUGHbu5s/jbZgsIGFDWxPAJeD+aMi8qBw4QtbO/oTh7
 1zjS/l201UCQPN3ryMPiERbCgOHuAdDwUcnX4MPx0Rhu0UyTcNgk4gjZ+RyQIyjprFccFSE+b
 v0pXLiAueJ1A1FsQVoQ3lUFcAFUqJrrvYrbCnsfWIsceoUMu1fC5xzkfXL2+MmrTNOH2L9CgO
 PUs5Lw57XmZ1HKSN/lreKvucnVnBBJHW4EMhOgRVTZGczltM6hILr0AcH7seNBq7xW7p92Nqz
 HWpgTnAQVPBC1cDpJS443BRaoG+RclTS9WVVxgR18kDJA74rlB0cR/aYAsY3aF6bE9a6J+cc4
 3viGZN6VgPBv+SPmNzd4oEEszvoLo3biHhvHAas9PK4Z6Z7s81Gz51lafN8c0TQPMEnY2XLuo
 3XLBro8r9GAaOJ3VpWnH57Z9pt6Lah2Jr44KNKIlm6HRF2UbcGepYwHgd43UoJQP3BrKyuo29
 DrnEN6v4nnxAFStVj19KK4Jjd8r4cLWCjLJm/9/ByRlcuUMgm0yuFg35ioAC0+UqC2oRv41/e
 1tmR4rxD9hnrleliemSKb9itdhUSIOqA9tBp1PezLz/NDcatUgZHPcltOCD5mCJ9ULa2kugiU
 PxYbSmWZbRu5W6tZibZAgSNNYDQ=

On 6/15/23 23:19, Cyril Brulebois wrote:
> Hi Rob,
>
> Rob Herring <robh@kernel.org> (2023-06-15):
>> On Thu, Jun 15, 2023 at 03:21:07PM +0200, Michal Such=C3=A1nek wrote:
>>> At the time this was proposed it was said that "of-display", is wrong,
>>> and that "of-display.0" must be used for the first device instead, and
>>> if something breaks an alias can be provided.
>>>
>>> So how does one provide an alias so that offb can find "of-display.0"
>>> as "of-display"?
>>
>> I'm not aware of any way. There isn't because device names and paths ar=
e
>> not considered ABI. There are mechanisms for getting stable class devic=
e
>> indices (e.g. i2c0, mmcblk0, fb0, fb1, etc.) though not implemented for
>> fbN (and please don't add it).
>>
>> In any case, this should be an easy fix. Though if "linux,opened" or
>> "linux,boot-display" is not set, then you'd still get "of-display.0":
>>
>> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
>> index 78ae84187449..e46482cef9c7 100644
>> --- a/drivers/of/platform.c
>> +++ b/drivers/of/platform.c
>> @@ -553,7 +553,7 @@ static int __init of_platform_default_populate_init=
(void)
>>                          if (!of_get_property(node, "linux,opened", NUL=
L) ||
>>                              !of_get_property(node, "linux,boot-display=
", NULL))
>>                                  continue;
>> -                       dev =3D of_platform_device_create(node, "of-dis=
play.0", NULL);
>> +                       dev =3D of_platform_device_create(node, "of-dis=
play", NULL);
>>                          of_node_put(node);
>>                          if (WARN_ON(!dev))
>>                                  return -ENOMEM;

Michal, does that patch look correct?
I don't have that hardware, but that way the boot-display gets named
"of-display" while all others get "of-display.x"....

> I've just replaced my clueless workaround with this patch on top of the
> kernel found in Debian 12 (Bookworm), i.e. 6.1.27 at this point, and it
> indeed fixes the black screen problem in the installer's context.

... at least it fixes the issue.

> I didn't run a full installation to check whether this kernel is also fi=
ne
> after rebooting into the installed system, but as far as I understood fo=
r
> the original bug report[1], it wasn't affected in the first place.
>
>   1. https://bugs.debian.org/1033058
>
> Will somebody else pick up the torch from here, and submit that for
> inclusion in master? Or should I re-submit the above patch on my own?

It would be good to get some more feedback, but in general if you
or Rob send me a patch I can include it in the fbdev git tree for futher
testing (and if nobody else disagrees).

Helge

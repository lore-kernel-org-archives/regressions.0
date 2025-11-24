Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6178A2BD001
	for <regressions@lists.linux.dev>; Mon, 24 Nov 2025 16:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764002664; cv=none; b=m8nihS/9hQaw5oViV+b0S4tskNq6maLyNWKxGvYh5zg6GH5hUUG0byBxDC6e/zKRhWTcR3xzNtw+d4DhUJIh8ZEhZ6Up5gTJa/YN89vrMaZoXqpRF61kB+0uTVNy3WT89YGaZ/ZNw8LpUlNWHtBiZGhXUOYAhVahadlymAHqEuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764002664; c=relaxed/simple;
	bh=b+d1kJPKfIvOT871IRGDTMP/h66VstUuIxiBl6bMhxc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kuFDK+zHggP0xAnnUH7o6gNzu9wM/amnhZtDf37LQwJT3QRq53rvFTiESEWiEJGtRsIkcoYR1k4M6ijuVNLqKcXaQLHte7fQxk7POoQ3T3XJr/fQMoDgsKNLOXjbk96t10NPQx2JG7PJOvZa92WrmjqKnyBki7GJqB7EI6+NnQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dlek5SII; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dlek5SII"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b7373fba6d1so724120566b.3
        for <regressions@lists.linux.dev>; Mon, 24 Nov 2025 08:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764002661; x=1764607461; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y1qbvHz+aNkaALCeB6YuPy34i5js9SQOa33eGsK28Bk=;
        b=dlek5SIIGCrDGb6W4VZKDp4Yukd8HxVF6wnqpKj+Aw3Gv4exGQdc+WEtqMmxRLuUE6
         ztdfjeZogaqDCmIZbLzNmbRgIJ+Rfri8CZYyFKGzDZC/TmfutxYHXStL/HEf5gVQ2PUi
         dw0KTPuHQlMpLTj5l35QHNgYrHKH8t5am+clC8kGPu4TeWfgKkjr0VOyMchuJa0qByBi
         rmsUJ8Ua5j8w2YSSYXeJLvaG+K1h1cGjCIYM76LsZPjaAwqxN2LEvowySuD3HSmmAf7k
         92EQvCzX982ul8aduLh+P4c5v6Ix621dhhc+xY1o2MIYeoQLa2yjwYnA85QenyOYuJVV
         8FAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764002661; x=1764607461;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y1qbvHz+aNkaALCeB6YuPy34i5js9SQOa33eGsK28Bk=;
        b=OVHgRFhwkprqv5VXzOauk5czA1pLci8R+FQcHA64Y75E4ObCr3R2q0ZNVFWNY3HCUg
         R7i4RDZSHPXrUyqDeRphz5dXdzpgs9KKjDWAbQ1m1p0mat2GrAyNgFd78lJIvBLqujsF
         62bh6qgq7isXMiAUinDcKcqZD+iVGXLST0q6mXXG5cPFBSNpPfRm1C06/L2eAyiKi02V
         qNauwSLdiOuKreNyoaNS7PLsDccAxdfzijYGtN6WhTYdD4xBFl6CdV7fM5lO2dZEgvCC
         7Git3gEwOHbTr3OGAaXFwlOEZM7+nqOgIy+TE/xznn9mci39AmfFE3BjKRHkkG05PFwB
         3j4w==
X-Forwarded-Encrypted: i=1; AJvYcCWPNbuW9rxo9TpKPExVHHNPaWRbHZ/NqqIphwKFZ0NSF7yJTU2lIbfWW2FlQxVvyimsqGoRRn2H7c7gWg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3TpLHqNmvQLHQa1PvCtECAALywwCCBYqVe6OrXIqxO/N0nCgQ
	NaA+VmSUhP9FmqKcFC/2WciXsXLlpmzC89LLgP1/9NdEvc4XApPfBads
X-Gm-Gg: ASbGncu2c0pC7lpK6Wiyqfhn1ys+YcZ1Wxd9ni9txUITHplkxgTsu+MQ7zrPifHnamQ
	6YcHbhztrQSDoElEgazelOo67LrYOfB0gIPs+5zZL1ziyuKmlTnqqZTj3N4pEWXfQPl1QKSKDj8
	A9+GjabDIO5zF28VABZASUrG3ONvMIm8HdUmwR320g8HwuT3HcYfvGWUlwURSoGtoGCMtYS2+ur
	nNoLK532Yzg/NxLlAG9PJsfdeYovRo/qVQb5+27gUFP9aA/706KtdHr48xBQm9xPzTCpP7Zjs4/
	rHB+h/gNBVfjwk75r9QUF1eYhwLXNgYs6828n4u5Lka2n5UvIV7OHxS9J0N6Tw8yaldXJ0UeltQ
	9JFDBN34hmTS2qo3QVmG4Yp3BbVtiY/vzmPuAl7OJAcb9SQTU7GVkwpQclpHdBcs1eGEdHSFgOK
	zAfQ8Trt3kIRNva4oSl1/0vck26rov2e35w0uHM2Ep6df6Oag5ICkWLozAyNvyboU=
X-Google-Smtp-Source: AGHT+IF85wAitfiRyvXPAO0XMhtM7CwIOTaHsc/rcaYl6Oe0F21NZ/v0xt1HI+HqOTipz1bfL2STQQ==
X-Received: by 2002:a17:907:1b02:b0:b40:b54d:e687 with SMTP id a640c23a62f3a-b7671acc2d5mr1367662866b.47.1764002660407;
        Mon, 24 Nov 2025 08:44:20 -0800 (PST)
Received: from ?IPV6:2001:b07:aac:705d:9f97:b617:31ec:75d6? ([2001:b07:aac:705d:9f97:b617:31ec:75d6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654cdd5bfsm1357742666b.9.2025.11.24.08.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 08:44:19 -0800 (PST)
Message-ID: <b71e941c-fc8a-4ac1-9407-0fe7df73b412@gmail.com>
Date: Mon, 24 Nov 2025 17:44:18 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] TI SN65DSI83 is being reset making display to blink
 On/Off
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: Herve Codina <herve.codina@bootlin.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?=
 <jpaulo.silvagoncalves@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 Philippe Schenker <philippe.schenker@impulsing.ch>
References: <nkiu23g4esqjsuri3it6eo3lrpvvbqkmx3wijsehc6ov4tb6ui@c5qvcydwpxmn>
 <20251119085127.6e3e429e@bootlin.com>
 <gw635fewdxe7falrxz44gxstiuzjpmeh45rwe5bglto524faaz@hj4z2vh22p5n>
 <DECL7AZNNMX5.MC2QTENKZTWE@bootlin.com> <20251119111221.GA18602@francesco-nb>
 <593e90d9-cf04-45a2-8172-98c441ec79f5@ideasonboard.com>
 <20251119122443.GA29208@francesco-nb>
 <DECUJMA1JWIC.2PYDSYBID4I94@bootlin.com>
 <20251119194023.6239d397@bootlin.com>
 <4e25291266d46777e84f22295b8f1094d8f682cc.camel@impulsing.ch>
 <ko2ghflyddv2igj43wkwsaaoneg2jwpdxldlfsix4cllzspdbj@w4fhabuwm5wy>
 <DEGWZDNYFV6X.22R0E53VDWHNA@bootlin.com>
 <DEGZJAA4DU9K.374YIT813KDWZ@bootlin.com>
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
Content-Language: en-US
In-Reply-To: <DEGZJAA4DU9K.374YIT813KDWZ@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 24/11/2025 15:12, Luca Ceresoli wrote:
> Hello,
> 
> sorry, a typo below.
> 
> On Mon Nov 24, 2025 at 1:12 PM CET, Luca Ceresoli wrote:
>> Hello João, Francesco, Maxime, Hervé,
>>
>> On Fri Nov 21, 2025 at 10:58 AM CET, Maxime Ripard wrote:
>>> On Thu, Nov 20, 2025 at 09:50:27AM +0000, Philippe Schenker wrote:
>>>>
>>>>
>>>> On Wed, 2025-11-19 at 19:40 +0100, Herve Codina wrote:
>>>>> Hi Luca, Francesco, others
>>>>>
>>>>> On Wed, 19 Nov 2025 18:27:38 +0100
>>>>> "Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:
>>>>>
>>>>>> Hello,
>>>>>>
>>>>>> On Wed Nov 19, 2025 at 1:24 PM CET, Francesco Dolcini wrote:
>>>>>> ...
>>>>>>>> I might be mistaken, but I don't think the PLL will work if
>>>>>>>> unlocked...
>>>>>>>> But maybe the case is that it unlocks and lock again right
>>>>>>>> afterwards.
>>>>>>>>>> João, Francesco, on what hardware do you observe the
>>>>>>>>>> problem? Which SoC?
>>>>>>>>>> Which encoder, any previous bridges?
>>>>>>>>>
>>>>>>>>> Verdin AM62, TI AM62 SOC, arch/arm64/boot/dts/ti/k3-am62-
>>>>>>>>> verdin.dtsi
>>>>>>>>>
>>>>>>>>> There is a DPI to DSI bridge in the module, tc358778, it has
>>>>>>>>> a 25MHz
>>>>>>>>> reference clock.
>>>>>>>>>
>>>>>>>>> TI AM62 DPI -> Toshiba TC358768 DSI -> TI SN65DSI83 ->
>>>>>>>>> Display
>>>>>>>>>
>>>>>>>>> From a preliminary investigation this is a HW limitation, we
>>>>>>>>> are not
>>>>>>>>> able to generate a "good enough" DSI clock, see
>>>>>>>>> tc358768_calc_pll() for
>>>>>>
>>>>>> Thanks Francesco for the feedback!
>>>>>>
>>>>>> I'm not sure I completely understand the issue described, but if
>>>>>> the TI
>>>>>> bridge requires a clock that cannot be provided by the hardware,
>>>>>> then this
>>>>>> actually looks like "a HW limitation" as you wrote, due to a HW
>>>>>> integration
>>>>>> limitation/bug/issue/whatever. In case this is confirmed, I think
>>>>>> quirks
>>>>>> are an appropriate tool to handle HW integration issues.
>>>>>>
>>>>>>>> I haven't studied the docs or done any testing, but I would
>>>>>>>> think that
>>>>>>>> it doesn't matter for the PLL even if the incoming DSI clock is
>>>>>>>> a bit
>>>>>>>> off, as long as it's continuous and stable.
>>>>>>>>
>>>>>>>> My first thought was that the DSI is using non-continuous
>>>>>>>> clock, but at
>>>>>>>> least the driver has code to drop the
>>>>>>>> MIPI_DSI_CLOCK_NON_CONTINUOUS flag.
>>>>>>>>
>>>>>>>>> the actual code implementation of it, I believe that the
>>>>>>>>> datasheet is
>>>>>>>>> not available without NDA.
>>>>>>>>>
>>>>>>>>> Maybe the ugly hack "works-without-pll" is the way to work?
>>>>>>>>> It will
>>>>>>>>> require a DT change, but this seems doable.
>>>>>>>>
>>>>>>>> Revert is easier than adding new hacky DT properties... At
>>>>>>>> least until
>>>>>>>> the problem is understood.
>>>>>>>>
>>>>>>>>> Please note that this is the outcome of a short investigation
>>>>>>>>> done
>>>>>>>>> yesterday afternoon, so maybe I am overlooking something,
>>>>>>>>> unfortunately
>>>>>>>>> I do not have the bandwidth to work on it more this week.
>>>>>>>>>
>>>>>>>>>> Which clock rates?
>>>>>>>>> 71100000
>>>>>>>> It would be a good test to try out with a few different
>>>>>>>> clocks.
>>>>>>>
>>>>>>> 50 MHz works, for example.
>>>>>>>
>>>>>>> It seems that the issue exists when the actual display clock is
>>>>>>> different
>>>>>>> from the dsi clock. And this can happen for the reason I
>>>>>>> explained
>>>>>>> before (the DSI clock is computed starting from this 25MHz
>>>>>>> reference
>>>>>>> clock).
>>>>>>
>>>>>
>>>>> If there is no way to set a correct clock, I agree with Luca a quirk
>>>>> should
>>>>> be the best solution.
>>>>>
>>>>> For instance, in the dts:
>>>>>   ti,pll_may_unlock_quirk;
>>>>
>>>> I followed the discussion only loosely. But I once worked on bringing
>>>> up the SN65DSI83 and from what I can remember is that there was a
>>>> frequency range of the input clock where the PLL of SN65DSI83 just did
>>>> not lock at all.
>>>>
>>>> I couldn't explain what was happening since the clock I fed was within
>>>> the limits of the documentation I had.
>>>>
>>>> What I ultimately did was to just choose a clock that works. Given that
>>>> experience I'm not sure about adding quirks on TI side.
>>>>
>>>> But anyway I'm not very familiar with the topic and it's a long time
>>>> since I worked on it. Just wanted to point out this experience I had,
>>>> maybe it helps.
>>>
>>> If the frequency is predictable, can we disable the error recovery if we
>>> know we programmed the bridge in (one of) the affected range?
>>
>> This looks like the best solution in principle. However I'm not sure the
>> ti-sn65dsi83 driver knows the exact clock it will receive, I suspect it is
>> only known to the DSI host and there is an API for the DSI device to obtain
>                                  ^^^^^^^^
> 				 there isn't
> 
>> it from the DSI host.
>>
>> I'd be happy to be proven wrong though, and that the above idea can work.
>>
>> In case it doesn't we should reconsider the quirk. But as Maxime pointed
>> out in another reply the quirk property in DT is not doable for backwards
>> compatibility. Other options that have come to mind to use the quirk:
>>
>>  * quirk based on the machine: ti-sn65dsi83 driver enabled the quirk
>>    if (of_machine_is_compatible("toradex,..."))
>>  * opt-out quirk instead of opt-in: ti-sn65dsi83 driver enabled the quirk
>>    if a DT property is absent, e.g. 'ti,pll-locking-capable' or similar to
>>    say "this hardware is able to provide a correct clock"
>>
>> Luca
>>
>> --
>> Luca Ceresoli, Bootlin
>> Embedded Linux and Kernel engineering
>> https://bootlin.com
> 
> 
> 
> 
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

Hi,

I'm debugging the RGB -> tc358778 -> sn65dsi84 pipeline

Some observations:
- If I avoid resetting the pipeline and only clear the status bit, the PLL
unlock flag immediately comes back. Despite this, the display keeps working
fine and the sn65dsi84 appears functional even when the PLL is reported as
unlocked.
- There’s no clear frequency boundary:
working: 50000000, 68750000, 72750000, 75000000
not working: 69750000, 71100000, 72500000
- The tc358778 is configured for continuous-clock DSI.
- I cannot measure the DSI clock directly, but the parallel RGB clock is stable.

So far I haven’t found a rule that clearly explain why certain frequency are
without problems while some other generate this issue.
I'm struggling around the input clock frequency and the one generated by
tc358778 using its PLL, and trying to find out how it is possible that the
side effect is a not locked PLL on the sn65dsi84.

I could run additional tests or gather more data if useful.

Thanks,
Emanuele




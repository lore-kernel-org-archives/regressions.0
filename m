Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A668D33CEB0
	for <regressions@lists.linux.dev>; Wed, 19 Nov 2025 09:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763545180; cv=none; b=fnzQC4UQ4t4BT8sHIVYKD7+oJ9jF0w5+G8LZf6MUx1yMVbgq43RcL9xBzdE58LfkZG/xh7EvKXc5jPyvOE9frdiPtZ81xxWr0sWeZDwgjtmejc2LVmGEcnwFr2ZfoFZ3UgMtr3xvm52GqJOimAQ0L1rh2j1wYVYs+aOXq04AZ+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763545180; c=relaxed/simple;
	bh=HaiRXsMftvHKJwWhHy/BuG8bgCdLLDWCFKUvGU06FIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WTK3dTN/uI9uc5cM4Z4xYbx4jCJuNujIABSdBa7o0cdjTrkbdv9hosEt3pP03hzHBUchuKCNjZWMsDH/W/+LbW0P5UY8tOgtav/cFdFuW/TioDXKnnRGbQYYFoGH0PQ+VS5PqxmE5MC7EQE5cWT6J3cA7H51yV6dFVCdsCmc/rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=O1rfZ4LH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="O1rfZ4LH"
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0093BE7C;
	Wed, 19 Nov 2025 10:37:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1763545050;
	bh=HaiRXsMftvHKJwWhHy/BuG8bgCdLLDWCFKUvGU06FIo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O1rfZ4LHGASQdffEt5s1rp2acBXGIBC36ZRK1ozgtkRCK2jOhomBspxr/+KVokb0O
	 qOC+cnjZj0tYiyK5WzhGDZmcrcvd1N22YVhvh8lk2Lp65OqVK0GO0UJ3EtMvLTGBcz
	 cF8BKgSifKmL04jAsL2OsJJtNuPVMn/HojzWLhCY=
Message-ID: <b210003c-4939-4d88-8421-c5e53bd2ad9e@ideasonboard.com>
Date: Wed, 19 Nov 2025 11:39:30 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] TI SN65DSI83 is being reset making display to blink
 On/Off
To: Maxime Ripard <mripard@kernel.org>,
 Herve Codina <herve.codina@bootlin.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?=
 <jpaulo.silvagoncalves@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
 thomas.petazzoni@bootlin.com
References: <bhkn6hley4xrol5o3ytn343h4unkwsr26p6s6ltcwexnrsjsdx@mgkdf6ztow42>
 <20251113084950.44a09e8e@bootlin.com> <20251113091910.GA15538@francesco-nb>
 <DEB2QIR2RB1C.3IQC9WYGAUVZC@bootlin.com>
 <nkiu23g4esqjsuri3it6eo3lrpvvbqkmx3wijsehc6ov4tb6ui@c5qvcydwpxmn>
 <20251119085127.6e3e429e@bootlin.com>
 <gw635fewdxe7falrxz44gxstiuzjpmeh45rwe5bglto524faaz@hj4z2vh22p5n>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 xsFNBE6ms0cBEACyizowecZqXfMZtnBniOieTuFdErHAUyxVgtmr0f5ZfIi9Z4l+uUN4Zdw2
 wCEZjx3o0Z34diXBaMRJ3rAk9yB90UJAnLtb8A97Oq64DskLF81GCYB2P1i0qrG7UjpASgCA
 Ru0lVvxsWyIwSfoYoLrazbT1wkWRs8YBkkXQFfL7Mn3ZMoGPcpfwYH9O7bV1NslbmyJzRCMO
 eYV258gjCcwYlrkyIratlHCek4GrwV8Z9NQcjD5iLzrONjfafrWPwj6yn2RlL0mQEwt1lOvn
 LnI7QRtB3zxA3yB+FLsT1hx0va6xCHpX3QO2gBsyHCyVafFMrg3c/7IIWkDLngJxFgz6DLiA
 G4ld1QK/jsYqfP2GIMH1mFdjY+iagG4DqOsjip479HCWAptpNxSOCL6z3qxCU8MCz8iNOtZk
 DYXQWVscM5qgYSn+fmMM2qN+eoWlnCGVURZZLDjg387S2E1jT/dNTOsM/IqQj+ZROUZuRcF7
 0RTtuU5q1HnbRNwy+23xeoSGuwmLQ2UsUk7Q5CnrjYfiPo3wHze8avK95JBoSd+WIRmV3uoO
 rXCoYOIRlDhg9XJTrbnQ3Ot5zOa0Y9c4IpyAlut6mDtxtKXr4+8OzjSVFww7tIwadTK3wDQv
 Bus4jxHjS6dz1g2ypT65qnHen6mUUH63lhzewqO9peAHJ0SLrQARAQABzTBUb21pIFZhbGtl
 aW5lbiA8dG9taS52YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbT7CwY4EEwEIADgWIQTEOAw+
 ll79gQef86f6PaqMvJYe9QUCX/HruAIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRD6
 PaqMvJYe9WmFD/99NGoD5lBJhlFDHMZvO+Op8vCwnIRZdTsyrtGl72rVh9xRfcSgYPZUvBuT
 VDxE53mY9HaZyu1eGMccYRBaTLJSfCXl/g317CrMNdY0k40b9YeIX10feiRYEWoDIPQ3tMmA
 0nHDygzcnuPiPT68JYZ6tUOvAt7r6OX/litM+m2/E9mtp8xCoWOo/kYO4mOAIoMNvLB8vufi
 uBB4e/AvAjtny4ScuNV5c5q8MkfNIiOyag9QCiQ/JfoAqzXRjVb4VZG72AKaElwipiKCWEcU
 R4+Bu5Qbaxj7Cd36M/bI54OrbWWETJkVVSV1i0tghCd6HHyquTdFl7wYcz6cL1hn/6byVnD+
 sR3BLvSBHYp8WSwv0TCuf6tLiNgHAO1hWiQ1pOoXyMEsxZlgPXT+wb4dbNVunckwqFjGxRbl
 Rz7apFT/ZRwbazEzEzNyrBOfB55xdipG/2+SmFn0oMFqFOBEszXLQVslh64lI0CMJm2OYYe3
 PxHqYaztyeXsx13Bfnq9+bUynAQ4uW1P5DJ3OIRZWKmbQd/Me3Fq6TU57LsvwRgE0Le9PFQs
 dcP2071rMTpqTUteEgODJS4VDf4lXJfY91u32BJkiqM7/62Cqatcz5UWWHq5xeF03MIUTqdE
 qHWk3RJEoWHWQRzQfcx6Fn2fDAUKhAddvoopfcjAHfpAWJ+ENc7BTQROprNHARAAx0aat8GU
 hsusCLc4MIxOQwidecCTRc9Dz/7U2goUwhw2O5j9TPqLtp57VITmHILnvZf6q3QAho2QMQyE
 DDvHubrdtEoqaaSKxKkFie1uhWNNvXPhwkKLYieyL9m2JdU+b88HaDnpzdyTTR4uH7wk0bBa
 KbTSgIFDDe5lXInypewPO30TmYNkFSexnnM3n1PBCqiJXsJahE4ZQ+WnV5FbPUj8T2zXS2xk
 0LZ0+DwKmZ0ZDovvdEWRWrz3UzJ8DLHb7blPpGhmqj3ANXQXC7mb9qJ6J/VSl61GbxIO2Dwb
 xPNkHk8fwnxlUBCOyBti/uD2uSTgKHNdabhVm2dgFNVuS1y3bBHbI/qjC3J7rWE0WiaHWEqy
 UVPk8rsph4rqITsj2RiY70vEW0SKePrChvET7D8P1UPqmveBNNtSS7In+DdZ5kUqLV7rJnM9
 /4cwy+uZUt8cuCZlcA5u8IsBCNJudxEqBG10GHg1B6h1RZIz9Q9XfiBdaqa5+CjyFs8ua01c
 9HmyfkuhXG2OLjfQuK+Ygd56mV3lq0aFdwbaX16DG22c6flkkBSjyWXYepFtHz9KsBS0DaZb
 4IkLmZwEXpZcIOQjQ71fqlpiXkXSIaQ6YMEs8WjBbpP81h7QxWIfWtp+VnwNGc6nq5IQDESH
 mvQcsFS7d3eGVI6eyjCFdcAO8eMAEQEAAcLBXwQYAQIACQUCTqazRwIbDAAKCRD6PaqMvJYe
 9fA7EACS6exUedsBKmt4pT7nqXBcRsqm6YzT6DeCM8PWMTeaVGHiR4TnNFiT3otD5UpYQI7S
 suYxoTdHrrrBzdlKe5rUWpzoZkVK6p0s9OIvGzLT0lrb0HC9iNDWT3JgpYDnk4Z2mFi6tTbq
 xKMtpVFRA6FjviGDRsfkfoURZI51nf2RSAk/A8BEDDZ7lgJHskYoklSpwyrXhkp9FHGMaYII
 m9EKuUTX9JPDG2FTthCBrdsgWYPdJQvM+zscq09vFMQ9Fykbx5N8z/oFEUy3ACyPqW2oyfvU
 CH5WDpWBG0s5BALp1gBJPytIAd/pY/5ZdNoi0Cx3+Z7jaBFEyYJdWy1hGddpkgnMjyOfLI7B
 CFrdecTZbR5upjNSDvQ7RG85SnpYJTIin+SAUazAeA2nS6gTZzumgtdw8XmVXZwdBfF+ICof
 92UkbYcYNbzWO/GHgsNT1WnM4sa9lwCSWH8Fw1o/3bX1VVPEsnESOfxkNdu+gAF5S6+I6n3a
 ueeIlwJl5CpT5l8RpoZXEOVtXYn8zzOJ7oGZYINRV9Pf8qKGLf3Dft7zKBP832I3PQjeok7F
 yjt+9S+KgSFSHP3Pa4E7lsSdWhSlHYNdG/czhoUkSCN09C0rEK93wxACx3vtxPLjXu6RptBw
 3dRq7n+mQChEB1am0BueV1JZaBboIL0AGlSJkm23kw==
In-Reply-To: <gw635fewdxe7falrxz44gxstiuzjpmeh45rwe5bglto524faaz@hj4z2vh22p5n>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 19/11/2025 10:40, Maxime Ripard wrote:
> On Wed, Nov 19, 2025 at 08:51:27AM +0100, Herve Codina wrote:
>> Hi Maxime,
>>
>> On Tue, 18 Nov 2025 17:56:36 +0100
>> Maxime Ripard <mripard@kernel.org> wrote:
>>
>>> On Mon, Nov 17, 2025 at 04:27:28PM +0100, Luca Ceresoli wrote:
>>>> On Thu Nov 13, 2025 at 10:19 AM CET, Francesco Dolcini wrote:  
>>>>> On Thu, Nov 13, 2025 at 08:49:50AM +0100, Herve Codina wrote:  
>>>>>> On Mon, 10 Nov 2025 16:03:51 -0300
>>>>>> João Paulo Gonçalves <jpaulo.silvagoncalves@gmail.com> wrote:  
>>>>>>> After commit ad5c6ecef27e ("drm: bridge: ti-sn65dsi83: Add error
>>>>>>> recovery mechanism"), our DSI display stopped working correctly. The
>>>>>>> display internally uses a TI SN65DSI83 to convert DSI-to-LVDS, and with
>>>>>>> the change, it keeps blinking on and off because the bridge is being
>>>>>>> reset by the error recovery mechanism.
>>>>>>>
>>>>>>> Even before the change, it was possible to see the message below from
>>>>>>> the driver indicating that the bridge's internal PLL was not locked
>>>>>>> (register 0xE5, bit 0 in [1]):
>>>>>>>
>>>>>>> [ 11.198616] sn65dsi83 2-002c: Unexpected link status 0x01
>>>>>>>
>>>>>>> However, it was working. After the change, it stopped working. Masking
>>>>>>> the PLL error makes it work again:
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
>>>>>>> index 033c44326552..89a0a2ab45b1 100644
>>>>>>> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
>>>>>>> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
>>>>>>> @@ -429,7 +429,7 @@ static void sn65dsi83_handle_errors(struct sn65dsi83 *ctx)
>>>>>>>          */
>>>>>>>
>>>>>>>         ret = regmap_read(ctx->regmap, REG_IRQ_STAT, &irq_stat);
>>>>>>> -       if (ret || irq_stat) {
>>>>>>> +       if (ret || (irq_stat & ~REG_IRQ_STAT_CHA_PLL_UNLOCK)) {
>>>>>>>                 /*
>>>>>>>                  * IRQ acknowledged is not always possible (the bridge can be in
>>>>>>>                  * a state where it doesn't answer anymore). To prevent an
>>>>>>>
>>>>>>> Any suggestions on how to proceed here?
>>>>>>>
>>>>>>> #regzbot introduced: ad5c6ecef27e
>>>>>>>
>>>>>>> [1] https://www.ti.com/lit/ds/symlink/sn65dsi83.pdf
>>>>>>>  
>>>>>>
>>>>>> The PLL should be locked.
>>>>>>
>>>>>> Also in the datasheet, in 'Table 7-2. Initialization Sequence', the status
>>>>>> is checked at the end of the initialization sequence and the sequence has to
>>>>>> be done again when the status register value is not 0x00.
>>>>>>
>>>>>> Even before monitoring (irq or polling method), you have an issue with your PLL
>>>>>> mentioned with the "sn65dsi83 2-002c: Unexpected link status 0x01" message.
>>>>>>
>>>>>> I don't understand even how your panel can be correctly driven with the bridge
>>>>>> PLL unlock.  
>>>>>
>>>>> We'll try to figure out the reason and see what's the best path forward.
>>>>>
>>>>> Whatever was the reason it was working before, and it should stay
>>>>> working  
>>>>
>>>> I agree with Hervé that using the chip with an unlocked PLL looks dangerous
>>>> and totally out of spec. So I encourage you to investigate what is going on
>>>> in the hardware looking for the root cause, checking whether the PLL is
>>>> really unlocked and how to get it working properly.
>>>>
>>>> The driver should be definitely be written focusing on the nominal case and
>>>> handle out-of-spec cases as an exception, not the other way around.
>>>>
>>>> I also agree your hardware should not stop working when upgrading to a new
>>>> kernel, so this investigation would ideally nail down tha root cause and
>>>> point to a solution in a very short time.
>>>>
>>>> Hervé has matured quite some experience on SN65DSI84 error management,
>>>> leading to his error recovery patch, and I also have a board with that chip
>>>> on my desk. So we may be helpful in discussion, as well as reviewing and
>>>> testing patches.  
>>>
>>> I'd say we should do it the other way around. If that patch breaks
>>> systems that were working fine so far without a clear reason, we should
>>> revert the offending commit, and *then* work towards a solution to
>>> support error recovery that doesn't break that system.
>>>
>>
>> I have the feeling that the broken system has an issue from the beginning.
>> Why its PLL has been unlocked ?
>>
>> I would like to understand what happens but, of course, I don't have the
>> hardware to investigate.
>>
>> Could the issue been on a component before the SN65DSI83 bridge?
>> I mean the component in charge of generating the DSI clock can be a culprit.
> 
> I understand what you're saying, but it's not the right way to think about it.
> 
> Let's change perspective.
> 
> Your work laptop just got a kernel upgrade, and its display doesn't work
> anymore. Would you be happy with the answer "it was broken all along, we
> might be able to help you fix it, maybe not, who knows when we'll have a
> fix"?
> 
> It's frustrating, you might not even be able to debug it in the first
> place, and most importantly, broken or not, it used to work just fine.
> 
> If it used to work for years, how can you possibly argue that it was
> broken all along?
I agree.

We could either revert the error handling, or change it to a print
(dev_dbg? but will it flood-print then if the unlock irq is being raised
all the time) instead of doing a reset.

 Tomi


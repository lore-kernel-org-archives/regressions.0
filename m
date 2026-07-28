Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8252B246774
	for <regressions@lists.linux.dev>; Tue, 28 Jul 2026 15:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785252692; cv=none; b=ObE3Cth4r+E+Y3H3alY9pAQgLp9DhEIl6hpxoqad5H5me5PkvP1faO8ZDGX/QJEbH3xCiO1Fy+AJSVQHKUYt2q4xJDWCnfEFcJ+gAIAHkktZ06hlRaNRcCQ6oSRDh2GR9XtMR8ybQj4HYr956x7mmBE9fwLK5YVFtQrMw8wx4+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785252692; c=relaxed/simple;
	bh=IIuK2qiDbzdMb66CHItsJ6CtKN6pS9GKuhMq/0p1uNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uo6/OX14VL7D1h3ibM0IPETH+ZcVKFRWdMDILNy04zNA5xLX9DMgFC8RRgH3a+pjUEh28eSmXMkhlwKRKbfaXmKaU+tJ7L4hRACWYF9zYis3fRHbJJMe5YIx20ihc3JsArWfskelJj1ilvFWyMrDEmzupq3YjKjOXpEp3+lCDqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=X9ciz8cC; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="X9ciz8cC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785252688;
	bh=IIuK2qiDbzdMb66CHItsJ6CtKN6pS9GKuhMq/0p1uNI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X9ciz8cC0cbOZgUB1CEZ/xFFTqNuJe/gkA6shMTl1br9rea6Gai1hIGPWiv0wvuv8
	 +FUCyzPF/SzUMFb/GfsNSSHMQm+c56TQNQLJzxYrv1D0mwM8jrycFHZAvNhm03tbqd
	 QZj98+BdOpWQo1LBaf5oVfGe4OIDLkWsltXgDC4GSKysHm3fM6zboE2cwIffgrzCj+
	 I0WqGuTUnaP2GuN23U4crV63/ZTLKvpw0c5X8Ibn4tv1KPYpqF0yZMVD+3ubGvxvB/
	 6nKz9M6m3rxiouYdvwHkMINcV8aCL4eibKNNFl3dVolAUqD/SsnDJHT5NzaQQMIZb5
	 zNPMOhS1tLjdw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2073F17E015B;
	Tue, 28 Jul 2026 17:31:28 +0200 (CEST)
Message-ID: <7afd90d9-6276-44d5-ad60-2a4533624afe@collabora.com>
Date: Tue, 28 Jul 2026 17:31:27 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: enable hs clock during pre-enable
To: Adam Thiede <me@adamthiede.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Gary Bisson <bisson.gary@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Esben Haabendal <esben@geanix.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20260120-mtkdsi-v1-1-b0f4094f3ac3@gmail.com>
 <8733xko1ms.fsf@geanix.com>
 <0f719c00-3cf5-4403-afbf-713b07255981@collabora.com> <aleM9Wy9otpd6Je3@owl5>
 <aRN3_2FHX8XmTcwduTAPwz4UFde4B0tbB09ajyeUg5qZxiIYMmbvMkG7CPoNTl4iySYMZawbLMWijO47R22gkg==@protonmail.internalid>
 <65558ccc-4f2c-492d-8c74-627d27dce864@collabora.com>
 <87h5m0mkca.fsf@geanix.com> <alpTEPsy-SIQv_Oc@owl5>
 <b26a4890-12e9-4995-a71d-d0b7458b1570@leemhuis.info> <amdTnudq48tZUTG2@owl5>
 <1826ddd9-6edd-4481-a31d-6cbb083b3a56@leemhuis.info>
 <5c7e81e7-28e1-4993-ac4e-724ec7664ebf@collabora.com>
 <806f042f-cf40-451a-8412-eb4a5e31963f@adamthiede.com>
 <6b344cc5-e07f-4a7e-b061-5f41d7ecfba1@collabora.com>
 <ce8a8be3-920c-4361-bce2-a46fd99f14d4@adamthiede.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <ce8a8be3-920c-4361-bce2-a46fd99f14d4@adamthiede.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/28/26 17:27, Adam Thiede wrote:
> On 7/28/26 09:08, AngeloGioacchino Del Regno wrote:
>> On 7/27/26 18:34, Adam Thiede wrote:
>>> On 7/27/26 10:54, AngeloGioacchino Del Regno wrote:
>>>> On 7/27/26 16:23, Thorsten Leemhuis wrote:
>>>>> On 7/27/26 14:48, Gary Bisson wrote:
>>>>>> On Mon, Jul 27, 2026 at 02:28:56PM +0200, Thorsten Leemhuis wrote:
>>>>>>> [top-posting to facilitate]
>>>>>>>
>>>>>>> Gary, Angelo, what's the status here? It looks like this fell through
>>>>>>> the cracks -- or was this issue fixed in between somehow? If yes: great!
>>>>>>> If not: Would be good to finally resolve this, as we are long past "fix
>>>>>>> within a week" rule of thumb from Linus:
>>>>>>> https://www.kernel.org/doc/html/latest/process/handling- 
>>>>>>> regressions.html#on- how-quickly-regressions-should-be-fixed
>>>>>>
>>>>>> Not much happened I'm afraid. The status as I see is:
>>>>>> - this patch is necessary to have TI SN65DSI83 working
>>>>>> - this patch also follows the DRM guidelines saying that HS clock must
>>>>>>    be enabled during pre_enable (see previous answer / [1])
>>>>>> - this patch has been successfully tested against MIPI-DSI panels (by
>>>>>>    Angelo) and LVDS panels via TI bridge (by myself)
>>>>>> - Adam reported an issue with another bridge (PS8640) where resume is
>>>>>>    broken
>>>>>> - Esben offered a patch to the TI bridge that would fix the issue we
>>>>>>    were seeing in the first place.
>>>>>>
>>>>>> But for the last two points, I'm not sure this calls for a revert yet:
>>>>>> - enabling HS clock in pre_enable still is what should be done [1]
>>>>>> - maybe the issue Adam is facing is due to the bridge driver instead as
>>>>>>    it could not be reproduced with another setup
>>>>>> - Esben patch would break the SN65DSI83 init sequence, suggesting that
>>>>>>    the culprit really is the MIPI bridge for not following the HS clock
>>>>>>    requirement in pre_enable instead [2]
>>>>> It's tricky, yes, but I suspect the right time for a revert was weeks
>>>>> ago. What Linus afaics basically wants in situations like this (espe.
>>>>> with two reporters) boils down to "something broke recently, no fix was
>>>>> found within a week or maybe two, so we go back to the previous state to
>>>>> restart from there -- and this is nothing bad, that's just done to buy
>>>>> us time."
>>>>>
>>>>> If something is right by some hardware or DRM specs often doesn't matter
>>>>> much. What makes this tricky is the fact that the revert might cause a
>>>>> regression for those that relied on the functionally the change brought.
>>>>> But I suspect even then Linus prefers a revert, as it's a recent change
>>>>> that only went into 7.1. The quoted from Linus on this page cover this iirc:
>>>>> https://www.kernel.org/doc/html/latest/process/handling- 
>>>>> regressions.html#quotes-from-linus-about-regression
>>>>>
>>>>> If we can't agree on this, we maybe should ask Simona or Airlied for advice.
>>>>>
>>>>> Ciao, Thorsten
>>>>
>>>> Thorsten,
>>>> I agree with you, and it's fine for me to get this commit reverted, for the sake
>>>> of following the rule (which is something I agree about: as a user, the last thing
>>>> that should happen is to be afraid of what breaks if I update my system!!!!),
>>>> even though reverting this actually breaks anything that is not PS8640.
>>>>
>>>> ......though......
>>>>
>>>> Everyone, please, look at how fundamentally broken PS8640 is... Qualcomm people 
>>>> had
>>>> the same issue as what is currently happening here.
>>>>
>>>> They had to fix their DSI driver, as it was kind-of broken in a vagualy similar 
>>>> way
>>>> compared to MediaTek - and then they found out that they needed (and upstreamed) a
>>>> *hack* that had to be done specifically for the PS8640 Bridge [1]: their issue was
>>>> never really resolved, as then the same bridge started casually working for 
>>>> unknown
>>>> reasons (is it still working?), so they removed the hack [2] and called it a day.
>>>>
>>>> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux- next.git/ 
>>>> commit/ drivers/gpu/drm/msm/dsi/dsi_manager.c? 
>>>> h=next-20260726&id=ec7981e6c614254937b37ce0af9eac09901c05c5
>>>> [2]: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux- next.git/ 
>>>> commit/ drivers/gpu/drm/msm/dsi/dsi_manager.c? 
>>>> h=next-20260726&id=9e15123eca7942caa8a3e1f58ec0df7d088df149
>>>>
>>>> Especially in [2], the assmption from Dmitry sadly isn't correct, because this is
>>>> happening now on MediaTek, and here Runtime PM makes sure that the PS8640 is also
>>>> being enabled "a wee bit" earlier than DSI... but that doesn't seem to be enough.
>>>>
>>>>
>>>> Now, here I'm kind of shotgunning at the driver, but I wonder if anyone can try
>>>> the following patch before reverting this commit in mtk_dsi? Adam?
>>>>
>>>> ---
>>>>   drivers/gpu/drm/bridge/parade-ps8640.c | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/ drm/ bridge/ 
>>>> parade-ps8640.c
>>>> index 96332721cb69..54ebf2fc8d1c 100644
>>>> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
>>>> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
>>>> @@ -665,6 +665,7 @@ static int ps8640_probe(struct i2c_client *client)
>>>>
>>>>       ps_bridge->bridge.of_node = dev->of_node;
>>>>       ps_bridge->bridge.type = DRM_MODE_CONNECTOR_eDP;
>>>> +    ps_bridge->bridge.pre_enable_prev_first = true;
>>>>
>>>>       /*
>>>>        * Get MIPI DSI resources early. These can return -EPROBE_DEFER so
>>> This does not fix the issue. I built 7.1.5 with this patch applied, and without 
>>> the revert.
>>
>> I think I know what's going on.
>>
>> This is just mediatek-drm calling the ddp_start() callback, which is needed to
>> start enabling the DSI, but putting the lane_ready(), hs_mode() calls in the
>> mtk_dsi_poweron() function is wrong, because that's enabling the HS clock way
>> before DRM bridge callbacks are executed.
>>
>> I said multiple times that I wanted to remove that ddp_start() and ddp_stop()
>> nonsense from mediatek-drm, and I think if what I think is happening is what
>> is actually happening, I have one more reason to clean up that .. stuff (more
>> than what I've just done with my more-than-50-commits of cleanup).
>>
>> Adam, one more test please. That's not shotgunning, and I'm fairly confident
>> that this is going to work.
>>
>> ---
>>   drivers/gpu/drm/mediatek/mtk_dsi.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/ mediatek/ 
>> mtk_dsi.c
>> index dc0c4e867179..c729a163bda6 100644
>> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
>> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
>> @@ -1165,8 +1165,6 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
>>           goto err_disable_dsi_and_digital_clk;
>>
>>       mtk_dsi_set_interrupt_enable(dsi);
>> -    mtk_dsi_lane_ready(dsi);
>> -    mtk_dsi_clk_hs_mode(dsi, 1);
>>
>>       return 0;
>>
>> @@ -1284,6 +1282,9 @@ static void mtk_dsi_bridge_atomic_pre_enable(struct 
>> drm_bridge *bridge,
>>       ret = mtk_dsi_poweron(dsi);
>>       if (ret < 0)
>>           drm_err(drm, "failed to power on dsi\n");
>> +
>> +    mtk_dsi_lane_ready(dsi);
>> +    mtk_dsi_clk_hs_mode(dsi, 1);
>>   }
>>
>>   static void mtk_dsi_bridge_atomic_post_disable(struct drm_bridge *bridge,
> This works - screen goes off and comes back on. Thank you!


WOOHOO! Sending the patch then.

Thanks for the testing.

Last request from me then is to reply with a Tested-by on the patch that I'm
sending in 3..2...1...

Cheers,
Angelo

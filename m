Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892193ED3C3
	for <regressions@lists.linux.dev>; Tue,  7 Jul 2026 10:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783420710; cv=none; b=Ep/PqSUiJ2xGYCiRdITtZotggP2CH37Qi1UFCATIPzUl1wUCtlZJybHNAS2zl3zJ42/7+lFGmlZq0MAbqSdRKGMyUCk4++4x/fCoVnJTi4jqVnDuu2i82lvsiXaC7H6YQwVw3gF99TxBjVirgSg/QDP5vLY9T5Z3mfG1kJ86FRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783420710; c=relaxed/simple;
	bh=EysvwkzHmGNKxX+6cYNAW+x0Vszx1rvcj8dTl/KXMQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QrkXSFBLd1yHO8v3ue72SgyV3/bYCev/j0fg1EPz/+JoM4tyNU1CJrqAzrMlkJfeNXM3BwqStmf9z3YJ44inDUEXN9mX0FNrlJcy+c0bvVrvIq/88whGq47VVTBH9fM6jjVTb5jViZnYRtl4AiBD3pXYjqAJTEdgKAOpPdoIVtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Ucqm1aiM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Ucqm1aiM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783420705;
	bh=EysvwkzHmGNKxX+6cYNAW+x0Vszx1rvcj8dTl/KXMQc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ucqm1aiMyjsc3XqQFQ2I2SZcGeGNl8tDJGnSHdHpBwnupfIfLiBA3BR2j5VWRYGFA
	 Q4AP8yUpmAb1PP1ndKUoQsduzbMFziYOIoYk+MND0PNBnkGQfUSomNE1EWZEdEDw6d
	 rr4xDG2Brj8x8BrG6eg/P2w9vu5+7HUQow13H6gxJ+w7HolRZ4otuvv5QQXYBGbTMU
	 /A4jthgx4aiXYDKNeUyQM6GiS6JXafclLsKnZTQOj/6U5xQ2InWxBrOxJzQ/tciXlu
	 hSqDkhZpYOYSpTdvlAAFU5WJ4LKDKZPfbPTcsMTpd5E9alkHL9sxRi3AjWt42MNtjZ
	 IMOMnFFk+MiUg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5611F17E0564;
	Tue, 07 Jul 2026 12:38:24 +0200 (CEST)
Message-ID: <6fed12a6-0c94-477f-8a2e-466c33ea2e29@collabora.com>
Date: Tue, 7 Jul 2026 12:38:23 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: enable hs clock during pre-enable
To: Thorsten Leemhuis <regressions@leemhuis.info>,
 =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
 "me@adamthiede.com" <me@adamthiede.com>,
 "bisson.gary@gmail.com" <bisson.gary@gmail.com>
Cc: "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
References: <20260120-mtkdsi-v1-1-b0f4094f3ac3@gmail.com>
 <42607fa4-485d-4142-b31c-7bfac71118d2@adamthiede.com> <ajka2220depklK1_@owl5>
 <bac79214-050d-448b-be63-0586d45c807d@adamthiede.com>
 <f0d99b1a-e383-4d14-adb1-4ccab46efddb@leemhuis.info>
 <5baeb90d2c3736df67ad075ede4ac765bfeaed2d.camel@mediatek.com>
 <84233951-ee22-4980-9f17-2af1df51fdbf@leemhuis.info>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <84233951-ee22-4980-9f17-2af1df51fdbf@leemhuis.info>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/7/26 10:51, Thorsten Leemhuis wrote:
> On 7/7/26 04:20, CK Hu (胡俊光) wrote:
>> On Mon, 2026-07-06 at 12:16 +0200, Thorsten Leemhuis wrote:
>>> On 6/22/26 15:23, Adam Thiede wrote:
>>>> On 6/22/26 06:22, Gary Bisson wrote:
>>>>> On Thu, Jun 18, 2026 at 04:06:28PM -0500, Adam Thiede wrote:
>>>>>> On 1/20/26 05:36, Gary Bisson wrote:
>>>>>>> Some bridges, such as the TI SN65DSI83, require the HS clock to be
>>>>>>> running in order to lock its PLL during its own pre-enable function.
>>>>>>>
>>>>>>> Without this change, the bridge gives the following error:
>>>>>>> sn65dsi83 14-002c: failed to lock PLL, ret=-110
>>>>>>> sn65dsi83 14-002c: Unexpected link status 0x01
>>>>>>> sn65dsi83 14-002c: reset the pipe
>>>>>>> [...]
>>>>>>
>>>>>> This commit was part of 7.1 and caused a problem for me.
>>>>>> I'm running postmarketOS (basically Alpine Linux) on a Lenovo C330
>>>>>> chromebook with a Mediatek MT8173 processor.
>>>>>> The problem: when the display on my laptop powers off (via suspend or
>>>>>> idle,
>>>>>> like xset dpms off) the picture does not come back when the display
>>>>>> powers
>>>>>> back on (from resume). The display backlight comes on and brightness is
>>>>>> adjustable but there is no picture. The only fix is to reboot.
>>>>>>
>>>>>> Reverting this commit and applying it as a patch on top of 7.1
>>>>>> addresses the
>>>>>> issue for me.
>>>>>>
>>>>>> You can view the config I'm using here:
>>>>>> https://urldefense.com/v3/__https://gitlab.postmarketos.org/postmarketOS/pmaports/-/__;!!CTRNKA9wMg0ARbw!jrsPDtSEUdaINzLlq92Li8gmsEBkTOxZ6WUzNHjvIN6CyOJjHiHkNSOhIRPXFTLPlaYlxU2uvryVkwjUAN9bmax5$
>>>>>> merge_requests/8819
>>>>>>
>>>>>> Is there any sort of testing or other debugging info I can provide to
>>>>>> help
>>>>>> address this issue?
>>>>>
>>>>> Thanks for reporting the issue, could you share some logs? Is the driver
>>>>> saying anything during resume? Also, what type of panel is used on that
>>>>> chromebook?
>>>>
>>>> The curious thing is that there are no real logs in dmesg or /var/log/
>>>> messages about this. This picture just fails to come back. If there are
>>>> some kernel params I can set to get deeper logging, that would help, but
>>>> I'm not aware of any.
>>>>
>>>> I think the panel is a "BOE NV116WHM-T00" - I used this command to get
>>>> info: cat /sys/class/drm/card0-eDP-1/edid | edid-decode
>>>>
>>>> Output: https://urldefense.com/v3/__https://termbin.com/8nbd__;!!CTRNKA9wMg0ARbw!jrsPDtSEUdaINzLlq92Li8gmsEBkTOxZ6WUzNHjvIN6CyOJjHiHkNSOhIRPXFTLPlaYlxU2uvryVkwjUAJooSyqL$
>>>
>>> This looked stalled. If I'm mistaken here, please let me known; but if
>>> no solution is in sight, should we maybe just revert the change until a
>>> proper was found?
>>
>> It's welcome anyone to provide a revert patch,
>> but I would still wait for the fixup patch until 7.2-rc4.
>> If no fixup patch exist, then apply the revert patch.
>  From my understanding of things the position in the devel cycle doesn't
> matter much in a case like this. To quote Linus statements from
> https://www.kernel.org/doc/html/latest/process/handling-regressions.html#on-how-quickly-regressions-should-be-fixed
> 
> """
>  From 2026-01-22:
> 
>   But a user complaining should basically result in an immediate fix -
>   possibly a "revert and rethink".
> 
> With a later clarification on 2026-01-28:
> 
>   It's also worth noting that "immediate" obviously doesn't mean "right
>   this *second* when the problem has been reported".
> 
>   But if it's a regression with a known commit that caused it, I think
>   the rule of thumb should generally be "within a week", preferably
>   before the next rc.
> """
> 
> Adam reported the problem about three weeks ago, so we are way past the
> "rule of thumb" timeframe Linus set.
> 
> Ciao, Thorsten

This is a kind of odd situation here. The fix from Adam is actually correct, as in,
the SN65DSI83 bridge gets broken without...

....but then, there's some more oddness going on: I tried to reproduce this on my
MT8173 Elm device, but there I can resume the system just fine, and the display is
up and running like normal?

I'm not sure what to advice here at this point - just adding some info.

Cheers,
Angelo

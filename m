Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722A11E9B3D
	for <regressions@lists.linux.dev>; Wed,  8 Jul 2026 01:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783473956; cv=none; b=F8HAnaKHEjpqLjDXNIMVHN7nh7CChLhuUgeqPqu65bQOzqkL1xeZ3BkLlFJ+zyUdC/Cb3hfeH/hSXTIjgmtPHQYRkmWq+QPLKpmYI4D88Pz/9mmCeNlBAh/VAgd+rifiMW5qGODR5Y78oyIj+6RbLs6r1guiI+dwNVZ/OfmKY+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783473956; c=relaxed/simple;
	bh=vDXbFeiPA/uH1RIIZ4+4JYdEalrDIaTD9ccqlNbEja4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=apqwZHPTQd3ZAKvnuaVUG6mwFk/NZOVUvGAxcQf5mbVpnOFkm9eE1VPo8fJPu3GXlDCLHjkcsT1mzFb6XbWDXIZ83Iw9yf0Uigxpoon9c/a3I1XgrA0MKFHYZYYfK6mqyBmtvPkBQxQP8H0FcnzeRe9LF8XGrDr2+nY1qyUk5xE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=adamthiede.com; spf=pass smtp.mailfrom=adamthiede.com; dkim=pass (2048-bit key) header.d=adamthiede.com header.i=@adamthiede.com header.b=Cs8ehjxW; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=adamthiede.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=adamthiede.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=adamthiede.com header.i=@adamthiede.com header.b="Cs8ehjxW"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gw0ly2RnBzKmyK;
	Wed, 08 Jul 2026 03:25:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adamthiede.com;
	s=MBO0001; t=1783473950;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PuWChsb4E1cC29lK7Elvpm/ZqbcvbK/u7X5aWPVhl78=;
	b=Cs8ehjxWZTm6YQKo5RjJY0pYmJZL9egmgNuBv+FZ3+yoXhvLMJN06rjHtXpjrtH0Uwab7y
	1V8Io12Juoe8wIw1Eo0beU78PvwVwSv8k9pGzKo6It81Lnz5i+ruT2dPJw82DV3uOi3esZ
	+dJCVLU5H46DAfqINzQ/A1kTJSdjRJBljEB/PxuJE1gUetMlYNByqdwzE32bgqO6IFncth
	590JilTLXjMtD4yiDt+OKub9gxqI7faWK/LRNmE8TyHyJQc1oP9OD/rXH6Zjl4hRvNUbiW
	QcP4Y0oG10vL6efjqKIcliQYi43ac9q8Jzye3/CqIHHOxth4x/MRkdAMigQNPA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of me@adamthiede.com designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=me@adamthiede.com
Message-ID: <dbc251f2-0c67-4970-a101-c19129055082@adamthiede.com>
Date: Tue, 7 Jul 2026 20:25:41 -0500
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: enable hs clock during pre-enable
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>,
 =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>,
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
 <6fed12a6-0c94-477f-8a2e-466c33ea2e29@collabora.com>
Content-Language: en-US
From: Adam Thiede <me@adamthiede.com>
Autocrypt: addr=me@adamthiede.com; keydata=
 xsBNBF+n+90BCAC2ZRLVcvdXDgfY7EppN05eNor3U7/eeiNCCEIWZkYLhikUEP1ReLGBkXpK
 Pc70hfnKAKkCoth3IwhDty9WXMNU+iLNei4ieb2luW+UqluR6xIUIA+txahMU9YcjVaQTKf/
 yZWO4yl6pfBPCxC2UdPZKBAdGoi5NnE0ABFNbhBETQhhBic533lZn33ByupfI3acECnQdjgQ
 llCUpDbw4I+S/N1iFiEHcbMXH7ZB00e3IYNorZ1E9v7p++5rDY1fQ9gXpieg1vFKwSq1NJWo
 9xx336YjaTUbX0EwrdKd9l8AktA3yRjckaK5TAcwSQaDtHvhpbl4ebvPhtwHh699MroXABEB
 AAHNH0FkYW0gVGhpZWRlIDxtZUBhZGFtdGhpZWRlLmNvbT7CwI4EEwEIADgCGwMFCwkIBwIG
 FQoJCAsCBBYCAwECHgECF4AWIQQtG9pGQ7sz3tf8M/kC7fV9o/vRzgUCZL1HxQAKCRAC7fV9
 o/vRzgyRB/wLqRCvvWhQCMgvzeKvru9wcXquhb77K8H/ByLbfiT8YBuP3lZFVh0IQhgO9Ylk
 fIoOJE4V+jjxyOnO2d9xjGbvAmmR6yT0gfLzSVWqrC4k+V9MWLv43nrNzxt41dvo5j824FAl
 X+zaiRZCdO8Jtxg5Elpiop2SKLi1utX1Z8i6YZh+ccJZlchUBAGUTk+D4UjK7vUcjLWT96ya
 CtdtTfXyw36CvGOPEWfc6++Kkl/5sgej1i7biPYzu/r0vssaQYTXKSrv6Cfa3Maa89ASiTtv
 q4qmhLnJeCrPxWlRAf6LEizeBEkOasYni2u8sp4wBezEq45Ozu45sfPkqLpPolG7zsBNBF+n
 +90BCADBRt+vrToRBEG580n77S99qSEkbKD+oJtCVyovnjMNkg0K9UG68LIeCX/ezngiV1M8
 JISvw5iFOuUFqGX/1hLl9wgt/YpuIrgWOp8XxkotavTCloLDvQmufJPO1L8bnnA+WgP2YgVZ
 5MJTj/t4DI+yQgysEjsH8aurHO2uuqgJE+xK+2dy6Cl/wskuGxObksSPmmFH5PH0Joziwrtl
 61ouLE2XwKbkMgIGEKkbFgbfwz3/QuLZGBni+OOtLzXeZ9wNTW/AHUPy6S9U4F+5z6/09fVT
 tTH0cvrgAGjbASlYx2VqGONXAsxCfjulq6ryJBFlPLp949c/JTTgOojukCSbABEBAAHCwHYE
 GAEIACACGwwWIQQtG9pGQ7sz3tf8M/kC7fV9o/vRzgUCZL1H0gAKCRAC7fV9o/vRzlamCACs
 vHw+0heTm+BfC3S8DUST6889gidIIwdqBep1ByzetCph7Bq8Y8BlT5YTX0u/bSKkxCzFgeTm
 vC341Q09ST2XjLAl1ZTdzGhH9gcgYyOw34pr5fPQRJLB392mPzD8YReRzciNbhWzj+DLgeVe
 ouyfGajd6jDjkf4FEq+trQLGZhpfsKn3JnDbzBUs945D50l/vz9q/QN3qZO+H4F6g8ZeMnqo
 FOEFN26xVtdEDr+0DNFsbgKmEzs675kdAY78ZZdbEetX/FSknxJ+FK1ZW3J7Yswwulj34AXP
 LB49Mk8Ot7fo6mdt0DkV11JS9LmKxKvpY+KTlrKG+i7pVCSZvVUx
In-Reply-To: <6fed12a6-0c94-477f-8a2e-466c33ea2e29@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4gw0ly2RnBzKmyK

On 7/7/26 05:38, AngeloGioacchino Del Regno wrote:
> On 7/7/26 10:51, Thorsten Leemhuis wrote:
>> On 7/7/26 04:20, CK Hu (胡俊光) wrote:
>>> On Mon, 2026-07-06 at 12:16 +0200, Thorsten Leemhuis wrote:
>>>> On 6/22/26 15:23, Adam Thiede wrote:
>>>>> On 6/22/26 06:22, Gary Bisson wrote:
>>>>>> On Thu, Jun 18, 2026 at 04:06:28PM -0500, Adam Thiede wrote:
>>>>>>> On 1/20/26 05:36, Gary Bisson wrote:
>>>>>>>> Some bridges, such as the TI SN65DSI83, require the HS clock to be
>>>>>>>> running in order to lock its PLL during its own pre-enable 
>>>>>>>> function.
>>>>>>>>
>>>>>>>> Without this change, the bridge gives the following error:
>>>>>>>> sn65dsi83 14-002c: failed to lock PLL, ret=-110
>>>>>>>> sn65dsi83 14-002c: Unexpected link status 0x01
>>>>>>>> sn65dsi83 14-002c: reset the pipe
>>>>>>>> [...]
>>>>>>>
>>>>>>> This commit was part of 7.1 and caused a problem for me.
>>>>>>> I'm running postmarketOS (basically Alpine Linux) on a Lenovo C330
>>>>>>> chromebook with a Mediatek MT8173 processor.
>>>>>>> The problem: when the display on my laptop powers off (via 
>>>>>>> suspend or
>>>>>>> idle,
>>>>>>> like xset dpms off) the picture does not come back when the display
>>>>>>> powers
>>>>>>> back on (from resume). The display backlight comes on and 
>>>>>>> brightness is
>>>>>>> adjustable but there is no picture. The only fix is to reboot.
>>>>>>>
>>>>>>> Reverting this commit and applying it as a patch on top of 7.1
>>>>>>> addresses the
>>>>>>> issue for me.
>>>>>>>
>>>>>>> You can view the config I'm using here:
>>>>>>> https://urldefense.com/v3/__https://gitlab.postmarketos.org/ 
>>>>>>> postmarketOS/pmaports/-/__;!!CTRNKA9wMg0ARbw! 
>>>>>>> jrsPDtSEUdaINzLlq92Li8gmsEBkTOxZ6WUzNHjvIN6CyOJjHiHkNSOhIRPXFTLPlaYlxU2uvryVkwjUAN9bmax5$
>>>>>>> merge_requests/8819
>>>>>>>
>>>>>>> Is there any sort of testing or other debugging info I can 
>>>>>>> provide to
>>>>>>> help
>>>>>>> address this issue?
>>>>>>
>>>>>> Thanks for reporting the issue, could you share some logs? Is the 
>>>>>> driver
>>>>>> saying anything during resume? Also, what type of panel is used on 
>>>>>> that
>>>>>> chromebook?
>>>>>
>>>>> The curious thing is that there are no real logs in dmesg or /var/log/
>>>>> messages about this. This picture just fails to come back. If there 
>>>>> are
>>>>> some kernel params I can set to get deeper logging, that would 
>>>>> help, but
>>>>> I'm not aware of any.
>>>>>
>>>>> I think the panel is a "BOE NV116WHM-T00" - I used this command to get
>>>>> info: cat /sys/class/drm/card0-eDP-1/edid | edid-decode
>>>>>
>>>>> Output: https://urldefense.com/v3/__https://termbin.com/8nbd__;!! 
>>>>> CTRNKA9wMg0ARbw! 
>>>>> jrsPDtSEUdaINzLlq92Li8gmsEBkTOxZ6WUzNHjvIN6CyOJjHiHkNSOhIRPXFTLPlaYlxU2uvryVkwjUAJooSyqL$
>>>>
>>>> This looked stalled. If I'm mistaken here, please let me known; but if
>>>> no solution is in sight, should we maybe just revert the change until a
>>>> proper was found?
>>>
>>> It's welcome anyone to provide a revert patch,
>>> but I would still wait for the fixup patch until 7.2-rc4.
>>> If no fixup patch exist, then apply the revert patch.
>>  From my understanding of things the position in the devel cycle doesn't
>> matter much in a case like this. To quote Linus statements from
>> https://www.kernel.org/doc/html/latest/process/handling- 
>> regressions.html#on-how-quickly-regressions-should-be-fixed
>>
>> """
>>  From 2026-01-22:
>>
>>   But a user complaining should basically result in an immediate fix -
>>   possibly a "revert and rethink".
>>
>> With a later clarification on 2026-01-28:
>>
>>   It's also worth noting that "immediate" obviously doesn't mean "right
>>   this *second* when the problem has been reported".
>>
>>   But if it's a regression with a known commit that caused it, I think
>>   the rule of thumb should generally be "within a week", preferably
>>   before the next rc.
>> """
>>
>> Adam reported the problem about three weeks ago, so we are way past the
>> "rule of thumb" timeframe Linus set.
>>
>> Ciao, Thorsten
> 
> This is a kind of odd situation here. The fix from Adam is actually 
> correct, as in,
> the SN65DSI83 bridge gets broken without...
> 
> ....but then, there's some more oddness going on: I tried to reproduce 
> this on my
> MT8173 Elm device, but there I can resume the system just fine, and the 
> display is
> up and running like normal?
> 
> I'm not sure what to advice here at this point - just adding some info.
> 
> Cheers,
> Angelo
Angelo, would you mind sharing your config, and the details of what 
you're running? It might be a configuration difference.
Thanks!

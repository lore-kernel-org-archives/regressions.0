Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED313FD96B
	for <regressions@lists.linux.dev>; Mon, 27 Jul 2026 12:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785156766; cv=none; b=IFrxan6KBsVPJsYRgxiEcVSOQkosv6mrY5xPs1zOrxz3rogumQYLpsbBzg7ou2CFZ+HdSujPURuoylEIRtS7ewQ26WSlVPeMViwkwGPfFrcVgzPHqss6FKZoWZwTHskzzvEatF++eUc2W2eLkQ+BDxygoYG/T4X5hXzvMG1b4w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785156766; c=relaxed/simple;
	bh=+zrjpWZMCsbumtvSoUgmDHsSCkUYM4VdhLP2gWgUwIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=myO7eOTBs3/TWbv7y3OnvvOTrvs3Jjwh2jeidSPPV+iLo8131GuTxl9T1PZhdkNa0uTm/orxZvhwD3f1+alX9Qlj7r9Z5tQEE3HDbz0ipbi0ukpXgO1K16HM0KggUx+H2jjvk8/k2yatOLGy8B6fOSRgzBDzdbi6ZC/gx2HiAAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=adamthiede.com; spf=pass smtp.mailfrom=adamthiede.com; dkim=pass (2048-bit key) header.d=adamthiede.com header.i=@adamthiede.com header.b=eyaQO3Xo; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=adamthiede.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=adamthiede.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=adamthiede.com header.i=@adamthiede.com header.b="eyaQO3Xo"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4h7z5h4RMrz8tyC;
	Mon, 27 Jul 2026 14:52:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adamthiede.com;
	s=MBO0001; t=1785156760;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PxswdzoAQvQGkPWUS0AeYk7qhI5OcIZi4EoyckriCiQ=;
	b=eyaQO3XoQJC0CJQ2LEoHk1Iumkqt80kZxvuK3C3ZuwmdLxQB9WwA+Tzfh+qJwzCDlDAI3c
	V3L+ARVx77vsqLQ8HF2dn8oE0tsoYQWkr5ZUygs4zTLYMP5wDqolfgD5nhZBQpAELXxAWf
	tFT5A6KHSkjN6rAJLUCwRDPxk6vtXssomCJKReiXjGWyzaHPAxMSC9sRldc51ffdUlkZ+o
	txCBM5DUQ+QTwn4Goo5K+lRuyK4XonvfvsSk/kL3XrPfn850KMJpaTFtaiMH5bHC1wbGfk
	Ob0CLVWlMD+6oAErfqD3w19bVCRg+mYHR5Ta+CMCJlWMtTCygbgGxGp9FyWGjg==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of me@adamthiede.com designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=me@adamthiede.com
Message-ID: <e18e4d30-8c54-4b4e-9d32-cfb8bf974b9c@adamthiede.com>
Date: Mon, 27 Jul 2026 07:52:31 -0500
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: enable hs clock during pre-enable
To: Gary Bisson <bisson.gary@gmail.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Esben Haabendal <esben@geanix.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20260120-mtkdsi-v1-1-b0f4094f3ac3@gmail.com>
 <8733xko1ms.fsf@geanix.com>
 <0f719c00-3cf5-4403-afbf-713b07255981@collabora.com> <aleM9Wy9otpd6Je3@owl5>
 <aRN3_2FHX8XmTcwduTAPwz4UFde4B0tbB09ajyeUg5qZxiIYMmbvMkG7CPoNTl4iySYMZawbLMWijO47R22gkg==@protonmail.internalid>
 <65558ccc-4f2c-492d-8c74-627d27dce864@collabora.com>
 <87h5m0mkca.fsf@geanix.com> <alpTEPsy-SIQv_Oc@owl5>
 <b26a4890-12e9-4995-a71d-d0b7458b1570@leemhuis.info> <amdTnudq48tZUTG2@owl5>
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
In-Reply-To: <amdTnudq48tZUTG2@owl5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4h7z5h4RMrz8tyC

On 7/27/26 07:48, Gary Bisson wrote:
> Hi Thorsten,
> 
> On Mon, Jul 27, 2026 at 02:28:56PM +0200, Thorsten Leemhuis wrote:
>> [top-posting to facilitate]
>>
>> Gary, Angelo, what's the status here? It looks like this fell through
>> the cracks -- or was this issue fixed in between somehow? If yes: great!
>> If not: Would be good to finally resolve this, as we are long past "fix
>> within a week" rule of thumb from Linus:
>> https://www.kernel.org/doc/html/latest/process/handling-regressions.html#on-how-quickly-regressions-should-be-fixed
> 
> Not much happened I'm afraid. The status as I see is:
> - this patch is necessary to have TI SN65DSI83 working
> - this patch also follows the DRM guidelines saying that HS clock must
>    be enabled during pre_enable (see previous answer / [1])
> - this patch has been successfully tested against MIPI-DSI panels (by
>    Angelo) and LVDS panels via TI bridge (by myself)
> - Adam reported an issue with another bridge (PS8640) where resume is
>    broken
> - Esben offered a patch to the TI bridge that would fix the issue we
>    were seeing in the first place.
> 
> But for the last two points, I'm not sure this calls for a revert yet:
> - enabling HS clock in pre_enable still is what should be done [1]
> - maybe the issue Adam is facing is due to the bridge driver instead as
>    it could not be reproduced with another setup
> - Esben patch would break the SN65DSI83 init sequence, suggesting that
>    the culprit really is the MIPI bridge for not following the HS clock
>    requirement in pre_enable instead [2]
> 
> So if we agree on the fact that HS clock must be set during pre_enable
> then I don't see a reason to revert that commit.
> 
> Regards,
> Gary
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/drm_bridge.c#n169
> [2] https://patchwork.kernel.org/project/dri-devel/patch/20260711-ti-sn65dsi83-fixes-v1-2-d85eb5342b98@geanix.com/
I'm also happy to try out any patches and report back, too! Just point 
me to it and let me know which release/RC I should apply it to.

Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658CC409DF0
	for <regressions@lists.linux.dev>; Mon, 27 Jul 2026 12:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785155349; cv=none; b=V5cYQbwt2aT8W7KlIihA8wkEb/MLRw6zKq2mW7SfdMD+kVaGCb+p4PMeeA7TLh42pFiEsbCljUQ/8ZfDSeab4EZDVmKL2Zd4effVyX5emqYah+PikLeM2VqRbT7CDyVfe6P4pRhgs0gIXfxqwebX1g1b6QAflkHAaQ3uPfyYxuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785155349; c=relaxed/simple;
	bh=nfwLFm2s3mkTM2bTTozuGx3qZH+WyTsP4vZXhJR8xH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R7TGt6cJAxbI8DgXzW4EVgFj3JVJEc78mDXFtELiWZVIQJs9LPb7Q4E44uftMa+Yh3Z+cEJs0xZRgfuiB+8VzuFJT+rr/0P12XNylpCcwBLPS67Z8ynqgkXsrSlJlbRNW8k1NgnpRAxNczLy9VjgRwUpUJUxwTHetuMqlDs9q1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=NmYTf66z; arc=none smtp.client-ip=188.68.63.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="NmYTf66z"
Received: from mors-relay8203.netcup.net (localhost [127.0.0.1])
	by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4h7yZS3MP5z8lpL;
	Mon, 27 Jul 2026 12:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1785155344;
	bh=nfwLFm2s3mkTM2bTTozuGx3qZH+WyTsP4vZXhJR8xH8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NmYTf66zpT0fsBdmv33DJ8RG8WMVRTMkfi9JcJ6TfctfqSYEKXa5exH7YICu4MAbU
	 JwGbcPgrINpDPX7v5PhiSpYvq1q/Ak0TdVfGSkytnBlZExdmnJU8HxoEyahugZC0dq
	 F2tH9ZxwiAK1lX48M2II0eJt1JeffQf9xGYpObjHlDTwe+UpIm6w77gyRzPj9y9c2Q
	 t+ISnj5vFbyUl6SuOcWUFlQ36kechQSwpQ4xb1tCW/Ol3uQaUkMvitNOQ7ILjJvMrI
	 fUnPT61/l/aRzVxIRVkpuH+P3WrOYzRcjlkVcFBmVMphddc9QfY9+8PzlxqsiAHaFp
	 FdhQtskRYTDEw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4h7yZS2ds8z8lmR;
	Mon, 27 Jul 2026 12:29:04 +0000 (UTC)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4h7yZQ5Gysz8sWT;
	Mon, 27 Jul 2026 14:29:02 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id A081C5F960;
	Mon, 27 Jul 2026 14:28:57 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <b26a4890-12e9-4995-a71d-d0b7458b1570@leemhuis.info>
Date: Mon, 27 Jul 2026 14:28:56 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: enable hs clock during pre-enable
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Gary Bisson <bisson.gary@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Esben Haabendal <esben@geanix.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Adam Thiede <me@adamthiede.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20260120-mtkdsi-v1-1-b0f4094f3ac3@gmail.com>
 <8733xko1ms.fsf@geanix.com>
 <0f719c00-3cf5-4403-afbf-713b07255981@collabora.com> <aleM9Wy9otpd6Je3@owl5>
 <aRN3_2FHX8XmTcwduTAPwz4UFde4B0tbB09ajyeUg5qZxiIYMmbvMkG7CPoNTl4iySYMZawbLMWijO47R22gkg==@protonmail.internalid>
 <65558ccc-4f2c-492d-8c74-627d27dce864@collabora.com>
 <87h5m0mkca.fsf@geanix.com> <alpTEPsy-SIQv_Oc@owl5>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <alpTEPsy-SIQv_Oc@owl5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <178515533816.1620399.13965770473853452397@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: A081C5F960
X-NC-CID: 920WuA/XGeNGLrNeQjm1inAdNyxnyRkYtAsxTGFvbL+809nYB2I=

[top-posting to facilitate]

Gary, Angelo, what's the status here? It looks like this fell through
the cracks -- or was this issue fixed in between somehow? If yes: great!
If not: Would be good to finally resolve this, as we are long past "fix
within a week" rule of thumb from Linus:
https://www.kernel.org/doc/html/latest/process/handling-regressions.html#on-how-quickly-regressions-should-be-fixed

And also nearing -rc6, which is when Linus would like to see all known
regressions fixed.

Ciao, Thorsten

On 7/17/26 18:06, Gary Bisson wrote:
> On Wed, Jul 15, 2026 at 03:52:05PM +0200, Esben Haabendal wrote:
>> "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
>> writes:
>>> On 7/15/26 15:36, Gary Bisson wrote:
>>>> On Wed, Jul 15, 2026 at 03:25:11PM +0200, AngeloGioacchino Del Regno wrote:
>>>>> On 7/15/26 14:53, Esben Haabendal wrote:
>>>>>> Gary Bisson <bisson.gary@gmail.com> writes:
>>>>>>
>>>>>>> Some bridges, such as the TI SN65DSI83, require the HS clock to be
>>>>>>> running in order to lock its PLL during its own pre-enable function.
>>>>>>>
>>>>>>> Without this change, the bridge gives the following error:
>>>>>>> sn65dsi83 14-002c: failed to lock PLL, ret=-110
>>>>>>> sn65dsi83 14-002c: Unexpected link status 0x01
>>>>>>> sn65dsi83 14-002c: reset the pipe
>>>>>>>
>>>>>>> Move the necessary functions from enable to pre-enable.
>>>>>>>>>>>> I have run into the same problem, but in combination with
another
>>>>>> pipeline. I am seeing same problem with an i.MX8 using the nwl-dsi
>>>>>> bridge and the dcss driver.
>>>>>>
>>>>>> I have submitted a fix that adresses the problem in the ti-sn65dsi83
>>>>>> driver instead. With a bit of luck, it can replace the fix proposed in
>>>>>> this thread.
>>>>>>
>>>>>> See https://lore.kernel.org/all/20260711-ti-sn65dsi83-fixes-v1-2-d85eb5342b98@geanix.com/
>>>>
>>>> Thanks, just tried it on 7.2-rc3 with my patch reverted and confirm that
>>>> it works too. My assumption was that the SN65DSI83 was locking the PLL
>>>> earlier for some specific reason and therefore was reluctant to change
>>>> it.
>>>>
>>>>> That clarifies a lot of things.
>>>>>
>>>>> The patch on mtk_dsi shall be reverted then.
>>>>
>>>> Angelo, do you want me to offer the revert patch? Should I wait to see
>>>> how the other thread goes?
>>>
>>> Gary, yes please, send a revert and make sure to explain the reason why
>>> we're reverting this in the commit description :-)
>>
>> Maybe test if my fix actually solves the problem with the mtk_dsi driver
>> also ;)
> 
> As mentioned in the other thread, your patch works but it might break
> the init sequence recommended by the bridge datasheet.
> 
> Moreover, the drm_bridge.c doc [1] does mention that the clock lane
> should be initialized during pre_enable. If we agree on this assumption
> I believe my patch should not be reverted.
> 
> Maybe Adam's bridge driver must be patched instead, just like the
> nwl-dsi driver should be updated to follow the drm recommendation.
> 
> Let me know your thoughts.

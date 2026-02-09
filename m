Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC4336BCD1
	for <regressions@lists.linux.dev>; Mon,  9 Feb 2026 11:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770637329; cv=none; b=anvLTp0+RnASSLweCO81LkAackMtYQuzpcE2cZHTGG+lYSM+IC6YwMkgNOaIpZnpYHkWZ5x07pcIUS3ipGgGgnffGSTKSPExS/SOb1N1j1AGQSUPeLBm3eDE1mHXy85dzyWvJJuMbPHxI7dop+gHzf0CnYxsaf8CiR+Yo/1BzEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770637329; c=relaxed/simple;
	bh=UbLizSxhVVXAh/w7Ptx95cgdsgsfjuOy3Uoimq/uwnU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MNih70t3o022Cnb0D1BD2pc3Oh3MEb3vj4fijC/Cm9Z2JhoBcRO5btSjZj1TqirphdRAGtsykoFgq3LNH4CABN2IVafy/8u6BG4BUa3om+v61JDoF1rhbHk7UZQN+bEGDHMVEDPbB3QzH3FseNKUo0M4pOfkxjlC679RXf+POZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UJhaFLhY; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UJhaFLhY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770637327;
	bh=UbLizSxhVVXAh/w7Ptx95cgdsgsfjuOy3Uoimq/uwnU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UJhaFLhY5cUPurgSiKNW+qV2sU1tqCeIBIPkRtaL8vF0snruWViLM+scsCLtPyu7P
	 jsywKHmvHokuyJrp0JcYTVJ1jmqaIGTp9uHBzWWVlV+H6wQtNIM35vT9+nEBqAXOWc
	 Tq4fHBjn9TjV+OF3uLFKxY/CtLI1iXEGVfEbrITZCSM2aAtAYZP/duPGrJFP+TytCb
	 OQk4ww2pkpMjvpVcV4UF0ocLBWSOrM0VrG0E6aQJcrrUyaGXnnYGhZTDFqB2d9bQiC
	 F9EQTYT2Vn2iLyIus99hnkPjpdnU3GFU1Z9oP4Ohd+Qa7XWZwuxNAFKDpQO9Uz6ixk
	 KnU1PqhXcHxPg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ECBDD17E13D5;
	Mon,  9 Feb 2026 12:42:06 +0100 (CET)
Message-ID: <908f3c03-a8b0-4535-9cfa-294c6ade8152@collabora.com>
Date: Mon, 9 Feb 2026 12:42:06 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] mt8183-kukui: dts: changes in dts caused display to
 no longer initialize - Was: Re: mt8183-kukui: drm/mediatek: dts: Invalid
 display hw pipeline when probing mediatek-drm
To: Denis Gessert <denisgessert@gmail.com>,
 Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Evans Jahja <evansjahja13@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, =?UTF-8?Q?Otto_Pfl=C3=BCger?=
 <otto.pflueger@abscue.de>
References: <CAFLVeg9hwH3PbKu5rPWZWqq6yz5mRRoB9oqxDkxNRdEDLGbVBw@mail.gmail.com>
 <CAFLVeg_soeYV4tOYKMo6TMYOtuWWU4TFCjUTxUrVEyGcRwMz7A@mail.gmail.com>
 <df6fcd73-fe0a-42fc-97ce-7e458c340553@leemhuis.info>
 <CAFLVeg-qeWu4ntgyqotsgjogPEyhqrMGG=UDWuZe+-D3K8YPTA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAFLVeg-qeWu4ntgyqotsgjogPEyhqrMGG=UDWuZe+-D3K8YPTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 06/02/26 17:58, Denis Gessert ha scritto:
> Thanks for the quick response. I compiled 6.18.9 with this patch
> (without reverting the previous commit) and it boots successfully.
> 
> Cheers,
> Denis
> 

Well, I missed all those replies to this thread, and sent a redundant reply
saying .. well, the same as Thorsten (hey, thanks for being faster than me!).


Happy to see further confirmation that the patch that we both mentioned is
actually fixing the issue.

Cheers!
Angelo

> Am Fr., 6. Feb. 2026 um 15:55 Uhr schrieb Thorsten Leemhuis
> <regressions@leemhuis.info>:
>>
>> On 2/6/26 12:33, Denis Gessert wrote:
>>>
>>> I found this email chain while troubleshooting why my Levovo Duet
>>> (with the MT8183 chip) would not boot using any 6.18.* kernel.
>>>
>>> I can confirm that on my device the current stable 6.18.8 does not
>>> boot unless I revert the commit
>>>
>>> commit e72d63fa0563f8a6e98c10fed3a9ce74dc0536e6 (HEAD)
>>> Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> Date:   Thu Jul 24 10:39:08 2025 +0200
>>>
>>>      arm64: dts: mediatek: mt8183: Migrate to display controller OF graph
>>>
>>> mentioned below. With the reverted commit the device boots as intended.
>>
>> There is a fix for it from Otto here that I guess should help
>> https://lore.kernel.org/lkml/20260106-mt8183-display-graph-v2-1-e7e56054eef5@abscue.de/
>>
>> Side note: lacks a stable tag and maybe should have been merged this
>> cycle instead of the next. But given that 6.19 is immanent it might be
>> good if this could be backported to 6.19.y once it landed in mainline.
>>
>>> PS: Apologies for the potential double-mail.
>> No worries, happens.
>>
>> Ciao, Thortsten



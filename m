Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BA734A79E
	for <regressions@lists.linux.dev>; Fri, 13 Feb 2026 09:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770974918; cv=none; b=S9Yb9YP3OqkEtj4BrSXSndBzQ+k+ubb1KHxXG4hUJONkXkey/YmXjRdC1ri+o50I9pdojMAPgjZDylRIWc/tVg27Rv8heey2DEtzoKYS3mqaZS+TEUabTrCUoDYgWlpf//xM8V+I6QQI9NcpM/ncbYuwaiT8eAzEidoCEi+wzfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770974918; c=relaxed/simple;
	bh=grByNNgXR4K1WiR61nAJLCUz7cIFwiHqZquGeTaeLoE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mwjBHxJ+gEBGXuJ25jyyzkSe1DS1FV19zvroLsIoTb8j8Pibox8KjRsFpAy2WDGOP7E1bLfy0Haft3Dk9AbOiiUFNXiYg5vvCjzbdzICQ2DDMJVzTvVdbdXLOqTXMRI012O6AkRFBr2+JOsdhLFU9ICH0k6Lwlt0lbCssRiD3ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=GEtbiYpL; arc=none smtp.client-ip=188.68.63.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="GEtbiYpL"
Received: from mors-relay8204.netcup.net (localhost [127.0.0.1])
	by mors-relay8204.netcup.net (Postfix) with ESMTPS id 4fC6KD0LNrz8bRt;
	Fri, 13 Feb 2026 09:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1770974880;
	bh=grByNNgXR4K1WiR61nAJLCUz7cIFwiHqZquGeTaeLoE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GEtbiYpL1WcISWTNX1jfaDopTW6B9cHdXG0fasc1XpxWwoXxD7bX3FhA+PQjwhYxb
	 qWUMUVudbb2QvOjQ9AJT5NRhkTIr5TF5wUXd+7w8yNfKr6fYnYERyuAGF86gQRVb4v
	 ENwTyqikw+EZ2PpcTwg865N+tyuHM9lUBPIqaOz718KXkMNo+QAmWV04mtrSnjxMWb
	 W7m/hTk3/zxs0qTkd4NpUUQoUK8g3tY3N+U09erh+K4W8i+yf9kDK9r4BJQsM0oTdX
	 pujZThphh/D4PeceezSURWmkNCgw+Twy0w5Q5FVQS7QT6qDaAnK3/NehcssGPPHEah
	 S283xuI0KawLA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay8204.netcup.net (Postfix) with ESMTPS id 4fC6KC6jWPz8bRr;
	Fri, 13 Feb 2026 09:27:59 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4fC6KB20YZz8t41;
	Fri, 13 Feb 2026 10:27:58 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 6053E6728C;
	Fri, 13 Feb 2026 10:27:57 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <96e7f0fc-65f4-4613-b556-3a2d869dabb4@leemhuis.info>
Date: Fri, 13 Feb 2026 10:27:51 +0100
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
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Denis Gessert <denisgessert@gmail.com>
Cc: Evans Jahja <evansjahja13@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev, =?UTF-8?Q?Otto_Pfl=C3=BCger?=
 <otto.pflueger@abscue.de>
References: 
 <CAFLVeg9hwH3PbKu5rPWZWqq6yz5mRRoB9oqxDkxNRdEDLGbVBw@mail.gmail.com>
 <CAFLVeg_soeYV4tOYKMo6TMYOtuWWU4TFCjUTxUrVEyGcRwMz7A@mail.gmail.com>
 <df6fcd73-fe0a-42fc-97ce-7e458c340553@leemhuis.info>
 <CAFLVeg-qeWu4ntgyqotsgjogPEyhqrMGG=UDWuZe+-D3K8YPTA@mail.gmail.com>
 <908f3c03-a8b0-4535-9cfa-294c6ade8152@collabora.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <908f3c03-a8b0-4535-9cfa-294c6ade8152@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <177097487771.825663.10388203810986665295@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 6053E6728C
X-NC-CID: cA1TgezXRliQ2k/M8T5pGyaY7S9Tj9Em3yC/U5L8VvqWxXawOY0=

On 2/9/26 12:42, AngeloGioacchino Del Regno wrote:
> Il 06/02/26 17:58, Denis Gessert ha scritto:
>> Thanks for the quick response. I compiled 6.18.9 with this patch
>> (without reverting the previous commit) and it boots successfully.
> 
> Well, I missed all those replies to this thread, and sent a redundant reply
> saying .. well, the same as Thorsten (hey, thanks for being faster than
> me!).

Happens. :-D

> Happy to see further confirmation that the patch that we both mentioned is
> actually fixing the issue.

The big question remains: Now that this landed in mainline, should we as
the stable team to pick this up for 6.18.y and 6.19.y to get it resolved
there quickly? They might pick it up on their own due to the Fixes tag,
but that is not guaranteed.

Ciao, Thorsten

>> Am Fr., 6. Feb. 2026 um 15:55 Uhr schrieb Thorsten Leemhuis
>> <regressions@leemhuis.info>:
>>>
>>> On 2/6/26 12:33, Denis Gessert wrote:
>>>>
>>>> I found this email chain while troubleshooting why my Levovo Duet
>>>> (with the MT8183 chip) would not boot using any 6.18.* kernel.
>>>>
>>>> I can confirm that on my device the current stable 6.18.8 does not
>>>> boot unless I revert the commit
>>>>
>>>> commit e72d63fa0563f8a6e98c10fed3a9ce74dc0536e6 (HEAD)
>>>> Author: AngeloGioacchino Del Regno
>>>> <angelogioacchino.delregno@collabora.com>
>>>> Date:   Thu Jul 24 10:39:08 2025 +0200
>>>>
>>>>      arm64: dts: mediatek: mt8183: Migrate to display controller OF
>>>> graph
>>>>
>>>> mentioned below. With the reverted commit the device boots as intended.
>>>
>>> There is a fix for it from Otto here that I guess should help
>>> https://lore.kernel.org/lkml/20260106-mt8183-display-graph-v2-1-
>>> e7e56054eef5@abscue.de/
>>>
>>> Side note: lacks a stable tag and maybe should have been merged this
>>> cycle instead of the next. But given that 6.19 is immanent it might be
>>> good if this could be backported to 6.19.y once it landed in mainline.
>>>
>>>> PS: Apologies for the potential double-mail.
>>> No worries, happens.
>>>
>>> Ciao, Thortsten
> 
> 
> 


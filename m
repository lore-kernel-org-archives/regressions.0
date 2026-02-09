Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456EC36C0B6
	for <regressions@lists.linux.dev>; Mon,  9 Feb 2026 11:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770635202; cv=none; b=Y5We3lBnXc4cvuY8AhMlGEHL6tFtrJzzyN3pcQaZ0BV8prZoKNEadT+9RhucD+0ojgIon+uaxLPrPLC0k64tURreZPPcFVY1x9zryk8bSlOcqKDkPvWQv+GMHtYOoMkvTjhiLDiytCpxGYhCQQV/neSCUbPmoSxrpGGzb3yoK3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770635202; c=relaxed/simple;
	bh=2lMWX6iA/+dulHjSwMbZnkcOOKboG3fTdavqfRIbpws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mg+gtwUh9osGYSKVHjHBctTdWwLaued2uQhsT49Tfnaz9MfS6qi6VO6yVqAyP3ZscFnSnSe9GRjQGiUAQedfl1wf+3VMsjtM10NZs/bkM16+QzMTMYcrGa2C78PmOGkE1DcpgXsN7uF1kV891D5XAuJCU1B4hTe9dvfbtp8m4Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=C2zivwwy; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="C2zivwwy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770635200;
	bh=2lMWX6iA/+dulHjSwMbZnkcOOKboG3fTdavqfRIbpws=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=C2zivwwyQTDIsfTUyyxZA1GPOYma4KFEMoAmYarbFKpRhvs6jxqp/Of4oWiEevBxj
	 Dn4hzO7dmMjjHxbl1D8YsyJPam0wjrpXgxpingTsz0SbJxbVuCcPumhDovPht6i0uj
	 +nUSYMyx0HiCWHVObk4RN2OjmsxowAjktMThAhfULy2yIlWulNUA4NjMYwySzFin6M
	 2aQ1KWxC4miqKJGq14V3bv21xsJ13qWKAJZoqkGMWxF+c+hbkNXTKPqHohlQrSswvs
	 PQUWe8NMIL6O/uZRewUrBHwhAX7Dzm3N5gwCc0cJiwYTE+obdtIslbXB18PM//sMnL
	 r9HGFIYWnM4YA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 225AE17E1144;
	Mon,  9 Feb 2026 12:06:40 +0100 (CET)
Message-ID: <56dcaa86-d4a6-4ba5-9dd4-adf8c057cb2c@collabora.com>
Date: Mon, 9 Feb 2026 12:06:39 +0100
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
 Thorsten Leemhuis <regressions@leemhuis.info>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Evans Jahja <evansjahja13@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <CAFLVeg9hwH3PbKu5rPWZWqq6yz5mRRoB9oqxDkxNRdEDLGbVBw@mail.gmail.com>
 <CAFLVeg_soeYV4tOYKMo6TMYOtuWWU4TFCjUTxUrVEyGcRwMz7A@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAFLVeg_soeYV4tOYKMo6TMYOtuWWU4TFCjUTxUrVEyGcRwMz7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 06/02/26 12:33, Denis Gessert ha scritto:
> Hi,
> 
> I found this email chain while troubleshooting why my Levovo Duet
> (with the MT8183 chip) would not boot using any 6.18.* kernel.
> 
> I can confirm that on my device the current stable 6.18.8 does not
> boot unless I revert the commit
> 
> commit e72d63fa0563f8a6e98c10fed3a9ce74dc0536e6 (HEAD)
> Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Date:   Thu Jul 24 10:39:08 2025 +0200
> 
>      arm64: dts: mediatek: mt8183: Migrate to display controller OF graph
> 
> mentioned below. With the reverted commit the device boots as intended.
> 
> PS: Apologies for the potential double-mail. My first message bounced
> because it was HTML, so I am sending it again text-only. (This is my
> first time on the mailing list..)
> 
> Cheers,
> 
> Denis

Hello Denis,

This patch should be resolving the issue -> 
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/arch/arm64/boot/dts/mediatek?h=next-20260205&id=be0b304eeb8c5f77e4f98f64e58729d879195f2f


Cheers,
Angelo

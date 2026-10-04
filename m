Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D27847F3D9
	for <regressions@lists.linux.dev>; Sun,  4 Oct 2026 18:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791138330; cv=none; b=De/4QGkJp0dP9gmhCqGFZziQhZ9FYcEphBUFwhl5CYR99K0bPbZenHBBwRX7TigTiQJq30yqDk5UA5GMUnyHw0xe4DUXF8FMnOv4Vk83zOapKEkFIxFXMziomMZ18TEgwqqiVbzS10XF5E1aPbWVBBIJigT7X3SdFEeq8QxudSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791138330; c=relaxed/simple;
	bh=F1BF7ZhJBLxJ2rF4Nu+DwYItNVCoVTxgkn/uMcDkA5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KybUdJ17uGu2shXOpKJJOrOEEVOSSaLBtQE6W8YH9M8qkybXAqp4rdY8vktyAsn1ig4QxiNN7DtTfBWbfm2p+Q7vO0STRqr1tbTH5wLRiOQVrEb9GAvfGRH02uKkT5X+1TvIsYwJYj3chrRSadJs2s76gtIroIMOddGJhOExn8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=D3cEOvme; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b="D3cEOvme"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id A739F240028
	for <regressions@lists.linux.dev>; Sun,  4 Oct 2026 20:25:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de;
	s=1984.8680eb; t=1791138320;
	bh=F1BF7ZhJBLxJ2rF4Nu+DwYItNVCoVTxgkn/uMcDkA5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:Content-Type:
	 Content-Transfer-Encoding:From;
	b=D3cEOvmeqQYIv9ZVYmWcTV4lxl0d0MJelw8vdUv8x9wwqmuh0lkIrAYDei0Oi7Wni
	 8TU3DuaH01OUPSfxB5lxvIi2WxRHtWrMtGOFnEB7WDpLWhvmULZLH16TInSlrkWQ71
	 +7CyDxt1I+TTyd4K/mSzmUknCVFiZS0pY+WrPD9N1Pup1WJn1HUll8AH5HZIa8P5CE
	 On9wFt6V7woEjCyXFoOVTNfNlep86LFHhwkPxJektxqyZSuz53pSIoAIzYl20fSd5r
	 nf6MiCr5XsYZqLnManD200HZuLoHZIXfrHEFO+PU+UV2kE++M8QTneIxo9xzDIHAVC
	 CEWziGQZb8mbA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hyWCf1XxGz6v19;
	Sun,  4 Oct 2026 20:25:18 +0200 (CEST)
Message-ID: <49b62a23-3e05-42de-b3ed-92294311cbdd@posteo.de>
Date: Sun, 04 Oct 2026 18:25:20 +0000
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v2] wifi: mt76: mt7925: keep MLD membership consistent
 during link add
To: Andrei Rusu de Castro <arc@empyreal.works>,
 linux-wireless@vger.kernel.org, Devin Wittmayer <lucid_duck@justthetip.ca>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Sean Wang <sean.wang@kernel.org>,
 Thorsten Leemhuis <regressions@leemhuis.info>, regressions@lists.linux.dev,
 linux-mediatek@lists.infradead.org
References: <503eb10e-80cf-493e-95fd-04fc0f94ce01@posteo.de>
 <e4bc5ce3-9a6f-4365-9d36-f6440ded0865@posteo.de>
 <c64f5fa6-4c61-45b6-a513-b971e59d7723@posteo.de>
 <476e7721-580e-4a6b-86e5-5ed782a2c7ec@leemhuis.info>
 <c9f984c4-e3c4-4e41-a502-99db97ce724b@posteo.de>
 <20260829221319.25334-1-lucid_duck@justthetip.ca>
 <d245c4b1-dfba-4507-85a2-c6883f5eae64@posteo.de>
 <20261003180334.83575-1-lucid_duck@justthetip.ca>
 <20261004-mt7925-mld-v2-results-248bb5e6404f@empyreal.works>
 <20261004-mt7925-mld-v2-248bb5e6404f@empyreal.works>
Content-Language: en-US, de-DE
From: Jonas Hort <jonas.hort@posteo.de>
In-Reply-To: <20261004-mt7925-mld-v2-248bb5e6404f@empyreal.works>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrei,

Tested v2 on top of v7.3-rc5 on my setup:

   hardware   MT7925 PCIe (mt7925e)
   firmware   20260813113118
   AP         FritzBox 5690 Pro, FRITZ!OS 8.25
   links      5GHz + 6GHz MLO (5200 + 6135 MHz)

   stock 7.1.8 / 7.2-rc7   stalled after 3-5 minutes (WFDMA0 tail frozen)
   v7.3-rc5 + v2           46 minutes, no stall

Both links stayed active throughout, with about 4.2 GB received and
340 MB sent during the run. My watchdog (ping + WFDMA0 queue
monitoring) did not trigger once.

Tested-by: Jonas Hort <jonas.hort@posteo.de>

Thanks for the fix!
Jonas

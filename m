Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DA23019BE
	for <regressions@lists.linux.dev>; Wed, 18 Feb 2026 20:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771445760; cv=none; b=PX6cqGjheg4CjHb7O8QShvWAPaXgSPHcb5l+dchOx1s2BZfLa4tCwdTxdyL8wTnqVIdupJ0HQK26xIwtcQXmlNzIa2atkW5f6xZ/Rqcb581JefjXqkzZjo/sH0W11iPwsCO4/xMcYUoNzarDrO5fRdXKMm4eEphYia8ZJIr3bfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771445760; c=relaxed/simple;
	bh=5uNMd0NubRf1wUh2v9cLUu0XWN/mz95QGc431XZp3Gk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=rCtWXl8uIGqWvCty+Oup/+e3xg+dAF8MqNGja3zYggtsx0LaAFfIjec9fBJetxTk2DyrgbAOMJEdv+w4rBtcWKspRrluiZPuXj2tTMHhmNE+z21ehij4B8vl4TnU742q9EVd1DHXl+teh1lmd+YZAQLa7GsArttWHSAj0mLA730=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=CkYqnYgc; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="CkYqnYgc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771445757;
	bh=5uNMd0NubRf1wUh2v9cLUu0XWN/mz95QGc431XZp3Gk=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=CkYqnYgc8ySpj5oQ5PH0hg10U5skfgxYxMK5mJpHILdBW7/xn3WMK1TFqyX7NjLdB
	 nWcIZbvS4BsG3MCQM+86f+4Nv+AsB6Wl0FwVeEXV8XtqbqZSRddQaoQTYuZ/Vr6haT
	 sclZWsM4hfItyQimOs1PD0JXw2K87VpV3wIdZIrOU8BQxFoJ3h56+h79yi/S7sS4Ob
	 eALBCq9epoprzE6haReG7B0ALlafDoa5poEIMk9uBwYLYgzCMgU8qFRyzHeVVOBPvD
	 TKdfj8KT5PROCzrY4uz377fKxVsl4lqMnmgiNRFKoaVZvEPOvOz5fK5Vu/y54Orvlq
	 +LaO9H51k1dzQ==
Received: from [192.168.1.90] (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4CD8317E1396;
	Wed, 18 Feb 2026 21:15:57 +0100 (CET)
Message-ID: <03b5f3d1-6db4-4835-b2a5-c22c1aa63825@collabora.com>
Date: Wed, 18 Feb 2026 22:15:56 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] HDMI monitor not working on Radxa Rock 5B after phy
 rockchip samsung hdptx HDMI 2.1 FRL patchset
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: dubito@online.de, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner
 <heiko@sntech.de>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <b32164001947ba922aefb6ca86a8dc59e9323d2b.camel@online.de>
 <8e410a11-bd7b-4a12-a711-0514a59409c0@collabora.com>
 <1859c940219a4dbfdf0497afbf333e627ab0ba25.camel@online.de>
 <98e46dbb-c8e2-451f-accb-ea48f63f9408@collabora.com>
 <4544ec4ccfa49cbdffee098878df7806223935a0.camel@online.de>
 <08369c90-fbab-477d-9ac6-388deddfd3b1@collabora.com>
 <26e31b3b-484f-433b-833f-c639ee437f63@collabora.com>
Content-Language: en-US
In-Reply-To: <26e31b3b-484f-433b-833f-c639ee437f63@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/18/26 3:22 AM, Cristian Ciocaltea wrote:
> On 2/18/26 2:52 AM, Cristian Ciocaltea wrote:
>> Hi Thomas,
> [...]
> 
>>
>> Sorry, I somehow missed the following warning message, though it has been
>> already present in all the logs you've sent to me so far:
>>
>>   rockchip-hdptx-phy fed60000.phy: PLL locked by unknown consumer!
>>
>> That indicates the PHY has been preconfigured by an external component (e.g. the
>> bootloader), which is actually a scenario that I didn't verify.
>>
>> However, this just another way to expose a limitation of the current approach
>> for managing the TMDS character rate: done via the Common Clock Framework API
>> instead of the HDMI PHY configuration API.
>>
>> As a matter of fact, it was actually an item on my TODOs list for quite a while,
>> but blocked until recently due to several dependencies waiting to be merged
>> upstream.
>>
>> Hence I took the opportunity to finalize this task - please give the following
>> commits in my rk3588-hdmi-debug branch [2] a try:
> 
> I've just realized I introduced a regression while doing some cleanup work, hence
> please ignore this until further notice.

I think I got this working properly now, at least it passes all the tests I
could run.  The updated commits in [2] are:

  fa7cd1e75aaa ("phy: rockchip: samsung-hdptx: Fix rate recalculation for high bpc")
  8048db5544da ("phy: rockchip: samsung-hdptx: Exclusively use PHY config API for PLL changes")
  0085a382dfd0 ("[DEBUG] drm/rockchip: Add HDMI verbose logging")

Regards,
Cristian

[2] https://gitlab.collabora.com/cristicc/linux-next/-/commits/rk3588-hdmi-debug


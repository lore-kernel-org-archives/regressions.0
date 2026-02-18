Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96ED0311972
	for <regressions@lists.linux.dev>; Wed, 18 Feb 2026 20:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771448215; cv=none; b=h73ju3nCE3FnC5QL5Q6C3TDBRit/wg5gz+A5Yszz9iuwMuhbmfLrKoAoCkGOPx/qv9h7/6B8Wb8/cXDMBSguA2srfJlUYpm0bYBaKI6VSKGZl48gYSw9qyh2Nfz+YFfi20RnyxG89qPq/HlY1ysBtG5dejNvIs0t6lX5U63jIR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771448215; c=relaxed/simple;
	bh=OwmdDIcpJBYXHzGN/OiX+qYUOpoVkCDEW7IiyCqnSpc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nIXyaluXBkhv3SKBWK/82XDhvDozurjarWfV8ouE6UPAG/8C5dUcdqY6hpzBG/i/PHbB1c5Dh6YFl8N+ynTKciZjqPvU3NWomdwzEMUUGZ7V0ejItH4ZqSPtoBVO2S4J49phVhXOq2SpV9RriPgZmC2xC3sym9wmiTb7VomraXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=S5J56E93; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="S5J56E93"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771448212;
	bh=OwmdDIcpJBYXHzGN/OiX+qYUOpoVkCDEW7IiyCqnSpc=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=S5J56E93P9UTrZ/REL9COO9XVO1m6FzavDwdBnI7cuJx9qGxJ40XAwCrYBoAjPcfd
	 ADWCaNMxXYkfZC54N1hUHXEzkRqADui5iLVUZV6wD/b2E8f8+fC5POkv+NkniUp9rk
	 Vxgaph+ucn/vgPJK/XHE0XezfmulXRqL/JB0NqVaY4pZBxiJfrdc9hLR194YhqQUOJ
	 Jdjz+iTnEe0YYEaqf10jNa7PCI3dWJLOPeCmCFddQG4ws79JF+q0PRhB+12PfWo/G1
	 pcN4bryzGotxtNiu8pwHNGBXqOBsq7yEO4vVrech0z5WeD4wIXcGJRkO98OortxdQN
	 y7nGzuBOHT03Q==
Received: from [192.168.1.90] (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8622417E131B;
	Wed, 18 Feb 2026 21:56:52 +0100 (CET)
Message-ID: <a662745a-1b2a-47b3-a66d-7c1c5c8af525@collabora.com>
Date: Wed, 18 Feb 2026 22:56:52 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] HDMI monitor not working on Radxa Rock 5B after phy
 rockchip samsung hdptx HDMI 2.1 FRL patchset
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
 <03b5f3d1-6db4-4835-b2a5-c22c1aa63825@collabora.com>
 <a3c3964e9e13c82d944fa1ee0acbb1a7806dd382.camel@online.de>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <a3c3964e9e13c82d944fa1ee0acbb1a7806dd382.camel@online.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Thomas,

On 2/18/26 10:43 PM, 1und1 wrote:
> Hi Cristian,
> 
> 
> Am Mittwoch, dem 18.02.2026 um 22:15 +0200 schrieb Cristian Ciocaltea:
>> On 2/18/26 3:22 AM, Cristian Ciocaltea wrote:
>>> On 2/18/26 2:52 AM, Cristian Ciocaltea wrote:
>>>> Hi Thomas,
>>> [...]
>>>
>>>>
>>>> Sorry, I somehow missed the following warning message, though it has been
>>>> already present in all the logs you've sent to me so far:
>>>>
>>>>   rockchip-hdptx-phy fed60000.phy: PLL locked by unknown consumer!
>>>>
>>>> That indicates the PHY has been preconfigured by an external component
>>>> (e.g. the
>>>> bootloader), which is actually a scenario that I didn't verify.
>>>>
>>>> However, this just another way to expose a limitation of the current
>>>> approach
>>>> for managing the TMDS character rate: done via the Common Clock Framework
>>>> API
>>>> instead of the HDMI PHY configuration API.
>>>>
>>>> As a matter of fact, it was actually an item on my TODOs list for quite a
>>>> while,
>>>> but blocked until recently due to several dependencies waiting to be
>>>> merged
>>>> upstream.
>>>>
>>>> Hence I took the opportunity to finalize this task - please give the
>>>> following
>>>> commits in my rk3588-hdmi-debug branch [2] a try:
>>>
>>> I've just realized I introduced a regression while doing some cleanup work,
>>> hence
>>> please ignore this until further notice.
>>
>> I think I got this working properly now, at least it passes all the tests I
>> could run.  The updated commits in [2] are:
>>
>>   fa7cd1e75aaa ("phy: rockchip: samsung-hdptx: Fix rate recalculation for high
>> bpc")
>>   8048db5544da ("phy: rockchip: samsung-hdptx: Exclusively use PHY config API
>> for PLL changes")
>>   0085a382dfd0 ("[DEBUG] drm/rockchip: Add HDMI verbose logging")
>>
> 
> applying these commits solves my problems. I tested 1920x1080@60, 1920x1080@50
> and 1920x1080@30. All work now. Thanks for the quick fix! 

Thanks for the quick test!

I can add you to cc: when I submit the series, so that you may provide your
Tested-by tag if you'd like to.

> And the positive side> effect seems to be that you can now take one of your
> old todos from your list.

Indeed. :-)

Regards,
Cristian

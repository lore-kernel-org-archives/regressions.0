Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A5023EAB4
	for <regressions@lists.linux.dev>; Wed, 18 Feb 2026 01:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771377731; cv=none; b=SkEAUTAPv86Mb0EAzrRi3y/Cpbvg0ln1+EO9pbf/hbpW1ZJsXTgRb9FSwgMZQJvpcewBRf/xj2Zl1EJc3b22VcPFL3G3Tkay8Fx80FJMs5AFjTnJXD98FuypWYFHrDy1gg3MhOGSWD1V58j579sylqsDl6uXyNXrkpnw5yag++Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771377731; c=relaxed/simple;
	bh=APtxeUx0eDQJR7IoVCyJrWk/yYivtUIxxTdH3yeZ6g4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=D+8nS9hIIDvEyvEOeWTRdnwaCJYmvGYgaUx8z/EVoHOkR0lROiiYbLLOYlNmCE+LemP2/Q63JSz/LoWNEW7JIxV8v/UrT6oAoS4uZisOQGrRcmQCljzK1x07TkDOr1Q+MnTzBzZ7xum16dVpVZVdEnTD0bFpqDb0VpNY9+OCgxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=QEgCSBX0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="QEgCSBX0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771377728;
	bh=APtxeUx0eDQJR7IoVCyJrWk/yYivtUIxxTdH3yeZ6g4=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=QEgCSBX0EWbYPkVOEbbgqIi9DbLoGaZLjkdJx0oNoD18HpkgaxcSJutWqTAzASEaf
	 IwyQp6Bx3NjwVar2jB9v+25w6Gwu6f+yOS8BbxKe89QY4HVI2LizgpYcK2Nzsvzmcz
	 KKKLIAUFR8beVuJZ+vQcbFdZxNORslKZKMal+yZxrO/+dT7jEz+LwoTmceuRSWwizR
	 gbnM9vzMEP1z6iCx8l5NNg0DUMrF1qhu0h1mlAdaar0d3PezXkaxou+cp3JD/uYTmq
	 AlFQ7bLbXoNqC4Ll2l/ZNEeH2JhyOJk/qroneNOofpmZHAC6f5SveWTM8Qm/xQQq07
	 1g396ozN3vt8Q==
Received: from [192.168.1.90] (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3566817E012E;
	Wed, 18 Feb 2026 02:22:08 +0100 (CET)
Message-ID: <26e31b3b-484f-433b-833f-c639ee437f63@collabora.com>
Date: Wed, 18 Feb 2026 03:22:07 +0200
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
Content-Language: en-US
In-Reply-To: <08369c90-fbab-477d-9ac6-388deddfd3b1@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/18/26 2:52 AM, Cristian Ciocaltea wrote:
> Hi Thomas,
[...]

> 
> Sorry, I somehow missed the following warning message, though it has been
> already present in all the logs you've sent to me so far:
> 
>   rockchip-hdptx-phy fed60000.phy: PLL locked by unknown consumer!
> 
> That indicates the PHY has been preconfigured by an external component (e.g. the
> bootloader), which is actually a scenario that I didn't verify.
> 
> However, this just another way to expose a limitation of the current approach
> for managing the TMDS character rate: done via the Common Clock Framework API
> instead of the HDMI PHY configuration API.
> 
> As a matter of fact, it was actually an item on my TODOs list for quite a while,
> but blocked until recently due to several dependencies waiting to be merged
> upstream.
> 
> Hence I took the opportunity to finalize this task - please give the following
> commits in my rk3588-hdmi-debug branch [2] a try:

I've just realized I introduced a regression while doing some cleanup work, hence
please ignore this until further notice.

Cristian


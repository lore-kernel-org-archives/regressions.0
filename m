Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D698E1B2503
	for <regressions@lists.linux.dev>; Wed, 21 Aug 2024 17:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724260324; cv=none; b=fRfHAe9BaTUAmUABwiu0ebVHUCdXknENFb9yJSdf/kTs4cZT45Ot73tCCgsYZZOfXpEjAde6kS+NsOr3VVGHZKEygbbg6mcXEvp1Bt5pSxWA7W0DjRv7edTX6ngc5HcWQ5cAc7Dq8dKgo/36w3Jf/91+8GqIei6cYxX7e05u1S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724260324; c=relaxed/simple;
	bh=k2fUuIYccYsmi5lYkKS+qYpEJ6ewtxT7Fpl71LhD4wU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=FTjL7io3MB7VJwHaQcuAQV6ZSDTRc6qQpJadNpnc4Pf4C6L1xem8Y6b65KE3omUEy9Nd3VFEv4KCiGZE2xCjjN1CO+KCVG+VvGcHux6VjEomtH8DJ6WXN4A75qMsV+1mHN0bT43+FfPcr3l/eAFUZ/b1B8EldCRJMBURQZhwRDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=WcRcsPkU; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="WcRcsPkU"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=k2fUuIYccYsmi5lYkKS+qYpEJ6ewtxT7Fpl71LhD4wU=; t=1724260322;
	x=1724692322; b=WcRcsPkUT2G4Oq674chlnCSMybiO1szF71ds0lZEoeK1fy+T4uKZPl9dyQ2ej
	+a8/jVIzKWzTr11EnUKYtYOnLByS/LYPAqDZkIyHgXZ5VSEk/+b9Iz8Y64VQm0qcP5UdWHwcgsIzd
	+V6F1Dj19isrUkUM7QaWmHxstMDB8G+24/mkydI58gnr6cPmYRfD85AQW4Piaboe0Fdgh74NTPat4
	z0j3WQYnvycjSCjelg39ndmEbK1QtXhFM+hs20pytegMgVvRWA+sZv+Kz03g+u+VWH/8xrTqyzqBB
	N4dBmd+iEJ6jMNfOQk/Cumc6rx1ZfgNW46r27YmSnq9i1F5DnA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sgosE-0002yF-P6; Wed, 21 Aug 2024 19:11:54 +0200
Message-ID: <8320382d-2463-469b-97c6-ae7836143fec@leemhuis.info>
Date: Wed, 21 Aug 2024 19:11:54 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1724260322;7281f891;
X-HE-SMSGID: 1sgosE-0002yF-P6



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/CAH2r5ms_RiykdukHNefZO2GciuDcLvW6wFhPS37jnrpMtpqYJQ@mail.gmail.com/
#regzbot introduced: e3786b29c54cdae3
#regzbot summary: xfstest generic/125 and generic/210 detected problems
#regzbot duplicate:
https://lore.kernel.org/all/CAH2r5mvXE9kKEFfEpsf3AA0s8oVA8737aLZ2LkOrz1hptujt2A@mail.gmail.com/

#regzbot report:
https://lore.kernel.org/all/CA+Y=x3n+X6PDza5KAG2fy2wLh0-w5mWQtvKbWvT3E3A0r_makg@mail.gmail.com/
#regzbot introduced: f9d8c5c7855d
#regzbot summary: drm: amdgpu: boot hang if firmware is too old

#regzbot report:
https://lore.kernel.org/all/CAAMcf8Dts3=6CxNCLZBvXsdFHpaOs9mL2NJ8TMPU5+duray6-g@mail.gmail.com/
#regzbot introduced: 29d8101fb944254407
#regzbot summary: pinctrl: rockchip: SPI bus stopped working
#regzbot fix: pinctrl: rockchip: correct RK3328 iomux width flag for
GPIO2-B pins
#regzbot monitor:
https://lore.kernel.org/linux-rockchip/20240709105428.1176375-1-i@eh5.me/



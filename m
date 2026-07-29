Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C913B42FD
	for <regressions@lists.linux.dev>; Wed, 29 Jul 2026 07:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.244.194.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785308574; cv=none; b=uPCU2Q2GpDO9YrdOTuPzPMGlZwaaaVl3HjiiE3hqvKJY2UOhtRdvv7cTdIwoKxjfj3YIr5BuEh3e+x1dt/joK+b1tuXCRjo5lv3QqqVOX6/3QBnQt5PpswZWP3a2s6lkYxXmCtIegcIENc3JKoIXfga/s4HUsoqpYAZemHgvva4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785308574; c=relaxed/simple;
	bh=g2sHXjKa7KwXHGkR+LkBPoO8KLuH2GU0L/VTmx2HxYI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Af07t8Jz2101swy4rvyd6ziYngnuZB59UBFxJeRU52Pdv+Dv9hiUEjP/XXg/vhPlqaGBsq4241P3/M9BTdfOsf3IP4V/s5048r3vmAdcIg1VT7jcw+W9UpHscl30ZQqQ1gF3kIGLXfnCGEMdkj99vnrdGvCSuIvtuwToyVaogMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=l2VI2+c9; arc=none smtp.client-ip=185.244.194.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="l2VI2+c9"
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4h932d1nXTz95Rb
	for <regressions@lists.linux.dev>; Wed, 29 Jul 2026 08:53:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1785308025;
	bh=g2sHXjKa7KwXHGkR+LkBPoO8KLuH2GU0L/VTmx2HxYI=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=l2VI2+c9ebK+u/yV1fWpBdOChepmhBiW9Oj1wryeMrHLXdvzsgtf2r65+7IWh9o8P
	 5yk0w0jI42QrBai7rCB1J9vBd7QnQ7DPSjmy5f/5i1rHLbEIzvUg5cPKDZEJF2uoeJ
	 CaoFc1ZwoqIcgFAAUqIfgDdnQhVlKDoivpsewMbf2mr8yUt3l8QZ91UnEoSVfJpG0X
	 omJalABIk0Ks82vOSXGL0mUXwxTnokrWlgsLrPBorLx57ywyjFdfKxeIDN2DPLoPe9
	 mVBSjaAcVri3ash44WE26ImvbGXXhsfviWLVbLxhVrzAg802LEdkoCAIFb0E4KE7XN
	 jfMU7OVwplK0g==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4h932d16sCz81kZ
	for <regressions@lists.linux.dev>; Wed, 29 Jul 2026 08:53:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4h932b3SG8z8tY3
	for <regressions@lists.linux.dev>; Wed, 29 Jul 2026 08:53:43 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id E81655FC31
	for <regressions@lists.linux.dev>; Wed, 29 Jul 2026 08:53:42 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <348b4528-0b6c-47f9-ace5-33f05d945388@leemhuis.info>
Date: Wed, 29 Jul 2026 08:53:41 +0200
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
Content-Language: de-DE, en-US
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178530802314.3723215.7278616166773057349@mxe9fb.netcup.net>
X-NC-CID: R8n0u+PNeHxo37vCYbG8BDRBtJcDkL7SZ2W52zvX+AcnPHSMb8g=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/42607fa4-485d-4142-b31c-7bfac71118d2@adamthiede.com/
#regzbot fix: drm/mediatek: mtk_dsi: Enable HS clock only at pre-enable
#regzbot monitor:
https://lore.kernel.org/all/20260728153145.578404-1-angelogioacchino.delregno@collabora.com/

#regzbot report:
https://lore.kernel.org/all/OS3PR01MB8827AC846F82A406D22E3FB7DECB2@OS3PR01MB8827.jpnprd01.prod.outlook.com/
#regzbot introduced: a23812004228d4
#regzbot title: ALSA: usb-audio: S3 resume broke

#regzbot report:
https://lore.kernel.org/linux-arm-kernel/20260619204832.586079-1-dan@reactivated.net/
#regzbot fix: arm64: dts: broadcom: bcm2712: Remove non-functional EL2
virtual timer
#regzbot monitor:
https://lore.kernel.org/all/20260716-bcm2712-el2-v2-1-e708f7fb42fa@reactivated.net/
#regzbot dup: https://bugzilla.kernel.org/show_bug.cgi?id=221802


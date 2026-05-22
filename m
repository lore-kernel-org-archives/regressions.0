Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [194.59.206.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5693D413F
	for <regressions@lists.linux.dev>; Fri, 22 May 2026 11:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.59.206.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779447858; cv=none; b=OmW+S24CMZLKBeV0kc11XoWe0kaD8cnGpqkDthQc/5UoXOtlRpgjyTgwnc0mlRKpCEeh39Fi125Uhwes/Ov3vqcI3H/MkFPkb9RV39bZZjQgkdM8LVAgaXFFsbKCR68nUon11Zt/B7q30Xw53YwaQO1JBw9gSqEfWk//sbvR+gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779447858; c=relaxed/simple;
	bh=gNf36wWfHzieEv6zuksBvP2L2bY/V0h4U138RFyt2V0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=mF5yPFjW+rZiayYDfbiFx/jk+4DY96ZuQ4xgMe6NcyrPSg7ue9Lg4F3Vr9I9movXw0iz/yg+IuMMK87JH0whX8uQYZ9YbmfS9Zx07ASVaxMeyfartHd6hZgaEG/KwrG53OEvOYdAj0tMTqz5duqo66oHZmivtdannl4CRFTeQY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=XGdkAj0u; arc=none smtp.client-ip=194.59.206.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="XGdkAj0u"
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4gMMps0nQZz49nr
	for <regressions@lists.linux.dev>; Fri, 22 May 2026 13:04:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1779447845;
	bh=gNf36wWfHzieEv6zuksBvP2L2bY/V0h4U138RFyt2V0=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=XGdkAj0unq+fG+RjjgvSC61odTHgdl0j4kkDBvGuqUbwB0NnE7ljCLOoGKV3YW/3f
	 SYvdKQOWDCRgg9mzaAOIKvat4X6Bb4UNEklaRe3wgYuPUL7o2SHVipltsIwcD1QA7g
	 sO7k4SzMVujQ6tSWZYHAIN6MvyC3LLFM0liRmeJKhmKWmo63mN89ssFmcphyF+drlt
	 ioXPl6vmTw4Iax3jZ3ye+sCq4FXtKSa0A2MgZuBzN/ChijjXzlZnQBh7ErdoeKrDQ/
	 01mR6N5IuX41fuxYaA4a95zZC8RF5YOdYiJhu8hpAuW9gzmu8md/zJy9lox50k6NxO
	 zBNAXb73+b5Xg==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4gMMp36ZXzz7wBW
	for <regressions@lists.linux.dev>; Fri, 22 May 2026 13:03:23 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4gMMp14grtz8t3w
	for <regressions@lists.linux.dev>; Fri, 22 May 2026 13:03:21 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id B8A9D60355
	for <regressions@lists.linux.dev>; Fri, 22 May 2026 13:03:20 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <7f9164f1-55e5-495d-a50f-60632b672a42@leemhuis.info>
Date: Fri, 22 May 2026 13:03:19 +0200
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
X-PPP-Message-ID: <177944780092.4032159.1284972101393542217@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: B8A9D60355
X-NC-CID: IExZIJdsT61Xrp/p5lHizkh4bZbSUPeCfqO3IUEadtJIIEZAFbs=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/16043
#regzbot fix: Revert "drm/i915/backlight: Remove try_vesa_interface"

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5319
#regzbot introduced: 75c151ceaacf5c
#regzbot title: accel/amdxdna: AMD PMC causes hard hang on s2idle suspend
#regzbot fix accel/amdxdna: Block running when IOMMU is off
#regzbot monitor
https://lore.kernel.org/all/20260520223531.1403302-1-lizhi.hou@amd.com/

Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95E34CC265
	for <regressions@lists.linux.dev>; Tue,  8 Sep 2026 13:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873784; cv=none; b=FnNqLpKU3XxF33km5BnbvIAY0TnHk9Dd2L1OPqxxXQXRF4BcGFhdodd7JBayTWFjaloIvBFA56zy+Mxy8FqNLGoeA2FoHB3feYlt8Fvle6OSsTx9qnRRDov1JNst/1n/k6AcUNhoCkdbHXXQMgMS+bLRglQkipaRE+myWBG6s4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873784; c=relaxed/simple;
	bh=lPYb7zf0g8a4l1yeUuEq8bVPLhwSBKDIm8Jl8wXL4S4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=ZLAp2JDNGnH3G/HWXV6odq4RBLm4wfZ+ZvNbTPM2fMoxj7ERydCoQ3Xt+R6dYhGrbhXiPnKSzVk1KAjkUqgUeJmG2czyXCGOGUCv+RjexchhhrwNPImu1nz3F27Un/rhIrW+0v7lhTjUGsTpNm4CTiFRmpl8aIP+3sD/TADwHqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=jAkR9oQp; arc=none smtp.client-ip=188.68.63.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="jAkR9oQp"
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4hfPkY3f05z4H9t
	for <regressions@lists.linux.dev>; Tue,  8 Sep 2026 15:22:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1788873765;
	bh=lPYb7zf0g8a4l1yeUuEq8bVPLhwSBKDIm8Jl8wXL4S4=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=jAkR9oQp/FmDm8UqLFX8DVTpGJGdFuYXR3pgyYqBKkyl+L+Yi55z3slSpsEX6aFLE
	 pZRyP7Ol+an9J+OmCm5t5yixDMs1a/DtspkyrAHye+wfoR7tMhaSXZtU4qCOAvf9LE
	 wMW6kU6VthYqOmsrZlJsJT9nQ9Sz8CaD1rtWpl/aDDrAoocSvqBiZYKgIbNpdL//Su
	 Tb/+sWPMSSL71HyepfzmGfnCSK47OcbKT/tAra3sQ8Ehf9YvTPnMS8Yc5uCC/8yOz/
	 uoBukSaB/+EXqyH+BySR8vDb2DJk2cpyszkBDPajv5Re12tjrO6OyfmkTyyep5OXBG
	 ig2o+roGwx/Rw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4hfPkY2xfLz4GjH
	for <regressions@lists.linux.dev>; Tue,  8 Sep 2026 15:22:45 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hfPkY17Sjz8tKy
	for <regressions@lists.linux.dev>; Tue,  8 Sep 2026 15:22:44 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 59EFE5FA44
	for <regressions@lists.linux.dev>; Tue,  8 Sep 2026 15:22:38 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <18127a7f-0426-451b-b3dc-20092de73246@leemhuis.info>
Date: Tue, 8 Sep 2026 15:22:37 +0200
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
X-PPP-Message-ID: 
 <178887375856.2422937.17955705719856539705@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 59EFE5FA44
X-NC-CID: kC0dGppJZQhQ8LksOH7uRriOCH4+DBlyeHSh3YREqNREBoOuv00=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://lore.kernel.org/all/apgeBNSiP01YfNcs@google.com/
#regzbot introduced: 5a8b2cc36e796d
#regzbot title: interconnect: qcom: x1e80100: Lenovo IdeaCenter Mini X
stopped booting

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5760
#regzbot introduced: 7e5760f084d06ca57e46e4dbf7ef08f03f857be8
#regzbot title: drm: amdgpu: saturation control stopped working on TV
connected via HDMI

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5777
#regzbot introduced: 7e5760f084d06ca57e46e4dbf7ef08f03f857be8
#regzbot title: drm: amdgpu: External HDMI display briefly goes black
during video playback on Linux 7.2.x

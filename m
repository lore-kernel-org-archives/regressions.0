Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7461C3318
	for <regressions@lists.linux.dev>; Sat,  6 Jun 2026 12:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780747911; cv=none; b=LpRQ3HuN7+bLsokBkeWbcbbal8uTYvWj5+95Dmca6cn8lbKbqudueogRw7FNAkwkdB87M6fkvqQq+koCNOKcCBKWoHWj7peCVIUapyt8AyBa2uijyUV6VGQYnpzNZeBaU2kiLe3zMmadZa4JbZTmR4PO6zLlRTJ2Yw2VNiwH1d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780747911; c=relaxed/simple;
	bh=HCcZashi+hb9YN97gVDSQpOQ1FXGBIKe2JlfkuynmZQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=qf7KkLj2FwQvGUGDbLZhr9yI6zZYGphWL6NBh4IsLN6Ak++zbriGfU++eax9ugT+oRKJNsBaFaGPKQxi/K9Mmlsf5hbIRzRjBIKkpxxnCVcXHkbbVq3tKP8rdZn/xy+khLsyZ7z1ESigy9ishwkdZXEKcMFPjXIq2MT7+bnzQ6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=fGUdtqFP; arc=none smtp.client-ip=188.68.63.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="fGUdtqFP"
Received: from mors-relay8203.netcup.net (localhost [127.0.0.1])
	by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4gXcNm3ttxz8cSD
	for <regressions@lists.linux.dev>; Sat,  6 Jun 2026 12:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1780747320;
	bh=HCcZashi+hb9YN97gVDSQpOQ1FXGBIKe2JlfkuynmZQ=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=fGUdtqFP7Xlpz7HLg1uB4wLhUMtbnZdmw1T/wbHsSxMXaFDf++AC7B8XVz/fVMLcf
	 IIy8CjZ/FWpSm3ogb08QVzAD89qLT8Faia9GOpEy9aCk1xRf10blY4DvjHLmu6/Hj2
	 psRIajZavrA5SuHQAFDYpWCXEmtc+iivk/2qhiOjt+Zu/wmNc64Fg3dEodVO+ONAyx
	 Sofo4yI5I43mqkDD/PDbkTjIC3sdSKujcKij2jje3RiUd2Z24f1Te2fL2LP+OddZo7
	 fbOC7P0FuNwrydB1aOs+U2aSyBOJBaqK0k2c2GsBY0fNgoR7y5bk99nw7up0DDKKhm
	 tovSk7b59hlTQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4gXcNm39pJz8cRW
	for <regressions@lists.linux.dev>; Sat,  6 Jun 2026 12:02:00 +0000 (UTC)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4gXcNm1SGwz8sb8
	for <regressions@lists.linux.dev>; Sat,  6 Jun 2026 14:02:00 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 382266172A
	for <regressions@lists.linux.dev>; Sat,  6 Jun 2026 14:01:59 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <a42ecb48-0cfd-46c5-89d3-46cfcaf85f88@leemhuis.info>
Date: Sat, 6 Jun 2026 14:01:53 +0200
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
X-PPP-Message-ID: <178074731940.998252.7046812776796034124@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 382266172A
X-NC-CID: MeOYKaHs+ETMgMU4kdwWxZxzIqBY9oZ0S8uVRaRTliuAWMZ/enA=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/issues/5286
#regzbot unmonitor:
https://lore.kernel.org/amd-gfx/44069eb146824aa195312f5b02c49287@valvesoftware.com/

#regzbot report:
https://lore.kernel.org/all/CAHLWS5FJCx66GQ-O10pu%2BnEudEo_QgQAM9vt76T7vT0zGPPC1g@mail.gmail.com/
#regzbot fix: aa2f4addab44407c7aa742321de5dc1914ab5762



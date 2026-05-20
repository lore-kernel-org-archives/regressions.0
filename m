Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61ADF25742F
	for <regressions@lists.linux.dev>; Wed, 20 May 2026 09:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.244.194.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779269326; cv=none; b=aGGpJTinbfdfa5PasKmmBYm+w3k6cQG/trMztB6ULMRdQvEVtHMkoV4k3C4zxOqUqprL+nIMTflSGf9e6LUxjN4spuuazweFtdv+DtWCd8MgIC20rxh0HqxGvQNeClQ3I2fezwvmQ9q/H0T6lK45k1Isrp2dcTdDLz1qlhij4SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779269326; c=relaxed/simple;
	bh=rKmYikphpPSeJKpiA/WqUkYDxrQobhiNt/XQ6aYdC/s=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=LsiB1jUrJ+GdNPPlCArzup8nvloGQUR/RZ3iPLQPKx04uy/KBOQaVMaaX7+e+D9Hydl97LrgoxYirV2dVEFTzJo+9deXeh3N9uTvDbPLuVDcMXUArLsQ0Z3yfpJt3p8CyITuOaCprOb21AYVrWrMLLEPA988UnCjMUea9hhA7l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=TubMsasz; arc=none smtp.client-ip=185.244.194.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="TubMsasz"
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4gL5nd2vDvz973H
	for <regressions@lists.linux.dev>; Wed, 20 May 2026 11:28:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1779269317;
	bh=rKmYikphpPSeJKpiA/WqUkYDxrQobhiNt/XQ6aYdC/s=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=TubMsaszd5yUWpBJIKwzT+7kjA9GUMtuqtxSjRggr5o4YoaOZ2SUzJU60sSir+YaA
	 xHx6ilbTTHD+oF504GQYrWPn4JKVv1dgHu/cOtKU3j2AVBqBqNjihd95asq3PjRNI0
	 eXG9FOauqkTru6ltQLIPHMyH0lmWpxuuPzsltFDnmsNWzgIFZc8bv9hlQsUgRErDY5
	 KtL/7iRyZ6iLkyXNuQfRRRvIV/tKhlmyItFp8UFdFDWOuw6hNqtRTV0XZ9orBSQ8wz
	 haf1qMiCUHudzo9qXegGE5fmtdrBC/hWdy+vHjGwnOX3Q8GVV8dnXgL/vlaMNiG+/f
	 /2aT82bvgUWgQ==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4gL5nd2CVcz7wyx
	for <regressions@lists.linux.dev>; Wed, 20 May 2026 11:28:37 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4gL5nc3d0Bz8t3w
	for <regressions@lists.linux.dev>; Wed, 20 May 2026 11:28:36 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id C9EE56031E
	for <regressions@lists.linux.dev>; Wed, 20 May 2026 11:28:35 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <4b1a6c5e-8db9-49d8-b1dc-537b0ae90957@leemhuis.info>
Date: Wed, 20 May 2026 11:28:35 +0200
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
X-PPP-Message-ID: <177926931598.327675.988988115598780071@mxe9fb.netcup.net>
X-NC-CID: mDKMtHOu64lqvU2uEQh1BgQuCwzk4gA+Jo/Ht0D40OOkqVPF1qE=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/539202f5-43ba-4938-a9b2-393c1bb3e072@westermo.com/
#regzbot introduced: c378cdae463696
#regzbot title: usbnet: no longer possible to set an MTU of 1504
#regzbot fix: qmi_wwan: allow max_mtu above hard_mtu to control rx_urb_size

#regzbot report: https://lore.kernel.org/all/agvqqMt9x0df-WXS@google.com/
#regzbot introduced: e613904fa419
#regzbot title: usb: typec: ucsi: laptop does not enter suspend anymore

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/issues/5286
#regzbot monitor:
https://lore.kernel.org/all/44069eb146824aa195312f5b02c49287@valvesoftware.com/

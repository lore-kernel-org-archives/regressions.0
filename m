Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [194.59.206.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BA52FD7C3
	for <regressions@lists.linux.dev>; Mon,  2 Mar 2026 16:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.59.206.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772468591; cv=none; b=JUAb0EnQjXLTPj2X5ZOmUX3Bfqu9edfVULBmdjAx9o0370QcADcjVKxMU/I4N2AxeRHIk9vNvHNFKvwgCNd2Ewa1wRgS+uaCnqKmmz3fw+rw4g+Nj9NRD9GCPGyXl1gkvcdWKxHV1iahTtnVFor5KOVk0UmQ+s9/qFw6XBGlcKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772468591; c=relaxed/simple;
	bh=AAGRkDREzlqZf1zemWq94G6qdINguXFR35I/ybo8HM4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=EbVNforwd2wn+Vykptxh197a9Xh6AAy6m2kABr+HKOFayzpXLUr7xJvYC4l/EMILaFESF0ngBbO9ciho9XA/1U+VoPx0gwTpAiHcTn8WftX0hT9aczx3us41A8bi9QLClqt/SeXjng/z6I3E9He1N6AXGewlV09e3eAwAkzzVbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=d2Wdsazf; arc=none smtp.client-ip=194.59.206.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="d2Wdsazf"
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4fPkjM4BkNz44H3
	for <regressions@lists.linux.dev>; Mon,  2 Mar 2026 17:22:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1772468535;
	bh=AAGRkDREzlqZf1zemWq94G6qdINguXFR35I/ybo8HM4=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=d2Wdsazfx6pj7JFbxqdQ4LK4WpbNFhRZqtD2sSAsJvGG0FgQjasS24EM8wbUvG27t
	 4SKPG1IjoyzcT7E2yXzJTReB51KNbyu1LF4vC/urPo3QP77g0khLw/YvjXvRfsWFR2
	 wspzFfGL6gnjkfljKqTX84nNtAd1A5AHuqGvZW1ZFD89TqLWqKTYzN/UvLDulefbdz
	 bzfqDn6PBRV7Zsjedjea+L1uFINV4Fef9ZOdKPLwVy0jTQ/bbkJ7feOEViZA4ryAUM
	 33+YdTihtsQQCoMiLuRX6bGdCoaoU8I/G8VueAbjrB7YOfyML26gYeJZEzq6+LgyFt
	 gZzbAwwQ8kd3g==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4fPkjM3WLpz7wDF
	for <regressions@lists.linux.dev>; Mon,  2 Mar 2026 17:22:15 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4fPkjM1TZqz8sgT
	for <regressions@lists.linux.dev>; Mon,  2 Mar 2026 17:22:15 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 9D9B5632CF
	for <regressions@lists.linux.dev>; Mon,  2 Mar 2026 17:22:14 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <192d8584-39a9-4a63-af17-1f42db093174@leemhuis.info>
Date: Mon, 2 Mar 2026 17:22:14 +0100
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
X-PPP-Message-ID: <177246853480.49837.17375356298527217579@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 9D9B5632CF
X-NC-CID: N6/zNCX0mi+KvYS0as7RYFvQI5YNIf7bNKpiNsaL1TyQhytLDAs=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=221120
#regzbot introduced: 6c3ea155e5ee3e56606233acde8309afda66d483
#regzbot title: Bluetooth: L2CAP: headphones stop connecting properly
#regzbot dup:
https://lore.kernel.org/all/20260301233619.1807980-1-joanbrugueram@gmail.com/



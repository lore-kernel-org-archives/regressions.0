Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792733233;
	b=kn6gYJbfpcZOkZlIlr8cTA08MqqDM8J+ZbSvGd60wHBE2BXRz08j9HYVrGTxpvVjkfS3
	 RnXyynTfbsKBJdS3B52bQKzcJ10ALNGgi4Qt4buAKDBTAYrv3n4uQLqL7CIVsxlayYIOt
	 tb2lugbGjV+r6CawgDz7TTLriZB95PitQvxgV+EGffmCUEdbMFD0SB0Uu71DSgIr4+LMG
	 cH+Wc1WX9f55mcokuCIvyuWZO9Z0qewb3aEZm1s17U9KHhferdc+br036Hu6xP30FlmvL
	 oJmTRk3TmolwJeCFkjkedwJujHQSoL+l40N/4QpSYEvEE6Mjs3/QbjNmBHB5pX/76rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792733233;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-NC-CID;
	bh=FFUTR/JA6nAa1DpBBH0pFXJ+C6Keo/R5QzSW57SkZMk=;
	b=vGd2rT9GKk76gobFPe7dJrlY/SIlBX8Ess++H8u+l/O7zr7lcBVBPsPkUWOEd4idXpRF
	 9zeuQ8Wpaiex2Z0PJ7OwmKalL7bgzwH8xGI+T93bSjnmoodaRcrCLlFyNxU40gqelDskQ
	 AXCJjMinLNJJtebZltL/3pXTZkAMg4Wp3Batgm92N8qtF98iZYL3uIpBcDX9Xupx2cHCe
	 imyhho9Rp15MQ56tHNOCaK3nDf+fFcgLBuWx7bFXRwHspGIzohgtqPNnfp+B7uzyZPcq4
	 d4XCkJG7QZoodZlfYNHy9/dxP81dc4iYwlLX84QidSzImLnt/16rJYeBV5aeXeeoZPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=MuqsX4PF;
	arc=none smtp.remote-ip=188.68.63.102
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA1B606A319
	for <regressions@lists.linux.dev>; Fri, 23 Oct 2026 05:27:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAA1B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=MuqsX4PF
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4j9s2v58DXz6cd5;
	Fri, 23 Oct 2026 07:27:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1792733223;
	bh=FFUTR/JA6nAa1DpBBH0pFXJ+C6Keo/R5QzSW57SkZMk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MuqsX4PFwQXqBG0Wk9Mz828hFF6X/uvZeErrus+KJkzXQ/YvmoraBiozCTH9BwoS7
	 F32MI5t860bAQgt57h99lhzRNE+fPm/l7/qDZbKwC4ebxjT9R8VkCQ5Ho22IDq+glx
	 X1+SafED5Cxvp50rdXYxxla2qXDNoVNOWq1v/b1is/EaS5mAMp8+ELJ1VYYLyhMdKE
	 ZaJUs3/UMKgPrfAreaMUmnHGrHK2HHgPW+0ejWQf6yGZjHBFcnTY4lvhv0uXp+OykX
	 LsWUqzYvKBSPMTZ4Znd29MtfSUCdv0YfU9svZoyiTy4P2fnc20wjjvHzXgFOksRVxK
	 s7BMWM5iKbmkQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4j9s2v4QHdz50Y9;
	Fri, 23 Oct 2026 07:27:03 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4j9s2v1SGnz8svH;
	Fri, 23 Oct 2026 07:27:02 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 40E305F878;
	Fri, 23 Oct 2026 07:26:54 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <31e74b63-54d2-45db-87f3-9a08bfce268e@leemhuis.info>
Date: Fri, 23 Oct 2026 07:26:53 +0200
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] 6.18.57: ACPI fixed power button no longer bound,
 ACPI power-off ignored
To: Frederic MARIE-JOSEPH <fredericmariejoseph@protonmail.com>,
 stable@vger.kernel.org
Cc: linux-acpi@vger.kernel.org, regressions@lists.linux.dev,
 "Rafael J . Wysocki" <rafael@kernel.org>, Sasha Levin <sashal@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20261022162655.231431-1-fredericmariejoseph@protonmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <20261022162655.231431-1-fredericmariejoseph@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <179273321459.850766.16824659496419507410@mxe9fb.netcup.net>
X-NC-CID: BLHMncqpqSLzrB7TkDKTD6DdXRXx6yiU8+tfw8iYBmy67w7Jqfc=

On 10/22/26 18:26, Frederic MARIE-JOSEPH wrote:
>
> Since 6.18.57, a machine whose FADT describes a fixed-hardware power
> button (QEMU's q35 machine, so Incus and other QEMU virtual machines)
> ignores an ACPI power-off request.
> [...]
> #regzbot introduced: 38c79dacc8063ff8a0d75ce2a900fbaff82ad94c


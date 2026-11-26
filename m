Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.38.247.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795671776;
	b=JwHV3jIN3OpuYrBI4Xbl3ysb4/Lj9z2H7UHR/J94RuulvTHCu4GlqidoS8lWl31XwIy9
	 DTOCMqRTL2N+AQ53a2O1j8UbOoOJfuWWPv+0BTZTECYP8WfIaRjc78IJ4CSnTl7MImMTZ
	 enkLGKknvOGShrBwjudh9QRhCp2uXs+uTMDMH0ht1f1xRdtNZix9NtHHtMkKKiRnqmi3t
	 nm47MgamQHYmYqEoqAableS/wi/yLZKAVLTK4K81C7Ew9KoPsvpfPFbWdgMr950eaXhUY
	 zIu9wUPnf2aduvPE4NSd5HgLZ4j/OU5wMGRFxBpHAUG7Cb1ys7BqzxjtndgUkrCBCYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795671776;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:
	 References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=8yI56gzt8OnIdw2HHO5E7LDtrMxFYlb5HVLE5/PCIIw=;
	b=ts4JvXXc6xdGmDan0sxjRJ62yMY7XTj2DwncvXd4jeWkSBCKhn3xr4peP+zMSSstq1hQ
	 4kS2g4GZ6w4Il0EkaEzHKpUJI30Ec3aWwZId/MElIG2D2yMgLpivs4F1Y4UvH/62E26+h
	 9h/Cu2LBybMl3zOh0HABgE0Hcoalxl2+rAeXY269KwlaVL5e/kg4z3WATAEDQQVCeieNC
	 LA+3i4Lh2QXKkoECTKzsY5NDstbh99O9U2R7H6/+MCjj/Zz2JSmbL2f/YuHxPd1q32h2p
	 Hi+wAVDACGUsuhLnjtsFjEIscGtToh8rDQiW7e1on4LT8haay0ZUiOl0y2c0BDZWgdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=bUkE1MjS;
	arc=none smtp.remote-ip=46.38.247.119
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [46.38.247.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7E3606A31C
	for <regressions@lists.linux.dev>; Thu, 26 Nov 2026 05:42:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA7E3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=bUkE1MjS
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4jZlmb2TxQz846t
	for <regressions@lists.linux.dev>; Thu, 26 Nov 2026 06:42:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1795671727;
	bh=8yI56gzt8OnIdw2HHO5E7LDtrMxFYlb5HVLE5/PCIIw=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=bUkE1MjSKpbBGscSgAZ/CG/+etR9rcDJwnoDzqZQ/ybZYARSZdn/NaVKHpKs4eprx
	 GQuNH08ZvG0pLDlh0HFf8+RigAxX28ovK+cR8iANmfVYWCCZPwR4vbpNKJWJU7BQ9l
	 eO5l3UJPrZ8gIcI/4e9ecBYGygarK5JKP7UiG80HYpaeWTgSceOyBJPlfdZe2qM1xF
	 KWYxbxrjerbpAoDgcOx+383Q2Sy0OIL6MPLwXF3vlwrzh/SblqlUe9w6dkIWxX8z0q
	 slqEqdCgYYsFlvSUilzQq6neCSbtpiUMX+S1/WrfDW+odGOIeCQ+JncqxDFB1Iqu/b
	 WLJR/AgXqogYw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4jZlmP0ZTRz50ZG
	for <regressions@lists.linux.dev>; Thu, 26 Nov 2026 06:41:57 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jZlmN69FTz8svJ
	for <regressions@lists.linux.dev>; Thu, 26 Nov 2026 06:41:56 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 415DD5F8EB
	for <regressions@lists.linux.dev>; Thu, 26 Nov 2026 06:41:52 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <8d658efc-f3a7-43d2-b860-9b1f04c2a9ce@leemhuis.info>
Date: Thu, 26 Nov 2026 06:41:50 +0100
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
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <179567171242.1153052.8762442698005993052@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 415DD5F8EB
X-NC-CID: g5BR12HIvpGZB/9jqAxzCTLVWo7eNrggO/xOk50iBxb8Ly5tgmA=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/CY5P221MB09262B7D6A68954CC1B3199FBD442@CY5P221MB0926.NAMP221.PROD.OUTLOOK.COM/
#regzbot dup:
https://lore.kernel.org/all/20261113153157.2495664-1-usama.arif@linux.dev/

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5283
#regzbot introduced: 57c31e6d620f
#regzbot title: ACPI: laptops fails to sleep
#regzbot fix: ACPI: button: Disable default lid wakeup on MSI MS-15FK

#regzbot report:
https://lore.kernel.org/all/CACKiatc1Bj2et4kcXDJiYx28XXxoo6iHPc9nYt3GhTCxUmdnsA@mail.gmail.com/
#regzbot introduced: v7.3.3..7.3.4
#regzbot title: Creative Sound Blaster X3 (041e:3264) fails USB audio probe

#regzbot report:
https://lore.kernel.org/all/20261126031625.166614-1-kaynak.oguzhan0@gmail.com/
#regzbot fix: ntb: ntb_tool: accept hexadecimal addresses in
peer_mw_trans again

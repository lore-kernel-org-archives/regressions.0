Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.59.206.189
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794735590;
	b=El2tcqJy4qp7u8yeQAE5kviStdvSnZyLToDY7RCLNUGNGUWjBq+biYzWuItZUc2WbWNz
	 QXNwtDGIwryisSn1ZScaRO/oK6/J8z00oIhpx0RJL8kTtPCyibk76QpaVnsR7uy7ILPEl
	 IE4nayz3/+3jv1bR7pTtqGZEXW+WJb771gfAFvXQ17KJgzX86lzVF5Aw9I+h6fhEq8eKr
	 czRdz5FRIMd4jZ5M6xH5RITaFKNCZE8T3H2uAoK0Kw843KF7OkuLLeXFfhN9VjfzYMSWl
	 QelxtiEJa5Glko+lPwHvU8eAe1yqGv1YSdpfVjYat6j/GVjhPTLekHsSl0ivTb6/mIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794735590;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:
	 References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=z79sxvE+Vgyk2OWYsxzyNNvVPAH4aAhxAat5kw14sPg=;
	b=pznm/m/+y5USDWiYwV0B+zN11aQUMWSzGi6vRPWgaHNLCFJMcmtXHntbkwVrqk+0+sIB
	 0Bw3E8NTBk8KXWATH8EHNTmN5oGzwCxrwrCDRbC5W+8DtUGFLFcT1Ccc0DKsAYCL0Eg1g
	 YbTbd8cKQ+DvAcvxn/PkUvgUTXUNr11LgtBzpl3Zopbz1Nb1/K113HPmwlo1r8JRjC0sm
	 UncOd6A0f4K63CqJDRoEgvW76cWI3UkbnNktW8ejS6ykDcbV4gYSvbISqJqL6NkVSQGY1
	 FZLJn9H/JjJJhWdQRXyDlg2N691SxvZDFwL/HVr/7LqAITMJgivrBOG1VMrPwxFQLeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=fbESog+U;
	arc=none smtp.remote-ip=194.59.206.189
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [194.59.206.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDD1606A337
	for <regressions@lists.linux.dev>; Sun, 15 Nov 2026 09:39:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DDD1606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=fbESog+U
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4jS5X64NYkz4JFf
	for <regressions@lists.linux.dev>; Sun, 15 Nov 2026 10:38:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1794735494;
	bh=z79sxvE+Vgyk2OWYsxzyNNvVPAH4aAhxAat5kw14sPg=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=fbESog+U/6jnxkWUho80A2HqIoPVeKvZPcl0H/QghKFqdwAOWpsJU+Bi8HU56Auln
	 9A+2+D1+vUp/46Arm4v3ciLV1PqaVt4Wl43W3CuYf2OdYf3snY/NtsyvvtFE3ESQrd
	 qRC3DOEkUzO/+E0z7B4ABeNcmlmcVEZ10qh6Oa/5i3+hQgByYuTxilgTmilcGQmb0u
	 rv6KGjRKT+pzjm1sNKtX3HiwBbPtxr/nZF6xSRyVtaiLCdCoXYq3mLqWnrzNdpubzl
	 hAPfAyS7UdX58liWNh6loYKWBCLS8Yx/zeXosuSpukrde+NVxngz8Ywr8svPco8u97
	 7k43yN/v6NUvA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4jS5WG5V9Vz7x8p
	for <regressions@lists.linux.dev>; Sun, 15 Nov 2026 10:37:30 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jS5WG3xJQz8svY
	for <regressions@lists.linux.dev>; Sun, 15 Nov 2026 10:37:30 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id A36FC5F9C0
	for <regressions@lists.linux.dev>; Sun, 15 Nov 2026 10:37:23 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <9c823235-a27f-40ab-bf6d-6f04bdac6903@leemhuis.info>
Date: Sun, 15 Nov 2026 10:37:23 +0100
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
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <179473544386.675237.1875736224356167261@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: A36FC5F9C0
X-NC-CID: tdYDtTCt+ya79gZhRupeddC+Ec4GLlppA4AitcwyDsTHTwOUApk=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/20261010064407.11030-1-yiyu@yiyuzhou.io/
#regzbot fix: xhci: give back TDs and clean up ep0 after disconnect

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/6068
#regzbot introduced: 2332eaeb0b6cc5b0
#regzbot title: drm/amd/display: black screen on HDMI after Wayland
compositor modeset, fbcon works

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/6134
#regzbot introduced: eb5650d1f367722d0
#regzbot title: drm/amd/display: RX 7600 defaults to limited RGB range
(washed-out blacks) over HDMI

#regzbot report:
https://lore.kernel.org/all/CAJ6F8CFgkgksyk6YM3NdMkQNhSFWV4depC4c-mHvpDHpnjhM-Q@mail.gmail.com/
#regzbot introduced: be310476e886
#regzbot title: ntfs3: names containing ':' inaccessible since ADS
support is enabled by default



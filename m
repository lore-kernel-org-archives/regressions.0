Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.61.107
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596864;
	b=BRmhTHr+N6U8m94ncc5uBwi6U7avyOK3nJGcZe3z8vOr4677UKcVXZBp81nta1xyiI8I
	 spCj1Ce40yi5l9Qxj6kd6/VRbqxpvOheu81lutffZj8pwM+21OH5f91Ul5/N6pqq8Y3+c
	 j3FkfoTxSfUSYxHQ95qolpgR/H5mk4hPHARsqPWRF81t1DD/wdSTCJOX+K9rVOvA6XQvp
	 gN3dW1L7lN+/mTqwRQ3dlbc427GZxWRExtaf9pY8g8kK0dghkoUei+kBJD+RWss7v2QZ9
	 5xvrEef9tNxKJkz55UgG0WOGV/MNyA5EJRNWmcPFt+Xh36iRBQTtmhTXz17A06oqxCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596864;
	h=DMARC-Filter:Received:DKIM-Signature:Received:X-Virus-Scanned:
	 X-Spam-Flag:X-Spam-Score:X-Spam-Level:X-Spam-Status:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:
	 References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=8vLwgK9wa7DpAj0/kk/SXpyGhwoblQO5TwlNv+epV/A=;
	b=ULrMk5DCBfzGaYd1/NBxglpl+xlzmrQwDN40XZZL+GgETGdCiDDD0UkulxsTlB0534pT
	 oMszLzvjx86+nKmwfniy++PKJdE8Tv0Z2rxzrFjwAF6SZ0IBVw6M2g72TMDebWGS6ZaMJ
	 lmoHb6Z6kiMrHuYrCUhyYpL1uf/mi/mkWPniOKehS32uFr0EagLr7WdbbahVE3X0OXEZJ
	 3yRm5iKyxNQjntdWC5E1EI4oOkKbWdkjtxX/vd1qpbJHYyrtBk4zQ4Evfi0lbw0k90+S3
	 MAq0NfADw2UEJKG1Pu0kA0UVz4y/i3JU1kSW4Nk/eac07b3xh+xUvLDLAneIYJpOY7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b="G/ECfjQx";
	arc=none smtp.remote-ip=188.68.61.107
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C7E606A321
	for <regressions@lists.linux.dev>; Wed, 25 Nov 2026 08:54:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34C7E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=G/ECfjQx
Received: from mors-relay-8405.netcup.net (localhost [127.0.0.1])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4jZD4m027nz7Dp8
	for <regressions@lists.linux.dev>; Wed, 25 Nov 2026 09:54:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1795596856;
	bh=8vLwgK9wa7DpAj0/kk/SXpyGhwoblQO5TwlNv+epV/A=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=G/ECfjQxsoHIXqxKjelpmNYs9t2nkM/oloW1NqnbjQAUEUa/g/uoTZvOBJcdlUfXP
	 fBjc3lLxuJqzh7h01DZgEa+368+eWEKy3yxTRGBQ6f7MqLM3TJzoXj/8PKAItn7bL/
	 3dymbVxrzbam39bUuM7mHm3k9HTYlWp3UxbMxlmDuXXVR7OId3gTB2sAY5SSJ3m8jr
	 Y1OmxpjCZfMPlcufDrnC4qSPr0+dNw3MuIJ4qZRynv7z8yqv2NGryfEXIAA/2Umvrz
	 pFyylECOovw0/G1ZFvOj55cNBLFR7ZwGbNLy27OoiJ1ho9BDl5/S4J3SJmmqUTBXH9
	 DArNKp9zA4oIQ==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4jZD4l6SFJz7DnY
	for <regressions@lists.linux.dev>; Wed, 25 Nov 2026 09:54:15 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4jZD4l2yFgz8v4W
	for <regressions@lists.linux.dev>; Wed, 25 Nov 2026 09:54:15 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id E5F4E5FA03
	for <regressions@lists.linux.dev>; Wed, 25 Nov 2026 09:54:10 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <c0bfd05d-4d04-46dc-83d4-e146880c2808@leemhuis.info>
Date: Wed, 25 Nov 2026 09:54:09 +0100
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
X-PPP-Message-ID: 
 <179559685112.1391177.15513350625019719818@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: E5F4E5FA03
X-NC-CID: AWq8is/x/mSkHAtDrS/03UXdIn2LONi+9exR9eALP49V2gwE7bo=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/stable/awBIdxOJ4XSXuc7S@dp.vpn.hinterhof.net/
#regzbot fix: Revert "SUNRPC: Convert unwrap_priv_data() to use xdr_stream"

#regzbot report:
https://lore.kernel.org/dri-devel/20261121101350.bab69dff11a2@gmail.com/
#regzbot fix: drm/nouveau/devinit/gf100-: fix double vbios init checks



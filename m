Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793029244;
	b=NgAi5I7DUo8EGeSoUaP2D/VGLpT+iJidyKDcsTWeKcrr36rp2XmDoczXWuHSfcXPEHDg
	 cHibMwFkfhGOBnoglbNqAtWjytlcUsKrGd7sW6ssm71aJWkhtDe9UVKyErYbwgZ2Ovr/R
	 oxGSlPPWHHCpxxhcXeJirlqAqxV2l4bt4kJYI6JsemUKWMG1UdwWqh+K5ki0VllRlIOiV
	 +cuuS1xW/8Ps1Bwbd00A2ImZWc38ysLXFUb0HPBY14tf1z8WfaSdReP9SdlXaVIwdAB2z
	 EejmUZ/f341Lyn3oTo1mHEFZRKcnWlKzHtfzceZm0I5FBnGg0QFLN9Ah2LEP+smKoog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793029244;
	h=DMARC-Filter:Received:DKIM-Signature:Received:X-Virus-Scanned:
	 X-Spam-Flag:X-Spam-Score:X-Spam-Level:X-Spam-Status:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:
	 References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-NC-CID;
	bh=UY74pVumFUcIu3TDLGtHYRfZT00vz0s0VmVSvuQFeys=;
	b=ZlWitITBcTdYFO3GBobtTKsjOC0fcpT+7sHP4YumdBGAeRrDRkRdzmfLLmAM1OoeCnL7
	 TkwleBa1VrtTHvMI4Q18Aq7vFnr0eEhN4qJ8EWVctEACpakC4oYTdO+php7DuAWwzbl5j
	 v/XG3m/EzvwMggRCZV8eZgM8j4S+oy3uQrsmRXq6icQUmXdIjB/c6qx0ZLuhFr3vI/tKv
	 lda9rOzQ1oWklxs7V98FsAU8emUpFdSxhFex/i139Zws+S6ZpbHKNuyapF1B9Se+cG0CK
	 lFvcRvH6Uts6iBuEOJQQf+NVRqAjG4EtfWbqY3UB4nwDa2nIvl8fQJ6LnnI5yeEgaeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=O5bft0wy;
	arc=none smtp.remote-ip=188.68.63.166
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B59C606A31A
	for <regressions@lists.linux.dev>; Mon, 26 Oct 2026 15:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B59C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=O5bft0wy
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4jCyVL6z4Zz4Lw6
	for <regressions@lists.linux.dev>; Mon, 26 Oct 2026 16:39:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1793029179;
	bh=UY74pVumFUcIu3TDLGtHYRfZT00vz0s0VmVSvuQFeys=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=O5bft0wyvg/VK9qeH3JulfVBLY2ACfBsuRvm5Ny9vXM7D9X9uE2k8YMGyT+xYF6LO
	 3/5x1AHMuGA/GtJHBpm8ootjZ2QzgUapxSZt7vI7S0teTRz/FXNDfBwItXOX/Po5Yc
	 xHLAHwprKP/D3jTt3Y6j7H2lB/pyAVkT5e3crstGwPGgALiMOiOEtzhcJ/jOtOFtm/
	 6DRmv/2mi/pM1ioYKftis2RGzxyARf3+IGjedkSOms11M30rYW5re5pN/0ywu/mjDi
	 1vaon1ZDc5blUq53HP5rB+D4iQxwThNyyBbipxMkz8u7rk6jL3/merG7K3haZhJ9d+
	 hDNzsN4bBCG/A==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4jCyVL6GgMz4Lpq
	for <regressions@lists.linux.dev>; Mon, 26 Oct 2026 16:39:38 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4jCyVK1sc9z8tl7
	for <regressions@lists.linux.dev>; Mon, 26 Oct 2026 16:39:37 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id B878E5FA68
	for <regressions@lists.linux.dev>; Mon, 26 Oct 2026 16:39:25 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <a078246f-b034-44e7-9ce0-6beececce971@leemhuis.info>
Date: Mon, 26 Oct 2026 16:39:23 +0100
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
X-PPP-Message-ID: <179302916593.3229036.8271446806630758008@mxe9fb.netcup.net>
X-NC-CID: gHjBS+qN5k3llMgNz90DLrhhAwdcdfz3Gz0Rvl52XSaRef47Mr4=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/regressions/179267754360.302120.2153520610797426540@kernelci.org/
#regzbot introduced: e8b32e377951
#regzbot fix: KVM: riscv: Implement kvm_arch_pre_fault_allowed()

#regzbot report:
https://lore.kernel.org/regressions/179291154395.445511.11371466163163680530@kernelci.org/
#regzbot introduced: ec3598305a6

#regzbot report:
https://lore.kernel.org/regressions/178711194407.380.4108589457572337694@kernelci.org/
#regzbot resolve: inconclusive: seems it does not happen anymore

#regzbot report:
https://lore.kernel.org/linux-block/178789300872.392066.15963676631650361573@gmail.com/
#regzbot fix: 4fde4482251234

#regzbot report:
https://lore.kernel.org/lkml/E76BE609-83E4-4FB6-88B8-191F7816EFD6@gmail.com/
#regzbot fix: 96a494c9cfd8f4
#regzbot dup:
https://lore.kernel.org/all/20261004142724.3896396-1-stian@itx.no/

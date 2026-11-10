Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.59.206.189
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794290173;
	b=FzwtbB4HFPuqUDCLvo6MtqecZzW1YOpu6/0+ScCWTA104AystNjnMKnLS+rGLT3kfCx8
	 tx9Jt2T2aRVYVeCZkOq35Cze86I2wnPTT0qgJ9T/0EGNE/LIBXhGxM4y3ZjEFMnao9+9S
	 fIp6BZzQ++LzKpkx3Vgvk8ElFhfyua+r+WZ7VPeievpHUqsWuC7iT9pKfZ66uFeEhtCg/
	 E9pM2DhT99mpd5pUvx64+oJZAFal++xC4qYsHBD7EAnPnSOMrK2eRIxdFVvLZ4NiHlLSc
	 2GBGA745pwGRaubkCs1XDcnAo3LcsrD0TfRmRstL3M6AlfTWL7PjjHNqhLLRAIf21rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794290173;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=63bxhinSA2R/Xb/FF0131/Tc+27XMW7OZDduFq/Ys2g=;
	b=GNGBi/exvBACrSweSI/WjsxLe1MKttumIfqGk8LAeC+0QnkP+dCLPvyhMRJX9NFpZvCD
	 QxkQtXPn4Hq4QSqOuqljRtPNIFSll/9tdhToxfxZcXZmASXVAF4+DD3l82I0T9YTzdy6X
	 ykmARGU7hXHlu+AArS8Lldu7iNLrwZRPM+9/ELa2xcfoEgow13VdpHzooeIKNsUgIIHGE
	 Can1VkbZwJo3/MITe0fbPtK3eH5vMfYAEtqnNEr3ACQKHg8JaSHBXdIPo/QbG0AAcRXbj
	 YvOIUdeDStzzEuTh31ojL4fDsznwhKcN0AWYGfJ09qnDeDXVC2PtkZSj1IXRj39AwMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b="WVNTvB/B";
	arc=none smtp.remote-ip=194.59.206.189
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [194.59.206.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EC4606A321
	for <regressions@lists.linux.dev>; Tue, 10 Nov 2026 05:56:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78EC4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=WVNTvB/B
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4jNwr33j9Dz4Yp5;
	Tue, 10 Nov 2026 06:56:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1794290163;
	bh=9zetX0lFtb9e7/ArUZTBh93vaXsxhdfNlUMY3Ut1cFQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WVNTvB/BIfSyTkMxzlLvasBk38+f38vc7gqjHQ+l2cHged0xuV2E1sy/zO5c8+Q9q
	 sC2Vh1sOPPc3ks3dh5zrngqIdzYbhfKXQvsdIaxAgTgpWh3KSMyGhRexnuDyyzEFXQ
	 eRV91BoaPrlfi4sKwl+VAXaulz8SlXPBE0k/Ffof31NjQ6j8jFklJVX4N7A9pR4kt1
	 MHQ0Ip9qjtkxo2Z8YKB8JVwElc/viZ+Msll6yo0BRLfB7Cc8DaZjoddrvpllbfRbDQ
	 +fQzun88Izv+FVgym5T01Lmhf1EI66XrrmKRo1z3SMRyAfelLLI3b1IMcItjoiA/yk
	 aojnOzVd6+92A==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4jNwr330ygz7yVX;
	Tue, 10 Nov 2026 06:56:03 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jNwr25Dvyz8sgW;
	Tue, 10 Nov 2026 06:56:02 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id E833C5F960;
	Tue, 10 Nov 2026 06:55:57 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <8a0a9e63-54c2-4e5d-9479-1e39946328c4@leemhuis.info>
Date: Tue, 10 Nov 2026 06:55:56 +0100
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
Subject: Re: AW: [REGRESSION] x86/microcode: boot hangs bringing up first
 secondary CPU on i7-6700HQ, avoided by dis_ucode_ldr
To: Dario Ackermann <dario@darioackermann.ch>, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
Cc: x86@kernel.org, bp@alien8.de, tglx@kernel.org
References: <mw9nsyuj.70b4b79c-e987-49da-abe1-0164defd8d5a@darioackermann.ch>
 <630330232567670562275469.6204.202611921938@darioackermann.ch>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <630330232567670562275469.6204.202611921938@darioackermann.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <179429015829.352673.16248902851993282133@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: E833C5F960
X-NC-CID: tcx1u9fuo2718ZXXNpEtl5UOQVpLFsuPACVsfrlt8/lcFSiaucc=


On 11/9/26 22:09, Dario Ackermann wrote:
> I found two similar reports on ASUS N552V-series laptops with an Intel i7-6700HQ:

FWIW, the earlier report from Dario was here:
https://lore.kernel.org/all/581128204058725416570264.8152.2026119193410@darioackermann.ch/


> Ubuntu N552VW: the reporter tested upstream 6.4.0 as working and 6.5.0 as failing. Boot stopped at "smpboot: x86: Booting SMP configuration:", and dis_ucode_ldr allowed booting.
> https://askubuntu.com/questions/1512327/ubuntu-freezes-during-boot-when-using-linux-kernel-6-5-0
> 
> openSUSE N552V: the reporter says 6.1 works, newer kernels hang when Intel microcode is present, and dis_ucode_ldr allows booting.
> https://forums.opensuse.org/t/opensuse-tw-wont-boot-without-the-dis_ucode_ldr-parameter/175229
> 
> Commit 0c7ffa32dbd6 ("x86/smpboot/64: Implement arch_cpuhp_init_parallel_bringup() and enable it"), merged for 6.5, moved AP microcode loading from after the AP startup handshake to before it. This is a candidate cause, not yet confirmed by a bisect or patched-kernel boot test on my N552VX.
> https://git.kernel.org/linus/0c7ffa32dbd6b09a87fea4ad1de8b27145dfd9a6
> 
> I am preparing two upstream 6.18.55 boot images, one unmodified and one with the AP microcode call moved after the handshake, for a direct comparison and to work on a potential fix

FWIW, you really want to test with at least 7.3 or, which would way
better, latest mainline (7.4-rc2 or newer), as the bug might be fixed
there already. If not, some developer might come around with an idea to
debug it; if that doesn't work out, you most likely will need to bisect
the problem.

Ciao, Thorsten

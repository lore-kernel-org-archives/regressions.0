Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615317;
	b=vTAV0wjvVB8Mrs9PrXM3RXSVhnGNzFYCn7xdTexEvtgKif8OLwMJaWQ+FDDSwBkdVGbI
	 J4cD64C7GJCMMCxBYWMAzTR+q5ZqUdM/VLpomx7pQ/asKP2qCzONAQCPqC3VmdSoxhRf2
	 84GOmqFkbD6mmQHZTgul0OXt84q4Fa3FuP+oWWq36wKEhn7j5K37nOPRMjW1Pys3fmdVP
	 a1hccO472yLpbSo+5c5KCNmp9o8jgtmkP0OplR2lcrpAWjRZvfqjUYcgZTDl+ffM8jPCh
	 WU1CvGCiWG8XsHvh+QxLMkz9o3f0efK/Y7Z14ZYWx4rUyAIwE7yijIkU2ai9qw9GWEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615317;
	h=DMARC-Filter:Received:DKIM-Signature:Received:X-Virus-Scanned:
	 X-Spam-Flag:X-Spam-Score:X-Spam-Level:X-Spam-Status:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=xvCJBPZenVfqXsBZx5KRJCX0pfhC+BYCMbiy0O2sKDo=;
	b=E9+onz2T6KZnz3glsGDLfU77Wx6W+/2RXIklme3k+blWdtammeouNpb7VtLPKms9h18T
	 DsNoObkNLNZdVtp+bfSRQD8RFdZoDqHyxdHPajxDraXkISv7ERq0XM2sTsLDg9qMICLwd
	 LOy6r3RkgDIw9XwVO19eEfFX84S5p+kfLjK6mz8Cf3IMLm5pxQO2tHLAjvqlsV1424rbu
	 4bXu4FzKmwk4dLgTLjkv/C3dqeeQveX67LfLncyJcLkQDvbI25df0oTx8WJHscOP0wnmN
	 fixktGLwrBd789GQ6XUC4ly0RZLDaPRDKjOp9LRIqoZKJbjblBBzUUpvy3pipqF+r6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=XEqkdwmO;
	arc=none smtp.remote-ip=188.68.63.98
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D79A606A326;
	Mon,  2 Nov 2026 10:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D79A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=XEqkdwmO
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4jJ7G50zB5z6Kwn;
	Mon,  2 Nov 2026 11:28:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1793615309;
	bh=PBSoHz1TmN2IHfZWj0YkK0WlPPGEyTe8zg+zoWvVA/w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XEqkdwmOBP6JbrktFcz42jYphPtaMIJRhD1sc0mF6MI2eUkeXyXK3xaivp6OeXqHf
	 mOCQSpOEWP/faq8K9kGypvywUnIOkXQ2jL9c1kqFL3VZdeHgn72aconGmhG1ujcum4
	 gGip71iqPjxqpTVfFCZke/2uC8jrmjShPFkyCm+xXtatAjw9ryhe95KbKYQJlUopLE
	 0KbqjfMsDZSpGcA0BbWk2l2db5/ulRd6xnRArQ6Lf8HsflULQxaGKi0s+I/s7B3WsT
	 wGWWldYbySA6mW+lVdpfkxtIobFZNhQ4miJVUidzifb7BmJ9buCtu7HG0uqiyOynxE
	 Kbbo1O5ZHtQcA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4jJ7G50GVRz4ykr;
	Mon,  2 Nov 2026 11:28:29 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4jJ7G42MJMz8v20;
	Mon,  2 Nov 2026 11:28:28 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 43F7C5FA02;
	Mon,  2 Nov 2026 11:28:23 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <7825d8a1-83cb-47b1-9df6-96892d25c4ae@leemhuis.info>
Date: Mon, 2 Nov 2026 11:28:22 +0100
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
Subject: Re: [REGRESSION] next/master: (build)arch/riscv/kvm/kvm.ko: symbol
 'kvm_arch_pre_fault_allowed' undefine...
To: kernelci@lists.linux.dev, kernelci-results@groups.io
Cc: regressions@lists.linux.dev, linux-next@vger.kernel.org
References: <179267754360.302120.2153520610797426540@kernelci.org>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <179267754360.302120.2153520610797426540@kernelci.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <179361530358.1131926.12318118078042161870@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 43F7C5FA02
X-NC-CID: kwUt/bvY6Bh5KxvUQwDN/axRzzuu0c5/DvWLbdu+P1ZjcZ+dyRg=



On 10/22/26 15:59, KernelCI bot wrote:
> New build issue found on next/master:
> 
> ---
> arch/riscv/kvm/kvm.ko: symbol 'kvm_arch_pre_fault_allowed' undefined! in Module.symvers (/tmp/kci/linux/scripts/Makefile.modpost:147) [logspec:kbuild,kbuild.modpost]
> ---
> 
> Log excerpt:
> =====================================================
> ERROR: modpost: arch/riscv/kvm/kvm.ko: symbol 'kvm_arch_pre_fault_allowed' undefined!
> 
> =====================================================
> 
> When fixing this issue, please attribute this report according to the
> patch submission rules:
> 
> Reported-by: kernelci.org bot <bot@kernelci.org>
> Link: https://lore.kernel.org/
> all/179267754360.302120.2153520610797426540@kernelci.org/
> 
> For complete logs and details about the environment used, see the issue
> on the KernelCI dashboard:
> 
> - dashboard: https://d.kernelci.org/i/maestro:9c12526508454935ec55c5be5b9699f5296ee63b



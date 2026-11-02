Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.61.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615526;
	b=gOR+Tmz643k8/2JeCWsOHtoyn6qkUJnaGNFbMa0aKTXVpvlvcLFdiruykDSTS1/3sSKO
	 q/HL9ljIyN8DaDrypIoDHqlcL+NAbVBKmRL4Gzc1oAyB9vc6DxRC/YM0p6hxKkSuedciH
	 TxGA51/3wm8iq27IlAyO4p7HeXMfsgbV1aFLBXph54JYorcbl0o6+3yLMnDcqbNnR7DIu
	 oTvbk0MOMBbB6+sCboB6hzHbQwuqFSltJi+AAnTt2I4pX2AjxBJAjGD/keP45yGM74en2
	 jxIPPGjMMvTy09Wu543JASLd2fc8qyUG+4yC4+shHX75qrlnSggGBrxC48oSBBX3vqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615526;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-NC-CID;
	bh=DF1OoitYEzfEdwoBSE4aJ+cVOENIn4B9+K/fI9RQHJw=;
	b=qK8mLNc3BwG4y5x7qIxgsVCDcBmPQ2g3TFbipJdhgGheZw6xx2/ytv+v361pDppfU+3e
	 DdCpmhIfbqaV5ZlI+ZmbhRXH9wV/kWM2GxmfQxtbgW5md/3klQsO59SSRNH+pYrrRj7JJ
	 li1uc/ttsMXo+8uaBM5iLcgeZcams5LUds4BxvyTIBjm/0LTXAy55VlvAfnvzCmtLcwRk
	 ubhnKWI1hgjjsZyWFvpggDzvcN5D6Hjer/6lZzRqapsW7OFBfu+pN+iatAlYiQBbescn3
	 S6ZsU3PlWJ9crRxQSkAwB9Su3c9/beaVLawOHRbKfzl21qZSnynObabzPFowszQDzgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=Kxtl4VMJ;
	arc=none smtp.remote-ip=188.68.61.103
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C31606A326;
	Mon,  2 Nov 2026 10:32:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87C31606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=Kxtl4VMJ
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4jJ7L55Qx3z8NC5;
	Mon,  2 Nov 2026 11:31:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1793615517;
	bh=RTxpmnLqLIjlILtjaVSFdTmaAjwaZ4fje+1Rpvx2iBE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Kxtl4VMJWsDR+j0WpzU0x0kn4x9uf3C1PzGyyKMDDdyoP4jyE693EZ5Pv00zwFWz8
	 EVB2UVdBqBfthR646qXLvS6OLT3FlklDJK6RHLnf85hPhCZldPsPHzyzsIP9PLVg+/
	 TVd3uV1rMUE+LVXlRb72D8BfqbWiz+DVnOwn9HmBXlDdUAPQn5PLgBGw1wfxa106AX
	 dqf21O5r4LbaEK+tAWosnkPR2xqv5F89z/C9XUHTOoZYQThlX5hdN/lNBE0QKnlNxl
	 lkXi+pQ1KF9l5uvGqhF9T/ZB++hS7E4g10Mm7MWWCWvp1UMDn+Abn2V8AHxj8+tu7k
	 rxCY11bHbZj3g==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4jJ7L54kD4z8MYx;
	Mon,  2 Nov 2026 11:31:57 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jJ7L52NQqz8sgw;
	Mon,  2 Nov 2026 11:31:57 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 1AAE15F948;
	Mon,  2 Nov 2026 11:31:48 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <8883961e-94b7-493b-9651-9553adafd682@leemhuis.info>
Date: Mon, 2 Nov 2026 11:31:47 +0100
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
 <179361550873.1133007.15551903200080310172@mxe9fb.netcup.net>
X-NC-CID: y/FmTWYXAOIuV11uUOyKFDFGH1e/2g8frs6+cqOxAHC3jTlnaBk=



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


#regzbot report:
https://lore.kernel.org/regressions/179267754360.302120.2153520610797426540@kernelci.org/
#regzbot resolve: squashed into the merge

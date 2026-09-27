Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC873264612;
	Sun, 27 Sep 2026 06:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.244.194.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790491715; cv=none; b=AzlqylRYo0atl8Jid0sFeXE5hmdlYeXrjXRURfRDD6CX0Lf9sShUBl6xFuqyWPy8cjk13Cwi4lnk/apfRsPgil9hjWdj35QMaervSPI57HGc0n3Nm6CMuTqQnvHkDnoQ2PuA7LDhtC1hOxWdZc9qSsWZML++bCg72X9JrOutgKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790491715; c=relaxed/simple;
	bh=a3qGlG41+Q4DERgdj7x7UFHj6kLK08MSc/V1bwbY+1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PCAWb4CfZ1LS4+FGt/Mx3ZfhK2jTNmV/I9Pq2dyLR/V5GfZ/61dSbtZ/ztMdrXvmow6fnVTQL4YF2fsal+L6pNZ9hjGDotKOjBvn07e5JMNYiZDEB+ZoZsXlL29+5Jfn6lFnZaIN6sPAC8u4q6qTetGPH2Yc5fIyh9yy2aWe14M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=BTeCiUX3; arc=none smtp.client-ip=185.244.194.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="BTeCiUX3"
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4hsw4m1Vqtz9Hgm;
	Sun, 27 Sep 2026 08:48:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1790491704;
	bh=a3qGlG41+Q4DERgdj7x7UFHj6kLK08MSc/V1bwbY+1o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BTeCiUX315XZF9eInz9jj7vH+zM0oAOit42tuxYs6oWeZ6kU8IUJkCyWqXf1s+TBr
	 RH+Q0vnF0A/ZjZWG7+pFbyfgkq0l8mR+9chD2OjIwnIoEiMZU4I/FlU0h7E3J0QkbC
	 ziYkawY2bwZphe4JKXNRMsYGazRxCIr5gKPq79BoQqioRfRIUglS8LcyGuvU/7pVcN
	 rFUJ3jO9td1Wk+X+TV5AWt78tOOQWkJZk+56vUZvyaJqz18g5e08RTWkd33/jjmFd7
	 JPgsPcNg2wIOsqRyuG2q2l3EL/z/OZ98F9HtOCd/XMvg5RwA5TXirbD+IdwhMQ5CJ0
	 r+XBDwxMxONIQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4hsw4m0q4pz7x98;
	Sun, 27 Sep 2026 08:48:24 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hsw4l3Zpxz8sb7;
	Sun, 27 Sep 2026 08:48:23 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id BEA845FA14;
	Sun, 27 Sep 2026 08:48:22 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <ebe6dff2-18f7-4691-bf70-08ba652bb5a4@leemhuis.info>
Date: Sun, 27 Sep 2026 08:48:21 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] mainline/master: (build)stack frame size (3128)
 exceeds limit (3072) in 'dml_core_mode_prog...
To: kernelci@lists.linux.dev, kernelci-results@groups.io
Cc: regressions@lists.linux.dev, broonie@kernel.org
References: <179045994373.636297.9560581777523775419@kernelci.org>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <179045994373.636297.9560581777523775419@kernelci.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <179049170303.3534085.13013348134667743871@mxe9fb.netcup.net>
X-NC-CID: wqPViGxqPzBF45XOuPHgEtDvVjGH43zKhCfPUy6toU9YKj0+QT4=

On 9/26/26 23:59, KernelCI bot wrote:
> New build issue found on mainline/master:
> 
> ---
> stack frame size (3128) exceeds limit (3072) in 'dml_core_mode_programming' [-Werror,-Wframe-larger-than] in drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.o (drivers/gpu/drm/amd/amdgpu/../display/dc/dml2_0/dml21/src/dml2_core/dml2_core_dcn4_calcs.c) [logspec:kbuild,kbuild.compiler.error]
This to my untrained eyes looks like a variant of the problem that was
reported yesterday, just with a slightly different error message
(yesterday it was a stack frame size of 3096).

#regzbot dup:
https://lore.kernel.org/all/179039514312.597384.1659548947123427650@kernelci.org/

Ciao, Thorsten

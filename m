Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844BC1E1E16;
	Tue, 19 May 2026 04:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779164446; cv=none; b=nq8hZKFQDM6QytA9pGgJh/idf9WxDtms31iCKR+3OlLc6ralgjT8e++40iT+eYeKaNqpMYFgefY1S8yiSL7OnUzwD418wdSJ+tqhQV0dwCTs8j89717fMTPwf7LqSzJ7otAg+4uT/NlaZVHs5W7pbTfdBPkFQzVHc/j1lYdm6MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779164446; c=relaxed/simple;
	bh=Oan+xwMUawmIqv/D2NhRkR/LbaGBbgz/qXptY+GXEUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YATD2WNniCEryLFdLnhB1/1rG/Q5h/TwM2Q9eIeFdKo6Mi37sebpBtAFAVb+JLiaisAhkCElLLGx1tFuczIoHix7k8vBELH9+iJjmgzwTIZVHcZGyvL0DU2ttsmJMM70Kvj6uLDM1fVPaAj8IXSpQa1u3zbV/pWlRhhZq0wkOQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=UPGw5IGs; arc=none smtp.client-ip=188.68.63.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="UPGw5IGs"
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4gKM0l5CCFz692F;
	Tue, 19 May 2026 06:20:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1779164439;
	bh=Oan+xwMUawmIqv/D2NhRkR/LbaGBbgz/qXptY+GXEUY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UPGw5IGstSNzgz9FQGQ3r4UsuNA+XLyYA+XHPfaZDD3EiS1urH7h6iB/+DYKrOy/a
	 OZVUxZ89rW3Qp8qHNMGF1zLiapa/nA31qL2dom4vFORH5SaTu7voD8qv+V5WglnkVP
	 zXvgeIgcZU6GuGAzcrhq3Q53ZJlvJxQ4e2+hQAk97IEcmtNcEj26Pjqwz1Aj84VSyp
	 q5POe7ry/2GxzIQGGqoIKKpmD9zN2a3v7Rt/G9G01+6Axiyl2SSujHmmNGa3G6W6JI
	 iwrpOWb88LX4T2gpnrLweACTCicEyfauBf+2AviFTa1C7EYKLIK2nNLrTs7rZYcEBB
	 F0Uza/CB+X3Wg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4gKM0l4ScGz4xpv;
	Tue, 19 May 2026 06:20:39 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4gKM0k48Z0z8sb7;
	Tue, 19 May 2026 06:20:38 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id E6B4F61886;
	Tue, 19 May 2026 06:20:37 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <c5cf994e-0378-4be4-abae-5e23b2777195@leemhuis.info>
Date: Tue, 19 May 2026 06:20:37 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] mainline/master: (build) variable 'old_size' is
 uninitialized when used here [-Werror,-Wuni...
To: kernelci@lists.linux.dev, kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, laura.nao@collabora.com,
 shreeya.patel@collabora.com, broonie@kernel.org
References: <177913434403.2484.8283537970935500940@330cfa3079ca>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <177913434403.2484.8283537970935500940@330cfa3079ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <177916443827.782505.12740523809279455409@mxe9fb.netcup.net>
X-NC-CID: AJYMxMkH5fUN4Dubn7tZ/ogUl4/W+9EgJ8Vei5pdbjDwAO7WBSs=

On 5/18/26 21:59, KernelCI bot wrote:
> 
> 
> 
> 
> Hello,
> 
> New build issue found on mainline/master:
> 
> ---
>  variable 'old_size' is uninitialized when used here [-Werror,-Wuninitialized] in fs/smb/client/cifsfs.o (fs/smb/client/cifsfs.c) [logspec:kbuild,kbuild.compiler.error]
> ---

I guess this is fixed by
https://git.kernel.org/torvalds/c/8cf8b5ae8e093132b0dce0a932af10c9ef077936
in mainline

> - dashboard: https://d.kernelci.org/i/maestro:8fef554699226f88449edfc56be31812d3edd327
> - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> - commit HEAD:  4bf5d3da79c48e1df4bab82c9680c53adeff7820
> 
> 
> Please include the KernelCI tag when submitting a fix:
> 
> Reported-by: kernelci.org bot <bot@kernelci.org>
> 
> 
> Log excerpt:
> =====================================================
> /tmp/kci/linux/fs/smb/client/cifsfs.c:1390:29: error: variable 'old_size' is uninitialized when used here [-Werror,-Wuninitialized]
>  1390 |                 if (rc == 0 && new_size > old_size) {
>       |                                           ^~~~~~~~
> /tmp/kci/linux/fs/smb/client/cifsfs.c:1307:37: note: initialize the variable 'old_size' to silence this warning
>  1307 |         unsigned long long i_size, old_size, new_size, zero_point;
>       |                                            ^
>       |                                             = 0
> /tmp/kci/linux/fs/smb/client/cifsfs.c:1375:13: error: variable 'zero_point' is uninitialized when used here [-Werror,-Wuninitialized]
>  1375 |         if (fend > zero_point)
>       |                    ^~~~~~~~~~
> /tmp/kci/linux/fs/smb/client/cifsfs.c:1307:59: note: initialize the variable 'zero_point' to silence this warning
>  1307 |         unsigned long long i_size, old_size, new_size, zero_point;
>       |                                                                  ^
>       |                                                                   = 0
> 2 errors generated.
> 
> =====================================================
> 
> 
> # Builds where the incident occurred:
> 
> ## defconfig+allmodconfig+CONFIG_FRAME_WARN=2048 on (arm):
> - compiler: clang-21
> - config: None
> - dashboard: https://d.kernelci.org/build/maestro:6a0b542b744d1c1da0198902
> 
> 
> #kernelci issue maestro:8fef554699226f88449edfc56be31812d3edd327
> 
> --
> This is an experimental report format. Please send feedback in!
> Talk to us at kernelci@lists.linux.dev
> 
> Made with love by the KernelCI team - https://kernelci.org
> 


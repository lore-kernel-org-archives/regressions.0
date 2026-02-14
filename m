Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [46.38.247.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE1B16A395;
	Sat, 14 Feb 2026 10:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.38.247.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771065461; cv=none; b=CB8DL0QiffmQlvXH+rn6yuP3tB7x2QSXuTDbBojTBWVblNuwemOqrAZY/GMI5HPoWZidkg44tpp3YfjYQmuxDaFrDHeKV+e5FSqQM6vDeHiw2N9W2Bku2/VGGwvCjTzeIuh7majgE3I08y6fJtERc32QIUVrCuTlUqZJh81yl4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771065461; c=relaxed/simple;
	bh=20NCogMvAsQRZqWLpaR7wHKM3+eZE0vlGDnnK396IdI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gGB6UkacmuVFVzy5xQZXpLiUKNktrq+1/fgfS0yNaFd8wlZpnN4Yb+ogsrWC5FwdeFoS0VtR+O6SjyxdYozBwQprNL2Y3+SdU9IS1Sq/xHqNtkXz4xzPniHah/P1wzbGD6OHxiGLKGrY36mlO7caTptAhT+DynbROpBVYOYluO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=caDbQ3uo; arc=none smtp.client-ip=46.38.247.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="caDbQ3uo"
Received: from mors-relay-8404.netcup.net (localhost [127.0.0.1])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4fClpy4HvTz87bc;
	Sat, 14 Feb 2026 11:37:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1771065450;
	bh=20NCogMvAsQRZqWLpaR7wHKM3+eZE0vlGDnnK396IdI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=caDbQ3uofqJfzY+cbQn0Luwzw3QEqVkyIuQrioUMki8KyXhCOqgxVcdYzhOn/kwe5
	 HT8oy3MU1EhZ2NOMCIXyrDt3hBqSH3HW0mlcNdlIxG7PbTZOlTKwdKdIuZKtQ93RvZ
	 DIgEu7dTfjrNxXT7QLS/RhAEAJ7H+Zqcj4npqTBs+GE98H2XAFfyp22dlt65o8R2Fo
	 PMpHTPF4OzzbARWxfseCzN0knxsuqV8S5onE0aMAXURBYYM3FnBwXOQo0mY7aX+EZm
	 AizCuMZlpNaQsfmQre/H79T7a4/VP5SsQytiHWdmngqdDtLgXYBXuxZiofy7V+Uy+V
	 XYzIZvbrIfREA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8404.netcup.net (Postfix) with ESMTPS id 4fClpy3Zdrz4xxq;
	Sat, 14 Feb 2026 11:37:30 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4fClpx5242z8svF;
	Sat, 14 Feb 2026 11:37:29 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 9BA426728C;
	Sat, 14 Feb 2026 11:37:28 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <da5365ac-601f-4cea-af9a-b03b3666d627@leemhuis.info>
Date: Sat, 14 Feb 2026 11:37:27 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] mainline/master: (build) in vmlinux.unstripped
 (scripts/Makefile.vmlinux:72) [logspec:kbuil...
To: kernelci@lists.linux.dev, kernelci-results@groups.io
Cc: regressions@lists.linux.dev, gus@collabora.com, laura.nao@collabora.com,
 shreeya.patel@collabora.com, broonie@kernel.org
References: <177103434309.1537.16630109964798020395@f55b40a4666e>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <177103434309.1537.16630109964798020395@f55b40a4666e>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <177106544897.2986668.16455885634981940023@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 9BA426728C
X-NC-CID: YFyFJzNJiTiTTHT9vOOxWxhTKA35hj0UPK27GISnkyCLUNY470Y=

On 2/14/26 02:59, KernelCI bot wrote:
> - dashboard: https://d.kernelci.org/i/maestro:b5ed9b51212f5174ccbd9d812fc43e26fcc5361e
> - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> - commit HEAD:  f50822fd8675c68d294e89bd102f7b487ca3acd3
> 
> Please include the KernelCI tag when submitting a fix:
> 
> Reported-by: kernelci.org bot <bot@kernelci.org>
> 
> 
> Log excerpt:
> =====================================================
>   LD      .tmp_vmlinux2
>   NM      .tmp_vmlinux2.syms
>   KSYMS   .tmp_vmlinux2.kallsyms.S
>   AS      .tmp_vmlinux2.kallsyms.o
>   LD      vmlinux.unstripped
>   NM      System.map
>   SORTTAB vmlinux.unstripped
> Inconsistent kallsyms data
> Try "make KALLSYMS_EXTRA_PASS=1" as a workaround
> 
> =====================================================
> 
> 
> # Builds where the incident occurred:
> 
> ## defconfig+CONFIG_ARM64_64K_PAGES=y on (arm64):

Not my area of expertise, so the following might be misleading, so
handle with care. But FWIW:

We had a similar issue recently in stable; back then Guenther wrote:

"""
> It is probably just a random error. I used to see this once in a while, though
> not recently. Sometimes extra pass(es) are required for kallsyms to stabilize.
> Some architectures are more affected than others, and it also depends on the
> compiler version since different compiler versions generate different sets of
> symbols. In my tests I have KALLSYMS_EXTRA_PASS=1 always enabled for alpha,
> arm, and m68k. I used to have it enabled for powerpc as well, but not anymore
> (if I recall correctly I stopped to see the problem there when I switched to
> gcc 10).
> 
> I even submitted a patch to fix the problem several years ago, but it was
> rejected.
"""https://lore.kernel.org/all/e107965c-122d-4beb-ad38-9e720306b6cf@roeck-us.net/

Is that maybe something similar?

Ciao, Thorsten

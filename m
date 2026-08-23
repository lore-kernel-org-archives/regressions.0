Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA9478C9C;
	Sun, 23 Aug 2026 09:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787478720; cv=none; b=BAdyePynFMjHxrwAiV+oL9SiIr5urgJNHvty7PPiKJvt8aR/AS6K6bl5f/J950CjUYsI8OHenMn9DeMQ1ZNncIKAxRQws5EkiGGp1649IDw/y8U8xoRywfyJREF2KheldhGrt5egvvZ22+LkBr06A/1JkIQrbJ9/25SRMNVtbhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787478720; c=relaxed/simple;
	bh=1J7T5Mvv2S09BeDjR3YfvqKls9JIR72ke8OHTVwoV1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n+d+3JpCJGTNusoyVtuCD0RHZ8CQo0gZtti1qWmadTzdVbfLkV8LuGpYoE65nCZHy1HcK8QL0IJFjPfDtkDzxSGuW0TL7lcKDq0B3xCdLeEBnOTBiGEBeB+QQshsfNEodvQ6F1HNHyQrejat53yMJGtqmxfpZFkgiI9/3TnwI80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=FgKFbRa3; arc=none smtp.client-ip=188.68.63.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="FgKFbRa3"
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4hSTpc3YB2z4FMh;
	Sun, 23 Aug 2026 11:51:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1787478712;
	bh=1J7T5Mvv2S09BeDjR3YfvqKls9JIR72ke8OHTVwoV1I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FgKFbRa3+hmNrIuaQAH1+QiDAyDZzVcpOKQQW+ShzWFS3HlyJe2L4qd/ZKFXhBv4d
	 8NVqZbJP87BBv2DOZ7cApta+bP9SVeKz1YxUax4bectqThYkAxbN/Q5SOU8eHcF6ca
	 vvVL/fX2kJ/vc8i3EbFxMf09ebmXqiAp35LvW7cy1epSntR9ZcX3RairWXeXo5+udB
	 3qEjsQBS2CXh3q6Pi4YSq3PqI0Mn2bBqPCGTnBC5GYSUR4LsBJBzsiGG8/TyrcIcJ6
	 styPZUIr4+DrUXvyzvrO4HCo9aBywSyGcVL8amQuWYcvRQt0fojfeVCJA5xkRutRXr
	 tZRc+7goDWl9A==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4hSTpc2r0Yz4FMc;
	Sun, 23 Aug 2026 11:51:52 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hSTpb33GYz8svW;
	Sun, 23 Aug 2026 11:51:51 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 9D61A5FAE4;
	Sun, 23 Aug 2026 11:51:50 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <dc30a20d-f648-4dad-ad66-d9f02c26754b@leemhuis.info>
Date: Sun, 23 Aug 2026 11:51:50 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] mainline/master: (build) format specifies type
 'unsigned long' but the argument has type 's...
To: kernelci@lists.linux.dev, kernelci-results@groups.io
Cc: regressions@lists.linux.dev, laura.nao@collabora.com,
 shreeya.patel@collabora.com, broonie@kernel.org
References: <178734954411.1392.5288442696836266032@kernelci.org>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <178734954411.1392.5288442696836266032@kernelci.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <178747871114.2496362.13273710536219909476@mxe9fb.netcup.net>
X-NC-CID: XzlQ8oS+AlGdkcT+BQSVgoPZAhK+KmRHXe30CqFRw4G2EroMNGk=



On 8/21/26 23:59, KernelCI bot wrote:
> New build issue found on mainline/master:
> 
> ---
>  format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Werror,-Wformat] in drivers/scsi/qla2xxx/qla_init.o (drivers/scsi/qla2xxx/qla_init.c) [logspec:kbuild,kbuild.compiler.error]
> ---
> 
> Log excerpt:
> =====================================================
> /tmp/kci/linux/drivers/scsi/qla2xxx/qla_init.c:9274:8: error: format specifies type 'unsigned long' but the argument has type 'size_t' (aka 'unsigned int') [-Werror,-Wformat]
>  9272 |                             "TIM section too large (0x%x bytes, ring 0x%lx bytes).\n",
>       |                                                                        ~~~
>       |                                                                        %zx
>  9273 |                             section_size,
>  9274 |                             req->length * qla_req_entry_size(ha));
>       |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 1 error generated.

Fix is underway:
https://lore.kernel.org/all/20260811-scsi-qla2xxxx-qla_init-wformat-v1-1-50760021914f@kernel.org/

#regzbot introduced: c3930ec119cb
#regzbot fix: 431e735e9bb6b7

Ciao, Thorsten

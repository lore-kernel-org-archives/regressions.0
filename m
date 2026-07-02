Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4322F39DBFA
	for <regressions@lists.linux.dev>; Thu,  2 Jul 2026 07:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782978271; cv=none; b=cPw2s433A4r6bPQZ5dxJMaqrR/Z4NyAYXSHG5u/Xcpi5ySL0RaPNOHrDlkEGgIBPj60ztxgf9UpoWZqjpOuRwX8OhM1FMjPDNNfWMWcMRri7Qqvt7dcaDLlMgLglOnM0JgM5L0pM0CgJeudtIKNnEQ/+weOZveR6d3CpGEum7ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782978271; c=relaxed/simple;
	bh=TsN6WMMBCEo3X7M+PaHTEiPe/r/MX65+aVkikPoZo+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=GdHy2/wA2xyK9i+qNzxLLo7H448SLM6vMZaLytKru6F1mg1/EDu4RpGaGlIoG6kSkh4kLr7yflxSMK9ZStW+n59SqH53ie/J9ngDQ9HVyXyWGnA+LxH/1aIk3CjaSUAjDXDiOi2NNKZqSL9BGuty6frRYIToPgN3R2ynq3nzy0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=TjtJ1wMw; arc=none smtp.client-ip=188.68.61.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="TjtJ1wMw"
Received: from mors-relay-8405.netcup.net (localhost [127.0.0.1])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4grTRT0yj5z78xf;
	Thu,  2 Jul 2026 09:44:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1782978261;
	bh=TsN6WMMBCEo3X7M+PaHTEiPe/r/MX65+aVkikPoZo+8=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=TjtJ1wMwyQhbAj5p3WcdecFKurKvL1gKgOZBAFY7bOfBZpq7hogycwScebDww3mTi
	 SEjfzI7PBhKif6OHy6RC2pR8cm6hObzSgIhJgn5n0SX5Ps9wcYHjvOHGDh7iQD3KGW
	 q6m7bEHFEPxQ+4Eqyci7OJgHSzMWDDvRg46UIX9qK3t+yFiSAZomCJDrccs4014Sio
	 bvmkdw4r88FNxN9R8Oga14/X3X0tDHtOCsh7eSGZjzEeL2W54VJUQfiOv0Ufdo58pO
	 1WmFrpF5xzXENt1jiSpgyVPvra+Jtq6gXQcwAEUChK9xnEQm4y6aGdzPGR4Knzd0+b
	 dCZNlHSOXtQYA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8405.netcup.net (Postfix) with ESMTPS id 4grTRT0Gcvz78xd;
	Thu,  2 Jul 2026 09:44:21 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4grTRR5mvhz8tYM;
	Thu,  2 Jul 2026 09:44:19 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id A4244603E0;
	Thu,  2 Jul 2026 09:44:18 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <64546a50-5593-4083-aaa7-6f772f8c81b5@leemhuis.info>
Date: Thu, 2 Jul 2026 09:44:17 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] linux-firmware-amdgpu 20260622 prevents clean poweroff on
 AMD RX 6800
To: IT4roundtheW0rd <IT4roundtheW0rd@protonmail.com>,
 "linux-firmware@kernel.org" <linux-firmware@kernel.org>
References: 
 <q7ZKOKwwFDcWVkxZpaMuCo3xjbQ0XzrMZfuVec--VZXX94D5vdqLIRMR6xMaoGI27_uGJ-ILsWrXlXwbfGLf2ozY5bz8QV0Al3JUH7y3f4o=@protonmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
In-Reply-To: 
 <q7ZKOKwwFDcWVkxZpaMuCo3xjbQ0XzrMZfuVec--VZXX94D5vdqLIRMR6xMaoGI27_uGJ-ILsWrXlXwbfGLf2ozY5bz8QV0Al3JUH7y3f4o=@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <178297825897.3306651.13862513967389606757@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: A4244603E0
X-NC-CID: WQUHJuKIRcozFvv2yzdqCWxTh1SrywKG3JrO4uvjTbwvR5T3U8o=

[adding a few people to the CC]

On 6/27/26 02:42, IT4roundtheW0rd wrote:
> 
> I'd like to report a regression in linux-firmware-amdgpu introduced with
> the 20260622 release.
> 
> *System:*
> - Distro: CachyOS
> - Kernel: 7.1.1-2-cachyos
> - GPU: AMD RX 6800-series
> - Bootloader: GRUB
> 
> *Problem:*
> After updating linux-firmware-amdgpu from 1:20260519-1 to 1:20260622-1,
> the system no longer shuts down completely when running `poweroff`.
> Fans, keyboard LEDs, and power button LED remain active after the
> shutdown sequence. The system hangs after "Sending SIGTERM to remaining
> processes..." and never reaches full power-off (ACPI *S5).*

A few questions:

* Which firmware files does your GPU use exactly (a full dmesg log
should answer this)
* Does the problem happen with a vanilla kernel as well (it most likely
will, but would be good to confirm, as heavily patched vendor kernels
can lead to all sort of issues).

Ciao, Thorsten

> *Relevant log excerpt (journalctl -b -1):*
> 
>     Jun 27 02:04:14 cachyos systemd-shutdown[1]: Sending SIGTERM to
> remaining processes...
> 
> (no further entries — system hangs here)
> 
> *Workaround:*
> Downgrading to linux-firmware-amdgpu 1:20260519-1 resolves the issue
> completely.
> 
> *Steps to reproduce:*
> 1. Update linux-firmware-amdgpu to 1:20260622-1
> 2. Run `poweroff`
> 3. System hangs — power is not cut
> 
> *Additional notes:*
> The root cause appears to be that the new firmware blob prevents the
> amdgpu driver from cleanly releasing the GPU before the ACPI S5 power
> state transition. No other packages were updated in the same transaction
> that could explain this behavior.
> 
> This issue was researched and this report was drafted with the
> assistance of Claude (Anthropic AI).
> 
> Best regards,
> 
> Benjamin Maas 


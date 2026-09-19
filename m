Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573E431B828
	for <regressions@lists.linux.dev>; Sat, 19 Sep 2026 06:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789798860; cv=none; b=MDbk90+bi7jWNT6Gb9N2njOqrGY7S1Pg0Ss2gW9FVCx6idTKxY0OMQsKAdhnISaBktRSvpu2UTuSsbXIHnGPnmWoKib3XPTdhExrVAbG+jzpB8U+L29M0K6ZW/CdXfAQZ+04LBTIaihc3DwPXxdN1knZe9Nl5PPl2KQbQghGoLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789798860; c=relaxed/simple;
	bh=Bmt68BZpzEYhOybCAvUjeIl8rB2amjyuAtIJ+oUeZJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Coc5BzbeI54gcEca9XB+nynm97Y39BlGhHTDxemT/HMYKWOEQ0QmMlAG1XAUKtm14xzAPUCO4deoPR5FB9sxS4c0vMy8yk16oYQKyiNjFMzIMzHFTUxDyHL7B7RireihBYtnUHxSdh3pvYSUiPV7UlR7LfsCp9lv8DTiIO5VsZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=hqri1s63; arc=none smtp.client-ip=188.68.63.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="hqri1s63"
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4hmzrL4qYxz46LF;
	Sat, 19 Sep 2026 08:20:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1789798834;
	bh=Bmt68BZpzEYhOybCAvUjeIl8rB2amjyuAtIJ+oUeZJs=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=hqri1s63beSm0gNcD3pst5HiGp/PbW95KUO0u17epjBdwj/Weaa7GCMQ7CIFOg5Jg
	 NwMr5CtGFmd2Q0TZKNBVJjn6NLZhdDWCb9YZEAy7Ki5L6A0hoKw0rendgRhNxXCs21
	 GzSh7xU4Y/4GqkU25Eags42XoHYoA1mbOMG7X9Mn7roM2ZEp6MSmUMkE9pu3actTl4
	 oqTr1WQBgax7zM5gN7CMlqTJr+ihWKFgje6FE1qRa9IAABvrimu7VjXfUcBITnJfry
	 1NiXxkf3WxZYhhJtBGvevLQATKOYpa7EJx5IEUaJgNycs4EQtIMSqL3DsNYv6/t+9q
	 6wJQdRmzZ5j1w==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4hmzqH3WmBz46v6;
	Sat, 19 Sep 2026 08:19:39 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hmzqH1LcPz8sZh;
	Sat, 19 Sep 2026 08:19:39 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 8F25E5F936;
	Sat, 19 Sep 2026 08:19:34 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <ba7d91b6-61b4-48b9-8f33-b616e5c02d48@leemhuis.info>
Date: Sat, 19 Sep 2026 08:19:33 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] ASUS Zenbook A14 fails to boot (Internal error:
 synchronous external abort)
To: Aoto Tokizawa <aoto.tokizawa@gmail.com>, regressions@lists.linux.dev
References: 
 <CANxGDDEp4FrTo5cqhwMOqqm7ukh-G9z_77eVWiTgbTzNNYMRWA@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: 
 <CANxGDDEp4FrTo5cqhwMOqqm7ukh-G9z_77eVWiTgbTzNNYMRWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178979877479.110377.3494495949889457527@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 8F25E5F936
X-NC-CID: 9JsQdtS/oYwtad6q+j0m/ZNgr0Yk756UwT06uEgxvBXKZ0rBGpo=

Hi! Thx for the report.

On 9/18/26 22:53, Aoto Tokizawa wrote:
> 
> Recently Linux 7.3.rc3 fails to boot really early on. Linux 7.2.6
> boots just fine

Just wondering: did earlier 7.3-rc versions work? Sounds a bit like it,
but I doubt that's what you meant.

> (with identical sysroot). The following was
> transcribed by an LLM from an image I took with a camera
> (unfortunately no text made it to systemd-journald).

Maybe you are lucky and someone has an idea what might cause this, but I
doubt that will happen. In that case it would be great if you could
perform a git bisection to find out what's wrong:

https://docs.kernel.org/admin-guide/bug-bisect.html
https://docs.kernel.org/admin-guide/verify-bugs-and-bisect-regressions.html

But one more thing:

> [    0.177281] Internal error: synchronous external abort:
> 0000000096001610 [#1] SMP
> [    0.177446] Modules linked in:
> [    0.177460] CPU: 7 UID: 0 PID: 57 Comm: kworker/u34:0 Tainted: G
> M    W          7.3.0-rc3-1-aarch64-rc-ARCH #1 PREEMPT(full)
> [    0.177495] Tainted: [M]=MACHINE_CHECK, [W]=WARN

These taints could mean that this is a follow-up error; or is 7.2.y
tainted like this, too?

Ciao, Thorsten

> [    0.177510] Hardware name: ASUSTeK COMPUTER INC. ASUS Zenbook A14
> UX3407QA_UX3407QA/UX3407QA, BIOS UX3407QA.311 08/22/2025
> [    0.177542] Workqueue: events_unbound deferred_probe_work_func
> [    0.177564] pstate: 214000c5 (nzCv daIF +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
> [    0.177586] pc : regmap_mmio_read32le+0xc/0x24
> [    0.177602] lr : regmap_mmio_read+0x40/0x68
> [    0.177616] sp : ffff800083783920
> [    0.177626] x29: ffff800083783920 x28: ffff800083018348 x27: ffff8000b1e8b700
> [    0.177649] x26: ffff800081e8b588 x25: 0000000000000006 x24: 0000000000000000
> [    0.177672] x23: ffff000804cc3800 x22: ffff8000837839d4 x21: 000000000000d008
> [    0.177695] x20: ffff8000837839d4 x19: ffff000805731380 x18: 000000000000000a
> [    0.177717] x17: ffff000804dde980 x16: ffff0000837836f8 x15: 0000000000000000
> [    0.177741] x14: 0000000000000002 x13: 0000000000000001 x12: 0000000000000000
> [    0.177763] x11: 00000000003662c5 x10: 0000000000070a78 x9 : 0000000000000004
> [    0.177786] x8 : ffff800083783900 x7 : ffff8000837839f0 x6 : 000000000000d008
> [    0.177808] x5 : ffff8000837839d4 x4 : ffff000804cc3800 x3 : ffff8000b0faac28
> [    0.177831] x2 : ffff8000b0fab368 x1 : 000000000000d008 x0 : ffff8000b437d008
> [    0.177854] Call trace:
> [    0.177863]  regmap_mmio_read32le+0xc/0x24 (P)
> 
> Text was cut-off, but in another image I got more of a call trace:
> 
> [    0.177554]  regmap_mmio_read32le+0xc/0x24 (P)
> [    0.177570]  _regmap_bus_reg_read+0x68/0xac
> [    0.177584]   regmap_read+0x64/0x210
> 
> Let me know what I can do.
> 


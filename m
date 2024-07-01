Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A749DDD8
	for <regressions@lists.linux.dev>; Mon,  1 Jul 2024 03:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719805476; cv=none; b=oS1zZ5Q6Bd0xREs+TfOftgwVUiKAYwCUfuKPl5sKF/XRg+lqEdFBm+H8o6mP3ShLWo051KjdC0aZxhj4LOQhlvtcDJmcDv7Z0zWWKQKXuGTV8eFmtcbSfqdzOTIeHXs9nADejlPKOuaY6HXtM8VmNfyiIpHjzvbEtrvPsKecaB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719805476; c=relaxed/simple;
	bh=R9dAgGIDksJJsqrdVJqvOKQs7grEIiB5PVXRYk0fTPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=udbni2TDdxsfitPgr9Q3b4Gafksv/tjt9BflsaNBg21CsuHE8QPgoKRCF7HPmLAkIpPq3o+mIEvU32TLMcGd6Fvonuv9mdf/+t3BIk1UYuDBtKBUeyNozMwDcSahdyl9gPLM9BXEecqcrob/HLN8Jy5UPBRuQIeQJ3znIMyCFUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kIm09XnZ; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kIm09XnZ"
X-Envelope-To: pedro.falcato@gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1719805471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8nZu4IWGUzc3USavL6yQ4OtuZ38R41skCyg6aC2UUCM=;
	b=kIm09XnZ7GtByxXazZewXdRw3x7lWjWegS+O92R9pFYtcE9LiUuHRLTZbAtWx7h6BzSgoA
	tGGm9g+m/a4aOeHvcmy5LU01+VyxTN2sW7GmjApmcMJeiF6dmJsTc4fSMAARPCuYEnilEt
	7rBmtCLDd3FBChX9uWvJRXCZHD+skk4=
X-Envelope-To: linux-mm@kvack.org
X-Envelope-To: regressions@lists.linux.dev
X-Envelope-To: hannes@cmpxchg.org
X-Envelope-To: yosryahmed@google.com
X-Envelope-To: nphamcs@gmail.com
X-Envelope-To: christian@heusel.eu
Message-ID: <c56a1b5e-7b8c-4c91-bb89-a821494963ca@linux.dev>
Date: Mon, 1 Jul 2024 11:44:25 +0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: zswap_writeback_entry crashes in 6.9.5
To: Pedro Falcato <pedro.falcato@gmail.com>, mm <linux-mm@kvack.org>
Cc: Linux Regressions <regressions@lists.linux.dev>,
 Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosryahmed@google.com>,
 Nhat Pham <nphamcs@gmail.com>, Christian Heusel <christian@heusel.eu>
References: <CAKbZUD1-kqfuV0U+KDKPkQbm=RwzD_A1H3qk_c+bw92CqtMbuw@mail.gmail.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Chengming Zhou <chengming.zhou@linux.dev>
In-Reply-To: <CAKbZUD1-kqfuV0U+KDKPkQbm=RwzD_A1H3qk_c+bw92CqtMbuw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2024/7/1 01:58, Pedro Falcato wrote:
> Hi everyone,
> 
> Reporting a bug I've experienced over the last few releases, all in
> 6.9. I don't have a repro for it (seems to happen randomly?). Distro
> is Arch Linux (which is itself minimally patched, config
> https://gitlab.archlinux.org/archlinux/packaging/packages/linux/-/blob/e1057d426590bd2064df83779f8644de519874c0/config).
> 
> I understand 6.9.5 is a little old, but as I have no repro I'm posting
> this in case someone has any hints or has hit this before.
> 
> dmesg:
> BUG: unable to handle page fault for address: 00000000000315af
> #PF: supervisor read access in kernel mode
> #PF: error_code(0x0000) - not-present page
> PGD 0 P4D 0
> Oops: 0000 [#1] PREEMPT SMP PTI
> CPU: 5 PID: 90 Comm: kswapd0 Tainted: P     U     OE
> 6.9.5-arch1-1 #1 b9e5462a84a73f67b5c7c6b73f88d2a6349ae768
> Hardware name: ASUSTeK COMPUTER INC. X542URR/X542URR, BIOS X542URR.310
> 10/29/2021
> RIP: 0010:zswap_writeback_entry+0x128/0x1f0
[...]
> note: kswapd0[90] exited with irqs disabled

I'm wondering why this kswapd has irqs disabled? Seems we don't disable
interrupts in zswap_writeback_entry()?

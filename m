Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C9250277A;
	Fri, 18 Sep 2026 15:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789745337; cv=none; b=mfjRohuSGNEsYMGTO4+MewoKIOLhKTNXTBeymVOGk9TtQTZXg+te5oAjDfqtTvwsbFBBrC1FP0ZfXkcqF4YD5p337iJOfOJPyK4olAGJRm6e9+sIV7XJ1MW9Yp6SPZlovrVy851DWVOBC8WJgxuQXwOwIYmzEmld62HBRHohfpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789745337; c=relaxed/simple;
	bh=o3Z3LUZrrCX+7tJfBVe3q1pst3KzWvwiOcA1hLr5jf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PPg9L8ydBEKQB26vbj5LwGKzfTgNgP7TFbuMRmCHu/mHUVqkiOpruVkaGoqRNtBXSoOMbYxKuhuxMlnWznZ9dRmMxixbv6F+VXSdxwRs/yhVZ91TIPne/8f6hujpi0fmqe+e1mOxpNrvztn+xC0wwD8ExaakjxkmKGD8iNP1MBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=QrES315B; arc=none smtp.client-ip=188.68.63.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="QrES315B"
Received: from mors-relay8204.netcup.net (localhost [127.0.0.1])
	by mors-relay8204.netcup.net (Postfix) with ESMTPS id 4hmc3L3gXzz8nZC;
	Fri, 18 Sep 2026 15:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1789745326;
	bh=o3Z3LUZrrCX+7tJfBVe3q1pst3KzWvwiOcA1hLr5jf8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QrES315BaNzIB66rNZ5gBXOgwrGceq8fNlBkt67elC5ocDSRqwz8NT+lzwPCnqam+
	 g80MpPbQqBo2g0AIo6JfjQnHMtdEUC/omNMh8/41nQCoYfIB4LaMo0md27NPln6Kiu
	 1pWg3ymqZmlLRhluhsowAnwC9s8MDs+wG8co/RBeoss1x7n64aMqTcaD7wzVpa3wu/
	 dZbfnSEPy/cTTE0yIpikFX4irvPU7cmaqlTLQBHJ8GdqwXxlOw7++nHTBDx0gLbhZC
	 LWQy+95v2pp0lrzTsCnYzOESevwj1l42OrAMJQTy94OqvCgiHmkuAUGd8ijuShpbj7
	 Ovigez8iiEuyA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay8204.netcup.net (Postfix) with ESMTPS id 4hmc3L2zZZz8nWx;
	Fri, 18 Sep 2026 15:28:46 +0000 (UTC)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hmc3K6q8gz8sgW;
	Fri, 18 Sep 2026 17:28:45 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 0ADE55FA75;
	Fri, 18 Sep 2026 17:28:41 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <5d600227-0396-4e4f-bfcd-8aa5bbb3f548@leemhuis.info>
Date: Fri, 18 Sep 2026 17:28:39 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IFtSRUdSRVNTSU9OXSBuZXh0L21hc3RlcjogKGJ1aWxkKeKAmHRw?=
 =?UTF-8?Q?m=5Ftis=5Fresume=E2=80=99_undeclared_here_=28not_in_a_function=29?=
 =?UTF-8?B?OyBkaWQgeW91IG1lYW4gLi4u?=
To: kernelci@lists.linux.dev, kernelci-results@groups.io
Cc: regressions@lists.linux.dev, linux-next@vger.kernel.org
References: <178940874287.1087.18054581149136757738@kernelci.org>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <178940874287.1087.18054581149136757738@kernelci.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <178974532134.2725605.10357210687261113811@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 0ADE55FA75
X-NC-CID: MLi1dO2rtv0tOB840t3kDDJiFSQVgkdhRZdijYhiFSvkYjtTvOU=

On 9/14/26 19:59, KernelCI bot wrote:
> New build issue found on next/master:
> 
> ---
> ‘tpm_tis_resume’ undeclared here (not in a function); did you mean ‘tpm_tis_remove’? in drivers/char/tpm/tpm_tis.o (drivers/char/tpm/tpm_tis.c) [logspec:kbuild,kbuild.compiler.error]
I believe this should be fixed by an updated version of the patch "tpm:
use DEFINE_SIMPLE_DEV_PM_OPS and pm_sleep_ptr()" that landed in -next
today (that hit the list shortly after this was posted, just took some
time to land apparently).

Ciao, Thorsten

#regzbot resolved: fixed by a updated patch

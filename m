Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761E32C0F81
	for <regressions@lists.linux.dev>; Thu,  7 May 2026 11:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778154393; cv=none; b=f55xUWAQHLO1o7ylQ9kMXA44alvqxeAAAoaZgYn9Q2iQpmO5wSB5rq4ko9f/vTtQ1Ayf806h/qVwGYuG1oPOrT9krpBOkwTBMVqiFebW+mCyPaIopAm4Tbu00JTj6ZsWyMfYtdcn6MUFmiHnbWqyKKkbJ3OqHFqIFKAgTUt/dk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778154393; c=relaxed/simple;
	bh=qhyI4sqWauYqpHvFn/+NXuk1xu/xBb+t4e/KlU09+2E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AN9hCWm4APiZBwa7PeoFciaiQYh4lqo5hfbvg1/4EsAiD8tFKVfDSQV3lsZsG9rRfkXXyNm86/ozfOiG0WzoZ/kIqd1qrVf8VdkcyAJuj76FsnlxGBAWbMS00fkIiIXfiG2rhjBuyerdVh4MI2OPj/nFntA3eAASP/MAU1F+2Uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=PUPaoqOB; arc=none smtp.client-ip=188.68.63.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="PUPaoqOB"
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4gB9SZ4qptz6CpC;
	Thu,  7 May 2026 13:46:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1778154382;
	bh=qhyI4sqWauYqpHvFn/+NXuk1xu/xBb+t4e/KlU09+2E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PUPaoqOBzqlXtPClXqAKjeqHTcLJn1B7NtH3/UXrZ71xEakcWGS7aocaK7ScyQfyW
	 QQi2iOP7WALAxobtzeRJJbtVAlXY+Z1lE2isoEWWCfTdiglu26Bq+uZ368BN/qHq11
	 0TmuXO/IHyJi3MuV+KBQeagbQO8ZEl86icLBluJ18Oi7FN7ArIXIixqqxAiTM+Ips7
	 hji9fc/9yD08N8VcIi5cbJwvE3alA9IJPLAYT/NEmmUrJFGWz/XMBlbKuExYaVPNwa
	 RdK5ing/yRtFnoMOh+TMvbl04gQKrNUPiKECCztJ4xrQTSvN62UowrpZcclHUQhRtA
	 01EFtNbLEG7EQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4gB9SZ44FYz4xSp;
	Thu,  7 May 2026 13:46:22 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4gB8Ql0gYvz8txj;
	Thu,  7 May 2026 12:59:43 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 6699460300;
	Thu,  7 May 2026 12:59:42 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <7b8293d0-7811-4def-bc96-56c0422f0ee7@leemhuis.info>
Date: Thu, 7 May 2026 12:59:41 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] hp-wmi fails to probe on HP OMEN (board 8D41)
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Krishna Chomal <krishna.chomal108@gmail.com>,
 yue li <mc.root.ly@gmail.com>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: 
 <CABd86uaQY9-ZSU-_PHKtZZyWnDFHLEsuaM+NBV5nOLWA+YSX7A@mail.gmail.com>
 <afb0f9gaS5z_SmRX@archlinux>
 <38bef028-d574-4e7a-b857-f10ab6796833@leemhuis.info>
 <553a4232-f4cb-4d67-bdee-067b5f038f64@leemhuis.info>
 <6d97e48a-be18-b99f-f4d5-aae50220ac53@linux.intel.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <6d97e48a-be18-b99f-f4d5-aae50220ac53@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <177815158265.3238059.15787342719840112857@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 6699460300
X-NC-CID: GNd2qBHRmS70DayF6MyDIQz4I25SbOv07OwM987i5cEpkKec1fc=

On 5/7/26 11:55, Ilpo Järvinen wrote:
> On Thu, 7 May 2026, Thorsten Leemhuis wrote:
>> On 5/4/26 09:22, Thorsten Leemhuis wrote:
>>> On 5/3/26 09:26, Krishna Chomal wrote:
>>>> On Thu, Apr 30, 2026 at 12:59:58PM +0800, yue li wrote:
>>>>> [...]
>>>>> Regression:
>>>>> The hp-wmi driver works correctly on kernel 6.18.6-zen1-1-zen,
>>>>> but fails to probe on 7.0.2-zen1-1-zen with error -22.
>>>>>
>>>>> Issue:
>>>>> On the affected kernel, loading the module fails:
>>>> [...]
>>>> Thanks for reporting. This is a known issue [1]. There are 2 failures in
>>>> your dmesg output:
>>>> 1. Unknown EC layout: The fix for this has been sent recently.
>>>>    Currently, it is in the review-ilpo-fixes branch [2].
>>
>> It[1] afaics is sitting there for a week already afaics.
> 
> I'm sorry to be a disappointment here, but I don't find a week a 
> particularly long time.

For a normal patch, I fully agree. But for a regression fix, it is a
long time[1]. And to me it looked like the patch "platform/x86: hp-wmi:
silence unknown board warning for 8D41"[2] was a the second and
necessary part of a fix for the regression Yue Li reported at the start
of this thread[3] -- without making it obvious in the patch description
that it was one, so you couldn't know, which is why I CCed you here.

But from looking at Krishna's earlier reply in this thread again, it now
seems to me like I misinterpreted the "applying the above mentioned 2
patch" statement, as 9d317a54e46d3b ("platform/x86: hp-wmi: fix fan
table parsing") [already in v7.1-rc1 and hopefully backported soon]
seems to be the main fix and the other one ("platform/x86: hp-wmi:
silence unknown board warning for 8D41"[2] just silences a warning that
is not causing trouble.

Sorry, my deepest apologies for causing trouble.

Ciao, Thorsten

[1]https://www.kernel.org/doc/html/latest/process/handling-regressions.html#on-how-quickly-regressions-should-be-fixed
[2]https://lore.kernel.org/all/20260429180953.129885-1-krishna.chomal108@gmail.com/

[3]https://lore.kernel.org/all/CABd86uaQY9-ZSU-_PHKtZZyWnDFHLEsuaM+NBV5nOLWA+YSX7A@mail.gmail.com/

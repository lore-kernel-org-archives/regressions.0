Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2A837B032
	for <regressions@lists.linux.dev>; Sun, 13 Sep 2026 19:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789327979; cv=none; b=QOgHJwAaz2iCHSJBeMK/rGRVNWiMQEezrvClmXmhOKMh1re0/m4tJA0ih2RclPnG8VnBF5OPI7+XylDjGy/HXI6YDMfA74Lnaiv6XCiGuiKkbaVy7eaJSN/XcGVTTexJS2GoEs8mflf7Lc9dpoim5sYHcnmHwabYilrYoZ7BLIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789327979; c=relaxed/simple;
	bh=iT3Bn3zO3h6ab+oeQYg8L8mbFRkTxT3dMJEVyJHWWeM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BAnmiIG2wjSwpBMZkkXPxK7OvkwQau8E5JD94aJhD/D2HZaaukjVsy2LLRsOqODSL3eGfFJu5gCUbXUUBhOtPPh8lPODT5IhDu+gBrV/tTckv1ahjKgHOppV/oZLmbCjayfCf6ZUS9NHlUnGE1qWAZgkVthtRpjI0UXV4Lxki/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=ZtLyJQ6h; arc=none smtp.client-ip=188.68.63.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="ZtLyJQ6h"
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4hjdjL71rqz6M1J;
	Sun, 13 Sep 2026 21:32:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1789327975;
	bh=iT3Bn3zO3h6ab+oeQYg8L8mbFRkTxT3dMJEVyJHWWeM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZtLyJQ6hJVXDGACE1Xc/+rNDuJNgyY4VzYY8wD7wbDNQkkOvvDG/JeFW+LsTC++p/
	 k+IWaUXlHVWjbYqQbj5OMhNOr955f+M+zcwf2y5QEYYZWF7Ew+zZlRBYszkywy2Z3O
	 PXbJVbHCdDsGd8fvO6OtqpEFs6DNTtys+k/MgLmdgIhFgrEmpUjgPew9sR+2/0Ngvz
	 Iid21QtFcws99sQHbqTyiGXsA3kp4gN0kwTiqCC69g37uK7Bx3QV1XqxaV/HuJR0m+
	 n20PqJmt2LKwZ+JTEqwWIg2hODBJrR1obfybN80BGP+JPgzIi1+TqD1KGKakCehHai
	 /pPwlQVgnlx2Q==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4hjdjL6JPYz4xNL;
	Sun, 13 Sep 2026 21:32:54 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hjdjL3Tkzz8sbH;
	Sun, 13 Sep 2026 21:32:54 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id B8C625FA75;
	Sun, 13 Sep 2026 21:32:53 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <e67d4f5e-22fe-4100-a06a-91a3d1cf38cb@leemhuis.info>
Date: Sun, 13 Sep 2026 21:32:52 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Quick regression status pre 7.3-rc3
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>
References: <46403cf8-9a81-4596-87eb-dde58ae4c5db@leemhuis.info>
 <CAHk-=wi70keQUG4ZDdXiG-HAeFQSzVBejEAUOgQy7rqdQ9EtUw@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: 
 <CAHk-=wi70keQUG4ZDdXiG-HAeFQSzVBejEAUOgQy7rqdQ9EtUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <178932797400.3906740.15021476886407595494@mxe9fb.netcup.net>
X-NC-CID: nDhK++Q/+7vX6RmkdCJ3jn8DGZeM8IncuFI93+P2SVxr06ypnpk=

On 9/13/26 19:40, Linus Torvalds wrote:
> On Sun, 13 Sept 2026 at 07:32, Thorsten Leemhuis
> <regressions@leemhuis.info> wrote:
>>
>> Hi Linus! Here is a quick report about a few unresolved regressions from
>> the current or the previous cycle that I found worth mentioning for one
>> reason or another; fixes are available for all of them:
> 
> I applied three patches for these issues and merged them. That
> hopefully takes care of at least the IPU bridge and the mt76 issues.

Thx!
> The rest appear to at least be in linux-next, and I left those alone.

Yeah, that's fine, so far it looks like that is a regression that is rare.
> Please do double-check that what I did matches what you expected...
Looks good from what I can see.

Side note: Some people suggested I should submit regression fixes like
the three you just applied directly to you as patches or through a git
tree you can pull.

Occasionally I think that might be a good idea, for example, in cases
where a maintainer is known to be on a vacation or something. That
approach also might make your Sunday evenings easier, too. If I'd sent
everything out on Thursday evenings (European time), it would also give
people a chance to speak up when needed before something stupid happens,
which is likely better than what we did here.

At the same time, I think that's a terrible idea, as bypassing the
maintainers' knowledge and setups (like subsystem-specific CIs)
obviously has many downsides and risks. Might also be a stupid idea for
the same reasons why the trivial tree failed and maybe was not a good
thing anyway.

Then again, I the risk of such bypassing might be a wake-up call
motivating some subsystems to mainline regression fixes faster.

In case you have any thoughts on that, I'd be interested to hear them.

Ciao, Thorsten

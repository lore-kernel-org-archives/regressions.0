Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F8B38F955
	for <regressions@lists.linux.dev>; Mon,  9 Mar 2026 10:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773052690; cv=none; b=UNuZBBZLC22aPD5yWb33byiWYtMEXd1eSXugyW9k3v/wOfx/lK0vSDf2ErAU/bD5TL8dyP+VTEC/pNbORCzmsGggsxD5KC2URz2fL78KheU4H3wbMDAr4EgI69yPRjmjG1obr6Mq9zzzh8I8BkbSY4yDt3xqNlc4fFx6umZIMV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773052690; c=relaxed/simple;
	bh=BqzA1te2B/7ynICtYnGZD9d8W0rdrXkSAJUR+LHByC4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CQGDQDXAeUxwDCxF5D3RpFZWkvUIy0m8pWb7Pv/xx2eBTHFdKmzrkiHphzumI8B3mB3xdxrUGV+9myc7ahb9/PHi2+EmaNeTzCZTdqRaa9EFCGlkrBu7kDPzWN7ToN71nXUOTmGIqEPTaKO5nnGAZvXmyvxnngV+W7twbFmy5zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=EHb1PLnD; arc=none smtp.client-ip=188.68.63.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="EHb1PLnD"
Received: from mors-relay8204.netcup.net (localhost [127.0.0.1])
	by mors-relay8204.netcup.net (Postfix) with ESMTPS id 4fTtZY6w8Bz8kgP;
	Mon,  9 Mar 2026 10:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1773052246;
	bh=BqzA1te2B/7ynICtYnGZD9d8W0rdrXkSAJUR+LHByC4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EHb1PLnDwpAxWe3X/Tqx4oTYkMjBMSRcjyU3ouTxquc9pn/cmnHVULBTzp2ze6/lt
	 rVedYtXD4KOGK277ZGVdXatQ2mc08leVcJqCTKjOYE6qNGbazn3C8TuJZA12+qjrpH
	 xkHiTCfrn1C+INdcye8ESKU/cPb32RbMONbykDtrVLX5awupceD8TBlyBNJfuxcTPf
	 8xpnBqLIrN2gqShVSts+e1FLSSh4pJdDUBxdb2ayEPLIGgDkXz5NdzlrCLW2q3oKof
	 cQUPUJjwL+a5TZwQHcwJ5y7g6N93o5w0yXXrHkUREvcUR+GG2Wo3Zo9ZIiyPFXqhDH
	 SI4ynatXL0xRA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay8204.netcup.net (Postfix) with ESMTPS id 4fTtZY69RJz8kYD;
	Mon,  9 Mar 2026 10:30:45 +0000 (UTC)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4fTtZY21Lvz8sbs;
	Mon,  9 Mar 2026 11:30:45 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 6E0F86176B;
	Mon,  9 Mar 2026 11:30:44 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <6e4d21f9-87cb-44ea-bb04-eb4f047f3ff5@leemhuis.info>
Date: Mon, 9 Mar 2026 11:30:42 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/3] soc: qcom: extend interface for big endian support
To: Bjorn Andersson <andersson@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <20251119104008.3505152-1-alexander.wilhelm@westermo.com>
 <dfb72933-938f-43f2-87f3-2e3ab9697125@ixit.cz>
 <mmd44dczfsfcjfhfikcjzaxongb6dwy4oqxtpv7t2jvyudzut4@hi3n3e7brse4>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <mmd44dczfsfcjfhfikcjzaxongb6dwy4oqxtpv7t2jvyudzut4@hi3n3e7brse4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <177305224482.628484.15274903014256727451@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 6E0F86176B
X-NC-CID: r4sVEQRX2v8XAJUvNL3AqqEizskwt8cI3E0fmZuqnS/dRS/ras0=

On 2/14/26 20:26, Bjorn Andersson wrote:
> On Wed, Jan 21, 2026 at 09:22:07AM +0100, David Heidelberg wrote:
>> On 19/11/2025 11:40, Alexander Wilhelm wrote:
>>> Currently, the QMI interface only works on little endian systems due to how
>>> it encodes and decodes data. Most QMI related data structures are defined
>>> in CPU native order and do not use endian specific types.
>>>
>>> Add support for endian conversion of basic element types in the QMI
>>> encoding and decoding logic. Fix the handling of QMI_DATA_LEN fields to
>>> ensure correct interpretation on big endian systems. These changes are
>>> required to allow QMI to operate correctly across architectures with
>>> different endianness.
>>> ---
>>
>> Hello,
>>
>> I recently (next-20260119) started receiving errors on Pixel 3:
>> [...]
>> Since it's not well tested, I believe there could be problem with
>> configuration, but after reverting this series, no errors pop up.
>>
>> I would believe maybe these errors was previously hidden, but just to be
>> sure asking here.
> 
> #regzbot ^introduced: fe099c387e06

Looks like nothing much has happened since then – or was there some
progress or even a solution I missed?

If no fix is in sight, might it be best to revert this series for now
and reapply it later once a solution was found? I assume that's what
Linus would likely want here at this point.

Ciao, Thorsten

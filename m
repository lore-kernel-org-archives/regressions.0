Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902632264C0
	for <regressions@lists.linux.dev>; Fri,  6 Mar 2026 11:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772796800; cv=none; b=V7e9I2USAQznbUBXNWyTAmDusmGWEpGlZsmm8OfSXnb5x4lrK9F/XLqEFkEAom39Od09FNubpSds4/HTijMnYnSa74szLEK9ErWa9O2TQJx9FFurQFfhl95ChOjcDEFpmmB4RFGGtqq4i39LH584etirjKPDL2gQ5IGL9PIro0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772796800; c=relaxed/simple;
	bh=UtAA7r1CC8B6J5WVE/+ZXi/2yhbr/t+Vpo2gHBsv+PU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=cszWGmHG2gCIbD7tErd548S6U51wgF8FPYL03y3inAeHDbNbZ9VOFpVOhb7NTwlup2vKr5O9UZHx3NgeGPZKV9JA30nZtWaBWS76Yrnk62JxZGTupG4OvS2zbiKVIITFdQ1Ws0dEX6mEss5kCKQ8p3v2tUH3kC1x2JkQPU6SwuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=ffo2wDhx; arc=none smtp.client-ip=188.68.61.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="ffo2wDhx"
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4fS4402QWNz81B9
	for <regressions@lists.linux.dev>; Fri,  6 Mar 2026 12:31:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1772796688;
	bh=UtAA7r1CC8B6J5WVE/+ZXi/2yhbr/t+Vpo2gHBsv+PU=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=ffo2wDhxGxRh0kscoAg+rdPc8iQ6ycj7Ru2dgvGMLaVlFrBQgOHwna4pzcgTsdfse
	 mU8DS+uhpCovXzqUkidYigpPsg0biew9VMdVbz0QgPAeA79QpUcDbITKOozD6WXl8w
	 60sacKkrldRQauVMWtXgoPXvbPM+V9geDQLZ0yl+MktkePggZR1xnTx5AGMMi10jQv
	 B5y4XOfEu68BwYwVX1Bvtgdc5hXH2H4SEL7U7BV3pH0YMqgE8hHG8YQJPM7NL7z7hP
	 Bp83MYPnMhw8wNDvgbt6cEejdFvAdKKIk4VAqngRMHzU+p6p0N5p2NEmTZay4yQ0Ia
	 EOg8Tqhw0xp0Q==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4fS4401kwVz812C
	for <regressions@lists.linux.dev>; Fri,  6 Mar 2026 12:31:28 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4fS43z5ht3z8t4S
	for <regressions@lists.linux.dev>; Fri,  6 Mar 2026 12:31:27 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id D36D4633D6
	for <regressions@lists.linux.dev>; Fri,  6 Mar 2026 12:31:26 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <9fbf162d-2c5b-4b94-b880-2c55ab98d307@leemhuis.info>
Date: Fri, 6 Mar 2026 12:31:26 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <177279668703.1642771.6549640901160932614@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: D36D4633D6
X-NC-CID: 8aeNSdb1sADu6i6gZkgTOo9konkQW0A5N856vaHHnexiFESuPf0=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://lore.kernel.org/all/23024521.EfDdHjke4D@steina-w/
#regzbot introduced: 9c03e30e3ade3
#regzbot title: PCI: imx6: i.MX8M Plus PCIe link fails with Gen1 PCIe

#regzbot report:
https://lore.kernel.org/all/n3qmcb62tepxltoskpf7ws6yiirc2so62ia23b42rj3wlmpl67@rvkbuirx7kkp/
#regzbot introduced: e0203ddf9af7
#regzbot title: media: verisilicon: boot failure on imx8mp due to
e0203ddf9af7
#regzbot fix: media: verisilicon: Fix kernel panic due to __initconst misuse
#regzbot monitor:
https://lore.kernel.org/all/20260305100149.722-1-ming.qian@oss.nxp.com/


#regzbot report:
https://lore.kernel.org/all/CAOKSTBs1VNBdjRZe3M2v-nC+pLZZ0-KQtRUZUj6ACqb4Xe7LDg@mail.gmail.com/
#regzbot introduced: v6.19..v7.0-rc1
#regzbot title: alsa: no audio anymore

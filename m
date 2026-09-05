Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7072236BCD7
	for <regressions@lists.linux.dev>; Sat,  5 Sep 2026 15:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788621219; cv=none; b=stJrNoCLmSiKSWfSQNvih2rvHCWa05Oa1OJyclxyh2MzUBoySFXb1JGSjwGfZuJPTqiIzfj/jYSLChXxh2ovMW0HtEIgtxzrHHk3M2ZQZHVxzgRBzMxRkEwIZpG1zTPKEQz9TItSKr8tVaEx+XlJfEwaLCnvEYpt90X/7txKQMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788621219; c=relaxed/simple;
	bh=GxnKD3bOIrv0V2khCXUFkBXBV/PTZDTW9ve/SaW0D1w=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=sIEf2fTlXLB7iKhfAuGqEzOBsWkpQviJ71zDMCowpUnAJd/gdv7SVvzNB/m4S7ggG25rNBoETwtsP+lm7YTamHL+biRnlMMiBbkvtvRlNg3LtlQp5SbGouuWoH6Yn1PySy3hZBddq0wcmnquQEj5+P9o/sy9Zh0t9Q2tOz/CLN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=EjSn1D+f; arc=none smtp.client-ip=188.68.61.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="EjSn1D+f"
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4hcc5r6fzxz8Dg5
	for <regressions@lists.linux.dev>; Sat,  5 Sep 2026 17:03:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1788620592;
	bh=GxnKD3bOIrv0V2khCXUFkBXBV/PTZDTW9ve/SaW0D1w=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=EjSn1D+f1znH1wY+7ds3W1NN8uxjRyPabX37xprV7FzDoUmIfW2d4peZHnDtMxr/9
	 d0w7gqKC1suy8Gg3b8SnxYY3VPEeJExId6KNXB3t/GLCkfCPYQVM53dyEaXzigTab6
	 hSZ+ChnfvUOvpTIXYvUTtTG77scDdUoOM/H1J0+wr6R4kbB/gos+3AV8J0DCHyFQ1k
	 pcr6R+8Kbo9qY7dN53aTuQ/GuAQQ46JSyYbl5jLVpZtD/7FCQhxwOY5sZF+sxZsXxD
	 6GIuZKphsYyC6S2b0eDZFVKgzr5Fe6bJvlzy1gaRxYIym1egqQk/poQVZq0e/Ls+a2
	 fGqE5rkTJu/Ig==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4hcc5r5ydKz8Dfr
	for <regressions@lists.linux.dev>; Sat,  5 Sep 2026 17:03:12 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4hcc5r2qBkz8tXL
	for <regressions@lists.linux.dev>; Sat,  5 Sep 2026 17:03:12 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id BD36C5FA5A
	for <regressions@lists.linux.dev>; Sat,  5 Sep 2026 17:03:10 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <2b476fc3-f519-43e8-a6d2-3e5132307858@leemhuis.info>
Date: Sat, 5 Sep 2026 17:03:09 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178862059163.39435.5073156588549353957@mxe9fb.netcup.net>
X-NC-CID: +lbqI9nYhCxDIL8kvxTbXUa01xtZqtTbQkvL6lDOBYYhyrEYnfs=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/dri-devel/CANkdJ2VvJQSBzyOq=LgSW1=Z8-YiN_r9Py2iJ0UJDo55%2BdbfuA@mail.gmail.com/
#regzbot fix: drm/amd/display: advertise PIXEL_NONE and PREMULTI blend
mode for DCE

#regzbot report: 6cd33b6f4155
#regzbot introduced:
https://lore.kernel.org/all/20260903104732.145353-2-krzysztof.kozlowski@oss.qualcomm.com/
#regzbot title: drm/msm/dsi: DSI display on Eliza and probably SM8750 broken
#regzbot monitor:
https://lore.kernel.org/all/20260903-fix-eliza-dsi-v1-1-3474a6c9f2e0@oss.qualcomm.com/

#regzbot report:
https://lore.kernel.org/linux-btrfs/018a9738-1d4a-43a0-9352-a56d1e541364@gmail.com/
#regzbot dup: https://lore.kernel.org/all/P0h7XLr--J-9@tutanota.com/
#regzbot dup:
https://lore.kernel.org/all/dfbe1e27-dab8-4d55-8cf3-0b28eeac5df4@gmail.com/

#regzbot report:
https://lore.kernel.org/all/IA0PR17MB668730A4ECCD65F7A1DC3EDC9EB62@IA0PR17MB6687.namprd17.prod.outlook.com/
#regzbot introduced: 105c42566a55
#regzbot title: ahci: JMicron JMB585 became unusable
#regzbot fix: ata: libahci: clear PxCLBU and PxFBU for AHCI_HFLAG_32BIT_ONLY
#regzbot monitor:
https://lore.kernel.org/all/20260904134310.1465051-2-cassel@kernel.org/

#regzbot report:
https://lore.kernel.org/regressions/c26ff09f-48d6-4ef3-9feb-8a8e6d6f37ba@benjiwiebe.com/
#regzbot fix: nfsd: don't offer flexfiles layouts when NFSv3 isn't being
served

#regzbot report:
https://lore.kernel.org/lkml/20260810-serial-v1-1-abbe51602c13@debian.org/
#regzbot fix: virtio_console: Fix alloc_buf(.gfp) usage
#regzbot dup:
https://lore.kernel.org/all/e084d7ed4c03020da3de5cbe1eb3a0c2055cbbd6.1787966331.git.tanggeliang@kylinos.cn/




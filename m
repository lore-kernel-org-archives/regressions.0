Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6249C37F8C1
	for <regressions@lists.linux.dev>; Wed, 13 May 2026 07:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778657719; cv=none; b=PSYxb40Ipadw0BlBEY5aN1IsVeXeTZSfjdxX3LqV1u4TIYNc5fCdT8v/XHRmBVtkPNqKgPh7L/6gkzdmd51XPN7lCeEXk56CSyAuCDfunwqr8JkLm7mTwQFRAHiMg/p8TYkVSziq0oDRPDXrKhBrznbVqQUlX3W6R8R072UoY/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778657719; c=relaxed/simple;
	bh=EcNCFdnmb4da9hdod00zUf+szlccQi45zfiem9cpmNQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=DSvDdjNgnxjqKhdkN9zPzq3XwF/ZAsD8qrQb7rsaqMmRObdukhyHe8pPM9pdH4fZA4kTpUA7+AFZaZW0liVo0uTsHOK1pUgVKsTbdXt2V42QzwQGgFrmF1J+8YZUHIizlm39K9S6yZk/r71IMAPXtCc7glKvP/zg0sVvNGJvPDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=Ef63Aauy; arc=none smtp.client-ip=188.68.63.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="Ef63Aauy"
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4gFlbz0Xjdz3wh2
	for <regressions@lists.linux.dev>; Wed, 13 May 2026 09:35:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1778657711;
	bh=EcNCFdnmb4da9hdod00zUf+szlccQi45zfiem9cpmNQ=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=Ef63Aauy6ViwhHmpTcjIPxNkkTwBLFw+ZP08TqE7+MgW+j1yfP9W+nPbo6fy6sA6p
	 nex89JTVzTVWMpR5GMfdfKduh/KgpTQmQ78nx61KUqSfiMSnDGreERToB+xaF3iWpW
	 KZStXHg5yJHnOoKqmYxlqchPdLCqfRmHYb3+oCiTQ0YmHHnkZqKGVvmH4LDaNysE0r
	 xv0FfYiPATbmW9MNYRJSjzPnZLJ4W4Xd7wezRBIKdQDoLnRgc0t+tXF51ZVinBRUvo
	 wayny4uc/RAmPWvV15InupvRlLXy9YOZdCO/6mCQl9AHVpG3NI0Ib14BJo776THV/I
	 adPRGX0qXjyvA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4gFlbK6vfwz3xmH
	for <regressions@lists.linux.dev>; Wed, 13 May 2026 09:34:37 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4gFlbK4mT8z8sZP
	for <regressions@lists.linux.dev>; Wed, 13 May 2026 09:34:37 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 2B64661857
	for <regressions@lists.linux.dev>; Wed, 13 May 2026 09:34:37 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <74a06b8a-c300-4b72-ba85-3cf426a3bdaf@leemhuis.info>
Date: Wed, 13 May 2026 09:34:36 +0200
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
X-PPP-Message-ID: <177865767738.2048419.8843341560127694078@mxe9fb.netcup.net>
X-NC-CID: QrvEM67eyMjeexVSiHZHYX05grPbq5nWov5CFH9M/EcgFapu5h8=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/CAMRc=MfADC2ncuUQiSW7TnUwBUWCJn9i=wZ9dqYMZNo2h6qOxw@mail.gmail.com/
#regzbot monitor:
https://lore.kernel.org/lkml/20260511082611.12721-1-bartosz.golaszewski@oss.qualcomm.com/

#regzbot report:
https://lore.kernel.org/all/5efe9e03-4d86-43a0-9ec2-e610ff31095d@free.fr/
#regzbot introduced: 8324a54f604d
#regzbot title: serial: 8250: BREAK + SysRq dispatch broken

#regzbot report:
https://lore.kernel.org/netdev/8fd5d3a3-d1d7-4542-a0db-1678989940d4@ovn.org/
#regzbot fix: netfilter: nf_conntrack_expect: restore helper propagation
via expectation

Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.59.206.189
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794500670;
	b=GUZ2IDA9j/wO/NtaDAGtm9TJnfW8NC6O/v7WzZLxPQNVgxeEDQmuBmAlJu5sN4In7cpB
	 KGvHle0gqm5GeH9WTZ0GAOFlndHzFvvgETPfL8Lx8kuJkKvuRIZWUO1SVKCR57DwYqnc5
	 JNp6eyO0HtZjyc+DLpVvXgXU7WMODSNE2mfkFtUab9GeSe+F1qoxoIIWsf5BnYUq+x+HG
	 TkKpN0X/p6RiXlvf3kLVvGXt3clfiAB3euGqZpUuyskGkIAF05oiTd+Y7JDe+X60a9Xf5
	 BmyzS01Sx/ieNAv7P3B6mzxsQiQ40TpbMAXff9fBHSo9E8BbEV4YhX1IlDRjIpoMpuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794500670;
	h=DMARC-Filter:Received:DKIM-Signature:Received:X-Virus-Scanned:
	 X-Spam-Flag:X-Spam-Score:X-Spam-Level:X-Spam-Status:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:
	 References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=Qz40XqOHN/v05VIm9wamktbGqsn6OwPezfE4FtLs1ww=;
	b=L+CQmPoqg6dCfcdOPofdwsl0gaEFGGUHtaQ5Ba5PBr7q43hMp1eZyWyM+rS5CYBtiZdG
	 kxraeafhYNQl4dY8wHoLU8zF9x7dIcBN+2lhyAHBansamyTrLBLC6tQK8PuVbGYsKvaZn
	 sOiLDStldGiqoTzyAsPFjwwy5tyquQM7ZXrdmBuln/I0xv9q+ORLtna0M9EBZBtkCzSox
	 58sXpkQI1OKC6ZwZygZ6lI7+8PPlBJLLM8RHSqgwbd8JO14+sVCWzRh6CkTB/NS0Pw2E7
	 EFXaIZgGWGHCJF7MP1Syric7ccZTiZ5iOpgITj9xmylobY73goame70Fci+8wgBzkXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=cquYXHLS;
	arc=none smtp.remote-ip=194.59.206.189
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [194.59.206.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32695606A31C
	for <regressions@lists.linux.dev>; Thu, 12 Nov 2026 16:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32695606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=cquYXHLS
Received: from relay02-mors.netcup.net (localhost [127.0.0.1])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4jQQh44lwkz4blj
	for <regressions@lists.linux.dev>; Thu, 12 Nov 2026 17:24:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1794500660;
	bh=Qz40XqOHN/v05VIm9wamktbGqsn6OwPezfE4FtLs1ww=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=cquYXHLST9FhmMYXoNTs5Z6hFGEMjhRfU9/Fc73IFr67wTQ+U7hlNUK4Uqzq0rYR0
	 Uy7wmAsBt4C/s9CnY6oCe5PAgqCfNhPjzbFxA9AgzrdMnfFbmHRZuYQiNrO0TRBvC8
	 4Jm7AfedjL8Cbf2o/EtLIelmkqeiJ+MHJ7Nuv0RNupU5tiUZwUnAPi3a8YCVODF6Gd
	 MIDev9M4HVecwFt03dE2oYausz4idSYNRZlu/UvQDEMWlkhvKdy6Do/aqN3iv0ubAs
	 eA9OvM1sQXor0DYvDwYCvU887yzWOBgPAzm8+JwS82cBAiYtcVlgS8Cy5snjsbvSFC
	 jzOqOsx6kLNXA==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by relay02-mors.netcup.net (Postfix) with ESMTPS id 4jQQdM6tmwz7xBb
	for <regressions@lists.linux.dev>; Thu, 12 Nov 2026 17:21:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4jQQdL666Pz8v43
	for <regressions@lists.linux.dev>; Thu, 12 Nov 2026 17:21:58 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id C215B5FA31
	for <regressions@lists.linux.dev>; Thu, 12 Nov 2026 17:21:52 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <c9dd4521-1283-49ff-8213-01b6ae24bf0c@leemhuis.info>
Date: Thu, 12 Nov 2026 17:21:52 +0100
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
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
X-PPP-Message-ID: 
 <179450051297.3025821.13368835270752555481@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: C215B5FA31
X-NC-CID: 6D/HCo4YXiu04IOJ1Tc7apYlE/RNPux/YqC9t39fhAPjLKNp00w=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/issues/5762
#regzbot dup: https://gitlab.freedesktop.org/drm/amd/-/work_items/5806
#regzbot dup: https://gitlab.freedesktop.org/drm/amd/-/work_items/6120

#regzbot report:
https://lore.kernel.org/linux-wireless/0A58E3B7800E469B+179421939016.46230.883154851683340495@guwolf.com/
#regzbot introduced: a76501e1d148
#regzbot title: wifi: rtw89: coex: 5 GHz 80 MHz/HE beacon loss followed
by auth timeout
#regzbot dup:
https://lore.kernel.org/all/CAOy1aSioNmBOPjLTsR3q_A8z2qF%3D7AC13TSvr%3Dmig_XrgbVXKw@mail.gmail.com/

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5388
#regzbot introduced: 20459c098d688971237
#regzbot title: drm/amdgpu: GPU hang on RX 5700 XT in Shadow of the Tomb
Raider and Witcher 3 Remastered



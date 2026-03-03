Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4403CD8B5
	for <regressions@lists.linux.dev>; Tue,  3 Mar 2026 11:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772535806; cv=none; b=TzgpX0XOq+a/8m4yUAPPOB9jz7QaSb7HlElmkuIm0VGUEsXjw07moA110BUUvS7dFYVa4wj5r5yosJ1fPheme6FlCYxgWckca+KJ807J+FGSHFsd7L2k2eNRE2f96zEGF5VEAxcjkBoreyf57zvo5wjss8mvbgLuHrsW6wciGqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772535806; c=relaxed/simple;
	bh=8vltZ9wJDTGpoAoI+qci6k0jPScC6hRjCR9fJ0dwuxs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=RpWl4Ow+GGswpbmfrhW447BLKS8fQBHxHgfLF9r6zUd9WPq+AHLt0/diUGiyGxKLp0NMTrjO7KcJq7JxqUMyZ/9qaWnHmaZPdZEkASrMxDJPaGPiDUq93ojJr5pGQNhCBjRh5kZHlp43IaltwhbTDWJM/cS/2Q/Qke3pCh5bvLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=EE0irPCW; arc=none smtp.client-ip=188.68.63.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="EE0irPCW"
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4fQCZx4NGMz44xH
	for <regressions@lists.linux.dev>; Tue,  3 Mar 2026 12:03:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1772535801;
	bh=8vltZ9wJDTGpoAoI+qci6k0jPScC6hRjCR9fJ0dwuxs=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=EE0irPCWf9vQScQyqWDTLPp16Eh6CLFvORNr8tdZQZvYtEeCDQFg/AzSS3ZsZrRqe
	 GrOQ+nvK1cpMtvHReqLXbStt+6IgSltzPqIWA5tPycBdIHUQZSrRyk8ORUrqOaQHXl
	 1s2InE++93o0dUALT0Nbsynew1qpFpXwruNGd3tO43WiU4yo49vM49kHdEqAxy4wPd
	 DI3gG0weLBt/O7optKTXCKevHwXGE80KtVToFHOoH0b2lpoeC/bqpSwUcuyorKvP2U
	 YbQHAAY6J8/IKLjAXXB4R9PyB+Exy42l5vzJDVAEt+WwafaBmkmoXeBFNzrWTx/aTn
	 yVPVFH5wNYWSg==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4fQCZx3dqzz44xG
	for <regressions@lists.linux.dev>; Tue,  3 Mar 2026 12:03:21 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4fQCZw6vL5z8sX5
	for <regressions@lists.linux.dev>; Tue,  3 Mar 2026 12:03:20 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 4DA12632B6
	for <regressions@lists.linux.dev>; Tue,  3 Mar 2026 12:03:20 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <942a6dc0-9d55-4e13-b05a-ccb31d41e5b0@leemhuis.info>
Date: Tue, 3 Mar 2026 12:03:19 +0100
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
X-PPP-Message-ID: <177253580049.3043536.7391120524957364656@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 4DA12632B6
X-NC-CID: hkcO45sCB/BUZkUTD2KO0E5P3uyh5mp43/r3NRrG6ckA1pJjcfo=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/a3ca5e9b-7446-497e-8df2-7ef2b42a02e9@w6rz.net/
#regzbot introduced: 324ecc7788c2e21d0d919
#regzbot title: spi: cadence-qspi: SPI failure on VisionFive 2 RISC-V board

#regzbot report:
https://lore.kernel.org/all/CAMX+G=Yd2fF+56+xFSzffO5Fq_PhkD41sBNkmFMpU5anN+QkmQ@mail.gmail.com/
#regzbot introduced: v6.14..v6.18
#regzbot title: net: wifi: HT/VHT/HE not negotiated, stuck at 54 Mbps

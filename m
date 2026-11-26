Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672240;
	b=RKC2yqrASDrQpKTXY5u8KUffrmZenF2x2yQFDAoeFNmHlJcxNSn7qCkPhU1eTJhdcTxR
	 /eBs/2otyj7yyf8o1mlYnB/TOMYNRsfrnR5zovQ/ndRMg9RlhX0fqzxapEsv4zFUy2Re3
	 NXIoxluyGgoGDaF5UFiXQAWxuIcQvXLtnHZhAzy/RS7XPkYzwy3T6jw2VP6j2GF+icpjt
	 ESuekOwjzeckxvxiAdBENrXHiJFZig+ugYO8zBpiGVqwqgMztSpTTbpRdjjCbQlPhuHCl
	 0ygQMrCwJtga78KR2N7scmmegua33Sv8QdB/3K48XpD2myH0SLyR/vwhkX+Y1JY40hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672240;
	h=DMARC-Filter:Received:DKIM-Signature:Received:X-Virus-Scanned:
	 X-Spam-Flag:X-Spam-Score:X-Spam-Level:X-Spam-Status:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:
	 References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=OqSNmPtlKN75g4tCLjZ+XcEsDFXNvED11y2UcIJCU/Y=;
	b=o802xT/smqOOSReWBbTqzHrBSPeSBkBzofLGkCMkvVGhoIegAtJmjSKZAqmYvfyAjAvC
	 N2Kkl1y/FmDoPXZQkIBLUDQgnBYZaHD+WlGPvfw4V1eIYWg6/2ypfGAwYwa0xrra4ywrG
	 /KidlnXTaVIto4u67DTkOXGAapGc7ME6F2Ms5AsFCdRfgnJHyrxynoAHIYfH4YVr/uXlu
	 1oWrLs/ScbstnXjjEOmKN4lu3vJGcC/+t0P+nPV2kSxma/+qKTlXap6YjzR9ws+Jqmzf7
	 Nrd9GhUPK3QNqYO0LpLGkV76yaTtbniYfCmRZR2s5FNh5IZgkwh/2kHmF/VmZ8nPa2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=YVskbpw5;
	arc=none smtp.remote-ip=188.68.63.166
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF66606A31C
	for <regressions@lists.linux.dev>; Thu, 26 Nov 2026 05:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AF66606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=YVskbpw5
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4jZlxb1DPXz4DyJ
	for <regressions@lists.linux.dev>; Thu, 26 Nov 2026 06:49:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1795672195;
	bh=OqSNmPtlKN75g4tCLjZ+XcEsDFXNvED11y2UcIJCU/Y=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=YVskbpw594t77sQaiDdU7Pm0HCV5gONp8n/BcYIQTl+ZGTrnZUXm1eKvi31el9440
	 DuHThmDdjySoaSDKl0gqjNt8ixffGSzh994wc3AVHvREiZ9EAbZpRD8owKcUwYRbxn
	 EEcRa/zH/RH3+nk1Oz0TKx+H05JRWr/hBSylgpCrZpQ3z25837ixCBCsNOq6HmR5d1
	 v0zs0lmg2/B5sXsqczcK+yl2yhoDdxRAvYhi5WsdRlBxVIKwdbhVQU3ktdsLapXAEE
	 Lnt95/TpBSM96h+tiygStOcpH/Ic2L+LNQn2pLGQnqw98vN2mIwfdr720Vdh8I918P
	 rIRUi6DHdQFcQ==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4jZlxb0Wtjz4Dts
	for <regressions@lists.linux.dev>; Thu, 26 Nov 2026 06:49:55 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4jZlxb5vWgz8v1b
	for <regressions@lists.linux.dev>; Thu, 26 Nov 2026 06:49:55 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 753075F8EB
	for <regressions@lists.linux.dev>; Thu, 26 Nov 2026 06:49:45 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <9ce12983-589d-480a-b7c3-125a3b008809@leemhuis.info>
Date: Thu, 26 Nov 2026 06:49:45 +0100
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
X-PPP-Message-ID: <179567218565.1165705.5154182714836431996@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 753075F8EB
X-NC-CID: qkJiBYs+lhXp69Wuh7vS+gSy0vL71R/AI6hJeWy6ItcWi9+Cz98=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/dri-devel/20261121101350.bab69dff11a2@gmail.com/
#regzbot dup:
https://lore.kernel.org/all/20261125111925.8651-1-laniel_francis@npnm.eu/
#regzbot dup:
https://lore.kernel.org/all/20261124213430.9525-1-postadelmaga@gmail.com/
#regzbot title: drm/nouveau: panics for GPUs without display
#regzbot fix: drm/nouveau/devinit/gf100-: fix double vbios init checks
#regzbot monitor:
https://lore.kernel.org/all/20261123-nouveau-fix-disp-v1-1-ebdc525287ce@redhat.com/

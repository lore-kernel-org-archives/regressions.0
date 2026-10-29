Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.244.194.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793259943;
	b=o/mfOz3fJi2lwOqRoGkmkTLv12LnMmhWGWJYUJgWNdoBiY+BDXA8ISrct3pSzNN7ryYZ
	 96owDCbcs3VnNW6jLBgEpX9TpuxMTCk6ROUJJb2ujCLWd6vKu2OzoN8kQlCClh9hUfgtA
	 Sh6yvf4NdPqme36sMGlpL8j9uG6+MNE6g1QXVVZzwSMlrXvaUj08+jbcghjNwVmhcYdaJ
	 ib4HFLUdv/aPyQVtJv1Afx3nMt5sZmpJDLFjLxb+ITokG9JWoUfIABJcx5/8XIaq3URm4
	 RfoHi8F+i7Wg/Ii7EkXfz5po9x+3+qMCtTiBEx6azQIHL2aXifCoMnk6nhiL6auQ2jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793259943;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=pKXJ9E/wDf0kP1q1OSywZuqVlXmxeGyksVbZY8r7vL0=;
	b=GcgH+Z3vvaikaPoh8peAAxUhi+ebwMVRTU0ihTk9TM0IQNtySGcTfirFzMFpGQ4rlcUv
	 4Tl6xBNApsG/zk7FLUuZMdwW1kzeYeSuSYhR8EgP/8y/zIMJX6tcth0JkbeLC5JJfsSUT
	 lUO8jY88vOL8Aw85QgWAQYsQV1Ue5ZquGOnCTHKt3Zqr1uEqPOHZb1GJY3K9t8dOC/5cQ
	 UEY8cE0AxvG6uF2Cz51XdHK2v3wIAXuxzXddfpL0Y1PbsNzOvsz0aJbF2eHi53gTkVBkU
	 6SpDUaZBQ/bknOyYtmByDvOgfWi1Rm7WHHZ1GM4VdlukWMBUEegMIdWv8qQpM/fobJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=EGqMfG86;
	arc=none smtp.remote-ip=185.244.194.184
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB0E606A320;
	Thu, 29 Oct 2026 07:45:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EB0E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=EGqMfG86
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4jFbqN619Nz9Qf6;
	Thu, 29 Oct 2026 08:45:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1793259904;
	bh=CtYdAddGRXFSFdteXA7RoueKJMyhgNC1sNbkP1+8NJs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EGqMfG86tSl6K2u5004HpfDVj4znLTtqh5DYC3sQ633PPybiAoPaflJzBXn5mRzBk
	 lDX20JYaQiMV7CW0uMduT5AAQuoY0HaGR5cbA26ECWqSS+ja8y+dLfcTDFzjZ2USFa
	 axP0stqtymnFs+FgFT05RBkUoDg0iANhCZ0TwO941Cv1L6Bbx9vKH6zZ1vTsD5OLou
	 b7vaom3aQKM32nIVhQaQpuDJ96aLQPx4EVEMk22CIteXQMz9ePcftDcbC2r+mr1CmJ
	 ybL9if1GoQVIX2F93BHAhuXBL1q/gV5qY0gSpwunGdNo2YPnSRI6B7cQmZCBcm3OQp
	 C5nZVdzCj1Ebg==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4jFbpd57PFz7yQT;
	Thu, 29 Oct 2026 08:44:25 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jFbpc5Xs7z8svX;
	Thu, 29 Oct 2026 08:44:24 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id DAD785FA6A;
	Thu, 29 Oct 2026 08:44:19 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <a4edbfec-7343-479b-8488-38bcc3f23ece@leemhuis.info>
Date: Thu, 29 Oct 2026 08:44:19 +0100
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
Subject: Re: [PATCH] usb: chipidea: otg: fix fsm deadlock and B-device gadget
 registration
To: Xu Yang <xu.yang_2@oss.nxp.com>, peter.chen@kernel.org,
 gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, jun.li@nxp.com, guptarud@gmail.com,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20261015084140.61544-1-xu.yang_2@oss.nxp.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <20261015084140.61544-1-xu.yang_2@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <179325986033.965064.17849910304133225518@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: DAD785FA6A
X-NC-CID: NA0sLkAT/+lE09eQUdVQHRSHCgVJEgML/RESAsK3YazA3iwjpDg=

On 10/15/26 10:41, Xu Yang wrote:
> From: Xu Yang <xu.yang_2@nxp.com>
> 
> Commit dd0c03d68522 ("usb: chipidea: udc: support dynamic gadget
> add/remove") introduced two regressions on the OTG FSM path:
>  [...]

Rudraksha Gupta: Have you tried if this fixed your problem? Or was it
fixed some other way meanwhile?
BTW, this patch afaics should also have this before the Closes: below:

 Reported-by: Rudraksha Gupta <guptarud@gmail.com>

Ciao, Thorsten

> Closes: https://lore.kernel.org/linux-usb/8e659c4f-723b-4241-9c2b-8ea42c6c3600@gmail.com
> Fixes: dd0c03d68522 ("usb: chipidea: udc: support dynamic gadget add/remove")
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

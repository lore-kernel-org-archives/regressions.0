Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997A83AC0FA
	for <regressions@lists.linux.dev>; Tue, 11 Aug 2026 07:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786432316; cv=none; b=R90OsucQj/L9QfEKPPqXP7QHaMbLDc0gqEkEkBhcPz1nsLEpwRiywzaSMZR9pR4Qq2tVKc3LNB7X9sVT/AmznC6JmCoHNCKr/tObiGo43GaO4lv99yAqNFMp8NK+ox9FdLpzUvYh4YYWK9f1iJ4erB9eForH4RCMTievT3Xpujc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786432316; c=relaxed/simple;
	bh=0JDHNyo2TYN/u+DxbganeqrwrjI3wiG9/+e3maJyImE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=bK/bh6q9PtGBjvcntO2fRi9S9UtdSKjn4xdCFsTKYzezLPyPel+XDI0AL8aM1Ulz6WMPNjqg+bsv1gGq3Fn+E/wgWuDUrjCVcwB6Bibbqd5qfWGCOwKAhjj36aIlhNS1nmNbBAyuMhq9sKF9NR/RJdSxJlzGsLfTtEinG01alPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=C27HHZ+6; arc=none smtp.client-ip=188.68.63.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="C27HHZ+6"
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4hK2qP4tkRz6Dx8
	for <regressions@lists.linux.dev>; Tue, 11 Aug 2026 09:11:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1786432305;
	bh=0JDHNyo2TYN/u+DxbganeqrwrjI3wiG9/+e3maJyImE=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=C27HHZ+6ZULEsdB+W0QIpUJtlezZ6YKUqolccPZHE2mfZ62L0ZtIxg6ChekzETXjG
	 AGx05yeFJFRt+NAa9OgHRMCx+mthbABJBzDvnvhj7Fr/SgQyGmj/KdR/d4WDDhtbz0
	 lb9IaIPeirYCli1+5BF626/qhV17okZiol+PeuESZSNRTpHa4DLRpjyWqCR1tDtYEu
	 ggpEVpFkCNzB2uFRK10QwnFe3s8GCltg23fAHHNJoJdOuVshd7B1xVa7GySHnoFlwe
	 j3tmTIWMdIfeHnnIEmKEdKl9iiSNrGG1PTLuMOSEhvsiQwrLl226klUKcru9FM5Ds4
	 SigkZl2FZYPtA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4hK2qP49jlz4xcZ
	for <regressions@lists.linux.dev>; Tue, 11 Aug 2026 09:11:45 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hK2qP2DjHz8sbD
	for <regressions@lists.linux.dev>; Tue, 11 Aug 2026 09:11:45 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 9A82E5F959
	for <regressions@lists.linux.dev>; Tue, 11 Aug 2026 09:11:40 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <8cfd1d00-7e47-4c43-8f27-82951c397974@leemhuis.info>
Date: Tue, 11 Aug 2026 09:11:40 +0200
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
X-PPP-Message-ID: 
 <178643230079.1495153.15166518594429598851@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 9A82E5F959
X-NC-CID: HxQuech4YwVC1e9EDvm8r6CggsdRXH7KiUGMzfQTfFGuLwQUUOQ=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/bl7i3obu2clzsgeoct2a4mtfhv6typcjdqmgneropf3hpgwve6@n2m5uhlduw57/
#regzbot introduced: 7678e81498e2
#regzbot title: PCI: imx6: PCIe is not longer working after boot
regression was fixed

#regzbot report:
https://lore.kernel.org/all/75fb5359-b268-492d-8d4a-504d1af60f2a@app.fastmail.com/
#regzbot introduced: 3e7d63037a2b
#regzbot title: cifs: openat with O_TMPFILE returns -1 ENOENT
#regzbot fix: smb/client: return EOPNOTSUPP for unsupported O_TMPFILE
#regzbot monitor:
https://lore.kernel.org/linux-cifs/20260807085806.725742-1-chenxiaosong@chenxiaosong.com/

#regzbot report:
https://lore.kernel.org/all/TfhgV1W0W5LI6RWUO6J35B3R8QIYH_FN3Eihzdo_9PH39hfn1AVByT-QBPHmWiAR-L0Kqi2sppM_EhFPKwZPGmb5pFgpF2MrzeFzkZDmpG8=@proton.me/
#regzbot introduced: 45c211ddf92a
#regzbot title: drm/sched: FAIR policy causes serious performance
degradation

#regzbot report:
https://lore.kernel.org/all/96dae110-f79b-4e54-8a9b-514369019b5d@linux.ibm.com/
#regzbot introduced: bee25f97ad24
#regzbot title: powerpc: Power9 pseries boot hang

#regzbot report:
https://lore.kernel.org/all/6f9bfb0f-b14c-468e-bb9f-c157d120d0dc@linux.ibm.com/
#regzbot introduced: 334f3f6d7a1660
#regzbot title: powerpc/entry: indefinitely warnings and system never
completes boot



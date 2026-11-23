Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795425657;
	b=yTY170E307Mvt3EAOWNQ8BDsl9gyMbETDppRtykHPTfXTeYM2XmHj1LBNrIOGfQR81wF
	 siXTuEp8VLBtC6gSzpQSWfE4QrYlUfA097zzqz7uaRFfV5QGSik5wUayPjY2yFgLtv+VB
	 es4ZBWauiVy/A3eEx2839kcTjk05exA7QbdUTbohGzM6DwKAnSdhGVepfznvnPrusyjBh
	 sFhFZgMYqdYyDZkphDjmr4XnLbJe2/5/94sQ4G3g6FXwq6Hp0E6ixY/+TwRTvM8ooWiFj
	 CoAtpJn/Y8JtDWWuwFyG7sCVV2sXreJ9RCpc4BISWKzzEfqXEOlQHyP6r7Yzw1+lBZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795425657;
	h=DMARC-Filter:Received:DKIM-Signature:Received:X-Virus-Scanned:
	 X-Spam-Flag:X-Spam-Score:X-Spam-Level:X-Spam-Status:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:
	 References:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=+x19aiOTaxH3XtYDkDOQR3CDrFOAa0y1NWB8p30AqmA=;
	b=Eg1BU1YedfWg4UqG0lyoKOasNt4QjDQXunYy2/xVzGheHfqCVqZ9sFIPFQ2iYYBOQsWN
	 Zr8VRxQNVA/4o9DFXx01eCAkw1XIQ3qzfWoBSyUe/Uu9lZLq3i9tXeYYo0TQG3m7bsHHp
	 Z0q7aRFgdYqVp1zTenoLFeI3eeqry/J9PuSpVQmrv11HV1hMwticncE6a6nKGdlxehuwJ
	 2DjkeYhXvAVkwSXAcmONH1zvmNg/BO7//aLo2zufJCFVQtzlJsSby+tylIFgyjCp3381P
	 /s6dPZddh8mGgr0SQWSKjnFgah0/Vkxy/Xd6esM74GyzzL4byb891I1kGmZpuPYJKzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=N3xctTYj;
	arc=none smtp.remote-ip=188.68.63.170
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FC2606A6B5
	for <regressions@lists.linux.dev>; Mon, 23 Nov 2026 09:20:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69FC2606A6B5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=N3xctTYj
Received: from mors-relay8203.netcup.net (localhost [127.0.0.1])
	by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4jY0mK52NGz8qQV
	for <regressions@lists.linux.dev>; Mon, 23 Nov 2026 09:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1795425649;
	bh=QH8VbvcBXv3Xq7BSoO/tDSj637wOT21tG5tuoW4c3YA=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=N3xctTYjUpVH8j2owMw/1PDU2GUSYerXWwwBlIoKXrLFDEKf/THWb/HWCJsaczJjK
	 6nhdTOG1YF10BLntyFEBYaQnee2W2u1xvr4RaeIpzCqkIc43Uml0BmVWB67sq1TX12
	 n3qkqcBTGH+BLJWlcm8UTIR74KJ3z8TJ0gs17/eXDb/BGfdXB1yV2andWDdSHLX/70
	 lZIPNGO3YSwubdE931mLCB6naTmk5T089u1XdyYfRbhTOZcQsRHjzgi6iuQFCsBqhQ
	 4w110+XfvMUO/W/H6dOdWN5nUuL6f4KIOiG2k8RaPisIo+C21MKK+6tGfBu2vxCfk3
	 quAdW5fDiawjg==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay8203.netcup.net (Postfix) with ESMTPS id 4jY0mK4LFxz8qQC
	for <regressions@lists.linux.dev>; Mon, 23 Nov 2026 09:20:49 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4jY0mJ6vjzz8vK6
	for <regressions@lists.linux.dev>; Mon, 23 Nov 2026 10:20:48 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 3D8B45FD2E
	for <regressions@lists.linux.dev>; Mon, 23 Nov 2026 10:20:40 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <9fbaed0b-2b98-4625-8b29-aad5d6bb607a@leemhuis.info>
Date: Mon, 23 Nov 2026 10:20:38 +0100
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
 <179542564044.1249608.13158753329412644409@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 3D8B45FD2E
X-NC-CID: K5XA4u5Uxh2EE+Xac5Fu0VmnEYCEnHpEq9tSqBikAHKvUh0gXhM=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/netdev/MAEpYNlWKRd7lM0j62YlEZ97Ux1h5AyjSuFRm4Lxk2Q6haeDGTKqX8lpDRZ8slvBu6qA7Bbt18zpr9fyF_jArrEemTgRqzqluxmsGH7UcFk=@protonmail.com/
#regzbot fix: netfilter: flowtable: cache destination hw address for
XMIT_NEIGH type

#regzbot report:
https://lore.kernel.org/all/20261121101350.bab69dff11a2@gmail.com/
#regzbot introduced: 2139cb633d48
#regzbot title: drm/nouveau:  machine hangs during boot

#regzbot report:
https://lore.kernel.org/all/CAFS5DSFUi28HgX8t5bRRGVqPkOZ+VqrP+LtyMiwPQhyRpTxFTg@mail.gmail.com/
#regzbot resolve: likely fixed in 7.4-rc (see replies to report)

#regzbot report:
https://lore.kernel.org/linux-arm-kernel/20261119114041.GA166708@francesco-nb/
#regzbot dup:
https://lore.kernel.org/linux-arm-kernel/avrLnVFtgobyTwN1@francesco-nb/

#regzbot report:
https://lore.kernel.org/all/CAAk_qkgY_To5dwBgua8NBpUv7YWB6g1w5b2g6+BzQ5=mqgq6dA@mail.gmail.com/
#regzbot introduced: 108704eecab9
#regzbot title: ALSA: hda/realtek: speaker and mic-mute LEDs stopped
tracking mute state



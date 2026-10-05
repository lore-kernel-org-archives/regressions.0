Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08F130F7FF
	for <regressions@lists.linux.dev>; Mon,  5 Oct 2026 05:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.162
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791178772; cv=none; b=ZSogEefilWAwXZj1swTxQtDUK+Xe2WYP+ZIGS6asPxzO2Nbod5IB6A/pfKc4ix05YNYfB+Mlnr+hdpgxNTtgFqbQ+OmJAQxkbzbbEQKYarkS+v6OUE1cfLtYMOj5XvdmVht4L8I1zVG3DvqIFV3lkJxXVvIZe8lWU3Om1grjztE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791178772; c=relaxed/simple;
	bh=wn6TwPiZUgOclOBhAP50Vd7XXYb5ZsyE3vm1+WY+tCk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=ffHWT7miDFR0KEKiKIIHY59GLVwDhNcKieKeyW5rgfRJFpGZ3l7tcyrjKeR4rkNdhljyeuUsHavF76YGiL3frafcwiSqRsevuzxx1Ks8iRjekTJYC194ggvGoG1OCbD5xpdEUNOrhbNZtr8kZS77ou79AXIPcYwrpje26COshjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=jUx9lE7H; arc=none smtp.client-ip=188.68.63.162
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="jUx9lE7H"
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4hynzW48HFz48DX
	for <regressions@lists.linux.dev>; Mon,  5 Oct 2026 07:30:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1791178247;
	bh=wn6TwPiZUgOclOBhAP50Vd7XXYb5ZsyE3vm1+WY+tCk=;
	h=Date:Subject:From:To:References:In-Reply-To:From;
	b=jUx9lE7HOycgUzLcpnkktxRZ5WiLH4S2k4Lky1Tt109jue9qe0tor+et7fXLnQbmS
	 fmx/IS8ElXNg3SaHcygpyDRsFBuW+vpA9gfwgJklG9KXOq3Wi8bHVzpHWOOJIRjkqo
	 2zmIAEklOL9GmCUPkOJUzkYJH7mbhFruJ0BwEPM/wHCVhO3VH3E9EQkTFVdstj9nJq
	 GG5xXbTDdBiNPdRtEhyPyXvFo7HB/rD56u7seFvKTW3WHtR9s64NuKfQr1ORCp0Wuj
	 rgURvA2wBdfj2Vv0kEoVKfLKPuVD7r4kEwOUU8leF1IkTkcsXenHWPF3RwWfJ+9vdD
	 sJgli0Pl4gFjQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4hynzW3RMpz456W
	for <regressions@lists.linux.dev>; Mon,  5 Oct 2026 07:30:47 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hynzW1b8mz8sgw
	for <regressions@lists.linux.dev>; Mon,  5 Oct 2026 07:30:47 +0200 (CEST)
Received: from [10.100.0.149] (90-177-213-3.rck.o2.cz [90.177.213.3])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id A95295FA80
	for <regressions@lists.linux.dev>; Mon,  5 Oct 2026 07:30:42 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 90.177.213.3) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[10.100.0.149]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <d81824c1-f802-4488-960d-6545cbe51f6e@leemhuis.info>
Date: Mon, 5 Oct 2026 07:30:42 +0200
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
X-PPP-Message-ID: <179117824283.2286747.4506403394906356823@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: A95295FA80
X-NC-CID: Piub5qmBffClE+aeUqtI3EeHUEesq3tuiVrMuB1Mn4qN6M2Odmk=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=222071
#regzbot introduced: 2a70e5dc0301ad961b198f086a39e2479f6b8
#regzbot title: usb: xhci_hcd: Resuming from hibernation fails with "Not
enough host resources"

#regzbot report:
https://lore.kernel.org/all/DM6PR02MB5433F3C2A156335B6ED47756EA8E2@DM6PR02MB5433.namprd02.prod.outlook.com/
#regzbot introduced: 4b490e0d103c
#regzbot title: ALSA snd-ctxfi: no PCM playback

#regzbot report: https://lore.kernel.org/all/ar_AuRr1eaZzOfw9@baldur/
#regzbot introduced: 93b6c8d10fad
#regzbot title: drm/msm/a8xx: failure during boot

#regzbot report:
https://lore.kernel.org/all/20261004122616.56714cbd@nargothrond/
#regzbot introduced: 447cbe95ebb9
#regzbot title: vlan: IOMMU DMA faults on macvlan/vlan with bnxt_en

#regzbot report:
https://lore.kernel.org/all/77888c45-0b12-4973-a9c8-9aa5d70eb1b5@gamesplit.cz/
#regzbot introduced: f0866517be9345
#regzbot title: HID: logitech-hidpp: hi-res wheel scrolling over
Lightspeed receiver (G903) broken

#regzbot report:
https://lore.kernel.org/all/179104011040.2214689.5921682013387867802@eldamar.lan/

#regzbot introduced: 980084de4d9b25
#regzbot title: Bluetooth: btusb: bt stopped working due to missing firmware

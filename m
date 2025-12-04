Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8CC2D23B6
	for <regressions@lists.linux.dev>; Thu,  4 Dec 2025 15:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764861145; cv=none; b=qx1IjlCaFtVVr/uqlKgYgI27OYS6B5lS3IcxLP3SyxAKPKAwIWlDNRSmcBqnuA8qDtDkN3su5LO2VljjW6dEuk/t052UuTWoNA0WLq42hD7bO0UGCdN6+9zTm8QmYYKCxRgwOilg8umnM15PpEMWn5TawOlMbXBiO67AS1039E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764861145; c=relaxed/simple;
	bh=BqZAt9zUB0wzltQnBqcXlULJz+vS01r+v7zyEGDjEeU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=fc3egxvgdi4fXi7leDnoJHGPJ5qwBShgE6N5AEz/nI2nnelSQB8YxXHHe6wLgKIfl4TzCLGRWSvQWfhDOtbHgA+eHtpMOPJ4m7u3Q+PtFoVOTq58I9flcRbd63um/IM38jnyLAtUIVc4OrVywYyfYOlAVZzzxThiihby85anb1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=L88NU8nB; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="L88NU8nB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=BqZAt9zUB0wzltQnBqcXlULJz+vS01r+v7zyEGDjEeU=; t=1764861144;
	x=1765293144; b=L88NU8nBQze0S6BWoLpbOhYVUHgQFVVG9s4JAIp+ziAgb1B45k3YyS58XXerb
	0122CFUr2T2bYxYyCyDJGmQFMjNd93a69mnwORNWp4tDncFMs80hWMNgF2qu39ZkUDmxQHYxnwMNe
	KqzxDEebJGI8d7UA2WgGRplU8BhYYlhrR6fIcyhqnj/qj3L4MNkQ8o+ztB55MtyETTmJHADpl8scl
	oLJhnbLCiZr1lT+hVUC1fDe899bt8ez41fFEnSHs2AzS8IkC4geEKjMc5eAry9KIusrjNzmi1plkQ
	/JvsSIOs7cQx46E6Lso+2XbZGdM7Y2TZ3+8O6aW3tFjzartLLA==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1vRB0H-009K4I-2p;
	Thu, 04 Dec 2025 16:12:21 +0100
Message-ID: <eeedbdc5-6258-487f-8705-1e5480c76a8b@leemhuis.info>
Date: Thu, 4 Dec 2025 16:12:21 +0100
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1764861144;836d7713;
X-HE-SMSGID: 1vRB0H-009K4I-2p



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/stable/jOB6zqCC3xjlPPJXwPYPb4MxHJOhxVgp380ayP7lYq-aT2iA5D8YCdMeCvq5Cp_ICZmqjpfgX8o9siQdlPu9DY4qgnL_zCjgqP23fXc-P4U=@proton.me/
#regzbot resolve: the fix (c884a0b27b4 ("Bluetooth: btusb: mediatek:
Avoid btusb_mtk_claim_iso_intf() NULL deref")) is backported to latest
stable series

#regzbot report:
https://lore.kernel.org/linux-pci/DM4PR05MB102707B8CDF84D776C39F22F2C7F0A@DM4PR05MB10270.namprd05.prod.outlook.com/
#regzbot fix: 823576c894d7325

#regzbot report:
https://lore.kernel.org/linux-pci/8d6887a5-60bc-423c-8f7a-87b4ab739f6a@hartkopp.net/
#regzbot resolve: fixed by e433110eb5bf06 ("PCI: vmd: Override
irq_startup()/irq_shutdown() in vmd_init_dev_msi_info()") [v6.18-rc2]

#regzbot report:
https://lore.kernel.org/lkml/4b392af8847cc19720ffcd53865f60ab3edc56b3.camel@sapience.com/
#regzbot resolve: fixed by e433110eb5bf06 ("PCI: vmd: Override
irq_startup()/irq_shutdown() in vmd_init_dev_msi_info()") [v6.18-rc2]

#regzbot report:
https://lore.kernel.org/linux-pci/20251112194441.GA2238830@bhelgaas/
#regzbot report: unlink https://bugzilla.kernel.org/show_bug.cgi?id=220775
#regzbot dup: https://bugzilla.kernel.org/show_bug.cgi?id=220775
#regzbot fix: PCI: Rewrite bridge window head alignment function
#regzbot monitor:
https://lore.kernel.org/all/20251128115021.4287-1-ilpo.jarvinen@linux.intel.com/



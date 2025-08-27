Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7922242D88
	for <regressions@lists.linux.dev>; Wed, 27 Aug 2025 08:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756285054; cv=none; b=ARnuiY3XQUZaG22wp4+p6vccMC5hVIVhOsP2huxj5/OF78A5L+G5J5YwvKNQMQrmJU4FXUeFKbl5Dmd2gWiqVcs8RsGRdSjjXD3utXuX4xsrW20bCnA9EQdY8IhVz2Q939UztzVGkCwfcwSMNTB4zsiWrM+5PlW7lc1Da6WsVJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756285054; c=relaxed/simple;
	bh=D1aFNYXa3vbfJR0eE8AUo81p6mTlVUEKbnLrMkxj01A=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=o2JHHt73tUKuTaGkTV5nD4jWNQworM/XsFK3z2RlagQt943+QK2eJGoLJjYUn08wZaGIjE3ARVfbCM4c1QYdXbE1e0VlodQ128j8EnsYLDR9Yo2LUGxIWT1UsXvCAps5lt4Fa2b1oOrhm+Jca8vC+qbZ+cRnJLpGaCIXAu3iZC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=0yz1grKn; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="0yz1grKn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=D1aFNYXa3vbfJR0eE8AUo81p6mTlVUEKbnLrMkxj01A=; t=1756285052;
	x=1756717052; b=0yz1grKnjLSEvnk/vewi7y4uLVQbnTLgo0Cnqry5mXCkyKYGkrXoFp7x8diDV
	HlUZer0LmfS6/SyuckhY9Eooy6ZXHdvupUvX198Pr648muhceb/odNAlvO4wPEZMzp5DYEFbq/Rzu
	rh03g9sTw3jU6pS/g0MGZAUgR5/t6wy7v/GYdMJpyffsWdnOvoyr6i+Igxacnpyn2Sv5wbKVucS/R
	pZsNvBIZ8Lby9CsLGkVHyYN/qZjS06Zzhwo0Gk+PMthXluptNvS0kjX0+ua4HXEBG00tCLqcJjHmc
	OWaz9SLxuNnziz6fJLeSICTsh3QIFVVxolozeIvKYBwD1rXolw==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1urBy9-00HKrm-0z;
	Wed, 27 Aug 2025 10:57:25 +0200
Message-ID: <e90dddfc-06e3-4837-8855-fff8b9a59266@leemhuis.info>
Date: Wed, 27 Aug 2025 10:57:24 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1756285052;a1aef109;
X-HE-SMSGID: 1urBy9-00HKrm-0z



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.


#regzbot report:
https://lore.kernel.org/lkml/3d7f77d2-b1f8-4d49-b36a-927a943efc2f@heusel.eu/
#regzbot fix: 3471c1400ad177db74dc (not the real fix, just the last in a
series resolving the problem)

#regzbot report:
https://lore.kernel.org/all/20250822165231.4353-4-bacs@librecast.net/
#regzbot introduced: 9e30ecf23b1b
#regzbot summary: net: ipv4: IPv4 broadcast packets have their ethernet
destination field mangled
#regzbot monitor:
https://lore.kernel.org/regressions/20250822165231.4353-4-bacs@librecast.net/


#regzbot report:
https://lore.kernel.org/linux-wireless/CA%2BXfe4FjUmzM5mvPxGbpJsF3SvSdE5_wgxvgFJ0bsdrKODVXCQ@mail.gmail.com/
#regzbot resolve: unconclusive: old, might not be fixed, but not worth
tracking anymore

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/issues/3638
#regzbot resolve: unconclusive: old, might not be fixed, but not worth
tracking anymore

#regzbot report:
https://lore.kernel.org/linux-pci/20250611101442.387378-1-hui.wang@canonical.com/
#regzbot summary: PCI: RRS polling broken on Intel SSDPE2KX020T8 nvme

#regzbot report:
https://lore.kernel.org/lkml/kgasjsq2s4pshravsinycfihdfjhdts5iz2fox42aejs4xqhce@frurksambnk3/
#regzbot fix: drm/virtio: fix host visible memory detection in virtio-gpu
#regzbot monitor:
https://lore.kernel.org/all/20250827081231.1878248-1-honglei1.huang@amd.com/

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=220479
#regzbot summary: PCI: mvebu: no pci devices detected anymore on turris
omnia

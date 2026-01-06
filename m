Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440B11DE2AD
	for <regressions@lists.linux.dev>; Tue,  6 Jan 2026 14:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767708999; cv=none; b=qQB4qV0wdEQVQJ4JbnCbn2OkHxOeM5Pxlsf3I6y5UjmfnnnUbZNnKkDlcjYSDbyTSYy90RfVxvSupfY9dAkU3ecLwa6t7AsS6ZVzbMQEweH0ZxBF3az/Tlb5QNkjwl/IJw4QBKX9lOoMGzTYNpWV696p6pjf2iPk3yCdEC5N6CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767708999; c=relaxed/simple;
	bh=QJxp9o1SrLQ4m8999BrW4rPSoqufrExrKIUHLoOpVKM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Civx94/OM8TQcIv1i10JoymHVyhQoEYu7pA6SEGHPNV+9wNpx6IN2yOSlqOsSF2/4hW+RjcQjlxBFPuxsgg4TnqWZf029qqXdk+NfmyKQ3m7LgbCbBueDPAoD1sBdHT9RViv956jFtjHv+hTGIa9qB4nSKTZQwlYIQMnysxfIes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=HPmzT4To; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="HPmzT4To"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=QJxp9o1SrLQ4m8999BrW4rPSoqufrExrKIUHLoOpVKM=; t=1767708997;
	x=1768140997; b=HPmzT4ToOMgD7sS0xjX24g5NPcOzUkkivhI2VI6q3gyQFrULWxwO/ReVdPPNq
	MmpiZzwNEGsk/n7coCFvjQ2wSnTlLCnZU/6LKoNDZWaoRySqErgl03iKWraa7mo2NfqdmCltDF5fw
	LYCq/jWrocym98nMWBvdqQQMANJvJHs6QMRrJ/fwmPI1YgvHJymjWDqEhCePAVPD0MdWFps6L9ctF
	ARCMbkPtM+dDaOAOj551BbSFnFk92jzcge46wbuWP3imYjr/UyJDcLeAS7TzVZ30eb7SV1trqFeu9
	yC9IwzYkeiSJ/oNdqIewAxhnm7QTDfMIEAqbFQyRhGifwSusEg==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1vd7rP-004qcv-1v;
	Tue, 06 Jan 2026 15:16:35 +0100
Message-ID: <d9b2d2e0-18b7-4f4f-b6ea-e0f626cb8b2c@leemhuis.info>
Date: Tue, 6 Jan 2026 15:16:35 +0100
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1767708997;c467ab82;
X-HE-SMSGID: 1vd7rP-004qcv-1v



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/linux-pci/20251112194441.GA2238830@bhelgaas/
#regzbot duplicate: https://bugzilla.kernel.org/show_bug.cgi?id=220775
#regzbot introduced: 3a8660878839
#regzbot fix: PCI: Rewrite bridge window head alignment function

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=220803
#regzbot fix: arm64: dts: mediatek: mt8183: Add missing endpoint IDs to
display graph
#regzbot monitor:
https://lore.kernel.org/all/20260106-mt8183-display-graph-v2-1-e7e56054eef5@abscue.de/

#regzbot report:
https://lore.kernel.org/lkml/20251216-revert_sriov_lock-v3-0-dac4925a7621@linux.ibm.com/
#regzbot fix: PCI/IOV: Fix race between SR-IOV enable/disable and hotplug
#regzbot monitor:
https://lore.kernel.org/lkml/20251216-revert_sriov_lock-v3-0-dac4925a7621@linux.ibm.com/

#regzbot report: https://lore.kernel.org/lkml/aO07Gt9ZtECKuGkJ@eldamar.lan/
#regzbot fix: 927069c4ac2cd

#regzbot report:
https://lore.kernel.org/linux-pci/owewi3sswao4jt5qn3ntm533lvxe3jlovhjbdufq3uedbuztxt@76nft22vboxv/
#regzbot dup: https://bugzilla.kernel.org/show_bug.cgi?id=220705#c6

#regzbot report:
https://lore.kernel.org/linux-iommu/hnwgn7glub4klmkzabzcm76eldaa3xm5ua72eldwzesblveo2a@4xq2bxhmbsyq/
#regzbot fix: of: reserved_mem: Allow reserved_mem framework detect
"cma=" kernel param
#regzbot monitor:
https://lore.kernel.org/linux-iommu/20251210002027.1171519-1-oreoluwa.babatunde@oss.qualcomm.com/

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=220774
#regzbot introduced: ec8e0e3d7adef940





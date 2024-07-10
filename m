Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D201C848E
	for <regressions@lists.linux.dev>; Wed, 10 Jul 2024 17:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720633668; cv=none; b=ChFBHPKjhe4Pjfys5OnekZq0xvJFuDDR1dyeyAo4NOraKB/e3HyGvg152f+XkUBL4HUBoy/BY745gWrKWGxcuNsS0w73Heo4X0ALQKRYcyrgNag3TblqBAYy/kn6+FiHf4SUIiMTKRQRyAoqvFC3jTc2WZDIi+VXjEwXH+WWmRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720633668; c=relaxed/simple;
	bh=efTqtViJJCQXSf2Lh2tRxpTH3KDrFOhERXSCFDaCWDw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=FkfUrE7643Nc4djZ4G11AUGA7KwkqgCqZHIq/scfuQXOYfBKCt9ZLcPK8BWFpBijUdkq9RRd1nkyuPze8QSll/Ojm4dWqrT99l8Mvq81oTrAS67n+rFhS8nvt9NPFWdIojS/1j9f4ewGUteG/ooQXV/f0Vp40k3u5+2OpVKwCQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=acrqqk5d; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="acrqqk5d"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=efTqtViJJCQXSf2Lh2tRxpTH3KDrFOhERXSCFDaCWDw=; t=1720633665;
	x=1721065665; b=acrqqk5dM2n5g+RE/Ud2THYvqQt61Sno/i4TAQvRaKsPa4o085EmGHi8NcHqh
	/DjECl1UtvCyplZSPK7tdDaesdRcRcA4UZ+Dw/tfpGRtHJTL542GgVjF9hgtRjLji4tekSdIHeh13
	Vb0r5FtMUbUjXmO0D7qFz2ZZzf93m3R8AQ+ZIXO9spLCDbgb7SF/iSlzrBrhHN0yK5jxYicn7dNWI
	7mSsZPo7WTmfOy0vRFcF8jpfj1WsgS311Ajzdy0mMvh7pA2CZcdGDR3FBGExkC0GUKZBbns7d3S7M
	Gpreag6hx0ufsETbYx9I6e3WTYSLfSoUMhHKgWoeNwEbNFecjQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sRbPo-0004Le-49; Wed, 10 Jul 2024 19:47:40 +0200
Message-ID: <c4813fee-750e-42f9-9a75-35356c69b09c@leemhuis.info>
Date: Wed, 10 Jul 2024 19:47:39 +0200
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
Content-Language: en-US, de-DE
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1720633665;b1096998;
X-HE-SMSGID: 1sRbPo-0004Le-49

On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219010
#regzbot introduced: f6944d4a0b87
#regzbot summary: vfio/pci: qemu crash with some pass through devices
#regzbot fix: vfio/pci: Init the count variable in collecting hot-reset
devices
#regzbot relate:
https://lore.kernel.org/kvm/20240710004150.319105-1-yi.l.liu@intel.com/

#regzbot report:
https://lore.kernel.org/stable/CAE4VaREzY%2Ba2PvQJYJbfh8DwB4OP7kucZG-e28H22xyWob1w_A@mail.gmail.com/
#regzbot resolve: inconclusive: might be some oddity on the reporter's
system

#regzbot report:
https://lore.kernel.org/all/20240614155437.2063380-1-popcornmix@gmail.com/
#regzbot fix: fs/ntfs3: Update log->page_{mask,bits} if log->page_size
changed

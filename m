Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99E444C77
	for <regressions@lists.linux.dev>; Sat,  5 Oct 2024 17:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728149687; cv=none; b=pMT6WKyol/gRQD4LUwiib2Ft2gRrLkZq1Qwc54Z08rnT/NQ50MxdUpYaL76AWMLMUfV5NhCzp0WCwhRuJ3nXpJ8B4N4I3DbAGoS9cn6nqCmO8fch3U+nv8qaL19tkYh9lH5qcjj9cBrokbaPCINA5gRLbspQ0BE1wl46EZN6yu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728149687; c=relaxed/simple;
	bh=NIHe2xMqWUFiQ/uXX3SWdPEPRuyarVFgejrCsW47wsc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=nxSuQ7oK7s62en6Jxg7O4PYSf2uAz1nUC4exB0HuGqsGbdm/2aMBfEB7mQBUeeQUxNxpa6iWHctJTQ7w34rq789b+syb/B0jP2LnAktgqodTAnnGq8SLzItT52wKH1wTc3UxTZOIa2/OP3P33ZSOwftMNY7PZcKOFqV46mma28Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=MU/23TqJ; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="MU/23TqJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=NIHe2xMqWUFiQ/uXX3SWdPEPRuyarVFgejrCsW47wsc=; t=1728149685;
	x=1728581685; b=MU/23TqJzNcOE/9jvixZMLbTt8pNvRQrctrhd85sxAIYRQbcDoQ6tZodMR1Ph
	GEMLPDoly8jW2c910wrD5AKZK42Op0vV6hJ7iAnja7V957AAlmHofpsp6rZgTWWlSRW9WSttdvXqB
	yP0MA9EL0Qfdw1UPh9EvPddHmQWc9NKj135+OqfBL22NKrTrjlPEZkrxVz2wbTN3+BxAhcVvEnRBV
	Vw+f66LGyutTAh93NeXawwNXbilTKr3Ha8eZ4vXPOhUkylnWDVYlzf+7jh+FN4blTfrgd5jzMmOLE
	+hn3X+/wHNlInPfnLouIYzUeXuq8upHwvrZJ7TnKtNYlrq0EHQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sx7z6-0000Rb-CR; Sat, 05 Oct 2024 18:50:24 +0200
Message-ID: <edbae49b-9411-4962-9238-2b224d68d546@leemhuis.info>
Date: Sat, 5 Oct 2024 18:50:22 +0200
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
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1728149685;39f95872;
X-HE-SMSGID: 1sx7z6-0000Rb-CR



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219346
#regzbot introduced: e86c8186d03a6ba018e881ed45f0962ad553e861
#regzbot summary: platform/x86:intel/pmc: hanging on freeze
#regzbot monitor:
https://lore.kernel.org/platform-driver-x86/20241003202614.17181-1-hdegoede@redhat.com/

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219348
#regzbot introduced: v6.11.v6.12-rc1
#regzbot summary: amd-pstate: disabling boost became impossible

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219349
#regzbot introduced: 9c02404b52f56..8c245fe7dde3
#regzbot summary: pci_for_each_dma_alias: NULL pointer dereference
#rebzbot dup: https://lore.kernel.org/all/20241003213932.GA324584@bhelgaas/

#regzbot report:
https://lore.kernel.org/all/20241003213932.GA324584@bhelgaas/
#regzbot from: Marcin Mirosław <marcin@mejor.pl>


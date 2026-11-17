Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.70.190.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794878449;
	b=zA48s3vCeZqISlFFthpECCAKd/zFZawS+NoIj2JUsPvegtwdnts5yRodVb/7ltbKS2/S
	 F17wRGMuukR7jO68qxE5f6AFFRZpzEJ/WqRhJ3lamH6zCic9c+OROdSw1eFWkrsu38YMp
	 vKPN3IQ6cDzswyNjKXM7EzsdsYNB06CTyMqHWbBruxuMSyYMH7ZcYu000sTEMjjoU7fsq
	 tT2cjacgdOjXY+pbqzplnzehDn3NpeHZ/f3iTqhGNtaxfKkFpkU3aYTVG4vgW3Bxkqpyj
	 Ko5ud0JGYSD2O7Y3FJvyq3CatrOiUHm9CQTMFFEKckEGcvuToA/jlZGh3ePAzoQ6GMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794878449;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Spam-Status:X-Spam-Checker-Version;
	bh=dKzxTSJhWwJg9hAdUbBcgVQMl0ndIM8fz0e2PMyCgLI=;
	b=FExyaOv739dEpIe0PYFkf/EBOXuFeFAw4L7tG6GC2IfsnbRnnjix6Pex33fU+IoMdq3m
	 sQLVLWGhWg5VZMBFpNVK3IJQKGz24OAJQg1uBQxWWVkVrjQA7I19Pib8LXCNok71efamA
	 SapN7K4JsSMbfI07XEYQUO/L+RKCri4vSMIeJGkjYMaZs3B5NRXpE1D6JHKDQDt83BiHk
	 Km9ILIT+l/xC5o36uDLBa9Ies6oDzNyyGtaXzEfdGuyKKBr75Edjwz2MUtEZpmFOy5AX9
	 UIlbhbp81aULczxu1Ybq+t2XXsnTDQk2yMYrP1FxqBDYYf50wTCcgco7aEfaPayj0Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=netfilter.org;
	spf=pass smtp.mailfrom=netfilter.org;
	dkim=pass header.d=netfilter.org header.i=@netfilter.org header.a=rsa-sha256 header.s=2025 header.b=ZijA604n;
	arc=none smtp.remote-ip=217.70.190.124
Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id C387D606A331
	for <regressions@lists.linux.dev>; Tue, 17 Nov 2026 01:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C387D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.a=rsa-sha256 header.s=2025 header.b=ZijA604n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1794878446;
	bh=dKzxTSJhWwJg9hAdUbBcgVQMl0ndIM8fz0e2PMyCgLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZijA604nGkhrDNKXgOYFx2W7T+S9GJ82c2GSjWCFKBfYJZuWS0TytcDWX3LVKVlcW
	 YWMFuIw8Lk4G0LXMdqspErsbLbs1gYgbuZYlvr3g9SoznqzYauMGk5d8wTuSIIeJYn
	 ZRo9+0xLhFGhPAl2hmumZPGMdVa3izi7Vq50nhL5mdUiRFo15u/JwGPkfvYK3XvR40
	 C8Sf930S9XeOA3JZVQG5EHbKjz1Bhfoq/OdgSe28RkehFKgw0cCGEfiMLDxkqyVs14
	 D3wIF0Aul68mdegHZSTQvVxpB/JAfUYq7PYoPcoIftbVsbkZCH5qI3fkPHvZU91NTI
	 BNAuSuGbMKr8g==
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with UTF8SMTPSA id 16C5160057;
	Tue, 17 Nov 2026 02:20:46 +0100 (CET)
Date: Tue, 17 Nov 2026 02:20:43 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: John <shffr@protonmail.com>
Cc: "netfilter-devel@vger.kernel.org" <netfilter-devel@vger.kernel.org>,
	Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>,
	"coreteam@netfilter.org" <coreteam@netfilter.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] netfilter: flowtable: XMIT_NEIGH flows sent to
 00:00:00:00:00:00 once the next hop's neighbour entry is gone
Message-ID: <avur6_dQVhWTrTTh@chamomile>
References: <MAEpYNlWKRd7lM0j62YlEZ97Ux1h5AyjSuFRm4Lxk2Q6haeDGTKqX8lpDRZ8slvBu6qA7Bbt18zpr9fyF_jArrEemTgRqzqluxmsGH7UcFk=@protonmail.com>
 <avSIBUcLH4kZyISX@chamomile>
 <avTngTkNKE5ApQW8@chamomile>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <avTngTkNKE5ApQW8@chamomile>

On Wed, Nov 11, 2026 at 11:09:09PM +0100, Pablo Neira Ayuso wrote:
> On Wed, Nov 11, 2026 at 04:21:44PM +0100, Pablo Neira Ayuso wrote:
> > Hi,
> > 
> > Would you give a try to this attached patch?
> 
> I forgot you provided a reproducer, I can see one packet is lost after
> this patch, then the follow up packets don't get blockholed.
> 
> Let me revisit this again.

To address this issue, I think it should be possible to remove the
neighbour lookup from the datapath and let the flowtable GC maintain the
neighbour entry.

https://lore.kernel.org/netfilter-devel/20261117011248.3004853-2-pablo@netfilter.org/T/

If this works, this will allow for more flowtable tx path consolidation
as a follow up.

I lightly tested my patchset with a simple flowtable scenario.

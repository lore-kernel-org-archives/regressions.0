Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.70.190.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795133820;
	b=DqkiN5/Ok7lcHcLJJbbrp+VmwMqzkBtJwm1OW+mBTB99jcZObtLT8gRbi3mrR/Gru2/v
	 GsspVGHozfThq9UEDHfR9AtoSJLQ/5LO+k7El6OIO8nLdf0dahGsslnY37l8gNgYY2Fpu
	 2RDb6qUKRoKQeHc37m2Z6PPfPu15feKzsoyQ94lf6IF9u+IjMa644iX+cnbZ/zLm9fHzS
	 7og7oKi62VuGqYX4dFkImZReOXgAbYb/MbtAFBHoYk+RCSa7TxKNWV9HmvjJKwgS1xK5u
	 khaRbW8TVNBlEDPjp5BC2thIY+/xkiMqDtdln1sY1tDhrpFND3yXUW1C1hvmZxoIU+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795133820;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Spam-Status:X-Spam-Checker-Version;
	bh=UaidrchdsiA6ina6W5vc78SK6thsHus4W9FFXBWLfs8=;
	b=2VbZqUFDxtC4bMX1Ov0Js8Q60jt3twjGhAR/4Xt2v2lcwuMESrsoPox7z3RR6ruXYTCW
	 eDHVTeUsn3GaXOI41F1eOe/JMpcGbbilQKBzzuYhGozBJhSnlJEdCviWs00rUAZDVl0bk
	 T11bD9id6rB0XRBNo3NIgWJSGgOEkpWlUASiFIJKl8GedSZj1+BVdxwvMLueiNRpLbUyT
	 hP/0hwetQ/PxunEOVXvs39Rj7PFo4bvvhDrSqlfL17xHzNrAG5Tu3JCHfvYUm8SuCbcju
	 F2wF6b+//+C4zqF8NEQGcerbnM4Dw2txUwSjAnJ9m8po1L/QJqVJS+/lpfQOALDSjSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=netfilter.org;
	spf=pass smtp.mailfrom=netfilter.org;
	dkim=pass header.d=netfilter.org header.i=@netfilter.org header.a=rsa-sha256 header.s=2025 header.b="Kw/m1nn5";
	arc=none smtp.remote-ip=217.70.190.124
Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id C3361606A325
	for <regressions@lists.linux.dev>; Fri, 20 Nov 2026 00:16:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3361606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.a=rsa-sha256 header.s=2025 header.b=Kw/m1nn5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1795133817;
	bh=UaidrchdsiA6ina6W5vc78SK6thsHus4W9FFXBWLfs8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kw/m1nn5uPO8sIjJtDnbS9vwZHOGeIIyv6jCAiZjfZqcMs9PfYN0Zu84MZXhXI2+l
	 8VY2fpe/BgeMC2D+MZEFbir2yWm+v0rTo4/3r0ecDW8tCKVyarMELnpgMCZOnIt3kW
	 0iYb+WIwvuljtEN2W9tGCMGiVvpGo9Rp1mZqoLP1NmdhuD5B8A0xzwCUrx/R8Z1lYj
	 2pUcV72PNAgpMT77gSurAASzXvF0y1S1qXFEhcejdrmPsoEKBQYqpWtkJtNhK7CRSh
	 T5WLE+NXOlfccAXSaHScs/X0au7VjVj86t/zTFVF+mRbdXcOsDPj421JZ4djs9x8MW
	 t02UNDfBy259Q==
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with UTF8SMTPSA id 52D17601C8;
	Fri, 20 Nov 2026 01:16:57 +0100 (CET)
Date: Fri, 20 Nov 2026 01:16:54 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: John <shffr@protonmail.com>
Cc: "netfilter-devel@vger.kernel.org" <netfilter-devel@vger.kernel.org>,
	Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>,
	"coreteam@netfilter.org" <coreteam@netfilter.org>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] netfilter: flowtable: XMIT_NEIGH flows sent to
 00:00:00:00:00:00 once the next hop's neighbour entry is gone
Message-ID: <av-RdjXsq4IXsnMg@chamomile>
References: <MAEpYNlWKRd7lM0j62YlEZ97Ux1h5AyjSuFRm4Lxk2Q6haeDGTKqX8lpDRZ8slvBu6qA7Bbt18zpr9fyF_jArrEemTgRqzqluxmsGH7UcFk=@protonmail.com>
 <avSIBUcLH4kZyISX@chamomile>
 <avTngTkNKE5ApQW8@chamomile>
 <LCJrB-Fde--T9NiYx2QfFb-X-9W-vsYYmtmrHwIKuKgM8enKRWF2DYypz2_zJKSKQBMUdb9sS6xMEfPihv1YO2FLjX1OUN-Td3Hq1eAdLgw=@protonmail.com>
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
In-Reply-To: <LCJrB-Fde--T9NiYx2QfFb-X-9W-vsYYmtmrHwIKuKgM8enKRWF2DYypz2_zJKSKQBMUdb9sS6xMEfPihv1YO2FLjX1OUN-Td3Hq1eAdLgw=@protonmail.com>

On Thu, Nov 12, 2026 at 09:08:27AM +0000, John wrote:
> Hi Pablo, Thorsten,
> 
> Thorsten: I first saw this on 6.18.60 and have reproduced it on
> 6.18.62 and v7.4-rc2. 6.18.63 has the same nf_flow_table_ip.c.
> b5964aac51e0 came into 6.18.y with 6.18.45, the release named in
> the thread you linked.
> 
> Pablo: on 7.4-rc2 your patch stops the black hole, but as you
> noticed, one packet is still lost each time the next hop's entry
> goes away, which with neighbour GC happens about every 75 s on a
> long-lived flow. 6.18.44, before b5964aac51e0, lost nothing in
> the same tests. On 6.18.y the patch only works together with
> 871df5007eda.

For the record, I posted these series to address this issue:

https://lore.kernel.org/netfilter-devel/20261119090736.3342541-1-pablo@netfilter.org/T/

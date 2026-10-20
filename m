Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792488611;
	b=O5dm4uNyGKzbp0er/w2/sVtl6OfQ/uWkKQfgDJ00Bck9rHCRp8yGBcwdq0oA4Ek056lI
	 DsQW90tDbqaxrkDbD5FV4jXWj4b4PbXuJIdMg/dDSRWtOQGrxFcchC5IUqbqrBk5lBAs2
	 Mbmqv3IAZJioyk+lfh603BpB3fB79QfGNxoJpMUi79ruhEkLGkbaVLt5yKX7SP2kw+y3N
	 MEwkTdIcFgesDP1tFzYDuYOZeYXxMwAffwEIQLDiZAy1m4ojpGp0z/aG1cg9Ab8T3c/kw
	 /Jifjz8r0y5yiYe4wMF3JQlDlU0uT/tx7xJVD4sjbXnCvntidxCxz+HkiA+5xVzWWCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792488611;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:From:Content-Language:To:Cc:Subject:Content-Type:
	 Content-Transfer-Encoding;
	bh=UOKaEW6OC6SsaUM0x34TonYk7TnhblFFxasv/bE3Als=;
	b=qrW7c9nGlPYehKPqGeYDHm2b0AtD/3ytGWzYHfKJbLgSdIwPUM+jStKcQvwyU3uerWdu
	 FFRVelhd3isdDmYo21JPFFqhBYU37qzBiTAEUU+QmY9V8d+w3fr2vzkPPRWW0jh//IlkG
	 MtD1J7X59trr+tUqoBPue1WUOmqtb+9l3ySF78mtqMw62wbPFjAtedwVQPBTMsXmaU3SL
	 Yjsel4Zy4GlWcvYa5dg6m6jMd8lntvqkugFmZt63v0Yc17ir8nusXR0cqbSZgxEjSxKqd
	 Sj39ErtOb98Pk3Z/Y/+r946t8o8XP4clRVLc9R1fHHFQA7w92IwAHEwHrCz1UmqEKeg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Qb8cbyga;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D73E4606A319;
	Tue, 20 Oct 2026 09:30:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D73E4606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Qb8cbyga
Received: from [0.0.0.0] (ptz.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::77])
	(Authenticated sender: afa@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 937912018A0;
	Tue, 20 Oct 2026 11:30:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792488607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UOKaEW6OC6SsaUM0x34TonYk7TnhblFFxasv/bE3Als=;
	b=Qb8cbygaItZ+bhQeS49fdZpiJuiVDbXKJMNqvClkoT3zjkYLwXSH983KuxwFr9LHOzYkeT
	lm++NZMmh6nXO7YTex7I/77YyFiC7A0UC/u3BAyD0AkrscRH2lxrgRXhWn/k9kH40hvtL3
	PQJAx0R7B0qIzsBrXMsvBgMbvQFetKydzlLCx7kTX6DiAHffqGLoHGHOf++AaUaAB88VQ5
	HqOVxzgPMN2ufISV+jjWbaJ1fenqI2qcdSbxmxtNfgXmt40tsyM6uuuheH0K2kaGoB8n19
	duRA6a9BtAuUuefrLWEbeFEVZhJ7e6hrsKezLHrEN91ihL7lyenM8Sc2ivYcgQ==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1792488607; a=rsa-sha256;
	cv=none;
	b=AqY5IcnnAP7TcMb1aCQJJQd+185FKoxVE40dNYcaxAfESuqxCyTmZRdTPBrJZ30SlxZyI9
	WwFnQckJmGaZZxYQ4bsrHE0ZPqORO3kVkeV9fZ3wA4tuoIyEFyrkLROse71KQHqrNR/TVC
	L50SQg/qZsrDhwbKCEmVaOEWjONuwisidwBaUQ6h+Bd+k/Gr/FcilaaxuNrh4oMulFoQwa
	zT5Y3x1HeYxXk6wJKo6kYdDEsjAQB6RXaP2Whvx5zQSEBlxqxqFLqrKp/oYCYcvUkFseyU
	y3jA/GLQUM7EFJn7+yP/QGVXTd2Zjv1JxkEgocuPA0dPTKUECz2DvdwQvO4Fhw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=afa@pengutronix.de smtp.mailfrom=a.fatoum@pengutronix.de
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1792488607;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UOKaEW6OC6SsaUM0x34TonYk7TnhblFFxasv/bE3Als=;
	b=IfTe0VnZ9bKnUPjdkf1a8PwNN4+FompKoN+kC/HkclR+X5ROBQQPDBSFggU1UbGFuCmXtM
	GX1+afoQZkJN1J6mWQ8Lbioa+gdz+QuCRnbmfSQWuTEZq+HzkIwY6ak9jqedt3tqZWFezZ
	IkPl9HLjz/7jgTXmVujXvDxwnsaLLah75v/p8/x2BOHixmvygx20lfiFBWTZpFEw41q1FS
	cv8VUY1c3jRo5Hm5rNthDnwofkUcAbKochfcphH3s1Y/X/e/llC54KuISnKa2TAtyE8ADi
	AzwJT1GFkpziVN6JurV+UmFt+hAUQwPHBomSrc8+U+L00ffdlYtGwzApZ4DJyw==
Message-ID: <171421fb-d0a6-4e3f-b2dc-226e9c548972@pengutronix.de>
Date: Tue, 20 Oct 2026 11:30:07 +0200
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
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Content-Language: en-US, de-DE, de-BE
To: Sherry Sun <sherry.sun@nxp.com>, Frank Li <Frank.Li@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Lucas Stach <l.stach@pengutronix.de>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, regressions@lists.linux.dev
Subject: [REGRESSION] Potential problems for DT-described PCIe nodes on i.MX
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Linux commits:

9dc39532172c ("ARM: dts: imx6qdl: Add Root Port node and PERST property")
37f53f50b36f ("arm64: dts: imx8mm: Add Root Port node and PERST property")
396fbe9a028d ("arm64: dts: imx8mp: Add Root Port node and PERST property")

Both in v7.2-rc1 introduce potential regressions for i.MX boards
that already described a root port under a different node name, e.g.:

host@0:   ZII RDU2
root@0,0: GE Boards
pcie@0,0: Gateworks boards
root@0,0: SolidRun Hummingboard

All these nodes may become stale now as the SoC DTSI have
introduced their own pcie@0.

At least on the ZII board, barebox fixes up a MAC address into
the DT node, which is no longer used if the kernel decides to
use the newly added duplicate pcie@0 node instead.

Fix is probably merging the existing properties and child
nodes to be under the new &pcie_port0/&pcie0_port0 and drop
the board-level Root Port node.

#regzbot introduced: 9dc39532172c

Thanks,
Ahmad

-- 
Pengutronix e.K.                  |                             |
Steuerwalder Str. 21              | http://www.pengutronix.de/  |
31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |


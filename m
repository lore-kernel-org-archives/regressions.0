Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4404C1D69E
	for <regressions@lists.linux.dev>; Mon,  8 Jul 2024 16:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720457157; cv=none; b=gvN6V7ksRFoLNbjKctcK5ZVvlqALNihw0HY5vOURCd8RO4VbwM1rZn+HO03ykXHZZJtYOvbRTuqmC/tFdIm6Tt1WF2IFDgJWFwkKU1RKmlU/JcDKhmh6//OctY6miVERSyId61n6vuQBx9SMfQtA+4tdsEeWtc5EDEI0f9NS938=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720457157; c=relaxed/simple;
	bh=+s9E1oUX+NAEAPR8rMbO3pSbjugF7hhR2AXzMg4GdEw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=b3PAuN8JhblSg1m/BFURG8FPB5wJABzFTqJlDGpWLSEefPWkuCz3VKqGTsUQR2Sbi1QSKJ1VfxnWjwZ9SS16S1ZM29K9Tb9M2Eoy+lIt8N3ixjvpFtHdq6rLTGlJYq/8FRv2O7oIH5r2L4jpsiR8XQ9vQ9+RQus6a+aKCeprsUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=nUJnJ/wY; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="nUJnJ/wY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=+s9E1oUX+NAEAPR8rMbO3pSbjugF7hhR2AXzMg4GdEw=; t=1720457155;
	x=1720889155; b=nUJnJ/wYQlEZfaqVlzo7gLDNbJwiAg8S5ngVW4j36rs769tPKsDo/OA0sfwNg
	lAwJqMmYXLOyd6ptNmmt0Q1L/Ve+1SUGJWCDCQW0vvSLrtIijCCCiTVsJoiKyFQPAgifatcwXvu0f
	b0XXXHqI573MLtID7/aTbg86jofiJ8Yp233PBeMwI/+nFeiveFY4PZMYuHhd+bK138jyM9SSb8yzv
	8T0H0pg+CTSGjMgx6O/iiSZBPJ8VMS+AYRMFAZ7PjrMLjDwgiVwZB/ETxKpYDgipi3f97IGAWvlg4
	JN56YCQK2RsvI1nmSC4UyDNM0/D6zjr5bd3DiZubnLw+/vhebw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sQrUv-0003mg-9D; Mon, 08 Jul 2024 18:45:53 +0200
Message-ID: <83e2e535-f57d-4d74-9325-a321de193b7e@leemhuis.info>
Date: Mon, 8 Jul 2024 18:45:52 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1720457155;04631224;
X-HE-SMSGID: 1sQrUv-0003mg-9D

On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/20240706143038.7253-1-mat.jonczyk@o2.pl/
#regzbot introduced: v6.8..v6.9
#regzbot summary: md: unable to start degraded RAID1 array with device
that has write-mostly flag

#regzbot report:
https://lore.kernel.org/lkml/20240516204847.171029-1-linux@fw-web.de/
#regzbot fix: net: dsa: mt7530: fix impossible MDIO address and issue
warning
#regzbot monitor:
https://lore.kernel.org/all/f485d1d4f7b34cc2ebf3d60030d1c67b4016af3c.1720107535.git.daniel@makrotopia.org/

#regzbot report: https://lore.kernel.org/lkml/ZovVkj7Pqy0%2FKU63@duo.ucw.cz/
#regzbot resolve: turned out to be a cooling problem

#regzbot report:
https://lore.kernel.org/lkml/20240612170030.3qatttsgrwjg2m5s@joaog-nb/
#regzbot fix: spi: omap2-mcspi: Revert multi mode support
#regzbot relate:
https://lore.kernel.org/lkml/20240704-spi-revert-omap2-multi-v1-1-69357ef13fdc@kernel.org/

#regzbot report:
https://lore.kernel.org/lkml/Zl%2FV0dU6SjAMkpLG@colin-ia-desktop/
#regzbot fix: spi: omap2-mcspi: Revert multi mode support
#regzbot relate:
https://lore.kernel.org/lkml/20240704-spi-revert-omap2-multi-v1-1-69357ef13fdc@kernel.org/

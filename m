Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994C631714F
	for <regressions@lists.linux.dev>; Mon, 27 Jul 2026 08:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.61.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785141833; cv=none; b=HHdIUeNuHBGfP8NkHPclN+o3bXlGfFdr5HdPb8OPnbIyu9IzJyNywtfTDOSThdymdspBT6jvRNHQZEQ/3jx/HTjWnEi2PLPlIWLiRChSdeeqVIy46hVZoOJIsEIARblB7uIDMIY+HHRz8uIVT6+vIIKOwWqAf5a1BEkHIr2hqwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785141833; c=relaxed/simple;
	bh=dg2PdX38sKrE/AgiN98q4bIDUpM5WsUPGpi34yki+0w=;
	h=Message-ID:Date:MIME-Version:From:To:Cc:Subject:Content-Type; b=nS01RJEYt99RMx2efoPhTT+33hPkQjV5pbaM1jStB9Tr4xVhcVW1nKSB70jmM+NmmDuP20+wqYr+TGfe2034smqngOP2L96FFmlHwnpo07cD0vD8R8/+MPCujpKvx6n4dRIW1LDAWh2YU4XJDnResvuMsKu8BSXvUHlMnPrP1Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=fWHg+giy; arc=none smtp.client-ip=188.68.61.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="fWHg+giy"
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4h7sXz5wWlz85yT;
	Mon, 27 Jul 2026 10:42:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1785141747;
	bh=dg2PdX38sKrE/AgiN98q4bIDUpM5WsUPGpi34yki+0w=;
	h=Date:From:To:Cc:Subject:From;
	b=fWHg+giyCHnqiclmqOW/FRjJRYDY/7x6tQEUjJ1iy/f/uF1vK7f34hyYdBjWdzb1j
	 5Tc+5V4m4CVP+AtoIQWkLSkzjvRgnDS4Unr5wpPq1ggsJLfdFjLG8GOoOoYAFKlxcH
	 wH1dfD4KC/q8Pikf+CB9PtvuygoFutPZsKNyIxfh1zy+mlajPYfsNLHxySnuDJ0n1o
	 lkeHdlmfj37+Ymv2UN8vWan+WLzTDQIIaOp2oxqnsXkuCiEItqER7P514q3ZZ28gnS
	 Gmkim0v3caz6OlMwFqTwOAwqXNaATXnIYbobJEzaC3B3wYNCrF5yX3FkLoIXcRArEb
	 FLxNuQwmpl4Ug==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4h7sXz5CtLz85yB;
	Mon, 27 Jul 2026 10:42:27 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4h7sXy24Yzz8sch;
	Mon, 27 Jul 2026 10:42:26 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 851D35FBA6;
	Mon, 27 Jul 2026 10:42:25 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <f7fe5959-f0c6-430c-8404-927d7944c836@leemhuis.info>
Date: Mon, 27 Jul 2026 10:42:25 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 yannick.martin+kernelorg@okazoo.eu
Subject: [regression] Bug 221745 - PV DomU ballooning driver init issue
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178514174583.976006.15917720183139081453@mxe9fb.netcup.net>
X-NC-CID: fBr7XczVS2ya6Qqy17DIK86+ueCERFBW/JVA7MLO2EUsYNBv5Og=

Hi Roger! FYI, it seems your change 0949c646d64697 ("Partial revert
"x86/xen: fix balloon target initialization for PVH dom0"") [v7.0-rc1]
caued a regression. For details see
https://bugzilla.kernel.org/show_bug.cgi?id=221745

To quote the initial comment:

> Since commit db8c4b1 (Partial revert "x86/xen: fix balloon target initialization for PVH dom0"), xen ballooning fails to init correctly on domU (on amd64 arch) with the following configuration:
> 
> -- xl.cfg
> ...
> memory      = '2048'
> maxmem      = '4096'
> ...
> --
> 
> -- domU balloon dmesg (init fails)
> [    0.908337] xen:balloon: Initialising balloon driver
> [    0.940721] Extra pages underflow current target
> --

db8c4b1 is the backport of the commit to 6.12.y; the reporter (CCed) in
a later comment to the bug tracker confirmed that the problem happens
with 7.2.0-rc3, too, and also stated:

> The dmesg by itself is not relevant except:
> [    1.105207] xen:balloon: Initialising balloon driver
> [    1.222758] ------------[ cut here ]------------
> [    1.222790] Extra pages underflow current target
> [    1.222792] WARNING: at 0xffffffff8252a424, CPU#1: swapper/0/1
> 
> init exits on ERANGE handling:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/xen/balloon.c?h=v7.2-rc4#n772
> 
> because of ERANGE:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/xen/balloon.c?h=v7.2-rc4#n714
> 
> kernel thread xen-balloon does not exist on VM with kernel newer than 6.12.75 (on 6.12 branch) where the patch was merged.

Ciao, Thorsten

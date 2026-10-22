Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.61.103
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792663840;
	b=au8VRo95S1NeCY/JrBS8IkOiTXc29Xf6q6UqOgE/WOgyS3EhGqoFdqxq19Q7Y/ETKvby
	 /m2sjXpkCrm0bNcd0e46IuEvTRZlO/+IshPZUJZQ2I+fXPzNcZKbUY/nyVf1jLdw0ykKc
	 Fz4b+253x8p7PtWRluTZMatkayfRqFsvHV+pPb/PqJR72OF9ckeyfZNPqKV89USTuz20v
	 hCfpBl01OG+9i0OyIh0aIp0QobZZ+Ca5rk97lr393TRZdUwLzD5bsfvMiZxiKbFwF2XGR
	 qj3iDFk74KWNKFCvACN7L0TdT3yGoATi8C7tASN34oxDw2vGJhjRhykhbeengPkabGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792663840;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-NC-CID;
	bh=QXeDJlSqM0UyN95YP/A95qiJbpkRr+QNhjBNCFlWXg4=;
	b=SVJ4V1jRXuaY9lpU/SXDWdC6kiClgeeOlCbMw7dnKR+h57ZVN186Hkk1reKu3M0a0Zhp
	 uxI6YsNFcGa4Go0ZB4LmZ97KscvMSaAc8RZev3IB1mkmWZ7bfx2/zUerGwBWj9InVzcV/
	 uXNguhYHzAOmWDfG8w8RhSSeaUFHksEYytkAfc9+3Kw1qkkYVrmeM9M/TUr3e88WXD/kG
	 2VQTpiLy4Jc8hrvhbw53eavN+GQgxoUU5zZzXfxyqrojPPCmAFBYrPJAOFVDOmwFnzJ82
	 9olku7m5Hy4kos5Oo36rlhr+XWS7PdxKnSlnjVXZ2iVIPLOSQGcZlkIx6Ve/2/4RFNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b="Y/3j1UOu";
	arc=none smtp.remote-ip=188.68.61.103
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.61.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76408606A319;
	Thu, 22 Oct 2026 10:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76408606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=Y/3j1UOu
Received: from mors-relay-8403.netcup.net (localhost [127.0.0.1])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4j9MNW5K46z8NmD;
	Thu, 22 Oct 2026 12:10:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1792663835;
	bh=AbfJofVssTdC2rgXIEXox2SF5Nw9EZB/yTtiu6aFgmc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Y/3j1UOuk2jGF4pZI4BrAWWLeMthBCMMxGfo9mkGNvQI5+Lv5efmMnXT9e6KoENpz
	 MOH1jZns/BBRsHXI5SIqVWp4ofKvDacZXp8qwX6P5UnvJOqp2r1C2TQanhOYjusmbI
	 z3VLDiEl53xEteXf/Ij0J7MaWT6bZ4y2NJlHpuS4YmGRLEQ2gxY8H3np+qUkOhT5pC
	 /YtD6qcqHJORwx+Dw0W6DbwzhAtXJbsvjyjIyEXDGPqmCR9dn5GMiH0TdDnFM0jp23
	 CxIrFLYes0CSWV8dAQyDC9en1y1NrPsjBtNqwX25ykJBqwqwnNzZP03DELYwKTnRha
	 ikK5032nW5iig==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8403.netcup.net (Postfix) with ESMTPS id 4j9MNW4YRKz8KD6;
	Thu, 22 Oct 2026 12:10:35 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4j9MNW1C1hz8svT;
	Thu, 22 Oct 2026 12:10:35 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 368995F8BD;
	Thu, 22 Oct 2026 12:10:30 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <bded6548-dfcc-4119-9d11-a2ca55835440@leemhuis.info>
Date: Thu, 22 Oct 2026 12:10:28 +0200
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
Subject: =?UTF-8?Q?Re=3A_=5BREGRESSION=5D_mainline/master=3A_=28build=29init?=
 =?UTF-8?Q?ialization_of_=E2=80=98int_=28*=29=28const_struct_mnt=5Fidmap_*?=
 =?UTF-8?Q?=2C_struct_dentry_=2E=2E=2E?=
To: kernelci@lists.linux.dev, kernelci-results@groups.io
Cc: regressions@lists.linux.dev, broonie@kernel.org
References: <179255514786.226988.5626082709051138535@kernelci.org>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <179255514786.226988.5626082709051138535@kernelci.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <179266383071.1277068.16611023102016682247@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 368995F8BD
X-NC-CID: XoTdLx2auf7WrHeXUFvsh8J0xty63oazg21stSBYSaY2zjn/R0M=

On 10/21/26 05:59, KernelCI bot wrote:
> New build issue found on mainline/master:
> 
> ---
> initialization of ‘int (*)(const struct mnt_idmap *, struct dentry *, struct file_kattr *)’ from incompatible pointer type ‘int (*)(struct mnt_idmap *, struct dentry *, struct file_kattr *)’ [-Wincompatible-pointer-types] in fs/smb/client/cifsfs.o (fs/smb/client/cifsfs.c) [logspec:kbuild,kbuild.compiler.error]
Should be resolved from what I see. Ciao, Thorsten

#regzbot dup:
https://lore.kernel.org/all/179255874376.229129.7672817283004985497@kernelci.org/
#regzbot fix: 2c455ddca7827ad8fa3a64fdbf5a60efb928b46a

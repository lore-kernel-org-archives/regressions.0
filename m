Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D4B38E8C6
	for <regressions@lists.linux.dev>; Sun, 23 Aug 2026 12:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.244.194.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787488550; cv=none; b=gXP8uacUlyX8YU8a2fs9REJN65pJM6g0/9xsvOT+7xsyG1X5OThY6tBJ01c0QUo29ndgY+Z6M60fDiA5Sj3GRRTARxiDKyzYh2kn/NTe2y5DxEjdThZRkh0ieV8SU9oYi8wh6GJ+uMoXQnQKEz3rO9ocAA/dXh9lzK2sU6p5/q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787488550; c=relaxed/simple;
	bh=QcOyNHWPz7ng4uDzBlXxrpitR6L8eYl60PHRY+S3DYM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bfgr9Pnx/SUzQGM3P8x44lAhf8p1fXC8nMHg0E+SLdoLpXfStgT8cIKvagnTtFv4fA8l/fGjAVxLZt2QCbmVLN3h+y+j0hyWoXAhS3qgoTJWjnh7ZN6c8G9gvLhDUg6TSCsc6NMFy1wliufBPY9OzQSPxihiG+oRafTbkpi8xdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=etJPKPk+; arc=none smtp.client-ip=185.244.194.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="etJPKPk+"
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4hSYRc22r8z9B7n;
	Sun, 23 Aug 2026 14:35:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1787488540;
	bh=QcOyNHWPz7ng4uDzBlXxrpitR6L8eYl60PHRY+S3DYM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=etJPKPk+m8wvTiIOCazzOgcsEG3x1/N/wsI1leC42TvEeF110m95m4micdC3JaG9r
	 69w2uDvmhon7IbsimItHYC40PNdDxLCF8xfBsU/L2+m11XJR8nxVGOWjVX6wPKHhDQ
	 qOqjF/+PqYm558oTIsK/fECHYHUZtRr5LlZlPMGKHbK0d5vimI/EI0le/1H48djrwN
	 n7hghb507g9w0zalNwuW8hQFSoKZyjccVO8YjgzCVlsFCvr/DlGQJhU4wdXdtNVNpb
	 AKqIvEabzff8FQaKk06A9zqvuORA2tDwXRQJQ5BZFSMHr6fEi74t7CtOlKTpv4rHcm
	 r56YuaN/vgGRA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4hSYRc1LnHz7x9l;
	Sun, 23 Aug 2026 14:35:40 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hSYRY4TRMz8svk;
	Sun, 23 Aug 2026 14:35:36 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 080F65FA13;
	Sun, 23 Aug 2026 14:35:32 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <092cc12c-0b64-4352-89ad-7afc824552b1@leemhuis.info>
Date: Sun, 23 Aug 2026 14:35:31 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: Restore get_cycles() return value
To: Ryan Chen <ryan_chen@aspeedtech.com>, Thomas Gleixner <tglx@kernel.org>,
 Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 regressions@lists.linux.dev
References: <20260820-b4-arm-get-cycles-v1-1-33d0ee0cf141@aspeedtech.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <20260820-b4-arm-get-cycles-v1-1-33d0ee0cf141@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <178748853244.3065954.16034214713717909973@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 080F65FA13
X-NC-CID: /Zpw8zn8NKrQBsqtOJqOe30EKBgSJx/EAwkCHhrgsg3rzeFGsm0=

On 8/20/26 11:10, Ryan Chen wrote:
> read_current_timer() returned 0 on success, so the get_cycles() ternary
> yielded the cycle count on success and 0 on failure. delay_read_timer()
> returns true on success, but the ternary was left alone, so get_cycles()
> now yields 0 on success and an uninitialised variable on failure.

For the record and those that haven't seen this yet: this afaics was
discussed earlier already and fixed upstream by e1e3a0ab69c64e ("ARM:
Fix get_cycles() after delay_read_timer() conversion").

Ciao, Thorsten

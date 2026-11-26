Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795673224;
	b=CpGanv/12KuqJhqd85NEhAjEC317ReeqQww7S98B+HiJ/O/zCmlODfrE11OZ1OgOI6S2
	 BxTbQb11IQGVcfkZ+jgv3GzgJUSqN0jFloYroRl/cQK7gZRbSjvRxf6I8D2qrC0QLPEC8
	 ZsX95Gf9q2rrTThZahBMdmFvBfS4YQc13F7PLwNHk5J+N+i9086Nst7wkQJIhi2GRVH2c
	 K93Qga9sxIGJMhucDgzRaa8riahmLUgnXkuB64vDtCmR87t1fV0ZU6dlh0WOzN6HAwdE1
	 lZ0wYSBHcWOzs1mE3nWLlZpniKqCG7fDSOP2uqsOykh9nI6rQzHjDPQmdt/hflitQgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795673224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Received:Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=4vEv4zWesqwl2OdkZUsIGqo+gUaqxzOcgiEIZ0178vQ=;
	b=PKNbYHrgqKFzMOgskjrH8U1krD11mXM4iSbvahbefx1MivcPm4AFTdL18tmEx1e508g4
	 wUMxIUcNXowxShFexU2pN/jcj813ByEwioMp5fPYuwjfR2HtQLEbAC8xCp7lDG2xGFPmi
	 hICPFEE7kLHhH2QCgmgQRwJ4Utn8vu027nD9E+g9eFKKKk4n/wcLiGhyfxKRaI6tN20WS
	 DoRofjubp7Qb5s72Cv5fzBtryw8H/nKnoZzP9Xupi1/aSNJGpdL6lkgor3TMmBeISV1c0
	 aYuBHOAg5Qg6ZGKm3AxrgRt4mqq8Qm9+1wNZm+hCM2IDR2BMODyd8EjtLRI/YjLAV3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=debian.org;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A8cNQiu2;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CD8606A321
	for <regressions@lists.linux.dev>; Thu, 26 Nov 2026 06:07:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1CD8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A8cNQiu2
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb85e07aadso81238225e9.1
        for <regressions@lists.linux.dev>; Wed, 25 Nov 2026 22:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795673222; x=1796278022; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:mail-followup-to
         :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4vEv4zWesqwl2OdkZUsIGqo+gUaqxzOcgiEIZ0178vQ=;
        b=A8cNQiu2RHfHyN8n/syFF5mLK+DWyHtvyqYXYS9ADV3zyXrdKMaJ1HgcyuD4q/PskK
         sLMnPeCNx9JAVHWEIGKq1t0kHx40GMvcYtR3k8q9T6h4JNUw0tHmICC4Gp/z3w+c8zuK
         UmTAUz8oBR8lZ8jSc5l2NqSgXOuDvTNa0ZkPoPf7PHwptZa4bk1+QCtfAZcuLBEmaPZp
         xgolfNDzHYTPIVC/bSnc3PtoRgJM1mncBOJ/ToVcAUpXz79JVz6IrGX20Be4eOE2at+5
         w5oOHLvlDQLizSgdoi+elCONEVGq/4YLx9VwfO0hjGSqOEANKbUcSiO5aGBx/l+gpWuN
         vaqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795673222; x=1796278022;
        h=content-disposition:content-type:mime-version:mail-followup-to
         :message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4vEv4zWesqwl2OdkZUsIGqo+gUaqxzOcgiEIZ0178vQ=;
        b=TY+a1MKms/xFP5X1Tb0Zimqi6RzgUeS5UOTk/BMPdQOJRyESCut+hmZyaBcbYmkxxT
         +3bFxs7RTeaiuN1LbVWDs/JkstrJU5Nx1TY7b6+GHqOHZVTUEaqB9v5zR9mK695YQQw4
         tkeOMIQnmLtv3GyWOQFnGXNetRvfhznkoKf02qE/p2ORutiwhINkMAMqeWA7ng//rzbz
         TurdxR7ZRV53d+3f3IGvyKyF1JALmY7fFja+cxBZSM+2jatt7XSHMOJc0wKnF2BDE8ii
         KBj3/JYyxqQeKUjdECh1JrRCIoVsw0Ru/dW8KoZV3PbEzDLVpS7zRx6b9g3FPCziGUug
         mKlA==
X-Forwarded-Encrypted: i=1; AL+hErFuiMxNLxS0ud9rO4V/HrZQXsxCjzsAFouu8qLv4YMmWstTq/C2zpf68KAROJAVMXD9Fb20WxxRGWQMSg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8uWuRUrJTDAeJyLXkJTkeFHJK/YFsjY4Jzywq8sdicdyvtKMJY
	WDFWEV3gTQfAElWYsvF8UNYaoBQiXyFFxJwoBo9vZl6wgBypk6YZK+sc
X-Gm-Gg: AZFdTZdIVfkar1Fk8VtDUnjnQk8eHb2fCLAh5YU7mTmmFVcGpXu7FCDXvxON17rQKiy
	mCrfv/baExMbieYp7RirrasA3BvmtSWH/bxrGNSjOIyJAMJJP8Gw0dsM9tSfrKpvSYhL28PKM8L
	N59KA2IUw+MH8g1frf2Bl2kp7qmIdBv4v0gAtCwDlqbJbq5vodCAEtxYsAfsuVcT+XcaOGssgss
	4FLn3zWZmQJBpQmxoE36lYkHaiH27jOQxhF1OyhdnMDzxzJn45WOgiuLa8VYSm5RRaUViyrBN5Z
	UCRZ0M4dIqZYtyyfuBzbx5z820M7FB1tCxl17jp/5wv+0iXgX/rBiHpeV8r0tkKy6gx3R9TVYvQ
	dng+3ECWumOQnhwvUX1AY7BE6cQm7FwRRPbdz8s9MrPNhwGYaHbo1TQamJbOUXcZW+8j7UVr/Lw
	pad96pyVdq9C1h3rztQozeOaxddT4VgyopgEXGFufdcXDNGtwwZKPsRS+c5iQKOAbkonrGx6+YR
	26Xc54YgBKPBjf2ZZpGbsf9kMghJlsrtr7iJdpi/gkjae7ibs+GdLGWUh0JYLnzJS2ciYn/VNTO
	qFd/YxwqHh6CjUA5K0PjHbGgWTyeucPCnGtRbv/z+i7ihq25ZL+ON2XvCUCCdBOFY1V+0+bkiGW
	71e5B5yxFHw==
X-Received: by 2002:a05:600c:4f50:b0:4a2:1612:637a with SMTP id 5b1f17b1804b1-4bb888063f3mr499671215e9.16.1795673222070;
        Wed, 25 Nov 2026 22:07:02 -0800 (PST)
Received: from eldamar.lan (c-82-192-247-196.customer.ggaweb.ch. [82.192.247.196])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88f148aasm228217135e9.0.2026.11.25.22.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:07:01 -0800 (PST)
Sender: Salvatore Bonaccorso <salvatore.bonaccorso@gmail.com>
Received: by eldamar.lan (Postfix, from userid 1000)
	id 6B47ADC05F6; Thu, 26 Nov 2026 07:06:59 +0100 (CET)
Date: Thu, 26 Nov 2026 07:06:59 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Edward Adam Davis <eadavis@qq.com>, Sasha Levin <sashal@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>
Cc: linux-bluetooth@vger.kernel.org, regressions@lists.linux.dev,
	stable@vger.kernel.org,
	"W. John White" <whitewj-debian-bugreport@outlook.com>,
	=?iso-8859-1?Q?P=E9ter_B=E1tori?= <batori.peter@gmail.com>,
	Mael Bras <mael.bras.ext@idnow.io>, tycho673 <tycho673@gmail.com>,
	hanta <hantahrabal@disroot.org>, skiwithme <skiwithme@optimum.net>,
	Suvam Sen <suvamsen2004@gmail.com>, Celimar <celimarj@gmail.com>
Subject: [regression 6.1.y] 967473b1e8bb ("Bluetooth: L2CAP: Fix
 slab-use-after-free Read in l2cap_send_cmd") causes backtraces and
 non-working bluetooth
Message-ID: <179567271700.947722.15185762256491350563@eldamar.lan>
Mail-Followup-To: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Edward Adam Davis <eadavis@qq.com>, Sasha Levin <sashal@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	linux-bluetooth@vger.kernel.org, regressions@lists.linux.dev,
	stable@vger.kernel.org,
	"W. John White" <whitewj-debian-bugreport@outlook.com>,
	=?iso-8859-1?Q?P=E9ter_B=E1tori?= <batori.peter@gmail.com>,
	Mael Bras <mael.bras.ext@idnow.io>, tycho673 <tycho673@gmail.com>,
	hanta <hantahrabal@disroot.org>, skiwithme <skiwithme@optimum.net>,
	Suvam Sen <suvamsen2004@gmail.com>, Celimar <celimarj@gmail.com>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Control: forwarded -1 https://lore.kernel.org/regressions/179567271700.947722.15185762256491350563@eldamar.lan

Hi

In Debian we got a series of regression reports with after updating
the 6.1.y kernel to 6.1.192, the bugreports are bit hard to follow to
the amount of people contributing, they are right now:

https://bugs.debian.org/1154123
https://bugs.debian.org/1154206
https://bugs.debian.org/1154212
https://bugs.debian.org/1154648
https://bugs.debian.org/1154673
https://bugs.debian.org/1154866
https://bugs.debian.org/1154879
https://bugs.debian.org/1155192

The issue appers to be introduced by the backport of b4f82f9ed43a
("Bluetooth: L2CAP: Fix slab-use-after-free Read in l2cap_send_cmd")
to 6.1.y which landed at 967473b1e8bb6d941e034ec1f76de40ccf54a8cf. The
backtrace shown is involving:

[   40.687744] list_del corruption, ffff8a27c10efe80->prev is LIST_POISON2 (dead000000000122)
[   40.687829] kernel BUG at lib/list_debug.c:56!
[   40.687865] invalid opcode: 0000 [#1] PREEMPT SMP PTI
[   40.687900] CPU: 2 PID: 893 Comm: bluetoothd Kdump: loaded Tainted: G           I        6.1.0-55-amd64 #1  Debian 6.1.192-1
[   40.687960] Hardware name: /NUC6i7KYB, BIOS KYSKLi70.86A.0051.2018.0110.1800 01/10/2018
[   40.688002] RIP: 0010:__list_del_entry_valid.cold+0x4b/0x6f
[   40.688574] Call Trace:
[   40.688594]  <TASK>
[   40.688614]  hci_chan_del+0x18/0x90 [bluetooth]
[   40.688745]  l2cap_chan_put+0x106/0x130 [bluetooth]
[   40.688890]  l2cap_sock_release+0xca/0x100 [bluetooth]
[   40.689038]  __sock_release+0x3a/0xb0
[   40.689070]  sock_close+0x11/0x20
[   40.689096]  __fput+0x90/0x250
[   40.689124]  task_work_run+0x56/0x90
[   40.689154]  exit_to_user_mode_prepare+0x23d/0x240
[   40.689191]  syscall_exit_to_user_mode+0x17/0x40
[   40.689226]  do_syscall_64+0x69/0xb0
[   40.689452]  entry_SYSCALL_64_after_hwframe+0x6e/0xdb
[   40.689845]  </TASK>

But reverting the commit does not immediately seem to be an option as
this is as well the fix for CVE-2025-21969. Is there something broken
in the backport or a missing requisite?

Regards,
Salvatore

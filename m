Received: from proxmox-new.maurer-it.com (proxmox-new.maurer-it.com [94.136.29.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A50B47143B
	for <regressions@lists.linux.dev>; Mon, 12 Oct 2026 09:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.136.29.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797775; cv=none; b=Lzdc5Q2cr+ksWgqdMHXK4WN6IUWxom3eJsO8pCevLBRZq16pNzfBMmZCahYAemQvIJFTow18vpnafGPCb4q2p9O5qHYxs/3R2m/YBxsV+0kpbZuZRGhxNz+1iBKk6GaCaUkwFbczwwc2TMQXj/WTn8j3qkYHmJbtSkaZ614Ez78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797775; c=relaxed/simple;
	bh=HwgH6cNjuXA3qdiLh4L4A0y5gykjUezqzlq6XPMZfV8=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:MIME-Version:
	 Message-Id:Content-Type; b=bMrdhX3dgS/FDUcZ1acXttkVs1MMOgCSP1Y4e2Btc/XuC/V+Hlwz+foBHV8gHMpwXt1r8gViDr8e71rqn1ECSKGQq+sJae86XCj/T5NMev759s3/eUm661VMR87LTqAPntru7D1czTQxuT5HdcvDD87Xuqh44wJH8IM3pL+nNOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=proxmox.com; spf=pass smtp.mailfrom=proxmox.com; arc=none smtp.client-ip=94.136.29.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=proxmox.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proxmox.com
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
	by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 1225A47F80;
	Mon, 12 Oct 2026 11:36:11 +0200 (CEST)
Date: Mon, 12 Oct 2026 11:36:07 +0200
From: Fabian =?iso-8859-1?q?Gr=FCnbichler?= <f.gruenbichler@proxmox.com>
Subject: Re: [REGRESSION] 7.2.4: nfsd sends CB_OFFLOAD with all-zero stateid,
 async NFSv4.2 COPY never completes
To: Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org
Cc: Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>,
	linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org, Lubos Rendek
	<l.rendek@proxmox.com>, regressions@lists.linux.dev
References: <7cc824c4-632d-49df-ae5e-cfcbb5bf76ad@proxmox.com>
	<2026-10-11-1-daily-reply-0001-nfsd-cb-offload-zero-stateid@kernel.org>
In-Reply-To: <2026-10-11-1-daily-reply-0001-nfsd-cb-offload-zero-stateid@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: astroid/0.17.0 (https://github.com/astroidmail/astroid)
Message-Id: <1791797151.oll70jtyaa.astroid@yuna.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Bm-Milter-Handled: 55990f41-d878-4baa-be0a-ee34c49e34d2
X-Bm-Transport-Timestamp: 1791797770509

On October 11, 2026 6:48 pm, Sasha Levin wrote:
>> Since 7.2.4, an NFSv4.2 server-side COPY between two exports of a Linux
>> NFS server never completes, because nfsd sends CB_OFFLOAD with an
>> all-zero stateid.
>=20
> Queued the fix for 7.2 and 6.18, thanks.

AFAICT (for 7.2.x) you queued a full pick of

f307b4f7ed17 nfsd: split nfsd4_copy into transient and durable async copy o=
bjects

in

0b2963340727 nfsd: split nfsd4_copy into transient and durable async copy o=
bjects

despite Jeff stating the following up-thread:

> We should probably just take Lubos' two-line fix as a separate one-off
> patch for stable. Backporting the COPY code refactor is too risky IMO.

Was this intentional, or an accident?

FWIW, the full refactor would include two more patches:

d6edc2a72513efce59eaf85acb204d2ddac71892 nfsd: drop dead COPY-vs-COPYNOTIFY=
 type handling from s2s stateid IDR
80c376183411300b4c99977c66f3f84f64b38676 nfsd: make the copy offload statei=
d a first-class nfs4_stid

so this is kind of half-way between the discussed options..

Fabian


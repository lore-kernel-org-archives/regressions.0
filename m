Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.63.102
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795680007;
	b=2Bu7VOAVsE1W7xcCQbwCDGILDLU0kl8WnGRcfB+PWYpqnIw6ZZFEd5azJ57ggjzpy0w7
	 NMyB3v4Lh1n4oYJU2gI01omvE0DZ0oYYvhcns6ZYL0a3A7iv9aYYig8l+UpIcgLyYKZN+
	 FYvvHg4dYw5+xLpiYgTO7/neZcFPxoVnABdOFBPFpg3rHmR2NXD8KLciSHyq9OQfrXGP5
	 qC4OXUNlxofok2zaFkDQcxhK/z8Xt6jU2vqSxnyifT+PopCOFzUu07t6AB3C91/8rLLK0
	 yl54Vq4kkwnyzjQtH3CrLkwCbq5ultmb7YJS1uHvvyh8oEJHJtOCSfFU4QQp+6CBoJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795680007;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received-SPF:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:From:Content-Language:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-PPP-Message-ID:X-NC-CID;
	bh=v2cBIwuwZTTpBiqR0454ouMWhhQaLHGEGIiKzwAP7HU=;
	b=zbZNIPQtubKxoYCRrxf/PuHim+cNNgKSbjzlXEqV/yiE8DLRo+N+2ufN6Lbn7p9Wqn/9
	 ZKByHhnrqf1l4ELov4eau56XjfZjaCFl42x0IjXQNSGQfteyaecCpYvQ63vdKcfWTtBD/
	 5fHv8d6fanBIzl/kpl35LXW2ZsN1dAVYg9KTybUb3/N4MFfti28QdyS2A8ExxDbXIxKeG
	 uNawte6N1dRfF8z71pZC2Rgr56O8R0uRoFRDVspMUNflT7GxhergdRPZc88Rk6z28IbST
	 I5d8dTeQjd+pfHjDQB10hwQQ9W+b1pC120lhVFPB8YPBAyqWrBkZt7F9bNVFeIIsMeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=leemhuis.info;
	spf=pass smtp.mailfrom=leemhuis.info;
	dkim=pass header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=XjiAXlsa;
	arc=none smtp.remote-ip=188.68.63.102
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3CEB606A32C
	for <regressions@lists.linux.dev>; Thu, 26 Nov 2026 08:00:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3CEB606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=XjiAXlsa
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4jZppy209gz6TSp;
	Thu, 26 Nov 2026 08:59:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1795679962;
	bh=ij3hnJcC4WfaTRrqHQlqNFWDVnAM9xmzZit58oeLRAY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XjiAXlsaMm8yVPMQlY5bRRl4kOrJxoy2KIgKiSkCty6+c8TeMvO3ItDQ60LMlkFo/
	 A5pEPVsEdszn57IArzsNSpWrBiKyoWTwjqalB/17XKb680TXWCZ3w+zlCqu0KyisKM
	 U1ceAxfBRjfP6GKBsX/PSaXl5lEbAblNr+E+pE9sAnxLz/66mX4y6Ie+3yeVhOPKCW
	 2GaCU2lv+pOik7gOIlPZkqeUiwt+5hnuo1uRCFth5DcHL5zsGDUK1dZMxmDs7ZePA/
	 W6h2PidiKyG0hE8ssjZwEiahC4Gbo4ko8xLGqpR8CvgBzxDzGmH22Xkk/5P68fUjZN
	 WdB++PNjsWcMQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4jZppy1CQfz4xp1;
	Thu, 26 Nov 2026 08:59:22 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jZppw1rNtz8svJ;
	Thu, 26 Nov 2026 08:59:19 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 5AA525F949;
	Thu, 26 Nov 2026 08:58:50 +0100 (CET)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <b27e10f8-840b-47ca-a5e6-50db3a73313d@leemhuis.info>
Date: Thu, 26 Nov 2026 08:58:47 +0100
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
Subject: Re: [PATCH] Revert "nouveau: pci: quiesce GPU on shutdown"
To: David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Marek Vasut <marex@nabladev.com>, Li Chen <me@linux.beauty>,
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Ole Carlsen <ole.carlsen@tutamail.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@debian.org>,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20261025213027.842978-1-marex@nabladev.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <20261025213027.842978-1-marex@nabladev.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <179567993099.1392972.9410511653682031592@mxe9fb.netcup.net>
X-NC-CID: K/re8fuSYYOPP20M4/d2Cw5ZAXW/LSShXsWb7axahBVqe8RiaKI=

On 10/25/26 22:30, Marek Vasut wrote:
> This reverts commit 310326bb7df4bba094a3fc60364c641c547fd923.
> 
> This breaks shutdown on ThinkPad W510, without the offending commit
> the system normally powers off, with the offending commit the system
> ends up spinning indefinitely and the CPU fan goes full throttle on
> shutdown.
> 
> The behavior was already reported in debian bugtracker multiple times
> for various other computers too, and git bisect lands as this commit.
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1141969
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1146033

@airlied: given that you recently applied a few nouveau bugfixes, could
you maybe pick this one up, too?

I'd even say it's eligible for -fixes, as I'd say this is still a
somewhat recent regressions and the fix hence "should be expedited", as
Linus said some time ago[1].

And to make it obvious: this will reintroduce warnings during kexec the
commit being reverted tried to fix. YMMV, but that seems like the
smaller problem.

Ciao, Thorsten

[1]
https://lore.kernel.org/all/CAHk-=wis_qQy4oDNynNKi5b7Qhosmxtoj1jxo5wmB6SRUwQUBQ@mail.gmail.com/

> I tested the revert with Linux 7.2.12 from debian unstable, not next
> or drm trees, mainly because it was easier with debian test-patches
> script on that machine.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Li Chen <me@linux.beauty>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Ole Carlsen <ole.carlsen@tutamail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Uwe Kleine-König <ukleinek@debian.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: nouveau@lists.freedesktop.org
> ---
> NOTE: Maybe the revert is not the ideal solution, but it does fix my
>       problem, and I think being able to shut computer down is a good
>       functionality to have.
> ---
>  drivers/gpu/drm/nouveau/nouveau_drm.c | 32 ---------------------------
>  1 file changed, 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index 5e1336615cf6d..36c74f9edaa83 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -1090,37 +1090,6 @@ nouveau_pmops_resume(struct device *dev)
>  	return ret;
>  }
>  
> -static void
> -nouveau_drm_shutdown(struct pci_dev *pdev)
> -{
> -	struct nouveau_drm *drm = pci_get_drvdata(pdev);
> -	int ret;
> -
> -	if (!drm)
> -		return;
> -
> -	if (drm->dev->switch_power_state == DRM_SWITCH_POWER_OFF ||
> -	    drm->dev->switch_power_state == DRM_SWITCH_POWER_DYNAMIC_OFF)
> -		return;
> -
> -	ret = nouveau_do_suspend(drm, false);
> -	if (ret)
> -		NV_ERROR(drm, "shutdown suspend failed with: %d\n", ret);
> -
> -	pci_save_state(pdev);
> -	pci_disable_device(pdev);
> -	pci_set_power_state(pdev, PCI_D3hot);
> -	/*
> -	 *  This is just to give the pci power transition time to settle
> -	 *  before an immediate kexec jump. it’s mirroring the existing
> -	 *  nouveau_pmops_suspend() behavior, which already does
> -	 *  udelay(200) right after pci_set_power_state(..., pci_d3hot). In
> -	 *  ->shutdown() we’re allowed to sleep, so I used usleep_range()
> -	 *  instead of a busy-wait udelay().
> -	 */
> -	usleep_range(200, 400);
> -}
> -
>  static int
>  nouveau_pmops_freeze(struct device *dev)
>  {
> @@ -1480,7 +1449,6 @@ nouveau_drm_pci_driver = {
>  	.id_table = nouveau_drm_pci_table,
>  	.probe = nouveau_drm_probe,
>  	.remove = nouveau_drm_remove,
> -	.shutdown = nouveau_drm_shutdown,
>  	.driver.pm = &nouveau_pm_ops,
>  };
>  


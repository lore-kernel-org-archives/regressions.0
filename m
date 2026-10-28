Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188120;
	b=3K6TeE2qEZn05QljW13FmK0tUCbwQAdN0w3Arkto0/6CiCNR4AsWWcLILj81Puxaxgpt
	 wrikChBWWaA1o4GQFzw4pzh4dHloUe9f7nmrteuiTUOjtdsif2S5K5GKSVEOJsFMwYZom
	 JiId04bnCLMaQWGZyEocbSTrzIy7TsKXd8arOoGpDIrd6CY+R5Sy+vBxQwMJJXkNTpo84
	 q+RosASvT4jvyRmz8FQySwJY/zIr4dcOXGz1Az+YwXQFSMUkyqT9A9uohWnKdJL5rvU+R
	 i4jA10wyMi54LB4TTBob9L9PW6MoozTCIKeGCxJAQjys/B5oC2MpXD8lNKo/auG+rrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rz4LcTuIBFgFlzGCEXc77TsZGPHM5RG2DLR5yTjpqhU=;
	b=DGFsYckF0rLnkduRL1LxMmT3+Nw5CxvISNlxbKDFoOrt+ZYA3M40M6fW0HoVoClbv/qj
	 DpytOeBhsAJtM1nESROLhKpI+uaDC5WZLRdwt0Wu6reMz4UlHbDLerJh+Wz+T2/YhEihT
	 437Tc//fYdSblS7sxAm5mXUGdP3Hxzo96Qfu1bGjNU/nQ+tvyjVoeZLPvbLUZnnaiUH+K
	 NkLNh5q4bS5J1n2eWH7DMtZK25QCdXp/oD8XrPlHgYHqpH+q6xJKNApOUeDg0df3ruLcL
	 2iBj2D1ctAodwxJz2vP6bhAhM5d6aOAuJQSNHMWdnX6rW3lVevDKg8331epX9meYJsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K8zWYtld;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97EB1606A322
	for <regressions@lists.linux.dev>; Wed, 28 Oct 2026 11:48:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97EB1606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K8zWYtld
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c450ab1483cso125707466b.3
        for <regressions@lists.linux.dev>; Wed, 28 Oct 2026 04:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793188118; x=1793792918; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rz4LcTuIBFgFlzGCEXc77TsZGPHM5RG2DLR5yTjpqhU=;
        b=K8zWYtldcVFojFOR01nsLXXgv8zYGNSVJATOgktUjUx+lV0dm5wBSIwTc+lvvh1D4B
         lFQHm2j7Up/PawJy4dhMNazD0romggh+ZFPPJkdh5aNq0E6+72nbfNK4LbeNPQeBescn
         DemKe0FSmwFBPVBbytseKzgxBWoB48gt5D66C2zY78RVKYKxlHU6k/WDn3gS7UVOdzI/
         BvvKENHA1CkXz9X3vDkeXCP4AzzCXZ4D01Mo11/OvOuPpOwBozGwhYKNgrcgo/BeEcxf
         VC1RT4LbbcCOM35x+Tx+WAt3Xh3umuUApvvoTx6THYZ7iHkpCXOnZ0+nfffC1QtF//MX
         nXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793188118; x=1793792918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rz4LcTuIBFgFlzGCEXc77TsZGPHM5RG2DLR5yTjpqhU=;
        b=N6BkQDv9y0Ta9ag+M0Rgs3SyYiJFCVD8thwbKN+QCzU2DjjGJA9KUvCN/VTuozNlhl
         epmoeyTvBtRY7bDTd7TX3zofxDFZ5WGPhLSX3A8gONpIyNw6IBSeoarkS6Yvqrbl+1vr
         bik90VHsquouD8hRjIIEPVFOM7w1D3wkxdwS1eqDx3MtrX+N7+4F4WOe6Em70ppQqaDZ
         kU4OXbNdH/V4+z48sGru12mWBTt3M8SlI5939t7myWfT4gVnbAau3TCXubpJhgt+X+ND
         GWsiNWJ+Bo/YcST0VdF7Bt2tsR0LP1MjEUayu3eIq4sx6MK7J4sIwmquaMQwaDg8x34r
         7Szw==
X-Forwarded-Encrypted: i=1; AKwUvBxmFzXVdDltI+oAXMFCiSR6GZgUNjrQxNINjpu5rmKhcK/xO5BQ81YmyzOpUjhis4bdEe/Erpdkg303/g==@lists.linux.dev
X-Gm-Message-State: AFq9FYJPgLbpjQOuy/9w9ZJAPLoKRyLCz6Ez6cNvMXMStTGNdLqnfA9m
	rdkyPf6/YQdmMyeILfGs1KN+68us8vTxEZy9Txnk7dFKYF/qEOAAJBFy
X-Gm-Gg: AYBFou2wYBOwiBiscwP/BspjAq2jHTgiZDdEbIHeJ6gWf64vT/9a0nnJktiJKGrfHgO
	QoZXudiehxQIFowfcPoGmr0xVPIv8djsfnFxTkSletG/D2XKDLEOTz0VTCiLCcEDjeyFOpaFUtv
	LPuWppbuHmOcV5Pba1u5UCGPEMBvR3CSgveywrcnu8l/J9qipCUU4gFUHa0IwGsk/0qRe6TXEPR
	smA+m1g7ECMsaybrMRDljjnZgc/FZQ2FSG4PZucds/AJJ7TtnAosoIGrsusX8nAfmWVBS9tnz2f
	FVm/3iGkXQf5ps2dQ5LZJUlOkQ4C7TCqftg672/GjCiXqIPdVuvkb3vWDPxZGqogUyCSRdQR3ek
	293R8u64aIxZyaoNfiDrAdGavs20k0DgDKTrA4wxlSMu32tsD2orFPpuoKvkKBl5jk9ZMhDx0kZ
	EW7mZQ3tV/PKpg92Il9s087ETmBLH7fiBzOAYe1w8Ra3e2/WNHa3VBReA+18mX+HJSnQGWFIt9x
	eCCLQEOYKkuJOAibIoPT70zIQixyPHh8u0+oWUYP27LKhlfLHh1D20AmqguI/RApZajWi0Nfgg3
	dJM9DkUQRLJW7DYX5ikNbc8=
X-Received: by 2002:a17:907:94c9:b0:c3e:34fa:611d with SMTP id a640c23a62f3a-c49be00bf6fmr159888566b.35.1793188117832;
        Wed, 28 Oct 2026 04:48:37 -0700 (PDT)
Received: from localhost ([2a03:2880:32ff:43::])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b496459f10sm1375962a12.36.2026.10.28.04.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:48:36 -0700 (PDT)
From: Vlad Poenaru <vlad.wing@gmail.com>
To: netdev-bot+sashiko@kernel.org,
	netdev@vger.kernel.org
Cc: Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Andy Gospodarek <andrew.gospodarek@broadcom.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Jinqian Yang <yangjinqian1@huawei.com>,
	Andrew Preece <apreece@meta.com>,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] bnxt_en: Don't keep MSI-X vectors added before FW reserves them
Date: Wed, 28 Oct 2026 04:48:33 -0700
Message-ID: <20261028114833.239086-1-vlad.wing@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179310474137.3134.4690740150964769309@kernel.org>
References: <179310474137.3134.4690740150964769309@kernel.org>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Oct 27, 2026 at 12:39:01PM +0000, netdev-bot+sashiko@kernel.org wrote:
> - [Medium] The fix is incomplete when FW grants fewer MSI-X vectors than
>   requested.

Agreed. bnxt_reserve_rings() grows to the irqs_required it computed
before the reservation, so a partial grant would still activate
entries that FW has not reserved. In v2 the allocation is sized from
bnxt_get_num_msix() after __bnxt_reserve_rings(), i.e. from the rings
actually kept. With no RoCE driver registered, that fits within what
FW granted, and it is never more than the old pre-reservation count.
With RoCE registered, __bnxt_reserve_rings() can still keep more L2
rings than a partial grant covers, because the ULP share isn't taken
out of resv_irqs. That accounting predates this patch and belongs with
the ring accounting work on net-next, so I've left it out of this fix.

> - [Medium] New error path leaves the state inconsistent.

Agreed. This path existed before for the bnxt_reserve_rings() grow,
but the patch makes it the main one. In v2, bnxt_reserve_rings() also
grows the vectors when no reservation is needed but bp->total_irqs is
below what the reserved rings need, so the next open recovers instead
of returning early. bnxt_change_msix() also clears irq_tbl[].vector
when it trims, so a stale virq can't be requested again.

> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but the DCB IEEE
>   ETS path reaches bnxt_check_rings() and bnxt_change_msix() holding...

This race between the DCB path (RTNL only) and PCI error recovery
(netdev lock only) is real as far as I can tell. It predates this
patch, and the grow loop already has it. I'll leave the locking in
bnxt_dcbnl_ieee_setets() to Michael and Pavan rather than mix it into
this regression fix.

v2 follows.

pw-bot: cr

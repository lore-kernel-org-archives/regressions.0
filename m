Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE48841D648
	for <regressions@lists.linux.dev>; Tue,  1 Sep 2026 19:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788291953; cv=none; b=U/4cBck8IGMrOt4jj9xTy6Al5rZMb31SIyG7qOotoLxCtUgKZAyIEsqBCmwDldFlarf5+711UWpyzge4ugC1w/VDmUZd1PgwErZbFe7RAeKPb5mP8Lc2FeDw3+Sdag+zVBJcp9D4t8dCrsxo0lGTy7xAvUwceL/AvEZG6bE1K7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788291953; c=relaxed/simple;
	bh=noIwLroC3QxdO9H9YOTtZZGb08Agpt6CN69Saip6HSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GTNa5oyfLg0PFqmtj6wMVKVzrpiYNn2/2fZWSaTlMcgFzYFUH1Xz8MoUyEmCSnp47Jb6g55gtK2Ct/4JKTog1kM/FWVmF5dMev+lTxJdbOv/l6zLkdun2GLfe8qwvU5WrRqgqrfNpEaZpCzM2htg7Gz8OUyW7fabaYVWQHLrsg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZSzPks5; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZSzPks5"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so1597505e9.2
        for <regressions@lists.linux.dev>; Tue, 01 Sep 2026 12:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788291950; x=1788896750; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=egjLnBNnYVR/hTviRogWVrzKsRnzbjObGE015hZhVf8=;
        b=CZSzPks5X8CXxFN/fJB1SrIQuUi+PNbHLdwcHVX/m9xtz/SENp5eU5fsBhMhdWwtl0
         5udjhNWpGZvO4y+cYQskkCVpGqSJ7fqxY485HQVMuUBhzzTCf0dHLnMcVUvD9XRuDGVT
         rOBxPrFmXY92Z0dK42eeHy22qD+WZ7BK9SpbmcYa+wtfOq8TC4zCXPCD/h1Gr9tdfv6C
         5UW58bpJlxshULryS5MZCOUlscrgO5Cu3lbRW7uFFEJ4cz2cMoC1So7kH5Bwh8aBBxF7
         o8h98wH+925gOWMJrx7civtY6f9rohwf03ZClDUaz/mYXxgtntT7kf0tSu2reaFASECm
         yj4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788291950; x=1788896750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=egjLnBNnYVR/hTviRogWVrzKsRnzbjObGE015hZhVf8=;
        b=D13LdDTwfxyojxuHQ5cpoXWDVGDSVaiNAi4y5EOuXpYCycaCl+kGcjrWVo6TVdsqxF
         0khIbCR8RW5+LpknQItNggJU1w9jLYcezJUZ60+uAXzTKtk50m9ducoFPsHFvxzln+80
         zPpA7zU1yguuj/O+wKiGbup9G/OztLZxJyIio9enR/nE6i1OD6mC00sU+96C8CDe19Rs
         yIr2AiROHZI5xol3g0lP5g8FzpDM1TqU/yVVJbxNtexIEmA9EWD2YwBLAUGO79xqjDkr
         tOQW82yiBoZ3zqsBYNVJ7mzYBzKs4wtCHt/JayFiUNFyQFOXa1+N+iENKSYe/MyCwbuy
         c8cQ==
X-Forwarded-Encrypted: i=1; AHgh+RpEIAae9U8Qwkq1LtHnrNUxkyaQjoOvNqG1kFSQT3SuOAIOWdbwOAlIQduwrh+Hv7R/FGvqd9Ttjk1mWA==@lists.linux.dev
X-Gm-Message-State: AFuF++kd4aI0kWDPbX0DxSkFdk2Ozo/ezN7kO1V/OIz2GsiuBZG/QDNL
	RmvXd7Cue3RM/vpkM1bZnpZdiH+w5VnyBbvbWsSgzoZhvXZpmoFQESAS
X-Gm-Gg: AR+sD13wJwYtIJ0ze4Dx2wXBb+k6hPvqK21sqGLA8GyfmLOi0lXR9n7uNteDhd0YLoL
	JHfviF4fcHGp0/r8A/Kf86k72NRzobywt6/8KYBk0QX2xo35nIEAhIv4TWuSOJiYuR3FN/mvKLx
	jvJYt+H3SkvzYAVmGP3Qk5GPMwYpIx6DnTVt/h3Ex/BCvDd5aACQBlrsI8PF4t0NKrYTVfXoiAz
	wNW4cqK4QptMmQk/SLDgGjcNlHm2K2tcDPynt0HHeuQJIaFjnyOMNWih8i/7JafJir9Y/N5tYOL
	BP5i0mxYaN6vJFPu4DeYc+zYnLClSqWoUvjPU83+DQFme6QLmN+pTiTetw6GB0tNU5aCV8+b4Ov
	KPKY74AbmiBf/R4U39PWkBVG2KIDXTiW4fTn+r3OP6owev5z1/WcLfuCWE8aDqN74pK97gUbG11
	YOj8nhrpAFLSBRnpNNoOdAPFUSpr5/uwGjvtL3yc8CaIC96tSNp6QnIlPrUQ088i8wgRHZm1mHI
	MjiDBReR1NLeGaJ/PlhMDZjEJXr51H5fKeVAZRDM/HLhcUkugM5YH+tVcRV5JjpRxb/6XYlG6MK
	q3p4
X-Received: by 2002:a05:600c:a55:b0:499:60bf:c6f7 with SMTP id 5b1f17b1804b1-49b91c4cc2cmr646542415e9.13.1788291949789;
        Tue, 01 Sep 2026 12:45:49 -0700 (PDT)
Received: from emanueleg-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce4a804sm103691665e9.15.2026.09.01.12.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:45:49 -0700 (PDT)
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
To: Rosen Penev <rosenp@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>,
	Pankaj Gupta <pankaj.gupta@nxp.com>,
	Gaurav Jain <gaurav.jain@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Subject: Re: [PATCH] crypto: caam: simplify probe resource and IRQ handling
Date: Tue,  1 Sep 2026 21:45:19 +0200
Message-ID: <20260901194524.908240-1-ghidoliemanuele@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730204722.1101805-1-rosenp@gmail.com>
References: <20260730204722.1101805-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Jul 30, 2026 at 01:47:22PM -0700, Rosen Penev wrote:
> Replace the open-coded platform_get_resource() plus devm_ioremap()
> sequence with devm_platform_ioremap_resource(), which fetches the
> resource, requests the region and maps it in one call.
>
> Each fsl,sec-*-job-ring node has a distinct 0x10000 reg region and
> interrupts property, so the region reservation added by
> devm_ioremap_resource() is exclusive and does not introduce overlap
> failures.

This patch, now commit 9a955c0a7d11 in v7.3-rc1, breaks CAAM on most i.MX
SoCs (i.MX6, i.MX7, i.MX8). All job rings fail to probe and the machine
loses its hardware RNG:

  caam_jr 30902000.jr: error -EBUSY: can't request region for resource [mem 0x30902000-0x30902fff]
  caam_jr 30902000.jr: probe with driver caam_jr failed with error -16
  caam_jr 30903000.jr: error -EBUSY: can't request region for resource [mem 0x30903000-0x30903fff]
  caam_jr 30903000.jr: probe with driver caam_jr failed with error -16

The job rings do not overlap each other, but they all sit inside the reg
window of their parent fsl,sec-v4.0 node, which caam_probe() already
reserves exclusively via devm_of_iomap() before it populates the children.
So each job ring now collides with its own parent.

Seen on these boards (CI/CD):
 - apalis-imx6
 - apalis-imx8
 - colibri-imx6
 - colibri-imx7
 - colibri-imx8
 - verdin-imx8mm
 - verdin-imx8mp

Reverting 9a955c0a7d11 on colibri-imx7 makes the errors disappear.

#regzbot introduced: 9a955c0a7d11

Thanks,
Emanuele

Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EB3274FEB
	for <regressions@lists.linux.dev>; Mon, 23 Feb 2026 02:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771814304; cv=none; b=monzdkkFEe9cm8sDN3uXPMh3XBAu+j+1LyoS3R9pSgh3D0E+4R2wtmpqPlXagLrNE2yIqwvNm98NTqg8FJW9Xjpouyku86pV9De2Yw3G61LyHXZAaExeqNriCKkYFMIJzaICqh8Vmn3z6rNFSGWE1CvH05pv27iYZLYguaGoLw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771814304; c=relaxed/simple;
	bh=hQZ4RzCCncvW2OCRt6NdIBv7oMg2RYjH+aIKCbca1uE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jOpU/FBRLY0Zcqk0SLY2Z0Lzc4jPA4qyEYNHo0pqGyQuj9v3vA5ViN9+FvvBY0c1X8ZWl9pJn2ll593y4vAUpxu9qAtHGiWeXI58D19yCYatklrTvxb7aG+xeV+iNh53Ptq4yClPnUXYC4j/aSjoqpBalWs2dQL8EjjdprZuayw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z8kAfHNS; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z8kAfHNS"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-823081bb15fso2266505b3a.3
        for <regressions@lists.linux.dev>; Sun, 22 Feb 2026 18:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771814303; x=1772419103; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kMT8wFDz7qD4WZoEwD8t8Q2gmp9vlJakzzcqRJg3S4U=;
        b=Z8kAfHNS+Unwi+c+2HivkFkH/x4hWX1qVmtiCmJdTCYohU182FcBvrFFt5MpbW2ccq
         i6D6UotUf64eu8dT1YdbAiPfE0ywCLtkVXjGcDc/r/NnzUuEpM45hi9VcNwrJpOPj83C
         ks+pKcdRxVyvE3GKhrstkEE6xV7H8LMwVBhzbdBrdtP6T18Mnlgl6ysNKG4cuyMzFppD
         wvUDWcT36uP2/gdT/TfNcVOdNVB8kjkh1BtWBiDNl6shDxBiSYOmnl9YurE7xWjdw4e7
         XveE2v7bXMMBSXD1t2S31DyzwN1pwhIKZAWNGgW6QDfhlGYIOj7bx8Qacds7fRFXmYzJ
         UzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771814303; x=1772419103;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kMT8wFDz7qD4WZoEwD8t8Q2gmp9vlJakzzcqRJg3S4U=;
        b=hmxdtsGrjmbdefPx1QST1n+6A86OJ0FSoQPQL5AfWnNaWiMolBCyhK9GsGRSK2NGnT
         vOOKalFzx6R0+zTi3ALPWLl9i3mReGRzzfhSZS/T62ULmai7LYPYvBBXEvhVwEECC0ik
         LywVIUu9XItM6/RSIHSe7pY0xODP0bJkJZMwHFCgczJW9/uDGAl+QGuCYhW17W5QV5dk
         AMEJ1qDw/1KSAbWG4xSoXpEqYjbG+SaXtWFuwUSFLHgjw8mm2CjWu+ypr4Qcnv2CnmFY
         ynyhG44H1o+EaS3aDDPfG0VGYEo47+GwgEi/yo0zO8UjHuJk91YTzHUxj5hA7FSMtv3C
         mi6g==
X-Forwarded-Encrypted: i=1; AJvYcCVK4u1u0yHv/R4hRzTsa1LDd7zXjzlVNTS2B7xETconMJVDJLjs7Jio/lycqbDNX8AxOMQSjbgb9zHogQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxklpqvURPUo1IrGxoc9cHzmvqNUHsSAV2erNk4S3ISITp+xn3z
	DQtVZqkAwWcE/g/G8smZ9UJBc7C3gJ97KJW4AhtTzp44S2siPimeAjX7
X-Gm-Gg: AZuq6aIB1WSqmD1z5BOw0QK92tW6tNK10znUJpSp3O5drMeJONtmc3MJM1XZStdQRHx
	dQaBGkwnOGxdhK458u9XBptZWqqFxDh00g1EF8kF83nwsYIC9gvGfNWwiGDEF/IEBCIWULqqHTD
	jDX5DJeCC4qIGxvdSAOipyEO7C0lvSCZ3vS4Dn60VbvJCJs0dxAQGu0rITR7qlXq2fS73B9XBbl
	xgfu2Q/p4DQkiAXeqNNszFg1Iqe5nuPLECcvjN9sP/DKfwW7VLGy5FEL8b0B3f5ZiugOopivkIU
	whsgrQvfWFuhp2m2NNMEBXvTUJ8NupgG8eDj0lKC2eFBuLsnWZIXu53xS3m+kHMbuiEpkKlc6F3
	QGN98bdtqJh2of+vtlGOPL/bZaw73WEZ5qrebNmhnQ8S1roTHaSJb2Tbs1Tr9pGny4tUFyYrDco
	dG4zXVpb53H7wCtOvZcYzhdjrfsTSjFw==
X-Received: by 2002:a05:6a00:338d:b0:81f:4d16:5d8a with SMTP id d2e1a72fcca58-826da95ecd2mr5239840b3a.29.1771814302529;
        Sun, 22 Feb 2026 18:38:22 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826f2fc0c9esm2399402b3a.8.2026.02.22.18.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 18:38:21 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id C59D2420AAB4; Mon, 23 Feb 2026 09:38:18 +0700 (WIB)
Date: Mon, 23 Feb 2026 09:38:18 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [REGRESSION BISECTED] Unexpected section title false positive
 warnings on DOC: directive
Message-ID: <aZu9muHK02vPPl8E@archie.me>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

[this is actually a repost of [1] since that thread didn't get any attention
from the regressor.]

Hi,

Building htmldocs on docs-next currenly produces about 80 new warnings; which
all of them are unexpected section title on DOC: kernel-doc directive, like:

/home/bagas/repo/linux-kernel/Documentation/driver-api/target:25: ./drivers/target/target_core_user.c:35: CRITICAL: Unexpected section title.

Userspace I/O
------------- [docutils]
WARNING: kernel-doc 'scripts/kernel-doc.py -rst -enable-lineno -function 'Userspace I/O' ./drivers/target/target_core_user.c' processing failed with: SystemMessage('/home/bagas/repo/linux-kernel/Documentation/driver-api/target:25: ./drivers/target/target_core_user.c:35: (SEVERE/4) Unexpected section title.\n\nUserspace I/O\n-------------')
/home/bagas/repo/linux-kernel/Documentation/driver-api/target:28: ./include/uapi/linux/target_core_user.h:14: CRITICAL: Unexpected section title.

Ring Design
----------- [docutils]
WARNING: kernel-doc 'scripts/kernel-doc.py -rst -enable-lineno -function 'Ring Design' ./include/uapi/linux/target_core_user.h' processing failed with: SystemMessage('/home/bagas/repo/linux-kernel/Documentation/driver-api/target:28: ./include/uapi/linux/target_core_user.h:14: (SEVERE/4) Unexpected section title.\n\nRing Design\n-----------')

These turns out to be false-positive as touching the source file in question
(e.g. drivers/target/target_core_user.c) and making htmldocs again makes the
regression go away for the corresponding docs.

Bisection (with git-bisect(1)) points to bea467aa5da1f5 ("docs: media:
v4l2-ioctl.h: document two global variables") as the first bad commit, even
though that I suspect that bdd1cf87847ff6 ("kernel-doc: add support to handle
DEFINE_ variables") may be the actual culprit (regressor).

The full bisection log:

git bisect start
# status: waiting for both good and bad commits
# bad: [7f3c3a0a9103dc92c823f27db3284ac2914e7558] MAINTAINERS: Add doc files on real-time support to Real-time Linux
git bisect bad 7f3c3a0a9103dc92c823f27db3284ac2914e7558
# status: waiting for good commit(s), bad commit known
# good: [9448598b22c50c8a5bb77a9103e2d49f134c9578] Linux 6.19-rc2
git bisect good 9448598b22c50c8a5bb77a9103e2d49f134c9578
# bad: [5188f6bd408f937d81c0c37eb59ddc1035cd912c] docs: admin: devices: /dev/sr<N> for SCSI CD-ROM
git bisect bad 5188f6bd408f937d81c0c37eb59ddc1035cd912c
# bad: [bea467aa5da1f51834501da3ac3c40204027a221] docs: media: v4l2-ioctl.h: document two global variables
git bisect bad bea467aa5da1f51834501da3ac3c40204027a221
# good: [82e87387f6e2af9f69a7528733e953fd22e815aa] Documentation: kernel-hacking: Remove comma
git bisect good 82e87387f6e2af9f69a7528733e953fd22e815aa
# good: [bdd1cf87847ff6aaadd53a185209d2bb2db72165] kernel-doc: add support to handle DEFINE_ variables
git bisect good bdd1cf87847ff6aaadd53a185209d2bb2db72165
# first bad commit: [bea467aa5da1f51834501da3ac3c40204027a221] docs: media: v4l2-ioctl.h: document two global variables

Mauro: Since you're the author of regressor, can you please take a look on it?

Thanks.

#regzbot introduced: bea467aa5da1f5

[1]: https://lore.kernel.org/regressions/aUuLHzk5jdyBAxD7@archie.me/

-- 
An old man doll... just what I always wanted! - Clara

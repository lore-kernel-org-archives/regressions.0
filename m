Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B11F22A1D5
	for <regressions@lists.linux.dev>; Tue,  6 Jan 2026 21:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767736726; cv=none; b=NG8HqQ3KZ+Qq9J2PFOFAs3e5Zdyev5wY2IJOWkCH/6t7QDRR3rnqxGxfd9kaUr8HEYCGdYh/xx4DXq/30mcrbAQkjjduObFOevUhoIFi2OphOSb76hO60tq3AqZEqhEQT5UY5QGodfhMsP6PiNqMtzgq89Nuz4sEN/TAeKXKnzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767736726; c=relaxed/simple;
	bh=PA4T1FuOGJPe0gmg0jgpE0xszhW9EnikPFkQe+1akVk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pHcCzwb8SR3zt/IuMc6GS3psVPHXg6MfWpJHMBaf/G0/gtuu0dj2jmENrLyMzOEKAPpRT3+aQRubfnwYNFmw90qNAAOxykjGKLkVnP/7VzioAEaI1AyKBixfNWUuM+Gi7HGkSW1z1Bm0bYZ+P9qScEFgHTPkDdy3KOBsL6Sj/OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=LYZknSwR; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="LYZknSwR"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5D06A40C7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1767736724; bh=PA4T1FuOGJPe0gmg0jgpE0xszhW9EnikPFkQe+1akVk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LYZknSwRNBX9oy9gedH0FK7TUDckr/WSMVHiowpHpA4pJ0UX8yLuLG/ZbWRdsccBD
	 iDFHOvchjCIxB38TyEVGA4uJ8folFSFBj9wYzbJv+BxX50GIX80fnsQoOMxuYyEcbS
	 54R3r2gCZyyFkEPmwMa7kuqaIqC1YCgGbnOrKwe/EGRSRn4U3dbK0UpoK37tEU1D/N
	 DQ1BCGG/cVa+rqR2Zz6nl2m/x8sQF7j4SeWRnt7zvkQdobHpRjvXthJYETbD2xXG7L
	 A/vig+49F1I0srmRuyrQPzZAEE4lhRBbtriouhj1J21UGBerzSB3HJIRYUBzAurN4Q
	 N7bsTKiAJS/wQ==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5D06A40C7D;
	Tue,  6 Jan 2026 21:58:44 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Documentation
 <linux-doc@vger.kernel.org>, Linux Regressions
 <regressions@lists.linux.dev>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Randy Dunlap
 <rdunlap@infradead.org>
Subject: Re: [REGRESSION] Unexpected section title false positive warnings
 on DOC: directive
In-Reply-To: <aUuLHzk5jdyBAxD7@archie.me>
References: <aUuLHzk5jdyBAxD7@archie.me>
Date: Tue, 06 Jan 2026 14:58:43 -0700
Message-ID: <87ikdecsj0.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Bagas Sanjaya <bagasdotme@gmail.com> writes:

> Hi,
>
> Building htmldocs on docs-next currenly produces about 50 new warnings; which
> all of them are unexpected section title on DOC: kernel-doc directive, like:
>
> /home/bagas/repo/linux-kernel/Documentation/driver-api/target:25: ./drivers/target/target_core_user.c:35: CRITICAL: Unexpected section title.
>
> Userspace I/O
> ------------- [docutils]
> WARNING: kernel-doc 'scripts/kernel-doc.py -rst -enable-lineno -function 'Userspace I/O' ./drivers/target/target_core_user.c' processing failed with: SystemMessage('/home/bagas/repo/linux-kernel/Documentation/driver-api/target:25: ./drivers/target/target_core_user.c:35: (SEVERE/4) Unexpected section title.\n\nUserspace I/O\n-------------')
> /home/bagas/repo/linux-kernel/Documentation/driver-api/target:28: ./include/uapi/linux/target_core_user.h:14: CRITICAL: Unexpected section title.

So I did not, and do not, see any of these errors; are you doing
something special to get them?

jon

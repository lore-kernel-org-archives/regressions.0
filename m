Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BED22173D
	for <regressions@lists.linux.dev>; Wed, 31 Dec 2025 06:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767161505; cv=none; b=gTVAm7pJX3Ag5ioeMXQsqhHAwECnB17wOca461Aidr8Kmj0bleADvT+HAj2lwjguyz3Fm+/0CfBR2XcpKPP9JQUH1mglhO4927dVHY5hwmvcRAGoEnRWZvgHXdyjpwhyH6+g+BidxAQwy91QeKnLm6gZ2LgYc7VzKLQiDyvfEmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767161505; c=relaxed/simple;
	bh=t83rPWMegJooiy6QhbDdixiRaG5GgGAywkBRGaUjGgw=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=TwZvEh5R6Z1nplJ3mBCcIy6CMnDwAEUkbiNrWpZD9NGBUw7CPYpwppPRTAL0Din35dLcTjsdyz5po1UJacM0lvWiUKlr+7Qa7NbcrpVEYowyrZP8x+0QahioNcEoMyjAEg8Ht4r+BbDsahoZbJELxmqu/kqDTTR0c79YIc9K1Po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LCRTwwVd; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LCRTwwVd"
Message-ID: <59736756-d81b-41bb-84ba-a1b51057cdd4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767161500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=z64DZs+w89x8AC/nna2gxUPH589poWq3I+QyEvTvhfM=;
	b=LCRTwwVdR4yj1tB08o9pZeHt1Fum5bvDmLdKMuLInfbyBZNXGThoxR1ceSCzlbYvdsTVSM
	AUkZHGpqnqjIme8hdkCmBi/zBVt0jRKFv4L/EE8GbWHZe8IYeNYy6+UTMNt7nDfgUofDYZ
	IngeS+KaYn4GpogGxJ6y600nYBHU3uE=
Date: Tue, 30 Dec 2025 22:11:34 -0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Language: en-US
To: Lyude Paul <lyude@redhat.com>, dakr@kernel.org,
 Timur Tabi <ttabi@nvidia.com>
Cc: regressions@lists.linux.dev, nouveau@lists.freedesktop.org,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Matthew Schwartz <matthew.schwartz@linux.dev>
Subject: [REGRESSION][BISECTED] Freeze when nouveau loads GSP firmware during
 boot on Blackwell
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hello,

On the 6.19-rc kernel series with linux-firmware 20251125, I have been unable to boot into the kernel while using nouveau on my RTX 5090 rig. 

It appears to freeze right after "nouveau 0000:01:00.0: gsp: RM version: 570.144" appears in my dmesg, and it locks up at this point. It works fine if I blacklist nouveau or use nomodeset.

After bisecting, the first bad commit is da67179e5538 ("drm/nouveau/gsp: Allocate fwsec-sb at boot"). As it's a Blackwell card, I cannot test with GSP disabled.

Still trying to figure out the best way to provide complete logs of the freeze, as it's too early to go into my journal and sysrq keys don't work when it freezes... 

Thanks,
Matt

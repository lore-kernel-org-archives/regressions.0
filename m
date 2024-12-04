Received: from corp.converted.net (corp.converted.net [142.202.82.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1275239180
	for <regressions@lists.linux.dev>; Wed,  4 Dec 2024 18:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=142.202.82.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733336022; cv=none; b=PguWWYq1cT2IuwMvfbGKLHqdYTXwFv6xMpivl8OqlDkXcyEQNa2yp1VP0lKCiBfFHwvH0jt4j0iX1btj1YQ7VGHSi6IBOXFg4pHj85up/uMg5hVY8dQGX0WquucDLt2QtHDzWV/hdAvNnffEWXkI6WKFvnwr6Q5M7DXtQ3RSxp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733336022; c=relaxed/simple;
	bh=2IF82Ie8YY5xuR2s8Rz3RkAiJFxiOxg+L+DXPnzY2bk=;
	h=Date:From:Subject:To:Cc:Message-Id:MIME-Version:Content-Type; b=GIjnjFHQnPv+nq2W9r0c75upLKAxqHFIr0ZF6RxYjS09k8suJOGPJAGdCvaiHbvMQI6yY14lYpEkIo7fZ1x2ea8zgAdP8gGDdJj+w7u60AEs7wcGmgOUYZqkVStPJSkuHzxDocsboCluWCUV1JjhEVKZEhLwtEfVVIDesjEbOT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=t1c.dev; spf=pass smtp.mailfrom=t1c.dev; dkim=pass (2048-bit key) header.d=t1c.dev header.i=@t1c.dev header.b=VgcAcXm7; arc=none smtp.client-ip=142.202.82.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=t1c.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t1c.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=t1c.dev header.i=@t1c.dev header.b="VgcAcXm7"
Received: from localhost (localhost [127.0.0.1])
	by corp.converted.net (Postfix) with ESMTP id 3B847C4DDC;
	Wed,  4 Dec 2024 18:13:34 +0000 (UTC)
Received: from corp.converted.net ([127.0.0.1])
 by localhost (corp.converted.net [127.0.0.1]) (amavis, port 10032) with ESMTP
 id W3w96looFgID; Wed,  4 Dec 2024 18:13:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by corp.converted.net (Postfix) with ESMTP id 3A4A0C4DDD;
	Wed,  4 Dec 2024 18:13:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.10.3 corp.converted.net 3A4A0C4DDD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t1c.dev;
	s=FE92C2A2-3361-11EB-AA98-10F41FEB9BB0; t=1733336013;
	bh=Gqa8o6WfUPnCKwShnYQtzTHklGAZycG1ncdnXu3g1dI=;
	h=Date:From:To:Message-Id:MIME-Version;
	b=VgcAcXm78GVaAmukCwQzxg5tvJzP/XSdg99yEk8slnoq1A70dmtoaQjU4lCIqikkt
	 /EXPtXivD8YGwfp4U9z1vGYJC3eBFcjjdBAy++JxGqnUvpFf0TzHBCTm4ki8jcf929
	 Q/k7uDJ+7MkQW3X3985Hi5+MMwVb1YJWEkFHUeurmf3S+eQWoyV7xpbRJgSVRzlvlT
	 dnT8kfpTNQI3nQHP3WJzdImg/A0Dt/TFzerJOzTWNCqmeFkex42PvmEPjLVKdA/NE6
	 Cd9/CpmtNjoJAWQhZmZXTnXMjtR3HIOMRCzz9QmcSiZtUAnH84f/ZXM/eRVO8Won//
	 eKJe+qV1xtKjg==
X-Virus-Scanned: amavis at corp.converted.net
Received: from corp.converted.net ([127.0.0.1])
 by localhost (corp.converted.net [127.0.0.1]) (amavis, port 10026) with ESMTP
 id hLqmNqVbMRxZ; Wed,  4 Dec 2024 18:13:33 +0000 (UTC)
Received: from [192.168.50.12] (syn-045-049-232-164.res.spectrum.com [45.49.232.164])
	by corp.converted.net (Postfix) with ESMTPSA id B2BDFC4DD8;
	Wed,  4 Dec 2024 18:13:32 +0000 (UTC)
Date: Wed, 04 Dec 2024 10:13:27 -0800
From: Kainoa <kainoa@t1c.dev>
Subject: Re: [PATCH] drm/amd/display: Fix programming backlight on OLED panels
To: harry.wentland@amd.com
Cc: Kaitlyn.Tse@amd.com, amd-gfx@lists.freedesktop.org, daniel.wheeler@amd.com,
	luke@ljones.dev, mario.limonciello@amd.com, nicholas.kazlauskas@amd.com,
	regressions@lists.linux.dev, superm1@kernel.org, zaeem.mohamed@amd.com
Message-Id: <FMEZNS.X49653TQV28U3@t1c.dev>
X-Mailer: geary/46.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed

 > From: Mario Limonciello <mario.limonciello@amd.com>
 >
 > commit 38077562e0594 ("drm/amd/display: Implement new
 > backlight_level_params structure") adjusted DC core to require
 > the backlight type to be programmed in the dc link when changing
 > brightness. This isn't initialized in amdgpu_dm for OLED panels
 > though which broke brightness.
 >
 > Explicitly initialize when aux support is enabled.
 >
 > Reported-and-tested-by: Luke Jones <luke@ljones.dev>
 > Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3792
 > Fixes: 38077562e059 ("drm/amd/display: Implement new 
backlight_level_params structure")
 > Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Can confirm that this works for me! :)



Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9678E1509AB
	for <regressions@lists.linux.dev>; Fri, 10 May 2024 05:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715317719; cv=none; b=nhvdc30qZJrodCO4dxDuOKcLsF8aqsiY9uKlEzAmYVUUAdvPhD8fqXgGxYHcUVEYvKazVDvSyUjY/ZVNzE0IC58tUlwXwhmTOJZiWvjnuKWOt+XkB1Qa57dxjD44LmnShcT3qx2R9RSw9XIUs3yMXyY9Bz8EFfcv/e2363svQ/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715317719; c=relaxed/simple;
	bh=ZwdWi8hz4hc48CKegRD+KHzusrDBaQuoU/MfC2peqLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=V8wG6uBXsQjfCiWcMegipnr/LM1MHunTyoNUvRCrKD0tcsCuT1ylGUeW5KRUsitRQpu2Ffnrnx53A44NskbFc1SrecXYAlPGcMsmHhZ/bvHv8QHJYGx9WztsyH8q5tWVb/G91tTjjTpZwXlmgYRRozcDddSUf6to8Bq7sUqzfSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=XiSDbmHx; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="XiSDbmHx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=ycdZAVjIZHPs4UvXiJmUr9+8qF2QX8GoYT6USfkbscU=; t=1715317717;
	x=1715749717; b=XiSDbmHxPTEIACHckWJw1NblQzSUervGANJS7QjjNloDSK3be7/NYyuqK9ozc
	Wf6hRbk+9l7askkZagvO7e/PBE1UYbkUGpPMIYKZqQhQCgetbenQBMG01gO5c7lGtP0hS1NsIMqZz
	5O3T/jecIHun/aatSvRcCxTyqCL20phtSw+OnD7ckUrwxS998igZL7PJAPkYbfEAcYd70DLILQ1qS
	QfnaYTc+y1UsumDHc/14hccH2bExrg1vochH2IOMwpCCY9/ElH06jbF1p39bRk/GF56DycBwBi7o3
	bV+4dbe7pgIoDvLlJpl84Ko29GVikwfldylvzvnwLIy2MxGMgg==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1s5IUl-0002jb-Ar; Fri, 10 May 2024 07:08:35 +0200
Message-ID: <155168f6-f226-4052-942d-40f1249cb339@leemhuis.info>
Date: Fri, 10 May 2024 07:08:34 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] amdgpu: Unplug dock while suspended results in
 dcn21_link_encoder_acquire_phy crash on resume, *ERROR* dpcd write failed to
 set fec_ready
To: Chris Bainbridge <chris.bainbridge@gmail.com>, regressions@lists.linux.dev
References: <CAP-bSRa0ADA_wpkAVXJw60O8f=cxXVWuxwxfFBFE1y==jDSuZA@mail.gmail.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <CAP-bSRa0ADA_wpkAVXJw60O8f=cxXVWuxwxfFBFE1y==jDSuZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1715317717;9594761b;
X-HE-SMSGID: 1s5IUl-0002jb-Ar

On 10.05.24 01:28, Chris Bainbridge wrote:
> Details on AMD bugtracker https://gitlab.freedesktop.org/drm/amd/-/issues/3345
> 
> #regzbot introduced: ec5fa9fcdeca69edf7dab5ca3b2e0ceb1c08fe9a
> #regzbot monitor: https://gitlab.freedesktop.org/drm/amd/-/issues/3345

Thx.

It's likely unrelated, so just for the record: there was a earlier
regression bisected to that commit; see the links in:
https://lore.kernel.org/all/20231205195436.16081-1-mario.limonciello@amd.com/

In the end there a firmware update of the dock seems to have helped:
https://lore.kernel.org/all/5c7abd99-b4bb-4573-b2d5-2708c6ab2644@amd.com/

Ciao, Thorsten

P.S:

#regzbot unmonitor: https://gitlab.freedesktop.org/drm/amd/-/issues/3345
#regzbot duplicate: https://gitlab.freedesktop.org/drm/amd/-/issues/3345

[note, regzbot support to track gitlab tickets is relative new and still
in a kind of testing phase]

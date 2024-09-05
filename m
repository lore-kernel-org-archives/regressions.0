Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CE319A28F
	for <regressions@lists.linux.dev>; Thu,  5 Sep 2024 12:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725540351; cv=none; b=AQmOAPqN4dT0S8/CtK2k/TgTaCloA0+GA7rF1DWRml0e4vUFcYwqjVkujtabJqYCt28+3dyePYlCklzraSE3olXxQtfEj+T0FwrTvrmMICJ0brg3llGjawUqKxhXHb9IVMTzoSbY1wrxbgFAzM/Claki9V44UKd2btlIjXGb60E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725540351; c=relaxed/simple;
	bh=Xcx2MgBffnf+eg8qcGrHCeYQXmXfQC8m+rxT1FnNVew=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=ppQta+VRnKyi4i7g2ktU+U1tx4r6zLCsAwAIp/CVpNZMOsmMr8hA146k5M+RFdzeOukX9lrtztC2cFnfukrIimBUpo9qgGOj9D2Cx98yuZ52OIIkRqw/Tki32Pe3R9x/lY70agzuNt2Objl3F+uGcCgtLau+fxj5q+nE9TBJwJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=rx9NF7RH; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="rx9NF7RH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=Xcx2MgBffnf+eg8qcGrHCeYQXmXfQC8m+rxT1FnNVew=; t=1725540349;
	x=1725972349; b=rx9NF7RHbBLSgJFbuhTovU6BXQ7TjrdOEZmuTFxbH6GK6Xh2NNhhwhbz5cQbv
	bTERmY95dshSlo9dx+P8I3PCdYWst/sy2C5f+bLYvHCYVTUBABTakEoNj6fIMOkSZ1CJj4TBwzaAN
	p2LTppjsZMElPM0niGYLI3TX1w7SqWNrnkgFL1kU/9xxihgQdfCi94TjedWy80YaoI2escqUoCbcS
	X0aicR70v4KIpX54fra4YTlYVY9/+0WeqQ+f/h3bv2T3jTC/RHH6Uq3SoZwPjnEMx42yZk9FLpP2K
	kxprp/Fbcv6wtPtH+rHSXVBW3FwEbiRT7PjOzJi7s8ZRvhFc4A==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1smBrv-0005Wv-6b; Thu, 05 Sep 2024 14:45:47 +0200
Message-ID: <b3e15820-1457-49fb-9579-27f674377a28@leemhuis.info>
Date: Thu, 5 Sep 2024 14:45:46 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1725540349;d2f4e302;
X-HE-SMSGID: 1smBrv-0005Wv-6b

On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219193
#regzbot dup: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12106

#regzbot report:
https://lore.kernel.org/all/AS8PR05MB84851190CC1941157ED33D7D909C2@AS8PR05MB8485.eurprd05.prod.outlook.com/
#regzbot introduced: ec6ce7075ef879b
#regzbot summary: sb: gadget: composite: WinUSB driver install using OS
descriptors broken
#regzbot fix: Revert "usb: gadget: composite: fix OS descriptors w_value"

#regzbot report:
https://lore.kernel.org/all/d6392b1af4ab459195a1954e4e5ad87e@viasat.com/
#regzbot introduced: 738d7d03571c7e
#regzbot summary: cpufreq/amd-pstate: ~35% performance regression

#regzbot report:
https://lore.kernel.org/all/85bef384-4aef-4294-b604-83508e2fc350@proxmox.com/
#regzbot summary: cephfs: file corruption when reading content via
in-kernel ceph client
#regzbot dup: https://bugzilla.kernel.org/show_bug.cgi?id=219237

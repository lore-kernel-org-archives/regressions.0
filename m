Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED06925EF82
	for <regressions@lists.linux.dev>; Tue, 12 Aug 2025 13:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755003682; cv=none; b=hIq0N+e1SSHJrVisc2+Urj/Wt5k5tM5QMP9CwJGyauKLrb02qDqsk05ddrlCW6VOszgxMHVL0qcqqjS6cdHsGo4+UMMBFtvPIpzaa7S9cDF3sjLw66XKqk6r+jfhspRVIJki94hsjvLM00aWWa65JRspdeR6ck1ndNwZdraR7P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755003682; c=relaxed/simple;
	bh=qFPifKtLrFduwUSlKpQbKiA6WDLIMjTFOAnCtfF7xnQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=sc9L1UXYA9opc+84ek8MVhcbbVuw+YGKb3s9tzHZKjMOW4M73gDYS9ytBjFM/Pylzt6fxG5Nmmw+7X3mLU48ZV1vZkhravV8dxyeNoR+V0VWQinTywNkmdtyfyFN8EGxbMelg0dOuGhxdOFdjVaTXKIbQwV/1OrNPo2MX+dEfmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=v4HdwfQ8; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="v4HdwfQ8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=qFPifKtLrFduwUSlKpQbKiA6WDLIMjTFOAnCtfF7xnQ=; t=1755003681;
	x=1755435681; b=v4HdwfQ8hcPIOO3fekNd0FBOK1YAwiHR5NmvyvNrDc+wbdb0iRG2emQTcZ/dZ
	VSt6PPftNiXC8id6+BKW5hXMZWy01unAe9SpM+cQyUj9qxUXQGgV12OPrslxRGhjamvO0SSJbaUxQ
	KWmE30FhD15h8Mb7xyGQZTRHsyLYWVFhvu7qmQ9VW690uaQv6NgxFcs/pG5g3rzgs/K304ftB/PDe
	mUoEfcOE/GS21Z8GmnVIMrWBx7leMDDeSPiWZ4lwdWeLc9fzaNN0uVFOCANqx2n2tawbE7Na4eQbt
	ZlgNyuBo1tY11GzXURZXBqJ6IyfFwKv0TreNRobQwJypdmwjLg==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1ulocx-003t3U-0Z;
	Tue, 12 Aug 2025 15:01:19 +0200
Message-ID: <32a0d700-067a-4b70-ae34-46a63372ee5d@leemhuis.info>
Date: Tue, 12 Aug 2025 15:01:18 +0200
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
Content-Language: de-DE, en-US
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1755003681;b7f91099;
X-HE-SMSGID: 1ulocx-003t3U-0Z



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/cc77e5ab-daab-4ae4-9e5a-0329b5324730@redhat.com/
#regzbot introduced: bcb81ac6ae3c
#regzbot summary: iommu: iommu group missing, breaks virtio-iommu along
with qemu
#regzbot dup: https://lore.kernel.org/all/20250811170136.GA144788@bhelgaas/

#regzbot report:
https://lore.kernel.org/regressions/20250728232506.7170-1-dan@danm.net/
#regzbot resolve: reporter cannot reproduce problem anymore

#regzbot report:
https://lore.kernel.org/lkml/58be003a-c956-494b-be04-09a5d2c411b9@heusel.eu/
#regzbot fix: 43fb2b30eea7cf

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219061#c22
#regzbot resolve: problem resolved itself according to reporter

#regzbot report:
https://lore.kernel.org/lkml/aDSdQwwMYQHYX5Rn@a98shuttle.de/
#regzbot fix: 84e541b1e58e

#regzbot report:
https://lore.kernel.org/linux-i2c/197ae95ffd8.dc819e60457077.7692120488609091556@zohomail.com/
#regzbot resolve: inconclusive: reporter mia, maybe fixed by newer
firmware, just like https://bugzilla.kernel.org/show_bug.cgi?id=219680



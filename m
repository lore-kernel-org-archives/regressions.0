Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D456A19E965
	for <regressions@lists.linux.dev>; Mon,  2 Sep 2024 13:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725283128; cv=none; b=WJKSU3kW6Y0y7ufFy5O6buyakC0Web0G0ffZMs5Sm8vGiVlxoJj0Z6ZA0QaoeHXd8Eq/uMY9P8Eu/iYFSuG61t9OWjsYJ0Il85/5n+nabcJeKYdCLjREHC7qmHIdfIKZD0PSyzvPj9pJQsN5yQRMwQQdo6IUsVug4beEcPtRrH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725283128; c=relaxed/simple;
	bh=VXQfIw3miVD2BJNi+zsiOp4IqyXK8fU81R43pN8Br0s=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=EMBu0rTInvniGw8dngZdFkbdy3hFy0BNX2z8JNz4P5PduGN8L48iCBiAfze70J6iSKll/h9zq5hCacqNOi3LH90qb0sETQ1+aPJgq6wHWLw3jR+bYV+9uIDlmXNNXFALS789xe5bJcf5Gk3kweYET8P2zm0V7YYi2L9cz8NAJSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=PtFbwD21; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="PtFbwD21"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=VXQfIw3miVD2BJNi+zsiOp4IqyXK8fU81R43pN8Br0s=; t=1725283126;
	x=1725715126; b=PtFbwD214880cw+TqgatXbL87O4ilP1AUNEGSJivM8syokj4KHMQUitTtwkQx
	TA5PB1hNIgAE6vgbBBeQcMjRnvo2kqwhrHU8Ova8zBExH5z6MzzmAI1OVplzgH7ttGxSHXVxS/rlC
	NJX6TlbETxrJCxyOHZJrh0HNDSDM2RL3U6dKVkQ5W1emiBsph4DZb+NmBgzTG+MvClpLXTzXcziG7
	E5u5rpxKA5dN2EOQ3cYGQmq7e0Sok/x7Kc9INobxKwIcEKyMu1WY7TnbhMhwNgNL75iUb+XrLXfEn
	tFJhbyHI2n26Ww5wu7RT0zUkFgtLagy8UbPyLS7KX7/gnVILbA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sl6xA-0005xM-4U; Mon, 02 Sep 2024 15:18:44 +0200
Message-ID: <80860347-d274-4075-82ca-fd8898f56c6b@leemhuis.info>
Date: Mon, 2 Sep 2024 15:18:43 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1725283126;59a1d637;
X-HE-SMSGID: 1sl6xA-0005xM-4U



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/amd-gfx/872a3e83-9bc5-47de-8514-48abe8ff03c5@typeblog.net/
#regzbot dup: https://gitlab.freedesktop.org/drm/amd/-/issues/3513

#regzbot report: https://lore.kernel.org/all/877cbyuzdn.fsf@redhat.com/
#regzbot introduced: 377b2f359d1f71
#regzbot summary: KVM: VMX: wayland starting and failing right away

#regzbot report:
https://lore.kernel.org/dri-devel/26c01e3b726812979846710afcaab81e92da6a40.camel@declera.com/
#regzbot fix: c358a809cb58af

#regzbot report:
https://lore.kernel.org/amd-gfx/CA%2BY=x3n%2BX6PDza5KAG2fy2wLh0-w5mWQtvKbWvT3E3A0r_makg@mail.gmail.com/
#regzbot fix: drm/amdgpu/mes: add mes mapping legacy queue switch


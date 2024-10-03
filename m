Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D78823C3
	for <regressions@lists.linux.dev>; Thu,  3 Oct 2024 17:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727977169; cv=none; b=s8zbU/nwH+5HEiYA/NmktjjTfNg1rHy9a5959+HHvbES9YpUZYeMGc7+1nM1XUCx42X9fsnxEaVgyT0iNoh0njV8mbl3tEdJk/xA/Tft6qwQAdMk3MSz1DbrE+VBAR/B6+1FzkLOrPjpxTkB446AFmsAlCE5K3qZaTd+EZZH8WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727977169; c=relaxed/simple;
	bh=4gcWf4jFN6jrCh6nNeCwgD96JTVGXkEVYiys6wLLNlo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=CWMdys1Wk9spA9hEerc1q9KUoVsm6upC0S4C+Gq9u1a6rrB8yfxXR5sK9u9CG5fGDJOkuvDoOJC3M4ZG/uhod/6sojemgdaCBMItbu3p195gJXoxRDnu8b9dnH48B8vf9i2bu9KWYUAX/MiQdvRUPXsZBXvPAyB2TxkcfPceCvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=qHCQDsCt; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="qHCQDsCt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=4gcWf4jFN6jrCh6nNeCwgD96JTVGXkEVYiys6wLLNlo=; t=1727977168;
	x=1728409168; b=qHCQDsCtqxGhVELHyvXUKDnfPgHPQAmrGVYd7Nwhh+kT7vllKC69+TpjBIQPw
	+o4mn19kFT+drkwj8fgoICDNbbp7W3k7m0kP7txVD79epWE4DaWkFglr+4hFQxwif14FYF87+nsrW
	jnA+aql5tkM/R1owqTG3Nt8lVV/ly7YCmong38gc5g9Oj9dN1r9iCPgBbPCGk++D+Sjtnfvn5sR9M
	OqBN2jwL3XNXifbH7PLj4xhBtppaG/2a9CQXEWo+klC/oI8ji4VhHS+ahPYpwSHf4oaylgrxgWKbJ
	KirqqB7vWjymduf28ccpB1OPdSVEcM8a+emYljZA3Ann4QHXAw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1swPnR-0005HO-O5; Thu, 03 Oct 2024 19:39:25 +0200
Message-ID: <598eeba0-0656-4f98-a674-6121400111d4@leemhuis.info>
Date: Thu, 3 Oct 2024 19:39:25 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1727977168;b043e459;
X-HE-SMSGID: 1swPnR-0005HO-O5



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/amd-gfx/925cd47c-8f1e-4b74-aeff-6d13ae5f0753@johnrowley.me/
#regzbot summary: drm: amdgpu: choppy GPU performance

#regzbot report:
https://lore.kernel.org/lkml/cd67fbcd-d659-4822-bb90-7e8fbb40a856@molgen.mpg.de/
#regzbot summary: sched/fair: "Error: psi: inconsistent task state!" in log

#regzbot report:
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12160
#regzbot fix: firmware/sysfb: Disable sysfb for firmware buffers with
unknown parent



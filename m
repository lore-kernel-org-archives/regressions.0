Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B4D3064A5
	for <regressions@lists.linux.dev>; Wed, 19 Nov 2025 18:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763576066; cv=none; b=jO9GeKF/5uwbIuITxSPRJeHi3YQFlKu7Ad+Khv0570cFaoq5MLRPpW4eFdVz8evWeYoVXQpcbjpf3Ub1pB/7/0BMuk0p0R9xHeZPFW3jmV2alU+XWVc7bsgnVs6EapZrk7truVrKtfve5FGG3EVR8j/CVlbox14/yB51mjek4DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763576066; c=relaxed/simple;
	bh=IECo5b0O+c5xZ450q+yjinVUfGgIRbPYGpfd8eNznKs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Jn8VVune0WZ9rsGfVOhZi28elnrTJBBmVf8WpqwkorI3fk+mtTPqGYeThPmLK8U6iuVc/pS+I5OCVR7RafLaTUQNGTzjrJa7JIqEe6OriYAZiHewWWGBQt658CtTgexs0as1wf94jAVH8dqFQBoDgwaMBMf7qCCaYTSLgDtMigo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=OIRouQgD; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="OIRouQgD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=IECo5b0O+c5xZ450q+yjinVUfGgIRbPYGpfd8eNznKs=; t=1763576056;
	x=1764008056; b=OIRouQgDN9I3SNryHzRDVTewNFcvn1WCKidKlGz3XwxkDrMAcorY6PFEstzb1
	3dGxVToj0OikgefphNIvmzpLxMef274Nfm/xzkzDvgofjfJdy8TY4xJ/Q1O36Hu8a1FsDhhaJPMqp
	XxCGeaSgbA9EmxKzoKHs/CuSqxQHRimDsl6HJRovSu7lLBuwBJpkWYDP9zv60WZe0jQcgREIkx0ih
	5E+S/hmSIqMiVcF5o3iPSSZfGd+N8zbpcHZBWrmbBDzLIfiDC+r7S7OiOpUoHBfXy3wBQeLmXv3Ob
	6KQvHj6rBEbCeJhB8pB+dJ1uBYezgoFGEHbe5h0buK4U0qpqSA==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1vLmgs-00Cuhc-2A;
	Wed, 19 Nov 2025 19:14:02 +0100
Message-ID: <d900c8b1-5830-45b1-9c04-c7d91b93af87@leemhuis.info>
Date: Wed, 19 Nov 2025 19:14:02 +0100
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1763576056;ce38d328;
X-HE-SMSGID: 1vLmgs-00Cuhc-2A

On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/20251119-revert_sriov_lock-v2-0-ea50eb1e8f96@linux.ibm.com/
#regzbot summary: PCI/IOV: hang with s390's recover attribute

#regzbot report:
https://lore.kernel.org/all/70b25dca6f8c2756d78f076f4a7dee7edaaffc33.camel@mediatek.com/
#regzbot introduced: 443046d1ad66
#regzbot summary: PM: sleep: core: Unbalanced suspend/resume on late
abort causes data abort

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=220775
#regzbot introduced: d74b9027a4da
#regzbot summary: PCI: snd_ctxfi fails init since 6.18-rc1

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=220774
#regzbot introduced: v6.17..v6.18-rc4
#regzbot summary: net: netem is broken in 6.18
#regzbot dup: https://lore.kernel.org/all/20251110123807.07ff5d89@phoenix/


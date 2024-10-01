Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22AC2B9B0
	for <regressions@lists.linux.dev>; Tue,  1 Oct 2024 09:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727775522; cv=none; b=n2vf6YVKej+4HQ1tbLkptFSPTUTPBsSH7HDvn/kpBCJQq8Ft1F5QwjfQRL+by57+B2BHyNsOmHwnei3wpeitQmv5KWWhzwygqmy1Y3kiCyqYeT0W9x4urO9So9HUwVznYHBFXzK4eu7Cw29NMT6D5Zxe1md6cloTkWMQxbL/9xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727775522; c=relaxed/simple;
	bh=0pKhuxkucI42/+9FRRDIlEE3QzR9p8+wqANdvxMhR3E=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=EYIDQ64fMORiYnSH/4kXd7RQNpKvnjNjhLGHGUl1w6QZuKXFx5swSFyp3YUUakv2kvTLehd1ysICDUn6pIKraZ4qH+G/BVQAdH2Obc34a/Qq774hQfO95CrKN0nY+/SKCzqe0SLBcPuTy/vA394GiRZ8ZaiBxIl1Pkr/BN7eO2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=OBCoidMH; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="OBCoidMH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:Subject:From:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=0pKhuxkucI42/+9FRRDIlEE3QzR9p8+wqANdvxMhR3E=; t=1727775520;
	x=1728207520; b=OBCoidMHTKHrc9+aXBju+HMBmGEQbC5qfKoc+Ll+MkjfxZ7lnZ8y1S0R+dJlU
	xCciwytuVrVUzJho3BoznRDMnUgQ3k65pS7r/kD6NPPTWjTHPQus3dtEbEcDA5gd+ZbiOynVAt4nR
	UPWcvcjOC52L8A4k/w4ucseOqioZRidzy0C6eUH216MIoTZKJAKuFw6igwP6Vpixb7J76PKck3iss
	792p5/+VbjkDltFjYpqkcy7aLHLDrqSAnLg7OK62wEnWf4T5B+gltsmU1W/uI7HpVYnBLgzFAGFU4
	4Edje+8rr9nwsE5GcyzVZbFnPaPfd6xI3/Z5bCfcy3xXEMVz/A==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1svZKy-0001Ul-D2; Tue, 01 Oct 2024 11:38:32 +0200
Message-ID: <b158cbe2-e04d-48c0-b50c-de1eb662367e@leemhuis.info>
Date: Tue, 1 Oct 2024 11:38:31 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1727775520;5efaaa66;
X-HE-SMSGID: 1svZKy-0001Ul-D2



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: c9feac08-a1fd-4e03-a708-1046793443db@panix.com
#regzbot resolve: filed badly, marking as invalid

#regzbot
report:https://lore.kernel.org/all/c9feac08-a1fd-4e03-a708-1046793443db@panix.com/
#regzbot introduced: v6.10.8..v6.10.9
#regzbot summary: thunderbolt: topology changes not detected after
coming out of suspend or hibernate

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219175
#regzbot fix: drm/amdgpu/sdma5.2: limit wptr workaround to sdma 5.2.1

#regzbot report:
https://lore.kernel.org/stable/eb709d67-2a8d-412f-905d-f3777d897bfa@gmail.com/
#regzbot fix: x86/mm: Switch to new Intel CPU model defines

#regzbot report:
https://lore.kernel.org/lkml/20240919165641.4632-1-user@am64/
#regzbot fix: dma-mapping: report unlimited DMA addressing in IOMMU DMA path

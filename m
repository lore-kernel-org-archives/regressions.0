Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DEA857CBB
	for <regressions@lists.linux.dev>; Tue,  6 Aug 2024 17:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722966303; cv=none; b=JeiCLenjY0Cl8ePYRd4W5x+DsMD3mthBMuS2pIndem8d11P+74Nf2MoS31ssyAnx3LIm1asc9Lm7sr33oYtdQDLAv8YXt7gX4TWsvBwzQOFS08oJXapeSyiDbQs8r4qECmwzx0WI/MI0MKlfeK2rxqaqrZo3AK25co2Ups+1/gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722966303; c=relaxed/simple;
	bh=m4n/n8d0yhcqbAYUaN7Qk3uAJICwA+uUTvDl5O0qTU4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Js8ag5q1rkLPIcXKJRvKNazCRygAMufARP5/3K3tqoWcu3xv3cu7AtJbfZc4i0KQCgRnJ+6FaWpShStg30+LG79QitJfKkz8YmFW6X2ov+fvFoOyM28PW2cTmh54VdISLCesW9+GEuWTtL3fd+WX7zzCDNtAbSvFNCJ6iJH8JFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=CBePy7cr; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="CBePy7cr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=m4n/n8d0yhcqbAYUaN7Qk3uAJICwA+uUTvDl5O0qTU4=; t=1722966301;
	x=1723398301; b=CBePy7cr6GkvmE/kSCqdLsiPCb0EeK948XsoQ8HEWecHrxdnCfiHntdy0+RJh
	FFxRIYIwoc8G3u+suRQdX5hGIteTez54052C+YzpyL1jh6D/JwCGA1QKWGu6yWEM0mH03zLIpXi1B
	i6m7h6nT4duaW8prI5uCe1tvi+1aVVBwWIcgjTFBDMOgBhsrSCJpAoeqeuGWnmFHf8lpYqCXppzQr
	2m9uBc1r/Lo57HFFhRm4beWSH8JcGEpJ53w5/6fSanAHEECNeVPNEsRgY+BE0orYbO/6FVO3oASbo
	sPbWzuwszny5wuLSHn2jDztBxhrABerJ/F3g3RLuJrwY0pdLdQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sbOF1-00081M-Gn; Tue, 06 Aug 2024 19:44:59 +0200
Message-ID: <ef9505e3-0d18-4b16-92a1-f54ee54e5391@leemhuis.info>
Date: Tue, 6 Aug 2024 19:44:59 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1722966301;38e5d106;
X-HE-SMSGID: 1sbOF1-00081M-Gn



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://github.com/systemd/systemd/issues/33775
#regzbot introduced: bf2ac490d28c
#regzbot from: peterneutron
#regzbot summary: netfilter: nfnetlink: systemd-networkd SEGV
#regzbot fix: netfilter: nfnetlink: Initialise extack before use in ACKs

#regzbot report:
https://lore.kernel.org/all/314ee964-fe3f-4b4a-b83f-76ed6e6e16dd@roeck-us.net/
#regzbot introduced: 7190401fc56fb5f02ee3d04476778ab000bbaf32
#regzbot dup:
https://lore.kernel.org/all/b0d32b16-2def-48cf-84c1-3403f71c5b03@app.fastmail.com/
#regzbot summary: MIPS: csrc-r4k: QEMU malta MIPS64 network failure



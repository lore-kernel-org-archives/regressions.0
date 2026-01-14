Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0962139447C
	for <regressions@lists.linux.dev>; Wed, 14 Jan 2026 13:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768398164; cv=none; b=qcGHWhbo67PXXlXi3f/CNXDGNQFOH4pJoRNXhIFePO3YhHG9ffpQx7Lmng6U7hPCXxGF3wXTdDS0V9p+6z6h2rd1moajwiFh3GPDGw6fT3Tb5OBEqqzXkFlr6CNqL33Kkx3Soist4Bu35mO9jJjZVb21pJ8xBpUZDhmNKyDwxT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768398164; c=relaxed/simple;
	bh=C+v31SsN02yi3dOjN77T4qf5EOA0MypYLCHSo54qSGU=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=KmGXyOLIZNrzcWqkUxB9lxw2l6o+iZ2dZJ7c9NtrxnsBqX2n1P8PTIUUfLBROwhAbUWiExPoG3X9r+gzIeu+gzRX+o8rRpdMvYq2UyKewC8ZPg/3TkRUD28FFirrQvjVxBbuQC9PNKDZ+xRuRKtr6EaUEyZ/2N/otu8o89GVYI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=U4S+7BVJ; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="U4S+7BVJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:Subject:From:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=C+v31SsN02yi3dOjN77T4qf5EOA0MypYLCHSo54qSGU=; t=1768398163;
	x=1768830163; b=U4S+7BVJ4yt84TWY8r6SBZveek4u8IJ04YEsosPoiVQuNs1gCEcGomCJg+l+r
	UTZF0R95Lk81/rNV9MKov2h6z4Ax+Xa1SZVzXYlLBUIXKJAs6Tvg5M7BEBbD7UPD3dv4JW9JR1b3N
	jLocytewIGiwoCTW0IcyJInMzVWyP6CqjDRQafoOP5n+cj7gBoxLZxphtXi+fQE1+ad/X95bkY7Cd
	yaZkQOBxUXqSco875CEHv4KmjwBP3oua4ECCCKS79FMEzxLjSTeUnBj+dAPnxtBk1Bt8wYHOskvqr
	+XNZ3EmjK1pAsPnhL6BqEQfBNA96Y0KuVwEEi1eWsOjLc4v5Qw==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1vg18y-00C4xk-2U;
	Wed, 14 Jan 2026 14:42:40 +0100
Message-ID: <85254a5f-96f5-4d28-b127-7b2e461bc355@leemhuis.info>
Date: Wed, 14 Jan 2026 14:42:40 +0100
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
Content-Language: de-DE, en-US
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1768398163;63fa9953;
X-HE-SMSGID: 1vg18y-00C4xk-2U



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/7d4ac21f-491f-4f0a-bc50-7601cd1140ca@leemhuis.info/
#regzbot introduced: c9ba789dad15
#regzbot fix: cab01237512230

#regzbot report:
https://lore.kernel.org/lkml/4ece65a62bac434de260896d208fcd9067185b4c.camel@sarinay.com/
#regzbot dup:
https://lore.kernel.org/lkml/20251209132103.3736761-1-michael.thalmeier@hale.at/
#regzbot fix: net: nfc: nci: Fix parameter validation for packet data
#regzbot monitor:
https://lore.kernel.org/all/20260112124819.171028-1-michael.thalmeier@hale.at/




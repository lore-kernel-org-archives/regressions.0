Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1F384A52
	for <regressions@lists.linux.dev>; Wed,  2 Oct 2024 09:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727859781; cv=none; b=BJ/3r0Kj8zHUWe7mTJwpbGWBgMhWqROvR8lpdwXDG3PiJP3SAyhUa2RD8ZASNRgEueB7GYatrIP+leUfYJUGMk8y/cX6kHuDxK3Pkj5xM0Los8IWFuU+zebtZaGeSRGTvr8CegCvCVrH/3Az6jIgXMh9rr7yMXZBo0Tf/KiKCy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727859781; c=relaxed/simple;
	bh=QP0UoHtw6E76bE5naVctDLDFMUhqtIZp+voUo/9tsbE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=G7aFngPpqKuKgyGooLOGKCy1qPXeQfT7IxfRmSoKnMv5mH46Pqep44CKw2KZPJ7WFUcriBfX7N4yDgtvGjgV2uPjuJL3Sxw5OPRzQPbDOoq+3Q7tOTbUlVXATEw1b1d5KNniiSjnTqey3kZ8eiqymkxvDjW1IQa5S7uZxJM1XXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=L2/wrJsR; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="L2/wrJsR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=QP0UoHtw6E76bE5naVctDLDFMUhqtIZp+voUo/9tsbE=; t=1727859779;
	x=1728291779; b=L2/wrJsREJpg75AkB1E+coKtxGxtM3ezg/68KJVdDcFcnMAzjjclGMhEXCPTX
	u+3Ck6wrGmpJkUobw+rvloSjjGqTeKtrDzgan5AWjl4cXHBFCYEpaL+gHzIjQAhfYuxkQcDWXiO0G
	B2RnNUtH5NyEw2f0ATpPGnzAn6n5lILaz9u7TuxfQpmiP1/nnhyXcEv++LRR3BCEHNchbivFktT+V
	eCMrX/7PiuhmTAyAiDElqfK2c55Ony0lPkyptbdHkvvxmA1nKU1svmpcnxu0wPUtKT7Dwo10xMUMN
	CSoov8o1UJgZcol/LrBxfaPVPFJlyfG7Hak5eK81Hx3L/jxOAA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1svvG3-0003HW-4P; Wed, 02 Oct 2024 11:02:55 +0200
Message-ID: <a4179b2c-9307-4c05-9347-c11c442b7334@leemhuis.info>
Date: Wed, 2 Oct 2024 11:02:54 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1727859779;019ffc93;
X-HE-SMSGID: 1svvG3-0003HW-4P



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/925cd47c-8f1e-4b74-aeff-6d13ae5f0753@johnrowley.me/
#regzbot dup https://gitlab.freedesktop.org/drm/amd/-/issues/3658

#regzbot report:
https://lore.kernel.org/lkml/1a3af354-bd15-4219-960e-089b6a6e673c@adamthiede.com/
#regzbot introduced: bc46eb5d5d7780
#regzbot summary: drm/mediatek: text console not working

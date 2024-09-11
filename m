Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA55014D2A6
	for <regressions@lists.linux.dev>; Wed, 11 Sep 2024 09:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726048066; cv=none; b=mCIpKE5p3BOBXKPTQmw4g5n/eaEhLgnowRQ7toEKVocUHMtKvHyBVmP+dXIVmRDqEswzSN7bWMnDw0/9vIALIWCRl8SFg72jsuklvgQXGfY3zBJeJn8INMak+dY2o8JSTL5NRAjrvgWmci5H6IErrndXo7uKLFF6XIgGqqBm0DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726048066; c=relaxed/simple;
	bh=elV+Z9VkIBqtVgMjNTx9IjRxR8m+UHa1hNXTkXC7a/k=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=NxqmM8RuTkeozen2Mhd+l6PBgQPnZ8cWdntSi0ZSxBcl2vE7GmZI3dW6U6VjYIMQJz/nZEadfVCm0Axw7GEXz18dJ9GxM1a3fDkkG4mUH0mW+Q7oxs+WvpL6/LrQ2ncMUAWBvJRd93LmA90P6oiA1r9pfgoN3a2jt+Eb4pW9yt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=l+D0GBsv; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="l+D0GBsv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=elV+Z9VkIBqtVgMjNTx9IjRxR8m+UHa1hNXTkXC7a/k=; t=1726048064;
	x=1726480064; b=l+D0GBsvA7T+3a62BZQSAcHsd24oKSoIY4gyQEzZ++xepLS3B3NdGUjGS2e28
	2uHMnD7etoIsa7KrK2DKn0lEQf+IKXKHSr0mAHti1h7WfqrofkkGcQ2iYzK8QDAgrKFLTgEOvmLp4
	I9uAH0UAx5SF+fG+es1yxRuKLeLlErFv7/Ard8GRN/EcB3zNAt6X61c99mNFGDjbMDLq0mzsbf2UU
	oGhbI2t3A0TpgzBNKaMs2O9rnQf5fyPFPRMzQ6hkS589/oGdhQkHal4ZP/fPnX7C++JgW7GE5eWvT
	nDrYRxLhkWGZiPnWoECGkJWXEn0s3DGTbnellggnTc5kgkm80g==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1soJws-0004VN-Te; Wed, 11 Sep 2024 11:47:42 +0200
Message-ID: <32b9a23e-7692-45f9-9345-01d76cbff247@leemhuis.info>
Date: Wed, 11 Sep 2024 11:47:42 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1726048064;faadf91b;
X-HE-SMSGID: 1soJws-0004VN-Te



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/20240607151439.175035-1-laura.nao@collabora.com/
#regzbot resolved: patch was dropped

#regzbot report:
https://lore.kernel.org/linux-wireless/ea1eeb13-c568-4381-812a-dec4246a440e@candelatech.com/
#regzbot resolved: inconclusive: reporter MIA, but looks like this was
resolved

#regzbot report:
https://lore.kernel.org/linux-bluetooth/ZsTh7Jyug7MbZsLE@mdpsys.co.uk/
#regzbot monitor: https://lore.kernel.org/all/ZuB3omUkdUHLggYu@mdpsys.co.uk/

#regzbot report:
https://lore.kernel.org/all/AS8P194MB204221F4E3BD3979A86D89BA868F2@AS8P194MB2042.EURP194.PROD.OUTLOOK.COM/
#regzbot introduced: a62c50545b4d
#regzbot summary: ice: hard kernel faults when shutting down applications

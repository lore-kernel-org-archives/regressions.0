Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B343618BBA9
	for <regressions@lists.linux.dev>; Tue, 22 Oct 2024 10:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729593853; cv=none; b=lrPp2b2uZ9eU5nT6h8xNhsVxnn6rVHtVxkptt0+/wcYdB0mdKjaAccKrCMkqaUIrzwysZsshhKvPlRS2z4eiIZyVemBLXyiEYkED1vzxjRIlENDhptRE/eTN0aNwGQNXGXUOBwQTUc0bSu3wSnncGNxw5KO/k5+pQsjwX33KyAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729593853; c=relaxed/simple;
	bh=EOuA9GNbtjPXTtPwXf9afYS5elv+T9wUp8nY/wKS6wM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=JShPn7qR49hvSjT5Kfahm2IQbmdj0vHxAJ2vSYZM4VZs7xy6F0TirEn3fW296UNAxT+tBICi1gJeLDdoBhxLzXDq1MfDagunJFpsc30eI4XA7wQCZlCs2nuXTyTGV+aAFqSVOr5I62w8YkqWlut9PW4TiQ8y/eb/eUaUwFRHEIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=SGXvX6ng; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="SGXvX6ng"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=EOuA9GNbtjPXTtPwXf9afYS5elv+T9wUp8nY/wKS6wM=; t=1729593851;
	x=1730025851; b=SGXvX6ng53GC88NIWrz2ohKDVpDbT3UPF0wlz9WAC0ZQt7PUvFSLBc/AfkMMh
	GY8ny0WE88t2q3gYpXo10QlRRXxmDV5avz260QBeSa9/BMtwEw7gze2ueM2MtnB2qFtQe7UsXfxoI
	OHqKq9fXWidPeW9ggeRdX2SUYrrRV9ehrWcegusW6wTnFBlG9MwSiq1attItW0BSR1NXeq7VCLiuo
	RlD14sDI1xnvzBDBtX1+jlrSXj4J4jYwcky5T7nBEE22iIWqEDEtS+DkBo/Oo5bTScIhFNc/nYfjh
	8QWMRMDo5gvMeFl4bEzmUv5v3z3mkrx9q4ZgkTxCQN8THYrYIQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1t3CMz-0002lN-RN; Tue, 22 Oct 2024 12:44:09 +0200
Message-ID: <4ec50e65-c298-40b8-b6fc-6068245c3930@leemhuis.info>
Date: Tue, 22 Oct 2024 12:44:09 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1729593851;89e7e6f0;
X-HE-SMSGID: 1t3CMz-0002lN-RN



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/linux-fsdevel/ZxFEi1Tod43pD6JC@moon.secunet.de/
#regzbot fix: 9p: Don't revert the I/O iterator after reading
#regzbot link: https://lore.kernel.org/all/ZxbpdnA4jR7IYhRH@moon.secunet.de/

#regzbot report:
https://lore.kernel.org/all/20241010074246.15725-1-johan+linaro@kernel.org/
#regzbot dup:
https://lore.kernel.org/lkml/Zqet8iInnDhnxkT9@hovoldconsulting.com/
#regzbot monitor:
https://lore.kernel.org/all/20241022-pmic-glink-ecancelled-v1-0-9e26fc74e0a3@oss.qualcomm.com/

#regzbot report:
https://lore.kernel.org/lkml/40555604c3f4be43bf72e72d5409eaece4be9320.camel@coelho.fi/
#regzbot fix: 0bdb4e57a1b06

#regzbot report:
https://lore.kernel.org/linux-bluetooth/595efd8b-e0fe-4a87-90b1-4b579f3cc876@gmail.com/
#regzbot fix: 4084286151fc91cd093578

#regzbot report:
https://lore.kernel.org/lkml/cd67fbcd-d659-4822-bb90-7e8fbb40a856@molgen.mpg.de/
#regzbot fix: cd9626e9ebc77edec33

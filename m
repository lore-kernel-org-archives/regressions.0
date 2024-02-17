Received: from server.riadoklan.sk.eu.org (server.riadoklan.sk.eu.org [195.3.170.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57789171A4
	for <regressions@lists.linux.dev>; Sat, 17 Feb 2024 13:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.3.170.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708174919; cv=none; b=ZrZnYEXMU0a+7Ok/ivqo01OAalzG463Q3YuckVbpLubqlA+NvXhAExIWc38P52gYsaeX0KO62Naz/GARkxGqz7KeG269teo+4mFgHXWO4mhDSLNb3+YUPT9Qni4FDIORJOA72khO43mtb04NGlaBf6oWMDBrat9mkdoTm78dQUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708174919; c=relaxed/simple;
	bh=bNFCXljefnPfVaot69i47sixngSZnXI20qFpFoPQMvA=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=dLRevh7XwkqZZ6+C4OzEVk4TNfUL2mu80H9YLfe2fu6UzZSD0gcO0XIAF21rZUqeec16HDdpObahQ2cAi30ivUnxB2JkWsQSrjJk9ciNqWb3jTmwSaqQZscGcONcbZNXGbPeQhggE4lTXs/78Ybdgj6BiTdmyw2Get+KlHJqSTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=riadoklan.sk.eu.org; spf=pass smtp.mailfrom=riadoklan.sk.eu.org; dkim=pass (1024-bit key) header.d=riadoklan.sk.eu.org header.i=@riadoklan.sk.eu.org header.b=OHW2VyG2; arc=none smtp.client-ip=195.3.170.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=riadoklan.sk.eu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riadoklan.sk.eu.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riadoklan.sk.eu.org header.i=@riadoklan.sk.eu.org header.b="OHW2VyG2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riadoklan.sk.eu.org;
	s=default; t=1708174914;
	bh=a1yiWmHd79LEvMG3xQvKu83a2dFetZwXgYu8IfQjP38=;
	h=Date:To:From:Subject;
	b=OHW2VyG2yEUszYtI/05ik9zRfKvIy3pOBm/aVT8wa36y09P6tO8D4Bb7IpVzjo5X5
	 ovepNzmXq+1sF9vR+SjS8y+5DBjmiZDRM19/2+SofhzuulTZRqgUb97lH9Vq+9TVfu
	 UpQ1fyBbMYPe+7Jnu3y7BMX13cG0oCNzHIYd/+0s=
Message-ID: <ae64f04d-6e94-4da4-a740-78ea94e0552c@riadoklan.sk.eu.org>
Date: Sat, 17 Feb 2024 14:01:54 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: regressions@lists.linux.dev
Content-Language: en-US
From: Roman Benes <benes@riadoklan.sk.eu.org>
Subject: Kernel 6.7+ broke under-powering of my RX 6700XT. (Archlinux,
 mesa/amdgpu)
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Minimum power limit on latest(6.7+) kernels is 190W for my GPU (RX 
6700XT, mesa, archlinux) and I cannot get power cap as low as before(to 
115W), neither with Corectrl, LACT or TuxClocker and /sys have a 
variable read-only even for root. This is not of above apps issue but of 
the kernel, I read similar issues from other bug reports of above apps. 
I downgraded to v6.6.10 kernel and my 115W(under power)cap work again as 
before.

Please bring the low range back as efficiency vs power consumption is 
significant(links were not allowed, I posted in reddit's Linux sub about 
it and I am going to gitlab's drm/amd as well, but its like 90W and < 
10% performance tradeoff).

With regards, Romano



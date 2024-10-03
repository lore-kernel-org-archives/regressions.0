Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA19F155330
	for <regressions@lists.linux.dev>; Thu,  3 Oct 2024 11:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727956045; cv=none; b=GadGjR1QnpB5XE2sBYwOyFmy6l4Wx+ejVu1NHaJ64ZsjQrS8QjeM5NiJKX4ky6HGnyV12Rx97cFpj/ycJljrfhPwwEOnSAIxGXFXWzn5McnTWAaqbZqjpbqLtYvG7tVMfrqbGkMjuEB0XwGRNthmSH3fHxrOH1RR5u7AP2ztT8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727956045; c=relaxed/simple;
	bh=89kosPy/UOdAU7694xx7kgWt4LKl1ST3FmFSSuWRdJI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=ONw9PaCb5/KJsPcQSie136eF2JBVuMhnW56zTXfEz5mth3yyoFfXwY3ojz8LMzBIOWilkV2ioFDYh9UIWZpVyInsM5Yyi8pYW1YZPXDwhpjCvMlXeBtF2/agwJ5XwNmK91ZFrW6TLgCBQEMCob/+1YodMxmq8lpcXyAtrfrcxdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=S7/TdGwH; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="S7/TdGwH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:Subject:From:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=89kosPy/UOdAU7694xx7kgWt4LKl1ST3FmFSSuWRdJI=; t=1727956043;
	x=1728388043; b=S7/TdGwHsn2jLsp+KblkBLTlguzYgV1ZOvNzeolOtelRcyovdsKr2xJbNHrpL
	q660nLCc0zWIJTqFcn+w6zvngLC8S/m3qnaMro2DWJtt6IJkhbpDOAkxlR9OqAMXu6/jRABRHPQF7
	517U4EZxSxT3k+0Pbp3R1897GyIbdvOu5uSUV/xMojqmM0TATI5wfgYp41mRGyrm6gC9zyH88hBE0
	L22S4w0ExM8n2B904Nk/HaQvwDkpVLLa+698BJi4iSs7bXZvotnAhlK3pqHFQX6EHPD12LMhm4gm0
	OGi+BCl5XxDMhwJZFv2/DB47ymgGBw+ea1h6T4cBwWj02Bw0Ww==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1swKIi-0004Pe-8F; Thu, 03 Oct 2024 13:47:21 +0200
Message-ID: <adb5c6fd-eb6f-4a93-8d86-dd29fd826c81@leemhuis.info>
Date: Thu, 3 Oct 2024 13:47:19 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1727956043;18e847fe;
X-HE-SMSGID: 1swKIi-0004Pe-8F



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/20241001023402.3374-1-spasswolf@web.de/
#regzbot introduced: f8d112a4e657c6
#regzbot summary: mm/mmap: severe memory corruption
error under these (rather rare) circumstances

#regzbot report:
https://lore.kernel.org/linux-input/tbhy6xk4tjuza7rgsv55xss5woysyv4wlg46m6sxfq6y5nk7da@7hyl7cf5ehus/
#regzbot fix: a3f9a74d210bf5

Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC722CA4
	for <regressions@lists.linux.dev>; Sat, 24 Feb 2024 16:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708793022; cv=none; b=OpthkVCTcF+aikOW6MytBAKEGjUEA/9UJ3MzniZGPsUTwZ6YrsUItZEFC3WVYZHavhVtkPECnaTm5B+VmmROXCqH5pRAP90tIagJU/pI16fx/ePXAgNZOt6+ZDjR3HFDZfdUYOxBOAwyfNDDcy0jeNbMfKzNDBqQFR1Mc8ArIgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708793022; c=relaxed/simple;
	bh=4u3BoPpm814oBj6vrVOkgwPpir8W/GjZV9FplzcztZY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=sF/FHeY4mCMxhuMyq0b/m4eqX3KzB4o+pAPhbG6nVbCSYNJNed6Wj09Z8I8pPoZfSHJszlJNKCiXdlwFJsBSAMM8CqP0DFXJuGKncHx8k0ovbPDm/IgX5V7LwZVKcFC2UiRQrz2z0jz/En8XTho1gUw4fA+KgJxWSHnBXKFCLi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=qliOzOrO; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="qliOzOrO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:Reply-To:To:From:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=KL+om/M8GEH+6jqKEOuuH9nxUAuY1mu5pgWv90itT+w=; t=1708793020;
	x=1709225020; b=qliOzOrOoAyzD4/BoOPqULtd2v20Jl3et9aZWsSlGZz3JKRcJktxhbetwuDxN
	5H7zjtPUJ6yow7rLspGHr67t8qcnZrYLPEqb8jvV43gXf9jkKZoMSrAklsr8ruSv0qGmD/dr9ulJ9
	peApMfG0vAeTq+dX2OY9HAjXAOgb2kH+UoxECZemLBpLv1nJAS1PTxvm1Qg7SXPP/0mzAUESXsAfB
	ZDbOfmo0AzuwpNNLEhgPKcT4jR+BLAQppaE+5qUJtEtQTQFzpjlkh5WKmWIruL3zIfWtsb/xzJ2VH
	2iCTLybAQyNJJ1dD7qfB9SUPeWXdO9YkkLoViIKg0b2xfc3fmw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rdv7i-0003yk-8x; Sat, 24 Feb 2024 17:43:38 +0100
Message-ID: <1049ad19-dc5c-49d4-b12e-5b384f40ad7f@leemhuis.info>
Date: Sat, 24 Feb 2024 17:43:37 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: sched/cpufreq: Rework schedutil governor performance estimation -
 Regression bisected
Content-Language: en-US, de-DE
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>,
 Linux regressions mailing list <regressions@lists.linux.dev>
References: <002f01da5ba0$49cbf810$dd63e830$@telus.net>
 <43b8150e-17ef-4911-81ed-37a96c73195f@leemhuis.info>
In-Reply-To: <43b8150e-17ef-4911-81ed-37a96c73195f@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1708793020;29640a63;
X-HE-SMSGID: 1rdv7i-0003yk-8x

On 14.02.24 14:42, Linux regression tracking #adding (Thorsten Leemhuis)
wrote:
> On 09.02.24 22:38, Doug Smythies wrote:
>>
>> I noticed a regression in the 6.8rc series kernels. Bisecting the kernel pointed to:
>>
>> # first bad commit: [9c0b4bb7f6303c9c4e2e34984c46f5a86478f84d]
>> sched/cpufreq: Rework schedutil governor performance estimation
>>
>> There was previous bisection and suggestion of reversion,
>> but I guess it wasn't done in the end. [1]
>>
>> The regression: reduced maximum CPU frequency is ignored.
>>
> 
> Thanks for the report. To be sure the issue doesn't fall through the
> cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
> tracking bot:
> 
> #regzbot ^introduced 9c0b4bb7f6303c9c4e2e34984c46f5a86478f84d
> #regzbot title sched/cpufreq: reduced maximum CPU frequency is ignored.
> #regzbot ignore-activity

#regzbot fix: cpufreq: intel_pstate: fix pstate limits enforcement for
adjust_perf call back
#regzbot monitor:
https://lore.kernel.org/all/20240217213010.2466-1-dsmythies@telus.net/
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.


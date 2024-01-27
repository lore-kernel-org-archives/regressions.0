Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85AA7F
	for <regressions@lists.linux.dev>; Sat, 27 Jan 2024 06:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706338295; cv=none; b=mWk2IUZbAceX206KkZ5Biklv014bpQvdIn8cYVJj1vfMgem1C2BQnOfXr1p5K8KJ/crFwE3v21gcp5UUiBCXoLmZfHjCSTwuC5Eusar+h2fhTGU+Wi1tUF5+AEACVrm4i9KpsMB0nu9J/u22Gr2c0VQHiGuUBkM4ShYqVwIVVEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706338295; c=relaxed/simple;
	bh=hOmG7YU/nUY+E8qtqky8agixj550tE2Yn09iK7HLWoM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hWeJnNdf6CF8zf2rG+zgZlPmnpwcs8z33JAMrDiPYYttXg6N5VAOeoyTW3I+L1e2FpOMcdPw5X7skBxiWs2dsYF8qk1hyRyRoO3vrJSiekaDy/W8bD4ALErWqXAIPbADB1/6JvmdoxEppppCyyLJFYeXJqrFnI6T6LeMt+mhl4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rTcXL-0006p5-DT; Sat, 27 Jan 2024 07:51:31 +0100
Message-ID: <753e71de-9e0b-4335-baba-dfe8e2ce7f6d@leemhuis.info>
Date: Sat, 27 Jan 2024 07:51:29 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/7] cpufreq/schedutil: Use a fixed reference frequency
Content-Language: en-US, de-DE
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <20231211104855.558096-1-vincent.guittot@linaro.org>
 <20231211104855.558096-4-vincent.guittot@linaro.org>
 <Za8cjQXptttuyb6c@finisterre.sirena.org.uk>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <Za8cjQXptttuyb6c@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1706338293;901cbf1d;
X-HE-SMSGID: 1rTcXL-0006p5-DT

On 23.01.24 02:55, Mark Brown wrote:
> On Mon, Dec 11, 2023 at 11:48:51AM +0100, Vincent Guittot wrote:
>> cpuinfo.max_freq can change at runtime because of boost as an example. This
>> implies that the value could be different than the one that has been
>> used when computing the capacity of a CPU.
> 
> So, this seems very weird but I just finished a bisection of a failure
> that showed up during the merge window with the DT kselftests on
> meson-gxl-s905x-libretech-cc (Libretech Le Potato) running an arm64
> defconfig.  Looking at the commit this seems like a very surprising
> false result but I verified that the commit before this one runs fine
> and reproduced the failure, the bisect does seem to converge well also
> so it appears like there's something going on.  Does this ring any bells
> for anyone?
> [...]
> # first bad commit: [b3edde44e5d4504c23a176819865cd603fd16d6c] cpufreq/schedutil: Use a fixed reference frequency

#regzbot ^introduced b3edde44e5d4504c23a176819865cd603fd16d6c
#regzbot title sched: DT kselftests on meson-gxl-s905x-libretech-cc fail
#regzbot monitor
https://lore.kernel.org/lkml/20240117190545.596057-1-vincent.guittot@linaro.org/
#regzbot fix topology: Set capacity_freq_ref in all cases
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

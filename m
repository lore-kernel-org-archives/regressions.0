Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9445F3D393
	for <regressions@lists.linux.dev>; Wed, 21 Feb 2024 14:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708526587; cv=none; b=A6p3NrisufswwEND8NGKbrJRQOWQfpxA0mqDD+lvOLtwDLaMzrY658xdystNe1IXwi75QKDiBfW0KPHvQTff3zTHel43ET3Zuvy37ZwjHnjPpM/3+aTFnqHDSkfpAYTB5COkgUBWibgrU7sGUlhq9fqPMbW67oNXeHI7NjM+qoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708526587; c=relaxed/simple;
	bh=oLIGJrhRydDrcsY5fzeUUEo8DuGxNRXYTaKBa/2hELM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ayGQO9XwFkrfCTpgrqAwYO59GTI84EQu8YOxLyousrjPPItKQHouZBWt1VcwNGDq+sjoq2vcXpHpKKeLYosDIT2lVI+xzmg++JbasGPTqbWqaNE9HX6AKKLrxpYY1szq+wlRJLpJnTvevTJT8BcY0rYBbIXVEMXSiUWo/6C9hZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=l+I3mwss; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="l+I3mwss"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	In-Reply-To:References; bh=oLIGJrhRydDrcsY5fzeUUEo8DuGxNRXYTaKBa/2hELM=;
	t=1708526585; x=1708958585; b=l+I3mwss0UbJ8litZhCf6fxDx8f6chgKOWEYUOM+fl/qZY+
	LD+kjDGRsDAVOFYgqGmfxWkn8GISWo1ta9tl79xgWvT/UMRrywPLO/GDQIS35AK3rYefvqwXpk+xl
	pIVBJO9lLTfMNAkQY7dM2J3NH6yXj+TgxWrgEOmQPTeJXsyUTtVpQ1x3ruZPqlEEUlCL5mAd8POgf
	mb+l3cjrF3m6Z70LMJMSGl6exUlrB1YjXeK0a6H/IICejfUehuE34Iqr9iADXO17U/yA9jF9TjOiR
	uEeHyrerbMuGIj6apEIlPe7XlMUn659zygXgo5H4sQFDsBl7LcTAAeqdbIjgioqw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rcnoI-00015E-A9; Wed, 21 Feb 2024 15:42:58 +0100
Message-ID: <9b92706b-14c2-4761-95fb-7dbbaede57f4@leemhuis.info>
Date: Wed, 21 Feb 2024 15:42:57 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] 6.8-rc process is unable to exit and consumes a lot
 of cpu
Content-Language: en-US, de-DE
To: Paul Holzinger <pholzing@redhat.com>, regressions@lists.linux.dev
Cc: Matt Heon <mheon@redhat.com>, Ed Santiago <santiago@redhat.com>
References: <6a150ddd-3267-4f89-81bd-6807700c57c1@redhat.com>
 <652928aa-0fb8-425e-87b0-d65176dd2cfa@redhat.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <652928aa-0fb8-425e-87b0-d65176dd2cfa@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1708526585;ee5619e5;
X-HE-SMSGID: 1rcnoI-00015E-A9

On 21.02.24 15:31, Paul Holzinger wrote:
> On 21/02/2024 15:20, Paul Holzinger wrote:
>>
>> we are seeing problems with the 6.8-rc kernels[1] in our CI systems,
>> we see random process timeouts across our test suite. It appears that
>> sometimes a process is unable to exit, nothing happens even if we send
>> SIGKILL and instead the process consumes a lof of cpu.
> [...]

Thx for the report.

Warning, this is not my area of expertise, so this might send you in the
totally wrong direction.

I briefly checked lore for similar reports and noticed this one when I
searched for shrink_dcache_parent:

https://lore.kernel.org/all/ZcKOGpTXnlmfplGR@gmail.com/

Do you think that might be related? A fix for this is pending in vfs.git.

Ciao, Thorsten

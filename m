Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34421CD20
	for <regressions@lists.linux.dev>; Sat, 17 Feb 2024 08:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708158005; cv=none; b=bPbnyXvPtpz8OoQjbRLYDHz7TZbP1XzhSlhCgl7gVB12biB4d2zepAfaLbH7KnoqfMa/Ru5VB7pwCnCcsh30swaV3vxopq5+QcZlm+JnSGeqRuOOrOr+uwlvCJ6fa2Lj+wtDa5CXdjL4R1wByZFVkHPAODqRn2zWnHPMTzBepjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708158005; c=relaxed/simple;
	bh=3Z3RGAToGv1X15gl8S2FnRcozFIy+ktjx2zoSEQm/bg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=WQeQbKFwFTW9scK9JIRGX3kohN0kg8O52bm1PRKSr8JwikWqs9J7gmvVe66b+iSX23rJYUTjC1yXrVP301sVE0wa5ecsjrfV/OD2JlYFQbl8juGTGbcOivbtPE8nC6aqTPd4pGj4O5bKIDRjISizW42gyN770VvsB5w0AG1sV2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rbFvV-0000dP-U2; Sat, 17 Feb 2024 09:20:01 +0100
Message-ID: <5037afe6-c2a0-4eb2-a89a-bf7299d02cc3@leemhuis.info>
Date: Sat, 17 Feb 2024 09:20:01 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 6.8-rc: system freezes after resuming from suspend
Content-Language: en-US, de-DE
To: Trolli Schmittlauch <t.schmittlauch@orlives.de>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <ed2226ff-257b-4cfd-afd6-bf3be9785474@localhost>
 <df1d5d57-1058-43f4-8aca-f91e7ad92dd4@leemhuis.info>
 <a2af613f-c717-46e7-a53d-123452a379ab@localhost>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <a2af613f-c717-46e7-a53d-123452a379ab@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1708158004;8d27397a;
X-HE-SMSGID: 1rbFvV-0000dP-U2

On 17.02.24 00:13, Trolli Schmittlauch wrote:
>> [...]
>> You mean
>> https://docs.kernel.org/admin-guide/reporting-issues.html ?
>> Could you elaborate on that? Did you mean the TLDR version or the longer
>> version?
> 
> The TL;DR version does not mention rc and development kernels at all,

Well, it does ("Are you facing a regression with vanilla kernels from
the same stable or longterm series? […] *In all other cases*"), but
apparently that was to implicit or too distant from each other in the
text. :-(
> In the longer version, release candidates are only briefly mentioned 
> [...]

Well, the whole text doesn't care what version you use, just what you
should to do report it. And that is testing mainline (and RCs are just a
snapshot of it).

Whatever, I'll likely do a few changes hopefully soon anyway and will
try to improve the text to make things more clear.

Thx for the feedback.

Ciao, Thorsten

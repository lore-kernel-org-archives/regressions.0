Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E9F1DFC4
	for <regressions@lists.linux.dev>; Sat, 27 Jan 2024 07:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706339805; cv=none; b=q6g00J01xYlaaB+TTQPNNVMbjMrtnQCC5okyRRWr0CzLqVS/ooFgI5RxHu108JGN7XU6eotFxd412e16aM6b7U13odnelUPB0hjCD1Dn4pR6L25MYxZYAttFTCZenEoH62raiu8/ZDTvUy1hULAbh1ITFdcqUFwxRgWw77js0CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706339805; c=relaxed/simple;
	bh=Ez9nWgj2M8D/6rrwdmBuiz5UPXqMMI7ebBLEVVVtDHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ntWvjo3mewq0u/SfTq5uik646aDSZAxukdoQp2645kHWh+I0F9ahWemTQefy1FA+s/SJuOTYgtR0zultwU06LzIhiasEUxGZhVaR2no/VPxYGHh2EaqWUyEyCOHn7k+HH6fBaiSgiuufj+VO/4DesyS8/JnMhw+aOJlRG9U2y/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rTcvg-0002QP-NC; Sat, 27 Jan 2024 08:16:40 +0100
Message-ID: <ddf5f638-1854-47e0-9527-2549034005dd@leemhuis.info>
Date: Sat, 27 Jan 2024 08:16:40 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: [linus:master] [mm] 8d59d2214c: vm-scalability.throughput -36.6%
 regression
Content-Language: en-US, de-DE
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <202401221624.cb53a8ca-oliver.sang@intel.com>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
In-Reply-To: <202401221624.cb53a8ca-oliver.sang@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1706339803;ff411888;
X-HE-SMSGID: 1rTcvg-0002QP-NC

On 22.01.24 09:39, kernel test robot wrote:
> 
> per your suggestion in
> https://lore.kernel.org/all/CAJD7tkameJBrJQxRj+ibKL6-yd-i0wyoyv2cgZdh3ZepA1p7wA@mail.gmail.com/
> "I think it would be useful to know if there are
> regressions/improvements in other microbenchmarks, at least to
> investigate whether they represent real regressions."
> 
> we still report below two regressions to you just FYI what we observed in our
> microbenchmark tests.
> (we still captured will-it-scale::fallocate regression but ignore here per
> your commit message)
> [...]

#regzbot ^introduced 8d59d2214c23
#regzbot title mm: multiple 30-38% regressions in vm-scalability,
will-it-scale-tlb_flush2, and will-it-scale-fallocate1
#regzbot monitor
https://lore.kernel.org/all/20240124100023.660032-1-yosryahmed@google.com/
#regzbot fix mm: memcg: optimize parent iteration in memcg_rstat_updated()
#regzbot ignore-activity


Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

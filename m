Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9C5346E72;
	Fri, 30 Jan 2026 16:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769790255; cv=none; b=PuNg/7zJFhyyRwZPzyTzUxRxfNO1NlRDd1en/YW22kKVF8a8894dFBA2SLCkmyl8eNf9pPoWSk249WcM4FJRXts4MKC/GbLhw1JBUNXSgg40fZTrDUEAtv2MVKIBSBHIOq+YMgu5gq6N5PKiVtvSzvVykw31Nfro3l0qEUPIlFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769790255; c=relaxed/simple;
	bh=RRY59xCk+GQk5RWaWYRgA8N/GsT5QSdnNYZONhuczyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f7Fkdv7hjSJWRVpsib4pbrl7FHfo7T/Zf8sucRTlsbp+IbENiqk/qiUidB5PKMasLJjv603XmdTUrGQzt9BBv8FAGQIM0eSoN9Z/cliwbtvZtYDRgDUU+4zi4ClgsNrEI39afWro0RE/DZy7bgLKTTp07szhDbRQDzAuXdJs3T0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=JSFtNpIO; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="JSFtNpIO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=4uSXWhHMbGcqq+SNXUlGeRwPm2YMpDo+2SbYsBmjyZk=; t=1769790253;
	x=1770222253; b=JSFtNpIOw+g2WqJ1Cd1szpe12TmfVQ00wP/MPDTyc1k0/WrpXNwaOlnKvFdGO
	/Af9daoEBGSoCQSzh0zsDVp3Y7Ooosv/pp3RexVbq3CvviCT4HLygT3Y5RC6Me6M3gCDWUq2bj57y
	OGzoUYf4qD9ebR5ngm6yNGit2n5sQwtI1dumf8aLoZrEndwiAR9S2iRWYNwCso2d6uw7EllQwFGNE
	zzIVvZOuCIA4JI92aHGVLHNDwwWSHwtlKOnl1KUb/dBlVB2uX0puF3/F8x0Jn3K/kkkH5lX+IXnxB
	YhIGEiDkT1vqQQPViH9y7vy3oVHnxPNsETPYFE+LcB6grhrs8A==;
Received: from [2a02:8108:8984:1d00:a0cf:1912:4be:477f]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128)
	id 1vlrHu-009U1d-2V;
	Fri, 30 Jan 2026 17:24:02 +0100
Message-ID: <eef847de-7ef5-4491-91f2-7437dcb573cb@leemhuis.info>
Date: Fri, 30 Jan 2026 17:24:02 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vmware: Fix hypercall clobbers
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: Alexey Makhalov <alexey.makhalov@broadcom.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Ajay Kaher <ajay.kaher@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com, Peter Zijlstra
 <peterz@infradead.org>, Justin Forbes <jforbes@fedoraproject.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <bed73c01aba29fe651c9e23a9820a21e88ad13e7.1769048488.git.jpoimboe@kernel.org>
 <99a9c69a-fc1a-43b7-8d1e-c42d6493b41f@broadcom.com>
 <73641ce4-9387-48c6-8904-74997f9bb7ac@leemhuis.info>
 <cjacqm5kz67e3nrjfxhpe4lepr27cnbmykdixknta4r2wh7ugq@3wne235ikkb7>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <cjacqm5kz67e3nrjfxhpe4lepr27cnbmykdixknta4r2wh7ugq@3wne235ikkb7>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1769790253;c0c8e69c;
X-HE-SMSGID: 1vlrHu-009U1d-2V

[CCing Linus, maybe we still can get this fixed for -rc8 or at least final]

On 1/23/26 18:35, Josh Poimboeuf wrote:
> On Fri, Jan 23, 2026 at 10:47:18AM +0100, Thorsten Leemhuis wrote:
>> [CCing the regression list]
>>
>> On 1/22/26 11:00, Alexey Makhalov wrote:
>>>
>>> Thanks for reporting the problem.
>>> [...] 
>>> Workarounding QEMU misbehavior from the kernel side by introducing less
>>> efficient asm inlines does not sound correct.
>>
>> Well, fixing bugs right where they are obviously is a good thing.
>>
>> But well, the problem according to the description quoted below was
>> exposed by a change that went into 6.19-rc1 -- which makes it a kernel
>> regression that must be fixed in the kernel (ideally before 6.19 is out).
>>
>> At least from my understanding of Linus point of view on situations like
>> that. Or am I mistaken for some reason?
>>
>> Or is this a case of "we for now assume this is such a corner case that
>> nobody else will hit; if we are wrong we'll reconsider".
> 
> Hm, yes, from that perspective I agree this is a kernel regression that
> needs fixed.  We still want Linux to work with older "broken" versions
> of qemu that clobber registers.

Josh, what's the status here? From here it looks like nothing happened
during the last week. Should we move on with the patch at the start of
this thread? Or is "widening the hypercall just for
VMWARE_CMD_ABSPOINTER_DATA" as suggested by Alexey elsewhere in this
thread a better fix? Or would temporarily reverting aca282ab7e75
("x86/asm: Annotate special section entries") be the best move for now?

Ciao, Thorsten

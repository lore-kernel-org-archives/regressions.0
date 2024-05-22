Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EEEB824AC
	for <regressions@lists.linux.dev>; Wed, 22 May 2024 12:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716381321; cv=none; b=ZOvNn5Wy+tlaHb1xEj9p1W5JYrJOQiEju/9/Zz8BW8Vlfaih4kt0MnrSfbmCau0uhogL0K32mfjA66GgYrtklCZwyE++A7IY0fM9AFZKHaY/BfnvQBBP4dzubDc3IIlieJnc9TuFA8Ups9jcvs/I2nCukWsBYXJ90zxi7+6wC+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716381321; c=relaxed/simple;
	bh=f4XUZfxd/jnthZXZbSzGeFhL261IVLdpg1zekzqKhkI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=dMdV8kwyjMfad8pieqNArnOmeocHfPhT0RoJP+/2EyMiQ5eL1w2iOwTrvlvGGZZMxNW3KtGw1lkeksLkSROnlRWMRWrqGzUBhWyDVnHaEBwj7UnLImAlDeH1AtKFCECaHHeXH6l/gkALI+gJHA3hRk2EgdaEMcpZ+zCVo7WamFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=3eVQSM45; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="3eVQSM45"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=f4XUZfxd/jnthZXZbSzGeFhL261IVLdpg1zekzqKhkI=; t=1716381319;
	x=1716813319; b=3eVQSM45LOd4x2g0CAa67yIR6LsUt1OSuXabj79eqExyNO16xappsAo89HUZe
	VgwGT6sxHJfkfRE+g9emGQ7AJO+TM/LKOU+yd3mMnyDcik0Huvh87wP0LbpgTLG3i668YUCWbaaUa
	STwwAji+ZZdkT/Zv5359Is5GLK0qAXm6vNaSGgKp3asuekwhz2DOBDOXm3+CU9VEfvTSL/zAXOFJp
	fik8vvWfuWw6zp0kuHfYorf2VwXaFdE6tQd87CL04yN8ENosWFRCjvs7yFwPqMgQhwOsp5orEZyeP
	BhOgxXsYbehsDtfwpRRcOBeg5SeXB8m7eC6cc6kzSYll9+HgEA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1s9lBY-000178-6k; Wed, 22 May 2024 14:35:12 +0200
Message-ID: <9726103c-eec9-4314-808b-b47dd855a2bd@leemhuis.info>
Date: Wed, 22 May 2024 14:35:11 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: en-US, de-DE
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1716381319;66a4ab4d;
X-HE-SMSGID: 1s9lBY-000178-6k



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/ce2bf6af-4382-4fe1-b392-cc6829f5ceb2@roeck-us.net/
#regzbot introduced: afd53a3d852808
#regzbot summary: scsi: WARNING: [...] block/blk-settings.c:202
blk_validate_limits+0x28c/0x304
#regzbot duplicate: https://bugzilla.kernel.org/show_bug.cgi?id=218858

#regzbot report:
https://lore.kernel.org/all/c41c5bf8-9ed8-49c8-a9f4-431d523fffbf@tasossah.com/
#regzbot introduced: 7627a0edef54
#regzbot summary: ata: ahci: hotplug no longer functions on ICH7

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=218838
#regzbot resolve: invalid: apparently not a regression after all

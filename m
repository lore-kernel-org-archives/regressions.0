Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE077126C01
	for <regressions@lists.linux.dev>; Thu,  7 Nov 2024 09:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730971188; cv=none; b=ZD6FSaHIyt+AjpT8FYCbXvuYHPCyc76DUF45RdypksS8VdiHo8cX7NLgyrU2fvIs0vwWlHadQisb3N50RJzwpdCeWiPWmOz7yAEWDmiPOd1K/1UI6N2wU5hxNf/c2KaoMyulla7Zc/TpDKfAbz7Y3U2mm1FtWO/1kJMedV1U0sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730971188; c=relaxed/simple;
	bh=awhM6A3tduh3ZVIgvE+I5uR151yUQOKwJ8otDO9ieFc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=jjbcjbjsWLH5NVjFRRMOhwk1lC+vhg146MGmYOSUBqiaZwMcHJr74o1ppWn2SJ3Xk+mjYYbfXRVVcZHxv/yxl9veCXrPy3TohJa9L2QLO5RDsr9BiSSADyT1z97GT1HuTl57DQb80BeykCmbb4gEkD8VI1eGa+VGuCq823zhu/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=SeIUiBH8; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="SeIUiBH8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=awhM6A3tduh3ZVIgvE+I5uR151yUQOKwJ8otDO9ieFc=; t=1730971186;
	x=1731403186; b=SeIUiBH8NgSFJ8F2lm4I/ZnGYs7cYjK8PQK60Zn1jxuL/b01/VzWRYv5Sv7/C
	wP3KykRUB2AS4RQ4JbNXEmDnsHtpj4nE1ovvNvLy7NE3QoFAWlwK5eXk+rcEB7FeLLtoEBH4gbz9Y
	mQDYr0+ZozTMTOgGDEdffyzKsvfu11bygvD1DB/0ZssK2yWj2Px4XffiT/J1rc+pGE5cEpXiuBnh1
	utI5+yPQVo0tTlRPdsQ+bg7ajqboiiOKWi9O+3F+JIfjOqeMyXOSpH5t7PClJPnrMs9WkhlBwrv1c
	V+SF2uuAmM1kxqDHc8+WphSqZ89Ht3V6onQwdYZtHvCDa2W1Gg==;
Received: from [2a02:8108:8980:2478:87e9:6c79:5f84:367d]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1t8yg5-0006nt-17; Thu, 07 Nov 2024 10:19:45 +0100
Message-ID: <fd6cf3d1-01b0-4338-ae96-289ef0ad967d@leemhuis.info>
Date: Thu, 7 Nov 2024 10:19:44 +0100
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
Content-Language: en-MW
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1730971186;5333e5df;
X-HE-SMSGID: 1t8yg5-0006nt-17



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219440
#regzbot introduced: 7d6f065de37c

#regzbot report:
https://lore.kernel.org/all/60f752e8-787e-44a8-92ae-48bdfc9b43e7@app.fastmail.com/
#regzbot summary: wifi: iwlegacy: connection gradually slows down and
eventually dies

#regzbot report:
https://lore.kernel.org/all/CAGETcx97SEHP5MspzBHsMkmSExnY870DQ-F5L077vzOGnPx0UA@mail.gmail.com/
#regzbot introduced: f25b7b32b0db6d..aef6987d89544d
#regzbot summary: sched/eevdf: pretty serious power regression on Android

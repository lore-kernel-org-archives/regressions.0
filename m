Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC3D1C2DBA
	for <regressions@lists.linux.dev>; Tue,  8 Oct 2024 10:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728384081; cv=none; b=lKImjTADKYsqKOzzkwYYOrjmqXT8RyVvjuVZY8513Dbgz8fJ/X0KpIdxG/qO7V2M9Qo/6w+irWAZMj/R2q+MKki/lF88JO4i/nb7tPH3ohhAIWDaCJeaOZO24ku2c7q0CXt6iO586K6OjE8NYz1nC3GBS+NVdNsy5ThwFqgyjjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728384081; c=relaxed/simple;
	bh=0b8jrWYJNTN99fB5BfVX4UX1Q/ShsXNu1YsbCnr63T0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=s/9vk3hp6rCTE6mf9PndJNTkjkrQQbgCQBRIbRdiUwsSGvUZR4N03hMCVoyU/B+mmAhJfHRVzHQ8DoH6sROjX4A1ggVyA4CDqCy4K6BUfwI3TGsjNKmNJ+KiDUoKHxJBgLKklgE1dhEiZVf2BPmFavyyWowEEZ8VYDLWD5HQDqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=qoPQwpyD; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="qoPQwpyD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=0b8jrWYJNTN99fB5BfVX4UX1Q/ShsXNu1YsbCnr63T0=; t=1728384080;
	x=1728816080; b=qoPQwpyDuLYeVN0LX+LesYNYWGTRJv6j1+zc4yPhIzcxqhzzbST3oZpwQcG5H
	wtGz0LolBR6nI/LdVhbyzn8rYY7sFGYP/fB4jYWcsNqxXglAQ97sCb8qdTXlxpO0Z82+DKnARL1Xl
	GNRg0OS5MGK8xkGczwbY9LRn9XgIOvv9vlkj40vIgzYtfp95SEhuqUmNIKNC/O6afzqjx2ouao5R4
	LgqffZ1GgMQUDpyN7GpGaMQLH1a7EEJ7mu88Ey67tvNZezhhpR2qY6LO7aSYNZ9qIxOXbx99asM2w
	vQ/M495ReBg/N9o+6Ov+6cUkU4faC7JmQVps1rDmlw0xIL7WYQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sy7eY-0008TF-1f; Tue, 08 Oct 2024 12:41:18 +0200
Message-ID: <835ff611-f376-4ab6-8ba6-3aa925fe57d4@leemhuis.info>
Date: Tue, 8 Oct 2024 12:41:17 +0200
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
Content-Language: en-US, de-DE
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1728384080;f2eb28a0;
X-HE-SMSGID: 1sy7eY-0008TF-1f



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219356
#regzbot introduced: v6.10..v6.11
#regzbot summary: btrfs: btrfs send is broken

#regzbot report:
https://lore.kernel.org/all/20241003-savvy-efficient-locust-ae7bbc@leitao/
#regzbot introduced: 52e11f6df293e816a
#regzbot summary: net: lockdep splat

#regzbot report:
https://lore.kernel.org/all/D4OUJRP8YWRM.ATQ7KASTYX5H@mbosch.me/
#regzbot introduced: v6.11.v6.12-rc1
#regzbot summary: nfs: aarch64-linux build with CONFIG_NFS_LOCALIO=y fails

#regzbot report:
https://lore.kernel.org/all/40555604c3f4be43bf72e72d5409eaece4be9320.camel@coelho.fi/
#regzbot introduced: e86c8186d03a
#regzbot summary: platform/x86:intel/pmc: [ BUG: Invalid wait context ]

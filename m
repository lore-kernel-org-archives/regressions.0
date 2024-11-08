Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7101494D4
	for <regressions@lists.linux.dev>; Fri,  8 Nov 2024 08:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731056058; cv=none; b=Kx2tSXoLI7SzY4gq7tYbXlIcxZ23rFjk0sAvmYUJuOQCS7iqs20p3rJHrYPsYT+kQVvviNAGh3xLoyEYpJGDOAGQdhc8ARXGql7Jr7Or5+vgzbZzlPPcYbHy4oU/hiJpT8ABbs/DkW5ydOO5o4CCx6JzUyEq4wKGrkl8dZmF2jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731056058; c=relaxed/simple;
	bh=BWFtgK78YrvIZpKWr9RFEmhCYtwqiuyZ1A/ZuQXQsOw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=SAO/CAJ+WDg0lWDOK697mmqVNi+uDQIDtMbFL6MPftqBSTXxAX9OEzf8POi5h5z2ASoeXSnimTI1FsD0YI/sFdD0ii0pmorYqnDzD1bhGCHjPEJ5RQdzsYfdLUiObgg0fXpuIsVz+dmaCIXudi7mK9JHghKV+jkNG8NN6QfmHAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=XKIQ7jim; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="XKIQ7jim"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=BWFtgK78YrvIZpKWr9RFEmhCYtwqiuyZ1A/ZuQXQsOw=; t=1731056056;
	x=1731488056; b=XKIQ7jimt8rwc5P64UcNVxvv+qLaASgGvPR4TrjCWPN6q7ZgxxU5B1bxMTdXq
	mwx2OGmdIb7MdNrRy3kghBrE9LdKP5SRlTBPDoV16qVi1qlHzDEDUipQwuIlJbWD2Df1y45NGCLgU
	MEv1J0SsOQMYm7gouhTbfMy8bt796fwEc1tU6D6p9z+HtJdFhxqj29i5mj6PfUvhbzikCdEQcF+2Q
	043qo+7b7jHsZDL04wlltBMN5qs8ZU2WFwFQbuUhTLjqK2qq/JRf7LlHduLAxHXN906TkpNPFG5rI
	koDD8Q2pRC73bqdLs++Qs0sCB/J82goTjfP+cs6ChlRuuBl8Cg==;
Received: from [2a02:8108:8980:2478:87e9:6c79:5f84:367d]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1t9Kkw-0003q4-PO; Fri, 08 Nov 2024 09:54:14 +0100
Message-ID: <fab3a158-53e4-45f6-8c72-0f6d38bf3887@leemhuis.info>
Date: Fri, 8 Nov 2024 09:54:14 +0100
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1731056056;3b00283b;
X-HE-SMSGID: 1t9Kkw-0003q4-PO



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://lore.kernel.org/lkml/ZvV6X5FPBBW7CO1f@archlinux/
#regzbot inconclusive: seems people are happy; might be solved;
experimental code anyway

#regzbot report:
https://lore.kernel.org/dri-devel/7ae0cd7774f4b3e30cc033a7e543546732dbced0.camel@ideasonboard.com/
#regzbot fix: 4fbb73416b10778

#regzbot report:
https://lore.kernel.org/linux-usb/cf45e722-144f-4d06-8dd9-2f7f54283fbc@amd.com/
#regzbot fix: 623dae3e7084a95

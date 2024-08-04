Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46351173F
	for <regressions@lists.linux.dev>; Sun,  4 Aug 2024 12:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722775206; cv=none; b=Yajnuk6CIRjCnMqQLrn0kepqvx/ZixnQZbMcwu5CzPxsKtLwU0iwfRoQr9A8I/6Ha+z5mSWQ0l2IdHf+yK3QATKqjsQP0dFAB7Y23jfq9xXQroZ7AYFXlionyJ21/+udbPclcYACVCLzJV8li9BoIN5mJR/tpXer9bAQoZUFimo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722775206; c=relaxed/simple;
	bh=tRzIJ+LUi6P8pV+JB0mC1CB0e/wLnzuuYvwLiQ4sRA4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=LrOzDDA3ZOEv2p8UuaT7DzoHD43+00t5sBHSUiHF97jaVEgmHecVnE6imoagH1aElbAilJAyKa1Zc+XL/fWK3sKcPu64aHYqkAdApc+8DP8CJ1TeRM4tdruSVFsH2hNRiV/dSJag7HC20fTTtD7rwWRLu4Zu0UJ6n8hCzaOkgLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=gftQm90e; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="gftQm90e"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=tRzIJ+LUi6P8pV+JB0mC1CB0e/wLnzuuYvwLiQ4sRA4=; t=1722775204;
	x=1723207204; b=gftQm90efMTyoJTbwvcz5YwrIOws5EE8K8l35BcJflDXHhRpJmYXIOuz8+2Ds
	of+RwBfN0I+9RGNKgrBfIPhMZEhDto5yGmJqeXzb9uT86IrqRnu1yHQ4kU2/7jmRGQWvhQB2EpS6k
	e1ElfHYzNIi2D0mDbVvUX0n7E6JtPT0Y+1G+epf7y6q7Urbxz4yMldZ079cBcqz4BCbvMc89LEDcZ
	M3aEfNIeDIHYsAwqoXsBzKMKCobiENt2QoVxJEADqtBPYUZH09mLxiTZ/MT1KXLIus2p80npuW/ui
	al3FPGfksk0pMCjnMbX0fHCQcPdDJifL4TomwBtpVb1JdVoi+A==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1saaWn-0002aG-OO; Sun, 04 Aug 2024 14:40:01 +0200
Message-ID: <96f21252-029a-4a83-948b-99ff5ce6cfd4@leemhuis.info>
Date: Sun, 4 Aug 2024 14:40:01 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1722775204;356f5231;
X-HE-SMSGID: 1saaWn-0002aG-OO



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/CAH2r5mtNqn0i5NQSQvMvbHDdRDJxcNQh7iTj76L=90kEhDA7iw@mail.gmail.com/
#regzbot introduced: v6.10..v6.11-rc1
#regzbot summary: reports about suspend hanging the system from Steve
French and Mike Galbraith

#regzbot report:
https://lore.kernel.org/all/20240803125153.216030-1-gnurou@gmail.com/
#regzbot introduced: b1992c3772e6
#regzbot summary: Makefile: compile_commands.json target from an
external module's directory can fail

#regzbot report:
https://lore.kernel.org/lkml/20240729095542.21097-1-johan%2Blinaro@kernel.org/
#regzbot summary: firmware: efivars broken on machines like
the Lenovo ThinkPad X13s and x1e80100 CRD

#regzbot report:
https://lore.kernel.org/lkml/20240730033849.GH6352@frogsfrogsfrogs/
#regzbot fix: jump_label: Fix the fix, brown paper bags galore

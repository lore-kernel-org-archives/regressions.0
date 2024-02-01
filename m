Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3F515B0F6
	for <regressions@lists.linux.dev>; Thu,  1 Feb 2024 10:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706782151; cv=none; b=tMjCSYZetQsBNYYxhlNTFPyq8uKzF6As92erYW0LiJWamgJ3QvVWzZXal4n9Vo2dnA+JjKvvUNo5L9QYtxiH+wgoArFW/yUsV85/iRmDLrVZXv5FaBR9ebxnNTpTo5vqGd9Qsr/sqLGjgtBmkRH1QKZUKtwNy+M+TFl/3B82IWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706782151; c=relaxed/simple;
	bh=5TLuQJhpwn3ICG3CWBtpOBJJ9x4r1V9hZEQy5zHiKWM=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=XEJJrMF6gVAdCGWebxs0T7278FkYG4ef6gQ4pq/eDaauvZk2ZfA0XKffk7Zv4ozgXJyDw40W0OmYymViEVMoA2cgDDe81NZVUDQVKl1d7i6m8QQCKK0ytcpWNwnsrjpJJpl7RECd7qAODsNkdW0e0GbMLbdyKQP4+RlhV+QMOLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rVU0D-0007b0-7x; Thu, 01 Feb 2024 11:09:01 +0100
Message-ID: <28e3b4ce-1e98-4764-8360-9df17451dccd@leemhuis.info>
Date: Thu, 1 Feb 2024 11:09:00 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, de-DE
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
Subject: [regression] Bug 218404 - linux 6.7rc1 and up errors on boot with
 swapper/cohorent_pool/dma_pool
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1706782148;8542f788;
X-HE-SMSGID: 1rVU0D-0007b0-7x

[TLDR: Just adding a regression reported to bko to the tracking]

Hi, Thorsten here, the Linux kernel's regression tracker. I noticed a
regression reported in bugzilla.kernel.org that seems to be handled
there already, nevertheless I'd like to add to the tracking to ensure
it's doesn't fall through the cracks in the end:

#regzbot introduced: 8eace5b3555606e
https://bugzilla.kernel.org/show_bug.cgi?id=218404
#regzbot title: x86/boot: errors on boot with
swapper/cohorent_pool/dma_pool due to the use of 'nokaslr'
#regzbot ignore-activity

See the ticket for details, there were a few replies already.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

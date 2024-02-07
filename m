Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F111CF91
	for <regressions@lists.linux.dev>; Wed,  7 Feb 2024 07:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707289239; cv=none; b=O1GHXpyG9vKfGfN8CegxOyFU84zQGdz354G3Gd0vMpohEhGJ2BZHYsopGTiGt5v6MBIzCKTBNWPhQALez+6axCBF5UeXGCsVMUdsesphtR7YauWDDZhFS3Zq9mVMGowiQPJd5BIKK1wIswcomuamuvNUiXkjW6+aVtZ5qDGAQHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707289239; c=relaxed/simple;
	bh=5cFOOXQjQCM7uEtASQQFa592KIxMQJFwSa0bdxzeI14=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=pdM9Ta7wuqPjmWoL+m3WoJwNyn3Wc0fBj5Q1UiJ8l3Cj+SVQHpCmwz8uWQUO6+sqtb8gBnJDIUB1uBSV+MOZIw58xhhkDZvaRqaLNGqHlEePi1eOKXo/NIIyY3r4opYyPNEcN+xBMWbr5AhDpgl5WATY4VXQcq0t1+J1v/kfr6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rXbv9-0002B6-02; Wed, 07 Feb 2024 08:00:35 +0100
Message-ID: <733ee8ec-ed6a-4f75-8818-454b9cb668f6@leemhuis.info>
Date: Wed, 7 Feb 2024 08:00:34 +0100
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
Subject: [regression] MD RAID1 hangs during boot (when starting MD arrays)
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1707289237;fba306fb;
X-HE-SMSGID: 1rXbv9-0002B6-02

[TLDR: Just adding a regression reported to bko to the tracking]

Hi, Thorsten here, the Linux kernel's regression tracker. I noticed a
regression reported in bugzilla.kernel.org that seems to be handled
there already, nevertheless I'd like to add to the tracking to ensure
it's doesn't fall through the cracks in the end:

#regzbot introduced: 1b0a2d950ee2a54a
https://bugzilla.kernel.org/show_bug.cgi?id=218459
#regzbot title: md: RAID1 hangs during boot when starting arrays
#regzbot monitor:
https://lore.kernel.org/all/a92ca042-b981-4f35-beec-ebf416e4239b@leemhuis.info/
#regzbot ignore-activity

See the ticket for details, there were a few replies already.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

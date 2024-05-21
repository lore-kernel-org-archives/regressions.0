Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F97C7D06E
	for <regressions@lists.linux.dev>; Tue, 21 May 2024 13:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716298022; cv=none; b=fo1L44CMpO4trmyOmDYYmGKfiikinwEOyKn3iLIcwRkXVyPJz0FADulka1CiRayUSzTKO/MryPIyrDMVZlebVpEb+tsKWkRtbUR6Vrr2hv0HlDyziO5eM/mnKgSIrLjk3SxyfW900yx171zZRnqWrJ0eJF6PIKDJz83/ndO+QFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716298022; c=relaxed/simple;
	bh=+NBl0TSqZ6OFS20pLb65CEPX+x7mVjqHsu9EWAwtGaU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=G+M8Smu2O8SGs1OIQW5BgJH1aIsgaY6QoI7/IUBeOguznOsui2DxFQuw/QItOD8uRu6cuVTl18fZSM1+4wszsVFjZc5wqZBxNoMSzZHhC3N96IBmQW8LpiptLkTKMXNQQKrT3AGVFOp1hXsC0za+lvxIGD4FQ7BOKi91fJTuIJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=oGfX0Pzb; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="oGfX0Pzb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=+NBl0TSqZ6OFS20pLb65CEPX+x7mVjqHsu9EWAwtGaU=; t=1716298020;
	x=1716730020; b=oGfX0Pzbt0vQYwMDwMNLVlb4XB//DNQNIDTfkAoqO1IBnITrWg3PJxS20krEE
	QW+s5IJ0Bgz2sxlrrlTy0IbpsuIrI5f6x9LN+zOa8bbbYc0uN8PPqIrJzVsrDgIbZ2EjJoqX47vr+
	Jg7NOkw2aAGO7f4GCkOFq5Feqzt4Xh64dngRWUQuyd/Bp5evXHsruS4VOe3e1t8V/WYbfdzhPjYar
	1leG2WqRB9F3xBQOfwjF8kRecaTtDxWowecMmfjS3Up12eUBFNdz3UqtTfva3dzamsMfbjuHjOtwO
	C/ZWSTQb0QltipyBOfEc/Md1pMNZJx939Jgcv8tbyY0J1fYuoQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1s9PW4-0001gl-Uc; Tue, 21 May 2024 15:26:57 +0200
Message-ID: <925166c0-d062-41e0-9388-e45ad0dc457a@leemhuis.info>
Date: Tue, 21 May 2024 15:26:56 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1716298020;56187f7d;
X-HE-SMSGID: 1s9PW4-0001gl-Uc



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://lore.kernel.org/all/ZkxZT0J-z0GYvfy8@gardel-login/
#regzbot introduced: a1912f712188291
#regzbot summary: btrfs: removal of "norecovery" (userspace breakage)
broke systemd

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=217978
#regzbot resolve: seems like it does not happen anymore
(https://bugzilla.kernel.org/show_bug.cgi?id=217978#c3 )

#regzbot report:
https://lore.kernel.org/linux-pm/CAJZ5v0iik=M0DFoLER%2Bae3PoWb6Mt5rGEK-92i3nCV93Jbkm-A@mail.gmail.com/
#regzbot resolve: reporter MIA after a workaround was found

#regzbot report:
https://lore.kernel.org/all/77b71bd9-42be-40e8-8b96-196e214c8afb@schmorgal.com/
#regzbot introduced: 7bfb915a597a30
#regzbot summary: serial: core: transmissions get hung up before they
finish.
#regzbot duplicate:
https://lore.kernel.org/all/207771fc-294a-4810-a3a2-52ea0e27360f@kernel.org/

#regzbot report:
https://lore.kernel.org/lkml/hzhomd7d7uc4dcnpvd6ki6v2f6camzm5ufqp2syqudrvzzfxi4@ykcirhonbqql/
#regzbot introduced: 56f78615bcb1
#regzbot fix: ecf848eb934b

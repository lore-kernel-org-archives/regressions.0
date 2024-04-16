Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2A93BBEC
	for <regressions@lists.linux.dev>; Tue, 16 Apr 2024 09:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713259782; cv=none; b=roiccbpPiVq/c1i7kMTN05v41sUn9LMFYk+F6IE3Q24yEtGrmq7KieRssFVk+r8XhEepAE0ZgRlTeAqSVsAKc0USLTeuCHvIqftxf3xiKYRmwAeu3pjkJ/R1hAL4Cvj/qd//Gm3cJqtxWKilUF6zxY9j40XmApWOCvVfEuBQnww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713259782; c=relaxed/simple;
	bh=vFn/ud7NjdUDS5qlUEOLhCV4XkXXgTNW0Nz/PCngWqk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=C2RvFRB0WJX3K6njSWmpc5TwNlX8MD7t5q7/NrJjtuK2aKlHTJa2MP9mLT/QVjQ9pnn7Sj9VQgqQS7zDLB9myYgYWVRub1sMghD5Y9SqPd79Li4QY5y5lXAt0xfrImTXDvIJQTuI41gNt/3QUcIQfFUMBL1dEcU/6UlEyIpVVpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=SmT8IFbD; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="SmT8IFbD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=vFn/ud7NjdUDS5qlUEOLhCV4XkXXgTNW0Nz/PCngWqk=; t=1713259780;
	x=1713691780; b=SmT8IFbDqmRZCpvis+NRwiPndtI4MKI5wjmrufdKfpaTjC1Qs7z4Q/brOPTqT
	V/ShgCGJACxedGK2yhqJFuKfthv35W7aQKUf4C7kxIjYTXgeDRCsBVbZQ/lrdFJGbIdhMPtcf9t56
	Pqx7zslQsmHgDn/lNOcU7RV7kp6g/mLQMiApb1f3IJexopzBN7q04FkI48kJy5awffCVwK3Xnfka8
	RjAxoSBDI2lbbnTU+K/YUL8FnyoTy/pcm5ghPnohlH4jVCoQ6lH2FQ7xcUTV32idO6/DZJ5k6X6G9
	6zZnFZA26ie33PXq89nHXaftQIq0Q/ojvMNWcVHICLSJbONcDQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1rwf8E-0002Wv-U9; Tue, 16 Apr 2024 11:29:38 +0200
Message-ID: <0a186360-b9c4-4747-bd49-8c8c7c422983@leemhuis.info>
Date: Tue, 16 Apr 2024 11:29:38 +0200
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
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Content-Language: en-US, de-DE
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1713259780;8204cfb5;
X-HE-SMSGID: 1rwf8E-0002Wv-U9



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

Note, these mark a few regressions I lost track of as resolved, as it
seems nobody does care anymore.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=218720
#regzbot fix: btrfs: tests: allocate dummy fs_info and root in
test_find_delalloc()

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=217950
#regzbot resolve: inconclusive: radio silence from reporter

#regzbot report:
https://lore.kernel.org/linux-scsi/dsg6rd66tyiei32zaxs6ddv5ebefr5vtxjwz6d2ewqrcwisogl@ge7jzan7dg5u/
#regzbot resolve: inconclusive: give up tracking this

#regzbot report:
https://lore.kernel.org/linux-pci/20231228212340.GA1553749@bhelgaas/
#regzbot resolve: inconclusive: Thorsten lost track of that one, seems
people stopped caring

#regzbot report:
https://lore.kernel.org/stable/20240226213855.GB3202@hostway.ca/
#regzbot fix: f7b94bdc1ec107c9226

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=218198
#regzbot resolve: inconclusive: people are still working on it, as its
tricky; not worth tracking

#regzbot report:
https://lore.kernel.org/lkml/c7b38bc27cc2c480f0c5383366416455@linux.ibm.com/
#regzbot monitor:
https://lore.kernel.org/lkml/20240228161018.14253-1-huschle@linux.ibm.com/

Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213172375B
	for <regressions@lists.linux.dev>; Mon, 29 Apr 2024 10:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714384878; cv=none; b=oE+HgIBqzwcz25qRJQPIni9gojmh2RqbFc/d1POCxaR+mZ457/Yte7OOyiJHWM1vpx5KyX7HtYpxWYb8rMZySCmbMpXZTxM7u6SQRrQySf6zz2PvUizMPjUka0gF43pqCJr6a8DmvOoEAbAY8UaSEcHFo20Jh8aTJKWURo9S0Hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714384878; c=relaxed/simple;
	bh=XNqqa5MAqbMIFJA1xv59Ac6EMLzdtCJGft0L7evWZnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Pz9Gw4iGCJxN061CTxA9piMfL/wRjQCNO4/036YF/4YFXibsNHMYxLFds+Jr82kAE6um4itOaApkQpUHXFqGAyjYKHTKeSNBJdw6gKbFZWyW5y6HcKHV0J6nvWY3e3du9ur8+K5jmm6Cx+m5suj3xY7RYmI8Qknx3IsmIzMMXO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=f//sDKtq; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="f//sDKtq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=St6ypacS8FnDUbrYRaBzUuBIrzZGJhDg/e91SIX4mNw=; t=1714384876;
	x=1714816876; b=f//sDKtq5mXJwYFbGvb3sOPdgJBY3gvIh70+gVQFTpsdBvyTfELyg9CaBVzXc
	DC0sXSB5BQsykpecPTPceFBbkWdueWVVXLV5FcftbSd0yJzSihURh0C0+jIlk+Zf3tm8UQrbfWLHW
	JwYY4FGccb/UgV4XKjHK5QKFbhBnqgk/hWbvtVhkT4KiN5Q8iWtfC55o9045BPeIi9mWw3CGnHoSN
	TJe85p2IQo7YYwKtPqG+rDAzadH6xF8S/ZF5RAiVf0s9JNUHU+7Ytx8ep8p12N5cbDH2fMcgrCiM3
	fwdeqJO7/pXiRJexez32CxMD30D26O+RhwAU8JDIb40ozPg+uw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1s1Nou-0006lc-VC; Mon, 29 Apr 2024 12:01:13 +0200
Message-ID: <6ddd3a3b-2bee-4dfd-8d00-0529078ac7e0@leemhuis.info>
Date: Mon, 29 Apr 2024 12:01:12 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
To: Christian Heusel <christian@heusel.eu>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
 <dgzjtlv2bmszzsauw4oeqojru2gbfeg7gnov35nmnn6wm6ctid@xbhom4ky3bwk>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Content-Language: en-US, de-DE
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <dgzjtlv2bmszzsauw4oeqojru2gbfeg7gnov35nmnn6wm6ctid@xbhom4ky3bwk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1714384876;d1249c73;
X-HE-SMSGID: 1s1Nou-0006lc-VC



On 29.04.24 10:20, Christian Heusel wrote:
> On 24/03/09 11:18AM, Thorsten Leemhuis wrote:
>> Hi! This is the start of a thread I'll use for updating minor properties
>> of regressions tracked by regzbot. Consider telling your mailer to
>> ignore this thread, the replies are unlikely to be of relevance for you,
>> but done here to ensure a public paper trail.
> 
> For some reason regzbot didn't pick up the fix to the regression I
> reported.

Because there was no proper Link/Closes tag to the report:

https://lore.kernel.org/all/93766ae3-30d9-4dd3-ba01-870cc6387df4@leemhuis.info/

Acting just on the hexsha of the culprit is to dangerous, because some
changes cause more than one problem.

> Trying to resolve it manually:

Thx, that should do the trick.

Ciao, Thorsten

Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796DF7DA93
	for <regressions@lists.linux.dev>; Sun, 27 Oct 2024 09:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730020898; cv=none; b=teF9H9iWC/LI3Nmg7bnVKscMMiPcOepyDww+0HOhRq7X+cnq3hz+DuXzVGli/fMtvwTeBqBg39jz7ftb1oU3z3PbegNZ32APoElTqun5BlZPMlNBiaVTscezJSJLguWpeiadUc7vYec6HFyjFEm8SRdpTcYb9dKDuC93mUsdMJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730020898; c=relaxed/simple;
	bh=3slS6FARsrxzu/cgOnZl4ke33pcTpw6jtosWPiLkacw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=ZW+89OPI9tYGPLoF4quKJEx4TifUpeDKhzzjNp0l4Jov8kqFmWt/u6kP9cLsX5lD1FzaEi2oa7gefR6lgMH+gFDaRf/4GCZeTo1Ns3oDhATV3ctOwTXwbhYCd8K+3JVZY6OaxGo0TvPOCqWSzvgGLB+6VyfHe71aEMjrb82SdyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=qSt3YwkC; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="qSt3YwkC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=3slS6FARsrxzu/cgOnZl4ke33pcTpw6jtosWPiLkacw=; t=1730020896;
	x=1730452896; b=qSt3YwkCbRBLYTr9LxuMBDjeAnCB2TyiiGhkzxWh+1meKKxQ/uK05eoUATsjy
	PCtfjFMT1Rp/A91PmRjD+yL7FgowrBxNizWmESpMyRXZYEpFiZyc4u+kzsOzH6rW0J/hfCnK8iad9
	kYg5HMJ3i3eSSPW/5sl2UoPfGQIbgS0hzfGDMwTB6wzhqaFW/wah2jO0LqdeMSbEtabTZpcFrFp+u
	DPaligeYAlGih+vIRAnZEHKXIOvN3jO0pCgCFNIeb3jyfznemxKTLqrC0be6jlU3qxwKtCVyyFuZ+
	LyKtRfDtu0rsbjfcsf3MTt8o74nAf7bDNIesouIfHjj4xJA+8Q==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1t4zSi-0000Ob-T6; Sun, 27 Oct 2024 10:21:28 +0100
Message-ID: <d642dfc8-7aa7-4e3a-9886-9213adfe5032@leemhuis.info>
Date: Sun, 27 Oct 2024 10:21:28 +0100
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1730020896;8528d7f6;
X-HE-SMSGID: 1t4zSi-0000Ob-T6



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/20241018172804.GA2151929@nvidia.com/
#regzbot fix: 79efebae4afc22

#regzbot report: https://bugzilla.suse.com/show_bug.cgi?id=1229012
#regzbot introduced: efa7df3e3bb5
#regzbot summary: mm, mmap: performance regression in darktable
#regzbot monitor:
https://lore.kernel.org/all/2050f0d4-57b0-481d-bab8-05e8d48fed0c@leemhuis.info/



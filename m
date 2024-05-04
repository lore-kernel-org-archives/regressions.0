Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C8714295
	for <regressions@lists.linux.dev>; Sat,  4 May 2024 09:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714814411; cv=none; b=b+s/hUbZaCdYjU2Pgw+6ZWWVDTPAFipRFYfeMS1TvHuhXziVMGwGc5/FocYa1Lq2IJ3ox96W3H0U2Jfz3WZBxkNvuF1TnI4wzE2kPKcjH8Gs940yHy+ARNKl+MbjgOwN0w60GI9KB6DPGopy5A2VEwXrAeiYp/Uyv8eHM8DEYL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714814411; c=relaxed/simple;
	bh=1Q6ojxGhx9g8vqJqAnAXpRyow/P8J4rCDXBpJnUZlEU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=calaYptdM5rNYiOiDSVaV3uFqMh/4NfOrD2/RIiQyMnN0ZQsqUvdBx8eqlNZEFcUr8kK3i6orvWyKsEaBMRt1QHlwBH9GWf4jj/OxygwnSH8VK7PVUBBvN6ckHEyJ10sl3KnAO2RWSNa6EvMzwK3B4Ifz5JV6TGZmtlU/aCQbMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=jxWgcSor; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="jxWgcSor"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=1Q6ojxGhx9g8vqJqAnAXpRyow/P8J4rCDXBpJnUZlEU=; t=1714814409;
	x=1715246409; b=jxWgcSorxNs3snp3TNHXOBm47FKKvm5xLWDrpsflC6OJR4YA74NECkE4+UhmT
	aWaUkT1iMlgeaw5NjiXr7ZA1IhUsg/TnxPPRvApbIao0pAj+CcKGq8ivx6rz/jdkxcIlk7ZKh357V
	t1+mDln0nPjBWWis0UBTrx8z0iL7IwARTQCGqBoHh0kwwmSyDhm69suf8j7UFRJnuFcbVOgFaVAuJ
	zV+ajUqYQGfVB47ca0KorZwHVNdy63Un8RQT4HyYj/AYN4TL7O36dHvARm7BjUc5ZkdrLM+jgno7C
	MtP8enxzpyAWlk5ca3XQysQflTtSLx0T/fVeQ7URyLX9ooJGqA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1s3BYn-0007rB-7c; Sat, 04 May 2024 11:20:01 +0200
Message-ID: <645d2dd8-3c85-4da6-a391-7394af417c6c@leemhuis.info>
Date: Sat, 4 May 2024 11:20:00 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1714814409;25a87f41;
X-HE-SMSGID: 1s3BYn-0007rB-7c



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/30f757e3-73c5-5473-c1f8-328bab98fd7d@candelatech.com/
#regzbot fix: wifi: iwlwifi: Use request_module_nowait
#regzbot monitor:
https://lore.kernel.org/all/20240430234212.2132958-1-greearb@candelatech.com/

#regzbot report:
https://lore.kernel.org/lkml/6a0b7c20-a250-4542-b170-101c9663b2e5@suse.com/
#regzbot fix: x86/xen/smp_pv: Register the boot CPU APIC properly

#regzbot report:
https://lore.kernel.org/nouveau/2775775499487396fbad5c2327dcaf7fb88a524d.camel@nvidia.com/
#regzbot fix: nouveau: Add missing break statement
#regzbot monitor:
https://lore.kernel.org/all/20240430131840.742924-1-chaitanya.kumar.borah@intel.com/

#regzbot report:
https://lore.kernel.org/all/20240502081641.457aa25f@gandalf.local.home/
#regzbot introduced: 07ed11afb68d94ea
#regzbot summary: drm/qxl: deadlock after a revert to fix a regression

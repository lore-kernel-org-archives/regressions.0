Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E931A38DA
	for <regressions@lists.linux.dev>; Sun, 24 Mar 2024 13:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711285463; cv=none; b=f81KwBwVEPdltvmZpS7SYM60iupH1MA50kh91VhUYmBriC4rTKR5odpRIMqgivhc/oWSjJlYRVT4rCrT9YkubNgZdrgRpeWnwb9wDJzEBICgl5VYJLiX84BLzhGrQeWwZBbqRZQPvuIvAoBWVQjH5drackEnPCeYCSbmraMIFCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711285463; c=relaxed/simple;
	bh=qiYM8sv4AzxhGHDyAI3nznH8LocAPzezav/agriFyCA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=cFoHl7DbN5g2r4J5sFymgxnbmZT+sfBlx+BtaoDmVus8MXblcoFZQ1BICWd3IO/irFZuCOPxFkQvkT6O97n79Odu2hBLPxjga6RjhIGtx2qjH+ALCAai+0/8XMbbiQPQ6lNOt1Jn5cO/0nx9scgO9Be1apc252oST36+Nn3JHOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=ldsoIgCl; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="ldsoIgCl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=qiYM8sv4AzxhGHDyAI3nznH8LocAPzezav/agriFyCA=; t=1711285461;
	x=1711717461; b=ldsoIgClEvjoZmBb/3jHC+Bu2++FblYypvPOZcJDzDgEMtJZQr34bJY/58AgL
	UpJIz1pVXDgZUv7OZXlCnKGsZQvb9fuNgM1tjb0xgFwUWfg6GzmvMob9a6aCUBhHRSHDoajdNtNmu
	KIAke+y4US5kVE2hY6Zdd6AvWjx/hrGSw3/1gTtYEMyiYdxLgcBq8HkuZ3zh5M0APTFLeJi5moR3v
	9qpx9xzCOTUvTI8+036vgSy19a9t4p3kS5bp5bFlXDCdwW/VTzC0h+/dSfnrwVBPSFwuMH9XOQr7A
	OUJBqrFfdtI6/azz2OCIJMUrUZHNgIrKkAQurzbBIDcivmSyrQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1roNWH-00015b-1S; Sun, 24 Mar 2024 14:04:13 +0100
Message-ID: <20116054-638e-41b7-a892-64dc714e01f7@leemhuis.info>
Date: Sun, 24 Mar 2024 14:04:12 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
Content-Language: en-US, de-DE
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1711285461;94fd9467;
X-HE-SMSGID: 1roNWH-00015b-1S



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/d84baa5d-a092-3647-8062-ed7081d329d4@draconx.ca/
#regzbot introduced: 45a3a8ef81291b63a2b50a1a145857dd9fc05e89
#regzbot title: serial: core: Sun Ultra 60 hangs on boot

#regzbot report: https://lore.kernel.org/all/ZfvN5jDrftG-YRG4@titan/
#regzbot duplicate:
https://lore.kernel.org/all/tQ0L3-34g4t-mzfQIP6KDe5OYelGnEo6Udzq6Kb_nEcljppSQUXOktpE__nL-CdLOu9gW-4tIIbjtSbqrdCrjEkdhZLPiiHTqRcCB6WORuM=@thefossguy.com/
#regzbot monitor:
https://lore.kernel.org/all/20240324062816.145858-1-prathampatel@thefossguy.com/

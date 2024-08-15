Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99CA317BEC0
	for <regressions@lists.linux.dev>; Thu, 15 Aug 2024 14:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723732412; cv=none; b=Kga9sj/3b3Nhx9M8cnqfMA37rPWVYb+GJH+WcCwwj+yfL4toSNIAdnAm5o06AqcQLEQQSLs2xRNSAFFhmNnfG6TaZr3960MhT9+ItYMNK52b4hDML9jWIIzttcFGFWHxEpozcdMfqghs6BC+VONeBgIZ71cauyIX7DsR0luh2UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723732412; c=relaxed/simple;
	bh=Zd9fmeRD7glMHkPjVa07GCXZ04cMtPoGbNf8FrR90X0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=MM59X8oo0u0aQ5y4qfYbhXNEP6Jquq/AZYW6LyDzBVXX5S2JzOhAlA7YAQGAcn/4tf0Fr1YNVS4FzX4xHy3WTSfqjDp4NGI0c8GY7uGpB0vX7aJcAzTtLe6edHO6zGOqHf0i5GV5w9KfW/5lGYUapMrKZC7mog1WxHq0CKnTy0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=cLRrQ6yS; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="cLRrQ6yS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=Zd9fmeRD7glMHkPjVa07GCXZ04cMtPoGbNf8FrR90X0=; t=1723732410;
	x=1724164410; b=cLRrQ6ySVsYICMcwjD7hgOpLvXiR8vApzzBF13rFsap2uP0oQiaTVVRTLd00M
	t/zxa2RSDpvXdULAap5Ur62B3mSdtAH6yaqTLdY0PNlh0KLIQl6h8RDidQEtmBfGpzBhYzSpFOOj7
	MmXiMIvbbhMeROSF/9cbax71MjusfukFk87jjbKlgtBlHWQ3QmPw2ITNlZ/y3pXW15KiBtbmyk380
	5mtsTjon5DRN4xa/NUKVnbFt+czWdTYBxS3IWOVykT6R/d97+uo8j1H24leWSI2miUW6ppy1icpZG
	eqzGm17VaTZB4HEzwhzKxtKZQ0IXcPDs/7ixeEhPmh7xfVAUsQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sebXc-0005iO-Ja; Thu, 15 Aug 2024 16:33:28 +0200
Message-ID: <7e2ed0e4-5bdf-4db1-af94-85464bf0a44b@leemhuis.info>
Date: Thu, 15 Aug 2024 16:33:28 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1723732410;d03490f7;
X-HE-SMSGID: 1sebXc-0005iO-Ja

On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/8b20cc28-45a9-4643-8e87-ba164a540c0a@oracle.com/
#regzbot introduced: f9dac92ba9081
#regzbot summary: virtio_ring: crashes during large transfers
#regzbot fix: Revert "virtio_ring: enable premapped mode whatever
use_dma_api"

#regzbot report:
https://lore.kernel.org/all/20240813-pony-truck-3e7a83e9759e@spud/
#regzbot introduced: 56c1c1a09ab93c
#regzbot summary: riscv: boot failures

#regzbot report:
https://lore.kernel.org/all/60ac8988-ace4-4cf0-8c44-028ca741c0a1@kernel.org/
#regzbot introduced: v6.9..v6.10
#regzbot summary: IRQ storms from ACPI

#regzbot report:
https://lore.kernel.org/linux-riscv/CAJM55Z9hGKo4784N3s3DhWw=nMRKZKcmvZ58x7uVBghExhoc9A@mail.gmail.com/
#regzbot introduced: 8ec99b033147ef
#regzbot summary: irqchip/sifive-plic: Allwinner D1 SoC stopped booting
#regzbot monitor:
https://lore.kernel.org/all/20240814145642.344485-1-emil.renner.berthing@canonical.com/

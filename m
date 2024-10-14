Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B824A14BFA2
	for <regressions@lists.linux.dev>; Mon, 14 Oct 2024 07:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728891557; cv=none; b=ENnxPpqVXOCPJC6Z5Gn9u7NCf1WpSaV864dcrpU1l8Izn4Lwx1jCkp9pNYgROh337/ubb8uD7tU10PY98Zmx7qVfoZ7uk5ecjdlx6YQ79xkSF+R++sryGsOqdqEMrUMJOCqU5yDxOpv52afuEQTQLV8UF0sQRRneHXmTrJAJ87E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728891557; c=relaxed/simple;
	bh=FTf2hm5fl8T7PBkHSFLUPwAVTH8x0iAwh+Z5UqwgkS0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=ssfEs++nvFG77PuuTp9uaTlp53UuuZLAPSTEkMD2h0RmfagFo1+pIDwaTjYzlB6CbkJ49ATZ6u8rokUpkqFiNGxPU4hqvIMQgvk2kdztLjl8tGizeh0MSIy660Pkf86zvpfwQNr7fpRCSKB+ieGQ+JLhEzczJ8N6DRwMHdk5lro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=XfDyax8z; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="XfDyax8z"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=FTf2hm5fl8T7PBkHSFLUPwAVTH8x0iAwh+Z5UqwgkS0=; t=1728891555;
	x=1729323555; b=XfDyax8zYa+JAIG08h1ZyP/PRa/o3Odo/SWuobBK/3xUXzut7k+CaP0LgVC3h
	Z0bSf8VqLry9PQogUTNP5xVbe2QtHX3l6G8PS1uXVosPfot4QkvqBuUv+X9UvP4O+bSbekIxUt/S+
	r/YzijuU3SSgmCKNlB0LOPGGJBlPzfNQ/3FKpWwRnA9a3lE2sge49hU4mqiLQ4tTI/Ip/v1xijhBd
	p+wZEcVylh+CvNz4CumDaEWEunIl6Zea+gOK0vB51ssythJY16WsFbAQLoMlxPdA8JL4baN7tosAy
	ALa35IA8M8VHM8nh2j6siJT1ZY7B/GiaJ01dtCZT7H6J9uzKSw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1t0Ffd-0001Or-24; Mon, 14 Oct 2024 09:39:13 +0200
Message-ID: <3ec1ef6a-0882-4c8d-beea-0d919ba9d027@leemhuis.info>
Date: Mon, 14 Oct 2024 09:39:12 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1728891555;2768ade3;
X-HE-SMSGID: 1t0Ffd-0001Or-24



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219363
#regzbot introduced: 2031c469f8161abe74189cb74f50da224f340b7
#regzbot summary: iommu/vt-d: hang on boot on 3 machines
#regzbot monitor:
https://lore.kernel.org/linux-iommu/20241012030720.90218-1-baolu.lu@linux.intel.com/
#regzbot fix: iommu/vt-d: Fix incorrect pci_for_each_dma_alias() for
non-PCI devices

#regzbot report:
https://lore.kernel.org/all/20241009220118.70bfedd0@kf-ir16/
#regzbot introduced: a75e0684efe567
#regzbot summary: thunderbolt: USB-C DisplayPort display failing to stay
active

#regzbot report:
https://lore.kernel.org/all/bc8ba1b7-e4ad-40b5-b69d-9ea1e7a18a40@tk154.de/
#regzbot introduced: fb035aa9a3f8fd327ab83b15a94929d2b90459
#regzbot summary: net/mlx5: missing sysfs hwmon entry for ConnectX-4 cards

#regzbot report:
https://lore.kernel.org/all/AM9P192MB1316ABE1A8E1D41C4243F596D7792@AM9P192MB1316.EURP192.PROD.OUTLOOK.COM/
#regzbot introduced: 9117fc44fd3a9538261e530ba5a022dfc9519620
#regzbot summary: drivers: clk: zynqmp: scaling frequency not properly set

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219363
#regzbot dup: https://bugzilla.kernel.org/show_bug.cgi?id=219349

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219349
#regzbot fix: iommu/vt-d: Fix incorrect pci_for_each_dma_alias() for
non-PCI devices





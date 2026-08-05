Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370F246C848
	for <regressions@lists.linux.dev>; Wed,  5 Aug 2026 12:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785931433; cv=none; b=Bvz4RAB66lXF3cNLhV6EvlXdeQ2BAqXQeFYOGrQzBcWaBtvDz/fx5engl0ucwJXYssJKisd29ne6AmmI0gyFcz6M/2N1LO9l7I5mIj4epGX8fJ4jOggLS6xUWpAXwdlC/NrCOyhp6K/MQMqXDwO5Qst23UcfIS/t+iFQ8xvt82E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785931433; c=relaxed/simple;
	bh=iwltHe/TAqRvEnqEYoYJHLVKyPesrgrAtj7BUnMEfls=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=X31Xc94jEKXAdeDhfqTdVJRLYpGm8QOoC0zu5Q747LAQS6XAsT0521q/wan6qWO7hUJ1Iys8ZWrUfr055/SDCHGusMkMmZm4cK42gxl2PuT4iwVUWUF4uNR2QZnD0je9ePD7U0EIQTudTWXptENBjaLoxMrVJCHWMVTv/SvPfck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=axH0s7nP; arc=none smtp.client-ip=188.68.63.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="axH0s7nP"
Received: from mors-relay-2501.netcup.net (localhost [127.0.0.1])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4hFTYN0fvTz64YR
	for <regressions@lists.linux.dev>; Wed,  5 Aug 2026 14:02:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1785931336;
	bh=iwltHe/TAqRvEnqEYoYJHLVKyPesrgrAtj7BUnMEfls=;
	h=Date:From:Subject:To:References:In-Reply-To:From;
	b=axH0s7nPiUhVfwmFEP8D21aewpuSgMnHaeQdWz5VwaPFjc+PetLZGdLXKKuqkljn8
	 T9twu7MZ5yX8zhQsPYfYfMLdxr2zYDZn+l9syydZZLa0kqR2WBWJ+RVxPfGF3R3dyS
	 k8ceomTHwA1YdB0SFuMs7gM2d0/6MM7xw22IIcYFGGp5k97HobLa2WV4f5hqWBjuQ1
	 HXpmJdIpypNM7yzttaBs3vpElCx74z+erhdr9CKZPi5T+qs+CmjFA45frBY0+1xuVq
	 JLdFj0z7FC+3yauA284Jel7cB1E9d5rktNpubMjpyzqpqSovVuNlL6c7qAbSPZ69zs
	 qWw3DNVly/sJg==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2501.netcup.net (Postfix) with ESMTPS id 4hFTYM74RDz4xW6
	for <regressions@lists.linux.dev>; Wed,  5 Aug 2026 14:02:15 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.898
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4hFTYM0vhsz8td9
	for <regressions@lists.linux.dev>; Wed,  5 Aug 2026 14:02:15 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 8546E5F9DD
	for <regressions@lists.linux.dev>; Wed,  5 Aug 2026 14:02:14 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <8e870293-813a-4fa4-855e-6206f31ccd2b@leemhuis.info>
Date: Wed, 5 Aug 2026 14:02:13 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178593133473.48761.326106372774468084@mxe9fb.netcup.net>
X-NC-CID: Zt3h5f8WEYAn/ssQdMI5A704uCoC7Ms1MC51yrixwVBJgSrKOh8=



On 3/9/24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/lkml/20260724151419.26014-1-spasswolf@web.de/
#regzbot fix: Revert "wifi: mt76: Disable napi when removing device"

#regzbot report:
https://lore.kernel.org/netdev/20260707073826.919541-1-ericwouds@gmail.com/
#regzbot resolve: inconclusive: might now qualify as regression and
likely not worth tracking

#regzbot report:
https://lore.kernel.org/dri-devel/0102019fba65882f-45046e0b-9860-445f-a179-c6a1d2acfd1c-000000@eu-west-1.amazonses.com/
#regzbot monitor:
https://lore.kernel.org/all/0102019fcb5d411c-e0a555b7-46da-43a1-bd9d-6cb120f58a7f-000000@eu-west-1.amazonses.com/
#regzbot introduced: cc6ed470caa2

#regzbot report:
https://lore.kernel.org/kernelci/178467114526.1316.13205923514031471873@kernelci.org/
#regzbot introduced: b9ad0b9891dd
#regzbot resolve: patch not in -next anymore, updated one with a fix is
being prepared

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/work_items/5529
#regzbot dup:
https://lore.kernel.org/alsa-devel/MWHPR04MB1029801AFD77D790D33C53E1592CF2@MWHPR04MB10298.namprd04.prod.outlook.com/
#regzbot introduced: df4148a5a3cf

#regzbot report:
https://lore.kernel.org/all/CADyY0-5M0+N1u45RVZN3Tf52iKaXcvKeUaqgdw-wP1B_4zuA0w@mail.gmail.com/
#regzbot introduced: 105c4256
#regzbot title: ata: ahci: JMicron JMB58x AHCI 32-bit DMA fallback
triggers EEH freeze

#regzbot report:
https://lore.kernel.org/all/CAGQo=TJXef-QzbkFEpTcJ138j0k6WYnV4=tNY8Q7s3U7DUOY+Q@mail.gmail.com/
#regzbot introduced: 8f5b7e2bec1c
#regzbot title: usb: hub: total system freeze after running adb

#regzbot report:
https://lore.kernel.org/all/CAMgFczCi2Z011dNf84Amc0Q-qnTt0+VUjWY+Y7zPyXdaH35Jvw@mail.gmail.com/
#regzbot introduced: 231e9d447ea9
#regzbot title: selinux: ~90% throughput drop in System V IPC (msg)
#regzbot fix: selinux: check level category sets once at load time
#regzbot monitor:
https://lore.kernel.org/selinux/20260804135700.3713-1-stephen.smalley.work@gmail.com/

#regzbot report:
https://lore.kernel.org/all/20260804142800.4326-1-khomyakovilya@gmail.com/
#regzbot introduced: c273c14b0294
#regzbot title: scsi: mpi3mr: link rate set incorrectly
#regzbot fix: scsi: mpi3mr: use DevicePage0 link rate only for
direct-attached targets

#regzbot report:
https://lore.kernel.org/all/20260804140403.16337-1-kfastov@gmail.com/
#regzbot introduced: 28e3918179aa75
#regzbot title: drm/gem-shmem: muvm GPU acceleration dies with KVM
#regzbot fix: drm/shmem_helper: use vmf_insert_pfn_mkwrite()

#regzbot report:
https://lore.kernel.org/all/20260804185118.19705-1-lucid_duck@justthetip.ca/
#regzbot introduced: e88098133ed4
#regzbot title: wifi: mt76: mt7921: sessions pile up due to
self-deadlocks and the machine has to be reset
#regzbot fix: wifi: mt76: mt7921: refactor regd update to fix recursive
mutex deadlock


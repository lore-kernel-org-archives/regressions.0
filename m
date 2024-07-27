Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219DD639
	for <regressions@lists.linux.dev>; Sat, 27 Jul 2024 06:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722063069; cv=none; b=QHIoA3z0qlcWUvMWEXOY/fdkbKJhlFJ3+Fg38kSzcaPjccf1cdDXTX0Zik2nAtgT/Tq6d31y+yAzckdoclUywgsnCalHeAOBQQIq8xwhEj2Hoon4/TLbqwDQFD2saiGHleEc2eWOk/m2QBu8GUBOkZekn8b+00xOYeElqm5L9yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722063069; c=relaxed/simple;
	bh=IRIUWZ+87lsr/RuVepkcsonluY/4DhVN3UzGcBtm4ow=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=iZdR76owJy9anQkTHgefZEf3liIUfVl3Wq2+W/yb3Iuy/lNzxb4hC20t56sF2BDdkW61teoaFh7NILr5RQ8XzSSKQNRD+An8l0dmBa3ZdNC/PXz7XM7EsfdQh7JvnXfoeoMiMTRRJPDHh7w9rt8/fhmMo6ncUcMxYfBnUJlbGhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=bEcEsNmq; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="bEcEsNmq"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D96E540E00F4;
	Sat, 27 Jul 2024 06:41:12 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id RRngMo_cAIaS; Sat, 27 Jul 2024 06:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1722062467; bh=eKnCDwy4gFU7hwfXFHZUR28gO5b21dh4T4LERdNfoMA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=bEcEsNmqT1zJZkw80zKv2d7+tgOXwIrZoS80TQ0VJ8sIr03cThC0w+cRKj6NMtS9p
	 0inbjTZXYYmp9aPeQuvxztGv+6LGyihppGNwESrsull47A1lIdY3CoSYVkFV5qu8mK
	 hDzz6sEwcifa2hzCgGLq7V9Q5+o5NtF9e7feVf6V2ctwM0Y+ZMQ3qAaP9+tbJ9SrQr
	 7KKBSwhjCwGnPZB/F6vx8yo3O2BwDG/AvIPPJEUYEjzkAxs+vJeelg2OYK+GvCWlP0
	 LKlrpmtgIgg7OjuOcZMTCKk8Sn8AUEAVbafm0lG5x+8at4whdtz55uUjU9z9pKAqLF
	 tzcrUF8zAzNU8RocBVK5DLr9HjQBI+bPPRRCPKleheXXmsbdiGSNufJtQbyeSWQDCJ
	 ssFWElKHs/a8ngRS/O+r3sMT8C67C/GoPl93asAQ5Y37uQ5RbUqNc4b/ScxHTY/6p+
	 y+dvADEhhLpoorcIFm3mXrrLfn/nNlDnVxQZgiyMWImdbm7CCGYqy3KHOhu/3QsFOa
	 yAq8CY5dZN7KXO955rZJPdWQlqZTr8rTu5iW7QAeQxcj601QDbw83PIZ9v2XJMLjS1
	 Ml0Loz1J2jPPZ+H1HPaVMbMrk5Gx+lRUfdaIxAVkGjY4XzQWucmpMzJ3+05c9t7CCJ
	 /qQedKF7aru3DeT1RVxHBUfI=
Received: from [IPv6:::1] (p200300ea973a347b59d3ab9a1714fbb6.dip0.t-ipconnect.de [IPv6:2003:ea:973a:347b:59d3:ab9a:1714:fbb6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4FFCC40E0268;
	Sat, 27 Jul 2024 06:41:01 +0000 (UTC)
Date: Sat, 27 Jul 2024 08:40:58 +0200
From: Borislav Petkov <bp@alien8.de>
To: Rob <rob@durendal.co.uk>, Thomas Gleixner <tglx@linutronix.de>
CC: Christian Heusel <christian@heusel.eu>, regressions@lists.linux.dev,
 x86@kernel.org, Joerg Roedel <joro@8bytes.org>
Subject: Re: [REGRESSION][BISECTED] Early boot hangs since f0551af02130
User-Agent: K-9 Mail for Android
In-Reply-To: <ZqQl79UhhSQ5IobX@vendhya2>
References: <361b2ba5-7fc3-4e9a-af63-adfd4bc20304@heusel.eu> <20240723120246.GBZp-b5nHHT0BWmKMZ@fat_crate.local> <5e08cab0-c6b5-4169-8d42-ddb0ffb4a6c9@heusel.eu> <20240725105029.GAZqIt9aLsIaG7JqN5@fat_crate.local> <12df8b45-6100-4c8b-b82a-a6a75bed2e05@heusel.eu> <87a5i4whoz.ffs@tglx> <ZqQSmw51ihns03ob@vendhya2> <ZqQl79UhhSQ5IobX@vendhya2>
Message-ID: <EB2AED9A-793D-4A82-A01D-5ECBC57D2E9A@alien8.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On July 27, 2024 12:40:47 AM GMT+02:00, Rob <rob@durendal=2Eco=2Euk> wrote:
>* Rob (rob@durendal=2Eco=2Euk) wrote:
>>> So in theory the same problem should happen with a pre 6=2E9 kernel an=
d 'nr_cpus=3D4' on the kernel command line=2E Can you please verify?
>>=20
>> Confirmed, 6=2E6=2E40-2-lts with 'nr_cpus=3D4' hangs
>>=20
>>> Another data point to be evaluated is whether booting the unmodified 6=
=2E10+ kernel with 'nointremap' instead of 'iommu=3Doff' on the command lin=
e makes the machine boot as well=2E
>>=20
>> linux-mainline 6=2E10-1=2E1 with 'nointremap' boots
>I have also tested on the non-patched mainline version 6=2E10 with 'noint=
remap' and it also boots


Are you running the latest BIOS on that machine?  If not, update it pls=2E

--=20
Sent from a small device: formatting sucks and brevity is inevitable=2E 

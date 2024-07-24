Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624891BF2B
	for <regressions@lists.linux.dev>; Wed, 24 Jul 2024 09:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721813593; cv=none; b=VWxMudxYIePWLOs7J4dheC0BsiNUJWVr7DLgMH3h/Rcz0BjLzfVrEcvW9lMyH4ZiXydVz+B5wupjBxFIzQt8625Tu+k7ZGtk1UtjhG08RS3/meCYBMo80zW8V3NvfhH3aA/BZwZgV7XA52ocVSQQwkNYe2uyJhKMgwps5qsljsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721813593; c=relaxed/simple;
	bh=AU9FHIyKwh22UtWH8C4pSVAjybvHTu8SscNEP2qvYT8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=r7HdrvZJ27/EytDF1MWpTurFwO8xGZ1STsJOrB9DCwTRBZZiOkrO7eUMmdFWGEfwlkN1saR6Bkq5Wuy6gh8Hd++9GxCEQ2VMEV2GebgTfs73lKXHiwA7i5mlRijWwe+YylLzOv3vzVufsjRquroAgBmFhUat457xN9FrT6mfZ74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=uAFm2/mk; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="uAFm2/mk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:Subject:From:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=hKWOiUpQVpINz9xAf5KATe6ICkWI3O1bGT22uSRGDCk=; t=1721813591;
	x=1722245591; b=uAFm2/mkVxdqMqQAFk8JEHr85k4O1LyEAIXKufaHtcakUtF0vsa5Cz41w84pv
	PMYAyjpEdkwtiwxL+gcHYjzAsuujQeufRYO85gMtquUmVIxsGE5gqbbezSrmlJZADGNsba+70wMKf
	m2cEUlVP6na9yfiBkgf7/EaGVSEKtiyWMhmmVwIvomSsNq4N5p8OGvaGxB7q03zQKDTjJHjx8epx/
	34xhcOUlnWWK/iyMFRFb9xYgAIfeouFXskun5ZGxBnZW91y74mdWXWQWlsF4GyZT3Lsn9e3oNfXpo
	QxFpEebk9KdIay9I2Em8I5h81ji3Gi+QYl/X/Le6RW2quTOBvA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sWYMv-0005sR-5j; Wed, 24 Jul 2024 11:33:09 +0200
Message-ID: <9fa3934b-d45d-4c86-9bb9-06ca9b20f835@leemhuis.info>
Date: Wed, 24 Jul 2024 11:33:08 +0200
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
Content-Language: en-US, de-DE
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1721813591;a23a8a98;
X-HE-SMSGID: 1sWYMv-0005sR-5j

On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/2a2cac3c-f9cd-4b20-ae53-9e6963c7889f@molgen.mpg.de/
#regzbot duplicate:
https://lore.kernel.org/all/af462e20-d158-4c5c-8dae-ce48f4192087@molgen.mpg.de/
#regzbot duplicate: https://bugzilla.kernel.org/show_bug.cgi?id=219054

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219084
#regzbot introduced: 1541d63c5fe2cebce85b2af84a2850a302ffda9c
#regzbot summary: net: wifi: mt76: mt7921: null pointer access in
mt792x_mac_link_bss_remove
#regzbot duplicate:
https://lore.kernel.org/all/20240711175156.4465-1-spasswolf@web.de/
#regzbot duplicate:
https://lore.kernel.org/all/CAHbf0-HOS-jdRGvJOBmEgaaox3PDbDSTgnnZkZF9pz37Bmh2iw@mail.gmail.com/
#regzbot fix: wifi: mt76: mt7921: fix null pointer access in
mt792x_mac_link_bss_remove
#regzbot monitor:
https://lore.kernel.org/all/20240718234633.12737-1-sean.wang@kernel.org/

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219061
#regzbot introduced: f40f939917b2b4cbf18450096c0ce1c58ed59fae
#regzbot summary: platform/x86: hp-bioscfg(?): memory leak and crash on
32 bit machines
#regzbot duplicate:
https://lore.kernel.org/all/3bd6b12c-533c-4b6d-bc91-696db8837b3e@oracle.com/

#regzbot report:
https://lore.kernel.org/all/PmbX6S6Osc50o8nCGiyOtYWlewq2QKXVo69V_1hkK0WeFxprG387m1JY619uKGK0Kynb7Jdb7plnUWfzKgV0UP9L7RIA4E2KnupKhIr5aYQ%3D@urja.dev/
#regzbot introduced: 7af5b901e84743
#regzbot summary: arm: userspace programs segfaulting when CONFIG_ARM_PAN=y

#regzbot report:
https://lore.kernel.org/all/20240722141440.7210-1-blazej.kucman@intel.com/
#regzbot introduced: abaaac4845a0
#regzbot summary: PCI: pciehp_hpc: loss bits for power indicator status
interface

#regzbot report:
https://lore.kernel.org/all/1474761635.17820466.1721651484902.JavaMail.root@zimbra60-e10.priv.proxad.net/
#regzbot introduced: 9f625f5e6cf9
#regzbot summary: ASoC: sti:  missing probe entry for player and reader

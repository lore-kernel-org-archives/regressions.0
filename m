Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC3785959
	for <regressions@lists.linux.dev>; Fri, 24 May 2024 13:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716556587; cv=none; b=n7LfuOGHJxvUd/VC3UL9S9ox2h/A5SMdTKXbyr2UisDx9Vn25UMX5NHuLC7B0mGlVwohlxuPnz78avHMXopsLuP0asvUpi/ElC3nS5h8IcfN4Rkj9Aq+k3B6yPih05P3jH/v6OHZd3Dm5mVXjagM7wbOFXAYb6NAjXLRE+/E3bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716556587; c=relaxed/simple;
	bh=zjsZfNDN+Bbvk26xKubGbWGNj1ogVMwo42+99s7xhng=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=i/yxyfQkdOlhQo+fFUilDYWX9o06M6mAAsNyGBdsH4qdwfFtNDsi4dxpl1yExew3mhD460g68ILNHnP8EHvLkSXjItEKDZAM70P+8Ilc8q6qs09pl9gDC0KuxvhxKa/tQmQuYkEfBhTmfSCB6RVqlJvLlmZeiziJl60COxAS4wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=QhSNjr+n; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="QhSNjr+n"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=zjsZfNDN+Bbvk26xKubGbWGNj1ogVMwo42+99s7xhng=; t=1716556584;
	x=1716988584; b=QhSNjr+n+WT4pzzLrxiYdPE2kx2sgZaAZVRorB3Oab+VGQ54FRtbXS5TXe0wI
	1UjCpUT4AnAsDFGnDjq2h5A2H0gZxP/qRJ+owZgxlqcDYdqnqpdNStOGqnca1ja57Tv1/Ya5bMpOR
	ykFtH5mU+rNYePOB8pIWNSqGhUWWZvWe6y7SRx0Zfkqkb8AJbt03w+Wl22wAQ7ZhHU69pKfehEkLt
	Imt3KvI32QOb+b/iVhmEoEyD0MQww+5mTx5S3rQLzZNyjB0kfK+EcxpAutoxmhS2eXfDY6Vl5NVKz
	y551d7ewcULHJLiAyy9vBPv7n2NgPz0LKO8QkC+Bh61Z1RXz3g==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sAUmU-0001Wx-Mv; Fri, 24 May 2024 15:16:22 +0200
Message-ID: <e3b3b766-fab6-483d-8493-adc206d4c8c9@leemhuis.info>
Date: Fri, 24 May 2024 15:16:22 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1716556584;670e2fde;
X-HE-SMSGID: 1sAUmU-0001Wx-Mv



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/20240516204847.171029-1-linux@fw-web.de/
#regzbot introduced: 868ff5f4944a
#regzbot summary: net: dsa: mt7530-mdio: mt7531 switch on Bananapi-R64
not detected

#regzbot report:
https://lore.kernel.org/all/CABXGCsMB9A8-X+Np_Q+fWLURYL_0t3Y-MdoNabDM-Lzk58-DGA@mail.gmail.com/
#regzbot introduced: 8430557fc584
#regzbot summary: mm: cause warning at mm/page_table_check.c:198
__page_table_check_ptes_set+0x306
#regzbot fix: mm/debug_vm_pgtable: Drop RANDOM_ORVALUE trick
#regzbot monitor:
https://lore.kernel.org/all/20240523132139.289719-1-peterx@redhat.com/

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=218861
#regzbot introduced: v6.9..0450d2083be6bdcd18c9535ac5
#regzbot summary: mm: WARNING: CPU: 13 PID: 7032 at lib/xarray.c:1024
xas_split_alloc+0xbd/0x110

#regzbot report:
https://lore.kernel.org/all/6584ea16-06f7-4a95-bd83-870f30fc4b5d@roeck-us.net/
#regzbot introduced: a61ddb4393ad
#regzbot summary: drm/nouveau/nvif: build error on parisc:allmodconfig
with gcc 12.x or later
#regzbot fix: drm/nouveau/nvif: Avoid build error due to potential
integer overflows
#regzbot monitor:
https://lore.kernel.org/all/20240518182923.1217111-1-linux@roeck-us.net/

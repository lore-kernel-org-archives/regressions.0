Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA2871BC4E
	for <regressions@lists.linux.dev>; Thu,  4 Jul 2024 10:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720088914; cv=none; b=GPSzKaKv+G9f10Cp01K+D0u+V/gydpCM4PnyAVmxRkgc5UWdm0wnx7T2D+JR3Q8zHwpbDz8sZSmXxcPhGl4u0K1+06NNdOrAJQGmEekBG3Sj3AABBhGuE0VI74MX4M2w2SBuFx+2O97CeGIz7Kv6ARxzO3f0TEXpjazqByPDUtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720088914; c=relaxed/simple;
	bh=YWy3d3DnvJyT0JoKU9GO44PEEtPz9f+YneBPzWEB9Qg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=cCDgvNTP2LwbmzcLeuaLBoVVmjhjhWNzWK5RedbipTNCmxtSiTPENgUiQVzKVK90PETCEit9HG/nJCA+0YpyVYH7/LEc5ncC+v05Htbczw0Q//uTZ84T7UXjN1zyCchZKnnYBn2oRSZ9g/JTOqUmCmFJGjLOW8M3IMQS6qd7fD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=oUhJwOE9; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="oUhJwOE9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=YWy3d3DnvJyT0JoKU9GO44PEEtPz9f+YneBPzWEB9Qg=; t=1720088911;
	x=1720520911; b=oUhJwOE97yAsEgBoG7ffGLR1l4tIYdaTklEeFZ38zjNxmB4fJ3MZJyIQqhPJb
	WZnXD7+2ePoWbWzk95xWbnKhsPL0/jHBiRvcbuToevLeqNbxJ8WKwIc85SRaa5brwiK5bLEXMK0FQ
	f8vXRVqiyzYClQLxJxx80l8OiCR0dmT4FEdZlNmcWxEHmLkirbYYydg2cunCpfijB/I9sJ0nbNY2h
	f6OMPAGBYeJUb9Ye5LebTailNImNcWcaCzZ5o2+m91tSJok7CThhG7ukc68AZCUOiRsh6xcahXiIt
	498vInokmolgQTMNOu5pWf59ul6M4zjLRfEvYZnvwa67er+FZA==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sPJ1F-0006ZD-Ml; Thu, 04 Jul 2024 11:44:49 +0200
Message-ID: <6302c372-3bb9-4b9d-a5c3-22f432f96329@leemhuis.info>
Date: Thu, 4 Jul 2024 11:44:49 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1720088911;8481bbac;
X-HE-SMSGID: 1sPJ1F-0006ZD-Ml



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/2ed4c630-204a-4f80-a37f-f2ca838eb455@linaro.org/
#regzbot introduced: 5725f40698b9ba
#regzbot summary: thermal: core: "thermal thermal_zoneXX: failed to read
out thermal zone" output in a loop

#regzbot report:
https://lore.kernel.org/all/3ab66fab-c3f2-4bed-a04d-a10c57dcdd9b@xenosoft.de/
#regzbot introduced: 935df1bd40d43c
#regzbot summary: of/irq: identification of ATA drives with P.A.
Semi Nemo boards broke

#regzbot report: https://lore.kernel.org/all/ZoM6CUhbWuAFuHjP@krava/
#regzbot introduced: v6.9..v6.10-rc6
#regzbot summary: bpf: build error with CONFIG_WERROR and CONFIG_BPF
#regzbot fix: bpf: fix order of args in call to bpf_map_kvcalloc
#regzbot relate:
https://lore.kernel.org/bpf/363ad8d1-a2d2-4fca-b66a-3d838eb5def9@intel.com/

#regzbot report:
https://lore.kernel.org/regressions/DS7PR12MB57665F9F4BDF0598D7CC53DD94FF2@DS7PR12MB5766.namprd12.prod.outlook.com/
#regzbot fix: drm/qxl: Pin buffer objects for internal mappings
#regzbot relate:
https://lore.kernel.org/dri-devel/20240702142034.32615-1-tzimmermann@suse.de/

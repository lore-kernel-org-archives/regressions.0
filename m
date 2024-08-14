Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEBE320DF4
	for <regressions@lists.linux.dev>; Wed, 14 Aug 2024 08:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723623751; cv=none; b=VUpTy+9socYVsh+Rc/uknFoiO8IugBGQgRlDMZjpmUVpDfZ+Oovj86npDjIj2iQvsVonOunKre23OhyqLVRc15nSekASQrZdOXeb80WZz7fVY5VF8HCfPPjrz8Ph/H7qMUVbKSTwe/PhEUvk00Qy326xgZubpr3wEBuReyWMxqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723623751; c=relaxed/simple;
	bh=tjZzVQlCkocLYuUE/5/U34JYpsWrhIGFHf68xzjh6ps=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=rI+ye4EFjJ3zgipMfti06w1DTrxN2qTE8M+FBdF84NvaUUPInvdpVRwr27tutZFAHlv2k3xD2y50aFGhpSJXznMjuM9LdCLFBM2/CgnmJIKPU6xeM7fOcvYRxHoh9nHwhIOXfjMeKW0eYE5ONhlBg2jeOwDVBn47hnxugjbe21w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=dsKL4KGb; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="dsKL4KGb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=tjZzVQlCkocLYuUE/5/U34JYpsWrhIGFHf68xzjh6ps=; t=1723623749;
	x=1724055749; b=dsKL4KGbgB1xjG+qg++xDeYXpqELryuV/3ns6H17SBrgAAp/zvmLdGbUfvcNw
	egI47uvbSCnVPQpuyEGF928JU46555WlatqWSnyXObEeqdYOsiNxWOk1LGwJHqBH+2jHGE5D4pU28
	oS5k4s9jZVvB3XEQ9CkpinekGFqzZ0/5h++q2ahcEAA3ZGlEH69NxPV7ODmi/6BZ+aZAhKfe4QE/y
	HOEVHDD88qoDR9Pl+r+0T793ebetMQR/svrTDLrfi17bUdQ/mYVor8aOHH9Ngjsf4yn6zx+efMENh
	l5La2ohAWRatQwaYth6CAQm47QyOCTBJV9NdZkyeW7LCVmoWJQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1se9Gw-0002W5-Ca; Wed, 14 Aug 2024 10:22:22 +0200
Message-ID: <38ec5db8-66ad-49f1-9fed-5410b360b207@leemhuis.info>
Date: Wed, 14 Aug 2024 10:22:22 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1723623749;7c8e162f;
X-HE-SMSGID: 1se9Gw-0002W5-Ca



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219143
#regzbot introduced: 6f31d6b643a32c
#regzbot summary: net: igc: does not function anymore after second
resume from standby

#regzbot report:
https://lore.kernel.org/all/71864473-f0f7-41c3-95f2-c78f6edcfab9@gmail.com/
#regzbot introduced: 14dd46cf31f4aaffcf26b00de9af39d01ec8d547
#regzbot summary: xfs: mount timeouts
#regzbot fix: xfs: xfs_finobt_count_blocks() walks the wrong btree

#regzbot report:
https://lore.kernel.org/all/20240811041703.2775153-1-yuzhao@google.com/
#regzbot introduced: bd225530a4c7
#regzbot summary: mm: performance decrease on demoting hugeTLB folios
#regzbot fix: mm/hugetlb_vmemmap: batch HVO work when demoting

#regzbot report: https://lore.kernel.org/lkml/ZpFfocvyF3KHaSzF@LQ3V64L9R2/
#regzbot introduced: f11f10bfa1ca
#regzbot summary: perf/bpf: problem when tracing due to
#regzbot fix: perf/bpf: Don't call bpf_overflow_handler() for tracing events
#regzbot monitor:
https://lore.kernel.org/all/20240813151727.28797-1-jdamato@fastly.com/

#regzbot report:
https://lore.kernel.org/all/872a3e83-9bc5-47de-8514-48abe8ff03c5@typeblog.net/
#regzbot introduced: fa57924c76d995e
#regzbot summary: drm/amdgpu: DSC enabled unnecessarily over MST hubs

#regzbot report:
https://lore.kernel.org/all/597dd1bb-43ee-4531-8869-c46b38df56bd@westnet.com.au/
#regzbot introduced: d86f2de026c57e
#regzbot summary: folio/romfs: m68k/ColdFire broke

#regzbot report:
https://lore.kernel.org/all/5b51975f-6d0b-413c-8b38-39a6a45e8821@westnet.com.au/
#regzbot introduced: 10e29251be0e9f
#regzbot summary: binfmt_elf_fdpic: ARM nommu broke

#regzbot report:
https://lore.kernel.org/all/cabe5701-6e25-4a15-b711-924034044331@samsung.com/
#regzbot introduced: c8bd1f7f3e61
#regzbot summary: virtio_net: driver occasionally crashes

#regzbot report:
https://lore.kernel.org/all/62d248bb-e97a-25d2-bcf2-9160c518cae5@kolla.no/
#regzbot introduced: 09fe2bfa6b83f865126ce3964744863f69a4a030
#regzbot summary: ata: pata_macio: oops/panics on G4 macmini

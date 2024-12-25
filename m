Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60941610B
	for <regressions@lists.linux.dev>; Wed, 25 Dec 2024 01:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735088843; cv=none; b=DoU6CRDKCBLBD6FIZzLjX5wIFLmGcJtPwBj4iNuFx8xDU5aEJolCbZ5BM9SgmcrHIisg1TBCfMqp2IEV18U54PECM5g0u3KKHRdETMb5Yffn4rtdSMzq8OI+O2yLEpiUDrZokweDR2YdaNVVfI61xIXAAh6bgqDvoW48KJ6mO40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735088843; c=relaxed/simple;
	bh=UZeyH2CflEij7BeZ8//sdEYnFDXSNuA19VBjLnAqFNk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rhKhT6jEaiAlPFoERtK1OCD/doEqLH8U8e6i+X1QZZ0ea33wttSuJRLfbHIGkzpMUwZn+KruBICsvLr5CgVl62WpTMKx6jIxvtlMdRpnut1sLVGsV1x6x5KQKlUopI4SpZm+vzpSxlZhBX1CZf4V/mwdJgTl5SG3eAz/pu9pIlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 92da56c2c25c11efa216b1d71e6e1362-20241225
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:ccaad94a-da0e-41d5-9812-07341dc6353c,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-9
X-CID-INFO: VERSION:1.1.41,REQID:ccaad94a-da0e-41d5-9812-07341dc6353c,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:-9
X-CID-META: VersionHash:6dc6a47,CLOUDID:75cc75753c710cba8cb1087f372fe9bc,BulkI
	D:2412230845101WTR1OVF,BulkQuantity:7,Recheck:0,SF:17|19|24|38|43|64|66|74
	|78|80|81|82|83|102|841,TC:nil,Content:0,EDM:-3,IP:1,URL:0,File:nil,RT:nil
	,Bulk:40,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BR
	R:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI,
	TF_CID_SPAM_IBB
X-UUID: 92da56c2c25c11efa216b1d71e6e1362-20241225
X-User: zhaomengmeng@kylinos.cn
Received: from [192.168.109.86] [(123.150.8.42)] by mailgw.kylinos.cn
	(envelope-from <zhaomengmeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 2079213226; Wed, 25 Dec 2024 09:07:12 +0800
Message-ID: <612669d7-73f2-429a-89b7-639918fc625a@kylinos.cn>
Date: Wed, 25 Dec 2024 09:07:09 +0800
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [regression] linux: Loop-mounted UDF ISOs no longer readable
To: Daniel Reichelt <debian@nachtgeist.net>, Jan Kara <jack@suse.cz>,
 sashal@kernel.org, Salvatore Bonaccorso <carnil@debian.org>
Cc: linux-kernel@vger.kernel.org, 1089698@bugs.debian.org,
 regressions@lists.linux.dev
References: <Z2XKY0f6on1UbwWb@eldamar.lan>
 <b681e1ea-bb7d-4d8f-b62c-cae1e4116d21@kylinos.cn>
 <6c8e6c68-b0a1-47b4-82a4-c68490fdc876@kylinos.cn>
 <0675b760-c381-4f5e-b587-083b8ace99c4@nachtgeist.net>
 <ebc3f255-2759-42b4-be60-1d69fa5132ae@nachtgeist.net>
From: Zhao Mengmeng <zhaomengmeng@kylinos.cn>
In-Reply-To: <ebc3f255-2759-42b4-be60-1d69fa5132ae@nachtgeist.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024/12/25 05:21, Daniel Reichelt wrote:
> Hello again,
> 
> On 24.12.24 15:21, Daniel Reichelt wrote:
>> I just tested v6.1.120 +1ea1cd11c72d1405a6b98440a9d5ea82dfa07166 and I can confirm that at least `ls $mntpt/sources` gives viable output. However, actually running windows setup off a samba share from such a $mntpt gives data errors at the very end of windows setup. I guess something else is missing...
> 
> I just re-ran that test on the actual server network instead of my laptop and there everything worked fine. I found some SIGSEGVs in the Samba log on my laptop from the earlier test so the "data errors" were a completely different issue caused by smbd.
> 
> So all in all, I'd say the UDF issue is fixed by the cherry-pick. Sorry for the noise.
> 
> Cheers
> Daniel

That's great, thanks.

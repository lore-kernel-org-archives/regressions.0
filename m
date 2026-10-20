Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.218.36.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792496857;
	b=ZvU3iad5tisul4xZOxNSehIkD5PwWDTqFBQQYKle6Mxm+D3tHUs6mHLDxfx0GPvdReoh
	 2jdbEEWDLnTxCaTwJSoomrsI2fbuJG1CyusK+RnK/YLDIeRFTikL62Ewh0x2TkQMMQoDh
	 pEnwhvyRTiUf3Bmvi9GZBE7/tzcFUq+XFB6Tdp/stFbdmHLLafWqzX1TV2cHpl0DJEBha
	 T/dnfUloxOrD6hAYoHiKBashxr8F/kvwvIYgpjlzUTss9VWKeGqinwMMSMmZ4vyd5Vz15
	 3wGWdL48O/TM3ggQe3n2IGnBGOjmt9a+Ar49udoOY39xgT96vaKZsp1n5KYuO81ExTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792496857;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=YRCCxKdsWDvyE3Czn1UTUZcseJVntJSnqQxo/IZpG1A=;
	b=IAN2W8ASROIxqTjeZrL4h9nyF8CV+30WYUe+O5prs6yo4hGwH1SxpztEXxuxm65oIFdF
	 mYdNKMUxVf5ptJbi0z0CyHH3TXaFmXKYFIBoPqf1/dM6vqaA/iwZCxNUhyTl/SOpd77HA
	 z2S/wrARYYdwueeXuXRzetL9KU/ici7f+G7+Mwfy4r764aMCffgGpzISsY2CrjBguYwck
	 B6W0ZbsJrKOSoRmVluUGt9vyktatCbW9DdHb2y3jyenhmwZMoZcy3V5L7+ey11mnbvWyj
	 L9MrcyDESnzldRXETQ1qZb0ijawwiNkp2cf/KS+GgFyL02Td7WiGYpdP9/XIC+TuVrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=maich.gr;
	spf=pass smtp.mailfrom=maich.gr;
	dkim=pass header.d=maich.gr header.i=@maich.gr header.a=rsa-sha256 header.s=dkim header.b=l0wggv9E;
	arc=none smtp.remote-ip=193.218.36.5
Received: from mx.maich.gr (mx.maich.gr [193.218.36.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9C7606A31A
	for <regressions@lists.linux.dev>; Tue, 20 Oct 2026 11:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA9C7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=maich.gr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=maich.gr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=maich.gr header.i=@maich.gr header.a=rsa-sha256 header.s=dkim header.b=l0wggv9E
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BBD787BC0F2C;
	Tue, 20 Oct 2026 14:47:28 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maich.gr; s=dkim;
	t=1792496851; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=YRCCxKdsWDvyE3Czn1UTUZcseJVntJSnqQxo/IZpG1A=;
	b=l0wggv9EAPhqSWFZjYHohPMYsacFWzEFJ+Isw7+qANEA+ukkWmSnZv08QGuLTmpAbxndep
	2MWBCYGcu4QLh+KPWN0jp4dzMx5n/yvwdoknFhFgq35BGm6Ain2Bkb6qw0SC7sA8lvSXHm
	5ETqx6sfsRWXsBOX2WkZ305IR4h2rCwR50cT2giaw8idKFRSxGPrFiWdUL2SZs+jr6nYiz
	ssJBMi3epq4weKJDoaE7s/N05c/MoaTA1ZeopxdssfOSvFDW+dThwzc8JaWlJtZTdlBEbm
	ZugnzZU7kEjIsFw8+e/a/+7C8fZSe1QI0s8z0ll6rJTnqAMRoRriQduEIs5H8w==
Message-ID: <aca18b3d-616d-44b9-8c5a-2d0905a10205@maich.gr>
Date: Tue, 20 Oct 2026 14:45:47 +0300
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] 6.1.178+: lpfc: boot hang due to use-after-free of
 mboxq in lpfc_sli4_driver_resource_setup() backport
To: Andrey Misiurov <andrey.misyrov@gmail.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev,
 linux-scsi@vger.kernel.org, gregkh@linuxfoundation.org, sashal@kernel.org,
 1151377@bugs.debian.org
References: <29f6c901-5209-4681-81cc-ff768cd405f4@maich.gr>
 <20261020113957.951380-1-andrey.misyrov@gmail.com>
From: Alexander Antonakakis <alexis@maich.gr>
Content-Language: en-US, el-en
In-Reply-To: <20261020113957.951380-1-andrey.misyrov@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

#regzbot link: 
https://lore.kernel.org/r/20261008184328.2857037-1-andrey.misyrov@gmail.com

On 10/20/26 14:39, Andrey Misiurov wrote:
> On Tue, Oct 20, 2026 at 01:23:03PM +0300, Alexander Antonakakis wrote:
>> Moving the mempool_free() at line 8178 to after the
>> lpfc_get_sli4_parameters() call and its error handling, as in
>> mainline, should fix it.
> 
> Hi Alexander,
> 
> This looks like the same issue I came across. A patch doing exactly
> that is already queued for the next 6.1.y release:
> 
> https://lore.kernel.org/r/20261008184328.2857037-1-andrey.misyrov@gmail.com
> 
> Regards,
> Andrey

-- 
Alexander Antonakakis
Information Systems Department
Mediterranean Agronomic Institute of Chania (MAICh)
Alsyllio Agrokepiou, 1 Makedonias str, Chania, Crete, 73100 GREECE
Τ. +30 28210 35000 ext.718 | Ε. antonakakis@maich.gr



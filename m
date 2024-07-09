Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C812115A86D
	for <regressions@lists.linux.dev>; Tue,  9 Jul 2024 12:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720529709; cv=none; b=ru6pV9cZTgxi6GLcJIF1//P16f0I0Y2v/AxYhAKZNKb3Bfp1HG2ICiMf45S0Nn9bt6e+jvL9zIx1SCwzwHalrW2OsMuvENT1OxV3RVuLatdd5hyhYOj2fYPlcQMWUBYclOjNJyVzE7STo6vxs0vLnID1Qe0RwvEyBtE2LNOKGR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720529709; c=relaxed/simple;
	bh=XiV8xK6kh8POgM0OrePYlK8DKvXC56Iyv+Hx+USqc/I=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=q57PvsvCHvr+eD6PsRy8Be/GnH8FQ7byvTKAQHeqyAmAKn3PafPQV6EohvRpeW45ymrouYzqOigyqyFBOLAtHav4m/tFgQdlM2OZbETvt0uaEsGMZFt3EmZvxUPujf3GjyRUl6bTPnjgqBj8yLXudYzRVDmGj+WuyYz6fLXPsxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=D7i9f6bl; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="D7i9f6bl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=XiV8xK6kh8POgM0OrePYlK8DKvXC56Iyv+Hx+USqc/I=; t=1720529706;
	x=1720961706; b=D7i9f6blDXMiomlM1J/mt/trgUA6KHDQaHxUGD2tFWlSYMEE2fBJ0HS6MTN+P
	FxH5Ec8gUMKFePyK8q92lzkl67Au6q3ZMorqShcowWZEUvVAzXemYPWP/0dJhtrTeNQ0Rgiohd2Tj
	eTLLJN+6yRVsz2b8V1ZB6ts269yXbZ10b0DKtlREh+/omUNExWU8Pj/J7k0+BDvTWJFDXEUbzBkLB
	IHHkde7l6Is6e9o8bO77uYIxyL8Wi2i/SKyWE5/yT9xUQWK3G9Ztn1hlCYBcwrbc3Gn6E1rcVnDwx
	i9oN2Me9pDWi+AeoOanh/ANS5Ik+uQTulh9dmbU489+yUx207A==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sRAN5-0001GC-3a; Tue, 09 Jul 2024 14:55:03 +0200
Message-ID: <5686f08d-5f2e-41e1-955f-6051a7a985e5@leemhuis.info>
Date: Tue, 9 Jul 2024 14:55:02 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1720529706;68de3c73;
X-HE-SMSGID: 1sRAN5-0001GC-3a



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.


#regzbot report:
https://lore.kernel.org/all/d4b235df-4ee5-4824-9d48-e3b3c1f1f4d1@oracle.com/
#regzbot introduced: 1548036ef1204
#regzbot summary: nfs: LTP nfsstat01 fails due to changed output, stable
affected, too

#regzbot report:
https://lore.kernel.org/all/705544af-d615-4ff0-a54c-72a69140ce6d@eh5.me/
#regzbot introduced: e8448a6c817c2a
#regzbot summary: pinctrl: rockchip: boot broke on RK3328 / Rock64
#regzbot fix: pinctrl: rockchip: correct RK3328 iomux width flag for
GPIO2-B pins
#regzbot monitor:
https://lore.kernel.org/all/20240709105428.1176375-1-i@eh5.me/

#regzbot report:
https://lore.kernel.org/all/205bd84a-fe8e-4963-968e-0763285f35ba@message-id.googlemail.com/
#regzbot introduced: 7a36b901a6eb0e9945341db71ed3c45c7721cfa9
#regzbot summary: ACPI: OSL: many PCI devices unusable on Toughbook CF-51


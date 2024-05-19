Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F6A14F90
	for <regressions@lists.linux.dev>; Sun, 19 May 2024 12:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716122629; cv=none; b=KweirS1hXfB9X5JFG49nxw4moNaJJrvTvBb8Sk5z+3+dQH4AoWH06FXc+Lx08Jl9UTwdMKbZA5lsSRFfHy2kmg/b2OggjNAqaAP5lU5fv+2sd9oF0jNu0KQYHJTFnx1vGgHt4THd3keT3EISua1qqlC23eq6R/zRAS3435mZ1Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716122629; c=relaxed/simple;
	bh=bl0N9AlBunbbi7VQ8jK/ZjLYyqTasTuG+awrn/p+azo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=lSUeqTzk35qjZjUDpODmQnEaK/LgPuzHpjW0fBDbn0mw0fllYagCRPgruJCFBm9WphwLRRFL1esFNXrPMyHABn6WJIMba15Ey6HIWcRuKE+FjSNQtFlzXo5qfvGUElSfqqRKNBYErbNGa/WVVZoV/b1f35csY5N7stTjX8STBOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=0QT/NXF0; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="0QT/NXF0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=bl0N9AlBunbbi7VQ8jK/ZjLYyqTasTuG+awrn/p+azo=; t=1716122627;
	x=1716554627; b=0QT/NXF0rmULlkldJrUUEfjuYsS0aMpCJVNeOZw7R8FCpOIhaiZrFTcVJ1R16
	8MjYb+Fl7tcdFUj3GsUwls9BgBnHQ0yz1OSLzBQxC9vPYWYIj8YRnv70o5/FXm7dPSEbSqF12z35B
	4pRq0QJRIDl4lT9bJ1rZGi0sy1dgzDTiYBxQgRXJtY+cbzKLFEDD7ixyoi4QB3nWnJuE02aGWELPC
	mnJXlLTfbsk1Y/p6lNmvx4szlgLNwXg9jVBkvLQRzYCcEeiJPec5qXj6dqgTC00jUTf+ni+zuM0F6
	tCuzODN7MCFHH5OyGn+i4FXw9sqYSFrV7bXHcd9uSE3rCp7tQw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1s8ft6-0006qF-7G; Sun, 19 May 2024 14:43:40 +0200
Message-ID: <4f38deee-4e97-4a14-bb23-89262b170469@leemhuis.info>
Date: Sun, 19 May 2024 14:43:39 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1716122627;a0a3d25e;
X-HE-SMSGID: 1s8ft6-0006qF-7G



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/D1B7GPIR9K1E.5JFV37G0YTIF@shadowice.org/
#regzbot introduced: 2632e2521769
#regzbot summary: arm64: fpsimd: data corruption when dm-crypt is in use
#regzbot fix: Revert "arm64: fpsimd: Implement lazy restore for kernel
mode FPSIMD"

#regzbot report:
https://lore.kernel.org/all/20240413092743.1548310-1-hui.wang@canonical.com/
#regzbot introduced: 861e8086029e
#regzbot summary: net: e1000e: ethernet stops working after resume
#regzbot monitor:
https://lore.kernel.org/all/20240517135059.10646-1-hui.wang@canonical.com/
#regzbot fix: e1000e: move force SMBUS near the end of enable_ulp function

#regzbot report: https://lore.kernel.org/lkml/ZjcRPelwZP34N42s@gmail.com/
#regzbot resolve: seems mingo stopped caring

#regzbot report:
https://lore.kernel.org/lkml/c7b38bc27cc2c480f0c5383366416455@linux.ibm.com/
#regzbot resolve: performance regression people are working on

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=218682
#regzbot fix: OPP: Fix required_opp_tables for multiple genpds using
same table

#regzbot report: https://lore.kernel.org/netdev/Zh%2Ftyozk1n0cFv%2Bl@euler/
#regzbot resolve: looks like not a real regression to me (Thorsten)

#regzbot report:
https://lore.kernel.org/netdev/VI1PR01MB42407D7947B2EA448F1E04EFD10D2@VI1PR01MB4240.eurprd01.prod.exchangelabs.com/
#regbzot introduced: 3cd3399dd7a8
#regzbot fix: 3584718cf2ec7e7

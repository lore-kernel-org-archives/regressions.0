Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1611714A89
	for <regressions@lists.linux.dev>; Tue, 30 Apr 2024 05:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714453353; cv=none; b=Y7mM0EGeYGiDxJ3uajNcnv9MdqR9x6C4X559bzP2dO0y+O8v2WCbfhDpjopqWnQhrmniFiYsfhvW90T6yvdkdIgObDVqO3wgS2C+r+zV4vRYF9eWmVUc0AIS6H7UShE/oknDE0Um25O1ASnCTJIZU2gn766NRIsPB+FQouYHiOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714453353; c=relaxed/simple;
	bh=gaYSPNuzlZ1Xmn4JSJ9sy4iaqCgZlfgp7GktQKZ2pWg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=XtYRCttxEuMAW4T5YoA02cWYjNIQzOtFfi5p8TbBJouEenNElie/jxt0LU6cJ8rbScUJPDJTgWwd5joxzWcAd9QN9e1uSOTI75zpcNPqlfnkOEC9qbbLHnBh6kb5HvjgCEwsnkJSUYG26OT4wLHPILAitsZGZP/dRPnYgcTcPhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=SVCYSr99; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="SVCYSr99"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:
	From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=gaYSPNuzlZ1Xmn4JSJ9sy4iaqCgZlfgp7GktQKZ2pWg=; t=1714453351;
	x=1714885351; b=SVCYSr99XRuqgHFQEeR6OlLw7zBGHBoD8tmfS1AQQKD+gekOeFt0APF1iSP+R
	GvdXf/gujHnuWN+xB+bs97haTa84RcW6N3EBby8H4hQjY+Gg/T4FIIua7/nlX0hoDEf4Dz53sh3EY
	LqVcs/VTWhxL1NAstIYwcCaINtKUwsjjUVYHgEgZMGEVLdCLAJ/0crq9WCWdXqiumuqE1dD94nko1
	5MpkzMeAR6J5Koq05v3oDegdyM2WW8ZS2U+ci2GA2+KQWMZzcWHD/wGL/AhRq4HtSwMxudZX0+aJe
	s7Y8D7H82W0ks1j8dHAcgpl/vo7UaLxCRLZZ+D7DyTfTZlbymg==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1s1fdG-0005jk-UP; Tue, 30 Apr 2024 07:02:23 +0200
Message-ID: <a3bda4cb-9dc0-4c9a-b20a-754b4fd47e9f@leemhuis.info>
Date: Tue, 30 Apr 2024 07:02:22 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1714453351;55e0be32;
X-HE-SMSGID: 1s1fdG-0005jk-UP

On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://lore.kernel.org/all/ZiBCsoc0yf_I8In8@eldamar.lan/
#regzbot fix: cifs: Replace remaining 1-element arrays

#regzbot report:
https://lore.kernel.org/all/e09ce9fd-14cb-47aa-a22d-d295e466fbb4@amazon.com/
#regzbot inconclusive: tricky -- but Linus is involved and it is likely
not a regression:
https://lore.kernel.org/all/94db60bf-c3f4-4217-a900-9c3eba29e180@leemhuis.info/

#regzbot report: https://gitlab.freedesktop.org/drm/amd/-/issues/3344
#regzbot introduced: 5950efe25ee02df49
#regzbot summary: drm/amd/display: screen flickering with Framework 16
laptop

#regzbot report:
https://lore.kernel.org/all/1c978cf1-2934-4e66-e4b3-e81b04cb3571@rosalinux.ru/
#regzbot fix: 5af385f5f4cddf908f663974847a4083b2ff2c

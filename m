Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA7A67E70
	for <regressions@lists.linux.dev>; Thu, 15 Feb 2024 10:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707992844; cv=none; b=nUzrHr719X95+FH4ihXHxhvf68EFoiDxBLGBBrYbf6AwbiC9eF9cs11CQxOKIs6FUmn+OL+51Y2lC5ZfZ3Vd5kgD9JTK9netIFydam0+5OP6hQPFhyxqkW7HTtk98Wat/f/ZdiqduSbhQnIi1O/qm3iMYac/3GTFGryGtKKIKRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707992844; c=relaxed/simple;
	bh=4ou2Gw+NyayEX4XbIa8Bt4BXqOhtw7BfY7v04I8Qz0o=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=FK2K7/xbI5sgyHQ4LtlhR0WAW9WRsN7pRJeM/y5b0RiW7O2RGMikD9Ir5wXhsp3+wVM0MAC2SOc7tSxwETV0c2sfUwH/ayrtDzB0+705a5VsUf/7pBu+mviURSHd9bQceq4sXIYx3aYx5djyg4Hr8UHrQXluD2TlNipiuO11xiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1raYxc-00064G-6c; Thu, 15 Feb 2024 11:27:20 +0100
Message-ID: <1ceefc9b-98ea-4ac1-98a2-dacb4201883b@leemhuis.info>
Date: Thu, 15 Feb 2024 11:27:19 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: MXSFB error: -ENODEV: Cannot connect bridge
Content-Language: en-US, de-DE
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <34yzygh3mbwpqr2re7nxmhyxy3s7qmqy4vhxvoyxnoguktriur@z66m7gvpqlia>
 <20240214110822.GA81133@francesco-nb>
From: "Linux regression tracking #update (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
In-Reply-To: <20240214110822.GA81133@francesco-nb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1707992842;8ccbbcbb;
X-HE-SMSGID: 1raYxc-00064G-6c

On 14.02.24 12:08, Francesco Dolcini wrote:
> #regzbot introduced: edbbae7fba495284f72f05768696572691231558

#regzbot duplicate:
https://lore.kernel.org/lkml/34yzygh3mbwpqr2re7nxmhyxy3s7qmqy4vhxvoyxnoguktriur@z66m7gvpqlia/
#regzbot ignore-activity

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.

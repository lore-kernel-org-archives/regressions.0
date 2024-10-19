Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786711CC8B0
	for <regressions@lists.linux.dev>; Sat, 19 Oct 2024 06:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729318741; cv=none; b=c+JQEYToGT/K+pXdMWwkncGm85UC/0+GVc03oWtdmRjvxWOBRJDP9rixLIxQHGQpsY1+wf/6/g1aQ2M/cE8RXRB8d8BdJQy5zFWxOmHLn/lz8YQrer6vIgPuRU4sxdHIk/SW09SmkIIREcTraAENXrFPQOBV2AqfxKfBRXIG49s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729318741; c=relaxed/simple;
	bh=ZnsmxLIWSSYkivAQLLxSzfPmbkrpaV2kZAb/Ghu4X0A=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=BayrYBI8+iHy4XoAhmZ55byehYO/RRtaiEn14dPh2HYy6REAIUr4smnSwC2VYHz+ryKjXvoHhi8afSHg04lxBbX5KmG4jWRWWzFM5TovM8KYx57VgyUvr4oOM6wk6Z890OZciofKeE2FWWEXafxpy4wu9PD1COu+YmIUxKgaFNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=K031tQva; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="K031tQva"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=ZnsmxLIWSSYkivAQLLxSzfPmbkrpaV2kZAb/Ghu4X0A=; t=1729318739;
	x=1729750739; b=K031tQvavTDFAmyOYkPtG0qa9wxk+LMJmND9J+tZA+zmFevjcrla9BMPNOkpB
	iZeK3nXxaV0kqUvTapGPUYo2Fd6faEFoj1hAxa7FpE3um3v5bR15IXRGmvtHr6OJJdPUSG+IByLsu
	br5Xq0GiHO7YQGlLveE3ddO53SU6XPJ7L9A11cW1s7pqXcUF5+/txPyQeC/D7FsslVK28T/1Qn6yW
	8IbOtjBI2VPLCOnGgGexA5Mfez4JmpXJ86LYA/AON5vVboFvqGGnF74O9sCYG/jkosFSbYOoH2weQ
	Hvn5W4SERmEGMxXZ274BQ0umC2kAPV6RqBpDq7XKtETHV5PWbQ==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1t22nh-0002Yi-OK; Sat, 19 Oct 2024 08:18:57 +0200
Message-ID: <f2d44e56-1be3-4cf0-ab7d-f24672ecac84@leemhuis.info>
Date: Sat, 19 Oct 2024 08:18:57 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1729318739;0910e76c;
X-HE-SMSGID: 1t22nh-0002Yi-OK



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/CAEkK70Tke7UxMEEKgRLMntSYeMqiv0PC8st72VYnBVQD-KcqVw@mail.gmail.com/
#regzbot introduced: v6.8..v6.11.2
#regzbot summary: alsa: no sound on speakers X1 Carbon Gen 12

#regzbot report:
https://lore.kernel.org/all/CANPzkXkRKf1a6ZvOJU=m3NwW4B0gQnQSRggw=ZnK6kBYmqLtBw@mail.gmail.com/
#regzbot introduced: 0bfcb7b71e73
#regzbot summary: netfilter: xtables: strange error from the xt_mark module
#regzbot fix: netfilter: xtables: fix typo causing some targets to not
load on IPv6
#regzbot monitor:
https://lore.kernel.org/all/20241019-xtables-typos-v2-1-6b8b1735dc8e@0upti.me/

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219394
#regzbot introduced: 5c38bedac16a946402b627621b3d4bfcc99524
#regzbot summary: wifi: iwlwifi: mvm: hotspot creation became impossible
#regzbot link: https://github.com/lakinduakash/linux-wifi-hotspot/issues/435

#regzbot report:
https://lore.kernel.org/all/20241017071849.389636-1-oneukum@suse.com/
#regzbot introduced: bab8eb0dd4cb9
#regzbot summary: net: usb: usbnet: fix for MAC addresses broke
detection of the naming convention
#regzbot fix: net: usb: usbnet: fix name regression



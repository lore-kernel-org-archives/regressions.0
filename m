Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7AA25761
	for <regressions@lists.linux.dev>; Tue, 16 Jul 2024 14:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721141690; cv=none; b=b8K0JJNsQnLOB5/jL672YMkjk/dxV2BK0w5jDGyQ7ux9lyl2ujdSf5jHmfacCxEdXg+0qXVFz9EEyVwx2a9ehj2pM/gbIKpr4LqgNZhSPIdbc7xBWFixc24jFgge0j57CDwXzOSIdrwE5cE+LQjtJZ3nc99NbNkuDAkGCqU8utw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721141690; c=relaxed/simple;
	bh=/F7u1s85ACMv3mv0QEHOLjqwZHmcyD0B4Wn20jFL81I=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=PZ1nqEOOdT/oghDqfJlGEvNCGyKoaSSn7bUkCHg1pY1Bq9e87lg79PtkTx/Io7fpPDWtL77bjMVhYDkLTEWoGXmiapYbAxQU2xwAcJa/OwtICF5A+tWQKrGwVCsfBa3/9+CeMRiDzFMuPIe7Ft3g5v3IwKIiPFasGMmKnWluHvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=V7ZQCSLx; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="V7ZQCSLx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=/F7u1s85ACMv3mv0QEHOLjqwZHmcyD0B4Wn20jFL81I=; t=1721141688;
	x=1721573688; b=V7ZQCSLxaTA2vDxbmwRdOeqVov4mfMWNEOiiNjHUsyqEXToXcZcHi52YhJN7F
	NhuCUzwpXU5HRbJtvMlfqnzkFp5YJ6oX2wxtEVDOGR0OJrLyi3y64ac4TJJpiSv9UWtBF7yjHtmdQ
	gfur/69jOeQW6xuF2T9QND5LXX347b97o+/0mSSP5XJJ6Jd5jp6Lo6yIchibFQ8Ou5kvmnJ8A32TL
	H6DtLYDgjbcNDiySw40252C7KiUuH/cMzDyOHVMi1GNsMXG+O5LzsRLBubznlB7ut9DVjV7FX+oQ4
	F+U1VZYwZiiLWg5eCDHr1AGTgtMiEr3VmGiyLYxmsfur7WOTRw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sTjZm-0004JR-EU; Tue, 16 Jul 2024 16:54:46 +0200
Message-ID: <18a676e5-56ea-4a0b-a69b-e6557f617e25@leemhuis.info>
Date: Tue, 16 Jul 2024 16:54:46 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1721141688;35b3e65c;
X-HE-SMSGID: 1sTjZm-0004JR-EU



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report:
https://lore.kernel.org/all/bd9cb3c7-90e8-435d-bc28-0e38fee58977@schmorgal.com/
#regzbot introduced: 39985eea5a6d
#regzbot summary: drm/vmwgfx: green pane instead of actual video when
using Xv

#regzbot report:
https://lore.kernel.org/all/CA+Xfe4FjUmzM5mvPxGbpJsF3SvSdE5_wgxvgFJ0bsdrKODVXCQ@mail.gmail.com/
#regzbot introduced: 0b75a1b1e42e07ae84e3a11d2368b418546e2b
#regzbot summary: wifi: mac80211/ath10k: frequent "failed to flush
transmit queue" errors

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=218946
#regzbot resolve: inconclusive: reporter MIA

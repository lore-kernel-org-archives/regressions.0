Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AD21C9DFB
	for <regressions@lists.linux.dev>; Fri,  6 Sep 2024 09:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725616424; cv=none; b=bCaNJicZVN0FwFKMvjtTdOomT6ZuGr7jcWSXAwZWoge2QqrtDcG20jBPanq0OgT8Oz3FCNwllCLIkdxkmqZP1X4T+7r9odBkuVax2bi1TJ3dyj5MUa1paOy/UfmCNnNjYSrjURiiuy9G3RII+4qJJ/KdOVWHZEXIbo8StRfKbhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725616424; c=relaxed/simple;
	bh=ITSzTNnpnNB1bdHVsr2oHdvfQkyptQKwVEEi011Oqfs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=iu7Dnc5i1CiuOWwTSsY0w/U/l0kPlonxwQuKdxtn58GoOYh/HcHk0qr1v5VqwF1uefH8UlsRxTeAUPOgeO5O/X1jYu7O0+1kQubt03qCBG+Mxdu+b7KX6Qr1C4o8Z3P1wdV8rFmCUcHpFf4Y1wlR01N/v1A5JY42xKRR/YGKWQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=Sa0xNv/c; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="Sa0xNv/c"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:From:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=ITSzTNnpnNB1bdHVsr2oHdvfQkyptQKwVEEi011Oqfs=; t=1725616422;
	x=1726048422; b=Sa0xNv/cGrlltE0pE5FrmRYBO/N/yjNJ+NZqZLmSpOZpkyVHGYGriydRubHRR
	VGQh3oyiwgLBZ8vM8Uwebe9KxFwAGM/LXCXHkwIP72rRG3QuhcYg7imI9qJq1vARApAeVGf+3N8c7
	KqNhJPqWP2kHszCRFgPw4MV7qeTsaZbOT8vxc2okexZjJGg0KPCSqSSENvb2vSgPbz1oyG5jZIgio
	EcQu0sPltyJ5zBFlihrmRHl5ifXj+tRfg0kwNB/ypNQFw/1JwsF6LLzpumN9ppWn2do6oRJ5PfCo/
	4vfcSBdJWfGtT6PgP338w9yG84crf9XTUAubRbtcL1dgX4hSrw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1smVet-00087i-Gz; Fri, 06 Sep 2024 11:53:39 +0200
Message-ID: <64256cc7-367c-4a06-8fe0-2e868c721c7c@leemhuis.info>
Date: Fri, 6 Sep 2024 11:53:39 +0200
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
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1725616422;a1455fae;
X-HE-SMSGID: 1smVet-00087i-Gz



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: 3ee1a1fc3981
#regzbot fix: c26096ee0278c5

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=219217
#regzbot introduced: b49420d6a1aeb399e5b107fc6eb8584d0860fb
#regzbot summary: video/aperture: suddenly two displays appear as
connected, but only one display is
#regzbot dup: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12160



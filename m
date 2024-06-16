Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CDA8F54
	for <regressions@lists.linux.dev>; Sun, 16 Jun 2024 12:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718542153; cv=none; b=Erw/sH17xYB7YoBpfc10nXs0A6qMg1bRVO+mwhOvIZ57rJTfEWRD8QLO1fTVHjOO+YfTc8JgG2oNU9cbdAeWdxqx2qGzCOiF/KKUkpTyY6VQU8yE9/AlWv5xe3gqdVCOLyG0j3dm9oI/w2KEkAEYMFvGOXhrgCkOIieELE9Jmgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718542153; c=relaxed/simple;
	bh=s6hgN5hRpD66EzEYBX5jnGz7Zay5snhLCm6bPh2Ka4I=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:
	 In-Reply-To:Content-Type; b=UglmLvE98Qe6PT3XYWtH0oEExJ9NFe3KBdyzoVnczLNgRj+2qPLVB2MG2bkKfFKgLV89wLavhz6l8Mot+V9lCGDFtPKQJKm+YqNtXhm4obIFygBXjzkCu94Ty09jo6Udfu9l42LFzSRoBUqOQF3+HTwkHIkxmA86v30LkIttosA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=Efq5zzNa; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="Efq5zzNa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=leemhuis.info; s=he214686; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:To:Subject:From:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To:
	References; bh=s6hgN5hRpD66EzEYBX5jnGz7Zay5snhLCm6bPh2Ka4I=; t=1718542151;
	x=1718974151; b=Efq5zzNazPVWJ6DHq60+DW+ECj/qoUdjLxQP+tTEqud3Xql9qAXHvu2Xi4r4d
	M4s0g5DSI99Kg1+E3QdkYxcwoQtxrrgMXZ7qqE4NHjnFxX9SWl4sQxZ55j2BCbo6yoJPSUoyB0a6X
	L0Z1DTICvXz3RGpePL6JeX112MM+CpWm3o7YN51zS0x/x5XdWW6+zUuV5L0eM2RA/vlsWHbuNjkGn
	fhi6/jo5Ox3RRC+CyTldKU57IIy1MUkfdwiNYe9lp8oL1GXv4GMGEbuHKg/1PDQ+OZPca+yK/MzuI
	T10hHG2KwDGG5VxPPmfI/NcmREmqHAvAtjXCxlYUSVjfAY8bZw==;
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1sIpJl-00016A-3o; Sun, 16 Jun 2024 14:49:09 +0200
Message-ID: <5282b546-4966-42fe-bfb1-7a876ab0b9c1@leemhuis.info>
Date: Sun, 16 Jun 2024 14:49:08 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: Thread for updating minor properties of tracked regressions
 [consider ignoring it!]
To: Linux kernel regressions list <regressions@lists.linux.dev>
References: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Language: en-US, de-DE
In-Reply-To: <fb0c84ab-5407-4a17-bbe7-832d8c4a51da@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1718542151;58423657;
X-HE-SMSGID: 1sIpJl-00016A-3o



On 09.03.24 11:18, Thorsten Leemhuis wrote:
> Hi! This is the start of a thread I'll use for updating minor properties
> of regressions tracked by regzbot. Consider telling your mailer to
> ignore this thread, the replies are unlikely to be of relevance for you,
> but done here to ensure a public paper trail.

#regzbot report: https://bugzilla.kernel.org/show_bug.cgi?id=218902
#regzbot fix: 02c418774f76a0

#regzbot report:
https://lore.kernel.org/linux-ide/20240513135302.1869084-1-dev@kayoway.com/
#regzbot fix: 9e2f46cd87473c

#regzbot report: 9e2f46cd87473c
#regzbot fix: Revert "serial: core: only stop transmit when HW fifo is
empty"
#regzbot monitor:
https://lore.kernel.org/all/20240606195632.173255-1-doug@schmorgal.com/

#regzbot report:
https://lore.kernel.org/linux-wireless/chwoymvpzwtbmzryrlitpwmta5j6mtndocxsyqvdyikqu63lon@gfds653hkknl/
#regzbot fix: wifi: mac80211: fix monitor channel with chanctx emulation

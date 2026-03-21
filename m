Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F2B2F617C
	for <regressions@lists.linux.dev>; Sat, 21 Mar 2026 20:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774125823; cv=none; b=hvUKeEL9D/TWe48hg1roS+NfCZX5zGNl5X8LeGWHJXfHiZqdWN8ERim700VxzSnp7vmevSqBVokZ/fudy/NUZzRQFCfPyPD90a2oR8aH7NkedwvkP06USuB1cC73UckDNBecemKZG+tPnS6ZwDPCpVJ2CMugTRF1aVW8w7KIFDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774125823; c=relaxed/simple;
	bh=v8Tph9VvK7iaD9+Mu/R+J+KhciCq0svd8J7C3U38paQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lg6UsPs4jWZ3RWQHYYVQrFihJ2Gtmv8mdELjDdEaGXVBWrqS5rinew++GyZQc/uNSe1C2v4TSwCVFlBmilIoszA5KnFxXlLU5/eARoCgckh080KICjH1jUdTX92ugJyJ0miF9tURw2ru8q3+mNkwXJoMfG8R3cOsvyicNffrXcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=gXgFPs15; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="gXgFPs15"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 6BA6640E01A9;
	Sat, 21 Mar 2026 20:43:39 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id uXl09F5qeWQq; Sat, 21 Mar 2026 20:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1774125815; bh=Kj1TBpm2llpKHD/7IliP9vh16mpWGJsPcYOzvIEFaLA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gXgFPs15XxKV++BrnajQ1DjlkBJSXHutZfau3TPYNgv4vpD50ZPnAyUHfCJW2cTr5
	 hE1iAO2raArQ36cITT76IvXnM73izdbPuMYsgfEkKicuaTeOkaJrKNPvvL0UKTsZ3P
	 8JBdTnpCHcWUlIkpCbLSbmkonfqPNy/l9UE61axT/luph3cT5zg9WVd6E/foptTl52
	 +BmXD2sJ5Fvf7W9USfW6wtqECj23NDBvQtmUC+etrwBZyWL6pROXXML2zuup8MWyC9
	 70HFvxVcvChnoggUM1EBNbSMkS091HAiXZhZybS1hCpm00LkvOpfdRh80IM6QQ5UFp
	 qk7kn6UMgu8ZCVkYIHPwx957llEktfO8LXuRB8xQIRVoMyZDDFZITnPdGJyWT+fGbM
	 ltQnwgLnazXFugxHn0OZr370UKBZUdgeeSq2kT/mc1cwKZyg7MdrgnkPLgSDAUefyi
	 J3kQCKSTNl1nIVfrWG0/Qk+sbw0J4L4TyVIZLkyhXjLVWzX4i5BKR1wFkM2cX0YECc
	 F3m5h9OkmbxBAeBFGA5OFMspqFyEfcJ5od/hVScFewrMPJN2MCSqr96xaanNhnhMlR
	 TG0AM+7OCB91AlTpT4ZXXZgoG8B0le4l0aJMWOjx2SST/wnuT4SLPkcfy+GfJ9RFVs
	 dyvCqcHlCk1aj+gZRZ4YMuaY=
Received: from zn.tnic (p5de8e020.dip0.t-ipconnect.de [93.232.224.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 4336F40E019D;
	Sat, 21 Mar 2026 20:43:29 +0000 (UTC)
Date: Sat, 21 Mar 2026 21:43:21 +0100
From: Borislav Petkov <bp@alien8.de>
To: Nick Bowler <nbowler@draconx.ca>
Cc: linux-kernel@vger.kernel.org, regressions@lists.linux.dev,
	x86@kernel.org, linux-edac@vger.kernel.org,
	Yazen Ghannam <yazen.ghannam@amd.com>
Subject: Re: PROBLEM: boot hang on ASUS P2B-F (regression)
Message-ID: <20260321204321.GFab8C6aq2jIhIen_p@fat_crate.local>
References: <mfc7rijyfrtdxj4k6pxqcar7jtqnt6kz77ubrr6iyj52cguesz@qj5uf3to7ukq>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <mfc7rijyfrtdxj4k6pxqcar7jtqnt6kz77ubrr6iyj52cguesz@qj5uf3to7ukq>

On Sat, Mar 21, 2026 at 04:26:52PM -0400, Nick Bowler wrote:
> After updating my PC (ASUS P2B-F w/ Pentium 2 CPU) to the latest versions,

Pentium 2 huh?

Don't tell me you're really using that machine... :-)

Anyway, pls send .config, a dmesg from a successfully booting kernel and
/proc/cpuinfo.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

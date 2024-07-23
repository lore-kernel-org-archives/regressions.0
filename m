Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16CD17BD5
	for <regressions@lists.linux.dev>; Tue, 23 Jul 2024 12:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721736191; cv=none; b=fKNKI6YmUMggoVkPkVztgK2z1ujUfi3BPNhNFtkInbz7xC1/RwnMFnzq3TmyZwKddbhZzVRJlA1xcub6kebVkuUX+l/7rB0PuNjVPpyscv3YXEA3+5HUSw4GnEc3HaiHxuUo3x9miflKSZKiguPIYOrwcicz1503gmrWt1ZHQsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721736191; c=relaxed/simple;
	bh=LqoXg11Mqx62kYsAvp7TkYV2hE6eBLMzv7CRBG6APng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A7OT/1wXplnFsJTxO77uRntWf+d1qV5njdE9GnrmnJQlFVmo6LPOr0v85v7MDLxi4G4VJKWb68AeUWWT1ANNeeEWMFuNSUgligRc5hCxr+N8aLo6RbuiDteaiOrTHOcznNkuKxdaX7LLwsoslGkRYSF61vwLg9M1T9k/4INJHkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=B9Q3NNXY; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="B9Q3NNXY"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id C8FFD40E01A8;
	Tue, 23 Jul 2024 12:03:03 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 2jJaYvl_Wng3; Tue, 23 Jul 2024 12:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1721736179; bh=E006cIzLqKHy4lc5wxNDO+D8wDByVFAtB79iA3VJHpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B9Q3NNXYRnxJs8ANdjaxXrDF3lN07bNlleryKeAP5q8oBrxnzBlZ23FPafqrw0C4Z
	 b8XO8wSmwAbWAxxgI2MheEJ33DEPNrb5STRCfzohidRpLvAQ44VCoNM/kZugx9dWvK
	 U0qCi+IS1mqZaV7usGLdeAND8Ewgcmwyov1q/baT/QULyNq6xIxONQN3tOnm1aWiNy
	 rdkDZjsNksYWkYPaXsqFXPwJ5Ye/pROGuTqvsx33/YRrNHNZ8Vdizgk1HyfnIrhuJW
	 fkRldxJG3fNCWSMi0JzzZYyyrYw/OgkSXjd1KuT4Xct9rVOaDThMZCvV0qKRrmsOhV
	 DGDEIFs1R/6xaLzbPN6ATXfb2JtcLycj2hkLg3Uxdus+Dft8V3TuMG240HJH9WZJ2J
	 Kvui9lHX3F8bBNvUk/DOWmdCf5sMCubgfSLEnFB8hVnO+RwMRURrsZ2KVoOL44gJul
	 sobQ8kzZUsqTZD9bH3i62WNlh7Fn8ouY0eRN+91MEQnASAp2ZR7Ae5HvOLosjrtVv8
	 E9c8UnzuOxnK+AzOrV1VcGCu0NOli7dfQJafpbcMhsfqewcLxCxuiPWG1XNiSZl1u3
	 5T8UyE3+s8nJ/sWWRmt2bN6oqD7idV2a48fzokErCjUykYPYuJTxy/qDLJ3yzUKczD
	 j/10FtVemajlEdCS3uVED0n4=
Received: from zn.tnic (p5de8ee85.dip0.t-ipconnect.de [93.232.238.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B1C2F40E0184;
	Tue, 23 Jul 2024 12:02:54 +0000 (UTC)
Date: Tue, 23 Jul 2024 14:02:46 +0200
From: Borislav Petkov <bp@alien8.de>
To: Christian Heusel <christian@heusel.eu>
Cc: Thomas Gleixner <tglx@linutronix.de>, regressions@lists.linux.dev,
	x86@kernel.org, rob@durendal.co.uk
Subject: Re: [REGRESSION][BISECTED] Early boot hangs since f0551af02130
Message-ID: <20240723120246.GBZp-b5nHHT0BWmKMZ@fat_crate.local>
References: <361b2ba5-7fc3-4e9a-af63-adfd4bc20304@heusel.eu>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <361b2ba5-7fc3-4e9a-af63-adfd4bc20304@heusel.eu>

On Mon, Jul 15, 2024 at 03:11:19PM +0200, Christian Heusel wrote:
> - output of "cpuid"
> - dmesg of a working boot

Send a full dmesg from 6.10 mainline - not some distro kernel, dunno what arch
has, perhaps same as mainline but still... - I guess with the patch reverted
as it doesn't boot otherwise, as you say.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

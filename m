Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59D219E97F
	for <regressions@lists.linux.dev>; Tue, 22 Oct 2024 14:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729607656; cv=none; b=AEDYjQsYWTcRW5UmZWySh3LAao/yHW6t7wrDUFNoGAuqpC1pJXPVZNO7wyiaWiLvminWDjuUOSysDHxPFoqnY7X4SJVDEbwkH1sNmvPrH2DN1PW3v94BDQMaDShtebtBLcoeDqjwVswk7r1+TB3YU+vL0tEvQJAcfhApvrlHkjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729607656; c=relaxed/simple;
	bh=yIhbm/YDdUnq8Q7RsfO9NPQQUTaApFDK+ECy7QckynM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tzh7iz2CyPHLk99KHdXKS2qole0NJ4bfBDIJVqy4dgy61T/NNvTsdINDj1Q2cS813q4x5r61Ph0OcTJA9lVsPTFyKewV8eS1MjCECsOKHUwTpryd7tbtxJJU8SXi94RQgoM0a5ayUyfk4TyVYA9oY6H58hI5b3gLZQJdhSt87ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=EdQpBc19; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="EdQpBc19"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A9DD240E0284;
	Tue, 22 Oct 2024 14:34:11 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id gonby0v5Fga2; Tue, 22 Oct 2024 14:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1729607645; bh=NRd/tgfwMRQSiXfwVIVoUwc97JvH2R8kAYW/8qtrVgk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EdQpBc19qFegbO9WuyO+O3Ip7xtILrgBRGhYA4qDLiBn0eYHT3LEJE0lX1gLo5RW3
	 hWuVzKA9nr/8bRvTHgs+ViMoJgpNZRrr4sC2uf6aKCzMgUfvWVcn8cC1mxJVEJ8eDi
	 luC04K9M2wdvEter9zS4dY+pCOn8YS3uiZ/oGXHyPaLFcf+u5rbQpUPtAb+4iVV6qR
	 c098z7giu+FMLy5TuXBjgpPomQFzNGqk2zY59in/mT2DUYE2ofXoQ1X3iXr9VtmIoU
	 2eglkm5NF9pyC5qfvOENoXCsNnEa+cCU2kDq00u24HosVPyFsuOdvHXn8hdrz6Vi43
	 knTnFZjlNS+HEqF15GZextzfDjq0qym//B5lSkHZID7ex79uy13ZaOtNH1htb7RRGI
	 6ZX9MbakzPT3y/Qc5V8o0cpC67i1g+lHgl8WwW1a4tdswqVQstEjnp11VBwlUilO6K
	 XSBIFKQPaW8Oji9rY++Fz2oeu/zheU8k5z9QxNSDWMg90VJ/kRE7NlyutLeB7pG2Ab
	 gEIu1hibmtwHsZOKMe7q7EClmktg533GjhrYI8CsaZssqaM0j7KB90gUblApTOMwp8
	 468P8bcGD56HNG3NZrt0Z7nZIBRkQst1rn7e08fowYR9cReW4+tcg+kmY0mAaLUPvs
	 u3OSdvS4qR/xB9iqFrw2wwkE=
Received: from zn.tnic (p5de8e8eb.dip0.t-ipconnect.de [93.232.232.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 819E740E0184;
	Tue, 22 Oct 2024 14:34:00 +0000 (UTC)
Date: Tue, 22 Oct 2024 16:33:55 +0200
From: Borislav Petkov <bp@alien8.de>
To: Jens Axboe <axboe@kernel.dk>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	the arch/x86 maintainers <x86@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [PATCH 2/2] x86/microcode/AMD: Split load_microcode_amd()
Message-ID: <20241022143355.GIZxe30_6eAbLXByOt@fat_crate.local>
References: <436b4fc7-6369-40d9-8e88-556cbf5a5687@kernel.dk>
 <20241019232138.GDZxQ_AtkqA9iAR2td@fat_crate.local>
 <b2fd70bb-9414-49e0-bdb8-5c538f247dea@kernel.dk>
 <20241020121819.GAZxT1CyR_5vLLZ5e6@fat_crate.local>
 <df217737-6e2c-41fe-b558-3e2ab6dc0d9e@kernel.dk>
 <20241021073140.GAZxYDXCk02lSrG3-T@fat_crate.local>
 <daa98312-cc66-4c2f-8e64-01358ee99305@kernel.dk>
 <20241022120531.GDZxeVC0WeUPhInkYh@fat_crate.local>
 <20241022120836.GFZxeVxGQ6vWIScFWo@fat_crate.local>
 <eb6d8837-84cc-4b0b-8025-c846e24e8240@kernel.dk>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <eb6d8837-84cc-4b0b-8025-c846e24e8240@kernel.dk>

On Tue, Oct 22, 2024 at 07:15:07AM -0600, Jens Axboe wrote:
> Tested 1+2 together only, but for those two:
> 
> Tested-by: Jens Axboe <axboe@kernel.dk>
> 
> Thanks Boris!

Thanks too, Jens, for the serious testing effort - very much appreciated!

Lemme queue them.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

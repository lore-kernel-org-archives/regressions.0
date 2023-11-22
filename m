Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC27725741
	for <regressions@lists.linux.dev>; Wed, 22 Nov 2023 11:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="U5M+vWXI"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id D5F9F40E024B;
	Wed, 22 Nov 2023 11:58:41 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 9vIvwcA4Hjr5; Wed, 22 Nov 2023 11:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1700654320; bh=bUGVHjUPksg/8UpmwAaAcEYvojtJjumiv8pZ1+4lVqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U5M+vWXIZp7eojrASnpsDv1LeCHjQVagHx2EEwQLOTC4KLQDZXENy7uZbjJME7zCj
	 5QgqPtWvPisRTKX+xleEWDnPNuwOoifB7hEXRp1hpAcA3xolGGfnE9TklEt0HnLbS7
	 Xn8lp/RG98dHBWj4T5gzgDNcsN68gh+zXKeD1QApI4113kj+evXLcZRP91vBUYdjtQ
	 mcsO9J8Ol8uhuGIEZeUsZXt7ogfFGl7zTBsQKtaPC4tx8001HXAmkC9FshKQrbPFOr
	 j5tQrnOnvVqilF3+Y2hoMRPyd4SLRmRPHlwNo2sAifMqLW4I1LfIDGFll38w0qaBUj
	 1xTlE/ErqrLFHKMZ1LA5T0dXwyp0vFQEjaEbfG27v/wpu8nSXGWWShAsJadHwcmDaC
	 HhGm/6KSnKLRbyQnmyVM/M8rmXO3M+KwSxqLdTbJ05N8qNGtlLDnd5B9D1ccISDOyK
	 oRPq7dZNmwAGiWukPNbLpV43bvk6o3QGVLa6j0rCxdPzd8agRZ9CgSALVENunOPI58
	 mnlv8OVbsPV9AVh/JIi6+f6005UGjz+rjIyOrKhX9SVOXh1BrIpw5D7MXKAR35vlCg
	 knLbdLzcEKPmDx9WQ+ief/QZTPg519eU+xgmtWEDr5WbUtUJvBw+Qtq/jjF0z/7o1i
	 l1dCd4fpT83L2kToZwkUHDxU=
Received: from zn.tnic (pd95304da.dip0.t-ipconnect.de [217.83.4.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id CC67A40E0032;
	Wed, 22 Nov 2023 11:58:30 +0000 (UTC)
Date: Wed, 22 Nov 2023 12:58:26 +0100
From: Borislav Petkov <bp@alien8.de>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: lukas.bulwahn@gmail.com, dave.hansen@linux.intel.com, hpa@zytor.com,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	mingo@redhat.com, tglx@linutronix.de, x86@kernel.org
Subject: Re: [regression] microcode files missing in initramfs imgages from
 dracut (was Re: [PATCH] x86: Clean up remaining references to
 CONFIG_MICROCODE_AMD)
Message-ID: <20231122115826.GAZV3s4krKXI002KQ0@fat_crate.local>
References: <20230825141226.13566-1-lukas.bulwahn@gmail.com>
 <c67bd324-cec0-4fe4-b3b1-fc1d1e4f2967@leemhuis.info>
 <20231112181036.GBZVEVHIIj/Oos1cx4@fat_crate.local>
 <0e9cbe6f-ac6c-47f2-b663-a22568799eca@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0e9cbe6f-ac6c-47f2-b663-a22568799eca@leemhuis.info>

On Wed, Nov 22, 2023 at 10:15:42AM +0100, Linux regression tracking (Thorsten Leemhuis) wrote:
> [1] unless you fiddle with things obviously internal; not sure if this
> case would qualify for him, but somehow I doubt it -- but I might be
> wrong there.

Well, think about it - by that logic, if CONFIG_* items are an ABI, we
will never ever be able to change any of them. Now that would be awful.

> Any progress on this?

We're thinking...

We might need an official scheme of stating what any given kernel image
supports for use by external tools which need it.

> BTW: I see that this could help preventing problems like the current one
> to happen in the far future. But how would that help the current
> situation (e.g. users that have an old dracut and updated the kernel
> without updating dracut)?

Update dracut too?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

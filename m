Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81D820324
	for <regressions@lists.linux.dev>; Fri, 24 Nov 2023 13:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="VgtZq6KQ"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id AC45240E014B;
	Fri, 24 Nov 2023 13:33:21 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id CrGWTkziUr9r; Fri, 24 Nov 2023 13:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1700832799; bh=w+1h3XcQec6hnBfJxjtY0dTxW6Fy4sAIPStF97Z6TdE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VgtZq6KQ7tRZoxiNg4OkbS0VyLYUXaY27B1u+uU7AtXGvuH4n+D70LXlngl8IJC2R
	 z2fFNeoRExQdJEAmXRuqd4Um/LxAF8cPNxh98/nvKwrQsm1dGH/mw+R4iRzxx72LoQ
	 o3pG7eDUn2vV+CWB1yU+juz9OglaJVMZ5Z9bhgv6fyZXnELT1yJfdUuTKRdNIECXiH
	 FuETL7nZXPuhpFA0fczveLvFgb8rzL6ZaLsVdOKC/t6xRTbVXET0NxjFWBWlaWMqLO
	 q23sDcMuinoXSL9osGrLGdxum1Sy86MD6v/Vgh+sO2e23KDENGg1XOIPCZ7wb02K3f
	 Qog9MHBoj304uQNIGWMUX9/K3FsobxXPMu6jx/cBevIdHDKm9Lr8HYvpgXpwdtw/qH
	 ES0rFyuw33BiVS8OIUljOtWGySi92wvGpm/jJBhdLh3lZYjoM9hGh90Jj/dbxhf5DA
	 hXEgdxHbdA6gbKpFK7liRmGEhUcxvtcdM3CEk8RwEFtlXstKVx+XFHxkLI32QVqx+Z
	 6Rrzfogy8zVXMALqE9xZxdmlcJ64s1mrXqccHjUvdDW+dnb80A5v4lDZyWrYFb7K8+
	 nbpx1HewW1jdQGPDCPLDFSCvA2UNvSsMXK4l8fWO1EI6XNBfoUWti0k/BSex9mOlDQ
	 EF+7NuvA9qUPH72kl88oclq0=
Received: from zn.tnic (pd95304da.dip0.t-ipconnect.de [217.83.4.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id E870C40E01A5;
	Fri, 24 Nov 2023 13:33:07 +0000 (UTC)
Date: Fri, 24 Nov 2023 14:33:03 +0100
From: Borislav Petkov <bp@alien8.de>
To: Antonio Feijoo <antonio.feijoo@suse.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Linux regressions mailing list <regressions@lists.linux.dev>,
	lukas.bulwahn@gmail.com, dave.hansen@linux.intel.com, hpa@zytor.com,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	mingo@redhat.com, tglx@linutronix.de, x86@kernel.org
Subject: Re: [regression] microcode files missing in initramfs imgages from
 dracut (was Re: [PATCH] x86: Clean up remaining references to
 CONFIG_MICROCODE_AMD)
Message-ID: <20231124133303.GBZWCmD71R5dunBLQ3@fat_crate.local>
References: <20231122115826.GAZV3s4krKXI002KQ0@fat_crate.local>
 <e1ca042c-de1d-4fe3-ad69-51d147b1fe0b@leemhuis.info>
 <20231122155758.GEZV4lBgtZyzsP5Z4V@fat_crate.local>
 <CAHk-=wiV+NM+jLKbSj_Ej9RaXpu4akWV03G_wXyTSHZhArq1tg@mail.gmail.com>
 <20231122205135.GGZV5p157mBi6RYUNs@fat_crate.local>
 <CAHk-=wh03jMZRAxHFTkv0h9dZ6TmiqukzcHd4RTx7ijia_prsg@mail.gmail.com>
 <20231123112013.GAZV81bezsrS6sdJQR@fat_crate.local>
 <66f077cf-ff85-44dc-a76a-05d8995ea261@suse.com>
 <20231124121500.GAZWCTxML94BSYaQf3@fat_crate.local>
 <081ddbc7-8e3a-41c2-b361-3a03dfb3af12@suse.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <081ddbc7-8e3a-41c2-b361-3a03dfb3af12@suse.com>

On Fri, Nov 24, 2023 at 02:15:02PM +0100, Antonio Feijoo wrote:
> The problem I see is having to add a new patch with a new note every
> time a user space application requires new information to query.

Yeah, this is how it should work. The mere addition of the note would
document that userspace uses a certain aspect of the kernel machinery
and then we will know not to break it.

> And also new dracuts will be broken with older kernels that do not
> contain this info.

Yes, the meaning of the absence of the note would be: the kernel doesn't
provide that functionality. If you want it, upgrade your kernel.

> But (from a user space application point of view) if you (the kernel
> devs) are ok with this approach, I don't see why we can at least get
> some info from there.

Yes, my goal is to have some machinery which both sides agree upon and
have that proper contract in place vs you guys using things which are
internal and us breaking them unknowingly.

But Linus isn't that crazy about the note thing so I'd prefer if he
comments on what we should do instead.

> Just follow the Conventional Commit style for the commit messages, but
> that's also specified in the HACKING.md doc.

Thx, lemme get cracking on fancy github workflows. :-P

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

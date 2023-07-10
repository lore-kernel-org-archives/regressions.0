Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37DA111C93
	for <regressions@lists.linux.dev>; Mon, 10 Jul 2023 13:31:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD0B1C433C8;
	Mon, 10 Jul 2023 13:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688995874;
	bh=r3uzmglo2VwngxcYKz0Hb2V4QzJuLn34J6gv1sdtq6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EGabTy3HkgEwfPfjLS2fC2p6cAuqFI6vQe7RdXYvWopgdTZwHYUtr21lo8EhmFE6n
	 xbLAg2RSQfTnai5hFyRfhRgJuu5YjWthVUYuHRerlYqdrPGgnXUi4S09DI1yKVvIRl
	 Nkx745We3eobqLBmpQUGZGn9gpE9PP+HU2Be7tZVtHQO6QOa+FS+VfXYVjW1pryjPX
	 Wd8RjKX4BE4Emi4t9dgLEPckEw99Mb5UTv7e+frqsBevPI38F1+uhmXMPA82Fy6nzC
	 ZqRiQLttUX2fM1Rzc+OuKQ8JTlHoUifgLIJ3uxWGWrLQFWAJ46B9jPaOHEnkJqza3l
	 CC10nbpmFoofQ==
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 10 Jul 2023 16:31:04 +0300
Message-Id: <CTYJ2CJL0T5F.2L84F8XBD3Y6P@suppilovahvero>
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jerry Snitselaar" <jsnitsel@redhat.com>, "Linux regressions mailing
 list" <regressions@lists.linux.dev>
Cc: <linux-kernel@vger.kernel.org>, <linux-integrity@vger.kernel.org>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, "Jason Gunthorpe" <jgg@ziepe.ca>,
 "Peter Huewe" <peterhuewe@gmx.de>, <stable@vger.kernel.org>, "Mario
 Limonciello" <mario.limonciello@amd.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@linux.ibm.com>, "Sachin Sant" <sachinp@linux.ibm.com>
Subject: Re: [PATCH] tpm: return false from tpm_amd_is_rng_defective on
 non-x86 platforms
X-Mailer: aerc 0.14.0
References: <20230629204147.1852823-1-jsnitsel@redhat.com>
 <CTPWGNGECE0A.7MSU6S60YWDK@suppilovahvero>
 <mbbb2mdlmkhnkgmw37glklmllzelolmdvmdgz5pziidromxsh5@gkflot73u6gd>
 <5b9ec275-31b5-7b77-d00b-da128bea8bb3@leemhuis.info>
 <b4lqa5urhgbnvtqon6qgoaftr6ut32mbq4uosugr7w6ar2uqis@lbwodwhrfchs>
In-Reply-To: <b4lqa5urhgbnvtqon6qgoaftr6ut32mbq4uosugr7w6ar2uqis@lbwodwhrfchs>

On Fri Jul 7, 2023 at 11:18 PM EEST, Jerry Snitselaar wrote:
> On Fri, Jul 07, 2023 at 06:07:49PM +0200, Linux regression tracking (Thor=
sten Leemhuis) wrote:
> > Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
> > for once, to make this easily accessible to everyone.
> >=20
> > So what's the way forward now? It sounded like Jarkko wanted to apply
> > the patch from this thread days ago, but that didn't happen afaics. The=
n
> > below message showed up, but Marios patch also wasn't applied.
> >=20
> > Is this intentional, or did something somewhere fall through the cracks=
?
> >=20
> > Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat=
)
>
> I haven't seen any update to Jarkko's repo.
>
> My patch resolves the immediate issue being seen on the ppc system,
> and was mostly just me asking why even go through this amd specific
> code on non-x86 systems.
>
> The vio bus shutdown code only does the remove call when kexec is in
> progress. The pnp and platform bus type shutdown calls do not do
> something similar so maybe the check in Mario's patch isn't needed,
> but I don't think it would hurt to have it in there.

The patch has been applied. I'm sending pull request for rc2 today.

The merge window was a bit conflicting with the summer season, and
also relocating.

BR, Jarkko

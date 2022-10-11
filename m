Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A5573C32
	for <regressions@lists.linux.dev>; Tue, 11 Oct 2022 16:58:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADE7AC433D6;
	Tue, 11 Oct 2022 16:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665507525;
	bh=kFNBiwmKbssuDPu9NgFGsmlWNiBa1U+M30r5cf+PgrM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o/bfNSL1xJ/8KXn84gJKDa6oy6DJuoXYKPGGc5fbuBCexTHt5kKzb0hA2swlY8E5V
	 IMfuby6+u/lJEW1r75F977pVr6AbociGCj2BGkjMo+44RBsOVle/siWma2uxUZ9xmh
	 v2G2p2TJw2Fa4VcP7mKHQbfqID4fF0ujHHwXs7d/hmDiK7qkNqLrEbclb4mp+KrZla
	 Nt0cav0iTD4B5ViQc5/iXZfr/C3dEqmLQuYQQh5nHqthxnNTKPoKauYmlIravs4FqR
	 A9Vd4d7e/Iwjkc1qRUa3E0B+4U+vR+XZA4EX5LVCSTz6S+x15+y+F73R7YJsppOjvo
	 D1np1GmgEh/kA==
Date: Tue, 11 Oct 2022 17:58:40 +0100
From: Conor Dooley <conor@kernel.org>
To: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
Cc: regressions@lists.linux.dev, stable@vger.kernel.org,
	Eva Kotova <nyandarknessgirl@gmail.com>,
	linux-riscv@lists.infradead.org, coelacanthus@outlook.com,
	kernel-team@lists.ubuntu.com
Subject: Re: Regression: Fwd: Re: [PATCH] riscv: mmap with PROT_WRITE but no
 PROT_READ is invalid
Message-ID: <Y0WgwBgenhnk7/O2@spud>
References: <d6c9e249-08bd-4439-7dcc-371b32e7b851@canonical.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6c9e249-08bd-4439-7dcc-371b32e7b851@canonical.com>

On Tue, Oct 11, 2022 at 05:52:13PM +0100, Dimitri John Ledkov wrote:
> #regzbot ^introduced 2139619bcad7ac44cc8f6f749089120594056613
> 
> Over at https://lore.kernel.org/linux-riscv/Yz80ewHKTPI5Rvuz@spud/T/#ebde47064434d4ca4807b4abb8eb39898c48a8de2
> it is reported that 2139619bcad7ac44cc8f6f749089120594056613
> regresses userspace (openjdk) on riscv64.
> 
> This commit has already been released in v6.0 kernel upstream,
> but has also been included in the stable patch series all the
> way back to v4.19.y
> 
> There is a proposed fix for this at
> https://lore.kernel.org/linux-riscv/20220915193702.2201018-1-abrestic@rivosinc.com/
> which has not yet been merged upstream or in stable series.
> 
> Please review and merge above proposed fix, or please revert
> 2139619bcad7ac44cc8f6f749089120594056613 to stop the regression
> spreading to all the distributions.

Out of curiosity, and given the CC list lacks a CC of the maintainer,
who are you actually asking to review and/or merge this?

I'll go bump the fix itself.

Thanks,
Conor.

> 
> In Ubuntu this regression will be tracked as https://bugs.launchpad.net/bugs/+bug/1992484
> 
> -------- Forwarded Message --------
> Subject: Re: [PATCH] riscv: mmap with PROT_WRITE but no PROT_READ is invalid
> Date: Thu, 6 Oct 2022 22:20:02 +0300
> From: Eva Kotova <nyandarknessgirl@gmail.com>
> Reply-To: PH7PR14MB559464DBDD310E755F5B21E8CEDC9@PH7PR14MB5594.namprd14.prod.outlook.com
> To: coelacanthus@outlook.com
> CC: c141028@gmail.com, dramforever@live.com, linux-riscv@lists.infradead.org, palmer@dabbelt.com, xc-tan@outlook.com
> 
> On Tue, 31 May 2022 00:56:52 PDT (-0700), coelacanthus@outlook.com wrote:
> > As mentioned in Table 4.5 in RISC-V spec Volume 2 Section 4.3, write
> > but not read is "Reserved for future use.". For now, they are not valid.
> > In the current code, -wx is marked as invalid, but -w- is not marked
> > as invalid.
> 
> This patch breaks OpenJDK/Java on RISC-V, as it tries to create a w-only
> protective page:
> 
> #
> # There is insufficient memory for the Java Runtime Environment to continue.
> # Native memory allocation (mmap) failed to map 4096 bytes for failed to
> allocate memory for PaX check.
> # An error report file with more information is saved as:
> # /root/hs_err_pid107.log
> 
> I bisected to this commit since on Linux 5.19+ java no longer works.
> Perhaps some fallback should be implemented, to prevent userspace
> breakage. It is currently documented, that at least on i386 PROT_WRITE
> mappings imply PROT_READ (See man mmap(2) NOTES), this would be a good
> place to start.
> 
> Best regards,
> Eva
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 




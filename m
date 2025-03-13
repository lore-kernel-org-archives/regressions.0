Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1988F3E47B
	for <regressions@lists.linux.dev>; Thu, 13 Mar 2025 18:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741888914; cv=none; b=ERmTt2nPOTZ3KBbPGDwJCPkssHfQ9tPo9Z5LuukYA8HN5IBEao6pOHJvtlog86M7mO6EC69AoIErJAQB1EPd4+/BwdQRYCCU6D4aCscng5S/Wz6lTMXHpAlT76WOWZvjurzWk54C+5coZXs9F1aGCPBKXu2XhRstgu4E5dj2qS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741888914; c=relaxed/simple;
	bh=gk1YmeZfXfNeP9J0CeCkpfBYMw9IjsQ6FJ3PjMNfasg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IzkdCQicDvem1g7Rcyx8TJD37ZkC1MmvLOF4oYvaXHj2aVuQ0eZNpfNszh77zK0ljYMSktZODCXgcMwCoSXPxDWNncJd3OHzg+dxYx5/SDFxxy1tW8SsdJeGneX/ous5ZtaDWUnQ/6lAzXS8IAJNp9+a6wXYT65kUdZ8fU0VVDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U5SR6CbH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U5SR6CbH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6E4DC4CEDD;
	Thu, 13 Mar 2025 18:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741888912;
	bh=gk1YmeZfXfNeP9J0CeCkpfBYMw9IjsQ6FJ3PjMNfasg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U5SR6CbHPxBDya1J8xlY8fFcrME2dOJppx0iScFOKlI498m7xmNAgF/t5xNSH5mWi
	 LBv1Jv1SGfTNiVshPR4mArkx1GV2trJXrI+us3eZkz3xiKTPk3masp5I9YrwncgKfA
	 UbenxqJIDJGFFTB+/Wqkmr6WguY8fTWWfJ9D4IE0UOR6X/RbglA2NFpJaTPab2/0iR
	 Dv/bk0OIWka73nMt+kDP1kr4jqoq+JXp19I5h9j1iA4ONMPzWYr6ysLhGdzvwUA/h1
	 fKmzFSeAjG1QSjMYBV/fNW00kIxuPKMxaxLDPCwydpKltnoehwhf3JAFqZ4YTbJ7ZA
	 iQSENHeufZCRQ==
Date: Thu, 13 Mar 2025 19:01:48 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Akihiro Suda <suda.kyoto@gmail.com>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux x86 <x86@kernel.org>, aruna.ramakrishna@oracle.com,
	tglx@linutronix.de
Subject: Re: [REGRESSION][BISECTED] x86: kernel 6.12 crashes during
 get_xsave_addr_user on Apple Virtualization
Message-ID: <Z9MdjKI1IDgwMn5D@gmail.com>
References: <CAG8fp8QvH71Wi_y7b7tgFp7knK38rfrF7rRHh-gFKqeS0gxY6Q@mail.gmail.com>
 <3f4758be-df0e-44f3-b259-af02a2d7b3b3@intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3f4758be-df0e-44f3-b259-af02a2d7b3b3@intel.com>


* Dave Hansen <dave.hansen@intel.com> wrote:

> On 3/11/25 07:35, Akihiro Suda wrote:
> > (...)
> > [    0.477064] Run /init as init process
> > [    0.478585] ------------[ cut here ]------------
> > [    0.478747] WARNING: CPU: 0 PID: 1 at
> > arch/x86/kernel/fpu/xstate.c:1003 get_xsave_addr_user+0x28/0x40
> > [    0.478893] Modules linked in:
> > [    0.478999] CPU: 0 UID: 0 PID: 1 Comm: init Not tainted
> > 6.11.0-rc1-00007-g70044df250d0 #15
> > [    0.479148] RIP: 0010:get_xsave_addr_user+0x28/0x40
> 
> The warning here seems to be because the kernel thinks protections keys
> is enabled (X86_FEATURE_OSPKE) but also thinks XSAVE management of
> protection keys is _dis_abled. That's a valid hardware configuration,
> but it's a configuration the kernel never expects to see.
> 
> New kernels care about this more because we effectively have new code
> that does:
> 
> 	if (cpu_feature_enabled(X86_FEATURE_OSPKE))
> 		get_xsave_addr_user(XFEATURE_PKRU, ...)
> 
> Is there a chance that you have a _full_ dmesg from one of these
> systems? I'm looking for the "x86/fpu: xstate_offset..." lines. It would
> also be interesting to see a CPUID dump on a booted system from before
> the patch that started causing issues and maybe even on one with one of
> the workarounds applied. You can get that with:
> 
> 	cpuid -1 --raw

I'll hold off on the fresh x86/urgent commit I applied earlier today 
until this bug is better understood.

Thanks,

	Ingo

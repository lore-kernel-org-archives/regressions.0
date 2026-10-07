Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049D82F616A;
	Wed,  7 Oct 2026 06:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791353518; cv=none; b=MWD5yG2CGSmpBsIw15nC8o2YwACJEVXFEjkMJj4teIGOSQWKHxci0VYBjtISf7hHa55TcctzyexZrsBpQaV6lrCykLH4CFap3Sad+U2VlDfODZa78cLDw98BFkDRpvd1lD3XjQHpjTzn5jdJOWay+Puc622Kw65awrMP9xQleFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791353518; c=relaxed/simple;
	bh=RiidPASTt6jyBz3Coh9BgHlpFZQ3PdK4p4NxzKF6bVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aZ9CCCyhNBov7pxfkjCkw2d3mrLqvI4nXS+0rCXLIH2xe99PlsxVd2NWf0KmyyohDngKbBVf4W59QpExbwgJ3tNWXG4lRDyP6EMD+x85fzS3goMfs0JYwhdRj3n2qy2NmrHH7O8ZjVRcCqUQDwGFtTiXFhip+QZrCSmEHzURkyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GUXRZ7/p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GUXRZ7/p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 788F71F0089B;
	Wed,  7 Oct 2026 06:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791353517;
	bh=SHTNYtREyl/jHXCf21L5IlTPz5bWxE9lwwBn75z0B7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GUXRZ7/pbe/AJpkN5e5FcdLKuJgDihokRM9FwbQxVdtvp+2LRSkZRdVJpTE58W4V6
	 NadEbJJreUG5ZHlSm5lZ/kScR9TQREkuTlYMfmadYLCnnhcsFnoxqr2OiLnEUNZWuq
	 ezVr4PgORcyU4YJMkI9wQr6DJOzeoucauYENm7ogq5W1+ZswY3InNw/cE9J6Qp5m7D
	 cvQCMK5tlmnYwkiHKEmF5ux/U5Wfqstw1sIxE2ErO9W6TbmevR9YrLXjkXZrkcTvuD
	 NW0AbPYQSCmA2pBAFsyhQ7q7ZYL7z/j4tXZa8uou3/iBwv4XtuDPfDM2G1wFOlRTFC
	 ONz6uDRN7u2yA==
Date: Wed, 7 Oct 2026 08:11:50 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Chris Bainbridge <chris.bainbridge@canonical.com>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Jason Miu <jasonmiu@google.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Alexander Graf <graf@amazon.com>,
	Ran Xiaokai <ran.xiaokai@zte.com.cn>, regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org, kexec@lists.infradead.org,
	linux-mm@kvack.org
Subject: Re: [BUG] KHO handover hangs when memmap reserves PMEM
Message-ID: <asXipik00P2Oa1Zo@kernel.org>
References: <asE0R_f2r2TL-3Sy@px13>
 <asTTo3AFzQoqZLoP@kernel.org>
 <asU2AD6DxGSD0ek4@px13>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asU2AD6DxGSD0ek4@px13>

On Tue, Oct 06, 2026 at 07:02:22PM +0100, Chris Bainbridge wrote:
> On Tue, Oct 06, 2026 at 12:55:31PM +0200, Mike Rapoport wrote:
> > On Sat, Oct 03, 2026 at 06:02:27PM +0100, Chris Bainbridge wrote:
> > > Hello,
> > > 
> > > I am reporting a regression in KHO handover.
> > > 
> > > In the most recent Ubuntu 26.10 beta mini-ISO releases (2026-09-18 onwards),
> > > the first kernel reserves RAM for the downloaded ISO with a memmap directive
> > > such as memmap=<size>!4G, then kexecs a second kernel. On affected kernels, the
> > > first kernel reaches "kexec_core: Starting new kernel", but the second kernel
> > > produces no further output and QEMU spins at 100% CPU. On unaffected kernels,
> > > the second kernel starts and finds /dev/pmem0 with the expected "Persistent
> > > Memory (legacy)" range in /proc/iomem.
> > 
> > TO make sure I understand this correctly, you enable KHO in the builds of
> > the installer kernel and then the installer command line explicitly enables
> > KHO.
> 
> Yes.
> 
> > Is there anything you actually preserve with KHO when kexec'ing the second
> > kernel?
> 
> No. kho=off is a valid workaround for the mini ISO.

I'd even say that setting CONFIG_KEXEC_HANDOVER_ENABLE_DEFAULT=n and even
CONFIG_KEXEC_HANDOVER=n is a reasonable choice for a distro kernel.

We don't have CONFIG_EXPERIMENTAL anymore, otherwise kho and luo would be
gated by it.

> I only reported it as a regression here because this was working until
> the bisected commit was merged. If this is intended behaviour then it is
> not a problem.

Thanks for the clarification. 

This is a bug, but since it happens for a combination of an opt-in option
(kho) and a hack (memmap=) I consider it low priority.

-- 
Sincerely yours,
Mike.

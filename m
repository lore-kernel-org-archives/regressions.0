Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD46359A90;
	Tue,  6 Oct 2026 10:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791284139; cv=none; b=YLZQDZBYnx7+RjTldMDTu1TKQ/6EsGXE1Z2j+qxYjJ9W6+h4cTlHatENCGbedQwkCRIbCtpCyTJk0dYeZhQxbGP9Ht+OLvcxIfrGT7iERzm+nLDQeeuLo/ofSDHUOQK9FnzpWivg3ft1OZvnjXPSOzr1Me9vcMvtDdSkNp6kl2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791284139; c=relaxed/simple;
	bh=QswR61fFgfDbiAxoL7C9VuIxx4/ZSsY+LNxRgq6XVzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U3FxrBiTEYrRFNGREZT0zR3CK5yeLdKzlP6qRrKTiSlzXuQyGTntwbv3GdFRoVkF9Vid5BLyBqmI4Raxx5KEGs+Bc3wBWI8gFc7gfoW4eUShaZ622lxFdm0jUfYYaC8yzxt0laJf2pskYqID7qbKhuToyfpxEZLVgOguU4y4Tec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZkLF6Z6y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZkLF6Z6y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9D441F000FF;
	Tue,  6 Oct 2026 10:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791284137;
	bh=OcCKnJg82xr9zF1ktKP69bSPFjVHrRcr9zQM04SRH+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZkLF6Z6yRuA0I5reP8kGotSor41YH90MFptgbXyAQyRUjxpBD9oMtj1zSV/FNC2oU
	 CYDRJLmfE4I71/SvJCnM/5akyVm4xTTU9VMpw7g+zdp+5oKKh3eWgttV9+uBZZpmJM
	 o0bSBlzKt+adSFrWTHVI+x/xlptnB309hbakpFO+7pfXxIvAWVDZkrctXR5mG/ov/4
	 0M15a1mbjvAENfjS7v4PuhgZWg2ozzW0zLI4G/Ym6r2namKefZDDNtPpJxKA/UpwK3
	 dIaLltqn9eMi1gDxQWZakHU/r9wTW2vww3kQ5AcJFAxff/hTSNmNUxZN+bUt6NJB4f
	 mMq7B9LO5riaA==
Date: Tue, 6 Oct 2026 12:55:31 +0200
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
Message-ID: <asTTo3AFzQoqZLoP@kernel.org>
References: <asE0R_f2r2TL-3Sy@px13>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asE0R_f2r2TL-3Sy@px13>

On Sat, Oct 03, 2026 at 06:02:27PM +0100, Chris Bainbridge wrote:
> Hello,
> 
> I am reporting a regression in KHO handover.
> 
> In the most recent Ubuntu 26.10 beta mini-ISO releases (2026-09-18 onwards),
> the first kernel reserves RAM for the downloaded ISO with a memmap directive
> such as memmap=<size>!4G, then kexecs a second kernel. On affected kernels, the
> first kernel reaches "kexec_core: Starting new kernel", but the second kernel
> produces no further output and QEMU spins at 100% CPU. On unaffected kernels,
> the second kernel starts and finds /dev/pmem0 with the expected "Persistent
> Memory (legacy)" range in /proc/iomem.

TO make sure I understand this correctly, you enable KHO in the builds of
the installer kernel and then the installer command line explicitly enables
KHO.

Is there anything you actually preserve with KHO when kexec'ing the second
kernel?
 
> A source bisect identified 3f2ad90060f6 ("kho: adopt radix tree for preserved
> memory tracking") as the first bad commit; reverting it at the bisected
> revision restored the handover. The regression appears related to KHO metadata
> being accessed after the receiving kernel's memmap directive changes how the
> metadata's physical range is mapped.
> 
> #regzbot introduced: 3f2ad90060f6
> 
> I have an AI-generated candidate fix that changes 22 files. I have not attached
> or published it: although the AI did extensive verification on both x64 and
> arm64, I cannot review or explain the complete change, so I am not submitting
> it as a fix. If one of you thinks an unreviewed candidate would be useful for
> further analysis, please let me know.
> 

-- 
Sincerely yours,
Mike.

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF6C362
	for <regressions@lists.linux.dev>; Fri, 10 Jun 2022 05:15:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47FC6C34114;
	Fri, 10 Jun 2022 05:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1654838106;
	bh=iwIrhyG/TU5w7j278ppgaovsn29ziyLEO7pflJmV+88=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hwmx0zvnLX0SAD+FpXG1Qa4+DD2PiZt3gZTB0ziKNx0YJ8T85ENtElQstdDUUl5m/
	 uD0s96rRPn3I/uHWcbGfAO3OqE8ZjJWAt4GKY3gP7k14Ti3PU3PIKw3RNu1YMC2Jmf
	 KZMl3FlJpuAr8L43/cjY7S5rSPSSH2LPpo9QqFkI=
Date: Fri, 10 Jun 2022 07:15:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Oleksandr Tymoshenko <ovt@google.com>
Cc: keescook@chromium.org, sarthakkukreti@google.com, snitzer@kernel.org,
	stable@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH 5.4 26/34] dm verity: set DM_TARGET_IMMUTABLE feature flag
Message-ID: <YqLTV+5Q72/jBeOG@kroah.com>
References: <20220603173816.944766454@linuxfoundation.org>
 <20220610042200.2561917-1-ovt@google.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610042200.2561917-1-ovt@google.com>

On Fri, Jun 10, 2022 at 04:22:00AM +0000, Oleksandr Tymoshenko wrote:
> I believe this commit introduced a regression in dm verity on systems
> where data device is an NVME one. Loading table fails with the
> following diagnostics:
> 
> device-mapper: table: table load rejected: including non-request-stackable devices
> 
> The same kernel works with the same data drive on the SCSI interface.
> NVME-backed dm verity works with just this commit reverted.
> 
> I believe the presence of the immutable partition is used as an indicator
> of special case NVME configuration and if the data device's name starts
> with "nvme" the code tries to switch the target type to
> DM_TYPE_NVME_BIO_BASED (drivers/md/dm-table.c lines 1003-1010).
> 
> The special NVME optimization case was removed in
> 5.10 by commit 9c37de297f6590937f95a28bec1b7ac68a38618f, so only 5.4 is
> affected.
> 

Why wouldn't 4.9, 4.14, and 4.19 also be affected here?  Should I also
just queue up 9c37de297f65 ("dm: remove special-casing of bio-based
immutable singleton target on NVMe") to those older kernels?  If so,
have you tested this and verified that it worked?

thanks,

greg k-h

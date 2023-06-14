Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9179C2EC33
	for <regressions@lists.linux.dev>; Wed, 14 Jun 2023 20:57:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AD6AC433C0;
	Wed, 14 Jun 2023 20:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1686776275;
	bh=z8ZWQft7AssxeR6/feMvU6173/9CccnopUSVjMhA2QQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mU6hGO6lTmOkAkoLNQPzsW2QHp70Ftpd02pGjXzMS8NX40NT35kSsODWWNlhoj/KO
	 YIJas8s2b/gwFa+40fWRRJZXcfgGzC364xcSBM/+q6pEaf3hBh/oOasWH6iA/cr12i
	 Nhr8POPgfmX3+w6ZUhRCmBbBZdnYnPAVfDRLm7nQ=
Date: Wed, 14 Jun 2023 22:57:52 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Robert Kolchmeyer <rkolchmeyer@google.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, kafai@fb.com,
	ast@kernel.org, sashal@kernel.org, paul@isovalent.com,
	Meena Shanmugam <meenashanmugam@google.com>
Subject: Re: BPF regression in 5.10.168 and 5.15.93 impacting Cilium
Message-ID: <2023061453-guacamole-porous-8a0e@gregkh>
References: <CAJc0_fwx6MQa+Uozk+PJB0qb3JP5=9_WcCjOb8qa34u=DVbDmQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJc0_fwx6MQa+Uozk+PJB0qb3JP5=9_WcCjOb8qa34u=DVbDmQ@mail.gmail.com>

On Wed, Jun 14, 2023 at 11:23:52AM -0700, Robert Kolchmeyer wrote:
> Hi all,
> 
> I believe 5.10.168 and 5.15.93 introduced a regression that impacts
> the Cilium project. Some information on the nature of the regression
> is available at https://github.com/cilium/cilium/issues/25500. The
> primary symptom seems to be the error `BPF program is too large.`
> 
> My colleague has found that reverting the following two commits:
> 
> 8de8c4a "bpf: Support <8-byte scalar spill and refill"
> 9ff2beb "bpf: Fix incorrect state pruning for <8B spill/fill"
> 
> resolves the regression.
> 
> If we revert these in the stable tree, there may be a few changes that
> depend on those that also need to be reverted, but I'm not sure yet.
> 
> Would it make sense to revert these changes (and any dependent ones)
> in the 5.10 and 5.15 trees? If anyone has other ideas, I can help test
> possible solutions.

Can you actually test if those reverts work properly for you and if
there are other dependencies involved?

And is this issue also in 6.1.y and Linus's tree?  If not, why not, are
we just missing a commit?  We can't revert something from a stable
release if you are going to hit the same issue when moving to a new
release, right?

thanks,

greg k-h

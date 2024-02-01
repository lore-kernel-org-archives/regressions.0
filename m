Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6032F5F470
	for <regressions@lists.linux.dev>; Thu,  1 Feb 2024 14:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706799448; cv=none; b=n0Bz2jQrj1dr7PWXT6JgSaErJa5iI7gc5YLQAr6SmeSbZ0QLz+15bHgnvgJAGdlJcDGm6Vus+/V9GMvyQnGXeX3yoC5V20JdEsyvD3crpdrlDK2FdMY6uAygcw1349CA+KwPhTTO5GQ3uD91joPb+Cjz7OB3AW27wreyfRtxLqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706799448; c=relaxed/simple;
	bh=vOnNLgQvFZT/mX3ECw6fr4mBPUYw8qLvXjsyK/by+NQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BUwIOkPj1mQO4Dvv4pXl7SUj4VJMTdw3doo+t8RXTYdoi1apCfRK74Yydan/dE7qYEF6k68Sw1OFvqM8jvgm5gqlHLGR/S5T5VnDxdhL/AZAwVNY/End4g5cDE/1LAqrHxdiScu+6KvppnPcCcxsGWEXKzWagRu1gy4iy7OqyPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qMhqFRP1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qMhqFRP1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68A83C433C7;
	Thu,  1 Feb 2024 14:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706799447;
	bh=vOnNLgQvFZT/mX3ECw6fr4mBPUYw8qLvXjsyK/by+NQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qMhqFRP17RDQlAlhumDhCYoyMRgklZKoleBAEsBEEQXq0jxy3nKeIi31XAihLZu5S
	 e5kUoQATJ9bidl5A0gMB6N+IEqzRSS8DFBa5y5eEB+bXTN+/70wnQVidaHeAs7EJyp
	 DEBP6JlFBC3zoT7Cdpk9RZorLeOItHDC2Gj0bDQ3VFoVoAg7XShDX+UZMflkriPGuR
	 P1AeN492hm+5b7xj9SP0OzgyfcuelVp+L6RYAnaE//PP0+3KsJqNpBeAv5C+jcjR2o
	 rJDimDgRIZUJ6HfbYkfa0zuBWCvbqA5RN6kRpYz9jFldzSLdczy8LYzFv7lGhmMz5m
	 SigGdmyUkLHGQ==
Date: Thu, 1 Feb 2024 06:57:26 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Jesse Brandeburg <jesse.brandeburg@intel.com>, Dave Ertman
 <david.m.ertman@intel.com>
Cc: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>, Linux regressions mailing list
 <regressions@lists.linux.dev>, Jaroslav Pulchart
 <jaroslav.pulchart@gooddata.com>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 Igor Raits <igor@gooddata.com>, Daniel Secik <daniel.secik@gooddata.com>,
 intel-wired-lan@lists.osuosl.org
Subject: Re: [Intel-wired-lan] [REGRESSION] Intel ICE Ethernet driver in
 linux >= 6.6.9 triggers extra memory consumption and cause continous
 kswapd* usage and continuous swapping
Message-ID: <20240201065726.50a0b1f2@kernel.org>
In-Reply-To: <898b6ac8-186d-4675-a1e7-abd78b885d01@leemhuis.info>
References: <CAK8fFZ7Xi3=1HFY400firmpRWzHDPsi90cUU5bjOkF00KNZWeA@mail.gmail.com>
	<bce78734-d359-499b-9693-05549e6a73a4@intel.com>
	<CAK8fFZ6PqCwgt1n4iuROs=76esQVSOS-HHL=0eN7+efeKT25Uw@mail.gmail.com>
	<898b6ac8-186d-4675-a1e7-abd78b885d01@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 24 Jan 2024 15:29:38 +0100 Linux regression tracking (Thorsten
Leemhuis) wrote:
> >> I think that's a bad bisect. There is no reason I could understand for
> >> that change to cause a continuous or large leak, it really doesn't make
> >> any sense. Reverting it consistently helps? You're not just rewinding
> >> the tree back to that point, right? just running 6.6.9 without that
> >> patch? (sorry for being pedantic, just trying to be certain)  
> > 
> > Reverting just the single bisected commit continuously helps for >=
> > 6.6.9 and as well for current 6.7.
> > We cannot use any new linux kernel without reverting it due to this
> > extra memory utilization.  
> 
> Quick query: what's the status wrt to this regression? Looks like
> nothing happened in the past week.

Is someone working on this? Indeed the commit in question looks
harmless but can't argue with the revert helping :S

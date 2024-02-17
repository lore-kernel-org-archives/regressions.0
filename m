Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A94B22094
	for <regressions@lists.linux.dev>; Sat, 17 Feb 2024 13:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708176657; cv=none; b=kiZ5MGj4ZZvuK0DbmY147CHHlqf4B0eNUFvNxYLXl2lODyRg40CkMd/sf4vTTPlG/lEdQpQfNDeacajuhe9AkafRMNXdjVm8JRf4iq76rthIOlheTqav1ib6oLmovV/380jnmCa2vp7YEDdktDnCTOut3ef+kR9aaNT7NAkMJ7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708176657; c=relaxed/simple;
	bh=E0gdvspQj6T8uaaCIzG52jj0cMQSbX70hJu4Q2sde6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dQTLaJcdexH727o7W3LH31SccaULM8OJO0FHWJUVzET+vkyCJiRo/Vrf7jrLRrXc/qTQJd4BX1PQjxRLGoldTZpGOl2K9IWn6EAWOXon8URovqvNQUA6zAiA9glpwA13gxHwspzMhv9m5wAEwrCjiCokh78Jfl+NelCmL0Sq4RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=R3ZyYGCD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="R3ZyYGCD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC41DC433C7;
	Sat, 17 Feb 2024 13:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1708176657;
	bh=E0gdvspQj6T8uaaCIzG52jj0cMQSbX70hJu4Q2sde6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R3ZyYGCDPGn7DKZiUZNNicQ8p7H50QB8j//VnLCj5N83wTHYxE79hQ1fJWjDVRD+/
	 ge5iuCrQTNEk3OnwzD5VJ7wRaFZNoX5ivzTSjgDoqWnYT0pHD7HpeS/srIoJqHg33k
	 H/HYiX2bzYIwQ2jXuusE1YGwfnr1e5tepPlb+3gk=
Date: Sat, 17 Feb 2024 14:30:53 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Roman Benes <benes@riadoklan.sk.eu.org>
Cc: regressions@lists.linux.dev
Subject: Re: Kernel 6.7+ broke under-powering of my RX 6700XT. (Archlinux,
 mesa/amdgpu)
Message-ID: <2024021732-framing-tactful-833d@gregkh>
References: <ae64f04d-6e94-4da4-a740-78ea94e0552c@riadoklan.sk.eu.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae64f04d-6e94-4da4-a740-78ea94e0552c@riadoklan.sk.eu.org>

On Sat, Feb 17, 2024 at 02:01:54PM +0100, Roman Benes wrote:
> Minimum power limit on latest(6.7+) kernels is 190W for my GPU (RX 6700XT,
> mesa, archlinux) and I cannot get power cap as low as before(to 115W),
> neither with Corectrl, LACT or TuxClocker and /sys have a variable read-only
> even for root. This is not of above apps issue but of the kernel, I read
> similar issues from other bug reports of above apps. I downgraded to v6.6.10
> kernel and my 115W(under power)cap work again as before.

Any chance you can use 'git bisect' to figure out the offending change?

thanks,

greg k-h

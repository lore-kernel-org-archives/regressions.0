Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A59389DEA
	for <regressions@lists.linux.dev>; Tue,  7 Apr 2026 06:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775544590; cv=none; b=B0iInZK7cc7/xfywr0qLfiGWAaF4EhiPRlmLWCBoUYUt1nWOcSsmGtnVXM9kp1Jh16wTn19uxT94otvEusBfEeLWuN19hfFIAHNWGEWA0usGNH2sBBBfTILsgmvpj2Q1l+32N5wCIq0CjmajefuFA+i7vNuRpMmoxWF4KgyFpmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775544590; c=relaxed/simple;
	bh=gFJc72gzjeWym+kAAUuqwTwd7gPWnlWBL/64GbkBuOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mw8SMQbSgJmBLR4GsGCQsrpOimZC1ce+9tAFWAv/l64EeKghbYS3pCsldKglDP0wP/2+6SP6jGwMxhvEgfJ9g/yKsYxxa2ZA9z6EfDAjSAB8W/gan0ZNRh5R7i8fKbUFIvu3BEXSklHxObMT87sBopXA0l2pZ9Ltwx7Jx51FyxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ILl/OYje; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ILl/OYje"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 711BBC116C6;
	Tue,  7 Apr 2026 06:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775544589;
	bh=gFJc72gzjeWym+kAAUuqwTwd7gPWnlWBL/64GbkBuOE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ILl/OYje/eieAZTY6cAU9IwUZx/csLKYl+Bv54ccjC5L8l5JAs/crxARRB01n/LUm
	 7MCE1Z2BAGbCOKsCsODYWOgSw9MUrSAFmCA6gt9jfiRjw9BGKW/tj5sLeSV0fGu5BK
	 CkTfzMfqTrKraL/KompoAHD5yqA5EGDH4mpzTVMI=
Date: Tue, 7 Apr 2026 08:49:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Fischer, Simon" <simon.fischer@ipp.mpg.de>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: AW: Lowspeed USB device enumerationg under 5.4.288, but not
 under 6.8.1
Message-ID: <2026040728-stubble-punctual-22ba@gregkh>
References: <8a29db20f78046578e8dc2c516607240@ipp.mpg.de>
 <2026040255-zone-chamomile-964f@gregkh>
 <dbb6846930a044558a52201d5d53a851@ipp.mpg.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dbb6846930a044558a52201d5d53a851@ipp.mpg.de>

On Tue, Apr 07, 2026 at 06:33:14AM +0000, Fischer, Simon wrote:
> Dear Greg, dear all,
> 
> the same behaviour is still present with kernel 6.19.11
> 
> Anything else I can try/provide?

I'm sorry, but I have no context here :(

greg k-h

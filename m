Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1D83BED6A
	for <regressions@lists.linux.dev>; Thu,  2 Apr 2026 16:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775146203; cv=none; b=asIFDlSrtFFr8YHhwrXpv6vjjcUc/Lw9i0MdEz8S+5iQtE5hH2X7NwPLayMjVOLN+r/1TqwaIHc9r8PU6iGc2DuOH1YvBwLbrIOiFKEe/XNw8mpm+IT93cm30XxjNCKbne/1e19yValGurm0A6IBLwVsc6fjiPW9APn9NHDD8BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775146203; c=relaxed/simple;
	bh=o7FND2D4pFIz7VxcGBur+zmGez+Cubo/KfQ2ZYpTcm8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XBXuk4TCe8FqYcsPhp+Wd+mYPnQ0TsQy44CggGTMPh38UbEtWquiuIKskK+1mDJ+4s+mZlk/Wq7htF2yWYQHJ3OnmsGc9oq9b0ZAyuf+DGl1qDGCyOYH1K7maQ1uQVeiKwIdwgBESpv8+Srx8wHzL3ic0jNLqdY0fDspepSQgMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zpbAOnKR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zpbAOnKR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC164C116C6;
	Thu,  2 Apr 2026 16:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775146203;
	bh=o7FND2D4pFIz7VxcGBur+zmGez+Cubo/KfQ2ZYpTcm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zpbAOnKRO/JmqHvs0/mUc6muY9ts6yPW07So2u2GcQ4X61Nm5Uj5jbKfSbHqwfOMh
	 AzG6R+5Q+9rxkx3qBqlh0+CZUcecR3XhoV0PSecZNiQ7XxrVMwz2xR0TFJIhYJEOXp
	 uxTRAoIzI9CRlOcqCEPiyugd2g2Div3K+or0Eh/Y=
Date: Thu, 2 Apr 2026 18:10:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Fischer, Simon" <simon.fischer@ipp.mpg.de>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: Lowspeed USB device enumerationg under 5.4.288, but not under
 6.8.1
Message-ID: <2026040255-zone-chamomile-964f@gregkh>
References: <8a29db20f78046578e8dc2c516607240@ipp.mpg.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a29db20f78046578e8dc2c516607240@ipp.mpg.de>

On Thu, Apr 02, 2026 at 03:34:35PM +0000, Fischer, Simon wrote:
> Dear list,
> 
> I've tried to dig deeper into the issues, tried different quirks and small patches, but was unable to solve this or find the root cause. As this seems to be a regression of 6.8 from 5.4, I hope this is the correct list?

6.8.1 is not supported by anyone but canonical, so there's not much we
can do here, sorry as that is a very old and obsolete kernel missing
tens of thousands of changes.

Can you try running the latest 6.19 release instead?

thanks,

greg k-h

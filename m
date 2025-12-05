Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8253F286A9
	for <regressions@lists.linux.dev>; Fri,  5 Dec 2025 06:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764914804; cv=none; b=KVOZ+oz1nQQHxLYLdX2uh4wV7SBDGR4cV9dUHXVECJzCSwgGnqde1GX1x1Fjl7yFwBrksnkmBxxzTH57rKce2zWMkpJVA/OEgmLESSPpPCMGMpRKEhXk1zFm3P3XtyvwftscqvatLCAydf9b/79CLrOg2oqvhVzu4RcjFH2kUfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764914804; c=relaxed/simple;
	bh=8W91c8wd/DsgbNxhs+Sjj+LaSwD9Otdr4rd3xDJyci4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kZeNybmWwBOY4+5knBStjsyn6LDChzWa1vW0a7ztgHWSAq5Jl69/WpFXWbFsR2XWVg4g6aPCFo6rEG+DZzoNSikFA8QELZe+UoSbZWDClATiA7PZHOEG+6eVgtGbdzV/w9i1nboZHqua9a+ZZr+IXkPeiBjsHU/UvxsgFwM0QIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WCNYY0IT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WCNYY0IT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 908EEC116B1;
	Fri,  5 Dec 2025 06:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764914804;
	bh=8W91c8wd/DsgbNxhs+Sjj+LaSwD9Otdr4rd3xDJyci4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WCNYY0IT0+w9xH/iRYtZr8Cvu/SBmM6sGC3bOrTZHv7KVXJwIrzBgDCavbt33+NUD
	 UmGRiaeuROnaOsz53koP828/rudpWdAN5IHmMg80PznHvVcQ6YP1+oO/HsZrLCY68J
	 lOg91XbzlbhLUCcJtdBLPA5saWMh2VSkao6A7JaE=
Date: Fri, 5 Dec 2025 07:06:38 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Full Name <overtube1@gmail.com>
Cc: regressions@lists.linux.dev
Subject: Re: Found mistake in kernel documentation
Message-ID: <2025120527-pointless-jinx-1383@gregkh>
References: <4f1edd4c-9c74-4f04-a856-81d71401865b@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f1edd4c-9c74-4f04-a856-81d71401865b@gmail.com>

On Fri, Dec 05, 2025 at 02:17:27AM +0200, Full Name wrote:
> https://dri.freedesktop.org/docs/drm/_sources/admin-guide/index.rst.txt
> 
> line 26:69 "tem" - "h - letter"

Great, please send a patch to fix up!

thanks,

greg k-h

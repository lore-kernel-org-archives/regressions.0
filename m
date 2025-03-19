Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5DA219A7E;
	Wed, 19 Mar 2025 23:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742428574; cv=none; b=IGJi30Qk+We3XDrAm38bbRFahHvnTp5IRfZrnCMkKjyz21E9tJes6/wl2Qa2YyeVylL0uPwFpxgYouNq8YjYb3gFAMi4qlmJvMMNOVDkzj2K1IeAmXRlmq5Orw9Bfs44B622hHQaiViyr/Lo8ZsJ5w8I7A1aPzLlj+O7KoOmJxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742428574; c=relaxed/simple;
	bh=dWBcxNU4QZTdjfYj1hu24JqFo9RJvy5cK4j7c1xnIQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IwE+a5p4UqPuXQFqik35RlfvruKaLOqgYIxpeGYow6K/axSp/en4pGbaNIK0o+I1OvQ/ppv+GQF0fFDru1gEOh/WJsGaWOw6FwaR8MjGuHN1gQLEku+1Cl8q2zdJqi/L+y11KUB23+oB9OlH6wnKk7jJq0rfCMG7KatYeOzGp8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UqNVkV2Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UqNVkV2Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 472E8C4CEE4;
	Wed, 19 Mar 2025 23:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1742428573;
	bh=dWBcxNU4QZTdjfYj1hu24JqFo9RJvy5cK4j7c1xnIQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UqNVkV2QWt33DVkwZ1KxpqZCq5RnjASeW4D4cKlkgBUpFgO8J6egQ7klVn1hkMgVN
	 WMVQMqU9KpMwl0VpIRG0ZWI0KUyjU3apTO4XZWLtbAQzUsfZNvV4kiBYNGN91oxKRs
	 t/gQYcIJX/HD5a10xeuPzK0o6B8rvxokKepRF9Qg=
Date: Wed, 19 Mar 2025 16:54:54 -0700
From: Greg KH <gregkh@linuxfoundation.org>
To: Sergio Callegari <sergio.callegari@gmail.com>
Cc: stable@vger.kernel.org, Linux Regressions <regressions@lists.linux.dev>
Subject: Re: Regression: mt7921e unable to change power state from d3cold to
 d0 - 6.12.x broken, past LTS 6.6.x works
Message-ID: <2025031923-rocklike-unbitten-9e90@gregkh>
References: <415e7c31-1e8d-499b-911e-33569c29ebe0@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <415e7c31-1e8d-499b-911e-33569c29ebe0@gmail.com>

On Wed, Mar 19, 2025 at 08:38:52PM +0100, Sergio Callegari wrote:
> There is a nasty regression wrt mt7921e in the last LTS series (6.12). If
> your computer crashes or fails to get out of hibernation, then at the next
> boot the mt7921e wifi does not work, with dmesg reporting that it is unable
> to change power state from d3cold to d0.
> 
> The issue is nasty, because rebooting won't help.

Can you do a 'git bisect' to track down the issue?  Also, maybe letting
the network driver authors know about this would be good.

thanks,

greg k-h

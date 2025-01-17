Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D4917555;
	Fri, 17 Jan 2025 06:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737094271; cv=none; b=u+C9aI6FMokX7C+SfIMfCaIvNIWO7pgNcjJHwYHlTrIJP8Bu97vC5bwPPkAB2gUshX1yzDJG/OKAQN91mNon0SzZsS6bWp4/Eq+YrG7tqz3Ug8Nw9NMPy9nslzDI6SlaMqPyARuXZ4k0gWI1WADGfR7T5cE/P7sDnmaU0qN7/xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737094271; c=relaxed/simple;
	bh=fII0MR9OudowVFvewxBH0HniDW7jyaUCcVV7LkKpGv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kVadFZ1J/jeWCHyVGuItINV7anXsZq8Kh6aAu1HhafgN6fJbOClegrMyjLXsOLMlIbUVTAM+7WV1TqY/XY1+Nce3Ek7QzMwSzqvx6W0sIkRAfPeAro1wtlJ31t1+JNkvBwkSp4Xr/5PIYwvR2zWhxws8phLkR1m6JygBFkUCxCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LYFplLbA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LYFplLbA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64380C4CEE0;
	Fri, 17 Jan 2025 06:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737094269;
	bh=fII0MR9OudowVFvewxBH0HniDW7jyaUCcVV7LkKpGv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LYFplLbAtvla0Jo+fX1c0PCOjXDSJq83po4Hz7Lw5S1JVhATJu70CkFecksYaaDKv
	 aP30tBlUAq0pfYgX6Wmi/NtNFnvDTGVCYNQ9sPXwUu5COAu0dZ/Aoz8/kuBXuiwrDy
	 dk5TAiaGkpwe7VV9U14vipFybZ0rIfuHmWVrIwHs=
Date: Fri, 17 Jan 2025 07:10:15 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Forest <forestix@nom.one>
Cc: linux-kernel@vger.kernel.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-usb@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH] USB: Add LPM quirk for sony xperia xz1 compact
Message-ID: <2025011723-whacking-culture-d1d5@gregkh>
References: <10kgojpeckdq0pb4d95k1prma49du5itre@sonic.net>
 <2025011608-shady-recite-62f6@gregkh>
 <isoiojtsus9u1ceg97eqtj7hfi9e7qecmv@sonic.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <isoiojtsus9u1ceg97eqtj7hfi9e7qecmv@sonic.net>

On Thu, Jan 16, 2025 at 12:01:31PM -0800, Forest wrote:
> On Thu, 16 Jan 2025 11:10:50 +0100, Greg KH wrote:
> 
> >> Signed-off-by: Forest <forestix@nom.one>
> >> ---
> >>  drivers/usb/core/quirks.c | 3 +++
> >>  1 file changed, 3 insertions(+)
> >
> >Always use scripts/get_maintainer.pl to get the correct people to cc:
> 
> Okay. I'm not sure how to correct this. Should I submit a v2 patch,
> even though the code hasn't changed?

Yes.

> >Also, we need a "real" name here, sorry.
> 
> Forest is my real name.

The exact one you sign documents in your country with?  If so, we can
take it off-list to work through the details.

thanks,

greg k-h

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69113E0234;
	Thu,  2 Apr 2026 12:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775131940; cv=none; b=HulQaKm2Z3co9euxQIqbHl2tJ5JkAtTVy1DPbk+eq3aSszlWdfklU8I7VJevxuVLWRj3aTUI7XFcV0LaeTtyjH0WKPrjMtEzYidZCR+L9DEFpDXcdNKO+Q/qBmGVCYQNXb8yKf0ZPefPY4tNFqGKBIQRdhV000CihYFUnwP8lvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775131940; c=relaxed/simple;
	bh=mI9VFZsuhgPGi6KsENAPjVx/BbS778vsmGw3e5R4AeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uSgNv7AXA8PTLLnsjVvaszJgccFyIlQZQMpdOCJeAB9vzKnMDVgUFCVACwQfjwK7URhwWldvWCak6foGqN5w28DnE4HothxQ/Ft0VN421Scs2KNHHC9/BfgwFxFEivaF91GcZ+7JFnbDkOpN/udYrM/lya8i9FvAbCkINK/XlDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=z+hnucde; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="z+hnucde"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8F24C19423;
	Thu,  2 Apr 2026 12:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775131940;
	bh=mI9VFZsuhgPGi6KsENAPjVx/BbS778vsmGw3e5R4AeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=z+hnucdeXxE0kPbk7CkEzSWGZNnUgpSEM55vmH1f+nisBxT7FED/yUwORM2f2uofU
	 R8On16u+jJ0q3ogDwfU2wM1Y6qfhGLX+SbS/EALV3IvFXR3sWhr9d/oYeH+MGM3TPd
	 /sFC3svWk+oPrg7/lEgZfjr/uaDg5CTTuJuUhi4I=
Date: Thu, 2 Apr 2026 14:12:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Matt Fagnani <matt.fagnani@bell.net>, dri-devel@lists.freedesktop.org,
	stable@vger.kernel.org,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: Warnings and errors in drm_mode_config_cleanup when booting
 6.19.10 and 7.0-rc5
Message-ID: <2026040259-glacial-reversal-9a75@gregkh>
References: <a8f058b3-ea2c-4af1-a19b-9ae2db46754c@bell.net>
 <9652ce0b-bb4c-489d-9e32-89c5af5c8101@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9652ce0b-bb4c-489d-9e32-89c5af5c8101@leemhuis.info>

On Sat, Mar 28, 2026 at 11:52:48AM +0100, Thorsten Leemhuis wrote:
> Matt, thx for the report.
> 
> On 3/28/26 11:30, Matt Fagnani wrote:
> > I could try to bisect. The commit
> > e493c135980f90c20308d1a98f2e0d1223951e94 drm: Fix use-after-free on
> > framebuffers and property blobs when calling drm_dev_unplug was included
> > in 6.19.10 and changed drm_mode_config_cleanup https://git.kernel.org/
> > pub/scm/linux/kernel/git/stable/linux.git/commit/?
> > h=linux-6.19.y&id=e493c135980f90c20308d1a98f2e0d1223951e94
> 
> Did a quick search. Turns out this is mainline commit 6bee098b914176
> ("drm: Fix use-after-free on framebuffers and property blobs when
> calling drm_dev_unplug") -- and when searching for that (FWIW, this is
> not widely known, but that is really helpful in case like this, as the
> mainline commit id is way more relevant) is turns out that is in the
> process of getting reverted:
> 
> See https://lore.kernel.org/all/20260326082217.39941-2-dev@lankhorst.se/
> or 45ebe43ea00d6b ("Revert "drm: Fix use-after-free on framebuffers and
> property blobs when calling drm_dev_unplug"") [next-20260327
> (pending-fixes)].
> 
> Sasha and Greg: you might want to make sure to pick this up.

When it shows up in a Linus-released kernel, can someone remind us?

thanks,

greg k-h

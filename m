Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6278B1FB8
	for <regressions@lists.linux.dev>; Tue, 21 Mar 2023 07:42:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9B3AC433D2;
	Tue, 21 Mar 2023 07:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1679384552;
	bh=cBz2SBKHl0D4/lc0rKksK7HR04Woi+o3Zyt6TOb45CA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n3Y09zJsRWXicikVO+dT52/OvWFowSBgOfB1MCKndoAR+jCBaaUJKH1jkV6ehcvJZ
	 Fqbc5tRXaKypcbfgXHEHtLK16Em6UugW/GFGoGFHN74z4F0INySmYKt44nMCdUUBSY
	 hu0OaDMW3P9N8TiYxPs8QB7lIKsoyd1Pp3f67dHk=
Date: Tue, 21 Mar 2023 08:42:29 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Nick Bowler <nbowler@draconx.ca>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	John.C.Harrison@intel.com, regressions@lists.linux.dev
Subject: Re: PROBLEM: Linux 5.4.237 i915 driver crashes on boot (-longterm
 regression)
Message-ID: <ZBlf5RhMUCuM9LRD@kroah.com>
References: <CADyTPEyZCY1cnPsqcbMrgOZejtyHHSdZ=EStouKKBc8YKFrnkg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADyTPEyZCY1cnPsqcbMrgOZejtyHHSdZ=EStouKKBc8YKFrnkg@mail.gmail.com>

On Tue, Mar 21, 2023 at 01:36:05AM -0400, Nick Bowler wrote:
> Hi,
> 
> Linux 5.4.237 crashes immediately on my machine every time when the i915
> driver is loaded, with an error like the one below.  Previous versions are OK.
> 
> I bisected it to commit 1aed78cfda7f ("drm/i915: Don't use BAR mappings
> for ring buffers with LLC").  I can revert this on top of 5.4.237 and
> this seems sufficient to make the machine boot and work again.
> 
> Let me know if you need any more info.

This should be fixed in the 5.4.238-rc1 release that is out for testing
right now, if not, please let me know.

thanks,

greg k-h

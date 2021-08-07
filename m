Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91FB3481
	for <regressions@lists.linux.dev>; Sat,  7 Aug 2021 08:16:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id ADF6460F59;
	Sat,  7 Aug 2021 08:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1628324210;
	bh=d7H3u7cqpnsZ9Xce5y7GvurT2XWmylBa5mXCyE1ePvQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GLjNarE2CCrxFP5ZVjcAo7+4fyzNmsFTceG6YzX+7Y0OCpbHZzu4T5WAzxHq6EWfG
	 NZf2UaSTpxVWNALNF1Nf73bPqxwaWYK7tAOdmV7QoaMWcEB7vayxy7vaLdk6Iq12gC
	 tF+LQ0eEDfsc4gQ6eRPP4hPs17cfS1mmR7/wo2LE=
Date: Sat, 7 Aug 2021 10:16:47 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Takashi Iwai <tiwai@suse.de>, Jeff Woods <jwoods@fnordco.com>
Cc: alsa-devel@alsa-project.org, stable <stable@vger.kernel.org>,
	regressions <regressions@lists.linux.dev>
Subject: Re: Kernel 5.13.6 breaks mmap with snd-hdsp module
Message-ID: <YQ5Bb+mPgPivLqvX@kroah.com>
References: <17b1f9647ee.1179b6a05461889.5940365952430364689@fnordco.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17b1f9647ee.1179b6a05461889.5940365952430364689@fnordco.com>

On Sat, Aug 07, 2021 at 12:49:07AM -0700, Jeff Woods wrote:
> Specifically, commit c4824ae7db418aee6f50f308a20b832e58e997fd triggers the problem. Reverting this change restores functionality.
> 
> The device is an RME Multiface II, using the snd-hdsp driver.
> 
> Expected behavior: Device plays sound normally
> 
> Exhibited behavior: When a program attempts to open the device, the following ALSA lib error happens:
> 
> ALSA lib pcm_direct.c:1169:(snd1_pcm_direct_initialize_slave) slave plugin does not support mmap interleaved or mmap noninterleaved access
> 
> This change hasn't affected my other computers with less esoteric hardware, so probably the problem lies with the snd-hdsp driver, but the device is unusable without reverting that commit.
> 
> I am available to test any patches for this issue.

Have you notified the developers involved in this change about this
issue?

Adding them now...

thanks,

greg k-h

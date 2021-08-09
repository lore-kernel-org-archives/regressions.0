Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CA1177
	for <regressions@lists.linux.dev>; Mon,  9 Aug 2021 06:51:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2188D60234;
	Mon,  9 Aug 2021 06:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1628491869;
	bh=+3F4VLZk28CW4xNEkYnAwylww1bs9viWiI/OfHLdWGE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Drn3woxgZlzwh8B06RVozdF+7tnNaXZ+hSWiu0vF1n959vJvoS4HAq+RNsUNUOJhr
	 3vjkln4UFzkrWG7B01WIFD4x0F3j4dvXT76imnANdnQqHTbPbfFDWKVzbawlEicMl3
	 bCBEy0a5XK/YGY7MDrLkpEUYxv6erxCJsZqMXwhQ=
Date: Mon, 9 Aug 2021 08:50:59 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jeff Woods <jwoods@fnordco.com>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel <alsa-devel@alsa-project.org>,
	stable <stable@vger.kernel.org>,
	regressions <regressions@lists.linux.dev>
Subject: Re: Kernel 5.13.6 breaks mmap with snd-hdsp module
Message-ID: <YRDQU7hrctUAdRci@kroah.com>
References: <17b1f9647ee.1179b6a05461889.5940365952430364689@fnordco.com>
 <YQ5Bb+mPgPivLqvX@kroah.com>
 <s5htuk1ppvb.wl-tiwai@suse.de>
 <17b22d08355.f21da1f938057.6900412371441404465@fnordco.com>
 <s5him0gpghv.wl-tiwai@suse.de>
 <17b272bac81.10ac3bd0570099.4091761174182420511@fnordco.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17b272bac81.10ac3bd0570099.4091761174182420511@fnordco.com>

On Sun, Aug 08, 2021 at 12:09:38PM -0700, Jeff Woods wrote:
> 
> For future reference, if I am reporting an issue with stable and I know the
> commit that caused it, should I contact the committer directly *and* cc the
> stable and regressions list?

Yes, that would be great to do.

thanks,

greg k-h

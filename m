Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792909713;
	b=MiX3KNdtaOnyiSh4+2IjrcOZiVaDzcRhyJAhF5p8jzx017+AE+/UyMZR3QdRERu6V6r5
	 rxBcj4q9/JCfuTa0utKA9Kst1uCWuEkIJiXwV7t7rDxgVRb0vjSJwwzdHqPc6B6b6WGUY
	 Km+Bdx3ZazlVg+2M4DOAqoWDWZ0897suXV4AJhcs/sd1OffqXHw8oznW2D0/95nQdI1MO
	 OCUgtRganz5KX/Fz4Qu+cuoTbeG7gYOK3Yv/5SmzJL5FKO8Fn05Tl+QBxxkCT7yagdAH9
	 RtPOxetLN7PqVtaSP5eVdFemz+1bTmRhzmZbrhc2QsI9eis2DBJGFYx0gSavVKiHkBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792909713;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=9eWGYR42ZqAiPgMLfV2JIEuBKhMU1pLyeq9P+2q1vlM=;
	b=pqRIKIKqoHEJuk+UsmQvlnrfiiG2Rt9FlE8zvPVvy+9UeG8mwSf93F6NNmyyrTuWT6Re
	 UKoGxZPSzl16NCSqWsgaRlUh9BfvlSdOd2KDGPrKbBzfedKJIUvhMrP7EJd7oUe9AU3wl
	 O7x7BgWTGuv2U/K0yk8xHY7h5M2X3MeqDBMsR/xTXUkJ21HclL2E4q5URlhGA/2cKA3v0
	 6QSgNlt9+IzJRI77d9y//kFlGCYMxis6VkWzOmVJk6F2m1pJQB8lEwGidlaCm7B2hGgCL
	 p1gjpkuXGS3SJUoawmovRiV5alVnWOKnYowZiLwTMwseTORjF60JLhsmGWyv7hOvhLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=voU+zLCU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F110606A31A;
	Sun, 25 Oct 2026 06:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=voU+zLCU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E37C51F01825;
	Sun, 25 Oct 2026 06:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792909712;
	bh=9eWGYR42ZqAiPgMLfV2JIEuBKhMU1pLyeq9P+2q1vlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=voU+zLCUiex9OI8Bas1ZNh+FveWEj7uTL5o4mXbWKoybt1Jd7kdn1k+0OI8uqcExV
	 iwDghdcrIpVEfely0txylXLSJjfCa7kppA7fpyTaifz6OG3EnDgNmDXfglen1DgYEB
	 3lSpU0wI4zTP38bUFuap8op0eHScXdyCxkU2qGwY=
Date: Sun, 25 Oct 2026 07:28:29 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Dennis Wissel <dennis@dsine.de>
Cc: linux-usb@vger.kernel.org, mathias.nyman@linux.intel.com,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] usbhid -110 timeouts and reset loop for Keychron M5
 (3434:d068) at boot since v7.3
Message-ID: <2026102504-defiance-uncanny-e21f@gregkh>
References: <4MjB9K-2SoiA85WbI9iEig@dsine.de>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4MjB9K-2SoiA85WbI9iEig@dsine.de>

On Sat, Oct 24, 2026 at 07:47:10PM +0200, Dennis Wissel wrote:
> My guess, untested: the xhci changes merged for 7.3 that touch
> cancelled transfers on control endpoints, e.g. 7c0c31c66a7f ("move
> dequeue to next valid td instead of past cancelled one"). The fast -71
> on 7.2 turning into -110 timeouts plus resets on 7.3 seems to fit
> that. I haven't bisected or tested a revert yet, but I can if you
> point me at what to try.

Any chance you can use 'git bisect' to find the offending commit?

thanks,

greg k-h

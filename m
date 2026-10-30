Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793337753;
	b=aqoG6R7G+FNXQKN7pFz/yOe9uBal7CvsDA4u3QUh7eb7YwVI1/7K6Chn/RaQ0lC7TNPB
	 2m9xVJXOwAHCA8w8tus6HrtyQmnBTFJm1pjPx7nqn9d1xLFEb5BARSNGS2eDowWehuQas
	 IsdYf35dJNGw6AGk0ZqRYw5Q1S/8M4ErZIDPNWpOuOqwrHGXJEgY3K3AMP5gbhrO4trm2
	 ez29RFobvgQT9CAnaO0vg4/fOip0w1bpUx4NNDE4xnZ5fZWBFqkc7smDG4Jp5iQ5EZIT5
	 2kiHBy2ONnDICV4uIYlwm3buXxVP0Beuqrh6Lik/vUyCM1fVVBZTTSGZzd9LFkhkbLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793337753;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=gciOo/jBYY15NhZO+36Co27z4TL9XaDFJG73mfuKAds=;
	b=wMKFXpzfpCRf2slWtS84VDoctljmb/uKbvpmK/WYENX+/OrPQ63wFtAoS0Fuet+UDXKK
	 NlSGd2OGa2hOXmKZj5wsKu+87okP0g3P/WEXU/yBxmJko9lrM/JNWCvFg55SD+HgnowN6
	 bNIHWaBjqKwMU2j6OwAwA4F8hJj0M/UPeJqPr8QWKQ7NAjd8TId/RQiGmHugkeUOONq2B
	 O++3FalfcJYvpPiUZPV6rWPUUDKbF21Ir3oHJxT5ftk3XEcxQgBYDX2zaZPEhx/ZssfXB
	 TNhYuUmfaHofgJuzZvFKpbX5VRvwUCV0x7QnbTcKBO0aYecK1cLjhkRyPJBY5gEd+2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=zcmbdoUA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1110606A31A;
	Fri, 30 Oct 2026 05:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=zcmbdoUA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96E4E1F000C1;
	Fri, 30 Oct 2026 05:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793337752;
	bh=gciOo/jBYY15NhZO+36Co27z4TL9XaDFJG73mfuKAds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=zcmbdoUAtpv6e3MPgmo3ec+FzGExXncKx1EaogJDO8Qfca60bTeWbZL38LcYbcFxx
	 dTNoO8SumI8Uy0Y04N5vB33Vk4rZ1OD3GlzDf0GBJbWyEPlZkxq7pKcIwWDAAUXOh/
	 LVbYyjP4hg//PNU4HbwgMfzoCTR8y213KoJbHczU=
Date: Fri, 30 Oct 2026 06:22:29 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org, regressions@lists.linux.dev,
	michal.pecio@gmail.com, Yiyu Zhou <yiyu@yiyuzhou.io>,
	Dennis Wissel <dennis@dsine.de>
Subject: Re: [PATCH v2] xhci: give back TDs and clean up ep0 after disconnect
Message-ID: <2026103009-handful-labored-d1ce@gregkh>
References: <20261029204324.658845-1-mathias.nyman@linux.intel.com>
 <20261029204324.658845-2-mathias.nyman@linux.intel.com>
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
In-Reply-To: <20261029204324.658845-2-mathias.nyman@linux.intel.com>

On Thu, Oct 29, 2026 at 10:43:24PM +0200, Mathias Nyman wrote:
> From: Yiyu Zhou <yiyu@yiyuzhou.io>
> 
> Fix a regression in v7.3 introduced by the commits in the Fixes tags.
> Those patches avoid endpoint recovery and rapid state changes after
> the root port link is lost.
> 
> This caused a regression in device enumeration.

I see this patch twice?

And sashiko seems to object to it, is that response correct?

thanks,

greg k-h

Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDC33481
	for <regressions@lists.linux.dev>; Wed, 28 Jul 2021 06:31:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9962E601FE;
	Wed, 28 Jul 2021 06:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1627453911;
	bh=XcDRdl3wGSDMZKBy94Clvn3q2r5v6+7WAdSUAAhttU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bWEuUipzjB1GmT4IQHvIXLPzVJhEOhJhFnjs62KwFiGHOpuZcx/ttIIiEa2exa3mw
	 MKKArL54lJbJ4tgSIz8R61l7xWxzzqRxF7AnwNx7pIm12Ts+vZmc6r8BZdacHbELK3
	 qe9kIzHXL6/SxN4RjuYooch3qlWuSkP3EQTzdvcA=
Date: Wed, 28 Jul 2021 08:31:49 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Adrien Precigout <dev@asdrip.fr>
Cc: regressions@lists.linux.dev
Subject: Re: Tr: Unable to boot on multiple kernel with acpi
Message-ID: <YQD51cSUOpDaD7Ad@kroah.com>
References: <fc66decb-ed13-45dd-bf82-91f0cc516a30@asdrip.fr>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc66decb-ed13-45dd-bf82-91f0cc516a30@asdrip.fr>

On Tue, Jul 27, 2021 at 09:48:55PM +0000, Adrien Precigout wrote:
> 
> 27 juil. 2021 23:31:53 Adrien Precigout <dev@asdrip.fr>:
> 
> Hi,
> 
> On my acer swift 3 (SF314-51), I can't boot on my device since 4.19.198 (no issue with 4.19.197) without adding "acpi=off" in the parameters. Same thing happens on 5.12.19 (didn't happened in 5.12.16), 5.13.4 and .5 and 5.10.52.

Odd, this list accepts html emails...

Anyway, as I said on the stable list in response to this same request,
it's a known issue with the acpi developers, please read the thread I
pointed you at there and let the developers know it is affecting you.

thanks,

greg k-h

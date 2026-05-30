Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AEB3A2E00;
	Sat, 30 May 2026 10:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780136750; cv=none; b=S+RGZr7sJ/enLp1S312Wbw1gcydCOBAAzOOnlYQvA2nEZis6qJ7qShNtvuDBhK6JtQ8ZcPLUajGz+FxBZbrxhHsrnYgjdcRzSfe4v6X0Z3tR2u1/PbZpaOY3Tg8975aVOSMgokx/1AwtkbvA6FCSmMt31mDHiS1HfV7E6IXLJK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780136750; c=relaxed/simple;
	bh=mt7ZttxH+Yv6wq+D/satUAPHqEtgTosD0YnAm1KJWNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nn/v+5YyFjLiBakxfEP+DSs6kEUj5+ozcNl+7HI1m/8hgwTr9kAYYIft6ZfaWZSmu8mwHmtTM1OTg1Ssr32HoZhw/Pr3BD+4Orf3LySdGVggH9L28sQuGHaFSLpPxzISEfr/tF5i8gYiJGYUmsdJlX/a2LjPHMpVTJL8gua3oug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mrvfEhiI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mrvfEhiI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF7791F00898;
	Sat, 30 May 2026 10:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1780136748;
	bh=du2UQIBk27uRjDOmWlfy0vHAxBBXOy9k3qobz5d1ZE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mrvfEhiIOxtZPbh/7MIv4/G8fTmiwH4ZOPM42IAZBwhLjlsowHRSkvWOYf0PZmzdj
	 q+SodRoI8nuf+5CpGkWxz15cDXF2FPJGugq1s4ChqOG0hwhoRTMTWOfGw85glDO4oA
	 8rXwTHXevWmJkU4xIxDg+O/0Cx6VI6lCvjVsoh8U=
Date: Sat, 30 May 2026 07:36:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: regressions report as of Linux 7.1-rc5 post (was: Linux 7.1-rc5)
Message-ID: <2026053050-diary-extinct-5f42@gregkh>
References: <CAHk-=wjt1NiKOdyAMz_DT7NmZ++SizPOhRSi492ukdTnpDzHQw@mail.gmail.com>
 <3b4e5f3c-4b55-4c28-a018-e306bf8a807d@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3b4e5f3c-4b55-4c28-a018-e306bf8a807d@leemhuis.info>

On Fri, May 29, 2026 at 06:05:07PM +0200, Thorsten Leemhuis wrote:
> ---
> serial: 8250: BREAK + SysRq dispatch broken
> https://lore.kernel.org/lkml/5efe9e03-4d86-43a0-9ec2-e610ff31095d@free.fr/
> 
> Known for 17 days. Hope the fix will make it to mainline soon:
> 71f42b2149a130 ("serial: 8250: dispatch SysRq character in
> serial8250_handle_irq()") [next-20260525 (pending-fixes)]

Will be sent to Linus later today.

> ---
> usb: typec: ucsi: laptop does not enter suspend anymore
> https://lore.kernel.org/lkml/agvqqMt9x0df-WXS@google.com/
> 
> Known for 10 days. Hope the fix will make it to mainline soon:
> d98d413ca65d07 ("usb: typec: ucsi: Don't update power_supply on power
> role change if not connected")

Also will be sent later today.

thanks,

greg k-h

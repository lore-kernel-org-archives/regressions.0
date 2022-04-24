Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B06F17D1
	for <regressions@lists.linux.dev>; Sun, 24 Apr 2022 06:12:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFA0DC385AB;
	Sun, 24 Apr 2022 06:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1650780775;
	bh=E1MKqD62FevE1GiU9ohHO912BX6dHib5zhdDMAllcyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gO9dryS/25Vs3WdQbnCYE7g65CKaYN3JpRwDD4gSKafRCV37T3dzW469HegaOdkMQ
	 4eN1KUPwgbOcDUUT8WT1jKUvsrRoJoF5CdKA+h0W6vj9Rrs1SbkUHgz7xR5+TRQ535
	 MWTTQ6b1ZsF8GPpKjtDLDgBTfnIotuRLiIJG+GIA=
Date: Sun, 24 Apr 2022 08:12:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: amd-gfx@lists.freedesktop.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION] AMD GPU regression in 5.16.18..5.17.4
Message-ID: <YmTqYkGEqiz1o2o6@kroah.com>
References: <YmQi7ajZpZ4W7BJL@itl-email>
 <YmQkCXZEqp6TKrhJ@itl-email>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YmQkCXZEqp6TKrhJ@itl-email>

On Sat, Apr 23, 2022 at 12:06:33PM -0400, Demi Marie Obenour wrote:
> Two Qubes OS users reported that their AMD GPU systems did not work on
> 5.17.4, while 5.16.18 worked fine.  Details can be found on
> https://github.com/QubesOS/qubes-issues/issues/7462.  The initial report
> listed the GPU as “Advanced Micro Devices, Inc. [AMD/ATI] Renoir
> [1002:1636} (rev d3) (prog-if 00 [VGA controller])” and the CPU as
> “AMD Ryzen 5 PRO 4650U with Radeon Graphics”.
> 
> #regzbot introduced: v5.16.18..v5.17.4

That's a big range, can you use 'git bisect' to track it down?

thanks,

greg k-h

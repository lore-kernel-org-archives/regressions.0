Received: from mailout2.dotplex.com (mailout2.dotplex.com [185.231.124.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178DF100A6
	for <regressions@lists.linux.dev>; Fri, 23 Jun 2023 16:24:37 +0000 (UTC)
Received: from remote.ip.hidden (remote.ip.hidden [127.0.0.1])
	(Authenticated sender: estellnb@elstel.org)
	by mailout.dotplex.com (Postfix) with ESMTPSA id 6D5641FF06;
	Fri, 23 Jun 2023 18:17:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elstel.org;
	s=dotplex2; t=1687537027;
	bh=ibJco1/keng6BHqY4pn+cxp3AoxrQQMtj2UyXiQeCTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NRZlvaOjx7CtQ1Bk0/LpVDWWglv62lxb/52ZqBH3wBbgnp9n2IGqFW6iu+jZvDUoP
	 rwIM76zzoLupyHFwBa2f3ghF2tStgiR9L5jRqReYLqLc2qMojWuOiorQAKGLR0n4r0
	 cKgO9v6lRipKD1s+7DFECcab4qpuKZQS/Vp5BO1/oynRBCtH/e6C+a/gkGk442oiPn
	 QBsBqosn8c3reRxXmEsPk6cOWDr7+gRBRIM2gxeegzBZZGE1xsJLVqYVtbZONjwajl
	 dTcwwl/8MHDMFUbSWYutyPCI25DgY14aGABbz2JBkj4ni7p6gzyjV4s/0yRrafWdWZ
	 pbU3eT6AKr8zQ==
Date: Fri, 23 Jun 2023 18:17:05 +0200
From: Elmar Stellnberger <estellnb@elstel.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>,
	Linux Memory Management <linux-mm@kvack.org>,
	Linux Stable <stable@vger.kernel.org>
Subject: Re: Fwd: kernel fault on hibernation: get_zeroed_page/swsusp_write
Message-ID: <ZJXFgfldS6W_LCiI@mail.dotplex.com>
References: <5d4959b7-61da-8ab0-6bc6-21305d37c7aa@gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <5d4959b7-61da-8ab0-6bc6-21305d37c7aa@gmail.com>
User-Agent: Mutt (Linux i686)

Hi all, Hi Bagas S.

As the issue didn't reproduce the way I would have liked (did not
reproduce at all here, not even with the same kernel version; no
further comment) I have now uploaded the /proc/kcore and the kernel
binaries and symbol files I still had on disk at
https://upload.elstel.info (This may move to something like
upload.elstel.info/bugs/kernpagealloc in the future)

Regards,
Elmar

Am Fri, Jun 23, 2023 at 07:36:21PM +0700 schrieb Bagas Sanjaya:
> Hi,
> 
> I notice a regression report on Bugzilla [1]. Quoting from it:
> 
> > page allocation error using kernel 6.3.7-desktop-1.mga9 #1 SMP PREEMPT_DYNAMIC, from Fr 09 Jun 2023 22:57:31, Key ID b742fa8b80420f66; see the backtrace in the dmesg
> >> cat /proc/cpuinfo
> > siblings	: 4
> > core id		: 1
> > cpu cores	: 2
> > ...
> > type: regression, worked with the previous kernel, namely 6.3.6, Mo 05 Jun 2023 21:37:15, Key ID b742fa8b80420f66 before updating today
> 
> And then:
> 
> > The first hibernation attempt resulted in the backtrace you can see in the dmesg above, my second hibernation attempt from a text console (vt03 or so) has worked without errors and the third one I tried to do from the GUI/X11 again; see the debug options I had turned on). On the third attempt something strange did happen. It seemed to write to disk as it should, the screen turned black but the power led and button still stayed alighted. Waking up by pressing the power button did not yield any effect, nor the SysRq keys (alas forgot to write 511 to >/proc/sys/kernel/sysrq). After a hard power reset it booted as if not hibernated. On the first hibernation attempt I could see lengthy and intermittent disk access. On the third attempt I had waited for some considerable time.
> 
> See Bugzilla for the full thread and attached infos (dmesg, journalctl,
> stack trace disassembly).
> 
> Unfortunately, the reporter can't provide /proc/kcore output
> and haven't performed bisection yet (he can't build custom kernel).
> 
> Anyway, I'm adding it to regzbot (as stable-specific regression) for now:
> 
> #regzbot introduced: v6.3.6..v6.3.7 https://bugzilla.kernel.org/show_bug.cgi?id=217544
> #regzbot title: page allocation error (kernel fault on hibernation involving get_zeroed_page/swsusp_write)
> #regzbot link: https://bugs.mageia.org/show_bug.cgi?id=32044
> 
> Thanks.
> 
> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=217544
> 
> -- 
> An old man doll... just what I always wanted! - Clara

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC38728E8
	for <regressions@lists.linux.dev>; Fri, 28 Oct 2022 15:06:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 152E1C433C1;
	Fri, 28 Oct 2022 15:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1666969604;
	bh=/AfH/0tWtR/4utpfJ8csPyUFR5HJK6cuuD1q7znPyXw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UPeTD4vZmB5ud0wE96SD0loHBdKuFNfupTvrWOO5L/uPyKbYWlTMHHzjDlMzkjvd+
	 WQ/GDfSiF4su4/kDQLL+0crS0p5iVD/m+3vEuxAAfJriYEUdnxfd13ZIkx3leRVpbW
	 LztDxQZpNnI0MBZQHal4Pmjqt28RK/BMykFo4tv0=
Date: Fri, 28 Oct 2022 17:06:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dominic Jones <jonesd@xmission.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [REGRESSION] v6.0.x fails to boot after updating from v5.19.x
Message-ID: <Y1vwAfbZ2Qi+mpF3@kroah.com>
References: <379d4e6478c763dec8baaa6009b379f1.dominic@xmission.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <379d4e6478c763dec8baaa6009b379f1.dominic@xmission.com>

On Fri, Oct 28, 2022 at 02:51:43PM +0000, Dominic Jones wrote:
> Updating the machine's kernel from v5.19.x to v6.0.x causes the machine to not
> successfully boot. The machine boots successfully (and exhibits stable operation)
> with version v5.19.17 and multiple earlier releases in the 5.19 line. Multiple releases
> from the 6.0 line (including 6.0.0, 6.0.3, and 6.0.5), with no other changes to the
> software environment, do not boot. Instead, the machine hangs after loading services
> but before presenting a display manager; the machine instead shows repetitive hard
> drive activity at this point and then no apparent activity.
> 
> ''uname'' output for the machine successfully running v5.19.17 is:
> 
>     Linux [MACHINE_NAME] 5.19.17 #1 SMP PREEMPT_DYNAMIC Mon Oct 24 13:32:29 2022 i686 Intel(R) Atom(TM) CPU N270 @ 1.60GHz GenuineIntel GNU/Linux
> 
> The machine is an OCZ Neutrino netbook, running a custom OS build largely similar to
> LFS development. The kernel update uses ''make olddefconfig''.

Can you use 'git bisect' to find the offending change that causes this
to happen?

thanks,

greg k-h

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCE220C00C
	for <regressions@lists.linux.dev>; Fri, 10 Jan 2025 14:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736517909; cv=none; b=jxVFAZOYpvJFiRyLqyZnLUUOgCtuXmD2TZMCxzm7DUSAqn32ZllkZQkvhfrvCIo5URS94LkSidcmGleGHEqZ1UiDCDVLSmKOXLpVX6z6NYPy53FYv7ZQ2uvDAjYx3C9Zaqft0hp5gRX4ylGWYbnq76wY25r5VpQpmL1i/X+zWXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736517909; c=relaxed/simple;
	bh=VNAR7Pu76V77SAc+Ydm3zg3tonJk+QMMLetB4+GGIzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RFBDsXYnzpzarFjrkp/+gKDCkn4dpVwwG0Sz95yJs/vT1BPXHK1BU6G14mN95surcoIods/ojPsz8OIPOxhUSt2AwANATPsLSlMJ7oMX4g8WboItq4Gw2ozgOXZ0uNVZgpgSzMF65emBHgXInQoZ1qe5SUlccoCDiqLubYsbJTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AtDL4IpO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AtDL4IpO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6954CC4CED6;
	Fri, 10 Jan 2025 14:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736517909;
	bh=VNAR7Pu76V77SAc+Ydm3zg3tonJk+QMMLetB4+GGIzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AtDL4IpO9QjOQz6UHYrzgqhz0VPvTrOBkdl912REKiV+ifuR/rvh68lMpsb3mdvvN
	 sQEPjiOk69UEsjKkF9MOYNxxN7Z4feFulC+XKQeNNAjXf0iVrY3ytCJqc9sWsr6het
	 SUwF4MTAAmjb0KjQRvWq7bytBIm2H5JawFkMp5kU=
Date: Fri, 10 Jan 2025 15:05:05 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lars Wendler <wendler.lars@web.de>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
	Baoquan He <bhe@redhat.com>
Subject: Re: kexec build regression in linux-6.6.70 (linux-6.6.y LTS branch)
Message-ID: <2025011054-cushy-undercoat-5bf0@gregkh>
References: <20250110103328.0e3906a8@chagall.paradoxon.rec>
 <2025011051-postbox-drove-0f5c@gregkh>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025011051-postbox-drove-0f5c@gregkh>

On Fri, Jan 10, 2025 at 10:40:24AM +0100, Greg Kroah-Hartman wrote:
> On Fri, Jan 10, 2025 at 10:33:28AM +0100, Lars Wendler wrote:
> > Hello folks,
> > 
> > trying to build latest linux-6.6.y release (6.6.70) fails with the
> > following error:
> > 
> >   LD      .tmp_vmlinux.kallsyms1
> > ld: vmlinux.o: in function `__crash_kexec':
> > (.text+0x1bf9c1): undefined reference to `machine_crash_shutdown'
> > ld: vmlinux.o: in function `do_kexec_load':
> > kexec.c:(.text+0x1c15bb): undefined reference to
> >   `arch_kexec_protect_crashkres' ld: kexec.c:(.text+0x1c1611):
> >   undefined reference to `arch_kexec_unprotect_crashkres' ld:
> >   vmlinux.o: in function `__do_sys_kexec_file_load':
> >   kexec_file.c:(.text+0x1c272a): undefined reference to
> >   `arch_kexec_protect_crashkres' ld: kexec_file.c:(.text+0x1c2772):
> >   undefined reference to `arch_kexec_unprotect_crashkres' make[2]: ***
> >   [scripts/Makefile.vmlinux:37: vmlinux] Error 1 make[1]: ***
> >   [/usr/src/linux-6.6.70/Makefile:1164: vmlinux] Error 2 make: ***
> >   [Makefile:234: __sub-make] Error 2
> > 
> > 
> > I suppose this is related to commit
> > e5b1574a8ca28c40cf53eda43f6c3b016ed41e27 which is the only commit in
> > question that changes kexec code between linux-6.6.69 and linux-6.6.70.
> 
> Yeah, this has been reported a number of times, I'll try to track down a
> fix later today, sorry about this...
> 
> If you change your .config, it does work :)

Should now be fixed with the 6.6.71 release.

thanks,

greg k-h

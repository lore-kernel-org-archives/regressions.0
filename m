Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB25220A5FB
	for <regressions@lists.linux.dev>; Fri, 10 Jan 2025 09:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736502028; cv=none; b=AXCjwUptLNYlcg1O/7MEaIMhJ858dyn4d/OkpvnxZAb2lrjIoa+M+BSTTrS+INwEe1EEWldi6FitwroP329EITsSW2U4hE4oymeS5sdhtmnCnnbR3CKhempqcmlMcXrPKTzhxbNHwkGNlaYolahcwjSdTstGIQLF02xGj/QR0zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736502028; c=relaxed/simple;
	bh=gKfFaKAFAVTh27qN1ML4aKf63WS62JqyAZqzVxgcvnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sw7HW9l9o3kzMRt6uMexknBPtro2hICb26vi18Y8TlAUs0Zkk5Ei/u8jg3JbbRJZDzGeJnKIvKfjnQ3fTOhiVY3RoRcjNJmr6oZs+iDxZ1ryoWjI2F8upgv7zr18I2w9O555McKITvmn8+owjfBnGXXzhQm5Wdey0TQCSc4OxiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hew/gJKF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hew/gJKF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B16C6C4CED6;
	Fri, 10 Jan 2025 09:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736502028;
	bh=gKfFaKAFAVTh27qN1ML4aKf63WS62JqyAZqzVxgcvnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hew/gJKFWYVELTo/wZ7PzsINkJ9yfABSWKWJGwO282XBMnLbrrOBMXCcFzwnFSXvI
	 JizRxdayDmKOdyHsI840BzTKeqapTQHmv+InKvmlIgjkteegmT2fbDwLgmoCwfrCYQ
	 CJWxxVYBd2DFSc/RdWguxCoMCMWE6/adeXmqoj4o=
Date: Fri, 10 Jan 2025 10:40:24 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lars Wendler <wendler.lars@web.de>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
	Baoquan He <bhe@redhat.com>
Subject: Re: kexec build regression in linux-6.6.70 (linux-6.6.y LTS branch)
Message-ID: <2025011051-postbox-drove-0f5c@gregkh>
References: <20250110103328.0e3906a8@chagall.paradoxon.rec>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110103328.0e3906a8@chagall.paradoxon.rec>

On Fri, Jan 10, 2025 at 10:33:28AM +0100, Lars Wendler wrote:
> Hello folks,
> 
> trying to build latest linux-6.6.y release (6.6.70) fails with the
> following error:
> 
>   LD      .tmp_vmlinux.kallsyms1
> ld: vmlinux.o: in function `__crash_kexec':
> (.text+0x1bf9c1): undefined reference to `machine_crash_shutdown'
> ld: vmlinux.o: in function `do_kexec_load':
> kexec.c:(.text+0x1c15bb): undefined reference to
>   `arch_kexec_protect_crashkres' ld: kexec.c:(.text+0x1c1611):
>   undefined reference to `arch_kexec_unprotect_crashkres' ld:
>   vmlinux.o: in function `__do_sys_kexec_file_load':
>   kexec_file.c:(.text+0x1c272a): undefined reference to
>   `arch_kexec_protect_crashkres' ld: kexec_file.c:(.text+0x1c2772):
>   undefined reference to `arch_kexec_unprotect_crashkres' make[2]: ***
>   [scripts/Makefile.vmlinux:37: vmlinux] Error 1 make[1]: ***
>   [/usr/src/linux-6.6.70/Makefile:1164: vmlinux] Error 2 make: ***
>   [Makefile:234: __sub-make] Error 2
> 
> 
> I suppose this is related to commit
> e5b1574a8ca28c40cf53eda43f6c3b016ed41e27 which is the only commit in
> question that changes kexec code between linux-6.6.69 and linux-6.6.70.

Yeah, this has been reported a number of times, I'll try to track down a
fix later today, sorry about this...

If you change your .config, it does work :)

thanks,

greg k-h

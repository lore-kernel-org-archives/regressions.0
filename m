Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B0A1E495
	for <regressions@lists.linux.dev>; Fri, 27 Dec 2024 07:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735286337; cv=none; b=qV5ktM0hN0H7MozEM5fu8LVcBCa91RP+ao5MqToryRlqipdwLB8gtjwag8Wevc3FlS7HUWy/ino2O/p1gHs4ES63h21W2qV0b+n0fFRi30ieXnPE2ouUDJ1q1IG9/EoDL5Egiw1d0lZ0TIkvk14msKQoZlAe7go6wRVhaY6Fods=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735286337; c=relaxed/simple;
	bh=kWm704ACMu/I6MCnumojyJHpaDiGSsoI6V4xbr37/i0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ShUU7/s4dvOImpSrzUrJV1YAjuXAQIbAY7g7IPSq9y1oL2MP8Byf3aFMTUyuKfmLAnF32qhOo10DWoHmqcH2qNJ30JD6dPmrQvF6wu3cPZGaXuHWtiY2jxi+8vKbAodQzQ5ojvEZPxio1F1YcAb8cMC3txHdRsg1lzjtd/DHTwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pBrTLVeM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pBrTLVeM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44D4BC4CED0;
	Fri, 27 Dec 2024 07:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1735286336;
	bh=kWm704ACMu/I6MCnumojyJHpaDiGSsoI6V4xbr37/i0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pBrTLVeMtNGTv4PLDIrDtt6RKTDO0bPLgH4bpoHMhKQ7k8qU1LKMJxFbdzL4pV5Hz
	 wtDefHJnehxct+MvLmRPlz5GerVHkHRWmIwBGWmAhjZV55ioA72/7yGmqzSz6BXIK5
	 MDXOPwGYxocnsVf2WV4xIrX/FYJWD3UmKT3n2Ys8=
Date: Fri, 27 Dec 2024 08:58:53 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Alvaro Kuolas <kuolas@gmail.com>
Cc: regressions@lists.linux.dev
Subject: Re: Longer boot times with kernel 6.11.7 and newer (including
 6.12.6).
Message-ID: <2024122756-ravioli-rabid-5692@gregkh>
References: <CAKUwrzBKjtxYkGoL-=mrJ9PoN_PACW0VO1Si1rUdLXfvW_h1cA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKUwrzBKjtxYkGoL-=mrJ9PoN_PACW0VO1Si1rUdLXfvW_h1cA@mail.gmail.com>

On Thu, Dec 26, 2024 at 02:51:13PM -0300, Alvaro Kuolas wrote:
> Hello!
> 
> I have experienced a delay booting Gnome graphical user interface under
> Fedora 41. This occurred when upgrading to kernel 6.12.4, but I have tested
> 6.13.0-rc3 and the slowdown is still present.
> 
> I have compiled versions 6.11.4 to 6.11.11, 6.12.6 and 6.13.0-rc3 and
> traced the regression on version 6.11.7.

6.11.y is long end-of-life, we can't do anything there, sorry.  But for
6.12.y we can.

> Using systemd-analyze I gathered the following information:
> (attached are more output from the different kernels that I have tested)
> 
> -------------------------------------------------------------------------------------------------------------------------------
> 
> Fedora Kernel 6.11.4-301.fc41.x86_64
> 
> [alvarok: boot]$ systemd-analyze time
> Startup finished in 11.270s (firmware) + 4.419s (loader) + 1.867s (kernel)
> + 3.465s (initrd) + 10.087s (userspace) = 31.110s
> graphical.target reached after 10.047s in userspace.
> 
> [alvarok: ~]$ systemd-analyze critical-chain
> The time when unit became active or started is printed after the "@"
> character.
> The time the unit took to start is printed after the "+" character.
> 
> graphical.target @10.047s
> └─multi-user.target @10.047s
>   └─plymouth-quit-wait.service @8.125s +1.920s
>     └─systemd-user-sessions.service @8.094s +29ms
>       └─remote-fs.target @8.092s
>         └─remote-fs-pre.target @2.524s
>           └─nfs-client.target @2.524s
>             └─gssproxy.service @2.093s +22ms
>               └─network.target @2.091s
>                 └─wpa_supplicant.service @3.284s +22ms
>                   └─basic.target @1.715s
>                     └─dbus-broker.service @1.686s +27ms
>                       └─dbus.socket @1.676s
>                         └─sysinit.target @1.673s
>                           └─systemd-resolved.service @1.628s +44ms
> 
> └─run-credentials-systemd\x2dresolved.service.mount @2.471s
> 
> [alvarok: ~]$ systemd-analyze blame
> 13.401s fwupd.service
>  5.999s NetworkManager-wait-online.service
>  4.051s sys-module-fuse.device
>  3.970s
> sys-devices-platform-serial8250-serial8250:0-serial8250:0.3-tty-ttyS3.device
>  3.970s dev-ttyS3.device
>  3.968s
> sys-devices-platform-serial8250-serial8250:0-serial8250:0.1-tty-ttyS1.device
>  3.968s dev-ttyS1.device
>  3.967s dev-tpmrm0.device
>  3.967s sys-devices-LNXSYSTM:00-LNXSYBUS:00-MSFT0101:00-tpmrm-tpmrm0.device
> 
> -------------------------------------------------------------------------------------------------------------------------------
> 
> Vanilla Linux 6.11.7 #1 SMP PREEMPT_DYNAMIC Thu Dec 26 14:11:07 -03 2024
> x86_64 GNU/Linux
> 
> [alvarok: ~]$ systemd-analyze time
> Startup finished in 11.278s (firmware) + 6.574s (loader) + 2.310s (kernel)
> + 3.542s (initrd) + 28.050s (userspace) = 51.755s
> graphical.target reached after 28.038s in userspace.
> 
> [alvarok: ~]$ systemd-analyze critical-chain
> The time when unit became active or started is printed after the "@"
> character.
> The time the unit took to start is printed after the "+" character.
> 
> graphical.target @28.038s
> └─upower.service @1.824s +26.214s
>   └─basic.target @1.783s
>     └─dbus-broker.service @1.754s +27ms
>       └─dbus.socket @1.744s
>         └─sysinit.target @1.741s
>           └─systemd-resolved.service @1.694s +46ms
>             └─run-credentials-systemd\x2dresolved.service.mount @2.493s
> 
> [alvarok: ~]$ systemd-analyze blame
> 26.214s upower.service
> 25.112s tuned-ppd.service
> 20.057s cups.service

So upower is taking a long time now, makes sense, as we fixed a
regression there, as you found in your next email.

thanks,

greg k-h

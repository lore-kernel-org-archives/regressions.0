Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB232857EF
	for <regressions@lists.linux.dev>; Tue, 18 Nov 2025 09:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763457685; cv=none; b=Ss2yLk49L9Q59JCiJCtjdRpuMDVJYBWx2kJXv6gSKkYKlbmtD8tW9DhMAHUNbPcQDCBEZE/+k0Q+ur0gp4vSqRTHl/qMNGg9JB71Ww90cegbtLZID5owcTifWzztBlLzhq2+4xjJ71Lvd0VzzkSos5pnFsxS5tQ2i2uOb56sz3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763457685; c=relaxed/simple;
	bh=tQISW6FiWXxLUFBS/dMpwuK97kV0KcphddYbsIJhl6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O3iqkx5pZwnWfDxaz5LOUcUWiHXzApHjQdu4YNa1C9toJKzV8+i9B0GRUuPQvno8RibbXaQ6iIZC5qkVssB+fTCzRgs9bW5tHaoCiGfw0AsDsU08FODu5J/oHKxi4A2w0qSJFZ9zeVEKeuLp0twZWaP2T4B8oPuh4NPwu9hl0tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rbmpphwz; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rbmpphwz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763457683; x=1794993683;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=tQISW6FiWXxLUFBS/dMpwuK97kV0KcphddYbsIJhl6Q=;
  b=RbmpphwzdsUOL5UkPXLp2g9+zNARoKjXmMB98VVr2xJGESKF8RwzLXhs
   ZuYSMTHSqIoaQTFfThiNa1X3WE8yOO29MW9YzovyGm5idaaPOU8rTm8pj
   M3tO0yOupc4YZX0IdfS0mp1iL7dbvTLWi65yXC8LuGiVNqb17+GPn0ZUn
   rKSbcMnEkNBx7rb4kcfof2IwKC15zXqmPZODA0M8Qnu5GMK5Rp8Vz6AdQ
   qouXYfcvQ86VeIM0nOImKCv7LonYkWG9GYHi7eM8x1GLpCO5AajLQ3dbZ
   ZjHZcRzpQa+DXFOYTq6vDNYHZeVKI4lBuLybZh6P5CQ9C2bbjDMwaXkf9
   A==;
X-CSE-ConnectionGUID: LneElf1IRMixcvlIu8EMMg==
X-CSE-MsgGUID: 0t+ql7TfTbSBTb+9mQPuNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="90949331"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="90949331"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 01:21:23 -0800
X-CSE-ConnectionGUID: ZJs4cMKzR4Gi3NlgYays0w==
X-CSE-MsgGUID: B0pSCf+sQTeqSkZhthrxrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="191149026"
Received: from inaky-mobl1.amr.corp.intel.com (HELO [10.245.245.116]) ([10.245.245.116])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 01:21:21 -0800
Message-ID: <cc788286-c327-4b1f-adb4-8494c0145d74@linux.intel.com>
Date: Tue, 18 Nov 2025 11:21:18 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION][BISECTED] usb: hub: total system freeze after
 running adb
To: Forest <forestix@gaga.casa>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 Pawel Laszczak <pawell@cadence.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <qc0nhk9c6l0a08bkfeplrm3qjssgrjkvkp@sonic.net>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <qc0nhk9c6l0a08bkfeplrm3qjssgrjkvkp@sonic.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

On 11/17/25 22:18, Forest wrote:
> #regzbot introduced 8f5b7e2bec1c
> 
> Running adb (android debug bridge) commands causes the entire system to
> freeze some time later.
> 
> The freeze usually occurs within two hours of running adb, but not always.
> Stopping adb's persistent background process with `adb kill-server` seems to
> avoid the freeze. (However, this is not always possible, since the system
> sometimes freezes just a few seconds after adb is launched.)
> 
> It occurs even when no android devices are connected to the system.
> 
> I am unsure whether user activity affects how soon the freeze happens.
> 
> Observations when it happens:
> 
> - No messages are written to dmesg or syslog.
> - Virtual console switching no longer works.
> - SysRq key commands no longer work, as far as I can tell.
> - Whatever was on the display remains intact.
> - Any already-playing audio enters a short loop, as though the motherboard's
>    sound device is playing from a ring buffer that no longer gets updated.
> 
> I have reproduced it on mainline (6.18.0-rc5) and various older kernel
> versions as early as 6.12.48, built with Debian config files and
> `make olddefconfig`. Tested using Debian Stable 13.2 (trixie), and its
> adb 1:34.0.5-12 package.
> 
> Git bisect identifies the culprit:
> commit 8f5b7e2bec1c36578fdaa74a6951833541103e27
> 2025-06-11 14:24:41 +0300
> usb: hub: fix detection of high tier USB3 devices behind suspended hubs
> 
> Reverting that commit (along with two later commits that build upon it)
> seems to fix the problem in the mainline and longterm kernels that I tried.

Could you share some info about this setup:

lspci -nnv -d ::0c03
lsusb -t

Enabling usb core and xhci dynamic debug could share some light on this:

mount -t debugfs none /sys/kernel/debug
echo 'module xhci_hcd =p' >/sys/kernel/debug/dynamic_debug/control
echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
< Reproduce issue >
Send output of dmesg

If the bisected patch is the issue then disabling runtime suspend could help.
For all usb* roothubs:

echo on > /sys/bus/usb/devices/usb*/power/control

Does it affect anything?

Thanks
Mathias

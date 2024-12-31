Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9AF18CBFB;
	Tue, 31 Dec 2024 08:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735633656; cv=none; b=fbDQx8/Z/Oo/lDiP5l+rkuIZaA89DIyMablPXOjtQGA1kRCsbXEDwRxUGejWfzCrarLQ4pCn5lZnZA0SZPi1d/gIlLO6Pe6Z3G5lLWGAjdrNfbPiJaLDvaoKra06yalM6wnJ4c+64Sv8Q4TKWK3PifPXWW7pOAbyKPndY0Y1tQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735633656; c=relaxed/simple;
	bh=vdaYmVIu4nzrIC3ahqNYkLwlI2zA1IocyzDKY4qLhfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E6eHh9TZ/QYZRIuJtMMbwQVWFvjtzqbMMWJF8GRdRJJLFye9Inw0i4By7/Ul4pRLs9j6sb5qc2cqG2mok7R61e43fGCeNIWL+9aKWUpiEnsNSBykIBW2uj/BtKhsV8HpfZS0tJVbC5PVslp/8942o70K0VxTzKhbvcm6VqQSRnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ThiEI3QX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ThiEI3QX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEA08C4CED6;
	Tue, 31 Dec 2024 08:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1735633656;
	bh=vdaYmVIu4nzrIC3ahqNYkLwlI2zA1IocyzDKY4qLhfo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ThiEI3QXEa+Ti8tLVeKyEokiIu/JQ7MIv3TUj1t6HEP/3kdlBc6sDvhAqF8Oc7xN5
	 j/pa9gEpn6uZkiShsapOB+vo48xy0+WIzjJ0cWjzVaj1yR6AJs6oBrgHDMDG7x9nbx
	 CRVS6mggf3cNX0ksqVCpN7FpuUdb7gXOXZDvp6B8=
Date: Tue, 31 Dec 2024 09:26:49 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhang Zekun <zhangzekun11@huawei.com>
Cc: dan.j.williams@intel.com, linux-kernel@vger.kernel.org,
	rafael.j.wysocki@intel.com, regressions@lists.linux.dev,
	tj@kernel.org, alex.williamson@redhat.com, chenjun102@huawei.com
Subject: Re: Possible hungtask issue will be introduced with device_lock() in
 uevent_show()
Message-ID: <2024123128-monetize-outtakes-3260@gregkh>
References: <172790598832.1168608.4519484276671503678.stgit@dwillia2-xfh.jf.intel.com>
 <20241231075608.84009-1-zhangzekun11@huawei.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241231075608.84009-1-zhangzekun11@huawei.com>

On Tue, Dec 31, 2024 at 03:56:08PM +0800, Zhang Zekun wrote:
> Hi, Dan, Greg,
> 
> We have found a potential tungtask issue has been introduce by commit 9a71892cbcdb ("Revert "driver core: Fix uevent_show() vs driver detach race""), which revert the rcu in device_uevent but reintroduce the device_lock() in uevent_show(). The reproduce procedure is quite simple:

The revert just puts the original logic back in place, so this is not
anything new that has been introduced, right?  It's just that the
attempted fix didn't work, so a different fix needs to happen.

If you could help debug the original fix, that would be most appreciated
as none of us here are arguing that there isn't a bug present, only that
the fix caused different problems which required it to be reverted.

thanks,

greg k-h

Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2647A156C76;
	Thu, 16 Jan 2025 10:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737022253; cv=none; b=QTdmWkUjiIgcZNo9pUUHJv818NEQl1Qc2xtMgSLLOGyCRDQvfB7bkW31onMjfzAS7kIMUV8erw4tWOCh6b4hX3bkHITvYguj0oquCk/Ul9tU0Y+k88qXP1zNR6i4sOEPSBIv9/niHzh4NsVRFeHZsn5CThwnCOpFJ9nJzdhZXAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737022253; c=relaxed/simple;
	bh=hFXn6V9wu+6dGAeAVtjg/dg83ddGIjHGYIkVRtwPfak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GoQOqg+UPY618oklJVPMELjUmo2vlvBvmsHvJf/nBBYQcpuCoI1JZbOGaURoFDDYmamZgYeX5G8hPx2OKM8+Fh2GazZH0QweHKZyqHNuz3n/dKFlkOyfi0fZnLIWKbMjzQb+pVxLNSc6OL7c6GN6xBgh5wZkvGkpEMsMdztdMCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZZLAl5m2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZZLAl5m2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A498C4CED6;
	Thu, 16 Jan 2025 10:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737022252;
	bh=hFXn6V9wu+6dGAeAVtjg/dg83ddGIjHGYIkVRtwPfak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZZLAl5m2PZk+1T19M1V2nUM2xopFH9Do8KGu+DPUl46kKzNJk7fovQipiaXxt2bWE
	 Td4aWkbcixqRCaQmssE1uXrXehZqS5/RrPFf9Qh5kdzoY6GUyn1JsAHib9non+adkX
	 lYBpF161heZeV2mcZtbLtrZBY3DS5hwTJ1gLReL4=
Date: Thu, 16 Jan 2025 11:10:50 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Forest <forestix@nom.one>
Cc: linux-kernel@vger.kernel.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	linux-usb@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [PATCH] USB: Add LPM quirk for sony xperia xz1 compact
Message-ID: <2025011608-shady-recite-62f6@gregkh>
References: <10kgojpeckdq0pb4d95k1prma49du5itre@sonic.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10kgojpeckdq0pb4d95k1prma49du5itre@sonic.net>

On Wed, Jan 15, 2025 at 04:18:22PM -0800, Forest wrote:
> Since USB 2 LPM was enabled for this device by 63a1f8454962
> ("xhci: stored cached port capability values in one place"),
> the fastboot tool for communicating with Android bootloaders no longer
> works reliably. Various fastboot commands are affected, including the
> following, which usually reproduces the problem within two tries:
> 
>   fastboot getvar kernel
> 
> A typical error message when that command fails:
> 
>   getvar:kernel  FAILED (remote: 'GetVar Variable Not found')
> 
> Adding the quirk resolves the regression. No drawbacks are expected,
> since the device uses different USB product IDs outside of fastboot
> mode, and since fastboot commands worked until LPM was enabled by the
> aforementioned commit.
> 
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/hk8umj9lv4l4qguftdq1luqtdrpa1gks5l@sonic.net
> Signed-off-by: Forest <forestix@nom.one>
> ---
>  drivers/usb/core/quirks.c | 3 +++
>  1 file changed, 3 insertions(+)

Always use scripts/get_maintainer.pl to get the correct people to cc:

Also, we need a "real" name here, sorry.

thanks,

greg k-h

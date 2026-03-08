Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391F417A2F6;
	Sun,  8 Mar 2026 09:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772963255; cv=none; b=M3pMuV3rIR04INR5ppzACSf0AdbQ8Xt/RMmCmlop0iY1OhnZ8F3NkLWWYJ6AT3vyfNf7W3GmjzhPigSMuV1tSyXlLZZWcGanWjLzWrpxa4nCUVLvlCEwYI0l6rGqoxqIFYHfBG2inTLf3LqbvuWeC50FmBOqw74lSKadPUpZo2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772963255; c=relaxed/simple;
	bh=PJ/9tu4qNJoagggBdPlz3TTFrsJFAYDkXxreRvZYzbc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uvROFIsAiPSLn3jS6g5pFVkxrPp1clqfi30KyrreArF6f+IZYZIi/ZicrC7oybQijep6aTdn1NTzLz77Hi/Tnbzlugdm+oD4So8Y/2//ST6hqmrKKzI19jyH8Be7vpibKbiexE0hR/Mus1PTDiAAOxiFbXOOwf/jtH9wgUpFjlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=inkuBTNQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="inkuBTNQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64498C116C6;
	Sun,  8 Mar 2026 09:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772963254;
	bh=PJ/9tu4qNJoagggBdPlz3TTFrsJFAYDkXxreRvZYzbc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=inkuBTNQQQ2/C91px9u6cd8g6uvQtqjOLZrbOBsE11CrW/uQaL2p2G9DhEE7iHZJ1
	 1rj2EA7lUYmYzlvnkhv47/WMkBIzIjyoqoihhn36HfNTOmoxJEMywf22x5OJXJL+dT
	 3U9ZzDQRV5O32oYL9U5AI791+YbkbSv/lScJ1WMY=
Date: Sun, 8 Mar 2026 10:47:20 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: hgfdgjn <shichuanyim@gmail.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [BUG] HDMI monitor shows no signal when the refresh rate is
 higher than the default 60Hz
Message-ID: <2026030839-applied-prominent-b774@gregkh>
References: <CA+tjKGrmADg=oG9CT74_mgGNN3h17=LLmnv51K=MggAqo7q2Eg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+tjKGrmADg=oG9CT74_mgGNN3h17=LLmnv51K=MggAqo7q2Eg@mail.gmail.com>

On Sun, Mar 08, 2026 at 05:42:39PM +0800, hgfdgjn wrote:
> Hi maintainers:
> 
>   After updating to v6.19.6 on Arch Linux, if I set the refresh rate
> higher than 60Hz, the monitor displays "No Signal".
> I tried bisecting and found:
> > # first bad commit: [3471b9a31ce352ffb343cf02a991261880aac3a7] drm/amd/display: Rework HDMI data channel reads
> 
> This issue on my machine was caused by this change:
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c
> b/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c
> index 267180e7bc48..5d2bcce2f669 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_ddc.c
> @@ -549,7 +549,8 @@ void write_scdc_data(struct ddc_service *ddc_service,
>      /*Lower than 340 Scramble bit from SCDC caps*/
> 
>      if (ddc_service->link->local_sink &&
> -        ddc_service->link->local_sink->edid_caps.panel_patch.skip_scdc_overwrite)
> +        (ddc_service->link->local_sink->edid_caps.panel_patch.skip_scdc_overwrite
> ||
> +        !ddc_service->link->local_sink->edid_caps.scdc_present))
>          return;
> 
>      link_query_ddc_data(ddc_service, slave_address, &offset,
> 
> 
> It appears that scdc_present is always false on my device.
> I reverted the change to write_scdc_data(), and the monitor works
> normally at high refresh rates.

Can you cc: the developers and maintainers of this change to let them
know?  Otherwise they will not notice it.  Also, does 7.0-rc2 show this
issue?

thanks,

greg k-h

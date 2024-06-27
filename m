Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA4D1591F0
	for <regressions@lists.linux.dev>; Thu, 27 Jun 2024 13:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719495458; cv=none; b=cIueHnw1Azw7+1JigAjMFqbYsq9vHztYE42hd7yQV1uOl8ghCffYhhQ1o2B5YOo00pEuXso0pyVoYQ9eeB1TYD4FdIDfTGac2fQKiVjWUHuDF5eF1TOW5RJkfwEbU4GR6VbgO5gBccRsXaexW4XKzPYcY+hdGPb8kUDkMQ25/B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719495458; c=relaxed/simple;
	bh=EYXkiugLMl7Qig9AoKuF3ghnTZgptK5nSfVv935sqBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hW/PAxFRDe8x+dn7K450+TD8M52oKu6NlbpQjuDC26g7dmx8m4jfHhgs9HVhdCro21SDTvwq8M8frOQJ7fqVHMHWWu+lDrTjWlF/qJa82Q9GS3g1dJvL4756rxbpnDRb6AhIGos218F2OoOsftOWlpaLo2mYNT5guj6mGqGEZPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PuYqE71n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PuYqE71n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AC68C2BBFC;
	Thu, 27 Jun 2024 13:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1719495458;
	bh=EYXkiugLMl7Qig9AoKuF3ghnTZgptK5nSfVv935sqBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PuYqE71nAMDxkos9MR3A11XtcDYVGETtSI1OYWPBeo8Naw9GmjgfTKZFXprepMEKc
	 A0gP83g2jVdbaEz5pHOyaO7QjdD8X1Jn2WnXW7WJXmneQhbfECkmNPAT9rJnAiOtiC
	 r0m76MQ4jhKRX0tH9QU80L74ixrQiYG+Po14H0gA=
Date: Thu, 27 Jun 2024 15:37:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?Steinbei=DFer=2C?= Sebastian <Sebastian.Steinbeisser@lrz.de>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
	"pc@manguebit.com" <pc@manguebit.com>
Subject: Re: Potential smb/dfs regression introduced in kernel 6.6
Message-ID: <2024062719-landslide-customize-6415@gregkh>
References: <dd878fc236840921d3e31944e26694fed941d0c6.camel@lrz.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dd878fc236840921d3e31944e26694fed941d0c6.camel@lrz.de>

On Thu, Jun 27, 2024 at 01:28:29PM +0000, Steinbeißer, Sebastian wrote:
> #regzbot introduced: v6.6
> 
> Dear Kernel developers,
> 
> I'm a NetApp storage admin and we started receiving reports by our
> customers that subvolumes of exported volumes can no longer be accessed
> transparently but need to be mounted separately.
> 
> The way this works with NetApp is that a volume, e.g., myvol, within
> the storage virtual machine (SVM - vserver) is exported and can be
> accessed by mounting //SVM_IP/myvol into, e.g., /mnt/myvol
> Subvolumes can be added to the junction path, e.g., mysubvol can be
> mounted under myvol and used to be transparently accessable via
> /mnt/myvol/mysubvol just like any directory within myvol would be.
> This now is no longer the case and the subvolume needs to be mounted
> separately.
> 
> This has started when customers upgraded distributions that shipped
> with kernel >=6.6.
> https://wiki.samba.org/index.php/LinuxCIFSKernel#6.6_(module_version_2.45)_(47_changesets)
> 
> We've been able to reproduce the behavior with Fedora/Ubuntu and
> kernels 6.6 to 6.9.

Any chance you can use 'git bisect' to find the offending change if you
can reproduce this?  And you might want to cc: the smbfs maintainers.

thanks,

greg k-h

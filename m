Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5227B3A0B11;
	Fri, 20 Mar 2026 12:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774010062; cv=none; b=M3W6ZvB43qF1Bk+QJey2oYXUzndOoJlydPZwYVThNk/wnmOVdFZnV79uY99ao59Fxi6vSmPjhW7CQaELVwKA0jscQ2FJflNcLzALMG6vjjaoDojVPYC9TLoQ0+0RtvapoNFan3XIcCnIqEJYXv4JSNnUaSicihA8Lfb1dvgOck0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774010062; c=relaxed/simple;
	bh=0kuYHYKOa9cOrOL9pXPthIlfZkSzriMUGOsY9d18FZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j6O6VrhzbycqL9chHjWmLScTbpGciIvxrOt6ZKMru8pSO4cYk3D9KtzPPyLQsezrKxujv8sUU5GN/qdSmRO2yUI1cvHY578w+qeA1xwe4mMII/hAJ8YdZeiVlYDOkwgHn3Eg3/rQ8cFtaYKBRLJKL/eLSQXMqvjXXDu8A8gw4qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qYiaMxg3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qYiaMxg3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14B16C4CEF7;
	Fri, 20 Mar 2026 12:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774010061;
	bh=0kuYHYKOa9cOrOL9pXPthIlfZkSzriMUGOsY9d18FZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qYiaMxg3yI/CLbApQPzod5zZ5SWNhcey2+TcuZbO/iCiHcXqwio0qedNo2flkONcn
	 A8Eo5rMPlEUotkpl1ULTVLCH1C6sQgSSlRQek0dgkUjzwRgJDNydHbHc8NzCU7Un+u
	 3MZWgA3TGyNxNExp/utZmQTdAkirUEQ6NEQb7Y+M=
Date: Fri, 20 Mar 2026 13:34:17 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Mark Somerville <mark@qpok.net>, stable@vger.kernel.org,
	Mario Limonciello <superm1@kernel.org>, regressions@lists.linux.dev,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Xinhui Pan <Xinhui.Pan@amd.com>, Sasha Levin <sashal@kernel.org>
Subject: Re: [REGRESSION] Unable to pass AMD RX 6400 GPU via VFIO
Message-ID: <2026032040-yelp-antidote-3f60@gregkh>
References: <1be114e1130ca59ee91fc5a73aaf43a912d408ea@qpok.net>
 <2fd785ce-bf37-4875-a9a4-92422870f5b5@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fd785ce-bf37-4875-a9a4-92422870f5b5@leemhuis.info>

On Fri, Mar 20, 2026 at 12:42:04PM +0100, Thorsten Leemhuis wrote:
> @greg/@sasha: I might be missing something, but looks like one patch
> that was backported missed two series where it's needed (see below for
> details):
> 
> On 3/20/26 10:28, Mark Somerville wrote:
> > 
> > I run Debian 13 stable (6.12 kernel) and have encountered a regression.
> > 
> > My machine has three GPUs, the iGPU that is part of my 7950X and two dGPUs - one NVIDIA 3090 and one AMD RX 6400. I use the iGPU for the host and only use the two dGPUs with virtual machines via VFIO with libvirt.
> > 
> > Although I have specified kernel parameters vfio_pci.ids for the GPUs, I have not blacklisted the amdgpu driver so that the host iGPU can operate.  Previously, starting a VM with the RX 6400 dGPU assigned to it (via VFIO) would work fine. However, doing this with more recent stable kernels causes the machine to hang immediately (and then, ultimately, reset after a while - ~30s). No errors are logged, at least as things are configured just now.
> > 
> > I can reliably reproduce this crash and a bisection revealed the commit that introducted the problem: 8140ac7c55e75093a01c6110a2c4025fe7177c57.
> 
> That is 28695ca09d3264 ("drm/amd: Clean up kfd node on surprise
> disconnect") [v6.19-rc6, v6.18.7, v6.12.67 (as 8140ac7c55e750), v6.6.122].
> 
> A fix for that f7afda7fcd169a ("drm/amd: Fix hang on amdgpu unload by
> using pci_dev_is_disconnected()") [v7.0-rc1, v6.18.17, v6.12.77].
> 
> @greg/@sasha: Wondering why it's not in 6.19.y and 6.6.y. It failed
> there first, but later was applied to 6.18.y and 6.12.y:
> 
> https://lore.kernel.org/all/?q=%22Fix+hang+on+amdgpu+unload+by+using+pci_dev_is_disconnected%22+%28f%3Agreg+OR+f%3Asasha%29

It's in the queue for 6.6.y, I've queued it up for 6.19.y now too.

thanks,

greg k-h

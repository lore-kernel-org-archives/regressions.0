Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0CF357CF3
	for <regressions@lists.linux.dev>; Mon, 31 Aug 2026 07:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788160549; cv=none; b=bL1C61PxQltZH/9KnzgdY4rnAOcU9AgVYybrt0xURCDtM8s4H9D0wTNYeoNbHYjq73IAz/eEzBsmyRyKOtEA+Va6WKWy3UaeRk4BBJI/Y+1CFTemuf8BjvD1JwLtpbPIoqdHm7MnmaC/xfLeyrG4k/JTvnVhvsVPPKSdiIQLVF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788160549; c=relaxed/simple;
	bh=vjbCqHxjtFTIaSp2884poNh+3zVvB+M81WL4OZjqgOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fQFBx0JJQN52azDXaE5/IwTAenEVNPe+8W30g9BJ0kGSVdeG1qqpLW7xdaFT+a20tRXXc1EjoYQ/Z8FlEMaEHqi3ri4qMwtu00+NPRluDDLt08nuLDqVJHErm0+T8RmUtW75ieUw5KeOkKK/eT5djKDvgO0k5kCAZFAKGufs7wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=N5ZcQkd3; arc=none smtp.client-ip=188.68.63.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="N5ZcQkd3"
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4hYKy90q47z62M3;
	Mon, 31 Aug 2026 09:15:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1788160513;
	bh=vjbCqHxjtFTIaSp2884poNh+3zVvB+M81WL4OZjqgOo=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=N5ZcQkd3qBo+3na89CFG2s/lDwxwYlE9pyQVJjkk++QKvfeXX4KOnB/hwVtbGcqfP
	 GrCZmzHCWq8SgKxbVKSER1R/RQ46KSoMehuMtTUh4HKdWL/E4fPm1eqvniAPYBpyuj
	 NzpZZ70HR2NXCZq9TzyDmD3nKIXFj1K2TxudpqqAOwYyy0ZNYs4nz7fNgEstsxNMex
	 mD2cFfmJOSCua/aVlr+/+Rv906fPJf0VgK5LJsgaWaCFSNlL6k2FNJUH/m8nA+SSwP
	 WY4BKCq1WPnwZZ5OpmImJDqJGkkpQ7/thqsug9k+mt+Ihv3eX4Izk0ErjmUeLVDxjy
	 iuTKI1Rw0+puw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4hYKy907LRz4xSl;
	Mon, 31 Aug 2026 09:15:13 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4hYKy84yqZz8sch;
	Mon, 31 Aug 2026 09:15:12 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 08FE15FA9D;
	Mon, 31 Aug 2026 09:15:11 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <6e0da6ff-63ba-4043-9d48-5ae01ed657d0@leemhuis.info>
Date: Mon, 31 Aug 2026 09:15:11 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION]
To: David Stefan <stefan.davidalexander11@gmail.com>,
 regressions@lists.linux.dev
References: 
 <CAABU8jnNMoyLBCmaxs+iC8WgZiUH4=yFSiHepNpqPiBQfA56Zg@mail.gmail.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: 
 <CAABU8jnNMoyLBCmaxs+iC8WgZiUH4=yFSiHepNpqPiBQfA56Zg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <178816051223.2958585.10614757349499117349@mxe9fb.netcup.net>
X-NC-CID: 7kyvMng786NmGqC0EQtajbYiIbMrnpCVUd37KPnvBkOYS2chzbk=

On 8/28/26 20:18, David Stefan wrote:
> On Fedora 44 Everything (netinstaller) with kernel
> 7.1.10-200.fc44.x86_64 running on an Intel Core Ultra X7 358H with
> 32GB LPDDR5 system RAM, a kernel panic can be experienced during
> certain gaming workloads. Haven't been able to create a very detailed
> reproduction method, but roughly, it occurs after about 30 minutes,
> specifically in Cyberpunk 2077. At this time, the iGPU (Arc B390) is
> at 100% utilization (checked with nvtop utility), the game freezes
> with the audio looping for a second before the kernel panic screen
> appearing for a short moment, then the system reboots. This issue
> seems to occurs sooner at higher resolution settings (4k, as opposed
> to 1080p in the original occurrence), however, the kernel panic screen
> can no longer be specifically identified, otherwise the crash behaves
> the same (freeze, looping audio, reboot)
> 
> I have not been able to reproduce this on the previous kernel, being
> 7.1.9-200.fc44.x86_64, after individual 3 tests.
> 
> I have attempted to use kdump-utils, but so far, it does not seem to
> have been triggered to dump the vmcore.

Thx for the report. Please try if 7.3-rc1 fixes the issue (7.1. is
nearly EOL anway). If not, please check for exiting reports at
https://gitlab.freedesktop.org/drm/xe ; if there are none, please report
the issue there and drop a link to the report here afterwards.

Ciao, Thorsten


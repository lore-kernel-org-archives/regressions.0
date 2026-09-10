Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [188.68.63.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920803E1D15
	for <regressions@lists.linux.dev>; Thu, 10 Sep 2026 08:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.68.63.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030602; cv=none; b=dD3Iw0c59bknQqJr5NFnZC8UtPeLDY4+Y0WkNCvturixHFhqxTKaBOFWo903UUejNfKy82XfwFiAZwLNBxDP/98aLixEL5BATNAMKkbmkTX3nZWCwsjh84IlVOXaHvcz3gkgvmBL/OeTzXPYhrNks2G8E9zBYPm/I4NB5dYZn+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030602; c=relaxed/simple;
	bh=sOnA8vUhUeCMkhdFGl1DJZLapTonfReeGFP2qElydcQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gu6cqGOooUq5pRqzxaUZoYfFnh+DInnxB3ol1bi/OCW91Ndwb87BEqSD2Y1cwB9WLjGlEUKeyIL7A7yqK8FPyu2ciZLYr0ACVEiqcnr7N2+9FrQsDzWKYstDqZZ2BqtE3F7SmEGt2xBDnAsOjloFYDk1R/d0HngJcA1lFcOJpLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=SjpW5xzi; arc=none smtp.client-ip=188.68.63.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="SjpW5xzi"
Received: from mors-relay-8202.netcup.net (localhost [127.0.0.1])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4hgWkR69f6z4F2q;
	Thu, 10 Sep 2026 10:56:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1789030591;
	bh=sOnA8vUhUeCMkhdFGl1DJZLapTonfReeGFP2qElydcQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SjpW5xziWoe97Q/2HYy0AFApDvcLXQUpAYaTyaVkFfnyvmmZDDOr5ytxZj/QSGhQ+
	 xu5RDDjnk1P+SqdbtrFLH9egeyxhV2orbvbsm3+0WHf3k2tqrc4guvawFDVIhS2STe
	 9IAsWoLFfMSxIdbOf7RF0ZSObV2uuRibbh8SXGURQOZESZ5z42s86dc0WWaMZBS3tU
	 TtzqW0xrzlg5oPk4q0e8oTyhplxHjsm2WUjFS6NnPSWy+fi34zpb1W1gaHPXRSrbIt
	 M1ffB2DrGLM4Zqg1pJcbguX9GnG1WGbmyGbPpBlMwzBvvX1gz9GB4dvqIfOJCn/F5N
	 pK8z4UC5gZUig==
Received: from policy01-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8202.netcup.net (Postfix) with ESMTPS id 4hgWkR5SQnz4F2j;
	Thu, 10 Sep 2026 10:56:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy01-mors.netcup.net
X-Spam-Flag: NO
X-Spam-Score: -2.901
X-Spam-Level: 
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy01-mors.netcup.net (Postfix) with ESMTPS id 4hgWkQ0MWNz8tcG;
	Thu, 10 Sep 2026 10:56:29 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 37AE3604A4;
	Thu, 10 Sep 2026 10:56:29 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <e8fd955b-fadc-497a-899b-a13502f0d7f0@leemhuis.info>
Date: Thu, 10 Sep 2026 10:56:27 +0200
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] media: ipu-bridge: IVSC camera no longer probes
 since v7.2 (CVS fallback returns the IVSC platform device)
To: Martin Jeanne <martin@badakan.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Cc: Miguel Vadillo <miguel.vadillo@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>, Lixu Zhang <lixu.zhang@intel.com>
References: <2f8b67fc-ec2a-46f6-9ee0-06279e612bde@badakan.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <2f8b67fc-ec2a-46f6-9ee0-06279e612bde@badakan.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <178903058958.1248381.874113805323937067@mxe9fb.netcup.net>
X-NC-CID: /mRrwx+uvQBMiAclwn9H/0XOoBNOYPcPqDDaD6Mm99k42HfPMy0=

On 9/10/26 10:41, Martin Jeanne wrote:
> 
> Since v7.2 the built-in camera of my Dell XPS 14 9440 (Meteor Lake, IPU6
> [8086:7d19], ov02c10 sensor behind an IVSC, ACPI INTC10CF) is no longer
> detected. v7.1.9 works, 7.2.3 (Arch Linux distro kernel) does not, on
> every boot.
> 
> The only change to this path between v7.1 and v7.2 is
> 
> c6b1b34b5090 ("media: pci: intel: Add CVS support for IPU bridge driver")

Thanks for the report. Have you seen or maybe even tried applying
"media: ipu-bridge: do not use the CVS device lookup for IVSC", which
fixes a problem with the commit you mentioned and sounds somewhat
related to my (but I only looked briefly):
https://lore.kernel.org/all/20260902211524.5572-1-gvozdoder@gmail.com/

Ciao, Thorsten
> Before it, ipu_bridge_get_ivsc_csi_dev() returned NULL when the IVSC
> platform device existed but its MEI CSI child had not been enumerated yet,
> so ipu_bridge_init() failed with -ENODEV and the IPU6 driver deferred probe
> and retried later. v7.1.9 log:
> 
> intel_vsc intel_vsc: silicon stepping version is 0:2
> pci 0000:00:05.0: deferred probe pending: intel-ipu6: IPU6 bridge init 
> failed
> pci 0000:00:05.0: Found supported sensor OVTI02C1:00
> ov02c10 i2c-OVTI02C1:00: supply dovdd not found, using dummy regulator
> 
> With the commit, that case now falls through to the CVS fallback:
> 
> /* Fallback to platform bus for CVS device */
> return bus_find_device_by_acpi_dev(&platform_bus_type, adev);
> 
> Here the IVSC ACPI device is itself on the platform bus
> (/sys/bus/platform/devices/INTC10CF:00), so the fallback returns it, the
> bridge takes it for the CSI device and succeeds immediately, and the
> software nodes end up on the wrong device. When mei_csi probes ten seconds
> later it has no fwnode and fails hard. 7.2.3 log:
> 
> intel-ipu6 0000:00:05.0: Found supported sensor OVTI02C1:00
> intel-ipu6 0000:00:05.0: Connected 1 cameras
> intel_vsc intel_vsc: silicon stepping version is 0:2
> ivsc_csi intel_vsc-92335fcf-3203-4472-af93-7b4453ac29da: mei-csi probed 
> without device fwnode!
> mei intel_vsc-5db76cf6-0a68-4ed6-9b78-0361635e2447: deferred probe 
> pending: (reason unknown)
> 
> No i2c-OVTI02C1:00 device is created and libcamera reports "No sensor found
> for /dev/media0". The function is unchanged in linux-7.2.y and in master.
> 
> I think the CVS fallback should only be taken when no IVSC platform device
> exists at all: when one is found but its MEI CSI child is missing, keep
> returning NULL so the IPU driver defers as before.
> 
> Happy to test patches.
> 
> #regzbot introduced: c6b1b34b5090
> 
> Martin Jeanne


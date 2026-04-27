Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AF527FB2A;
	Mon, 27 Apr 2026 06:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777272441; cv=none; b=Mz0tT+V5yCBqQtj1jJODVXKUQo3p+cMpEPAYBb2xxWLZuUbNIoHWJm8LJfHncIjpfvAsnFFAev2BWehmNITZ++1o0LoIN2EmI4Bitoopi0p4seg2vrgNb6aCSoz4cg0Jekg63v7Sc0hhipS69hmpxgntZCcULwnBF7N/Y0mF2Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777272441; c=relaxed/simple;
	bh=ilnIqpXFCyNt6g6RokOmstrJQTMIjyHCwgEExR/hbPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eNtzB+fYptOvf6duINfmA1PVQX/WFM8kP9W/Q8AK9mXTaWXGWvBEHUd803vrbySvq0MfcG0YlYjbBo2yLG5htWnoZ1uwku5X81m8f2aWJpSvpRanScayNh4K2CxctaxkU4Y/++32wbggWxo+O86WGSes4dE826d1AOLZdw72s34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=tVn55DDp; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="tVn55DDp"
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 2944B1F94F;
	Mon, 27 Apr 2026 08:47:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1777272429;
	bh=kbd+KJ62CZU4qnR3q8Wb/lGJuOs9KI6EpKwpM2lUoVc=; h=From:To:Subject;
	b=tVn55DDp/bNzLaXOdmrsekwW1j/RGVrzSryO6xtEvOGnM47lLZu4sHZoIbLZ3O50D
	 QLuh58iINvRQlZPI2oGj7ijDMlBombEcGp2s8l7Q3FBbnFd61SujArKZkArTLsgeQ/
	 8KL7u/Ias7XgtOuEtORdSLFCSDGyrOmLvQ3r7WQy50GvXVY8+M+84PkbchtzHu7Fmc
	 d/yTv5mVVO8G+2veajDbG2BO9od7+77/ts0/pSmt1iVFL4SltVKOxvDZEc53S2gPY3
	 w78TFRrQa3eRrvWRfBPkMUx69iEKQcoQ3jWRrCVcLMHByifQEwQXtJYW9yqeAZSiv0
	 6hIZ5IIubfeSw==
Date: Mon, 27 Apr 2026 08:47:04 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Frank Li <Frank.Li@nxp.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev,
	regressions@lists.linux.dev
Subject: Re: [PATCH v2 6/9] soc: imx8m: don't access of_root directly
Message-ID: <20260427064704.GA17710@francesco-nb>
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
 <20260223-soc-of-root-v2-6-b45da45903c8@oss.qualcomm.com>
 <6593091.DvuYhMxLoT@steina-w>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6593091.DvuYhMxLoT@steina-w>

Hello Alexander, Bartosz

On Tue, Mar 24, 2026 at 11:24:09AM +0100, Alexander Stein wrote:
> Hi,
> 
> Am Montag, 23. Februar 2026, 14:37:21 CET schrieb Bartosz Golaszewski:
> > Don't access of_root directly as it reduces the build test coverage for
> > this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
> > to retrieve the relevant information.
> > 
> > Suggested-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> today I noticed the following warning running next-20260323:
> > caam 30900000.crypto: No clock data provided for i.MX SoC
> 
> This happens when there is no matching against the soc_id.
> 
> Checking the source it turns out this patch is the cause that the SoC info
> does not provide soc_id anymore.
> next-20260323:
> > $ grep . /sys/devices/soc0/*
> > /sys/devices/soc0/family:Freescale i.MX
> > /sys/devices/soc0/machine:TQ-Systems i.MX8MPlus TQMa8MPxL on MBa8MP-RAS314
> > grep: /sys/devices/soc0/power: Is a directory
> > /sys/devices/soc0/revision:unknown
> > /sys/devices/soc0/serial_number:0000000000000000
> > grep: /sys/devices/soc0/subsystem: Is a directory
> 
> reverting this patch (2524b293a59e586afd06358d0b191ab57208a920):
> > $ grep . /sys/devices/soc0/*
> > /sys/devices/soc0/family:Freescale i.MX
> > /sys/devices/soc0/machine:TQ-Systems i.MX8MPlus TQMa8MPxL on MBa8MP-RAS314
> > grep: /sys/devices/soc0/power: Is a directory
> > /sys/devices/soc0/revision:1.1
> > /sys/devices/soc0/serial_number:469677A693A4B8CE131D180033E44903
> > /sys/devices/soc0/soc_id:i.MX8MP
> > grep: /sys/devices/soc0/subsystem: Is a directory
> 
> soc_id is restored. Now that I write these lines I noticed that
> serial_number also contained empty value which is restored with the revert.

Any update on this? I would say this is a regression in 7.1-rc1.

I noticed the same issue, and CAAM is not working.

[    0.000000] Linux version 7.1.0-rc1-0.0.0-devel (oe-user@oe-host) (aarch64-tdx-linux-gcc (GCC) 15.2.0, GNU ld (GNU Binutils) 2.46) #1 SMP PREEMPT Sun Apr 26 21:19:00 UTC 2026
...
[   10.611139] caam 30900000.crypto: No clock data provided for i.MX SoC
[   10.611211] caam 30900000.crypto: probe with driver caam failed with error -22

Francesco


Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7417E1990C1
	for <regressions@lists.linux.dev>; Thu, 19 Sep 2024 08:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726736001; cv=none; b=n8xbT1MiX8U62/oWrV0EhcrQiy3T1PhDKPfX3VV006SWbhz4EzwkIIKe0tKNrae7R3BYhIrZbrfUVEQLAhERGe4diVTL/qU3g/VjVGUisWw7S3LMSNoSDwcu/SJzajrBne3XucJ19vmBHNxJRiqawY4CSyu3Vz1IyuqT3SvL5Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726736001; c=relaxed/simple;
	bh=jmQGSHPQAAX/GFq/B1HD2tAS5MutC16GzgAMXMtyErU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uD87c4xHn5cuJcdZdMloA9q3LbYN6wdvw5esRBtrVrhxZIVz7zDeHt1Q8caLa75ltpL/8S/3nSpNrQzOsMHqQqx5jcYihrXdNzcRdxy1m3mcLHEusDDnrXJnZpVcSpFUDX04kVZUQ3pIiCwH+WGLJuwmfk6W3880hUraTDllqs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=T5c+BgRI; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="T5c+BgRI"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f759b87f83so5372971fa.2
        for <regressions@lists.linux.dev>; Thu, 19 Sep 2024 01:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726735997; x=1727340797; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9ip5fmGFn7hygDUeJp4dufO1rEFoOFFXq7aKfuDJ9XE=;
        b=T5c+BgRIYbbLvupbrQYSNpQwj2ZqKRSk1AFo4uxJdoXG1RwSZGatDZ2pE+n7UMOWOm
         FPT7O52TuQ/tkQMequGo/Dci2d4RfU/sS2TeXxDTasp6WvPpcTLXEBNUJ2sN9R0Vkejf
         Mplx9T3WZgENZUNftsQBEOJW/XKhdyS8uRAMuHfNcCKrv+jhWTwRzfHCBFPzpmNIpiEs
         YPr+4DCfXvtrQ26GvQVmR+euDn5Fz7FhHau7Xx4RbbdRyOCxoTt2D8aChso85iTF4hd6
         hpkMUgaFL2byyVdvny+vNr4RMAwTr/z1pzufxp20Y5J6xA4Nv5RRSQACyej1WhZLBx8M
         2JUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726735998; x=1727340798;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9ip5fmGFn7hygDUeJp4dufO1rEFoOFFXq7aKfuDJ9XE=;
        b=T+akhO83BRAeBWWiKOVQo5JwJlWE07LW5+Y0JU+NyUQWy+JLWMXIgjQwpnIHYOc2RI
         yZ3xY86VevHhmxhkS0044cW3gm4/Lbnx5seGv/AwyMFb+cqpTGcDtFTk2wAvOy4+Aqhv
         VJXewQI+zaHI70bGR9hLEIIUNdM1QWaLCAN7/ZOla8U1P6z0HaNx9H0x75wRdEUJPcSq
         3rGeujqCoWaaShWTln5k3BEdKgoIfZahzerzKx6dR03xRAOWfIcT+g6JM6m+bp2X+TPC
         SnI7SMJ5GAVaEHwKXF2oaCW5lNycmsQ3hMoeFWriAI+/BR8bSCGgXA6dGnv6G6UUchUF
         gA9A==
X-Forwarded-Encrypted: i=1; AJvYcCV3eibFi6UNuLbZeLXd1m3n/nX8XOPTkDK/CPmyguAYCpziYzGsJsCd6/VAV8/P08smtm/mS8PocEUcFg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yycx9FmOiYuB62AF3JtKjLkyaydzqJ95WzO/+efAQUmr0Y+7Gp0
	CLN90v4vlIQU0zOcJvnW7Lp8BrwGW9+W76MKbsggYQLAkHefHU60idDoSRcO7DI=
X-Google-Smtp-Source: AGHT+IExHV10Jhw7pzq6Z+rh3ETzFIGUY1KRRXUiCBSFN21i+8wI32UjyZymk12trNBAHKYmGerSpA==
X-Received: by 2002:a05:651c:1549:b0:2f7:631a:6e0d with SMTP id 38308e7fff4ca-2f787dc3b59mr141352651fa.12.1726735997390;
        Thu, 19 Sep 2024 01:53:17 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207945db10csm76076095ad.53.2024.09.19.01.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 01:53:16 -0700 (PDT)
Date: Thu, 19 Sep 2024 10:53:05 +0200
From: Petr Mladek <pmladek@suse.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
	regressions@lists.linux.dev,
	John Ogness <john.ogness@linutronix.de>
Subject: Re: Linux fails to ACPI S3 supend on Dell XPS 13 9630
 (6.11.0-04557-g2f27fce67173)
Message-ID: <ZuvmcclM_HzdZtwP@pathway.suse.cz>
References: <18784f62-91ff-4d88-9621-6c88eb0af2b5@molgen.mpg.de>
 <154114fb-276f-45f6-bba0-98133c7c5d4d@molgen.mpg.de>
 <3b600845-77d5-42d3-8556-53cc0b2eab25@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3b600845-77d5-42d3-8556-53cc0b2eab25@molgen.mpg.de>

On Thu 2024-09-19 10:17:24, Paul Menzel wrote:
> Dear Linux folks,
> 
> 
> Am 19.09.24 um 07:51 schrieb Paul Menzel:
> 
> > Am 19.09.24 um 07:51 schrieb Paul Menzel:
> 
> > > On the Intel Kaby Lake laptop Dell XPS 13, Linux 6.11.0-04557-
> > > g2f27fce67173 (“6.12-rc0”) fails to ACPI S3 suspend the system. The
> > > screen turns black (as expected) and the power button LED stays on.
> > > 
> > > Doing
> > > 
> > >      echo N | sudo tee /sys/module/printk/parameters/console_suspend
> > > 
> > > and on tty2
> > > 
> > >      sudo systemctl stop gdm3
> > >      sudo systemctl start getty@tty1.service
> > > 
> > > and then on tty1
> > > 
> > >      sudo systemctl suspend
> > > 
> > > I see some panic messages and traces containing ktime_get or so, but
> > > I failed to save the messages. (Hints very much appreciated.)

You might try to enable the kernel crash dump.

Or you might try to set some delay in /proc/sys/kernel/printk_delay and
make a photo of the screen.

John Ogness told me that there was a trick with a permanent memory.
But it seems that there is no permanent memory on the laptop.
Adding John into Cc.

> > > I try to test the printk changes, but otherwise bisecting is not
> > > feasible, as it’s my production machine.
> 
> It’s not the printk changes.

There should not be any visible changes at the moment because all
console drivers still use the legacy code.

The conversion of the 8250 serial console driver is still pending
review, see the current version at
https://lore.kernel.org/r/20240913140538.221708-1-john.ogness@linutronix.de
But this patchset would have effect only when the serial console is enabled.

> I tested some commits, and assume it’s the timer core changes:
> 
>     $ git log --oneline --merges daa394f0f9d3c -3 --no-decorate
>     daa394f0f9d3c Merge tag 'core-debugobjects-2024-09-16' of
> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
>     9ea925c806dbb Merge tag 'timers-core-2024-09-16' of
> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
>     cb69d86550b3f Merge tag 'irq-core-2024-09-16' of
> git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
> 
> 
> 1.  6.11.0-02659-gcb69d86550b3 succeeds to ACPI S3 suspend
> 2.  6.11.0-02710-gdaa394f0f9d3 fails to ACPI S3 suspend

Best Regards,
Petr

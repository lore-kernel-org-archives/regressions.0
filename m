Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED884207659
	for <regressions@lists.linux.dev>; Thu,  5 Dec 2024 16:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733417583; cv=none; b=KGQoElILFhENDMxw5vwrc9RwpR54kUxXPbGpZGOJAmuTvQRuubIIqyrX4k480vVuUbTsPiKnhJbUSVFANLk5T53PwszkvTsTcJhbcvKixzJAtVGDzcCF+Y4s2kC2IqLuFQUbWG0b5/Tn7qIXGSZglQ4sgHGrY9jwQU+wlj6c+rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733417583; c=relaxed/simple;
	bh=OyMQfIrxSzriwv8hX5lVDVFWmfDKiMyaBU/TmxWr4wI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nSXExohfiIUVbcB7PBSvtQLfpUErgq2QJogpucKcSfIfdvOXn7wWLki7uyeNKCXqwkZVMCBwerevD8DFbbLXIINjfsmgSZ8JimaErjfSo7qZyMHgsncinZinu+goIbnsURWa8tmyJTlLopz+kS9kbicY2glbKZJwXspGo2VF5h4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KxMdPVrw; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KxMdPVrw"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-724e14b90cfso1241074b3a.2
        for <regressions@lists.linux.dev>; Thu, 05 Dec 2024 08:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733417581; x=1734022381; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3M40H5CkYQDVeDAAfwHVgOu/JLVGUmGE+3t86nRTx/0=;
        b=KxMdPVrwoWZO+HE1abWR0c7haV5MC6vw4TwXrSviFGykIcomkUqdqHrDyyjYVimqjN
         5X8nDeYrkXBgc0mSK78YKTv5z1cZDK3tt7+k0FUM6AZyoRwwFO0dkUnkKHbVz83YyTfN
         XR1oed3hpZJvS33F2pXJKpKbV5PMraZuJDyuXCyxQDjcOiiMvHKH74QZiE933ueVoMUE
         Ij7JIvOBy9JXqxhSCcCME+h0abFmoJaIjswdGHcEvLN9iHxIDS0pKhSm0fJnCipr/OFZ
         B74X3+UOsRjWZZlhG52MqIv+tLSyixRbJRHK14K/oDpZHCuDVLHZ0Zud7+Rg07YD4dxv
         3Xbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733417581; x=1734022381;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3M40H5CkYQDVeDAAfwHVgOu/JLVGUmGE+3t86nRTx/0=;
        b=VppxWJHBsUvZyGERrMkQeepQHRS3siYZbrlV4T2h9z0eeEEKs09fb6S/2rTy0QAGSd
         f7uO0vfdBcfTF38wsjtYXIsoZbpdMx84f7BMlgfULS7xMmfUkx6K/lbx7z1B/SACgsdc
         8ljXRO2Ij6uRZV+Ubc5HuEKH0oJY3xgz9IZtKQhtqF8EtkuF2bLFEi4s2maKatRJ0AQ7
         Fg7bYIYd3wayIVjneDJZJyql6/nEPf68i2hG4snK/AvS63hz+PyyDp1r5cHYGT5aOvOU
         qXF43JKTf8u1eYM0QwXXVkuUAwTBqRd99Ab2Sz1uwGC/MBoLKe756CYy0DTOWTp05axZ
         VWAg==
X-Forwarded-Encrypted: i=1; AJvYcCXpEB0Q9elparSNwOqWntadeHp5++OczcmsjzgFBRsvL3+MkYW/8/FUlZK/kh+WMLccpCSKV6iwoPhqYQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxzXA4FHxg0EtGR/J86+qmrwaq0N1SSQZn/5HvwOdHMeQfjqK62
	v3ziVC6tD2/uGAc4tyQYq96A1kUGD4UgI3jlVwVB6+FgUMDSittmxpVqsWkRng==
X-Gm-Gg: ASbGncvSaRTcgyDfTEHuclScqtPwG76LSeWtBgWHwwXfNTLI80aOrFNMLXrQkjm8PmK
	GNWDVRO1ZGutNEhOHNM/tDilNJJCOryMPRFYajmE/4Q74dQ9ZXafob+QoHmbrQThGm3D4TfSn9C
	QvON0UMyrOjulLOm8mYlDEXdMOxd+eJRz0adx0gASXwFXS/a3TOeoHYKKDvsRBny5OWzF4kwYX/
	Z9HULVqCf/zgOyZaKVbtX6SGhc45DAoJN+QxAvrgUC3ajeBb6P7kdRijWfY8g==
X-Google-Smtp-Source: AGHT+IFYO3XDZ6IIHPLOsjky3D00Q3xsDrNzgdjwZkcMxnvdQlHnJg11TlcIOJ2l2C46xAjuD8l7Zw==
X-Received: by 2002:a17:902:e810:b0:215:734f:ffe5 with SMTP id d9443c01a7336-215bd128365mr145479605ad.32.1733417581263;
        Thu, 05 Dec 2024 08:53:01 -0800 (PST)
Received: from thinkpad ([120.60.133.114])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-215f8f0921asm14725025ad.178.2024.12.05.08.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 08:53:00 -0800 (PST)
Date: Thu, 5 Dec 2024 22:22:51 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev, Aishwarya TCV <aishwarya.tcv@arm.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Sudeep Holla <sudeep.holla@arm.com>, linux-pm@vger.kernel.org
Subject: Re: [PATCH] Revert "clk: Fix invalid execution of clk_set_rate"
Message-ID: <20241205165251.fbf3ty6jgdqt4r3x@thinkpad>
References: <20241202100621.29209-1-johan+linaro@kernel.org>
 <3fd004add188460bf2bdd1a718387c7f.sboyd@kernel.org>
 <Z07AXbQvvZwI8Ki6@hovoldconsulting.com>
 <20241203092151.izcsgzqep4imbcwe@thinkpad>
 <afa086b0b30ab5b810178f92fac96837.sboyd@kernel.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afa086b0b30ab5b810178f92fac96837.sboyd@kernel.org>

On Tue, Dec 03, 2024 at 11:30:07AM -0800, Stephen Boyd wrote:
> Quoting Manivannan Sadhasivam (2024-12-03 01:21:51)
> > On Tue, Dec 03, 2024 at 09:25:01AM +0100, Johan Hovold wrote:
> > > [ +CC: Viresh and Sudeep ]
> > > 
> > > On Mon, Dec 02, 2024 at 05:20:06PM -0800, Stephen Boyd wrote:
> > > > Quoting Johan Hovold (2024-12-02 02:06:21)
> > > > > This reverts commit 25f1c96a0e841013647d788d4598e364e5c2ebb7.
> > > > > 
> > > > > The offending commit results in errors like
> > > > > 
> > > > >         cpu cpu0: _opp_config_clk_single: failed to set clock rate: -22
> > > > > 
> > > > > spamming the logs on the Lenovo ThinkPad X13s and other Qualcomm
> > > > > machines when cpufreq tries to update the CPUFreq HW Engine clocks.
> > > > > 
> > > > > As mentioned in commit 4370232c727b ("cpufreq: qcom-hw: Add CPU clock
> > > > > provider support"):
> > > > > 
> > > > >         [T]he frequency supplied by the driver is the actual frequency
> > > > >         that comes out of the EPSS/OSM block after the DCVS operation.
> > > > >         This frequency is not same as what the CPUFreq framework has set
> > > > >         but it is the one that gets supplied to the CPUs after
> > > > >         throttling by LMh.
> > > > > 
> > > > > which seems to suggest that the driver relies on the previous behaviour
> > > > > of clk_set_rate().
> > > > 
> > > > I don't understand why a clk provider is needed there. Is anyone looking
> > > > into the real problem?
> > > 
> > > I mentioned this to Mani yesterday, but I'm not sure if he has had time
> > > to look into it yet. And I forgot to CC Viresh who was involved in
> > > implementing this. There is comment of his in the thread where this
> > > feature was added:
> > > 
> > >       Most likely no one will ever do clk_set_rate() on this new
> > >       clock, which is fine, though OPP core will likely do
> > >       clk_get_rate() here.
> > > 
> > > which may suggest that some underlying assumption has changed. [1]
> > > 
> 
> Yikes.
> 
> > 
> > I just looked into the issue this morning. The commit that triggered the errors
> > seem to be doing the right thing (although the commit message was a bit hard to
> > understand), but the problem is this check which gets triggered now:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clk/clk.c?h=v6.13-rc1#n2319
> > 
> > Since the qcom-cpufreq* clocks doesn't have parents now (they should've been
> > defined anyway) and there is no CLK_SET_RATE_PARENT flag set, the check returns
> > NULL for the 'top' clock. Then clk_core_set_rate_nolock() returns -EINVAL,
> > causing the reported error.
> > 
> > But I don't quite understand why clk_core_set_rate_nolock() fails if there is no
> > parent or CLK_SET_RATE_PARENT is not set. The API is supposed to set the rate of
> > the passed clock irrespective of the parent. Propagating the rate change to
> > parent is not strictly needed and doesn't make sense if the parent is a fixed
> > clock like XO.
> 
> The recalc_rate clk_op is telling the framework that the clk is at a
> different rate than is requested by the clk consumer _and_ than what the
> framework thinks the clk is currently running at. The clk_set_rate()
> call is going to attempt to satisfy that request, and because there
> isn't a determine_rate/round_rate clk_op it assumes the clk can't change
> rate so it looks to see if there's a parent that can be changed to
> satisfy the rate. There isn't a parent either, so the clk_set_rate()
> call fails because the rate can't be achieved on this clk.
> 
> It may work to have a determine_rate clk_op that is like the recalc_rate
> one that says "this rate you requested is going to turn into whatever
> the hardware is running at" by simply returning the rate that the clk is
> running at.

Sounds reasonable to me. Fix submitted incorporating your suggestion, thanks!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

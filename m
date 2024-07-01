Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D9846436
	for <regressions@lists.linux.dev>; Mon,  1 Jul 2024 14:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719844463; cv=none; b=HTIeuxPLo9+pccaW6724Tn7Cl7C0vM19U9znkK7uhkMPQKaMCnWKnb/h4AcqQwP1hNOl5YpvBA6JeGq7kIgsr4liD5WTr6mpe+najsOz8eYbppHi2LQnA53gQfIm7PNHewM24XfJQO9TbGxZm+CElbxp0DQy5reBSrA16JRmgPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719844463; c=relaxed/simple;
	bh=hZLVczWVYkqc2NwpQBQa0JHuez8yTDOyIZgUgtuj9/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WsMuQ0msW435mV4b0Q2yTYI/IZ5hVd469V4lnFX4fcsMTwfa48eibpgxItJUdcqBbtq4Tl+0UFathYZxrOPzZTe+PyKWmuMG6+PuLtKbj0Qsa4dQyho0FKPUexm9oDPDWgQHenzCjMmbDl5psJXI2bYF9LcKtYPPVS2X97MBYTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xFRiMir3; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xFRiMir3"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-42565cdf99cso27904285e9.3
        for <regressions@lists.linux.dev>; Mon, 01 Jul 2024 07:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1719844460; x=1720449260; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gxm2/286zsrii1K3SQifylk+j5wAvP1Kfw/1i+juyX0=;
        b=xFRiMir3fZK8huBQzRe5S/X8sMO6gzzGPilHmkpjwQWDIy1MVYTuTouXtddWFINmw/
         2FeuR2yauz5KuT449GcYuehPKMXshaaib+kqc/504573RWWrRZay4TiN02fTM7yXxvh3
         uCME0NEjSvBOF/FiGcLwhS0YXXwH8qKJL2wMd+Y6iium45gCPWepgMVlP+P1JxCEhBAf
         ZB6PPELc590GowaAOSqM34T5hfW2OIgHxvyqAwRZgyUxZSnTmChcJXmNLI9QN3PtO9QZ
         O0EYvE4Ex93M1OxJTmWrS2i3TWdmGiFX9O1euaTFZPx40p9f2Tx2b+pPJhE2CeNTwrZI
         QApg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719844460; x=1720449260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gxm2/286zsrii1K3SQifylk+j5wAvP1Kfw/1i+juyX0=;
        b=JTJpBIb3Jtd9Ee2ng5gc9GBiF9sjKseVLVqVX9zS/4OclFP+e3Grhe0JUiLrcRbHLu
         vth+hP8w4KY7nC6TR8Tw6AXEzMzoLf6l8vSy++qqE7lwS4w0pXXORTASoso/DRMN01TM
         D4/Ek6wNc1/VeWmk68mMyKCYRIe8P9B/YrO8TTuqNRi/EqA7VtxXsyZTrnquU1KozWJV
         pdNBuupSdyS4f4duNBOcVeP+4PU3JBEjs0KcXsVPsyXS6PiSO+QXSAxdeYhBtodOZlFR
         pziXCwuzlbwiMko7r9Uw7QqnFoGq0zW3cwuk+C7bpH1d05BkYO3rH+JypxFbD0ekmrPP
         xLMw==
X-Gm-Message-State: AOJu0Ywotw9SUyY+en5ar9lnGcPlQMjIa9/9SwYpOMAkYDztacs+3gka
	J/svyEiRZHbgE32UxnQno/pc1uNmq9kMosTo1loXKYYEEExxTz9deIS6lHI+dW9TM0ybCG41Imp
	x
X-Google-Smtp-Source: AGHT+IGVYBgZ9oMxQW7NLdq5XyBXrfpX9j7PfBdVZGzczzJCDXaM89KFp5oFBhxPCvOq5UKcLe0pCw==
X-Received: by 2002:a05:600c:5129:b0:425:63b9:ae2c with SMTP id 5b1f17b1804b1-4257a02008fmr50852905e9.27.1719844460124;
        Mon, 01 Jul 2024 07:34:20 -0700 (PDT)
Received: from blmsp ([2001:4091:a245:8609:c1c4:a4f8:94c8:31f2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b097b82sm159225445e9.34.2024.07.01.07.34.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 07:34:19 -0700 (PDT)
Date: Mon, 1 Jul 2024 16:34:18 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Chandrasekar Ramakrishnan <rcsekar@samsung.com>, 
	Vincent Mailhol <mailhol.vincent@wanadoo.fr>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Tony Lindgren <tony@atomide.com>, Judith Mendez <jm@ti.com>, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@ew.tq-group.com
Subject: Re: Kernel hang caused by commit "can: m_can: Start/Cancel polling
 timer together with interrupts"
Message-ID: <h7lmtmqizoipzlazl36fz37w2f5ow7nbghvya3wu766la5hx6d@3jdesa3ltmuz>
References: <e72771c75988a2460fa8b557b0e2d32e6894f75d.camel@ew.tq-group.com>
 <c93ab2cc-d8e9-41ba-9f56-51acb331ae38@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c93ab2cc-d8e9-41ba-9f56-51acb331ae38@leemhuis.info>

On Mon, Jul 01, 2024 at 02:12:55PM GMT, Linux regression tracking (Thorsten Leemhuis) wrote:
> [CCing the regression list, as it should be in the loop for regressions:
> https://docs.kernel.org/admin-guide/reporting-regressions.html]
> 
> Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
> for once, to make this easily accessible to everyone.
> 
> Hmm, looks like there was not even a single reply to below regression
> report. But also seens Markus hasn't posted anything archived on Lore
> since about three weeks now, so he might be on vacation.
> 
> Marc, do you might have an idea what's wrong with the culprit? Or do we
> expected Markus to be back in action soon?

Great, ping here.

@Matthias: Thanks for debugging and sorry for breaking it. If you have a
fix for this, let me know. I have a lot of work right now, so I am not
sure when I will have a proper fix ready. But it is on my todo list.

Best,
Markus

> 
> Ciao, Thorsten
> 
> On 18.06.24 18:12, Matthias Schiffer wrote:
> > Hi Markus,
> > 
> > we've found that recent kernels hang on the TI AM62x SoC (where no m_can interrupt is available and
> > thus the polling timer is used), always a few seconds after the CAN interfaces are set up.
> > 
> > I have bisected the issue to commit a163c5761019b ("can: m_can: Start/Cancel polling timer together
> > with interrupts"). Both master and 6.6 stable (which received a backport of the commit) are
> > affected. On 6.6 the commit is easy to revert, but on master a lot has happened on top of that
> > change.
> > 
> > As far as I can tell, the reason is that hrtimer_cancel() tries to cancel the timer synchronously,
> > which will deadlock when called from the hrtimer callback itself (hrtimer_callback -> m_can_isr ->
> > m_can_disable_all_interrupts -> hrtimer_cancel).
> > 
> > I can try to come up with a fix, but I think you are much more familiar with the driver code. Please
> > let me know if you need any more information.
> > 
> > Best regards,
> > Matthias
> > 
> > 

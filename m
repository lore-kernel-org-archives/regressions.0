Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4B817106C
	for <regressions@lists.linux.dev>; Mon, 22 Jul 2024 18:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721674711; cv=none; b=X7yimU9+vxencnHXNcEHzTqZYiaq7xs/e07YsGWYlEmDYA2vDff4BlsaRHC02lkS79Xmu9KrxvBugTUOv/tvWPnGO0ur+1i9wMe2URu23Yt1P94paZnAQh5vYYpoicLIe26hBhDiv16b6s8QOqH+5cmrna8hpQeNl/SlpQaZAzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721674711; c=relaxed/simple;
	bh=bZnZyVjgC/n7IxgvXCwJgq0MpSi5iqn+Ydo69uBqjEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WMrSTSHvSuffbiEFG9oBnMkWFMD7uaBHCMn8bHKaB9jzTPS/TW1rmtCyF7lAphl+KWCWV6bRZdX1sxH7cmZfvCAP1hOWjGQbvP17XBYgdNaQ4JAaPite9UJKmR5qIUSWXhtUwjy7LskDeUiEHirnCZaWvK/a5mjJqc1nlyQhgFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=V6J/B+3z; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="V6J/B+3z"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4267300145eso40311115e9.3
        for <regressions@lists.linux.dev>; Mon, 22 Jul 2024 11:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721674707; x=1722279507; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oSZY3a5sCrRsG7FKZtKUzWBxPQy6Q3D03lPoiirtlDM=;
        b=V6J/B+3zvdYNUZ5ALIsapM9fNeBWrxF6t2ahIAiTDSraNiCCzzYcZ4FxaJX71i84Wr
         pp3k40mYJGtYfW5AakDTtGi9bBTPyAhF16uJkL3Xq+j9s5d1ZRZGT/Xz3wk6jFBcuJEp
         qV2tfy8uVKZIy4m8XuzF2PovDI9uH8awgUOrueCQChPnAlzA3o1h0u044jS6TRueIv6b
         +fhZxxcLdWHs40TuxiQWtLRxS/fcvZ/nldRKJ/Ch4yyEKZDAexFX/6uMmok03TTTR/Ws
         gtV+K6vQz1/Br3I2HTOtzSqhZ/oe/UFthXbZU8PQTWTg5Vzk2qlEdUR4utj2/rfVj4wD
         rzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721674707; x=1722279507;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oSZY3a5sCrRsG7FKZtKUzWBxPQy6Q3D03lPoiirtlDM=;
        b=xJ1Zrkn8VQIkInJYvHz+2E4+WO+hpCKGlhHx1KBbqY6+uRImId+N4l4jWCSea0WL8D
         XvMz8SEydkpQQSecgtW8DKj57F81xcKaDxZxJ+AQ+V0jTMOCNCp20HqcIrilPVjI7c9p
         630jTWPDva1iqD77YSjYuo4stic/gvFXLD9xW1JqyFesGxymcV6k+zDmN1+dSnVW3Nn7
         dLOCcSPiJBVDbZxudL0nWogX0n1AviiuYhFTpWCcjMPkJGtYOyjC9QS2XEgMKuMc+uqY
         lvCsDi7WFwiItbGdwdIR8xfKmCBKA37Uoi/D2iGrdAmJwrC8q1ufumkDOcv5d+Ni6BDb
         nyUg==
X-Forwarded-Encrypted: i=1; AJvYcCVhxCC/R7Ecz9/cMYEfju9ob4lowC2jPhKOgRKAYPGJw7VLeGHmVveMm6io9LAuZ7ckC9gVdEm/VHfo1PXlfY0rO4v3IYfMmmy9DTM=
X-Gm-Message-State: AOJu0YxSdu7oCn9TDN7YuGKU0xJdPwHtvvEbr4IEaY2TjLPaB3cElJI9
	ws3S6ObGoKbfz8u30yrmIyB/SQU9zoOBI9AKnI1afWRlkpXANQRrqDEDjxXOgbA=
X-Google-Smtp-Source: AGHT+IFKnwma/l8XcIBVJ1AahKfE1nABxV76uuc7X6Caa2pMFz7G3OrOEZawNYjRK/7BL3NpyBzrqA==
X-Received: by 2002:a05:600c:3109:b0:426:6857:3156 with SMTP id 5b1f17b1804b1-427dc55bc49mr65497715e9.27.1721674706943;
        Mon, 22 Jul 2024 11:58:26 -0700 (PDT)
Received: from blmsp ([2001:4091:a245:8609:c1c4:a4f8:94c8:31f2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d7263687sm136561655e9.4.2024.07.22.11.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 11:58:26 -0700 (PDT)
Date: Mon, 22 Jul 2024 20:58:25 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, 
	Chandrasekar Ramakrishnan <rcsekar@samsung.com>, Vincent Mailhol <mailhol.vincent@wanadoo.fr>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Tony Lindgren <tony@atomide.com>, Judith Mendez <jm@ti.com>, linux-can@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux@ew.tq-group.com, 
	Linux regressions mailing list <regressions@lists.linux.dev>
Subject: Re: Kernel hang caused by commit "can: m_can: Start/Cancel polling
 timer together with interrupts"
Message-ID: <4zzmw4ijqxn4jkycteaz3wv5qcvi5gqdcrsdytk2jhe2f2tb7r@k5hesykr3gmz>
References: <e72771c75988a2460fa8b557b0e2d32e6894f75d.camel@ew.tq-group.com>
 <c93ab2cc-d8e9-41ba-9f56-51acb331ae38@leemhuis.info>
 <h7lmtmqizoipzlazl36fz37w2f5ow7nbghvya3wu766la5hx6d@3jdesa3ltmuz>
 <08aabeaf-6a81-48a9-9c5b-82a69b071faa@leemhuis.info>
 <734a29a87613b9052fc795d56a30690833e4aba9.camel@ew.tq-group.com>
 <76faeb323353b584b310f2f1b53e9b2745d2f12c.camel@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <76faeb323353b584b310f2f1b53e9b2745d2f12c.camel@ew.tq-group.com>

On Wed, Jul 03, 2024 at 02:50:04PM GMT, Matthias Schiffer wrote:
> On Tue, 2024-07-02 at 12:03 +0200, Matthias Schiffer wrote:
> > On Tue, 2024-07-02 at 07:37 +0200, Linux regression tracking (Thorsten Leemhuis) wrote:
> > > 
> > > 
> > > On 01.07.24 16:34, Markus Schneider-Pargmann wrote:
> > > > On Mon, Jul 01, 2024 at 02:12:55PM GMT, Linux regression tracking (Thorsten Leemhuis) wrote:
> > > > > [CCing the regression list, as it should be in the loop for regressions:
> > > > > https://docs.kernel.org/admin-guide/reporting-regressions.html]
> > > > > 
> > > > > Hi, Thorsten here, the Linux kernel's regression tracker. Top-posting
> > > > > for once, to make this easily accessible to everyone.
> > > > > 
> > > > > Hmm, looks like there was not even a single reply to below regression
> > > > > report. But also seens Markus hasn't posted anything archived on Lore
> > > > > since about three weeks now, so he might be on vacation.
> > > > > 
> > > > > Marc, do you might have an idea what's wrong with the culprit? Or do we
> > > > > expected Markus to be back in action soon?
> > > > 
> > > > Great, ping here.
> > > 
> > > Thx for replying!
> > > 
> > > > @Matthias: Thanks for debugging and sorry for breaking it. If you have a
> > > > fix for this, let me know. I have a lot of work right now, so I am not
> > > > sure when I will have a proper fix ready. But it is on my todo list.
> > > 
> > > Thx. This made me wonder: is "revert the culprit to resolve this quickly
> > > and reapply it later together with a fix" something that we should
> > > consider if a proper fix takes some time? Or is this not worth it in
> > > this case or extremely hard? Or would it cause a regression on it's own
> > > for users of 6.9?
> > > 
> > > Ciao, Thorsten
> > 
> > Hi,
> > 
> > I think on 6.9 a revert is not easily possible (without reverting several other commits adding new
> > features), but it should be considered for 6.6.
> > 
> > I don't think further regressions are possible by reverting, as on 6.6 the timer is only used for
> > platforms without an m_can IRQ, and on these platforms the current behavior is "the kernel
> > reproducibly deadlocks in atomic context", so there is not much room for making it worse.
> > 
> > Like Markus, I have writing a proper fix for this on my TODO list, but I'm not sure when I can get
> > to it - hopefully next week.
> > 
> > Best regards,
> > Matthias
> 
> A small update from my side:
> 
> I had a short look into the issue today, but I've found that I don't quite grasp the (lack of)
> locking in the m_can driver. The m_can_classdev fields active_interrupts and irqstatus are accessed
> from a number of different contexts:

After looking into the code as well and trying to fix as much as
possible:

> - active_interrupts is *mostly* read and written from the ISR/hrtimer callback, but also from
> m_can_start()/m_can_stop() and (in error paths) indirectly from m_can_poll() (NAPI callback). It is
> not clear to me whether start/stop/poll could race with the ISR on a different CPU. Besides being
> used for ndo_open/stop, m_can_start/stop also happen from PM callbacks.

I think m_can_start() can't race with any of these. The interrupts
(incl. active_interrupts) are set before the interrupts in general are
enabled. So neither normal interrupts or hrtimer should be able to
interfere as they are started/enabled afterwards.

m_can_poll() shouldn't be able to race with the interrupt handler
either. The interrupt handler disable interrupts and schedules
m_can_poll() afterwards. Coalescing is not active when m_can_poll is
being used. So the option to set coalescing should be removed, but it
wasn't yet.

Maybe m_can_stop() may be able to interfere with the interrupt handler,
I am not sure right now. I *think* if there is any interference it
should be able to recover as m_can_start() basically resets the
interrupts. I may add a reset of active_interrupts here to make sure.

> - irqstatus is written from the ISR (or hrtimer callback) and read from m_can_poll() (NAPI callback)

Yes, also interrupts are disabled in ISR before napi is scheduled and
the interrupts are enabled by m_can_poll afterwards. So while m_can_poll
is running, I think it shouldn't be possible to have another write to
irqstatus.


Also I fixed the hrtimer issues by removing any hrtimer cancellations
for instances without IRQ. For coalescing hrtimer cancellations are safe
as the hrtimer for coalescing only triggers the irq thread.

Also found a few other bugs I fixed. I will send a series with fixes
soon.

Best,
Markus

> 
> Is this correct without explicit sychronization, or should there be some locking or atomic for these
> accesses?
> 
> Best regards,
> Matthias
> 
> 
> 
> > 
> > 
> > 
> > > 
> > > > > On 18.06.24 18:12, Matthias Schiffer wrote:
> > > > > > Hi Markus,
> > > > > > 
> > > > > > we've found that recent kernels hang on the TI AM62x SoC (where no m_can interrupt is available and
> > > > > > thus the polling timer is used), always a few seconds after the CAN interfaces are set up.
> > > > > > 
> > > > > > I have bisected the issue to commit a163c5761019b ("can: m_can: Start/Cancel polling timer together
> > > > > > with interrupts"). Both master and 6.6 stable (which received a backport of the commit) are
> > > > > > affected. On 6.6 the commit is easy to revert, but on master a lot has happened on top of that
> > > > > > change.
> > > > > > 
> > > > > > As far as I can tell, the reason is that hrtimer_cancel() tries to cancel the timer synchronously,
> > > > > > which will deadlock when called from the hrtimer callback itself (hrtimer_callback -> m_can_isr ->
> > > > > > m_can_disable_all_interrupts -> hrtimer_cancel).
> > > > > > 
> > > > > > I can try to come up with a fix, but I think you are much more familiar with the driver code. Please
> > > > > > let me know if you need any more information.
> > > > > > 
> > > > > > Best regards,
> > > > > > Matthias
> > > > > > 
> > > > > > 
> > > > 
> > > > 
> > 
> 
> -- 
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> https://www.tq-group.com/

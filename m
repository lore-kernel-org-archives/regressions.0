Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F501116
	for <regressions@lists.linux.dev>; Thu, 29 Sep 2022 10:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1664448824; x=1695984824;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fmoOBHAV2Tp40plQ7Fv9kZvP8cn/AMixvXV0WF9c69Q=;
  b=qFNq8sGD91LBhpKi9brRHCRg/aQOYR9k1kIX05yyA95vqGmtDQMg8MRs
   wdnHdsUOsGkj8nvRwpdUfpZPvjay5l6Hcbzki3NuePKkc952J25aDW3bc
   +4LvADnXAJsYOxROcWPFz4Z7Z7hYA1VjZKaIOvWofrtLNs4jNGUk1Fu6I
   oVvjOZiDyuu2TEgjO5o94hrIInXtJYi0qzAoHhm00bCml8RcWjAitIGox
   7AxE9c75fH1PQpZiFbfCZLBMafzp/ufqbpBsiwN8xQRrTy/rhfbyHB6wS
   OtK/467HBh4Hq6ApzxRcYlpG2UxDrKz+tc/vyodU858CK935bgQiB8Ck0
   g==;
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; 
   d="scan'208";a="115997658"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Sep 2022 03:52:33 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 29 Sep 2022 03:52:30 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 29 Sep 2022 03:52:29 -0700
Date: Thu, 29 Sep 2022 11:52:00 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Petr Mladek <pmladek@suse.com>
CC: Thorsten Leemhuis <regressions@leemhuis.info>, Conor Dooley
	<conor@kernel.org>, <senozhatsky@chromium.org>, <rostedt@goodmis.org>,
	<john.ogness@linutronix.de>, <linux-kernel@vger.kernel.org>,
	<regressions@lists.linux.dev>
Subject: Re: [resend][bug] low-probability console lockups since 5.19
Message-ID: <YzV40LbMHcW1S/9O@wendy>
References: <Yy3dsSgpDnovBdEn@spud>
 <YzR8fzyjhggO+/tT@spud>
 <98f62903-3d6f-30b4-82ef-3b0460824907@leemhuis.info>
 <YzVlYaUPcRmlfE7c@wendy>
 <YzVvl+rv3iZS9vxk@alley>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YzVvl+rv3iZS9vxk@alley>

On Thu, Sep 29, 2022 at 12:12:39PM +0200, Petr Mladek wrote:
> On Thu 2022-09-29 10:29:05, Conor Dooley wrote:
> > On Thu, Sep 29, 2022 at 11:06:01AM +0200, Thorsten Leemhuis wrote:
> > > Hi Conor
> > > 
> > > On 28.09.22 18:55, Conor Dooley wrote:
> > > > On Fri, Sep 23, 2022 at 05:24:17PM +0100, Conor Dooley wrote:
> > > >>
> > > >> Been bisecting a bug that is causing a boot failure in my CI & have
> > > >> ended up here.. The bug in question is a low(ish) probability lock up
> > > >> of the serial console, I would estimate about 1-in-5 chance on the
> > > >> boards I could actually trigger it on which it has taken me so long
> > > >> to realise that this was an actual problem. Thinking back on it, there
> > > >> were other failures that I would retroactively attribute to this
> > > >> problem too, but I had earlycon disabled
> > > 
> > > There is one thing I wonder when skimming this thread: was there maybe
> > > some other change somewhere in the kernel between the introduction and
> > > the revert of the printk console kthreads patches that is the real
> > > culprit here that makes existing, older races easier to hit? But I guess
> > > in the end that would be very hard to find and it's easier to fix the
> > > problem in the console driver... :-/
> > 
> > Entirely possible that something arrived in the middle, yeah. I've done
> > 100s of reboots on that interim section, albeit with the threaded
> > printers enabled, as I restarted the bisection several times & never hit
> > this failure then.
> 
> Interesting. I wonder if the used console was fixed during the window
> when the kthreads were enabled.

I will, possibly tonight but probably not, run the bisection again with
the threaded printer merge reverted. Hopefully it is not filled with
conflicts if I go that way...

> 
> > I don't know anything about console/printk/serial drivers unfortunately
> > so I will almost certainly not be able to find the problem by
> > inspection. I'd rather submit patches than send reports, but I really
> > really need some help here. I looked at the two patterns Petr suggested,
> > but the former I am not sure applies since the issue is present even
> > when earlycon is disabled & the latter appears (to my untrained eye) to
> > be accounted for in the 8250 driver.
> 
> The problem with the missing port->lock is visible only when the
> early console is enabled. But It is really hard to hit without
> the kthreads.

Right, so sounds like that can be excluded since my CI was hitting it
with earlycon disabled. I'll triple check this, possibly later today.

> 
> The problem with enabled IRQs was visible only with kthreads. The
> original code called console->write() callback already with IRQs
> disabled.
> 
> The kthreads called console->write() callback with IRQs enabled.
> It made sense. They need to be disabled only when really needed
> and the tested drivers did this correctly.

And that sounds like it can be also excluded, since my issue started
post-revert. Unless there's still some kthreads code in there that was
not reverted?

Thanks,
Conor.

 

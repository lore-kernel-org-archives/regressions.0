Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AF61107
	for <regressions@lists.linux.dev>; Thu, 29 Sep 2022 09:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1664443775; x=1695979775;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iylFL7DsPH8a98R74kyfLSpOkEvs/H7jxH/ajrGWmWg=;
  b=nZ4NI3wF6HYgO+fJoGKk3Gk7piywqTtAICaK0gF2wBIizwWAlsY8/D+j
   jI1FPfn2uHEknxmSx6uGoD8woFxE0IlypMv/8kgEYoAT06Jf54dNKsoGI
   jtPoFsCto1PjPM/KwSoXnW7laB/M/mnNEPsNPs5TDIBd1Sad/qlGt4WhL
   Z/o43vspv7w5Nj2wxkX4ajCvpj3vnmTnRepYY576jORvx2+Er1Gl/SeEl
   rnFjEXSuwEFDXp8yEHqwGlKDQ4ZjnNBZfxXDgFzfRLVEr6ahJ5wKr8QyQ
   24Qh7mawjvU+bBmidF+W/xTnTz9/JM5Ld1Zn5VVdx7jAJaZxU5O+0Cqj8
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; 
   d="scan'208";a="182561233"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Sep 2022 02:29:28 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 29 Sep 2022 02:29:28 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Thu, 29 Sep 2022 02:29:26 -0700
Date: Thu, 29 Sep 2022 10:29:05 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
CC: Conor Dooley <conor@kernel.org>, <pmladek@suse.com>,
	<senozhatsky@chromium.org>, <rostedt@goodmis.org>,
	<john.ogness@linutronix.de>, <linux-kernel@vger.kernel.org>,
	<regressions@lists.linux.dev>
Subject: Re: [resend][bug] low-probability console lockups since 5.19
Message-ID: <YzVlYaUPcRmlfE7c@wendy>
References: <Yy3dsSgpDnovBdEn@spud>
 <YzR8fzyjhggO+/tT@spud>
 <98f62903-3d6f-30b4-82ef-3b0460824907@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <98f62903-3d6f-30b4-82ef-3b0460824907@leemhuis.info>

On Thu, Sep 29, 2022 at 11:06:01AM +0200, Thorsten Leemhuis wrote:
> Hi Conor
> 
> On 28.09.22 18:55, Conor Dooley wrote:
> > On Fri, Sep 23, 2022 at 05:24:17PM +0100, Conor Dooley wrote:
> >>
> >> Been bisecting a bug that is causing a boot failure in my CI & have
> >> ended up here.. The bug in question is a low(ish) probability lock up
> >> of the serial console, I would estimate about 1-in-5 chance on the
> >> boards I could actually trigger it on which it has taken me so long
> >> to realise that this was an actual problem. Thinking back on it, there
> >> were other failures that I would retroactively attribute to this
> >> problem too, but I had earlycon disabled
> > [...]
> > #regzbot introduced: 5831788afb17b89c5b531fb60cbd798613ccbb63 ^
> > Hopefully I did this correctly...
> 
> Yes, you did, thx for this. I already had been watching this thread
> manually and was a bit unsure what to do with it.

Great, thanks.

> 
> > I picked that commit as that's where things start going haywire.
> 
> There is one thing I wonder when skimming this thread: was there maybe
> some other change somewhere in the kernel between the introduction and
> the revert of the printk console kthreads patches that is the real
> culprit here that makes existing, older races easier to hit? But I guess
> in the end that would be very hard to find and it's easier to fix the
> problem in the console driver... :-/

Entirely possible that something arrived in the middle, yeah. I've done
100s of reboots on that interim section, albeit with the threaded
printers enabled, as I restarted the bisection several times & never hit
this failure then.

I don't know anything about console/printk/serial drivers unfortunately
so I will almost certainly not be able to find the problem by
inspection. I'd rather submit patches than send reports, but I really
really need some help here. I looked at the two patterns Petr suggested,
but the former I am not sure applies since the issue is present even
when earlycon is disabled & the latter appears (to my untrained eye) to
be accounted for in the 8250 driver.

Thanks,
Conor.


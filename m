Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB255A66
	for <regressions@lists.linux.dev>; Thu, 29 Sep 2022 21:22:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8B7BC433C1;
	Thu, 29 Sep 2022 21:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664486575;
	bh=ZQBrV7Cm8QPG0bNDPWceRvng7omwE0U4ca+kAIHCPbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i+/oAj9nxCLSoekdUOdRgO4VR5NjohOWFkUcffpqOj0w0xbcl5XlmTWY5ZtvF0238
	 ish+m54d+veEyHjM1JaececphWaQeYNAjoX7+plpPQ425D9qNrqsVL2AmcokaAn6QL
	 JkUUSBjOCcBswXmGoW1uw/cyXU2SDsoNqWj+yaHvwItLeh2k4McbDSJFK8LlhHvGNj
	 7K3Cl/3ALcBJ8Tg06hDSbDtX9MGgAgeJGMBqxbHKzKjrjcVsnzbKAho27bOKlJuS58
	 JpJJ07MQgRTEoXVb4xKE8qExUrap1w8Nu9JYE5vxnL4DU3KET/ud/qcNSOFHQc+Cdm
	 W5oIvQlxNwlqg==
Date: Thu, 29 Sep 2022 22:22:50 +0100
From: Conor Dooley <conor@kernel.org>
To: John Ogness <john.ogness@linutronix.de>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Petr Mladek <pmladek@suse.com>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	senozhatsky@chromium.org, rostedt@goodmis.org,
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Subject: Re: [resend][bug] low-probability console lockups since 5.19
Message-ID: <YzYMqr5kEsKJ3cwn@spud>
References: <Yy3dsSgpDnovBdEn@spud>
 <YzR8fzyjhggO+/tT@spud>
 <98f62903-3d6f-30b4-82ef-3b0460824907@leemhuis.info>
 <YzVlYaUPcRmlfE7c@wendy>
 <YzVvl+rv3iZS9vxk@alley>
 <YzV40LbMHcW1S/9O@wendy>
 <877d1m46c0.fsf@jogness.linutronix.de>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877d1m46c0.fsf@jogness.linutronix.de>

On Thu, Sep 29, 2022 at 04:19:03PM +0206, John Ogness wrote:
> On 2022-09-29, Conor Dooley <conor.dooley@microchip.com> wrote:
> > I will, possibly tonight but probably not, run the bisection again
> > with the threaded printer merge reverted. Hopefully it is not filled
> > with conflicts if I go that way...
> 
> It might be easier for you to just apply the following patch to run your
> tests . This simple patch disables kthread usage.

Thanks a million John, restarted bisection from master prior to the
merge of the reverts & have ended up finding the actual issue thanks
to your hack - a RISC-V specific clocksource change. I'll close the
regzbot issue & open a new one against the actual source of my issues.

#regzbot invalid: bisection lead me up the garden path

It looks like I have an issue that's caused by the PCI controller driver
on this SoC* which triggers RCU stalls - but thanks to the clocksource
issue the RCU stalls never get reported & the system just locks up. The
system locked up in the same place on the kthreads branch so I guess I
just got unlucky with my bisection because of that.

Thanks again for the hack to bisect with,
Conor.

* likely due to running the wrong FPGA bitstream, the root port's
connection to the cpus is configured by the FPGA fabric.

> 
> John Ogness
> 
> 
> diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> index b095fb5f5f61..9679887c0805 100644
> --- a/kernel/printk/printk.c
> +++ b/kernel/printk/printk.c
> @@ -3605,6 +3605,10 @@ static int __init printk_activate_kthreads(void)
>  {
>  	struct console *con;
>  
> +	/* hack: never activate kthreads */
> +	if (!printk_kthreads_available)
> +		return 0;
> +
>  	console_lock();
>  	printk_kthreads_available = true;
>  	for_each_console(con)

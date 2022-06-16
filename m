Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAC93206
	for <regressions@lists.linux.dev>; Thu, 16 Jun 2022 18:58:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DDF4C34114;
	Thu, 16 Jun 2022 18:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1655405889;
	bh=+33FWUswMZscBh+jqBDYywCE5EEwigUEJN3lzcTaQP4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iMNwklE4d1/OJsJ14nWiP9dvfrpXeFB1b6JjxYF/Wt8MKVgnfwOFyKcoeoQIkPkBA
	 6/vb0cYHLPsNkqu7gDJGTEYkGghkmpSprBZ1UUJQOINzwWKVJTAw86MrkR3Fc1EpYz
	 fTLq9+CpEfHG1I5eVQnJJuBO0SGXK8bOMItLriOA2RmefkrIgBa1dSYEn8Hef24WzC
	 0gCm6ADEa7vFKy5lfW1ys3SUXiEB4yrrKnEzf5Stiw4ntBF5r6SVDZ5EHldgcO2top
	 gdfxAdxedvHTzu3AMeGuU5OBIFU+G0DMOWHsLiKF7ebnfuhtAZioGo/JV4chChWXbh
	 KTr5bFwaQHwXw==
Date: Thu, 16 Jun 2022 11:58:08 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: golan.ben.ami@intel.com, Luca Coelho <luciano.coelho@intel.com>,
 Johannes Berg <johannes@sipsolutions.net>
Cc: Thorsten Leemhuis <regressions@leemhuis.info>, Udo Steinberg
 <udo@hypervisor.org>, "linux-wireless@vger.kernel.org"
 <linux-wireless@vger.kernel.org>, "regressions@lists.linux.dev"
 <regressions@lists.linux.dev>
Subject: Re: Bug 215635 - iwlwifi: Firmware crash with firmware
 36.ca7b901d.0 (8265-36.ucode)
Message-ID: <20220616115808.141dec76@kernel.org>
In-Reply-To: <915d6d66-4e42-8cbf-76bc-0f2f72d5e7d6@leemhuis.info>
References: <915d6d66-4e42-8cbf-76bc-0f2f72d5e7d6@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 14 Mar 2022 12:51:38 +0100 Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker.
> 
> I noticed a regression report in bugzilla.kernel.org that afaics isn't
> properly handled, that's why I decided to forward it to the lists and a
> few relevant people to the CC. To quote from
> https://bugzilla.kernel.org/show_bug.cgi?id=215635 :
> 
> > Seeing the following firmware crash frequently with
> > firmware-version: 36.ca7b901d.0 8265-36.ucode
> > 
> > [...]
> > 
> > Afterwards iwlwifi is entirely unusable, i.e. the hardware does not recover.  
> 
> > I have not been able to observe the problem with 5.15.x so far.
> > 
> > The problem manifests either by Wi-Fi becoming entirely unresponsive (not even ping to gateway works anymore) or by producing a firmware crash.
> > 
> > In response to #3, the problem was most recently observed as a firmware crash on Linux 5.16.13. HW is Intel Corporation Wireless 8265 / 8275 (rev 78) (Windstorm Peak) and firmware version 36.ca7b901d.0 8265-36.ucode.
> > 
> > I'm attaching the dmesg output from 5.16.13 (with the TWT patch mentioned above applied) which includes a firmware crash.  
> 
> Could somebody take a look into this? Or was this discussed somewhere
> else already? Or even fixed?

Any progress / outputs on this one? Folks are reporting it's still
happening on Fedora 36 w/ 5.17.13.

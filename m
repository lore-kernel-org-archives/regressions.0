Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290A83D61
	for <regressions@lists.linux.dev>; Fri, 18 Nov 2022 22:43:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 092D0C433D6;
	Fri, 18 Nov 2022 22:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668811413;
	bh=7qzMQP+JcAvgprPRUI0bd8n6yMcyc+AiU1H9YYaDdh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=upBs/BOqN2W85D5gbHTDav7kC6xLIUlNvwQcBEDpOzxg/so9FcsXzv2VMd/yZeBy4
	 Coiv87aNwzQl9HNNZLpxJ5CeSIqkSL0bYCRmjrfWa8CcDSkRyjFk4SCNQpDOE6IkRM
	 YkqOHd938oNjr4pqykPfBs9S+SHUDaq9VIDCSuM/V+kuxK0gO+Ga/iOzPEzTml1uLq
	 TGLbgeDduYuJG//VVCYYLMKrH1dqp1nJMHeHv5NHK/9b3caaDnUfKUiNT28Q6yBIV1
	 oFELIN+kk3EZyqNzK6UiQB4qeU3CrVQug0oK2aYksUp5c/QEJjRke5oeOWDGFA9IjT
	 3I5LcKII8M0CA==
Date: Fri, 18 Nov 2022 22:43:29 +0000
From: Conor Dooley <conor@kernel.org>
To: Ivan Smirnov <isgsmirnov@gmail.com>
Cc: "Neftin, Sasha" <sasha.neftin@intel.com>,
	"Fuxbrumer, Devora" <devora.fuxbrumer@intel.com>,
	intel-wired-lan@lists.osuosl.org, Jakub Kicinski <kuba@kernel.org>,
	"Ruinskiy, Dima" <dima.ruinskiy@intel.com>,
	"Avivi, Amir" <amir.avivi@intel.com>, regressions@lists.linux.dev
Subject: Re: [Intel-wired-lan] igc kernel module crashes on new hardware
 (Intel Ethernet I225-V)
Message-ID: <Y3gKkYeijrAIhxjc@spud>
References: <CAPAtJa_o5q-sU+AD=G3y43H_5pBKnOZTQGXM99uszPXNkn8Z9A@mail.gmail.com>
 <20221031170535.77be0eb5@kernel.org>
 <03f7dc73-3e7c-1e6d-275f-85539493cd7f@intel.com>
 <CAPAtJa8qupPZZ0AiMWSxNKSd-WMg0MQDQeZcCO_Z-GGBu3jZCg@mail.gmail.com>
 <CAPAtJa_-yMusW5-C3BDivMu=MOyfKF9VQkxQotX3L_P+Q48oMA@mail.gmail.com>
 <CAPAtJa_nL5edyiN61ghXZxVUSDBFQQR3uiYJM0uo9mEao=RC0w@mail.gmail.com>
 <CAPAtJa_hbFbVXQbiNnb_byLqtZ-Dy_EBcvTFH9GyPqt__dFmLQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPAtJa_hbFbVXQbiNnb_byLqtZ-Dy_EBcvTFH9GyPqt__dFmLQ@mail.gmail.com>

Hey,

On Wed, Nov 16, 2022 at 02:23:57PM -0800, Ivan Smirnov wrote:
> Hi folks,
> 
> Is there any update for the community? More and more folks are asking. We
> are all techies and happy to help debug.

Vested interest since I am suffering from the same issue (X670E-F
Gaming), but is it okay to add this to regzbot? Not sure whether it
counts as a regression or not since it's new hw with the existing driver,
but this seems to be falling through the cracks without a response for
several weeks.

Thanks,
Conor.

> On Thu, Nov 10, 2022 at 03:44 Ivan Smirnov <isgsmirnov@gmail.com> wrote:
> 
> > Some more data from another user. Do you guys have any preliminary
> > investigation you could share back with the community?
> >
> > Same issue, been struggling with it for a last month or so: both with
> > Ubuntu and Arch Linux. I have a dual-boot system with Windows 11, and did
> > not notice any issues with ethernet or wifi on Windows. So this indeed
> > seems like a firmware issue, particularly in igc. Not the adapter itself
> >
> > Running on Arch Linux kernel 6.0.7, same motherboard as in your post
> >
> > https://gist.github.com/LilDojd/2f030ecc5c5b6f8c3285725adfb8c456
> >
> >
> >
> >
> > On Thu, Nov 3, 2022 at 05:53 Ivan Smirnov <isgsmirnov@gmail.com> wrote:
> >
> >> Here is the gist from one reddit user:
> >> https://gist.github.com/DarkArc/50ffca5fc343e2ff8166bc81d3ff8335
> >>
> >> Here are my gists (crash free for now):
> >> https://gist.github.com/issmirnov/b9ac74d232e1865ae849a3e64dce2afe
> >>
> >> --
> >> Ivan Smirnov
> >> https://ivans.io/ | https://blog.ivansmirnov.name/
> >> https://www.linkedin.com/in/ismirnov |
> >> *https://ivansmirnov.name/ <https://ivansmirnov.name/>*
> >> *https://github.com/issmirnov <https://ivansmirnov.name/>*
> >>
> >>
> >> On Wed, Nov 2, 2022 at 10:54 AM Ivan Smirnov <isgsmirnov@gmail.com>
> >> wrote:
> >>
> >>> Hi folks,
> >>>
> >>> As usual, the computers know when the experts join the chat... I haven't
> >>> been able to reproduce the issue for the past few days. Yay for stability,
> >>> boo for debugging.
> >>>
> >>> I posted on the reddit thread
> >>> <https://www.reddit.com/r/buildapc/comments/xypn1m/network_card_intel_ethernet_controller_i225v_igc/> asking
> >>> other users to post their output. I'll do my best to keep an eye out for
> >>> this issue and get you the logs ASAP once I repro the crash.
> >>>
> >>> Thank you for your responsiveness - will keep you posted!
> >>>
> >>> Best,
> >>> - Ivan
> >>> --
> >>> Ivan Smirnov
> >>> https://ivans.io/ | https://blog.ivansmirnov.name/
> >>> https://www.linkedin.com/in/ismirnov |
> >>> *https://ivansmirnov.name/ <https://ivansmirnov.name/>*
> >>> *https://github.com/issmirnov <https://ivansmirnov.name/>*
> >>>
> >>>
> >>> On Tue, Nov 1, 2022 at 10:21 AM Neftin, Sasha <sasha.neftin@intel.com>
> >>> wrote:
> >>>
> >>>> On 11/1/2022 02:05, Jakub Kicinski wrote:
> >>>> > CC: intel-wired
> >>>> >
> >>>> > On Sun, 30 Oct 2022 14:44:57 -0600 Ivan Smirnov wrote:
> >>>> >> Hi folks,
> >>>> >>
> >>>> >> I found your commits on the linux kernel igc
> >>>> >> <
> >>>> https://github.com/torvalds/linux/commits/master/drivers/net/ethernet/intel/igc
> >>>> >
> >>>> >> folder. There appears to be a bug with the igc kernel module on Intel
> >>>> >> I225-V chips.
> >>>> >>
> >>>> >> Specifically, the probe fails at startup with error: "igc: probe of
> >>>> >> 0000:06:00.0 failed with error -13". When it does load, it crashes
> >>>> after a
> >>>> >> few hours with error "igc failed to read reg 0xc030".
> >>>> >>
> >>>> Could you provide dmesg -w -T | grep -i igc on the boot stage? ethtool
> >>>> -i?
> >>>> I've cc'd our PAE expert Amir who also could try to look at this
> >>>> problem.
> >>>>
> >>>> >> There are several affected users posting on
> >>>> >>
> >>>> https://www.reddit.com/r/buildapc/comments/xypn1m/network_card_intel_ethernet_controller_i225v_igc/
> >>>> >> with more details.
> >>>> >>
> >>>> >> Could I help you debug this? This problem has been reproduced on the
> >>>> >> following setups:
> >>>> >>
> >>>> >> 1. Asus TUF-GAMING-Z690-PLUS-WIFI-D4
> >>>> >> <
> >>>> https://www.asus.com/motherboards-components/motherboards/tuf-gaming/tuf-gaming-z690-plus-wifi-d4/
> >>>> >
> >>>> >> on
> >>>> >> Arch Linux, kernel 6.0.2-arch1-1
> >>>> >> 2. rog strix x670e-e gaming wifi
> >>>> >> <
> >>>> https://rog.asus.com/us/motherboards/rog-strix/rog-strix-x670e-e-gaming-wifi-model/
> >>>> >
> >>>> >> on
> >>>> >> Proxmox 7, as well as Ubuntu Linux (kernel 5.19, I believe)
> >>>> >>
> >>>> >> I'm happy to load any debug modules or provide additional logs as per
> >>>> >> your request.
> >>>> >>
> >>>> >> Thank you
> >>>> >>
> >>>> >>
> >>>> >>
> >>>> >>
> >>>> >> --
> >>>> >> Ivan Smirnov
> >>>> >> https://ivans.io/ | https://blog.ivansmirnov.name/
> >>>> >> https://www.linkedin.com/in/ismirnov |
> >>>> >> *https://ivansmirnov.name/ <https://ivansmirnov.name/>*
> >>>> >> *https://github.com/issmirnov <https://ivansmirnov.name/>*
> >>>> >
> >>>>
> >>>> --
> > --
> > Ivan Smirnov
> > https://ivans.io/ | https://blog.ivansmirnov.name/
> > https://www.linkedin.com/in/ismirnov |
> > *https://ivansmirnov.name/ <https://ivansmirnov.name/>*
> > *https://github.com/issmirnov <https://ivansmirnov.name/>*
> >
> -- 
> --
> Ivan Smirnov
> https://ivans.io/ | https://blog.ivansmirnov.name/
> https://www.linkedin.com/in/ismirnov |
> *https://ivansmirnov.name/ <https://ivansmirnov.name/>*
> *https://github.com/issmirnov <https://ivansmirnov.name/>*

> _______________________________________________
> Intel-wired-lan mailing list
> Intel-wired-lan@osuosl.org
> https://lists.osuosl.org/mailman/listinfo/intel-wired-lan


Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AAF2C9D
	for <regressions@lists.linux.dev>; Wed,  1 Dec 2021 17:47:54 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10185"; a="236739997"
X-IronPort-AV: E=Sophos;i="5.87,279,1631602800"; 
   d="scan'208";a="236739997"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2021 09:47:53 -0800
X-IronPort-AV: E=Sophos;i="5.87,279,1631602800"; 
   d="scan'208";a="512129845"
Received: from ammonk-mobl.amr.corp.intel.com (HELO vcostago-mobl3) ([10.212.205.220])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2021 09:47:53 -0800
From: Vinicius Costa Gomes <vinicius.gomes@intel.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>, Stefan Dietrich
 <roots@gmx.de>, Jakub Kicinski <kuba@kernel.org>
Cc: Greg KH <greg@kroah.com>, netdev@vger.kernel.org,
 stable@vger.kernel.org, regressions@lists.linux.dev, Dvora Fuxbrumer
 <dvorax.fuxbrumer@linux.intel.com>, Tony Nguyen
 <anthony.l.nguyen@intel.com>, intel-wired-lan@lists.osuosl.org
Subject: Re: [REGRESSION] Kernel 5.15 reboots / freezes upon ifup/ifdown
In-Reply-To: <cd155eaf-8559-b7ad-d9da-818f59f21872@leemhuis.info>
References: <924175a188159f4e03bd69908a91e606b574139b.camel@gmx.de>
 <YZ3q4OKhU2EPPttE@kroah.com>
 <8119066974f099aa11f08a4dad3653ac0ba32cd6.camel@gmx.de>
 <20211124153449.72c9cfcd@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <87a6htm4aj.fsf@intel.com>
 <227af6b0692a0a57f5fb349d4d9c914301753209.camel@gmx.de>
 <cd155eaf-8559-b7ad-d9da-818f59f21872@leemhuis.info>
Date: Wed, 01 Dec 2021 09:47:52 -0800
Message-ID: <87r1awtdx3.fsf@intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Hi,

Thorsten Leemhuis <regressions@leemhuis.info> writes:

> Hi, this is your Linux kernel regression tracker speaking.
>
> On 25.11.21 09:41, Stefan Dietrich wrote:
>> 
>> thanks - this was spot-on: disabling CONFIG_PCIE_PTM resolves the issue
>> for latest 5.15.4 (stable from git) for both manual and network-manager
>> NIC configuration.
>> 
>> Let me know if I may assist in debugging this further.
>
> What is the status here? There afaics hasn't been any progress since
> nearly a week.
>
> Vinicius, do you still have this on your radar? Or was there some progress?
>
> Or is this really related to another issue, as Jakub suspected? Then it
> might be solved by the patch here:
>
> https://bugzilla.kernel.org/show_bug.cgi?id=215129

What I am thinking right now is that we are facing a similar problem as
the bug above, only in the igc driver. The difference is that it's the
PCIe PTM messages (from the PCIe root) that are triggering the deadlock
in the suspend/resume path in igc.

I will produce a patch in a few moments, very similar to the one in the
bug report, let's see if it helps.

>
> Ciao, Thorsten
>
>> On Wed, 2021-11-24 at 17:07 -0800, Vinicius Costa Gomes wrote:
>>> Hi Stefan,
>>>
>>> Jakub Kicinski <kuba@kernel.org> writes:
>>>
>>>> On Wed, 24 Nov 2021 18:20:40 +0100 Stefan Dietrich wrote:
>>>>> Hi all,
>>>>>
>>>>> six exciting hours and a lot of learning later, here it is.
>>>>> Symptomatically, the critical commit appears for me between
>>>>> 5.14.21-
>>>>> 051421-generic and 5.15.0-051500rc2-generic - I did not find an
>>>>> amd64
>>>>> build for rc1.
>>>>>
>>>>> Please see the git-bisect output below and let me know how I may
>>>>> further assist in debugging!
>>>>
>>>> Well, let's CC those involved, shall we? :)
>>>>
>>>> Thanks for working thru the bisection!
>>>>
>>>>> a90ec84837325df4b9a6798c2cc0df202b5680bd is the first bad commit
>>>>> commit a90ec84837325df4b9a6798c2cc0df202b5680bd
>>>>> Author: Vinicius Costa Gomes <vinicius.gomes@intel.com>
>>>>> Date:   Mon Jul 26 20:36:57 2021 -0700
>>>>>
>>>>>     igc: Add support for PTP getcrosststamp()
>>>
>>> Oh! That's interesting.
>>>
>>> Can you try disabling CONFIG_PCIE_PTM in your kernel config? If it
>>> works, then it's a point in favor that this commit is indeed the
>>> problematic one.
>>>
>>> I am still trying to think of what could be causing the lockup you
>>> are
>>> seeing.
>>>
>>>
>
> P.S.: As a Linux kernel regression tracker I'm getting a lot of reports
> on my table. I can only look briefly into most of them. Unfortunately
> therefore I sometimes will get things wrong or miss something important.
> I hope that's not the case here; if you think it is, don't hesitate to
> tell me about it in a public reply. That's in everyone's interest, as
> what I wrote above might be misleading to everyone reading this; any
> suggestion I gave they thus might sent someone reading this down the
> wrong rabbit hole, which none of us wants.
>
> BTW, I have no personal interest in this issue, which is tracked using
> regzbot, my Linux kernel regression tracking bot
> (https://linux-regtracking.leemhuis.info/regzbot/). I'm only posting
> this mail to get things rolling again and hence don't need to be CC on
> all further activities wrt to this regression.
>
> #regzbot poke

-- 
Vinicius

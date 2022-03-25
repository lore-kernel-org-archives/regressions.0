Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F75E28E0
	for <regressions@lists.linux.dev>; Fri, 25 Mar 2022 21:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1648244666; x=1679780666;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/FxF9FFn3Lt0C4l4tGU4rZi4pSdYQM2kpO5+zlFKAKY=;
  b=lPkx23JhmFxS0PB//L5D3GUPDRk1/NJT8Szlijl3QOyZauIa3cUCrkXG
   W9n7eaC30QTVx3vvq01LxagqAmZIqmIpbZR4hoLIdJDsgIRgGwSwyeWzU
   pN8JaJu/+AlOlpB+yU9nxlxsnGPwh/CP5JPrDVvrN/tMQ42zneZEazYW7
   HAECXaQDAc0g+MYKyCH9IZJ0Uo3wNPFQSNK0q9KLRnGVBjK/zNGNdUwkV
   pEwR9ciya175eF3rnsxPiC+2FeAXNxV++CCA1vQT5Wv3Tkiz1Icxljcg1
   KwiTXr2/ntgFpR4bTw7L4HwH1p21mpUCG3MrkItyk8+9o9vivoZmQwmsn
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10297"; a="283602732"
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; 
   d="scan'208";a="283602732"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2022 14:44:25 -0700
X-IronPort-AV: E=Sophos;i="5.90,211,1643702400"; 
   d="scan'208";a="561983516"
Received: from bhshelto-mobl1.amr.corp.intel.com (HELO intel.com) ([10.255.38.218])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2022 14:44:23 -0700
Date: Fri, 25 Mar 2022 17:44:20 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>,
	Lyude Paul <lyude@redhat.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	intel-gfx <intel-gfx@lists.freedesktop.org>,
	Filippo Falezza <filippo.falezza@outlook.it>,
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: [Intel-gfx] Backlight Regression in i915 that isn't handled
 appropriately afaics
Message-ID: <Yj43tPw/cILfF4go@intel.com>
References: <ec2eeead-6f4f-a851-be21-0b9db8f4c22e@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec2eeead-6f4f-a851-be21-0b9db8f4c22e@leemhuis.info>

On Thu, Mar 24, 2022 at 04:02:41PM +0100, Thorsten Leemhuis wrote:
> Hi i915 maintainers, this is your Linux kernel regression tracker!
> What's up with the following regression?
> 
> https://gitlab.freedesktop.org/drm/intel/-/issues/5284
> 
> That report it more than two weeks old now, but seems nothing of
> substance happened. And the thing is: the report is older, as the issue
> in fact was reported on 2022-01-31 already here:
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=215553
> 
> After that there was a different ticket about it later here:
> https://gitlab.freedesktop.org/drm/intel/-/issues/5027
> 
> But it got confusing, so the reporter created the ticket the first link
> in this message points to. I fully understand some of the reasons why
> this was not handled appropriately, but it looks like even the latest
> ticket is mostly ignored, apart from some bug triaging.
> 
> So could anybody please take a look into this at at least tell the
> reporter what to do to (bisection maybe?) get this solved?
> 
> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

Hi Thorsten, thank you so much for your heads up here and I'm sorry for
the delay on the response.

We will ensure this item gets a proper attention.

> 
> P.S.: As the Linux kernel's regression tracker I'm getting a lot of
> reports on my table. I can only look briefly into most of them and lack
> knowledge about most of the areas they concern. I thus unfortunately
> will sometimes get things wrong or miss something important. I hope
> that's not the case here; if you think it is, don't hesitate to tell me
> in a public reply, it's in everyone's interest to set the public record
> straight.
> 
> P.S.S.: for rezgbot:
> 
> Link:
> https://lore.kernel.org/regressions/74ee2216-a295-c2b6-328b-3e6d0cc1847e@leemhuis.info/
> 
> 

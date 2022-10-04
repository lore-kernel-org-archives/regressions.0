Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7052F59
	for <regressions@lists.linux.dev>; Tue,  4 Oct 2022 19:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664911293; x=1696447293;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=Zg8xdnyfsZdNuvruzNB7XQ6E8sleAaO4vNo0suv9IoE=;
  b=KTBL2xLqdaNlUs4CEX76MIAHMCbZFuMKI/8NC+o/3TAtQ9iLU+tOuwEd
   bNgRhAuLyqq9ug3P8AGn7IX2MV2i8Aomba7JLBrBteRBBrabKMW21S9M0
   xnbPNx17Y6eTj9Gw09lG7EUO5cE2T6nKZK1qAA3luMKKYnJbqgVbfvr8J
   9OKyxtiUFQ7dEGjWrmwRE4GJR2UOXymifTEwZxvZb9l1lE8krQTWId2BH
   GDnBPHKFTC3T44IRzyDBs15kYOI4pwxtAptSbvRDBuS+7WuCr1XKK/rf9
   Sq28MMHqMCffoTwpe7Wf4IO0ypjK8f/qhwfuq1slczGpg76xKe9eF3LZl
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="304573699"
X-IronPort-AV: E=Sophos;i="5.95,158,1661842800"; 
   d="scan'208";a="304573699"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2022 12:21:33 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="575144544"
X-IronPort-AV: E=Sophos;i="5.95,158,1661842800"; 
   d="scan'208";a="575144544"
Received: from pvarla-mobl4.gar.corp.intel.com (HELO localhost) ([10.252.39.104])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2022 12:21:30 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Thorsten Leemhuis
 <linux@leemhuis.info>
Cc: "Artem S. Tashkinov" <aros@gmx.com>, ksummit
 <ksummit-discuss@lists.linuxfoundation.org>, workflows@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "regressions@lists.linux.dev" <regressions@lists.linux.dev>
Subject: Re: Planned changes for bugzilla.kernel.org to reduce the "Bugzilla
 blues"
In-Reply-To: <20221004175354.bfvg3vhfqch35ib5@meerkat.local>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <aa876027-1038-3e4a-b16a-c144f674c0b0@leemhuis.info>
 <20221004175354.bfvg3vhfqch35ib5@meerkat.local>
Date: Tue, 04 Oct 2022 22:21:27 +0300
Message-ID: <87fsg3s8co.fsf@intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 04 Oct 2022, Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:
> I'm happy to take care of everything bot-related (apparently, programming bots
> is what I do now -- I just wish it was the cool and glamorous kind).

As to bots, one idea would be to go through old & unchanged bugs after
every kernel release or so, ask to reproduce on the new kernel, and auto
close if there's no response within some time frame. This could be very
relaxed for starters, but would start closing all the stale and
neglected bugs that have crept up that are of no use to anyone.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center

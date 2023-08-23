Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBC88BEA
	for <regressions@lists.linux.dev>; Wed, 23 Aug 2023 07:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692776693; x=1724312693;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=gWF9lIW+t/6DusPBoJ4eADfOEV4Z6H4F6mqyvQP0dk0=;
  b=jjBYgwZoQwp1AG3JNqI+5c1mHwQxhRCVZ3b2McjZ+o1eDorr6dKascgg
   3vd/eM0qKHs8KYF00baUXrTw6G7v+oYJCnt78tZG+OAhb6ccBlzFCLbCo
   3WNGZwVJyuiFZHBqraO3c2NFbF+eJ5JX0uaslFcJnUZGCrTG1II0SVz1f
   JsQotKfsO14Vg97fzV/KgKCw3Zgr8FnW3eU4qdC7yK3KxwSdDuT7l6AS9
   bf4ZjB9xsr2oiWhDx3xxzA/yg0DhlCIaI5xPAgZR6H4X9/dVwFXYITK41
   tP12HdZW2qHmNPi/U0d/v7vvpO7Ps11YHThI7YYg1/sxNi2+MaOmaM09E
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="377854249"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="377854249"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 00:44:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="880307366"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 23 Aug 2023 00:44:53 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 98FAC379; Wed, 23 Aug 2023 10:44:47 +0300 (EEST)
Date: Wed, 23 Aug 2023 10:44:47 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Kamil Paral <kparal@redhat.com>
Cc: linux-pci@vger.kernel.org, regressions@lists.linux.dev,
	bhelgaas@google.com, chris.chiu@canonical.com
Subject: Re: [REGRESSION] resume with a Thunderbolt dock broke with commit
 e8b908146d44 "PCI/PM: Increase wait time after resume"
Message-ID: <20230823074447.GR3465@black.fi.intel.com>
References: <CA+cBOTeWrsTyANjLZQ=bGoBQ_yOkkV1juyRvJq-C8GOrbW6t9Q@mail.gmail.com>
 <20230821131223.GJ3465@black.fi.intel.com>
 <CA+cBOTc-7U_sumg6g-uBs9w3m8xipuOV1VY=4nmBcyuppgi8_g@mail.gmail.com>
 <20230823050714.GP3465@black.fi.intel.com>
 <CA+cBOTdS5djXL=93VThP9K67pjYKHtjceqSczKf8NQonhpgo5Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+cBOTdS5djXL=93VThP9K67pjYKHtjceqSczKf8NQonhpgo5Q@mail.gmail.com>

On Wed, Aug 23, 2023 at 09:00:39AM +0200, Kamil Paral wrote:
> On Wed, Aug 23, 2023 at 7:07 AM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > Okay if I understand correctly with commit 7b3ba09febf4 things works as
> > before and you don't see any delays in resume?
> 
> If commit 7b3ba09febf4 is included but commit e8b908146d44 is
> excluded, the resume works as usual. Once e8b908146d44 is included (it
> doesn't matter whether 7b3ba09febf4 is included or not), the resume
> gets delayed by ~60 seconds.

Okay thanks for clarifying. The ~60s means that the PCIe link does not
come up and this is unexpected so most likely there is something else
going on during resume. I will check the logs you shared if there is
something but what is expected is that regardless of the timeout the
PCIe tunnel gets established to the dock pretty quickly and the OS does
not notice that the link is even down.

I guess even without the 60s delay you see in the logs that the PCIe
link is down and Linux starts tearing the device stack towards the dock
on resume?

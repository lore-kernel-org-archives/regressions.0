Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6152548E81
	for <regressions@lists.linux.dev>; Wed, 27 Sep 2023 15:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695829015; x=1727365015;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4y2ufGhmhaXTWIjmW47x7Uel7sXWt7hrK42AXxm10zk=;
  b=VjNin6qzSHEjzZSjWj1PqNoukYf9H28GI38TILHI9FF9W9+gHthsgk3N
   i6lUNSPp/oMjDkGntdOuAQ9+nu4csgT/3OJr1RuRNUUXHT7ANckD3oT3f
   ugfXobzKHIALjl+8QuxiqoThiNKBWj3mZCTId9DzGTH6/fep5mpehuYlP
   JYESGmPDbxR4idSINapyorLvdYr0cOwejJyhdGnMm7x6y3075P34hv6m7
   bXcg+nAfLsQm0Zwoiso7V14ycZgV+dlKXOslEkECSCOb+96XZCBSt+mwC
   KEpvldm36noUmrl0LggMJv9uCzLmSEyvL5xY4gqk1SQKMkZP5aNZRwZyY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="384651405"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="384651405"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 08:36:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="725854404"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="725854404"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 27 Sep 2023 08:36:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id AE3C5177; Wed, 27 Sep 2023 18:36:50 +0300 (EEST)
Date: Wed, 27 Sep 2023 18:36:50 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Kamil Paral <kparal@redhat.com>,
	linux-pci@vger.kernel.org, regressions@lists.linux.dev,
	bhelgaas@google.com, chris.chiu@canonical.com
Subject: Re: [REGRESSION] resume with a Thunderbolt dock broke with commit
 e8b908146d44 "PCI/PM: Increase wait time after resume"
Message-ID: <20230927153650.GL3208943@black.fi.intel.com>
References: <20230927051602.GX3208943@black.fi.intel.com>
 <20230927115703.GA445616@bhelgaas>
 <20230927124732.GI3208943@black.fi.intel.com>
 <20230927143143.GA16217@wunner.de>
 <20230927144248.GK3208943@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230927144248.GK3208943@black.fi.intel.com>

On Wed, Sep 27, 2023 at 05:42:48PM +0300, Mika Westerberg wrote:
> On Wed, Sep 27, 2023 at 04:31:43PM +0200, Lukas Wunner wrote:
> > On Wed, Sep 27, 2023 at 03:47:32PM +0300, Mika Westerberg wrote:
> > > This is not a Linux defect. The firmware is expected to create that
> > > tunnel so regardless of the "delay" the devices are already back. This
> > > is not happening.
> > 
> > I recall that newer chips can be switched over to software connection
> > manager at runtime.
> > 
> > Can we determine that the ICM firmware failed to do what it should,
> > kick it out and let the software connection manager take over?
> 
> No that's not possible. In Macs it was "partially" possible but even
> there you lose all the PM and the like. I don't even want to speculate
> what happens if you run the same on PCs.
> 
> There is an option to "force" this but I do not recommend this (pass
> thunderbolt.start_icm=1 in the command line).

Sorry, this is the complete opposite. This starts the firmware not stops
it but anyways everything else above is true ;-)

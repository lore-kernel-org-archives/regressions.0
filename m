Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EFA26FA7
	for <regressions@lists.linux.dev>; Mon, 21 Aug 2023 13:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692623622; x=1724159622;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zB8yzETn3THtXBYT0i2OPbGB+wO93hCaneHbBu4UO+o=;
  b=isDnbGnJRfDK57p4vfcWlJP0Cr1QFgpZY0MvfWM+iU13WGZqecVErTms
   v46oIgS6+FbJV9fHoi0OV7oxghR4KS34VwkAJ5eLCCdEjnKcI9vyLkNVJ
   17Nn2BeaLLcH36narVpZVYufqE27Zmj9bidmhjtcrtquB7Vk73gd7vYwf
   7k7vALKTA5yO4hyIouo9OzvXZlfZdx4K7GqIJFPrjw/2i+M4O6XdlqOps
   1Kg0/wmB4AALCWLso9giZKHF3eCCTpD8nw0CzUOtqk4EIw7pg2uqxNatv
   krqJ9MCnEe3VluBjuTwHsqYRn2nhJoWqvA+XM+R55Fiy3etlOoy2QQJ/B
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="363747564"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="363747564"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 06:12:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="770938849"
X-IronPort-AV: E=Sophos;i="6.01,190,1684825200"; 
   d="scan'208";a="770938849"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 21 Aug 2023 06:12:24 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id A264C2FF; Mon, 21 Aug 2023 16:12:23 +0300 (EEST)
Date: Mon, 21 Aug 2023 16:12:23 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Kamil Paral <kparal@redhat.com>
Cc: linux-pci@vger.kernel.org, regressions@lists.linux.dev,
	bhelgaas@google.com, chris.chiu@canonical.com
Subject: Re: [REGRESSION] resume with a Thunderbolt dock broke with commit
 e8b908146d44 "PCI/PM: Increase wait time after resume"
Message-ID: <20230821131223.GJ3465@black.fi.intel.com>
References: <CA+cBOTeWrsTyANjLZQ=bGoBQ_yOkkV1juyRvJq-C8GOrbW6t9Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+cBOTeWrsTyANjLZQ=bGoBQ_yOkkV1juyRvJq-C8GOrbW6t9Q@mail.gmail.com>

Hi,

On Mon, Aug 21, 2023 at 12:39:02PM +0200, Kamil Paral wrote:
> = Summary =
> A Thinkpad T480s laptop with a Thinkpad Thunderbolt 3 Dock connected
> can no longer resume from suspend. The problem was introduced in
> e8b908146d44 "PCI/PM: Increase wait time after resume".

Thanks for the detailed description! There was follow up patch that made
the timeout shorter for slow links, I wonder if you could try that first
and see if that changes anything? It is this commit in the mainline:

7b3ba09febf4 PCI/PM: Shorten pci_bridge_wait_for_secondary_bus() wait time for slow links

That should at least make the resume faster too but let's see.

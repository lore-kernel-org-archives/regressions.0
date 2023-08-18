Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9641643D
	for <regressions@lists.linux.dev>; Fri, 18 Aug 2023 08:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692346602; x=1723882602;
  h=date:from:to:cc:subject:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dc06fUIqtwQAqNbNhGr+uIzCfrj4zxECY6jV06ommyo=;
  b=I9h+oml42/iuDLqzo6FbdFA0og+90KnsQsCt44WLAJKWrTuCCq55+Ew8
   fMDagAeoWGPATG9mP8xVUjxbnzqVjTq3rA4y61WA25BjJa5ZRKLnjFqws
   TXTs6og8LmRHKL+066oVrYE4ysMEYqswcQN9uTQl1b5rQmvqphZOh1MFo
   EG0kVj9dMLvrMzqM3kgo2AmU6/x8mX0gYaVjbYzUrGvcWN71vNaIHQ8WJ
   dzv631o3tm8qDO14mxnQgkgdxLHHneqba8owYeaGYJFtOy9XglRt/SoxH
   zphIfcQkyXKd6z2N5j4I3ilKj0JrI0Hg0S6un/beYXptPfAxdMKUqC7kd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="363205177"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="363205177"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2023 01:16:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="735014632"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="735014632"
Received: from mtkaczyk-mobl.ger.corp.intel.com (HELO localhost) ([10.249.139.215])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2023 01:16:35 -0700
Date: Fri, 18 Aug 2023 10:16:30 +0200
From: Mariusz Tkaczyk <mariusz.tkaczyk@linux.intel.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>, Song Liu <song@kernel.org>, AceLan Kao
 <acelan@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Regressions
 <regressions@lists.linux.dev>, Linux RAID <linux-raid@vger.kernel.org>
Subject: Re: Infiniate systemd loop when power off the machine with multiple
 MD RAIDs
Message-ID: <20230818101630.000027f4@linux.intel.com>
In-Reply-To: <028a21df-4397-80aa-c2a5-7c754560f595@gmail.com>
References: <028a21df-4397-80aa-c2a5-7c754560f595@gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 16 Aug 2023 16:37:26 +0700
Bagas Sanjaya <bagasdotme@gmail.com> wrote:

> Hi,
> 
> I notice a regression report on Bugzilla [1]. Quoting from it:
> 
> > It needs to build at least 2 different RAIDs(eg. RAID0 and RAID10, RAID5
> > and RAID10) and then you will see below error repeatly(need to use serial
> > console to see it)
> > 
> > [ 205.360738] systemd-shutdown[1]: Stopping MD devices.
> > [ 205.366384] systemd-shutdown[1]: sd-device-enumerator: Scan all dirs
> > [ 205.373327] systemd-shutdown[1]: sd-device-enumerator: Scanning /sys/bus
> > [ 205.380427] systemd-shutdown[1]: sd-device-enumerator: Scanning /sys/class
> > [ 205.388257] systemd-shutdown[1]: Stopping MD /dev/md127 (9:127).
> > [ 205.394880] systemd-shutdown[1]: Failed to sync MD block device
> > /dev/md127, ignoring: Input/output error [ 205.404975] md: md127 stopped.
> > [ 205.470491] systemd-shutdown[1]: Stopping MD /dev/md126 (9:126).
> > [ 205.770179] md: md126: resync interrupted.
> > [ 205.776258] md126: detected capacity change from 1900396544 to 0
> > [ 205.783349] md: md126 stopped.
> > [ 205.862258] systemd-shutdown[1]: Stopping MD /dev/md125 (9:125).
> > [ 205.862435] md: md126 stopped.
> > [ 205.868376] systemd-shutdown[1]: Failed to sync MD block device
> > /dev/md125, ignoring: Input/output error [ 205.872845] block device
> > autoloading is deprecated and will be removed. [ 205.880955] md: md125
> > stopped. [ 205.934349] systemd-shutdown[1]: Stopping MD /dev/md124p2
> > (259:7). [ 205.947707] systemd-shutdown[1]: Could not stop MD /dev/md124p2:
> > Device or resource busy [ 205.957004] systemd-shutdown[1]: Stopping MD
> > /dev/md124p1 (259:6). [ 205.964177] systemd-shutdown[1]: Could not stop MD
> > /dev/md124p1: Device or resource busy [ 205.973155] systemd-shutdown[1]:
> > Stopping MD /dev/md124 (9:124). [ 205.979789] systemd-shutdown[1]: Could
> > not stop MD /dev/md124: Device or resource busy [ 205.988475]
> > systemd-shutdown[1]: Not all MD devices stopped, 4 left.  
> 
> See Bugzilla for the full thread and attached full journalctl log.
> 
> Anyway, I'm adding this regression to be tracked by regzbot:
> 
> #regzbot introduced: 12a6caf273240a
> https://bugzilla.kernel.org/show_bug.cgi?id=217798 #regzbot title: systemd
> shutdown hang on machine with different RAID levels
> 
> Thanks.
> 
> [1]: https://bugzilla.kernel.org/show_bug.cgi?id=217798
> 

Hello,
The issue is reproducible with IMSM metadata too, around 20% of reboot hangs. I
will try to raise the priority in the bug because it is valid high- the
base functionality of the system is affected.

Christoph, could you take a look in short term?

Thanks,
Mariusz

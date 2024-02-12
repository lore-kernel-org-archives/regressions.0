Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B7339AF6
	for <regressions@lists.linux.dev>; Mon, 12 Feb 2024 12:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707740754; cv=none; b=kXnWzMZrlnpJuZ+o5oEp2pAX5eCfRQ1FW9JBOedqqyuSzm4hEodFXy0jpuQ4ZYORed892ambGYVmTVB8z8Cj/jUmWvKgOHZqo7Xx6OJDPKCyPwGVNreEPsD6dbP89sEteGRu6cPg2PLOF20kFdxkvuS1Rixf2mtW3JneiSVMsKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707740754; c=relaxed/simple;
	bh=syeoiYY68RhglyC+I5OgQ8qMhaDh+ppH6fpxzn0jT9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J2rSSlUiNrkL5j1b8FCcRZRIioMiwBtkt7Sapvy6Qrwc/8iBWRrXunnkTVgfBZt07flBhgKk+taS9zZSB/R6DoQxJzFuhq4XvpVc8JECQVgMNLoYPDRDBTghLBvKYDNjdZrZ893VHHOwULaA0B1Cpczt3c7MPNykRH0yTGm9skg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eGu7m8CC; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eGu7m8CC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707740753; x=1739276753;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=syeoiYY68RhglyC+I5OgQ8qMhaDh+ppH6fpxzn0jT9Y=;
  b=eGu7m8CCpAZ0ALcNAQQ5zoreBxpzESYAlWgKWAf8xdQieBUC0mRTEx3M
   tAlkMFkS+3X6QJEm7nGXZZsmNbvrIpNTo/xZPUHVcI6p5dL8hRW7lvkqn
   ViLQYm9N0zMirI3/14AJOTApVemcwvzymIB/wimn6xdNEYn5Fqln5VB2i
   J/rmsV+NtCYJsJpsQsjZCAsQzdF6jMr3BLLTTo8gnVEmXLfKZ9w+03CAR
   edRudv8OaHD0wL1AuGfgVHV/rmRIlOAvSlHpzwcC4G1HdxElGBOlODols
   tJP8fz3r9auegfG1+gYYUagxTTIY2kv08oLhTv5UpBKw/gZEOi6E8ZFXq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="1867440"
X-IronPort-AV: E=Sophos;i="6.06,263,1705392000"; 
   d="scan'208";a="1867440"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2024 04:25:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="935057546"
X-IronPort-AV: E=Sophos;i="6.06,263,1705392000"; 
   d="scan'208";a="935057546"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 12 Feb 2024 04:25:49 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 39A30F7; Mon, 12 Feb 2024 14:25:48 +0200 (EET)
Date: Mon, 12 Feb 2024 14:25:48 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Olliver Schinagl <oliver@schinagl.nl>
Cc: linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Gil Fine <gil.fine@linux.intel.com>,
	Linux kernel regressions list <regressions@lists.linux.dev>,
	Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: [PATCH] thunderbolt: Fix NULL pointer dereference in
 tb_port_update_credits()
Message-ID: <20240212122548.GX8454@black.fi.intel.com>
References: <20240212115132.2630125-1-mika.westerberg@linux.intel.com>
 <0172d016-0421-4671-822e-262b2ebfc636@schinagl.nl>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0172d016-0421-4671-822e-262b2ebfc636@schinagl.nl>

On Mon, Feb 12, 2024 at 01:15:18PM +0100, Olliver Schinagl wrote:
> Hey Mika,
> 
> On 12-02-2024 12:51, Mika Westerberg wrote:
> > Olliver reported that his system crashes when plugging in Thunderbolt 1
> > device:
> > 
> >   BUG: kernel NULL pointer dereference, address: 0000000000000020
> >   #PF: supervisor read access in kernel mode
> >   #PF: error_code(0x0000) - not-present page
> >   PGD 0 P4D 0
> >   Oops: 0000 [#1] PREEMPT SMP NOPTI
> >   RIP: 0010:tb_port_do_update_credits+0x1b/0x130 [thunderbolt]
> >   Call Trace:
> >    <TASK>
> >    ? __die+0x23/0x70
> >    ? page_fault_oops+0x171/0x4e0
> >    ? exc_page_fault+0x7f/0x180
> >    ? asm_exc_page_fault+0x26/0x30
> >    ? tb_port_do_update_credits+0x1b/0x130
> >    ? tb_switch_update_link_attributes+0x83/0xd0
> >    tb_switch_add+0x7a2/0xfe0
> >    tb_scan_port+0x236/0x6f0
> >    tb_handle_hotplug+0x6db/0x900
> >    process_one_work+0x171/0x340
> >    worker_thread+0x27b/0x3a0
> >    ? __pfx_worker_thread+0x10/0x10
> >    kthread+0xe5/0x120
> >    ? __pfx_kthread+0x10/0x10
> >    ret_from_fork+0x31/0x50
> >    ? __pfx_kthread+0x10/0x10
> >    ret_from_fork_asm+0x1b/0x30
> >    </TASK>
> > 
> > This is due the fact that some Thunderbolt 1 devices only have one lane
> > adapter. Fix this by checking for the lane 1 before we read its credits.
> > 
> > Reported-by: Olliver Schinagl <oliver@schinagl.nl>
> > Closes: https://lore.kernel.org/linux-usb/c24c7882-6254-4e68-8f22-f3e8f65dc84f@schinagl.nl/
> > Fixes: 81af2952e606 ("thunderbolt: Add support for asymmetric link")
> > Cc: stable@vger.kernel.org
> > Cc: Gil Fine <gil.fine@linux.intel.com>
> > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > ---
> > Hi Olliver,
> > 
> > I managed to reproduce this with a Thunderbolt 1 device. I wonder if you
> > can try this patch and see if it fixes your issue too?
> 
> That sounds reasonable, as it's an old Macbook (Should be TB2) with an old
> ethernet dongle (probably TB1?) or simply because it doesn't need that much
> speed (gbit adapter only). Sadly patching my kernel is not something I can
> do at the moment.

Right, if you plug in a TB1 device into TB2 host, that's also same issue
(TB1 devices don't always have two lane adapters).

It's fine if you cannot test this (but let me know if you want
instructions). I can pick this into my fixes branch and send for -rc. It
should land the arch Linux kernel tree at some point too, so you get it
by upgrading the kernel.

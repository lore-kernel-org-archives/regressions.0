Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE6DC8C4
	for <regressions@lists.linux.dev>; Fri, 25 Aug 2023 09:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692956810; x=1724492810;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=2kzpeTULOBgdjKH8IcKe5A4pH9I2HrNIDiNBAP1Ww1A=;
  b=GOzfPZR8avnn9LJRGAFXi1W2kJChZQCXBfi4QkNd4DIFj4gnoZk21ZBl
   37f+6IJmsjEq6PP0kceF9eMlSVHvIc79d41XWet/0jmEShhTgvZK7S/nM
   wH45LnI2lJoQwYEeuMQVPUzEjxwYXuirTpHsXZZMfE1OhEIsOPca9004L
   DjbYQZo21OgiJEjWgRT/qGw7uBMRBnfAXYRZIZXjrQRTQJiuKK9JFqaHl
   adKQnAgWaZaCxSupV6ejWcMOMAFAf10RTIAcPO7169HHYpig9Z3rFMWDB
   OZ91wtOiY3pixSsZp8uMl8XDPYquOPs8Qvf8oYgYqs17BPB+nD3GDfjmk
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="355005927"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="355005927"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 02:46:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="851902078"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="851902078"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 25 Aug 2023 02:46:47 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 3635623A; Fri, 25 Aug 2023 12:46:46 +0300 (EEST)
Date: Fri, 25 Aug 2023 12:46:46 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Kamil Paral <kparal@redhat.com>
Cc: linux-pci@vger.kernel.org, regressions@lists.linux.dev,
	bhelgaas@google.com, chris.chiu@canonical.com
Subject: Re: [REGRESSION] resume with a Thunderbolt dock broke with commit
 e8b908146d44 "PCI/PM: Increase wait time after resume"
Message-ID: <20230825094646.GC3465@black.fi.intel.com>
References: <CA+cBOTc-7U_sumg6g-uBs9w3m8xipuOV1VY=4nmBcyuppgi8_g@mail.gmail.com>
 <20230823050714.GP3465@black.fi.intel.com>
 <CA+cBOTdS5djXL=93VThP9K67pjYKHtjceqSczKf8NQonhpgo5Q@mail.gmail.com>
 <20230823074447.GR3465@black.fi.intel.com>
 <20230823075649.GS3465@black.fi.intel.com>
 <CA+cBOTco17b_8ZMhU8gXy8z2mtZXvVxrEUdKaAuZMhyFYC3yeQ@mail.gmail.com>
 <20230823090525.GT3465@black.fi.intel.com>
 <CA+cBOTeOSBkw_-AM6desmdVQjTXUZbKppK_PDiOM3sXQW5QKiA@mail.gmail.com>
 <20230824114300.GU3465@black.fi.intel.com>
 <CA+cBOTej22hWEFvMOnFfKy16tuzS_+S7kccPPYXNoGVbYMoEdA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+cBOTej22hWEFvMOnFfKy16tuzS_+S7kccPPYXNoGVbYMoEdA@mail.gmail.com>

Hi,

On Fri, Aug 25, 2023 at 10:42:55AM +0200, Kamil Paral wrote:
> On Thu, Aug 24, 2023 at 1:43 PM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > One thing I noticed, probably has nothing to do with this, but you have
> > the "security level" set to "secure". Now this is fine and actually
> > recommended but I wonder if anything changes if you switch that
> > temporarily to "user"? What is happening here is that once the system
> > enters S3 the Thunderbolt driver tells the firmware to save the
> > connected device list, and then once it exits S3 it is expected to
> > re-connect the PCIe tunnels of the devices on that list but this is not
> > happening and that's why the dock "dissappears" during resume.
> 
> That was a great suggestion. After switching to the user security
> level, the resume delay is gone, and my dock devices seem to be
> working almost immediately after resume! The dmesg for that is here:
> https://bugzilla-attachments.redhat.com/attachment.cgi?id=1985262

Yeah looks good now.

> I've done tens of cycles and haven't found any race conditions, unlike
> with the TB assist mode. (Only once, my USB mouse wasn't working at
> all, but that's something that occasionally happens on most docks I've
> worked with and seems to be some different issue).
> 
> I'm sorry I haven't found this earlier myself. I did try switching
> these options, but I bundled it together with enabling the TB assist
> mode, which has quirks, so I didn't realize switching just this one
> option might have an impact.
> 
> > In any case we can conclude that the commit in question has nothing to
> > do with the issue. This is completely Thunderbolt related problem.
> 
> Considering the information above, does this appear to be a solely
> dock-related issue (bugged firmware), or does it make sense to follow
> up on this in some different kernel list? I have to say I'm completely
> OK with running the laptop using the "user" TB security level, but if
> you think I should follow up somewhere to get the "secure" level fixed
> (or some workaround applied, etc), I can.

I would start by contacting Lenovo because I suspect this is Thunderbolt
firmware (host side not dock) issue so they may pull a newer one for
this one from Intel.

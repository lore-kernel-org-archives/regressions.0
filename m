Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA43182A0
	for <regressions@lists.linux.dev>; Thu,  5 Oct 2023 13:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HBa74QjG"
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696511382; x=1728047382;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=KzpeFTx8zrn8+AF9NwBkDldV/9DUbJCChCOgqhxZ3gk=;
  b=HBa74QjGszB0Y9e86XrvNqVmmaGC6g3TxnfPQwJ3/469J+Maj1mEjrQ4
   28hKpnbpQ74UE7hCu4HUcfJuITSm04ovK4sGSueJsFn2P/UWtl0tnPDsQ
   h8Gc+LCvn+6sFjxoOo2PYhDt1MPNQV1bez0WtGvWL+/9g4J3QINc2Iq2l
   PN+y6Jy6Sd8E1gsA18pv+RI6DI/RCg73xiRz00mlwtiusKOA3tU4W1b+X
   20REbo7ZRdFbtwgBfaR7RQQToJIdChl8udUuyKILq7yJbo/n12fDDHioc
   gz2ZAXMEnHk3MjQMVStwLr7LURctQ67q7dUf+ggto9NeTJgRsyQ6n014u
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="469758236"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="469758236"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2023 06:09:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="781243723"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="781243723"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 05 Oct 2023 06:09:38 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 17E8535A; Thu,  5 Oct 2023 16:09:37 +0300 (EEST)
Date: Thu, 5 Oct 2023 16:09:37 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Kamil Paral <kparal@redhat.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Lukas Wunner <lukas@wunner.de>,
	linux-pci@vger.kernel.org, regressions@lists.linux.dev,
	bhelgaas@google.com, chris.chiu@canonical.com
Subject: Re: [REGRESSION] resume with a Thunderbolt dock broke with commit
 e8b908146d44 "PCI/PM: Increase wait time after resume"
Message-ID: <20231005130937.GS3208943@black.fi.intel.com>
References: <20230925141930.GA21033@wunner.de>
 <20230926175530.GA418550@bhelgaas>
 <20230927051602.GX3208943@black.fi.intel.com>
 <CA+cBOTds9k1Q2haC_gTpsUvjP02dHOv9vSconFEAu-Fsxwf36A@mail.gmail.com>
 <20230927135346.GJ3208943@black.fi.intel.com>
 <CA+cBOTfCy-KOptir9yfkVz1=bfOTPQanqe9ofX-jphm7oeBEXg@mail.gmail.com>
 <CA+cBOTdzp+6whm=Sj5nE2=MC4a+45y0CFtk4hDGq0XgF6f0f2A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+cBOTdzp+6whm=Sj5nE2=MC4a+45y0CFtk4hDGq0XgF6f0f2A@mail.gmail.com>

Hi Kamil,

On Thu, Oct 05, 2023 at 02:54:23PM +0200, Kamil Paral wrote:
> On Wed, Sep 27, 2023 at 4:12 PM Kamil Paral <kparal@redhat.com> wrote:
> >
> > On Wed, Sep 27, 2023 at 3:53 PM Mika Westerberg
> > <mika.westerberg@linux.intel.com> wrote:
> > > If you apply the patch from here:
> > >
> > > https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=pm&id=6786c2941fe1788035f99c98c932672138b3fbc5
> > >
> > > Does the problem go away with the disconnect case too (and so that you
> > > have "secure" enabled)?
> >
> > Thanks, I'll test it, but I can't do it this week. I'll reply next week.
> 
> Hello Mika, sorry for taking me so long. The URL above gives me a "Bad
> commit reference" error, but I found a patch mentioned in a different
> thread, so I used that one, and I hope it's the correct one :-) It's
> quoted below.
> 
> With the patch applied, I can confirm that disconnecting and
> reconnecting the cable during suspend is no longer a problem. I tested
> both "user" and "secure" Thunderbolt security levels. The resume is
> fast in all cases, and I've found no issues. Thanks for working on it!
> 
> The patch I used:

Yes, that patch is the correct one. Bjorn moved it to his "for-linus"
branch so it got different Commit ID:

https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=for-linus&id=c82458101d5490230d735caecce14c9c27b1010c

Thanks a lot for testing!

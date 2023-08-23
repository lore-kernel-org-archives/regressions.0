Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1577320F0F
	for <regressions@lists.linux.dev>; Wed, 23 Aug 2023 05:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692767239; x=1724303239;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=d7PdSEv7Jwsv3vTkO02exhv7qYxEAvqR08AmLs2hV0g=;
  b=TGXZ8ILNoBpScl0Gl890eZ6Sjb8DTE/TMc3hppPkxbLnU9e7Se4o1tG1
   bbifo8/3oYUkGNJdAVKR2rIvTmKGf3v5owxBlJrSDuhXg/VLxVQbM+xy9
   mW+/PbkuqHuER+Mg5zMnLV3bHqiqunlXQd+mM54m8mS2867YUe2Es7lsH
   8QGNQ8yfQ78OLe0vN7yv3CRIgFHKzE0rnIxAIESEdnmokbqJ83ZM3koT9
   tIiteZDLXjwBGt72aqOYZs1/VIk6vFerbKuxUmxf/dykHQX7sNXMBv/Vi
   FH4gEgle+kRqRSvW/POfVY3Ut9W7S7ONCOO6G2lymvWfGQhIELZZIUALG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="405068687"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="405068687"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2023 22:07:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10810"; a="801963211"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="801963211"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 22 Aug 2023 22:07:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id DE4DE2FF; Wed, 23 Aug 2023 08:07:14 +0300 (EEST)
Date: Wed, 23 Aug 2023 08:07:14 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Kamil Paral <kparal@redhat.com>
Cc: linux-pci@vger.kernel.org, regressions@lists.linux.dev,
	bhelgaas@google.com, chris.chiu@canonical.com
Subject: Re: [REGRESSION] resume with a Thunderbolt dock broke with commit
 e8b908146d44 "PCI/PM: Increase wait time after resume"
Message-ID: <20230823050714.GP3465@black.fi.intel.com>
References: <CA+cBOTeWrsTyANjLZQ=bGoBQ_yOkkV1juyRvJq-C8GOrbW6t9Q@mail.gmail.com>
 <20230821131223.GJ3465@black.fi.intel.com>
 <CA+cBOTc-7U_sumg6g-uBs9w3m8xipuOV1VY=4nmBcyuppgi8_g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+cBOTc-7U_sumg6g-uBs9w3m8xipuOV1VY=4nmBcyuppgi8_g@mail.gmail.com>

Hi,

On Tue, Aug 22, 2023 at 06:43:54PM +0200, Kamil Paral wrote:
> On Mon, Aug 21, 2023 at 3:13 PM Mika Westerberg
> <mika.westerberg@linux.intel.com> wrote:
> > Thanks for the detailed description! There was follow up patch that made
> > the timeout shorter for slow links, I wonder if you could try that first
> > and see if that changes anything? It is this commit in the mainline:
> >
> > 7b3ba09febf4 PCI/PM: Shorten pci_bridge_wait_for_secondary_bus() wait time for slow links
> >
> 
> Hello Mika, thanks for a quick response. Please see my reply to Bjorn,
> the resume is just 60+ seconds delayed, not completely failing, I was
> wrong about that. I attached my logs there.
> 
> To respond to your question, I applied 7b3ba09febf4 on top of
> fe15c26ee26e (which is the parent of e8b908146d44) and tested that.
> Hopefully I understood the instructions correctly. That kernel resumes
> just fine, with the expected speed (~5 seconds), no extra delay. (If
> there's a speed-up, I can't really tell).

Okay if I understand correctly with commit 7b3ba09febf4 things works as
before and you don't see any delays in resume?

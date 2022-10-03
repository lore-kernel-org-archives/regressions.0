Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0E817E9
	for <regressions@lists.linux.dev>; Mon,  3 Oct 2022 17:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664819124; x=1696355124;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=sV4+USFuN9SxfTGNpeKs9asqcBf37BL9Xh3GpgLh7rY=;
  b=loLPFJ6lq5yyTfwnVhq6v8q5tFTxC0oWKKSffbri5/iEdPP1rLhr5+Q0
   69E3Zbw2bSpke7weZ2jVZ61C/kgaURkqv5/b5iGtzO2pRuNfPDwr8/qbA
   wF4mI3e7w5dLthX8rUpMI69pQcyia35zOMGR4KDY322UaPnV/XQ2Bp0sz
   +0lazmCBJDOF3XIyiD1Ef7W60YhbOJzLv5vdzkpcL/ZOOutgWwN2P7DYc
   Zql0sP6h7XdMrfN9gKi+wYvL2NrGAxOg9u6TlB//5fx+FTRUZmXoYb5/y
   8jVKgZdi47VIoV7vyn/9a36Ku90duYZj0jIC3uVcXXXynnD19Tamqb5+R
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="389000324"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; 
   d="scan'208";a="389000324"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2022 10:45:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10489"; a="868687383"
X-IronPort-AV: E=Sophos;i="5.93,366,1654585200"; 
   d="scan'208";a="868687383"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
  by fmsmga006.fm.intel.com with SMTP; 03 Oct 2022 10:45:19 -0700
Received: by stinkbox (sSMTP sendmail emulation); Mon, 03 Oct 2022 20:45:18 +0300
Date: Mon, 3 Oct 2022 20:45:18 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Slade Watkins <srw@sladewatkins.net>, Jerry Ling <jiling@cern.ch>
Subject: Re: Regression on 5.19.12, display flickering on Framework laptop
Message-ID: <YzsfrkJcwqKOO+E/@intel.com>
References: <55905860-adf9-312c-69cc-491ac8ce1a8b@cern.ch>
 <YzZynE2FAMNQKm2E@kroah.com>
 <YzaFq7fzw5TbrJyv@kroah.com>
 <03147889-B21C-449B-B110-7E504C8B0EF4@sladewatkins.net>
 <aa8b9724-50c6-ae2e-062d-3791144ac97e@cern.ch>
 <e3e2915d-1411-a758-3991-48d6c2688a1e@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e3e2915d-1411-a758-3991-48d6c2688a1e@leemhuis.info>
X-Patchwork-Hint: comment

On Sat, Oct 01, 2022 at 12:07:39PM +0200, Thorsten Leemhuis wrote:
> On 30.09.22 14:26, Jerry Ling wrote:
> > 
> > looks like someone has done it:
> > https://bbs.archlinux.org/viewtopic.php?pid=2059823#p2059823
> > 
> > and the bisect points to:
> > 
> > |# first bad commit: [fc6aff984b1c63d6b9e54f5eff9cc5ac5840bc8c]
> > drm/i915/bios: Split VBT data into per-panel vs. global parts Best, Jerry |
> 
> FWIW, that's 3cf050762534 in mainline. Adding Ville, its author to the
> list of recipients.

I definitely had no plans to backport any of that stuff,
but I guess the automagics did it anyway.

Looks like stable is at least missing this pile of stuff:
50759c13735d drm/i915/pps: Keep VDD enabled during eDP probe
67090801489d drm/i915/pps: Reinit PPS delays after VBT has been fully parsed
8e75e8f573e1 drm/i915/pps: Split PPS init+sanitize in two
586294c3c186 drm/i915/pps: Stash away original BIOS programmed PPS delays
89fcdf430599 drm/i915/pps: Don't apply quirks/etc. to the VBT PPS delays if they haven't been initialized
60b02a09598f drm/i915/pps: Introduce pps_delays_valid()

But dunno if even that is enough.

This bug report is probably the same thing:
https://gitlab.freedesktop.org/drm/intel/-/issues/7013

> 
> Did anyone check if a revert on top of 5.19.12 works easily and solves
> the problem?
> 
> And does anybody known if mainline affected, too?
> 
> Ciao, Thorsten
> 
> 
> > On 9/30/22 07:11, Slade Watkins wrote:
> >> Hey Greg,
> >>
> >>> On Sep 30, 2022, at 1:59 AM, Greg KH <gregkh@linuxfoundation.org> wrote:
> >>>
> >>> On Fri, Sep 30, 2022 at 06:37:48AM +0200, Greg KH wrote:
> >>>> On Thu, Sep 29, 2022 at 10:26:25PM -0400, Jerry Ling wrote:
> >>>>> Hi,
> >>>>>
> >>>>> It has been reported by multiple users across a handful of distros
> >>>>> that
> >>>>> there seems to be regression on Framework laptop (which presumably
> >>>>> is not
> >>>>> that special in terms of mobo and display)
> >>>>>
> >>>>> Ref:
> >>>>> https://community.frame.work/t/psa-dont-upgrade-to-linux-kernel-5-19-12-arch1-1-on-arch-linux-gen-11-model/23171
> >>>> Can anyone do a 'git bisect' to find the offending commit?
> >>> Also, this works for me on a gen 12 framework laptop:
> >>>     $ uname -a
> >>>     Linux frame 5.19.12 #68 SMP PREEMPT_DYNAMIC Fri Sep 30 07:02:33
> >>> CEST 2022 x86_64 GNU/Linux
> >>>
> >>> so there's something odd with the older hardware?
> >>>
> >>> greg k-h
> >> Could be. Running git bisect for 5.19.11 and 5.19.12 (as suggested by
> >> the linked forum thread) returned nothing on gen 11 for me.
> >>
> >> This is very odd,
> >> -srw
> > 
> > 

-- 
Ville Syrjälä
Intel

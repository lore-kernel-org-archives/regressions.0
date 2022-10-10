Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4831C05
	for <regressions@lists.linux.dev>; Mon, 10 Oct 2022 06:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1665384581; x=1696920581;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dDQtaRTCnXAhK8VR9vgFzDe3WUSmC6hAYRMwNSjoqzg=;
  b=Li3OJhPfWboDPSKognRm1j/aQ5+v+r5T/8ODaJUyAdBybMdi8Lf6lz0p
   PEYsjT5B1zyJheDQS2cRPH6MyuhpIVXDiwyYpsNDVMGqjqS3vhJiJpO/m
   iuljj4EiQD3bBRqtBm9TvFh5SU3WI1GaynPh2Ogu08ipg/8Qn0VtQ1706
   j55vwcKXjUMj98S9TyFqG95nVXkoV3PqJMrRUV0u5LFzD7uSZgVDvhC9K
   hmQmNVhQ/KXV634FjTLMlBv7FgEdq303NSRvIM8NCp1bYz2rfVybIb4Ck
   paUfVcXxPqRLgD6CdiuRhkARnmP+kVLmxxPPFYKMjxzgOST6x6ihBRVFL
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="301766150"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; 
   d="scan'208";a="301766150"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2022 23:49:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10495"; a="688680101"
X-IronPort-AV: E=Sophos;i="5.95,173,1661842800"; 
   d="scan'208";a="688680101"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 09 Oct 2022 23:49:39 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1ohmbZ-004kvk-1x;
	Mon, 10 Oct 2022 09:49:37 +0300
Date: Mon, 10 Oct 2022 09:49:37 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, Lee Jones <lee@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, regressions@lists.linux.dev
Subject: Re: [PATCH v1 1/1] mfd: syscon: Remove repetition of the
 regmap_get_val_endian()
Message-ID: <Y0PAgTLg85No6e/Q@smile.fi.intel.com>
References: <20220808140811.26734-1-andriy.shevchenko@linux.intel.com>
 <20221009163942.GA630814@roeck-us.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221009163942.GA630814@roeck-us.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Sun, Oct 09, 2022 at 09:39:42AM -0700, Guenter Roeck wrote:
> On Mon, Aug 08, 2022 at 05:08:11PM +0300, Andy Shevchenko wrote:
> > Since the commit 0dbdb76c0ca8 ("regmap: mmio: Parse endianness
> > definitions from DT") regmap MMIO parses DT itsef, no need to
> > repeat this in the caller(s).
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> This patch results in reboot failures for all big endian mips emulations.
> 
> Sample log:
> 
> Network interface test passed
> Boot successful.
> Rebooting
> reboot: Restarting system
> Unable to restart system
> Reboot failed -- System halted
> 
> The problem is not seen with little endian mips emulations. Reverting
> this patch fixes the problem. Bisect log attached.
> 
> #regzbot introduced: 72a95859728a
> #regzbot title: Reboot failure on big endian mips systems

Right, Jason sent a revert already, but Linus asked for the proper submission.

-- 
With Best Regards,
Andy Shevchenko



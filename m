Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AECB7B
	for <regressions@lists.linux.dev>; Mon,  9 May 2022 09:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652087742; x=1683623742;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hhUDxYirHmmHQrnUPYNLx4esvYuig8zehpJG38IHljA=;
  b=D1wtdkaMUmthJxQmtmIO4YZ+vrr4TC2vFq8Xr9VUyNR1u5Y8a9Ei7LGi
   MgsvwK3CJ2qygtqWRQp1isygjwylSr2oYIQ+0snyqDC7ZZ22SVRX4j1qz
   abXStE4D9PtFfclhmHaenQ61CFhh/iRF+V2cT0TuN1sCU7EHlzZAKvsu5
   UrbD/pspu/X8KRsOMYqQdhkZkmyvHRO0KyRGvmQP76Ip544pWI/V/XndT
   4QJGbQ2Me4h16Lhm1kJd5ANerOj9QSklKmnTCNdG1CQRkUCD6zw3xdfCl
   v+OSiUQQ+BtuMKyqHjYYx68dSgx+xpBbsagqlaN5wNyMT3oy+iPTRzdcR
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="355420829"
X-IronPort-AV: E=Sophos;i="5.91,210,1647327600"; 
   d="scan'208";a="355420829"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2022 02:15:41 -0700
X-IronPort-AV: E=Sophos;i="5.91,210,1647327600"; 
   d="scan'208";a="519128729"
Received: from oanderso-mobl1.ger.corp.intel.com (HELO [10.213.217.157]) ([10.213.217.157])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2022 02:15:39 -0700
Message-ID: <7e6540c1-b9d5-eb47-f4b5-4e3d8dd4089a@linux.intel.com>
Date: Mon, 9 May 2022 10:15:37 +0100
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [5.18 regression] drm/i915 BYT rendering broken due to "Remove
 short-term pins from execbuf, v6"
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: "regressions@lists.linux.dev" <regressions@lists.linux.dev>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <1366349e-f96a-3f2c-3094-f5cd1a6fa31f@redhat.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <1366349e-f96a-3f2c-3094-f5cd1a6fa31f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 08/05/2022 15:38, Hans de Goede wrote:
> Hi All,
> 
> When running a 5.18-rc4 (and -rc5) kernel on a Chuwi Hi 8, which is
> a Bay Trail based tablet with 2G RAM and a 1200x1920 DSI panel.
> I noticed that gnome-shell was misrendering. Many UI elements were
> missing (they were all black) and at the gdm login screen (which is
> a special gnome-shell session) the screen often was entirely black
> until I move the cursor around and then various things got
> highlighted after which they sometimes stuck around and sometimes
> they disappeared again after the highlight.
> 
> Since this problem does not happen with various 5.17.y kernels I
> believe that this is a kernel regression in 5.18. I've bisected this
> and the bisect points to:
> 
> commit b5cfe6f7a6e1 ("drm/i915: Remove short-term pins from execbuf, v6.")
> 
> from Maarten. This commit cleanly reverts on top of 5.18-rc5 and
> I can confirm that 5.18-rc5 with b5cfe6f7a6e1 reverted fixes things.
> 
> I would be more then happy to test any possible fixes for this.

For reference the same commit was identified for a GM45 regression here:

https://gitlab.freedesktop.org/drm/intel/-/issues/5806

Regards,

Tvrtko

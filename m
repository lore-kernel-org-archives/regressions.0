Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1430914004
	for <regressions@lists.linux.dev>; Thu,  7 Sep 2023 21:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694120497; x=1725656497;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=1TJX2fxitiy8P/tUl0ZPLXAl8DRdzkpD4eQW3906Ids=;
  b=CXFKEBPmp4ADC2hqXGUDxnBRRYanso4KSmjLT8f8I/pY+mj35e/5L8x9
   hEnkotpftyVzTKPS4jOVkfgd5E1tH4TqRhAOi+CFWU8/cHwfEsy5xcRAv
   z2Q+W3KQK0Bao30m3tvAup/zRe529BSO0JzvnqPu3Qe1c0kQt0PAqVM+J
   n75I2eNhoGt2uh2mQjHEwBz7d3wl4ZxZ0IfzgJ4Hrx2/dCpLsUFLmgsnL
   4QnKCgA8/L7Z1XM+Sw5HUmL7UVbQqWtPr8LJugX9kAZ4soNbfvbGPDq5C
   TbXwqq8G46sPPXQlR37xoqo2JRdD3yWM06stNWuvYQ2xdfvT5sAYWHifz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="367736361"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="367736361"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 14:01:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="807690341"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="807690341"
Received: from ayushgup-mobl.amr.corp.intel.com (HELO [10.209.118.125]) ([10.209.118.125])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2023 14:01:10 -0700
Message-ID: <171e6a9435a33885a73b48762f86954e447c26c2.camel@linux.intel.com>
Subject: Re: [External] Re: Fwd: WARNING: CPU: 13 PID: 3837105 at
 kernel/sched/sched.h:1561 __cfsb_csd_unthrottle+0x149/0x160
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Hao Jia <jiahao.os@bytedance.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Benjamin Segall <bsegall@google.com>, Bagas Sanjaya
 <bagasdotme@gmail.com>,  Vincent Guittot <vincent.guittot@linaro.org>, Igor
 Raits <igor.raits@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Regressions
 <regressions@lists.linux.dev>,  Linux Stable <stable@vger.kernel.org>
Date: Thu, 07 Sep 2023 14:01:10 -0700
In-Reply-To: <3544d5e3-3070-9ddc-fa6c-a05ed35dfd14@bytedance.com>
References: <a5dd536d-041a-2ce9-f4b7-64d8d85c86dc@gmail.com>
	 <xm26cyz4ibnb.fsf@google.com>
	 <55e2861e-9722-08f8-2c49-966035ff4218@bytedance.com>
	 <20230904222351.GC2568@noisy.programming.kicks-ass.net>
	 <3544d5e3-3070-9ddc-fa6c-a05ed35dfd14@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2023-09-07 at 16:59 +0800, Hao Jia wrote:
>=20
> On 2023/9/5 Peter Zijlstra wrote:
> > On Thu, Aug 31, 2023 at 04:48:29PM +0800, Hao Jia wrote:
> >=20
> > > If I understand correctly, rq->clock_update_flags may be set to
> > > RQCF_ACT_SKIP after __schedule() holds the rq lock, and sometimes the=
 rq
> > > lock may be released briefly in __schedule(), such as newidle_balance=
(). At
> > > this time Other CPUs hold this rq lock, and then calling
> > > rq_clock_start_loop_update() may trigger this warning.
> > >=20
> > > This warning check might be wrong. We need to add assert_clock_update=
d() to
> > > check that the rq clock has been updated before calling
> > > rq_clock_start_loop_update().
> > >=20
> > > Maybe some things can be like this?
> >=20
> > Urgh, aside from it being white space mangled, I think this is entirely
> > going in the wrong direction.
> >=20
> > Leaking ACT_SKIP is dodgy as heck.. it's entirely too late to think
> > clearly though, I'll have to try again tomorrow.

I am trying to understand why this is an ACT_SKIP leak.
Before call to __cfsb_csd_unthrottle(), is it possible someone
else lock the runqueue, set ACT_SKIP and release rq_lock?
And then that someone never update the rq_clock?=20

>=20
> Hi Peter,
>=20
> Do you think this fix method is correct? Or should we go back to the=20
> beginning and move update_rq_clock() from unthrottle_cfs_rq()?
>=20
If anyone who locked the runqueue set ACT_SKIP also will update rq_clock,
I think your change is okay.  Otherwise rq_clock could be missing update.

Thanks.

Tim

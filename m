Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1621837158
	for <regressions@lists.linux.dev>; Wed, 29 Nov 2023 15:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QOR6qj5s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701270346; x=1732806346;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=fuBRJoZc8zYA4dA1/vrdLgmtDN9b8lrYs3XPfP7VKUY=;
  b=QOR6qj5s/ucrXEsU/Si48RyJtOM7ZuRDOaguIOw8bj3yOF6cuRtUz3J7
   WJEAuJtq3uqHJC2I7VXfQFtPOPN/3i6unjjvyk9+tqoMeRCbYScusVgLX
   zLcKZHwwDLH9gT7IzsZ4x463KiYjhmFnQSqoamH3SSWaHWSCXTlUaoDBg
   r13KY/3NjZKD9FYwjSyEVVTsJSnDpXYeJ6Onc9SOobvkRhlQDtPKHroxc
   ZnWiO8VjMnRXsX6EdqqJBY/rsTmPwbd7mReQvyXbT9+Qn1q/0mnreQE9Q
   VKBwJKjfBV6ttFrXUo9hupDL+9qXK2zvMtOZlP8x5w5tZscUbLezVzqUz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="378207309"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="378207309"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 07:05:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="892479673"
X-IronPort-AV: E=Sophos;i="6.04,235,1695711600"; 
   d="scan'208";a="892479673"
Received: from besamani-mobl2.amr.corp.intel.com (HELO [10.212.113.90]) ([10.212.113.90])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 07:05:43 -0800
Message-ID: <a106fb4733d0a3f0d6d5792705cdb5cee13731f8.camel@linux.intel.com>
Subject: Re: Fwd: Intel hybrid CPU scheduler always prefers E cores
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Tim Chen <tim.c.chen@linux.intel.com>, Ramses <ramses@well-founded.dev>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Regressions
 <regressions@lists.linux.dev>,  Linux Power Management
 <linux-pm@vger.kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Viresh
 Kumar <viresh.kumar@linaro.org>,  Ingo Molnar <mingo@redhat.com>, Peter
 Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, Yu Chen <yu.c.chen@intel.com>
Date: Wed, 29 Nov 2023 10:05:42 -0500
In-Reply-To: <c2a9ceb3d7b1f384ad94d10b7058bb1cebea3d07.camel@linux.intel.com>
References: <01df8329-06d7-4fd1-9c7a-05296f33231e@gmail.com>
	 <b2b9121c6d2003b45f7fde6a97bb479a1ed634c7.camel@linux.intel.com>
	 <NkN3JYx--3-9@well-founded.dev>
	 <c2a9ceb3d7b1f384ad94d10b7058bb1cebea3d07.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2023-11-28 at 15:10 -0800, Tim Chen wrote:
> On Tue, 2023-11-28 at 23:33 +0100, Ramses wrote:
>=20
> > I applied the patch on top of 6.6.2, but unfortunately I see more
> > or less the same behaviour as before, with single-threaded CPU-
> > bound tasks running almost exclusively on E cores.
> >=20
> > Ramses
>=20
> I suspect that you may have other issues. I wonder if CPU priorities
> are getting
> assigned properly on your system.
>=20
> Saw in the original bugzilla=20
> https://bugzilla.kernel.org/show_bug.cgi?id=3D218195
> that you don't see /proc/sys/kernel/sched_itmt_enabled which
> may be a symptom of such a problem.
>=20
> +Srinivas, is there something Ramses can do to help
> find out if there are issues with cppc?
I have updated the bugzilla with the findings. The ACPI config on this
system is telling us that CPPC v2 is not supported. Current
implementation depends on CPPC v2.

Even in 6.4 kernel, ITMT is not enabled.

Thanks,
Srinivas


>=20
> Tim
>=20


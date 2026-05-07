Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CA83CCA02
	for <regressions@lists.linux.dev>; Thu,  7 May 2026 09:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778147743; cv=none; b=hoMqaXxdQedkh+3buie6hMT1HpnmY6RpgsLg608wG0g6jgkLQbCXodFAgkuuDuaGPaxMN1u8mpL7a2oyUigJwEKqU5LIBKpS0f/n4RSevLlXCRWAdDpA72lBrYPfzZjO29yNHRRq5jRcewZpF2tG5HqOZP4IfARtkVZSea803JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778147743; c=relaxed/simple;
	bh=/zzzHZMG+uW2bO7g4Oenf1+yGbfgZuNT2WlmWKXw1KM=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=SB9iNRH1vYiWBpy1FMoFiT7BSZsA2BwtgQAni7TPJFqP4gBnuu55rodbfe/OekKW5ygPxS4W7NQHpNIhi1Rvrjsbcuj7/c3Fu4UPtfG4qS5rHgQhw0OvYu1uGxxx6rxwzCuvPiLp1K1DAAyPx1A8bCLNHsndAT888MwmogTBEXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MOV7xDzp; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MOV7xDzp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778147740; x=1809683740;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=/zzzHZMG+uW2bO7g4Oenf1+yGbfgZuNT2WlmWKXw1KM=;
  b=MOV7xDzplX3iGyOeTrnLGInl1Nt0gDs7ChpVzR7tAcNv3o7EySskHEPG
   he9esQwwBYn3Ut6OR+VKEkh6FLMd3uth1n9Oj8TuFESSrBlyRU9bkWoT8
   Gl6C3bnjoUQWm47KgyV/XzQGceeCaL5pOgoS+r+oPsAR3nEXrTQIBl5DJ
   rwoKEFO54KNMIGFZLs/t/bHX3Aui5aVOOXp0GZFju8Ci4bNhHc7J0hC8/
   hmo/c1H92Aum3kNmV6U4/r5Zdnyn04NdqSrC5XlD0Mj9NWJmdG92YL6yF
   Qk+AQ0ZqLR6VOoBpXh6bfbxSlB3ZtAFkDP+TbmdDQxBLRgvWUwXjsRCSD
   A==;
X-CSE-ConnectionGUID: OlIexx8dQT+v2FaURwfFTw==
X-CSE-MsgGUID: UqnR0gcwQiqxv+ewqXS9CQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="90550536"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="90550536"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 02:55:39 -0700
X-CSE-ConnectionGUID: r3/UJ8lVSW2UUbuzQl7JVQ==
X-CSE-MsgGUID: xMKYacZ9RRu8XhZ9HaBnTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="240750114"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.116])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 02:55:36 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 7 May 2026 12:55:33 +0300 (EEST)
To: Thorsten Leemhuis <regressions@leemhuis.info>
cc: Krishna Chomal <krishna.chomal108@gmail.com>, 
    yue li <mc.root.ly@gmail.com>, 
    Linux kernel regressions list <regressions@lists.linux.dev>
Subject: Re: [REGRESSION] hp-wmi fails to probe on HP OMEN (board 8D41)
In-Reply-To: <553a4232-f4cb-4d67-bdee-067b5f038f64@leemhuis.info>
Message-ID: <6d97e48a-be18-b99f-f4d5-aae50220ac53@linux.intel.com>
References: <CABd86uaQY9-ZSU-_PHKtZZyWnDFHLEsuaM+NBV5nOLWA+YSX7A@mail.gmail.com> <afb0f9gaS5z_SmRX@archlinux> <38bef028-d574-4e7a-b857-f10ab6796833@leemhuis.info> <553a4232-f4cb-4d67-bdee-067b5f038f64@leemhuis.info>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-669493635-1778144530=:983"
Content-ID: <d0ced2e4-0c93-4579-2a29-03e841bd8735@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-669493635-1778144530=:983
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <92321a94-52c6-e7f3-836a-a8c47cd9654c@linux.intel.com>

On Thu, 7 May 2026, Thorsten Leemhuis wrote:

> [+Ilpo]
>=20
> On 5/4/26 09:22, Thorsten Leemhuis wrote:
> > On 5/3/26 09:26, Krishna Chomal wrote:
> >> On Thu, Apr 30, 2026 at 12:59:58PM +0800, yue li wrote:
> >>> [...]
> >>> Regression:
> >>> The hp-wmi driver works correctly on kernel 6.18.6-zen1-1-zen,
> >>> but fails to probe on 7.0.2-zen1-1-zen with error -22.
> >>>
> >>> Issue:
> >>> On the affected kernel, loading the module fails:
> >> [...]
> >> Thanks for reporting. This is a known issue [1]. There are 2 failures =
in
> >> your dmesg output:
> >> 1. Unknown EC layout: The fix for this has been sent recently.
> >> =A0=A0 Currently, it is in the review-ilpo-fixes branch [2].
>=20
> It[1] afaics is sitting there for a week already afaics.

Hi,

I'm sorry to be a disappointment here, but I don't find a week a=20
particularly long time.

First, a patch sits in the review-ilpo-fixes branch (think of it as a=20
staging branch) until LKP builds it to avoid totally breaking anyone's=20
next builds if prematurely advancing anything to the fixes branch. My=20
feel is LKP hasn't been particularly swift recently.

As not many will have a look on patches in review-ilpo-fixes, it will have=
=20
to sit some more in the fixes branch to be exposed to wider scale of=20
testing and checking before doing PR. It takes one day for getting it=20
included into linux-next in the first place. Then the remaining question=20
is, how many days you expect Dan (or others) to need to do his checker=20
runs and come up with a problem report or correction patch.

I don't see how I could make the time much shorter than a week without=20
effectively bypassing some of the quality control steps. But perhaps you=20
have some suggestions how we can make Dan work even faster than he already
does... :-)

Besides, the change you brought up is on my scale the least critical=20
change among the ones queued in the fixes branch. Without the other two,
I'd delay making the PR so it would be sitting there yet another week. ;-)

> Wondering if it
> might be worth resubmitting the patch with a Fixes tag as well as a
> Link/Closes tag pointing to this thread to make the "this is fixing a
> regression" aspect obvious to ensure the fix is merged this cycle?
> Adding a stable tag would be great, too.

I'm not sure what to add and where, wasn't the fan table fix already=20
merged earlier? And it had Fixes tag.

This ec layout thing, on the other hand, doesn't seem that critical or=20
even a serious issue. We cannot really "fix" it anyway without platform=20
providing us the current profile information so it's all about silencing=20
the warning which is hardly worth all this fuzz, IMO.


With all this being said, I still do appreciate the work you do, my=20
intention is to not antagonize regression tracking you do in any way.

--=20
 i.

> Ciao, Thorsten
>=20
> [1]
> https://lore.kernel.org/all/20260429180953.129885-1-krishna.chomal108@gma=
il.com/
>=20
> >> 2. Probe failed: This is due to a failure in parsing the fan table. Th=
e
> >> =A0=A0 fix for this has been merged into 7.1-rc1 [3].
> >>
> >> Using kernel 7.1 (or applying the above mentioned 2 patch manually to
> >> your current build) should restore full support for your device.
> >=20
> > You you then maybe be so kind and submit backports to the 7.0.y stable
> > series to prevent more people from running into this?
>=20
> Side note: s/You you/Could you/ #uhhps #sorry
>=20
> >> [1] https://lore.kernel.org/platform-driver-x86/4ae4d7f9-f1db-4394-b0d=
9-
> >> c75dc39afcf8@gmail.com
> >> [2] https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-
> >> drivers-x86.git/commit/?h=3Dreview-ilpo-
> >> fixes&id=3Dc2d4b76458c9ebf81eae2916970320f1f61ad002
> >> [3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git=
/
> >> commit/drivers/platform/x86/hp/hp-wmi.c?h=3Dv7.1-
> >> rc1&id=3D9d317a54e46d3b6420567dc5b63e9d7ff5c064a3
> >=20
> >=20
>=20
--8323328-669493635-1778144530=:983--

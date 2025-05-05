Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8064C62
	for <regressions@lists.linux.dev>; Mon,  5 May 2025 10:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746442414; cv=none; b=BXkEDg7ER0n2BEBKV7VtU2zgYcNhTD1SqJ4Jy+sqiggy6lx248xdVRN6OR2RTiTEFeRFxYDd/XpzjqL6Rd05pLR+PmNbdb4kVipydsXYaonfO8wXI6gAmIBhAJul4+v/Df7ayGjfzV0FAtATuk6qNwhGQSr+2wQhPG5TL6wR9j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746442414; c=relaxed/simple;
	bh=N7mgrqYQKGzNDO35iLT+P3KVR96WDlyoRG4PtpOwF+s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Sne7LRFP5hifyLvoP0auQB63dISaxGcp098+9pxn2+svjya1tY0nH7QfVFvhUFWTGjFlGOPq4A+VoqnhLho7rNmwSLLssSAfaMu4lcyep2mVPWeD0gsleIpCPZ170QAOH/SHJ+AUUo3/z7V4IzkN0WL/rB97QSSrttBezfWZYDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mvfFX/M1; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mvfFX/M1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746442412; x=1777978412;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=N7mgrqYQKGzNDO35iLT+P3KVR96WDlyoRG4PtpOwF+s=;
  b=mvfFX/M118F2rrc3UrWZabqlWFyO6hscRxXrkamIDeGVa2k4R38sSR0a
   +hsiyr2DyuDTgxslw3QrRAeJOSeXQHUol43KK1N7+xa6oVcVauw+zq/8F
   wiDSdjiFmC4+LViyvtGxw9tjDGilLsfihsq5yb/otKt4VyeZ3fBkY7cKo
   ciO9ur7mUBSP6DIBJPJKhSF+Wl4MJi4fdQTjoucO/wrwTSqPMY+TFToRb
   UNFyA5/j9wnfnMM/FVnlCRrzBw2HIRKwUdplUqpdfRc6/cr/RKg3v148G
   P1rCFGKJW+aU2CzxlGHv/PLyfUjKOMw1a+x91r5i4YzkZIyB6P+sFEXkm
   Q==;
X-CSE-ConnectionGUID: 4JILUM09SUGEKbAdw0HvGg==
X-CSE-MsgGUID: uFCgA1b4RxqlMc41pKKCFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="59034747"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="59034747"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 03:53:32 -0700
X-CSE-ConnectionGUID: HXNZSRGHR5uBqroKljpNZw==
X-CSE-MsgGUID: inFkX1+LTKGZEArRIH0EwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="140378273"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.232])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 03:53:28 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, "Hall,
 Christopher S" <christopher.s.hall@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Keller,  Jacob E" <jacob.e.keller@intel.com>,
 "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>,
 "Saarinen, Jani" <jani.saarinen@intel.com>, "Kurmi, Suresh Kumar"
 <suresh.kumar.kurmi@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, regressions@lists.linux.dev, "Linux regression
 tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>
Subject: [REGRESSION] v6.15-rc3: 1a931c4f5e68 ("igc: add lock preventing
 multiple simultaneous PTM transactions")
In-Reply-To: <SJ1PR11MB6129BBB9E38F6DB731604E94B9812@SJ1PR11MB6129.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <SJ1PR11MB6129BBB9E38F6DB731604E94B9812@SJ1PR11MB6129.namprd11.prod.outlook.com>
Date: Mon, 05 May 2025 13:53:24 +0300
Message-ID: <87cycnwcpn.fsf@intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, 28 Apr 2025, "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.=
com> wrote:
> Hello Christopher,
>
> This mail is regarding a regression we are seeing in our CI runs[1] on dr=
m-tip[2] repository.

The regressing commit is in v6.15-rc3. Updated subject and Cc'd
regression tracking.

BR,
Jani.


>
> `````````````````````````````````````````````````````````````````````````=
````````
> <4>[    7.891028] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> <4>[    7.891293] [ BUG: Invalid wait context ]
> <4>[    7.891526] 6.15.0-rc3-CI_DRM_16443-gdc80d6a10c1c+ #1 Tainted: G   =
     W=20=20=20=20=20=20=20=20=20=20
> <4>[    7.891792] -----------------------------
> <4>[    7.892070] (udev-worker)/286 is trying to lock:
> <4>[    7.892349] ffff88811671bcc8 (&adapter->ptm_lock){....}-{3:3}, at: =
igc_ptp_reset+0x155/0x320 [igc]
> <4>[    7.892660] other info that might help us debug this:
> <4>[    7.892943] context-{4:4}
> <4>[    7.893226] 2 locks held by (udev-worker)/286:
> <4>[    7.893515]  #0: ffff888103bd41b0 (&dev->mutex){....}-{3:3}, at: __=
driver_attach+0x104/0x220
> <4>[    7.893823]  #1: ffff88811671bb70 (&adapter->tmreg_lock){....}-{2:2=
}, at: igc_ptp_reset+0x53/0x320 [igc]
> <4>[    7.894134] stack backtrace:
> <4>[    7.894439] CPU: 2 UID: 0 PID: 286 Comm: (udev-worker) Tainted: G  =
      W           6.15.0-rc3-CI_DRM_16443-gdc80d6a10c1c+ #1 PREEMPT(volunta=
ry)=20
> <4>[    7.894442] Tainted: [W]=3DWARN
> <4>[    7.894443] Hardware name: Intel(R) Client Systems NUC11TNHi3/NUC11=
TNBi3, BIOS TNTGL357.0067.2022.0718.1742 07/18/2022
> `````````````````````````````````````````````````````````````````````````=
````````
> Detailed log can be found in [3].
>
> After bisecting the tree, the following patch [4] seems to be the first "=
bad"
> commit
>
> `````````````````````````````````````````````````````````````````````````=
````````````````````````````````
> commit 1a931c4f5e6862e61a4b130cb76b422e1415f644
> Author: Christopher S M Hall mailto:christopher.s.hall@intel.com
> Date:=C2=A0=C2=A0 Tue Apr 1 16:35:34 2025 -0700
>
> =C2=A0=C2=A0=C2=A0 igc: add lock preventing multiple simultaneous PTM tra=
nsactions
> `````````````````````````````````````````````````````````````````````````=
````````````````````````````````
>
> We also verified that if we revert the patch the issue is not seen.
>
> Could you please check why the patch causes this regression and provide a=
 fix if necessary?
>
> Thank you.
>
> Regards
>
> Chaitanya
>
> [1] https://intel-gfx-ci.01.org/tree/drm-tip/shard-tglu.html
> [2] https://cgit.freedesktop.org/drm-tip/tree/
> [3] https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_16443/fi-tgl-1115g4/b=
oot0.txt
> [4] https://cgit.freedesktop.org/drm-tip/commit/?id=3D1a931c4f5e6862e61a4=
b130cb76b422e1415f644
>

--=20
Jani Nikula, Intel

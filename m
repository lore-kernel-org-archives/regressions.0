Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581C737FF6D
	for <regressions@lists.linux.dev>; Sun, 13 Sep 2026 12:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789304396; cv=none; b=FoKOtR0xvGB8bO4kel/yyQkrCJdfp0YYAhL0ioceV+osOv2w7CFqENybYK/pH0m+1WawrPmeeQK6R0LgmZYMuPvjt8Hdx60mjoVYRBcbQKWaJpZJg3IisQhpR1QpRlPUAFEAG29z5SJD0pHw6HFKYNJ5+oNyWJgHcGzGfB9BN54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789304396; c=relaxed/simple;
	bh=qnpM4ruKnqlJnYFFFBMw2wRcmLZYoPHRf16saVkviT4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZQr3Xqz2mf15lCpBUd5T0KliWbJsRD48ByC4Br9SQSslv0aDEsSSvE8bVotE7vQ5WE2TYZxbK40vJ1vbrBPzT4ggW0pwKgX2uEuR5IBYJRd5CixDWV/+cYP5l+pisj0IdeA0SUdV4hcfRbNkszAJ8HBt8s8n/0Y3QZvLqcRevhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZgBhs7wa; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZgBhs7wa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789304395; x=1820840395;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qnpM4ruKnqlJnYFFFBMw2wRcmLZYoPHRf16saVkviT4=;
  b=ZgBhs7wakh77ouHcG2G18ZGizJRi8s/KFtyhYjm6F3eU2Jx+U8cFR49Q
   Vqbi06q+gP7hstXdky9VuzMrAM5G35KcJNW7t6wqAdVP9NB5QdULdXAXK
   aEqq8Q7hckybM6gBf6EwMrC86xbEkhv97mNnc8I4SS4jF712Cc18sXP1p
   sFFDnnGPswMbe742Gj3d2Tl18mMkn9xGGniQGoMN4htirmhRa6eT8N+MU
   e1FX9eGuTDU6DxeLRpy3eQy0Sbe1l+fzNm4ts/JMsP68dYSNyabpIxAZ5
   RNYVJJd/A9Ak7dia/sZfk2f0mm9XT1htmc+UH86fTZHNFB6t/IkVxvzIo
   w==;
X-CSE-ConnectionGUID: 7+m3h8OTSl+0HiPl29pTOw==
X-CSE-MsgGUID: MgXTaoEjSjSrIeVmra2ZTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11903"; a="89702074"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="89702074"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 05:59:55 -0700
X-CSE-ConnectionGUID: Gf3NMJ4rRBu4CiyrbrEZCg==
X-CSE-MsgGUID: 16rsok3mSOmqdjQJkvBE0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="272369460"
Received: from junjie-desk-dev.bj.intel.com ([10.238.152.71])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 05:59:52 -0700
From: Junjie Cao <junjie.cao@intel.com>
To: Manuel Knitza <manuel.knitza@googlemail.com>
Cc: Sergey Zagursky <gvozdoder@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Miguel Vadillo <miguel.vadillo@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Thorsten Leemhuis <regressions@leemhuis.info>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	linux-media@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: [PATCH v3] media: ipu-bridge: do not use the CVS device lookup for IVSC
Date: Sun, 13 Sep 2026 20:59:44 +0800
Message-ID: <20260913125944.588731-1-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260913093749.584191-1-junjie.cao@intel.com>
References: <20260913093749.584191-1-junjie.cao@intel.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, 13 Sep 2026 17:37:49 +0800, Junjie Cao wrote:
> Its module is also called intel_cvs. A vision-drivers DKMS build
> installs under updates/, which depmod searches before kernel/, so a
> CONFIG_VIDEO_INTEL_CVS=m kernel still binds the vendor module.

Arch's kernel is not such a kernel. config.x86_64 of linux
7.2.4.arch1 has I2C, ACPI, VIDEO_DEV=m, IPU_BRIDGE=m,
INTEL_VSC=m, VIDEO_INTEL_IPU6=m and VIDEO_INTEL_IPU7=m, and no
VIDEO_INTEL_CVS line at all: the option sits in the
"Miscellaneous helper chips" menu, which
MEDIA_HIDE_ANCILLARY_SUBDRV hides on the default
MEDIA_SUBDRV_AUTOSELECT=y without EXPERT, and nothing selects
or implies it. olddefconfig with that config on current
mainline writes no symbol; with EXPERT=y it shows up as
"is not set".

So on a stock Arch kernel, and per
https://github.com/omacom/omarchy/issues/10948 on linux-ptl,
the DKMS module is the only intel_cvs there is, and without it
nothing clears the sensor's _DEP on INTC10E1. Either way the
camera is gone on 7.2. Patch: "media: i2c: cvs: Do not hide
the option in the ancillary menu", sent separately; with it
that config gets intel_cvs=m on the next olddefconfig.

For the DA16260: apply the patch, or set EXPERT=y so the
option is visible, then build 7.2.x with
CONFIG_VIDEO_INTEL_CVS=m, uninstall the vision-drivers DKMS
module for that kernel, boot. Without one of the two
olddefconfig drops the =m again. The spk-id check from my
previous mail applies once the in-tree driver binds.

Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D090E46EF75
	for <regressions@lists.linux.dev>; Wed, 23 Sep 2026 21:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790198108; cv=none; b=UI6oXSEcKmal4RyhoXjlDiJ+LIy96SmwbDNRMK2BX8ZLncaraC7E3p2AHg29BtMJR/UwWY+8TxhsJU3aejhny8mK5z3TcmDeuenaeU2mfK4QXxo33QzEZtDtPhI6ihyOJ5snRKXAvZFAN1so8NL76q59VsJytrhIa+OuS0WQvhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790198108; c=relaxed/simple;
	bh=/bMnIwV9D+4P5fFt2ddL/c1m1MS6UgDFjxX3GAe3zTs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IEr+k68EQvYR2maQ4pm6dDMBTR5KhJ/a+UWv3NLAWcVF/8uPpYyHlkgTY3lftgOy+XUVsJJb/zmlMm8E0N+y+LB9xAbccLNaRTBHV6hOrlaYvNXZMbu9PXOo4DVSYUX6sb6Y71TkCLZBlG+T46qwxp/LxOWDRI0GQKG93vlYQr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PubJu8T1; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PubJu8T1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790198100; x=1821734100;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/bMnIwV9D+4P5fFt2ddL/c1m1MS6UgDFjxX3GAe3zTs=;
  b=PubJu8T1hXSjUGd0tBpBtHqGjFpulERXFzD2YI7jbXbjwJcHGTkFAeGq
   Tv9lDlrVIVC0QFktbAhk7wjXnAfF1c/roNkzOF3uJHaefzpDld9o1nZxm
   9sp33CNkMFW/XyUQexz+eyW2I/btY/LR2ZmbQwjKjFWu3s1I5qq9wM+sd
   AMWcY6WLHpq7gm1iobYdFED35AujcLoBlN9acja2GpV2KlqqacZ8yrrhI
   OMXTMi8kfbIsKIQ8PwqsCRR8EXqUlq6GER7+BkP+JgYJiUcAFj8E2I7Va
   FT33jah+QbEEbUeUKEcRc25tggixoNKsizatDpHBhZIDke/TL0EYptfPO
   g==;
X-CSE-ConnectionGUID: Ou/zoNHYSe+z7Zz8gNIunA==
X-CSE-MsgGUID: s3WKadsERZaSTJQoTxaKDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90806506"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="90806506"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 14:14:54 -0700
X-CSE-ConnectionGUID: x7nTLt1jRkatvU9X58UZYQ==
X-CSE-MsgGUID: 5u9pxeDVRHuOWSzBL03VgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="273965632"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.83])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 14:14:53 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id DA32D11F9B7;
	Thu, 24 Sep 2026 00:14:51 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x9UIj-00000003nDM-44HQ;
	Thu, 24 Sep 2026 00:14:49 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: linux-media@vger.kernel.org
Cc: Thorsten Leemhuis <regressions@leemhuis.info>,
	Junjie Cao <junjie.cao@intel.com>,
	Miguel Vadillo <miguel.vadillo@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Manuel Knitza <manuel.knitza@googlemail.com>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	regressions@lists.linux.dev
Subject: [PATCH v2 1/1] media: cvs: Default selection to VIDEO_INTEL_IPU6
Date: Thu, 24 Sep 2026 00:14:49 +0300
Message-ID: <20260923211449.904157-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cvs driver is only usable with the Intel ipu6 driver (as well as the
ipu7 staging driver, as long as it exists in the staging tree) and is
commonly required for the ipu6 (or ipu7 staging) driver to function. Make
the default of the cvs driver the same as what was selected for the ipu6
driver.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Antti Laakso <antti.laakso@linux.intel.com>
---
 drivers/media/i2c/cvs/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/cvs/Kconfig b/drivers/media/i2c/cvs/Kconfig
index 4309d20dd726..f482f1ccc38a 100644
--- a/drivers/media/i2c/cvs/Kconfig
+++ b/drivers/media/i2c/cvs/Kconfig
@@ -4,6 +4,7 @@ config VIDEO_INTEL_CVS
 	tristate "Intel CVS CSI-2 bridge support"
 	depends on I2C && ACPI && VIDEO_DEV
 	depends on IPU_BRIDGE || !IPU_BRIDGE
+	default VIDEO_INTEL_IPU6
 	select MEDIA_CONTROLLER
 	select VIDEO_V4L2_SUBDEV_API
 	select V4L2_FWNODE

base-commit: 8fef4162ebd9936f540f026edb76ec120cd6ffde
-- 
2.47.3


Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6E33C1F4F
	for <regressions@lists.linux.dev>; Tue, 22 Sep 2026 06:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790059226; cv=none; b=t/QtD/0Aa7frjvnsjIVzD4vMx7+CM9IQ4qLT9IoXFnob8ZyCmynESPi1RaUcqq/YAqoiYn16he8zGyXUFS8JjS9531RO36ViMMe6wg/BETf7Ecr91bZ4rGSSNjw1JyrQqz1wJ7Hw8c/hA7AvGUJzhgaDn/pdAtvsacBwcqNvJf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790059226; c=relaxed/simple;
	bh=ffrN1g+ysBk6rrIxBIrOJmHcef99zYr/h6hrDrTA/a8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eQXXRu0TKZU6VFW/YNiS9mtczjL6HN8YLAH6YDRkugXM/Wy4uiCZpy7QtxIg5Mgh90zDm78OyuzyT9iWoSFXjTzBWfadw6poVkeIbU8sdOVii8IMdTi4IMV4RWtxYc/A+yYxzwL2yIeBuNMcEH2sf0BoX9LvNyjy8r9GElxWimA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FbBtqsMJ; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FbBtqsMJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790059225; x=1821595225;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ffrN1g+ysBk6rrIxBIrOJmHcef99zYr/h6hrDrTA/a8=;
  b=FbBtqsMJUFhuPWehhhFrp5uwJSAtPlFhNPI+3lHF3FCK3n9pp73ktTMl
   ohNuvNiD8HTBe/Vooc2gTi2tDUS/5K68E5pbtLBBYVz883VWD8eNZ8lBy
   VdxzT0wy5SPM88k1FzneZzn9HslT2S2MsE2mxvnfOldG0y6a9/qqLzjgV
   Eg0Qf1/IAcQeKlO84t/VmvBQVqnWH3z5tthWroWHkefFWjvdLDDzuofBI
   jqRqsCNUdtwnSSza+IKjQg2pDUPnOL6HhfvtuLvhaold6YUKJA7m05rQG
   1b2SGgHhcWp0EVXd4lsX5fTKN28OmgGrBAN4YawN4wCw6ufD3KP60aMbP
   A==;
X-CSE-ConnectionGUID: 7whkApX3TFG+wUhxQjKMzA==
X-CSE-MsgGUID: VcIA/pO1R+K/K+X2oYGiGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="90499324"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="90499324"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 23:40:24 -0700
X-CSE-ConnectionGUID: VMAhOoEkRVq6I5gVKp0oVQ==
X-CSE-MsgGUID: hj6MyF9dQ82neTCZWUM88Q==
X-ExtLoop1: 1
Received: from carterle-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.41])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 23:40:22 -0700
Received: from punajuuri.localdomain (unknown [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id E7BE4121BA5;
	Tue, 22 Sep 2026 09:40:19 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.98.2)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1x8uAr-00000001YpS-3Syt;
	Tue, 22 Sep 2026 09:40:17 +0300
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
Subject: [PATCH 1/1] media: cvs: Default selection to VIDEO_INTEL_IPU6
Date: Tue, 22 Sep 2026 09:40:17 +0300
Message-ID: <20260922064017.371437-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cvs driver is only usable with the Intel ipu6 driver and is commonly
required for the ipu6 driver to function. Make the default of the cvs
driver the same as what was selected for the ipu6 driver.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
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

base-commit: 508a3559448684c4c0110a0c1614deaface399c4
-- 
2.47.3


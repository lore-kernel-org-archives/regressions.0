Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4415367F59
	for <regressions@lists.linux.dev>; Sun, 13 Sep 2026 09:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789292283; cv=none; b=edxg/T+afjWj4pyHP5XJAZGhFdSJzqXYfVrYkG5i5MjTEOp+52kDGc2lm19qFJo/1OdTykjWV8+Z7E2XvSl8Ifjkoc+clS0gz3EsUmWsJv8QnJJSN9vxS6KryT59meLzUk3uxa4tuDyP+6YUwuasBoxEpr8G5R1iFivIiByEfJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789292283; c=relaxed/simple;
	bh=T/rAhOjt18aMA9s+5xkJ7Cs5xaj1ajpWSTdsJF0gngI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tyVWszSI3QnIa1oyxqi1LKZJjaq2SzpQa35q5OTSUUS92BQITM15xs8Hnnqj1BNXTlkU/tZrsN/ebd/oSgweQUfHm30tZ8c2QGQcUFh866X9k4oS+btmfCMvs2ak/YcXilznCCgf9ehxuAMbQ6bh123Opwy9mFNnBWySZ5JnhBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ceO1/Lar; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ceO1/Lar"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789292280; x=1820828280;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=T/rAhOjt18aMA9s+5xkJ7Cs5xaj1ajpWSTdsJF0gngI=;
  b=ceO1/LardPGKKjjKs0o4YhfS2uaqYziEfGQpx+koay1ORRRyGGfjg+7H
   6Rpka/XsxON7pTq+cDINgw0gE/OxplaWp3hB+1NmXad7msy8xAoQSidRr
   IwRXOwmHyzwnnCIeko3EW2KUzgDyGpq8vYehGubQlpdQtuPTcGQGbavm3
   p+J9limqn2v03DUJ8PZahEjASQPe+8yIwNQVzBgB8xx7qMfOn3n8lfxPB
   /a2p3fTij8Q/LM4sFm+4ej+ZuLdOeY4pxiV8oODlc5xhAdynCpu2AJmAM
   0XtWe+7L7TNmBrrdDEYLx3iBxTF4CTqifvQN2kuOWbFXePlNz5bkJC7vf
   Q==;
X-CSE-ConnectionGUID: g3IcOXVCTyyd+s34xxdAvQ==
X-CSE-MsgGUID: Y0rT21h6SKmuvx+941ERug==
X-IronPort-AV: E=McAfee;i="6800,10657,11903"; a="89698044"
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="89698044"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 02:37:59 -0700
X-CSE-ConnectionGUID: XaxBlnTcTS+C6XdqrGC24w==
X-CSE-MsgGUID: qrlloJM3TcKm0cpRZD8kLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,100,1787036400"; 
   d="scan'208";a="310636177"
Received: from junjie-desk-dev.bj.intel.com ([10.238.152.71])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2026 02:37:56 -0700
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
Date: Sun, 13 Sep 2026 17:37:49 +0800
Message-ID: <20260913093749.584191-1-junjie.cao@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260912185836.309071-1-manuel.knitza@googlemail.com>
References: <20260912185836.309071-1-manuel.knitza@googlemail.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 12 Sep 2026 20:58:32 +0200, Manuel Knitza wrote:
> On this machine the driver on that i2c device is Intel's out-of-tree
> intel_cvs (from intel/vision-drivers), and it provides only ownership
> arbitration and firmware update - no CSI-2 subdevice.
[...]
> There is no in-tree CVS driver to take that role.

There is, since v7.2: drivers/media/i2c/cvs/, CONFIG_VIDEO_INTEL_CVS,
8e2b43d2c10b ("media: i2c: cvs: Add driver of Intel Computer Vision
Sensing Controller(CVS)"). It matches INTC10DE/E0/E1/FA, registers an
"Intel CVS" MEDIA_ENT_F_VID_IF_BRIDGE subdev with sink and source
pads, parses the port 0/1 endpoints ipu-bridge puts on the CVS node
and binds the sensor through an async notifier (v4l2.c,
cvs_csi_parse_firmware()), then calls acpi_dev_clear_dependencies()
at the end of probe (core.c). That is the device c6b1b34b5090 and
c28527ce5d06 are written against.

Its module is also called intel_cvs. A vision-drivers DKMS build
installs under updates/, which depmod searches before kernel/, so a
CONFIG_VIDEO_INTEL_CVS=m kernel still binds the vendor module.
modinfo -F filename intel_cvs shows which one you have; with the DKMS
package removed the graph ends at a device that registers the
endpoint. Not tested on a DA16260 here.

> Gating on a bound driver would also cover the ACPI half of the same
> conversion, c28527ce5d06, where a dependency on an unclaimed supplier
> blocks enumeration outright - kernel bugzilla 221988.

With the in-tree driver built, both gates pass. Kernels that carry
the 7.2 bridge without CONFIG_VIDEO_INTEL_CVS are the bugzilla 221988
case; Fedora has it enabled since 7.1.13-200. Whether the CVS entries
in acpi_honor_dep_ids[] and ivsc_acpi_ids[] should sit under
IS_ENABLED(CONFIG_VIDEO_INTEL_CVS) instead is Sakari's and Rafael's
call.

One more check on the DA16260 while intel_cvs is bound: the in-tree
driver requests its wake GPIO, and on the XPS 14 DA14260 that line is
the CS35L57 amplifiers' speaker-ID input, so all four amps fail probe
with -EBUSY and the machine has no sound (three Fedora reports,
https://bugzilla.redhat.com/show_bug.cgi?id=2529031). If
dmesg | grep spk-id shows the same on the XPS 16, the fix is

  https://lore.kernel.org/r/20260908105717.496232-1-junjie.cao@intel.com

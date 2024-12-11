Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FEF9239BCB
	for <regressions@lists.linux.dev>; Wed, 11 Dec 2024 11:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733915368; cv=none; b=GJc2XOPZld0S3cC5p7hHX/OiKLKyiHgxufj23kCW7aVEivWF6YVHmdzokLeOiXd+7Z8atQiRlRSpWA6WqHYYGXEZQ8U3axRmSDyngZ1OOx3c+Y9rMHLqqSR8vaS6GNO4AVOAJtgBPxiLoV699AAQXtOBxymy7fB45aS/bP37Jac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733915368; c=relaxed/simple;
	bh=v46rUQEdI1iE135dLQq98DPBSTcP/lkEL217FYimgpg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=SDYfkIzb5ClY3Qd16PQ6yUkgzdMGDbkGSV8gd3QGHYvgG0HvO+akr03+2JOZmJTDv7rVZkJn1af+U1IVMpB2Zxa0GLUlJNpjrCx0SBG7Q5oqmPAQD/ajX3TQAShaCghapm6jlLbi8Ssv/R2wauokyTxYaGBQgUOnGTCIZPml+OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ha3GvAY7; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ha3GvAY7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733915365; x=1765451365;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=v46rUQEdI1iE135dLQq98DPBSTcP/lkEL217FYimgpg=;
  b=ha3GvAY7auj+ztmt13pp4GNTVydnudWEET9xCnCN/MO+cejTIHZ6cPFD
   O22Yl72iMaotvrd8vMipT3Nh4aiUynh27GyK3/zLb8mYoG2qpXb1bPORA
   +AoeYXl9XxyTY5xVD2mq10jyV//abKY4SNcWbrcUx5SszV0jxjviBxASl
   Oka6fJYFQpV+skodp4rHs4J6btZ7LicwkOXUbsZTRsKCFR2nogDlL5Tyf
   lQXfJypGra+8Er5+V3ZrEpnLm8P0z/yKWcKfGpPGgO0Kv9H+DI5pyhS5x
   ZSaJC8Kr14tMWBTXaFgE1P5meGxWnBg4gsFEYxCrG6Op8HleeXAbYF1BM
   Q==;
X-CSE-ConnectionGUID: DoK9Fw2kTZ6qkpO4zyGvWw==
X-CSE-MsgGUID: PiTmrexPQ86H2JNq1svnCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="59682786"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; 
   d="scan'208";a="59682786"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 03:09:25 -0800
X-CSE-ConnectionGUID: KeaUiMHVRwylzmxf73VecA==
X-CSE-MsgGUID: sRjwMQwPTCaNBSU1ruw3XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="133146993"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa001.jf.intel.com with ESMTP; 11 Dec 2024 03:09:22 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Mark Brown <broonie@kernel.org>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 0/1] Backport a fix for broken avs audio
Date: Wed, 11 Dec 2024 12:10:09 +0100
Message-Id: <20241211111011.3560836-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Patch fixing the broken audio issue for avs apparently didn't make it
into v6.12 stable tree and playing audio results in NULL pointer
dereference.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=219577

Backport a fix.

Amadeusz Sławiński (1):
  ASoC: Intel: avs: Fix return status of avs_pcm_hw_constraints_init()

 sound/soc/intel/avs/pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.34.1


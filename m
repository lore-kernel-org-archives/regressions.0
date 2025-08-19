Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8CC33CE99
	for <regressions@lists.linux.dev>; Tue, 19 Aug 2025 12:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755608347; cv=none; b=fxdF7PzqJCkdBpB9RnPXCbEq6MKPcxdBnN3nnbwP/PutJv/CFJHDT/jD4nEExDULQUcqeKHPHnMw/Y+tf/736L4QGSHsUTGLJypp1UI999jTHKUdjPRj1z/ZvkWHZ56Xv+qq9Cn9EscCea71t4FPcoQ1WyNaT2b2MikcIyM4Qdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755608347; c=relaxed/simple;
	bh=RgIXVXwDJAT/2b3yWBkq8rraJsGrCQVZtTJ9NJbLsrY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qpZ+AfjZjB73taExfFaACwGEK3AMltjh0QspV9wR6Ey6VNhmtW7hH3+RzpsZxcHXebpouN+pzRQ6dcPPzwRBTgA5CvMaQDE2dlU+KQZ2Yw+QSQ4v/S7JM4kgBcjB8BjJZ3LOyKJhM2Il9/c2sRB52lvIRf5pN05FaSuiPSre0lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dgk/EmpD; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dgk/EmpD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755608345; x=1787144345;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=RgIXVXwDJAT/2b3yWBkq8rraJsGrCQVZtTJ9NJbLsrY=;
  b=Dgk/EmpDplxATQO5dyAEXG3QYWqd7nrWInlsE5hX/pEmhg4fb/8UOZk1
   0m5EkqNdQjbrS59zq6rXojkF0v9ssZLRACiyQC6XaNVO0IMB/kPQG28dx
   DpvW0yP8fpQc97nH+mFPCoBjl9ixb3hvlzBUx+CtkomsVyyljsiEMdkFY
   OiO2/B6ARGFYpT8V3v62VBOdSxiECdINlBPX1g2XX9T6M73uv6Da1hPJ8
   Crw31bjSK+htOoyXky8WwS+B14dfLzcMmj1McI9UysGJpqXnSCB4bedQt
   1fmaLh9o5KBDuwugJ69noxjMW20t2hZjfcPihc89bpH60Z+bzH5RwUB7q
   w==;
X-CSE-ConnectionGUID: 2rdBIFLQR12exdO/Mirr7g==
X-CSE-MsgGUID: j8ErU4luSWyv1XAT9W+ALA==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="75423021"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="75423021"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2025 05:58:55 -0700
X-CSE-ConnectionGUID: 9qXJH9p6SqirCaX0m54zFA==
X-CSE-MsgGUID: E/q2JG4eTgu3itbAATpMCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="168194845"
Received: from mnyman-desk.fi.intel.com ([10.237.72.199])
  by fmviesa008.fm.intel.com with ESMTP; 19 Aug 2025 05:58:53 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: <gregkh@linuxfoundation.org>
Cc: <linux-usb@vger.kernel.org>,
	christian@heusel.eu,
	michal.pecio@gmail.com,
	niklas.neronin@linux.intel.com,
	regressions@lists.linux.dev,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [PATCH 0/2] xhci fixes for usb-linus
Date: Tue, 19 Aug 2025 15:58:42 +0300
Message-ID: <20250819125844.2042452-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg

Two fixes for usb-linus, one of them solving the 6.16 regression reported
by Michal and Arch Linux users regarding xHCI host not responding after
suspend and resume

Thanks
Mathias

Niklas Neronin (1):
  usb: xhci: fix host not responding after suspend and resume

Weitao Wang (1):
  usb: xhci: Fix slot_id resource race conflict

 drivers/usb/host/xhci-hub.c  |  3 +--
 drivers/usb/host/xhci-mem.c  | 22 +++++++++++-----------
 drivers/usb/host/xhci-ring.c |  9 +++++++--
 drivers/usb/host/xhci.c      | 23 ++++++++++++++++-------
 drivers/usb/host/xhci.h      |  3 ++-
 5 files changed, 37 insertions(+), 23 deletions(-)

-- 
2.43.0


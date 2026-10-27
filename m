Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793128920;
	b=nPJVfCSxTMQxvahbpFN/jULRTnfwl3A3jjr4o4qYH9IM62xuoq6G+TtMrgpGBobPLlwC
	 4TY3usWYf3ZsH33ChtNv1r5qMmkjsJrBOrtIMfUooC7AsIh8oeA98oAHOwXOH45u7gdVF
	 pjVQ2l7gzEZFkfiq7I5zw8IOYjX6gyKIT6sgP6K1hfEJ+oEPQGPE2t8PrvG7ObHWZ9hKr
	 QSIIepd0m+yaVDYxv3acAsKgLLZ1HlASghapvDta2sFHdX6yA7kBxm6EUCt1tgyMw0BRu
	 kyVcYthSxTAEI447mX+W1DaLgmwdmdO4RmZsuKOyiJkiVTK0NMNbE+dfXUJLJk7gd2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793128920;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/gQcf+jw8GIurwSk/Qo8Eoe4Jx6fP0xzW30Vqarn+bQ=;
	b=P4FNsV4H+DXJcNtTaVN5girlU2BSyJrs0NFLwGRW1Ztp7JZlT+DwvTuI84ctHXPCDbXo
	 K3RFk0I57UAwV/2l6Dmj1Vmpg+CpxCS304C4WRRSlDxYwiPTj7tY3dLMGJRJl80TINosl
	 cZq559JRbU/5nBlSur/Y/QOpRBoxSnkRmjab37pLiu4o3wL1vnMtU6SWUsEhHtS+TlMx0
	 OzIO5YgqxJEUmYYTXoPW7gHyzu7v4GaBsfUCgpkD2Bd+8d4/3Xg5+cVfQiVqdOKW50yx8
	 mxAJ0BqI9wdGInlEixV6rlvluLMfVnPfN+LWK5nyK2H2AC622RZB4rhOSow9oFNFEMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XxCYX3Ux;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6992A606A31F
	for <regressions@lists.linux.dev>; Tue, 27 Oct 2026 19:21:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6992A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XxCYX3Ux
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793128920; x=1824664920;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+kQPwHL2nncxW++ZI9loXuFFiUWkxlO2cfQUt8m9DHo=;
  b=XxCYX3Uxd+slgJauZFtGtICoH8pxosjHVh6YIyAlrCxZdoOYqrN5OBCT
   bWd4NiglSBbHnEW3OnwiG9c6G8NfSoTTYk/bU8x4aB5hwVw1oN4UQAkh8
   end+kDeUK6GWwe6kq03+/M4vKlq7ObJN5H52xCKjhRC3XFVO55U9nRIbr
   xe4KzCLPL2dlF1ct4AMe/uWGQjS9SFdU58xcLgQ/U6VEcm13uX0QSG83k
   9jCZU+whrrVYY/HSJ1dd/1wHkatO8wbAwKC3lu7yr107fPMKPHCOQmNK0
   szb3fRlDP2XCuzCMuk594wu5cZd26exWgPd0L6UyuyjxLrh5VprINDUbQ
   Q==;
X-CSE-ConnectionGUID: 4t8iXBpXRo2d9Arq6NRhkA==
X-CSE-MsgGUID: Wvu30w9EQYOxZfXTZBYT7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1863749"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1863749"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 12:21:59 -0700
X-CSE-ConnectionGUID: N0y2KO/mREmx00t8rVjpDA==
X-CSE-MsgGUID: dydoNJIeS22R71QhBPEedA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="4579909"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO mnyman-desk.home) ([10.245.245.227])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 12:21:56 -0700
From: Mathias Nyman <mathias.nyman@linux.intel.com>
To: yiyu@yiyuzhou.io
Cc: <linux-usb@vger.kernel.org>,
	regressions@lists.linux.dev,
	diogochaves@me.com,
	michal.pecio@gmail.com,
	raoxu@uniontech.com,
	dennis@dsine.de,
	gregkh@linuxfoundation.org,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: [RFT PATCH 0/2] xhci: clean up endpoint rings after disconnect detect
Date: Tue, 27 Oct 2026 21:21:25 +0200
Message-ID: <20261027192128.386082-1-mathias.nyman@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027184117.2461065-1-yiyu@yiyuzhou.io>
References: <20261027184117.2461065-1-yiyu@yiyuzhou.io>
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Post: <mailto:regressions@lists.linux.dev>
List-Help: <mailto:regressions+help@lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
List-Owner: <mailto:regressions+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Yiyu Zhou wrote PATCH 1/2, fixing a regression in USB HID device
enumeration caused by the endpoint recovery prevention code added in
v7.3-rc1. Some HID devices that used to enumerate after a brief
disconnect during enumeration now got stuck until URBs timed out.

PATCH 1/2 gives back the pending URBs right away, which solves most of
the problem, but it leaves the TRBs of the given back URBs on the ep0
ring. ep0 survives a brief disconnect during a port reset, so the xHC
may later process those TRBs during an enumeration retry, writing into
buffers that were already given back, or ep0 stays halted and the next
control transfer times out.

PATCH 2/2 cleans up the ep0 ring by resetting ep0 and moving its
dequeue pointer past the cancelled TDs, even if a disconnect or link
error is detected. Only Reset Endpoint and Set TR Dequeue Pointer
commands are issued; ep0 is not restarted while the disconnect is
pending. The rapid endpoint reset, restart and stop sequence that made
some xHC hosts fail Stop Endpoint commands is still avoided. Other
endpoints are still given back without resetting them, but their TRBs
are turned into no-ops first.

If you have seen the HID enumeration issue, or the xHC Stop Endpoint
failures with rapid endpoint state changes, testing these two patches
would be greatly appreciated.

If these patches work, they might be squashed into one before going
upstream.

[This message, and PATCH 2/2 commit message were cleaed up by LLM,
Code is still 'organic'.]

Thanks
Mathias

Mathias Nyman (1):
  xhci: clean up ep0 ring after disconnect instead of leaving stale TRBs

Yiyu Zhou (1):
  xhci: give back all TDs when skipping endpoint reset after disconnect

 drivers/usb/host/xhci-ring.c | 71 ++++++++++++++++++++++++++++++------
 drivers/usb/host/xhci.c      | 13 ++++---
 2 files changed, 67 insertions(+), 17 deletions(-)

-- 
2.43.0


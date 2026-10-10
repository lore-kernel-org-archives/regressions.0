Received: from sender5-op-o15.zoho.com (sender5-op-o15.zoho.com [165.173.182.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A5E542AA9
	for <regressions@lists.linux.dev>; Sat, 10 Oct 2026 07:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791616739; cv=pass; b=jV8b/v+ZWxP6ufNhrYUdbvLJV7mGdU2GFK3xcOGflFY282IaV79u7TY4AmpDGeYJ8caCIDFH5fbREqf3tTYO91k7jpA4p1p0CSoxMGcNHtwpsBn/PVsbAZ8cssxBhfpmhaVoJXuOfCjNxftoz46uKe2iDFLITipX3uWnS0jE3bw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791616739; c=relaxed/simple;
	bh=qAYxJHoNHJkITegv/B665pWxcd74b1noLZ2nKAjT7J4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YIV0XUZs5/MQl5W47yeWmnahdGAgJChwTV3mcml0FzMrEJcoxBUnRc3Da/9Z+e8z3QcAzafH0dOMx2YtBMv432QiezI4Ok8yKgEaUWHa36qlfDSH/WN/SJYDgS+hUMOmMFvT0KotVrB+7vB9/GXtS2PPmZbTMhGVZiPJZj7N6VY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yiyuzhou.io; spf=pass smtp.mailfrom=yiyuzhou.io; dkim=fail (0-bit key) header.d=yiyuzhou.io header.i=yiyu@yiyuzhou.io header.b=J5f8pbfE reason="key not found in DNS"; arc=pass smtp.client-ip=165.173.182.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yiyuzhou.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yiyuzhou.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=yiyuzhou.io header.i=yiyu@yiyuzhou.io header.b="J5f8pbfE"
ARC-Seal: i=1; a=rsa-sha256; t=1791616733; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TxgPa9B+hv35NqcFPn8udT5z8MqA4in9Mq7KsQICuLFS7Kr2aYDo0vrVJ7vbRM9hRymg7/OOJOSdDM7QpzROjKR51uoiCRF6kdtbFIvDWAjfOLaACFnA4LcAepuOjnI7tc9mIrOGXRhsKWmPezg3W28Etv9tJxoEpc1m80kKO+Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791616733; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=YKbZiLQtePaGvvY6MJw4YtcUObVh47GbkOMTA4dxO7M=; 
	b=ENQkxaA0K8shDmCQwbvrCAlmGZ5MnsGI/A5/ucaQxNbIYhv4NDOzsThCknyZ8J3VkxmhXo+ftYq+2yIE/5+MEU4Q9XqgskPobWyyaNvzmIjTqeThu35HBhM42bkpwGkY8Zl2XAgxHoYTz95qkkiAMxpV5mRPBMSL3a7IB7lZf0A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=yiyuzhou.io;
	spf=pass  smtp.mailfrom=yiyu@yiyuzhou.io;
	dmarc=pass header.from=<yiyu@yiyuzhou.io>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791616733;
	s=zmail; d=yiyuzhou.io; i=yiyu@yiyuzhou.io;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=YKbZiLQtePaGvvY6MJw4YtcUObVh47GbkOMTA4dxO7M=;
	b=J5f8pbfENS7mSY8ZXqjSltb1d21V3cZfNX7SwWIr06LXwIeoZSA35dbGll8MZOkU
	GYN9vmbFqgshT0pE8k4odxRgTCTUFajcXDfWoZTXLJ/Y75oJ6ijt5ug+CVPnXUxsOBL
	NDbdeLvmKBmIqKpvegbISW9xO7lexHOpsEptugHU=
Received: by smtp.zohomail.com with SMTPS id 179161673164423.24026925948715;
	Sat, 10 Oct 2026 00:18:51 -0700 (PDT)
From: Yiyu Zhou <yiyu@yiyuzhou.io>
To: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org
Cc: Yiyu Zhou <yiyu@yiyuzhou.io>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	michal.pecio@gmail.com,
	regressions@lists.linux.dev
Subject: Re: [PATCH] xhci: give back halted TD when skipping endpoint reset after disconnect
Date: Sat, 10 Oct 2026 00:17:39 -0700
Message-ID: <20261010071811.20483-1-yiyu@yiyuzhou.io>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010064407.11030-1-yiyu@yiyuzhou.io>
References: <20261010064407.11030-1-yiyu@yiyuzhou.io>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This fixes a regression introduced in v7.3-rc1.  Up to v7.2.1 the
keyboard recovered from the same hotplug in well under a second, and
reverting 042aad8d0db6 and 7e0ef4332ed9 on top of v7.3-rc5 also fixed
it.  It would be good to get this into 7.3.

#regzbot introduced: 042aad8d0db6

Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C59E468C26
	for <regressions@lists.linux.dev>; Mon, 19 Oct 2026 07:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792393693; cv=none; b=T++vUEOq61TdBzf6HcNpQghuJ1xJuvorkcUMOQzuotIc2m8ZXb2yntXbSvhxIAVytMK74ZAKIyCZpbKQArJEvM7kBqjVB27N3l3X3Cfi8BfCWWLif9kcMU4Y/0un2gOgcUQFWGUleABnxI8MbSKdw00JeD/+KWpe2ymDr4WeIeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792393693; c=relaxed/simple;
	bh=o74cR4B4kRVrvMcsBbq7xVsdzhSgPiadLoev9nNelqE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h6rzKmRUtHwmXWrZLmwUh12kVe5svfHB9oa11Nt227RE1/tOocSURfzMHOYg7TU7hURFDM6dpTAbcCTwkY0b7rm56aGNB4DhxV3Kl8D+KPTXAONjaFrn/IN7CC9Fx0aGkePzmAwI+k9ZKmaIJvuh0FsucSMysgIpxDB7KCjqVUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=DuHhr+h6; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="DuHhr+h6"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4j7RTG15Rkz8tdk
	for <regressions@lists.linux.dev>; Mon, 19 Oct 2026 09:08:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1792393682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o74cR4B4kRVrvMcsBbq7xVsdzhSgPiadLoev9nNelqE=;
	b=DuHhr+h6YZtQfZQ/XL9J1LB9O+FWhAEZ6/2bOnU8vc+EGRlLWMMMcEVYVT7pc/62zS9YkT
	+r7nWNCBAukp3qvdC+dvwgEr5rc1cQaz9nWY+hGwKstGJCrGJ+eez9Xuwr2edmtHBi4XLp
	nWCOh4avWJyr/N54lyFuIF4i1VwFuf4wfOBFOB1cPzsaslxP2ktdcXy4Gg18DxbQRZI22A
	S10rJ/LHr5Mex9BWRPZTXYBWOkeR3O3f2lzV+819g+q81wkugnGqEmybOOdRs9JSvjp75G
	bpcHWPHMcYCNz0VRk/jXQ34kufK6pIveXtIYH/qzzubIBPz708EzMcvdMFHK7Q==
From: Alexander Gruhlke <gruhlke@mailbox.org>
To: regressions@lists.linux.dev
Subject: Re: [PATCH 0/2] PCI: Wait after FLR for devices that don't honor Immediate Readiness
Date: Mon, 19 Oct 2026 09:08:01 +0200
Message-ID: <20261019070801.100689-1-gruhlke@mailbox.org>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010160529.27974-1-gruhlke@mailbox.org>
References: <20261010160529.27974-1-gruhlke@mailbox.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 9df434639dd16ac0fe6
X-MBO-RS-META: rnabdtsiqaxhifc5wfoiodbgggxa6t1r

Fixed in v7.3, but the commit doesn't link this report.

#regzbot fix: 0f8b5d90d179

Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680602F12C8
	for <regressions@lists.linux.dev>; Tue, 28 Oct 2025 21:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761688080; cv=none; b=Hkuztr8Lz7u8PrVORe3dboY5Qh41LzOr/GRXycd4ZEZLS/fIf42wRDElusBb7r7DvtQiVtbNDnuQWtvfpd2iniIBq0vDmDlaFxVoSfEziSUVxzOG7DFo8GwEhqCOFy9FgI2z5EXuHswSOI2asOmVBrPujV8O3cfNhmBsTiNopGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761688080; c=relaxed/simple;
	bh=2tsnf28ipcIAfDZPP03qHcIF+Ko8CEeFlZfoQbFw8nk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Cq3vZX9A9dZaybJfW0w3L2Iuk0Q8+/lrhEKrsLAXPpN9F6m2aioYQR0oI2OHTN4kpRiVtKymqoaBSH0zSWLIuK+plKIWcf0qghtTSdP8zCL4WBq5mhPiTteNtKqjNWnRB7esmQkT1/UHEmsiluSTrIm6MSvddVX2wef95phdKqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=iL1MA71m; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="iL1MA71m"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 93C23406FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1761688078; bh=RetlZ1LyA7XkqWfjrkbefmuL6Fe2ISzbT+EWH+N5Q0s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iL1MA71mlM+6QFSTW/xKyGNaoov1B9qZpmheRY/HC3wDNOdnxIc8Af0NZKWTs5yNf
	 uegJqIG+lNpRct3Iik/z/avfABu7dISzJrKH/x+4lOoX5/p9nZmiu2kVaaGKII2qFa
	 l5YFy7ZJN3GZMvvzhiogS0EGawGpAuF1RphmZ7c9mUVm1ibQjjCLPjcn7S58p1XYVE
	 Qyq7pCUxlBEzd1pcj6BPkosx0eTLQHR5xLAHBTnnhTF5TMnnApo46u1idnJ3GApV4r
	 Yly/cEU3f3UJQfpSxPptzymdhY1hNNwUKoCsSr23Fs/dM/Z4uCky/9C3EmylihbfRp
	 OjXtwsGLhmNJA==
Received: from localhost (c-73-14-55-248.hsd1.co.comcast.net [73.14.55.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 93C23406FB;
	Tue, 28 Oct 2025 21:47:58 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 regressions@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 10/30] docs: reporting-issues: move 'check tainted
 flag' upwards
In-Reply-To: <93cac5463d1e51b57b7cf74181397039137bcdb5.1761481839.git.linux@leemhuis.info>
References: <cover.1761481839.git.linux@leemhuis.info>
 <93cac5463d1e51b57b7cf74181397039137bcdb5.1761481839.git.linux@leemhuis.info>
Date: Tue, 28 Oct 2025 15:47:57 -0600
Message-ID: <87a51ak8aa.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Thorsten Leemhuis <linux@leemhuis.info> writes:

> Move text around to improve diffability in the follow-up patch.
>
> Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
> ---
>  .../admin-guide/reporting-issues.rst          | 142 +++++++++---------
>  1 file changed, 71 insertions(+), 71 deletions(-)

Seems fine.

Thanks,

jon

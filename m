Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D82530CD9D
	for <regressions@lists.linux.dev>; Mon, 27 Oct 2025 17:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761585384; cv=none; b=VbwtR7fVOf6lChLBY6Ew2c9t5o3amiCxcAEfvWcrr7jbjkm3ogqVwWgb4BfFEK45Njf3UYO/DO+y91C4Z+c+xBtD6FXkS9evebT0oyHjXIozB2pKPyD8h5FYXH6L1NueXAusIKyFOLesNG8jnv48jRY47Hpt1Vw+5Ux8Yd+6yGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761585384; c=relaxed/simple;
	bh=SGpo5zbLkYNSYLhZSQlZopf0gXlOu07LHyQlsl9f/yo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rgthbgqwgM0hEvkWHg2OkCi4sS1a8jsMk2irThW94eXWhy9BEm3Yx48UYo7A9sBz7RNgfMkTZKnGEItymrAuUWIyVumnWRUW2QANuwON4ppZ8PzDgOklWc+s+SA6098I6tV76HCRChWHVVjRT0oQR6gPHa/PWK9+yftAA0s9Po4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=s//7eFe2; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="s//7eFe2"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8252E406FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1761585382; bh=4AJkw0JNiYt/C/Q0w7OHk2noFttalBttxGpAF09CdDM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=s//7eFe2ZlRxqEGUnYz7qSLdLireCzjsBeXes20zIZK7P6e356dtfgfxHq8uJB4K8
	 x8hO7shSOQMM8wmEYHtvgAyKsS+ZQ+W3uZoX1g1hLsqxXWvT+P6QCJAxhqba5MZfoU
	 jhAIcbOdImOHUqsg5wGPYpqleaxTEX7VlHUmz8g1OMDiKeStlQrm2K9sxBfXkg8fw8
	 MF91Y1aO6dfMLnbzyG4XPcib1rv2sOPuRTTyjzvtxcmSAHbVVXAUexM27OnNhP5pWL
	 Bcs79RgDT7WPmMfa7ydl9W/DsKB6Xag0cUz45rFU99jiZtMemRi6U8nB/Y3sAtuH68
	 MQ8+/pTZbu/cg==
Received: from localhost (c-73-14-55-248.hsd1.co.comcast.net [73.14.55.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8252E406FB;
	Mon, 27 Oct 2025 17:16:22 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 regressions@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 00/30] docs: reporting-issues: rework
In-Reply-To: <cover.1761481839.git.linux@leemhuis.info>
References: <cover.1761481839.git.linux@leemhuis.info>
Date: Mon, 27 Oct 2025 11:16:21 -0600
Message-ID: <87zf9cnu3e.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thorsten Leemhuis <linux@leemhuis.info> writes:

>  I worked on-and-off on this for maybe two years and the problem is:
> what started as fine tuning in various places piled up. That together
> with the newly added links & anchors and some text movements makes the
> patchset huge. When you ignore those two aspects and look at individual
> patches using a word diff algorithm it looks a lot less scary, but it
> remains big =E2=80=93 and thus sadly puts some load on reviewers and
> translators. Sorry. I think it's worth it and tried to split things up
> to facilitate handling.

It is indeed a lot, it's going to be hard to get people (including me)
to look at it all.  I think you should really consider breaking this
into smaller sets and getting them through one at a time...

I'll look at a few of these, but certainly won't get through the whole
set today.

Thanks,

jon

P.S. Grumbling aside, it's good to have you back...

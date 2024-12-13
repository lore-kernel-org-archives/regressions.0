Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DA81E4106
	for <regressions@lists.linux.dev>; Fri, 13 Dec 2024 16:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734107288; cv=none; b=MEK3Y/D7LghpK54RoW0e7XzNfKYHsMqSZU9e0yax18Vfznrn40tDQNRNWmWwQHe+627caqcI9QYCfAKD5GHEF1hX6Ch+G0jnQgVbUBOb4OlnS8HWmfiLXcaxXsys3euUDDOpnSDKseHTZasJNjyRTQuk5z1Xsmu6hkzJJuqWrqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734107288; c=relaxed/simple;
	bh=kVW3MmpRo+0mWGODI4u27xOJefgLiNtJKJAD0Cn/v2o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qGsJ4vOuD47xLWH1NlFbDjZpj5PybdL6Rk7ApN+YgiImAwSWkBIlpnqr3e2DhInj9WKklt/IbrT4qDN+zDm6bT5oPGUsQTQ42wE3hmAYU6a9IU3/JRQRMd75kl0AgA3ZISYPdu57uaM349QKQZFd3ttHex5T/+OiMkSIDrUdYL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=I0jKDDCt; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="I0jKDDCt"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9166C403FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1734107285; bh=HmyEhXVxlnLi8kqBMIuabR647mM1XFTQuhPMBKhpBb8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=I0jKDDCtISpHwgUKItAXuVXU2CTueFk9VWVe822wBKtiszjsSKuaX49zXy28aBo1e
	 grAuY41qNzcFYmiAIe4WNTwmTTd0YKQrC2xoqWU365tiKJkAXv6u4nyAvnVSqeth6N
	 WjapLZbaco0jEzT51iDL3S8DwGT1yyceuhOUVNbqXJvH/RDR4oYHZR/9SZ8VBtg4Lq
	 6BXzFpCrTRVtIgnHa0kvW31bwcWtDOBjb3MQS9k8u2F1bG3pZJuSYDxAbO22aabv6b
	 oPaEexQ7HKi2UkuYDg6fMpIKGmu0epo/DwAB8RHyBTV6FOXwPu42dpj/hkgMnefjVu
	 G9uEeYp2xohvg==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9166C403FA;
	Fri, 13 Dec 2024 16:28:05 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Thorsten Leemhuis <linux@leemhuis.info>, workflows@vger.kernel.org,
 regressions@lists.linux.dev, linux-doc@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg KH
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 5/6] docs: 6.Followthrough.rst: more specific advice
 on fixing regressions
In-Reply-To: <fb5f1b83786c31cbbf56621b14d595a3091d9a40.1733825632.git.linux@leemhuis.info>
References: <cover.1733825632.git.linux@leemhuis.info>
 <fb5f1b83786c31cbbf56621b14d595a3091d9a40.1733825632.git.linux@leemhuis.info>
Date: Fri, 13 Dec 2024 09:28:04 -0700
Message-ID: <875xnnwnsb.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Thorsten Leemhuis <linux@leemhuis.info> writes:

> Provide something more concrete about fixing regressions in a few
> places, as telling people to "expedite" fixing those that reached a
> release deemed for end users is pretty vague. But every situation is
> different, so use the soft phrases like "aim for" and leave loopholes.
>
> This removes equivalent paragraphs from a section in
> Documentation/process/handling-regressions.rst, which will become mostly
> obsolete through this and follow-up changes.
>
> Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
> ---
>  
> - - If the culprit was mainlined during the current development cycle and not
> -   backported to stable, fix the regression before -rc6.
> + - Expedite fixing regressions that recently reached releases deemed for end
> +   users through new mainline releases or stable backports.  If the culprit

Again, I wouldn't used "deemed" this way.

> +   reached it in the past six weeks, aim to mainline a fix before the end of the
> +   week after the next; if it landed during the past year, taking one more week

Can we say "within ten days" or some such instead?

> +   is fine.  Whenever possible, try to resolve the issue faster -- but it's also
> +   okay to take more time if there are strong reasons and a revert no option.
>  
> - - If a proper regression fix is unlikely to become ready in a reasonable
> -   timeframe, resolve the regression by reverting the culprit.  This is
> + - If the culprit was mainlined during the current development cycle and not
> +   backported to stable, fix the regression before -rc6. But try to resolve it
> +   faster whenever possible -- especially if the issue is either reported
> +   multiple times or prevents CI systems or multiple users from testing, as that
> +   might mask other bugs and drive testers away.
> +
> + - Try your best to mainline all regressions fixes before the current

"regression" singular

> +   development cycle ends, unless the culprit was committed more than a year
> +   ago: then it is acceptable to queue a fix for the next merge window, which
> +   is even advisable in case the change bears bigger risks.

Thanks,

jon

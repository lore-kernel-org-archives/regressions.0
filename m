Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7263B1E3DE6
	for <regressions@lists.linux.dev>; Fri, 13 Dec 2024 16:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734106862; cv=none; b=ZISycgIdjyKCFyaSQVg4rPQgHeyR3zTMQci8Y8RGcXgDauG7gCbzSdG7kzTV7AYCiYjnGL7y2BCPPhObPiL6ndcDx+knpmuGmhkKaNxScUraXSyWDbfWsFivnTIGh0yamFrOLvJacvHg7QSfR+ERBAFX2pTSKQdjnPUaOp8ywF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734106862; c=relaxed/simple;
	bh=TEXPzM+iRMrHlQTH/p7rqGnDvgA0ZXfF96gnvJv5z5w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bhpxPhQ/6ekVSvyFgziCrhWYpluPwoa0YWCUISGfpduwBr2TAZtm7T/Vr8jW2R+pGande8JXzhkpgLNN6ctPuXFNlSSxi/UPIB+ZXD16EnMunjOhHBNmuoyqK/9Z3Q5Tr7KJRPbqrCZCCGA7xlqyJGxtUcz6cIrgC2hfaP5aqz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=RqKppRRD; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="RqKppRRD"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8C9AB403FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1734106858; bh=sQluaJQRv0RcwlIkBISjIR6MBrbnfkMSzi+aShEPqfI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RqKppRRDrDvkQTOGZOgHyL+6YThG2TbF12K5SOi2K6f3KuYpd831w/GHHLRFw7iHy
	 /CxtN9el01Z3R+Wd/njtlQH06Hx1rR32UK+fj9bZNGKL/xTUhb/AH+jHf0fkV4h3+l
	 fFJp4c8FXy1XvN9ki/7pmvCSSClczQZj/JJAzObwlXTSrzWA+SS5txhOWS6vxwrsQm
	 UgOSvIWtW6Zmh6vQhw7gJjxmx5up9VAdHSl1blHPgeLzhxQpA2lTyMiV5FUylO0Il3
	 d70pQ7zFWg3XWEpSD2pAxNWJr9XdeMc7qq3u/1pBU68c70Ed3MjXyXSdfHSjfCoiiF
	 m/EgQ6QCSB8xw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8C9AB403FA;
	Fri, 13 Dec 2024 16:20:58 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Thorsten Leemhuis <linux@leemhuis.info>, workflows@vger.kernel.org,
 regressions@lists.linux.dev, linux-doc@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg KH
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 3/6] docs: 6.Followthrough.rst: interaction with
 stable wrt to regressions
In-Reply-To: <d7793d2e788e7d98a67e90f85a77d42dab1b8da1.1733825632.git.linux@leemhuis.info>
References: <cover.1733825632.git.linux@leemhuis.info>
 <d7793d2e788e7d98a67e90f85a77d42dab1b8da1.1733825632.git.linux@leemhuis.info>
Date: Fri, 13 Dec 2024 09:20:57 -0700
Message-ID: <87ed2bwo46.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Thorsten Leemhuis <linux@leemhuis.info> writes:

> Add a few notes on how the interaction with the stable team works when
> it comes to mainline regressions that also affect stable series.
>
> This removes equivalent paragraphs from a section in
> Documentation/process/handling-regressions.rst, which will become mostly
> obsolete through this and follow-up changes.
>
> Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
> ---
>  Documentation/process/6.Followthrough.rst     | 22 +++++++++++++++++++
>  .../process/handling-regressions.rst          | 19 ----------------
>  2 files changed, 22 insertions(+), 19 deletions(-)
>
> diff --git a/Documentation/process/6.Followthrough.rst b/Documentation/process/6.Followthrough.rst
> index f9ae3a86ee0c49..763a80d21240f0 100644
> --- a/Documentation/process/6.Followthrough.rst
> +++ b/Documentation/process/6.Followthrough.rst
> @@ -234,6 +234,28 @@ On procedure:
>     requests again should ideally come directly from maintainers or happen in
>     accordance with them.
>  
> +Regarding stable and longterm series:
> +
> + - You are free to leave handling regressions to the stable team if the problem
> +   at no point in time occurred with mainline or was fixed there already.
> +
> + - When receiving reports about regressions in recent stable or longterm kernel
> +   series, consider evaluating at least briefly if the issue might happen in
> +   current mainline as well -- and if that seems likely, take hold of the
> +   report.  If in doubt, ask the reporter to check mainline.
> +
> + - Fix regressions quickly in mainline, whenever you want to swiftly resolve one
> +   that recently made it into a mainline, stable, or longterm release; in urgent
> +   cases hence involve Linus to fast-track fixes (see above).  This route is

I'm not quite sure what that sentence is intended to say.  Might
something like s/quickly/first/ better convey the intent?  Maybe also
s/want/need/ ?

Thanks,

jon

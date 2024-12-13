Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41129139587
	for <regressions@lists.linux.dev>; Fri, 13 Dec 2024 16:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734106641; cv=none; b=NOllIcn7/iwInx9W22aqkabIkJRPWub/oHz5DH7M+H287nnRI3yobolV7csFEM1NeKvqTrY58xGiP9GHspHxNy3bKk/Qmtljc/COYN+4f+tgpFMTPrlNshoZejrAPAN0b7MM9SUJRSD/UuFB4mR7S0jkv/VGhSfg1mOcan9Md6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734106641; c=relaxed/simple;
	bh=+dJ68RIsRoIe9ROeamp5ETBUKbEHGag5dwxVODWz2hM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZPcTjGzAm6fqIoIAXk/kOF6+hgF/8W2wX9kW84EDxH1q80UsG3aQC1cTyyyryHnZgI2My8WWTym6kbH6bHy7wgR+nf3u04cyjppKJaUjmBC5mbN0/otc0f5guGkLnPkLk19KALR7+Et6zi9yEFksw3SKpzWaZQvRjiUMpPvyQAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=rh9IxRmI; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="rh9IxRmI"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 779FE403FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1734106639; bh=FiuX+b/jLcioRKLB2x5/1NihUC8qYW6jvfUzEWIHeas=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rh9IxRmIHB5oqzQhcq2dnDPFQuek5G5FcsoXRBmuA635/0BK4a0AyAaxJ5Dn730zI
	 ziOUI/HO8weG6xuoLkF8caFFnKAcOosJTefI79Hvn8DWaZMBxDjHIiZT9gOPs3twte
	 ivezLpkZqwnqRvuupLm+DirbaevYM1TgGnzKcJnSsauQ3oZe39Fu1jYb4xTzv6k6b0
	 wUYEtJceGpofnIZQTfwzrboixcUZ1HJ/+6D2cYc6iaMVfPgybcNkHYWWMsvOGw2DO1
	 XjwevGsDgQ/zL1/FQV8uJWl4beb2jSZWHjc2F4veUfGqq/vAevOV7fx9Mji8eeYXJ8
	 /V9Wf+vKjr0YQ==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 779FE403FA;
	Fri, 13 Dec 2024 16:17:19 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Thorsten Leemhuis <linux@leemhuis.info>, workflows@vger.kernel.org,
 regressions@lists.linux.dev, linux-doc@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg KH
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 2/6] docs: 6.Followthrough.rst: when to involved
 Linus in regressions
In-Reply-To: <9344b8bf12ce5ebe838d154d5c4f1baf515a9452.1733825632.git.linux@leemhuis.info>
References: <cover.1733825632.git.linux@leemhuis.info>
 <9344b8bf12ce5ebe838d154d5c4f1baf515a9452.1733825632.git.linux@leemhuis.info>
Date: Fri, 13 Dec 2024 09:17:18 -0700
Message-ID: <87ikrnwoa9.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Thorsten Leemhuis <linux@leemhuis.info> writes:

> Add a few notes on when to involve Linus in regressions. Part of this
> spells out slightly obvious things infrequent developers might not be
> aware of, while others are based on a recent statement from Linus[1].
>
> This removes equivalent paragraphs from a section in
> Documentation/process/handling-regressions.rst, which will become mostly
> obsolete through this and follow-up changes.
>
> Link: https://lore.kernel.org/all/CAHk-=wis_qQy4oDNynNKi5b7Qhosmxtoj1jxo5wmB6SRUwQUBQ@mail.gmail.com/ [1]
> Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
> ---
>  Documentation/process/6.Followthrough.rst      | 17 +++++++++++++++++
>  Documentation/process/handling-regressions.rst | 17 -----------------
>  2 files changed, 17 insertions(+), 17 deletions(-)
>
> diff --git a/Documentation/process/6.Followthrough.rst b/Documentation/process/6.Followthrough.rst
> index ed5e32348f2403..f9ae3a86ee0c49 100644
> --- a/Documentation/process/6.Followthrough.rst
> +++ b/Documentation/process/6.Followthrough.rst
> @@ -217,6 +217,23 @@ On procedure:
>     on the fix and the alignment with pull requests it might be beneficial to
>     have them in there for a day or two.
>  
> + - If a regression seems tangly, precarious, or urgent, consider CCing Linus on
> +   discussions and patch reviews; do the same if the responsible maintainers
> +   are suspected to be unavailable.

I'm not quite sure what "tangly" or "precarious" means in this case?

> + - For urgent fixes, consider asking Linus to pick them up straight from the
> +   mailing list: he is totally fine with that for occasional and uncontroversial
> +   fixes.  Such requests should ideally come directly from maintainers or happen
> +   in accordance with them.
> +
> + - In case you are unsure if a fix is worth the risk applying just days before
> +   a new mainline release, send Linus a mail with the usual lists, developers,
> +   and maintainers in CC; in it, summarize the situation while asking him to

s/usual/appropriate/ ?

That's all.

jon

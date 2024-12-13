Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8321474A9
	for <regressions@lists.linux.dev>; Fri, 13 Dec 2024 16:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734107450; cv=none; b=EmvQE/mZOd+LTVxx64CWyBfu2PMidsBDWHF9oK0G7JsCRb0qwP3iG/oOUnwDGPg92dbsmb86zLQq4NZOqSsabgW56hKrmGd4hDVChlBDwmCGCbBJVd/sD0Ky72Lax2LVUBPAGBhWIp1rDKg5067oeVvdHL9tePKg6Dvd4ZwwJNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734107450; c=relaxed/simple;
	bh=GljLzM6SDuPsSffCkf9qLx2JblnCq3ZfS/3Yg62bCfc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HLRECSBMepmMy4WeOrt558kV6p5xkXBD16aEiIzP/uuEAhXwIg30PL3Ybk2QDTL74JIWR7Tko/GhJsIuoqIkAb2fXNJbwXCgdbo95Z4g5fKvvUxKQGOrn6YDoTc05/U0EF8BmEAZuU5cp1P+SLlJlJBY4muDNww0je4Ez3uqmDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=KPlOFXES; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="KPlOFXES"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B90CC403FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1734107447; bh=GvK3NtmRCIWm3d3RaqEaVNK7jQcMPYtYCwTxhGc9q4g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KPlOFXESToSVcU48CpP9qRMRQdOEwVGDKw865QKXXIhjSS7QdYXSPe2qLZn7cml0d
	 GX13ILAxboW715fiC4ovfwmcq6kAh703YlMfzVbhAEAUmerPj4jAJeLcK6rRISXe+b
	 pC4v3RRlMr4LZDp/kcHkETWWBdQQDEUSEn3QwkfryI9t1qk2F7ZKWhrbpqiSvJBBQC
	 Cxzv3ZVPVlXT51ZEKtHU2uUZHQVdZUGOogZhyQ2IfFYpPqmjDVXxYGT088t92MoltC
	 BQlkXN7XRRbORFWWo2SnzD/8z17xcMZOCdou9zim0wzwcodmm0K0SUTI/0xRLdyZA+
	 9lAZy3MuP45yg==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B90CC403FA;
	Fri, 13 Dec 2024 16:30:47 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Thorsten Leemhuis <linux@leemhuis.info>, workflows@vger.kernel.org,
 regressions@lists.linux.dev, linux-doc@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg KH
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 6/6] docs: 6.Followthrough.rst: advice on handling
 regressions fixes
In-Reply-To: <e7344ff7a57b61380152defaa5ec13f06ac5d7d0.1733825632.git.linux@leemhuis.info>
References: <cover.1733825632.git.linux@leemhuis.info>
 <e7344ff7a57b61380152defaa5ec13f06ac5d7d0.1733825632.git.linux@leemhuis.info>
Date: Fri, 13 Dec 2024 09:30:46 -0700
Message-ID: <871pybwnnt.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Thorsten Leemhuis <linux@leemhuis.info> writes:

> Add some advice on how to handle regressions as developer, reviewer, and
> maintainer, as resolving regression without unnecessary delays requires
> multiple people working hand in hand.
>
> This removes equivalent paragraphs from a section in
> Documentation/process/handling-regressions.rst, which will become mostly
> obsolete through this and follow-up changes.
>
> Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
> ---
>  Documentation/process/6.Followthrough.rst     | 24 ++++++++++++++++---
>  .../process/handling-regressions.rst          | 16 -------------
>  2 files changed, 21 insertions(+), 19 deletions(-)

Nothing really to complain about here (though I do worry a bit about the
idea that calling something a regression fix allows bypassing all of our
usual testing).

Thanks,

jon

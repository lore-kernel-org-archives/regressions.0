Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCFB1E048B
	for <regressions@lists.linux.dev>; Fri, 13 Dec 2024 16:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734106493; cv=none; b=QcJNGtAsy9Us27J9ZhlwsNdwCDMu6rPam+v5C+LwsNdUokGPZB1gyNNLT4zQgBHG7a90YJi9NSei8AowS3FJBNfeV+gLf+4RQeNCIWusSeM+Ok4j+6pGXa2PXPo3vWC+m8MaNNcOz3VVdjMWMV6l9lKZHSZYXOXz/j1o/Sx1PmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734106493; c=relaxed/simple;
	bh=x7lwD+mrt5JjAxRXerCJyGSk5TUHCt49xsw/U2O91Jw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JeVgdCs4bQ2Cvt5AdqBumOPlcKkN1IfcOmYQPIH7rdDIL7dlCHtOsU9yih2EnnjPJhwRXzfKJhDVKqzuGCjF+msIznvGqRH/5hf0PH9RKIY4pSD9rz52YhmtEp+kpHRDi8nnN9OLUxFF2BbmJR/lpKKQuLP4j9N7j+moMNmxLHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=T6G2F/8E; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="T6G2F/8E"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 507A9403FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1734106491; bh=hz+uPLbCXHfkagOv/3/QLncBIXVL2PUgXiHHOfdp8J4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=T6G2F/8EL5T0/QERFYTgNzryWi7awAEMtwmkj2jCUzW0wS6kgGlsiHfib+5Sovaog
	 T2wpDyIO0ocElZ74vDxF0AzzzhxssElVPm0Cdy+XImdhuN9oIpBNRI+x+DCJYWmAVz
	 xgpq2ki3zfHN27DwWDN2FVvS1h0t6rSArnBuOLXYgGIxCqcnyPPUMohrsDQ0PphOKd
	 qoIe1DSSu3egab8Z7WDctbCL0OVwRknKYhzyCuIONABfPt67e9KHMBQf5eXB4vg61g
	 drJgdCCFJTyOilmQrieANgnq+0FPg11wlpTgOQM9MoIb0paogj8DIsQ6W5DSwJCecw
	 MS/zzH6I4FRfg==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 507A9403FA;
	Fri, 13 Dec 2024 16:14:51 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Thorsten Leemhuis <linux@leemhuis.info>, workflows@vger.kernel.org,
 regressions@lists.linux.dev, linux-doc@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg KH
 <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v1 1/6] docs: more detailed instructions on handling
 regressions
In-Reply-To: <aed019088599c6dc8aab8879dfda35785e01d316.1733825632.git.linux@leemhuis.info>
References: <cover.1733825632.git.linux@leemhuis.info>
 <aed019088599c6dc8aab8879dfda35785e01d316.1733825632.git.linux@leemhuis.info>
Date: Fri, 13 Dec 2024 09:14:50 -0700
Message-ID: <87msgzwoed.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Thorsten Leemhuis <linux@leemhuis.info> writes:

> Add a few more specific guidelines on handling regressions to the
> kernel's two most prominent guides about contributing to Linux, as
> developers apparently work with quite different interpretations of what
> Linus expects.
>
> Changes like this were asked for during the Maintainers Summit 2024. The
> four rules of thumb spelled out are all closely based on statements
> Linus made there; LWN documented all except "Expedite fixing regressions
> that reached a release deemed for end users.." in their coverage [1].

"deemed" used in this way is a bit strange.  "intended" perhaps?

> +On timing:
> +
> + - Expedite fixing regressions that reached releases deemed for end users
> +   through new mainline releases or stable backports during the past year.

Here too.

That little nit is all I can find to complain about in this one, though
:)

jon

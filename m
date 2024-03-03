Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7CD2EB09
	for <regressions@lists.linux.dev>; Sun,  3 Mar 2024 15:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709480104; cv=none; b=FSA8ils31WDQORXiqntWEXbbkPFPaigdwobaWuQzdmEx32ROEmZXTqc+460pzugZNbv9nnHN3pLiyvQ3bZS7ChenvN39UmRfX+k2baPd9VHBDnYpxcy2lDriIVu0c1RVfNDNzhCexrq5oPMn+uVwJ5NY7FsOzfL9Z2jUmT+LLFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709480104; c=relaxed/simple;
	bh=3MKVBHEu0N6EzRncaRdIJP+pdeGSMCtu9w+rZsprsZM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=tH0pF05wszeyhb3fsABV4yK4ZVrknTGVSvWlboblHc+kx2W7VgGIdOAuWyeIzvdM4qbSV/NOxMDXYvM5iNbUj2Zb3BRgl14Pn4vC6isTRe2LJf/pF1jqiq5hxGpNkbWOUgnOnLwXb8RVUhm8Imog/MCFRJyi7G+5VRSRTFTqX2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ls5L7mHc; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ls5L7mHc"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8B26C418B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1709480102; bh=IqZO9YkoE1oQJOVKbcqklngw16HV175A5ImJkkZYBMY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ls5L7mHcAScYICDNrQxaIaXLcKi03oJVmOPhckNxdJ4l5tHNcHa3U7nXX3L1UoSCh
	 Ob1oUAekmTkE2EWCDBotPFws5os2UDbDl78ySX/RQCo5jPDT00JQqjd+kJVjV2eFHK
	 YFUTTwMag6uJgVBHPHiHq3WjlQKB89lUaSocabVy6iUngL3nBhi32moan47eUOqhVO
	 ADz2h9eeBEv8NvyzKoFlIMhOJ1A6HS9/RID+4kahuwPngHDeDV6yAN66UnTXVvpdd3
	 AYXdV45tVEhMgRbD+ZFtnnlK+j86gQDa/dJmgI0FjGwbKE7NnVmL4g3bkl4bV+i48l
	 CcGZw8hxXBp/g==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8B26C418B6;
	Sun,  3 Mar 2024 15:35:02 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Vegard Nossum <vegard.nossum@oracle.com>, Thorsten Leemhuis
 <linux@leemhuis.info>
Cc: regressions@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>, Nathan
 Chancellor <nathan@kernel.org>
Subject: Re: [PATCH v1] docs: new text on bisecting which also covers bug
 validation
In-Reply-To: <99b7841b-62d4-404e-815b-5eb5cccd2580@oracle.com>
References: <bf1d2eba0d291ff583e01b5985a0dec248eaf27a.1708072870.git.linux@leemhuis.info>
 <87edd8m7l0.fsf@meer.lwn.net>
 <99b7841b-62d4-404e-815b-5eb5cccd2580@oracle.com>
Date: Sun, 03 Mar 2024 08:35:01 -0700
Message-ID: <87frx7z5ui.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Vegard Nossum <vegard.nossum@oracle.com> writes:

> Something I really like about the current set of books is that they are,
> at least in theory, roughly divided by their target audience
> (user/admin, userspace dev, kernel dev).

That's good, since that was one of my primary goals when I took on the
docs maintainership :)

> I'd worry that "tutorials"
> as a top-level book would unintentionally end up as a very mixed bag of
> documents that don't have a clearly defined target audience.

Could be.  The thing is, there's two axes (at least) that can be used to
describe an audience.  One is who the readers are; that's what we have
been working toward over the years.  The other, though, is the type of
information they want, traditionally divided into tutorials, how-to
guides, explanations, and reference manuals.  Mixing those types (as we
do now) tends to lead to not doing any of them well.

Perhaps the bisection doc is more of a howto, now that I think of it.

Anyway, that is a problem that we're not going to be able to solve for
the 6.9 merge window, but adding this document is.

Thanks,

jon

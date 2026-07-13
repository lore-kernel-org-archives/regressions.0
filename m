Received: from mail2.ecloud.global (mail2.ecloud.global [135.181.6.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D6F3090E2
	for <regressions@lists.linux.dev>; Mon, 13 Jul 2026 12:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=135.181.6.248
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783947184; cv=pass; b=ZXXbZSOUgVE9JMvLFVq33eqEcdLhMx6ZYqAwm2IOphMjLNgqKmNl6ZsBwjdGCkxbzHR91s/bsoplyBU12EXXhws2v4isR2jAmsqt2VVnepcxrmGkWtSbUB0dE90iqTv1LPvY1Vr/qUUaMphRm5AEXeBjRu2Zdw7wi+gAr1EB47U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783947184; c=relaxed/simple;
	bh=PNuB09tXCa7IID+dGMtYvcdOWSS4G/qw922+13ql4UE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=VkTf/ct7lV9zrmzGH3RUnt2WWmRhK7YaYxMMH71pImUoe2Ge79MYfEf4Ji07F8JXmSl5V0IHyyA0emkpvul9/cxCLL9b3xEU0xN2MxbBsGIKpQgUx/XSxNTVpZhPufD8UGBI0yypTqbnFxWGZQO/Z57V6ht85epy8dtp2iUszeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=murena.io; spf=pass smtp.mailfrom=murena.io; dkim=pass (1024-bit key) header.d=murena.io header.i=@murena.io header.b=tG5pJQmJ; arc=pass smtp.client-ip=135.181.6.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=murena.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=murena.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=murena.io header.i=@murena.io header.b="tG5pJQmJ"
Received: from authenticated-user (mail2.ecloud.global [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.ecloud.global (Postfix) with ESMTPSA id A053D72115E;
	Mon, 13 Jul 2026 12:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=murena.io; s=mail2;
	t=1783946649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WgEj+hlesutO2TABPDrMbzeDDerE/w69AflsWMTTjFk=;
	b=tG5pJQmJMVcorEJaatwv338gJ9+qLJ5wwIm6eaS5yJyTgxuKxutGr3z6Iv2gA32reIAhFz
	GxDJsgmA8heVA3N72c2vRjr8zbnK9MkSULrREYdJkZkUloDYkO5pB3CsxoLyw3/Al9cpYJ
	pBu8hxC0GPyZGxxQC66mHKtSgwnGZwM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=murena.io;
	s=mail2; t=1783946649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WgEj+hlesutO2TABPDrMbzeDDerE/w69AflsWMTTjFk=;
	b=TPPywwcTKTenOWCYEr6w/L8ZXVGtNbH/WA+32mrZEr0GsC0VVWf5svUHu4ZGk41X6tcg+1
	DtxKUTXizgVLqpmUtlxlbW04fpTrsxNl2HB1TiShfLfglU85gAlnRdVWIcHRjCY9q+QPQG
	iLnExxSww6LhfYIJo6o3bNDVg9WNhs8=
ARC-Authentication-Results: i=1;
	mail2.ecloud.global;
	auth=pass smtp.mailfrom=lionso@murena.io
ARC-Seal: i=1; s=mail2; d=murena.io; t=1783946649; a=rsa-sha256; cv=none;
	b=pznrM5Ej2MwpfGVZEkZ1uPI4xcHDdYfSaDFXWaahnqPDViavnjRyOrvIE+T3pvtd5ra/1W
	lSKYCG0iqDbnu/sMl2ZfsDMsIV6z5IqbHMux7nJeYLqPk9mBqcfSUPR0hxO9LWLX9Q1Yb3
	lwSTEiuLphyQW8HMZtmL0mps7oXpsNQ=
From: Lionso Alejandro Pacheco Vacacela <lionso@murena.io>
To: Timur =?utf-8?q?Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org, regressions@lists.linux.dev,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Chuanyu Tseng <Chuanyu.Tseng@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>
Subject: Re: [PATCH 1/2] drm/amd/display: Fix preferred link rate for NUTMEG
In-Reply-To: <2230825.9o76ZdvQCi@timur-max>
References: <20260529090909.13206-1-timur.kristof@gmail.com>
 <178379850751.8410.12007342378134020217@murena.io>
 <2230825.9o76ZdvQCi@timur-max>
Date: Mon, 13 Jul 2026 07:44:05 -0500
Message-ID: <178394664580.29425.7247796926102969641@murena.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Timur,

On Sunday, 12 July 2026 19:44:31 CEST Timur Kristóf wrote:
> Thank you for the testing!
> I would appreciate if you could verify that the second patch also
> works well.

Happy to! I applied both patches (1/2 and 2/2) on top of v7.1.3,
rebuilt, and re-tested on the same machine (A10-7850K / MSI A68HM-E33,
VGA on the onboard output). With DC enabled the NUTMEG link trains, the
CRTC comes up at 1360x768@60, VGA output is back, and it happily
survived a bunch of reboots. dmesg shows "Display Core v3.2.378
initialized on DCE 8.1" with no "enabling link failed" this time.
Nice to have this old box on DC at last.

So for 2/2 as well:

Tested-by: Lionso Alejandro Pacheco Vacacela <lionso@murena.io>

> As far as I remember the regression hasn't made it upstream yet when
> I made the fix, so the hash didn't exist in Linus's tree yet.

Ah, that explains it — makes sense. It has landed since then, so it's
really just a matter of refreshing the tag. In Linus' tree the commit
is:

  a62346043a89 ("drm/amd/display: Fix coding style issue")

and it's an ancestor of v7.1.3 (it shipped in the v7.1 release), so
pointing the Fixes: line at that hash when the fix goes out should let
the stable tooling pull it into 7.1.y on its own.

Thanks a lot for the quick fix, and thanks Alex for picking up the 7.1
backport — much appreciated.

Best regards,
Lionso

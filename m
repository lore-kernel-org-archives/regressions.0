Received: from mail.w14.tutanota.de (mail.w14.tutanota.de [185.205.69.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A1C5C96
	for <regressions@lists.linux.dev>; Wed,  2 Oct 2024 04:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.205.69.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727842863; cv=none; b=tSSYjN9ax0BddxaXW+GYE8Ga6VGpXhnQAmsMrWzRZMBdAMnjENH8lVt2LBPTuev0U9gZEFLk5KzhFDNpttVVz8GI09QpDWYFxSVOopaQxC+OV0IuVrRpKedttdBis/KbWj/vU6iQka9OrL98GPEyexQxIm2lpsxx1BB4HIjfSYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727842863; c=relaxed/simple;
	bh=UUXE8r+Ribj0jxE/XTnPfhYH8PI+2arZa0UFqP1hmYo=;
	h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type; b=pICiq63iED/dvoeXkWa0U0eb/jbm657SPNrrp9cqe/BoGITwBuyp1L+7GHeq11a9b1Lc29CCpfDVktUZA7z1J/7UaxItkO7GGA6SXde//cGkP/1/1O+Vu6hH1Px32QwxWbOZVl6zFmwzCKDAEG7PwTy3TQfvF63Gl13ZEjsuPrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jalseth.me; spf=pass smtp.mailfrom=jalseth.me; dkim=pass (2048-bit key) header.d=jalseth.me header.i=@jalseth.me header.b=QDemoljx; arc=none smtp.client-ip=185.205.69.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jalseth.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jalseth.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jalseth.me header.i=@jalseth.me header.b="QDemoljx"
Received: from tutadb.w10.tutanota.de (w10.api.tuta.com [IPv6:fd:ac::d:10])
	by mail.w14.tutanota.de (Postfix) with ESMTP id 33D6827EABC9;
	Wed,  2 Oct 2024 06:14:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727842467;
	s=s1; d=jalseth.me;
	h=From:From:To:To:Subject:Subject:Content-Description:Content-ID:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Cc:Cc:Date:Date:In-Reply-To:MIME-Version:MIME-Version:Message-ID:Message-ID:Reply-To:References:Sender;
	bh=04dtn4ZDwIqsqhEPk6iyeO6ZVVl5bUeLfG9I/mTQhng=;
	b=QDemoljxGg5csc7c5MgSwlj/En1ahPp9MdSWmc6BY9EDIiSd218AxwrKFKUnIs3k
	GuA7+MvjGOlkMrzAMtmVPrVLmDcnvO81ZsJWLfJOvAVuQugerMSExpqHJhmAFQEEEr6
	PBcp+Y5l+Wm1dPjOll3SLM+iXjAj2VMuyR3vf13gDs4qfbm4WAcpg2KtJfu5LTYq3Rc
	MPpoLd44SK7rZQZBi6pBOhKeyj5HC4bJxVd0rbtoleq6IQAccI7AC0V1hqiNYqxExf5
	Xr/rBCCbRzfDWKdWXTEJq0MGjJrPH+vfB0lorTACGLIGZihMrshn8cKPdDfwJJzJbPR
	tQiiMZhQ8g==
Date: Wed, 2 Oct 2024 06:14:27 +0200 (CEST)
From: James Alseth <james@jalseth.me>
To: Christian Koenig <christian.koenig@amd.com>
Cc: Xinhui Pan <xinhui.pan@amd.com>,
	Alexander Deucher <alexander.deucher@amd.com>,
	Amd Gfx <amd-gfx@lists.freedesktop.org>,
	Regressions <regressions@lists.linux.dev>,
	Sigmaepsilon92 <sigmaepsilon92@gmail.com>
Message-ID: <O8AQvEr--B-9@jalseth.me>
Subject: Re: 7840U amdgpu MMVM_L2_PROTECTION_FAULT_STATUS
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello,

I have a new laptop with a 7840U and am running into the same problem on kernel 6.10.11 and 6.11.0. My symptoms are slightly different, in that video played through Firefox works for some period before eventually having a GPU crash. This can be anywhere from seconds to 10+ minutes, though I don't think it has ever passed 20min of playback.

Please let me know what info I can provide to help with root cause analysis. 

Regards,
James

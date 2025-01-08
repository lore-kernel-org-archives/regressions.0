Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4664A1FDE15
	for <regressions@lists.linux.dev>; Wed,  8 Jan 2025 14:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736347297; cv=none; b=iL1Dmlj0A3zc1zo6csmbYMv1nBvkziEa5l8AD4yTwX7sv3hnzzq4RBOFNfRNwcjlNLPfqoFFL0aPnxVmOkVOpcipAi4aGZ6kdvetjqEoY8wlyMs9wyURO86HmZgYhuEQW8ya3KWHwTMLmoyc9BhYP297VNm0Ja/CEfVCBirp97A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736347297; c=relaxed/simple;
	bh=2ZQNK22CDDsOnlzthXlIGxkPF9H21YpseKace6terSU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EYwdpLPkAuCxRqSNyLp0qgulLALXYAnnj6KyR3mtQh7hy9Pkv9S32vFeDBmAU6rU/R95OqpcYDDNZIw+kscfaBz/WSAAsA+wjklDnBtTvKLc9lwgeNrDRt+ryftcB8brmvc53dvJn2Pqh1qud3wszEKFPQG/V3p8G1sAA8X21ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Hv9uC0U9; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Hv9uC0U9"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ef775ec883so24262883a91.1
        for <regressions@lists.linux.dev>; Wed, 08 Jan 2025 06:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736347296; x=1736952096; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SQLM+LoHGnaCGsXSe5lLcsoCAmL6bhSjsazuawUJ1sE=;
        b=Hv9uC0U9AglW2H6mb5HFtHOEUqk3dI8aUJLYvJiFpbgDCw/G/IHmaj2koWYhokZlev
         H9iNMsvh6VKPsAICuIiGU/Z7N1YXrGhO0MadoUNFYJlF66xfom1n8Ep7n7XXENt9X3vK
         ulnl37zaTiTD75L+y4q8wN33kVYWlI/3IMRRD0y5cTvqbRijd58rxDhhkabdT8aYs8xV
         wFyv/p5+cSvGTDk2ELC/F6MISNu+GDRvx0pjwm9a2JVze6QQReeuiNGw/Zg48+uwebAw
         O6YEUVPimzqThNyVysVYkf7ff/9p9W2M4vZ3KvuWNO3EacAQRRWoGz/djLLd5lQUNcW/
         lpvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736347296; x=1736952096;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SQLM+LoHGnaCGsXSe5lLcsoCAmL6bhSjsazuawUJ1sE=;
        b=g2UdiBSfgQw5LjaLdQYIf+u0vBQ6VuLHj04EVT/nkxosGmKIl26o/9zI0MOR9CWDmj
         tQ19hmOCmisvQQ0KaxrDF4m0zCLJ+8QMEc5ctacH8V/wEyKd4o+o3Q9wKHK9/KaHUo6A
         ctX3B9VP2ID1dfCZeAts41MuuHXC/AH6wqTfjKjvsza2v3x0pf+T8lgcLltPxvDey5a9
         JhtXXycoV90TniAQn2L7ZqOyuFPSa1J8KAGVvXwlundu1PywYdoemOxX7KSIX9jDNHFG
         VYwiSnf44F9G6Eu0fr4+xUzLxT8iA/8F0mb8Yi14je+oxTnp+Wfg+C2BQxJIHqgR1k/Y
         WmDw==
X-Forwarded-Encrypted: i=1; AJvYcCXlCuq5BRhRMGAjoP4GfPXSXER+KwPoCgrTUu1C6k9bPLbUhGO3dE6tBY1R+cPyIcLXxen7x7faKglLgg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyf5NhVZA1du1jrFrQL0Q+n7LQeN4TTD/RR7gsQmrYjqS9laluP
	pQwjUAYfsRyv1t8L+8niUPbOObenC1YUSHzQ41RZcBncBKQz1Sw7wDMVxvz70PG3Y9yducdK9us
	Kgg==
X-Google-Smtp-Source: AGHT+IGmkPaMq6fyPiGwNEznCVmXKv73lSbOSvpsyNn1ze2H+LKp+qpzjKZzXeZPKeZkIqzTmMcSaKGlbq8=
X-Received: from pfbbt23.prod.google.com ([2002:a05:6a00:4397:b0:727:3c81:f42a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3e01:b0:725:e37d:cd35
 with SMTP id d2e1a72fcca58-72d21ff4af7mr4989790b3a.18.1736347295712; Wed, 08
 Jan 2025 06:41:35 -0800 (PST)
Date: Wed, 8 Jan 2025 06:41:34 -0800
In-Reply-To: <Z3wnsQQ67GBf1Vsb@google.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250101064928.389504-1-pbonzini@redhat.com> <Z3wnsQQ67GBf1Vsb@google.com>
Message-ID: <Z36OnrAGOL9c7cku@google.com>
Subject: Re: [PATCH] KVM: allow NULL writable argument to __kvm_faultin_pfn
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Christian Zigotzky <chzigotzky@xenosoft.de>, linuxppc-dev@lists.ozlabs.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Mon, Jan 06, 2025, Sean Christopherson wrote:
> On Wed, Jan 01, 2025, Paolo Bonzini wrote:
> > kvm_follow_pfn() is able to work with NULL in the .map_writable field
> > of the homonymous struct.  But __kvm_faultin_pfn() rejects the combo
> > despite KVM for e500 trying to use it.  Indeed .map_writable is not
> > particularly useful if the flags include FOLL_WRITE and readonly
> > guest memory is not supported, so add support to __kvm_faultin_pfn()
> > for this case.
> 
> I would prefer to keep the sanity check to minimize the risk of a page fault
> handler not supporting opportunistic write mappings.  e500 is definitely the
> odd one out here.

Per a quick chat at PUCK, Paolo is going to try and fix the e500 code to actually
use the @writable param as it's intended.

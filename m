Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7465B20103A
	for <regressions@lists.linux.dev>; Tue,  3 Jun 2025 13:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748955857; cv=none; b=OHQEv6bXiG60GtUP2uCaUZBjVzwVb1MQa7xUGDsnr/LLoqcwJLYsUtn9NOOM7IxXnOxFGR821OBiW6CQZAre0CWyLKLD+6RkSSy8wlEioNB7393lDN2Ixu9uiEBb+dprceUHlsjqSTlUPO6rw+6sl892DKlgbyDPWrmW/lLQIhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748955857; c=relaxed/simple;
	bh=Dricr+w/L9wB17nGicPZZQEshdkqpaGFOdOzgyB7jtU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QwSEyxfIPb4aovk4p6n2ZpvM5lp+YWQJkX8epIvI9bWWn24oNS7XsWROwhGwSNu7VnABaiNzGCtwpZqofUeroTtkFdUVp6gxQTjgRSrJyFy/ImqA37wYmkmxYJU9BF64E9WLEP3jfL9yoMkJT1DWYV3FP5yeGol+Mx9Q8yJeOds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S/V96mfe; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/V96mfe"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3032a9c7cfeso1018389a91.1
        for <regressions@lists.linux.dev>; Tue, 03 Jun 2025 06:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748955855; x=1749560655; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dricr+w/L9wB17nGicPZZQEshdkqpaGFOdOzgyB7jtU=;
        b=S/V96mfekoz/OubE6d8iujnr0A86jRS3G2eDKmUl3yvLVkcj6rFmyvbpUaqm7q88rc
         ik0S/gCkHebiA4TAmf6I6FztCtGg1VR+jL0MvT3E1abAFnzOA168szQ3gPL9qwyqcWqa
         gNeeAdb0n88jXzBtj3HWfN6gdQJSEz8ZYgt9wOQk1P5JAa8VZlIdYQWO6uvtsSTEfIq+
         iGEBk9wmkhGIoDIiybbPCDOgammukoI64d8w8p3RJWlgLzxC036vo2z/U+TpzFkkwYJE
         L21TX1LWoqFLbX9aZN65PFMtRrTqnblWxMayelZakiq/MtBlMLfy7li85JHuCjV8CoTA
         uuHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748955855; x=1749560655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dricr+w/L9wB17nGicPZZQEshdkqpaGFOdOzgyB7jtU=;
        b=e+LEEyjPnp0ee16DLofxpKwTrmGgAIOs5qgQVDTzcXGOVBzlHYEV328Ti1PIXt0vEs
         /RGr4uTNOPFvjVljt9IWD+cDMwyQ9dOy+c5B9n8LrAW0NZ/5iS6wI34wSH5Jtv5AbjqU
         y98tk8UFEh7XY901cfMd5tFpdynquP4VpDxdIAuDru3DQbG5lLXMoMklW2EhkMMdw6o6
         rkszlwk34MivYYQPPv3gzoCaZYzR65xBPCXmE8Rk2rIeECxq9xvRjSnULhcWDcDVXwAa
         DPtxS2SoAuQANRAVrXH71D5zEi+23xm5cMPNLhDhN5+xdzLnJZT1Hqi6T6EZYwjz0Kk6
         CFSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUclgcuS/0Hz+fPGBqR80CX9N3aZ9zOJnfxzpuFUc3qTYlw3GDii07BlQGv7i9C2Fx9oVklWorPa97jpw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyOU1WvcBnSDpFtDQ1Ls+CsPltCDzwScsqKZeDztAtA5771eYrV
	rq5p3HDO6P8gUr+HK1U2TIMo6IIJbT+gnG859b84Y11Qk8uaao1ELiPdl0j2KM0wF47J96X9kP5
	GS0a0P43ARuybj2QKAb9vbc2uQ8MfGsI=
X-Gm-Gg: ASbGncu9onJEAGdM9CtSzeurMflMRgANtAMDx1pXDnURXvkU1hXgIc4HTr8AJ4D3vo2
	iw+g+u+bktP4g+axjU4V8h230XgZqiXZlooECARnDt7icjHlK9dRevyNAmLojEnXnijMsoym4gE
	oMoCcUfusgzFybfrIJIrF+xHIHUbxD8mdVMBOdNWOarw==
X-Google-Smtp-Source: AGHT+IHZuxjBASZzmcDbKtbKMKwND8EBhwgefoY/g6fQjw8zmCJ40rK69VbfhFbhfFrS77nV3NseKq6ain69S/GuEbc=
X-Received: by 2002:a17:90b:250b:b0:312:e76f:520f with SMTP id
 98e67ed59e1d1-312e76f5260mr1035611a91.8.1748955854470; Tue, 03 Jun 2025
 06:04:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <700ebe13-c2d3-48e3-800f-8dc327efb6fc@gmail.com>
 <CANiq72mFL4dn+0JppLLfxyKnM+xYwKeduFw2j07hUfxWVVHdUw@mail.gmail.com> <f5d5b84c-0850-4df9-bad7-61fff12c4248@leemhuis.info>
In-Reply-To: <f5d5b84c-0850-4df9-bad7-61fff12c4248@leemhuis.info>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Jun 2025 15:04:02 +0200
X-Gm-Features: AX0GCFs7VQgBRbPSLVv4A4_rBaiT9g1Fb3Qcf6rhz410nhP4a-xSELk381kh9nw
Message-ID: <CANiq72=+qUNJu5j+uoveMrTbngwA89+ScwjUPd9OyVGqps54aw@mail.gmail.com>
Subject: Re: REGRESSION: armv7 build mismatched types
To: Thorsten Leemhuis <linux@leemhuis.info>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-kernel@vger.kernel.org, 
	Linux regressions mailing list <regressions@lists.linux.dev>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 2:51=E2=80=AFPM Thorsten Leemhuis <linux@leemhuis.in=
fo> wrote:
>
> Or is this heading towards mainline really soon now anyway?

The Rust PR is, but it would be nice to have the fix in -next before
sending the PR (I will give Linus a test merge anyway, but it is nice
to know everything is OK in -next too, and to have another reference
point for Linus).

> Thx, it fixed things for me.

Thanks for checking!

Cheers,
Miguel

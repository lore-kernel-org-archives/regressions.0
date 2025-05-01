Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A182144CF
	for <regressions@lists.linux.dev>; Thu,  1 May 2025 17:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746120528; cv=none; b=TDyILeRfDhYwjwS9oeSsolCjChPEGpiGUxH/+VNtWunw4t1Hgx8PxOKvTeTg6ClDyZRzbyitlL5/SV0dAc9m7PT+E8GUwhgO5FSEc4tr+weVcUtDzMd+ErzwDR7jvSP9QZ0CC2TiXaOQuYmaJp6I+0u6YMM2zHYwTfDO/j5tZlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746120528; c=relaxed/simple;
	bh=ZKcuaFW2oPn0jqodDr0XtTaRO5hQX0tUhd25Cdcl2zI=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=FWfVp7VcEXpwQzObm8LB2ipwvdOOtC193Efok5iy3aAibRwjYtg9dWjJKT1MxHavKkD81zFt7V7s+ZzrYUVeFykw6miELkuzWAvDWthA5X+9d6E6Zzie8vrBI7yRH+iv9w7FUHxqZIn/Vut+9qRIkVSh1TC0egXlmRc7HvVr8YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TEmlEOkV; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TEmlEOkV"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7370a2d1981so1142734b3a.2
        for <regressions@lists.linux.dev>; Thu, 01 May 2025 10:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746120526; x=1746725326; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gk0ol3/wv1Ndo/6VMxze6mTl31v+JnNdZPKIadRxVM=;
        b=TEmlEOkV2QbfAUufJEcvTqbkDqo7aRyH+X7uyYqffOwriXznQS9jc1SPf9H1evSfEx
         dMf7f8uDYKYwHrPeGsSDI7kyMeWHNt4yHVOziK1OsczEUhqXp3eKRSZ2pRGUBEVsvUyR
         0O2lC7T4VDyGvW32Sq9Ey+XSU8YIsHArmW65xUBAyvWNvZiyfuYTqRnNYY0Lc6oSKl6z
         BN+3qmKx6Suz0CVh0LOKVnzcRABGu9Khh+tnFb3WHxlGbD0XnsheX0KowGGOGTDknuJX
         IP/mL7Zd6tMxq8ZPu+NwVw8gXZMuXVcqCG9Xkfb3py2pVfY92cu9vCPkY5cRHYsltKHu
         jQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746120526; x=1746725326;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7gk0ol3/wv1Ndo/6VMxze6mTl31v+JnNdZPKIadRxVM=;
        b=a3PWx77W4NBxc6GmqAz1fLUg5LaQHwVVrhkz2Maq+jukdEq+6M8qXNkAlU6dinH3SM
         wMAl4AB3PoN9DZ7NxX+bMwf66i0XGBs2n75lc3ZkeNHixMg9FG1M65nALnBEN1W4vxR4
         m8D5IQnLW8m2OCGkJfLlykp/L7uNkWe1IoUJXaA+ryy8GjpQ9kJd7WDaIkObKQ7xyT3z
         ezhyI7V374jhql3r6fCFbP9oOorpq4L7irP2VdLXFDU6cKwQbew+pS52YHMOFLUG4vqe
         DHWIlDa7AOf/kEjxMPeenTzFxn4zXc0wB80gvJA7pAbPYw34NIC2xY8CiG99eut/OhI0
         v3uA==
X-Forwarded-Encrypted: i=1; AJvYcCXsWbsBvMhVZdKEtYFSPkFH1gpwy8WIxyrQdqyfuROdkWZaO2Um99znMPPvJFNt+szPPaCfO1m3SEe5Mw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzVSurgmE0cUyVH4BzypHlhVM3qLnW2Wj1FrwNoFHLh4nZGhQVi
	EVVHSljDlWIpefEcWgW06IbfLhq5+5gHwBx608gJ8uxqvcFGfeJX
X-Gm-Gg: ASbGncvnSVLGqz2P+5g9wDlwO7PMrCzM4ID92kBcI4oThzt9yEgTyYIu+HzQ/4DebQr
	QZxhguTwCNVt+dCfJ+2xMKulaYidD7NW16Fcx1XjgKKSVy2Yvbn5decioIo6YHducQ2YOrTS+EC
	gj8JwudjLcEK3GIF1n7TS75SDQhuNv/RXTIc9+GRzEonvm7xXuhJhYwx6+FgJxwVYScpSrloYVS
	JNAvRO+Vw315qMbBvVyyrpEwghoI9H2tmseGR3PG41ujfXTWb/mSoHj8ivqTHBZO1I/7sM3IgnY
	wK9ndehZ0mO7h7edE56gk3Kh
X-Google-Smtp-Source: AGHT+IEgg7uXTQ3WUEXhJXM8v3+QeUxJpI0i4LZui8mpkQ/mbC8oIZwbu+WgLDu6v+KCE7SlcmbSvw==
X-Received: by 2002:a05:6a20:2d1f:b0:1f5:8d3b:e294 with SMTP id adf61e73a8af0-20ba70f1ee4mr5342966637.16.1746120525853;
        Thu, 01 May 2025 10:28:45 -0700 (PDT)
Received: from smtpclient.apple ([2402:d0c0:11:86::1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1f9d4799e0sm1013074a12.14.2025.05.01.10.28.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 May 2025 10:28:44 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [REGRESSION][BISECTED] erroneous buffer overflow detected in
 bch2_xattr_validate
From: Alan Huang <mmpgouride@gmail.com>
In-Reply-To: <aBOtxplvvpgHed7o@archlinux>
Date: Fri, 2 May 2025 01:28:28 +0800
Cc: kent.overstreet@linux.dev,
 Thorsten Blum <thorsten.blum@toblux.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Bill Wendling <morbo@google.com>,
 Kees Cook <kees@kernel.org>,
 regressions@lists.linux.dev,
 linux-bcachefs@vger.kernel.org,
 linux-hardening@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 ardb@kernel.org,
 ojeda@kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D9967EB7-7F4D-4122-9470-DB14700FD906@gmail.com>
References: <CAGG=3QVcsuN0Sk79oZWjY_nNTo_XfGYsDT3gc7vEmLyS8OK3rA@mail.gmail.com>
 <ZxB-uh1KzfD4ww2a@archlinux> <20241017165522.GA370674@thelio-3990X>
 <ZxWvcAPHPaRxp9UE@archlinux> <20241021192557.GA2041610@thelio-3990X>
 <ZxpIwkfg9_mHO3lq@archlinux> <20241025011527.GA740745@thelio-3990X>
 <CANiq72nbyqrzGr3Uw_vx-+8DLiv6KbeULrxpyK8Lh4ma15cq8g@mail.gmail.com>
 <Zxu4yhmxohKEJVSg@archlinux> <775D7FF5-052B-42B9-A1B3-3E6C0C8296DA@gmail.com>
 <aBOtxplvvpgHed7o@archlinux>
To: Jan Hendrik Farr <kernel@jfarr.cc>
X-Mailer: Apple Mail (2.3826.500.181.1.5)


Thanks,
Alan



> On May 2, 2025, at 01:22, Jan Hendrik Farr <kernel@jfarr.cc> wrote:
>=20
>>=20
>> I wonder if the __counted_by(x_name_len) in struct bch_xattr is =
needed, since there is also a value after x_name.
>=20
> Wait a minute. Are you saying that the value with length x_val_len
> is behind the name (of length x_name_len) at the end of the struct.
> So essentially the flexible array member x_name has a length of
> x_name_len + x_val_len and contains both the name and value?

Yes.

>=20
> If that's the case:
>=20
> 1. that's not at all clear from the struct definition
> 2. __counted_by(x_name_len) is not correct in that case
>=20

Both clang and gcc say:

    =E2=80=A2 p->array has at least p->count number of elements =
available all the time.=20

Note the at least here. Though I think the counted_by is misleading =
here.

>=20
> Best Regards
> Jan


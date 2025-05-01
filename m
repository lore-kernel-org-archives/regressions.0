Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787F921FF46
	for <regressions@lists.linux.dev>; Thu,  1 May 2025 18:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746123532; cv=none; b=EperYnFOQMA1uokOREymUhd2vpNc9alCEEIJHZDpbqjhYMEkvl1aN7cRmUWx1JhNBgDMIsCQ3Qu8dC9r+kyhb0G5Ub2lREknJEVT9r7BUlfTeXRPYaVbcHJLJMTaDgUKzoN7rK73bj+xVxGSFNMDKjZVficNWTlsJpFgoeuT8/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746123532; c=relaxed/simple;
	bh=8AJ5TYwtCJyFK7YoXPMcpOfVbXhPX9Uum8GFRy8zp9Q=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=exHnxuoJFVOuujt+nO78O8W1QG8I8Sg/sOhC9HInSG+ZjrwoS6gGVtFA8ONm4ed6mdIFGFXr/06btQOWaXGk8ZMPpI7sFHuDi70uWhSvC+PhxKXRERjUqOq8nVo3xU8sEF0SBimTL0WpgGXr/cGGl+ewIyxx7SDq+nZ+7Rw0q1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=af4+wRL8; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="af4+wRL8"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-22435603572so15028335ad.1
        for <regressions@lists.linux.dev>; Thu, 01 May 2025 11:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746123530; x=1746728330; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=31M2a7MzQFnr+QMjJl1jAmf5oWz7cYiRof9uFBocW/c=;
        b=af4+wRL818ayJEkJF7XhUekkyiqCzSF/QLUQ7mKbw77VTiA7bVDcK69EQvPNmaTh0g
         UGED4jU5mfsZHxyrJ7RC/F+5xTB9H9oRh6lm4XXgKrPMJhDKEJ19lzLzFVNm1paTnsjL
         9k7RmxdrQCepGiMELq0WzWrtlyHPvXYr6kPJUnxK5pwR1bDxLhruueytCFfd32NCZi6x
         OlkwypmxgjohQX0Cz0O1w34ecpNVpWtsxWd4leJVf6tcjo3E5uPL2x8cnTT2KATkLcxz
         IaFeTboQIJZz/dNPD+v+Y8zEbs7qgszk6zaRqZ6nW23EQlBM354h+GJUrQOQqmsF2S9L
         MzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746123530; x=1746728330;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=31M2a7MzQFnr+QMjJl1jAmf5oWz7cYiRof9uFBocW/c=;
        b=Qm40WzE2K1oYVDLGlULEZ/WoKBcyQmO/nc5rah7EdiSHJE+7PemxVj6D67XllGsuYx
         +88Dd7bzrywZ5Ag/whLY7Q0qbR6UgJ4VRWVZgeBv07w3eovhXHm6MJWqt0ocMQ02/SPb
         6Zrqdk5Ff5uUabg0LySZV/vIumfM7C0q/AXFRnfg1USgRvJtz09wedPQtogNEIqMkj2o
         qdta8PaGmWscXyPEK3/6JrU7x7XrsBFnWPz35iaLNaa+l9ALUhGW2u/QyjVHNnLIoKD+
         3EpjFEFU2n5+hNdmN3hYHmKEsyiTqTPlCW/ItDPTajdZhYizxvjwp4FE8ZwS31NVwx8U
         XeAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDBxP0+xbCAmrDLwMzpXKYYVU/YGZdpzVwxVj7A3shQK+OFDSkQw1Xp+DYaEHMd/lEmepePNbhF5FHtQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyK5H41dlgoVtBazYYpXUAtrqQn6MjDFoT5KjCt7LErN9Gr5O32
	uBPuOI5MuOZcb8FLp7fjkdTfOEw/c4elH9YWHQPfgF0TSMQM2OjG
X-Gm-Gg: ASbGnct1UylTvsf9rFPfMqgMjxUkotAzUDixNgz3m3Ht1UpAE/69XeQArynvyG1GPh1
	H7ZkR0/z3HAkvIeWMKL3EpfXDcVHn26IRdTtjbujeuaOzvZoLqa/l9WuO3creRGcgCRTbKJcK97
	w1hLImjoR4iuV4FDfDiCZaSgIUY8Q57xkAM+rQzKoRYYwEdUDNda/+/ColCovZcxtdH0cf7QVlm
	2586Rl+8AftBAx7gsRxmJVq/FlxQfkovgZCCdASX20IRf675jX33NBZboDQBnEoYMXhf69RnfrP
	1YgxY1bPgMuOIjS3sK8CpJQd
X-Google-Smtp-Source: AGHT+IHy6Ll3Z23nZVuIrTV6UN983Ah2h/ki0XZ6sOPNNuE027Lh/hRUnu81RjOmmeyjewU+wWuOdA==
X-Received: by 2002:a17:902:d482:b0:224:1ec0:8a16 with SMTP id d9443c01a7336-22e1033c89cmr654615ad.21.1746123530559;
        Thu, 01 May 2025 11:18:50 -0700 (PDT)
Received: from smtpclient.apple ([2402:d0c0:11:86::1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e0bc7b0aasm9831765ad.169.2025.05.01.11.18.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 May 2025 11:18:49 -0700 (PDT)
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
In-Reply-To: <aBO2XVSisMXtU8nD@archlinux>
Date: Fri, 2 May 2025 02:18:33 +0800
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
Message-Id: <DD12E746-2B59-4AF5-B396-4700C6D099F9@gmail.com>
References: <20241017165522.GA370674@thelio-3990X>
 <ZxWvcAPHPaRxp9UE@archlinux> <20241021192557.GA2041610@thelio-3990X>
 <ZxpIwkfg9_mHO3lq@archlinux> <20241025011527.GA740745@thelio-3990X>
 <CANiq72nbyqrzGr3Uw_vx-+8DLiv6KbeULrxpyK8Lh4ma15cq8g@mail.gmail.com>
 <Zxu4yhmxohKEJVSg@archlinux> <775D7FF5-052B-42B9-A1B3-3E6C0C8296DA@gmail.com>
 <aBOtxplvvpgHed7o@archlinux> <D9967EB7-7F4D-4122-9470-DB14700FD906@gmail.com>
 <aBO2XVSisMXtU8nD@archlinux>
To: Jan Hendrik Farr <kernel@jfarr.cc>
X-Mailer: Apple Mail (2.3826.500.181.1.5)

> On May 2, 2025, at 01:58, Jan Hendrik Farr <kernel@jfarr.cc> wrote:
>=20
> On 02 01:28:28, Alan Huang wrote:
>>=20
>> Thanks,
>> Alan
>>=20
>>=20
>>=20
>>> On May 2, 2025, at 01:22, Jan Hendrik Farr <kernel@jfarr.cc> wrote:
>>>=20
>>>>=20
>>>> I wonder if the __counted_by(x_name_len) in struct bch_xattr is =
needed, since there is also a value after x_name.
>>>=20
>>> Wait a minute. Are you saying that the value with length x_val_len
>>> is behind the name (of length x_name_len) at the end of the struct.
>>> So essentially the flexible array member x_name has a length of
>>> x_name_len + x_val_len and contains both the name and value?
>>=20
>> Yes.
>=20
> I assume you can't easily change the struct such that there exists a =
member
> that contains the result of x_val_len + x_name_len, correct?
>=20
> In that case the only available course of action at this time is to
> remove the __counted_by, because it is incorrect.
>=20
> In addition I would recommend changing the name of x_name to something
> like x_name_and_val or similar. It's very misleading to call it x_name
> when it also contains the value.
>=20
>>=20
>>>=20
>>> If that's the case:
>>>=20
>>> 1. that's not at all clear from the struct definition
>>> 2. __counted_by(x_name_len) is not correct in that case
>>>=20
>>=20
>> Both clang and gcc say:
>>=20
>>    =E2=80=A2 p->array has at least p->count number of elements =
available all the time.=20
>>=20
>> Note the at least here. Though I think the counted_by is misleading =
here.
>>=20
>=20
> Here's how clang defines __bdos language extension [1]. Also note the
> attribute reference for __counted_by [2]. It assumes that the flexible =
array
> member contains exactly the amount of elements that are specified.
>=20
> I guess your quote from the gcc docs is misleading, as gcc's behavior
> is like clang's.
>=20
> The kernel uses the type & 2 =3D=3D 0 case.
>=20
> So let's say you have a simple struct like so:
>=20
> struct foo{
> int val_len;
> char val[] __counted_by(val_len);
> }
>=20
> If val_len is 10 then foo->val[10] will be considered out of bounds.
> Even if you did a malloc for enough space.

OK, thanks, I=E2=80=99ll revert that.

>=20
> [1] =
https://github.com/llvm/llvm-project/blob/3b88805ca20018ae202afd3aea39f4fa=
856a8c64/clang/docs/LanguageExtensions.rst?plain=3D1#L5502-L5507
> [2] =
https://clang.llvm.org/docs/AttributeReference.html#counted-by-counted-by-=
or-null-sized-by-sized-by-or-null
>=20
>=20
> Best Regards
> Jan



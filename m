Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E25CAD24
	for <regressions@lists.linux.dev>; Thu,  1 May 2025 14:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746109864; cv=none; b=PzNd0B/H1qXeGDs6+M81odrI2zCYpiQPMl+kI+EbUORwuHoqWpIAq+SfOCYoEOvn1r1lYfSIoiOH7gFUiUyPicgjOjmqqNEnxHDo6qZz3We1PmBdNfd2uV4DOFutrSb/76hyYw6fVwxmDe5y71Mps9HhbjGTdmEvRM3MceusKMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746109864; c=relaxed/simple;
	bh=2U+HvMZCQBKFfXxcyHKnBbd6XO0ppA1oX8u1vk2GEIM=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=fOXbJ1j2IdWqfPq4bs/CB9pyVrME1/0LnK+aWFWK9NzAOIvDviQzmtwKKQcERhka7uybWpCq8iM29MwZ1n41IWTGAG9izydyiuYZsYGsJoimSxp65bnKfoFkQwks2DRVyY0hT1SqcQLWFYNFql8nccjmnsqm+hnv5dD9rH6UF5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jWhfjOIZ; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jWhfjOIZ"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22c33ac23edso11245055ad.0
        for <regressions@lists.linux.dev>; Thu, 01 May 2025 07:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746109863; x=1746714663; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/+xbe7B9WnLsTW32QSPO2M2Qj4XtkaaAcx8/Jq8fxo=;
        b=jWhfjOIZQD5QxYFTccP9abL/f7Wzn+SjXfl74K9n8xfRI7YUs787TUp0YT6lYANihY
         jQ7a9eifd2dKdQ3/msOccp9Vx5KgZkJJOt/0GQb5eKDxyhknZKv90R3VGLkf5bZoMa9B
         jrqqZV1UHkqeVJuc2rzbTnvkwcu/YDixZIuY1+061euZIElRWpzBP2EZe4xyTmzLd4a4
         NdMCj8lXb+K7YQOcJRBnKTDrsryqFL81aJsjZEoI+OhK+C9D0r48iZ96y+jm5SapmEKR
         uK6Cq9LJxcjUIDua91llbS28ktlfoydYl3yw1ZmDrraHh2cusm+wttXK43kr08/OoDAu
         nsgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746109863; x=1746714663;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9/+xbe7B9WnLsTW32QSPO2M2Qj4XtkaaAcx8/Jq8fxo=;
        b=nBy7DTVeT6nlY3Iw2O5acyh+VW5t2uhgDUoj7S+t2I2Tymc7/CWe/E1mEcebkRzxpe
         AT+MCSMQ6DKrEPTugXPI5Ud99vrn6F27ovYu9UKGSbJk7Y0kSbgAu4UrGly5Db2gQRg+
         CJ0oExN8dhfsdAXnitOgOGGRTxzeIYfHc98gLxYm/orJXL8q5Rc1yEI/CVwk6thdGvxz
         fB9fsqbo/PrI4IzQdcaBdbOsoasLaULlorqujp5FEJqSBKTS30+9SvJvWe0KZaFYeZ97
         MEoTFZKaFYwE5omKr76ADJZg63uokrgOVbT6pLLGS1cJQ5TfcnWEe/m/bLV58zOnKNdA
         h6DQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9wDwRrXUelaH6tIV4aD0AQd192rN5TGQkRcG6q4mf08u/l4F8zLpoNeLmL83Qltvz2CjT6FOui6rTMQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzedLA84351wdIoUYI5UmHE96n662fUkTW328XyG0sz4ZR9YaWx
	3u9wnZGgNq0WShNCnJF7YIogVyNwI/7GRWXpuNq2VE3cRydw0qF07oN/sg==
X-Gm-Gg: ASbGncuu42DG2XfmvF7fwc9GFcmqQHtsQZiMiE6Rg4w3tsQvxkCHd5lkVPEEVSsbjEi
	bVrujWHHzx93jsaETk0daq62BH7P3dTu0DeFPVMk/+weLVMcd37LO2zjO9qPlVUc7FM5jAUxdU3
	icwRAAT2uLqa2rz0vykvcLmLXXuipbSkCBKQVqfHYJZwtBcr8NDWCgDoCQjeLrnW8IA5K863sKf
	YqdhtjoC+Bh6BfvM7izNa8doScmEPqdf/I1Uu/JtGJFfIEcxyYTbjwRHFDc2ARLBHuyW1oTYd/d
	fON6zGiEOnO476cGtXOyzUtq
X-Google-Smtp-Source: AGHT+IFHupnon0ojmEQ6X0TCJSB7epehbJDyc8t9NKiVpsxU7cbR1pnZUlb8vOg7c1IhftOpnjoE6Q==
X-Received: by 2002:a17:902:e748:b0:223:669f:ca2d with SMTP id d9443c01a7336-22e08448301mr45292155ad.35.1746109862665;
        Thu, 01 May 2025 07:31:02 -0700 (PDT)
Received: from smtpclient.apple ([2402:d0c0:11:86::1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e0bb0d9fcsm7368295ad.64.2025.05.01.07.30.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 May 2025 07:31:02 -0700 (PDT)
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
In-Reply-To: <Zxu4yhmxohKEJVSg@archlinux>
Date: Thu, 1 May 2025 22:30:44 +0800
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
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
Message-Id: <775D7FF5-052B-42B9-A1B3-3E6C0C8296DA@gmail.com>
References: <ZwNb-_UPL9BPSg9N@archlinux>
 <CAGG=3QUatjhoDHdkDtZ+ftz7JvMhvaQ9XkFyyZSt_95V_nSN8A@mail.gmail.com>
 <CAGG=3QVcsuN0Sk79oZWjY_nNTo_XfGYsDT3gc7vEmLyS8OK3rA@mail.gmail.com>
 <ZxB-uh1KzfD4ww2a@archlinux> <20241017165522.GA370674@thelio-3990X>
 <ZxWvcAPHPaRxp9UE@archlinux> <20241021192557.GA2041610@thelio-3990X>
 <ZxpIwkfg9_mHO3lq@archlinux> <20241025011527.GA740745@thelio-3990X>
 <CANiq72nbyqrzGr3Uw_vx-+8DLiv6KbeULrxpyK8Lh4ma15cq8g@mail.gmail.com>
 <Zxu4yhmxohKEJVSg@archlinux>
To: Jan Hendrik Farr <kernel@jfarr.cc>,
 kent.overstreet@linux.dev,
 Thorsten Blum <thorsten.blum@toblux.com>
X-Mailer: Apple Mail (2.3826.500.181.1.5)

On Oct 25, 2024, at 23:27, Jan Hendrik Farr <kernel@jfarr.cc> wrote:
>=20
> On 25 10:10:38, Miguel Ojeda wrote:
>> On Fri, Oct 25, 2024 at 3:15=E2=80=AFAM Nathan Chancellor =
<nathan@kernel.org> wrote:
>>>=20
>>> on the official submission.
>>=20
>> Same -- please feel free to add:
>>=20
>> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
>>=20
>> One nit below that is fine either way:
>>=20
>>>> +# clang needs to be at least 19.1.3 to avoid __bdos =
miscalculations
>>>> +# https://github.com/llvm/llvm-project/pull/110497
>>>> +# https://github.com/llvm/llvm-project/pull/112636
>>>> +# TODO: when gcc 15 is released remove the build test and add gcc =
version check
>>=20
>> I would perhaps move these closer to the respective lines they are
>> comment on (i.e. `depends on` and `def_bool`).
>>=20
>=20
> Done, thanks!
>=20
> config CC_HAS_COUNTED_BY
> # TODO: when gcc 15 is released remove the build test and add
> # a gcc version check
> def_bool $(success,echo 'struct flex { int count; int array[] =
__attribute__((__counted_by__(count))); };' | $(CC) $(CLANG_FLAGS) -x c =
- -c -o /dev/null -Werror)
> # clang needs to be at least 19.1.3 to avoid __bdos miscalculations
> # https://github.com/llvm/llvm-project/pull/110497
> # https://github.com/llvm/llvm-project/pull/112636
> depends on !(CC_IS_CLANG && CLANG_VERSION < 190103)

Hello,=20

Now there are users using gcc 15.1.1 came across the similar issue (they =
are fine with gcc 14.2.1 ):

	=
https://privatebin.net/?a0d4e97d590d71e1#9bLmp2Kb5NU6X6cZEucchDcu88HzUQwHU=
ah8okKPReEt

I wonder if the __counted_by(x_name_len) in struct bch_xattr is needed, =
since there is also a value after x_name.

Thanks,
Alan




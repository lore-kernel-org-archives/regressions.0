Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B378628EB
	for <regressions@lists.linux.dev>; Thu, 24 Apr 2025 17:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745514129; cv=none; b=BOg9zA2plSUrZY9LlIvYe4i0iD841cOZ+qYeFFmlekxHnOeTG0kLbrX/3gFXBB/CUf1u5BRSF83dAeLjXjADaKG75p9dqDx2du0QQyj2Apu+A6iG6RgVPzy9BsKZduSagdqD9rU+v+E5jG2wH9y92h857VeuRHa6kzz6mrj/5bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745514129; c=relaxed/simple;
	bh=O5SYM23Cn+WkamdI56DnAUG/Sci0EsW29F0Z42ReZmw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XPzpnLTx82ckmulPH/VcPEsGHAVHTPe5imbEsQlqUMN9tDMHxygTzViXYs+/7c1K0GoUqA6qc7N/Y0v10seG9Tr8FS2MHxd9YXerqKny2cCbM4LGU+pUQk80PsH//yhCDZ2DlOGPQSkDWaXy3kW2biMMSYju8t1dWgSm78bDI4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IqyVR20y; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IqyVR20y"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2240b4de10eso2462545ad.1
        for <regressions@lists.linux.dev>; Thu, 24 Apr 2025 10:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745514127; x=1746118927; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O5SYM23Cn+WkamdI56DnAUG/Sci0EsW29F0Z42ReZmw=;
        b=IqyVR20yfO+iokuZAcB4Mw6a2rOR/Opz3iSR626yH9g5lmUC3CDWdco0ibJphDnfz1
         acFKqqQE+BPSFXsUahtyKSmr3MOCHTPKIwNKRuD7nLfM3gZ+a07wYsEeW371AjIsJ3Qp
         9D20PPWyigmM73RyPNZi0R45YTMlGi4TGWFMExUxgiOhlNkxrWEYH9fU5OCb8dy27N3W
         uW2HO0vhwzREfI/54yiLAgji9Dgaz8YJRI+zZDiGEAtJ81G44LFDo4R9qmntJpgQDhqi
         ZrRz39XiHnczN5OOCf7vfg+AKe0gvwb1FQnJoeWJ/UJiRFmMn73KcsDPKiIUeu50Mdme
         74DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745514127; x=1746118927;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O5SYM23Cn+WkamdI56DnAUG/Sci0EsW29F0Z42ReZmw=;
        b=DIP1wuEjIWHu1cYkhxbcYQp1T3OZP4ngLVa2zqSnI8KGYr6hte8f1NEtPlH9gaRW/5
         l/iflwLpXPSAD54nvDQTlxPiA+zs2Arh0QFCHTMERCqspbl5XCM+bRSrDtoCEH0dRZcv
         W3xlw7CXUigQ82jETG7CiwBNLgPfBhzkMoJq6zRTI/j00TDSyfvvWUYUFXRdEc/1UTUh
         dP0F/M8ymz1ZoNpy6Tf7nkoaS4B761YesI4WDaSJ5shQtucmNDSzCre5xBD0HPB0585C
         a+FBL9pS1CLCqpQr6n2vghD4GHIea+3PHjVPkIQP8tKJH9vAiu6HjeWt4NvH5/xA+X6w
         md5A==
X-Forwarded-Encrypted: i=1; AJvYcCUKAHlerl5Lv+rViZKWhGmYiPbRPWETuUFr09sh8/VJpRvfoWLREb2XAryvyuTqRzUU2SJUn3dXnMy6kw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyCv9oQkeiQfxytS/y57AryoLs251vq1N+4/JtTqRd73jx4JLHi
	EoMc9c/V+3wFnpbgdZwnw13vn5PSX8XGhTu+IpNa412/pyBU0rPh38lLzTfdSTesDdyxnc0J35a
	NoTdVQmctSNKRo3/VL8agEy8Uhek=
X-Gm-Gg: ASbGnctCP2ieAOrIUDVRKQbjgjCwiGZkfiBN8pn/Z/fxOkgi9PA4doZIs39eIQaw8dW
	kptW31rGg7ZBxD9SLsWnMms7EfSjRPILVwyzP5VUq6CQL9KQQWKfqtzVREmM6crBRAC1H7dc0SL
	qnu4c+9RD7j7/sMh+z6QSUsA==
X-Google-Smtp-Source: AGHT+IF3ZtuHsNs56LObEEPE7jjBcXkiaFFKRHI+tLFB6UFWdm0HdP5xd9Zsthx/pq9U8NQvWfTre7qfqozwBswyhxE=
X-Received: by 2002:a17:902:d481:b0:223:49ce:67a2 with SMTP id
 d9443c01a7336-22db3d7af28mr15685205ad.9.1745514126756; Thu, 24 Apr 2025
 10:02:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYvOanQBYXKSg7C6EU30k8sTRC0JRPJXYu7wWK51w38QUQ@mail.gmail.com>
 <20250407183716.796891-1-ojeda@kernel.org> <CA+G9fYt4otQK4pHv8pJBW9e28yHSGCDncKquwuJiJ_1ou0pq0w@mail.gmail.com>
 <CANiq72napRCGp3Z-xZJaA9zcgREe3Xy5efW8VW=NEZ13DAy+Xw@mail.gmail.com>
 <aAKrq2InExQk7f_k@dell-precision-5540> <CANiq72nPtr1FE_SBU_+wHVptfjnoSGaxjP4LWMzVbOF0M6LvnA@mail.gmail.com>
 <aAo_F_UP1Gd4jHlZ@dell-precision-5540>
In-Reply-To: <aAo_F_UP1Gd4jHlZ@dell-precision-5540>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 24 Apr 2025 19:01:54 +0200
X-Gm-Features: ATxdqUEts6lho2tNYy_qoenKS98bA8dTzs4eIhsUcBZzMfNVYnhaeESzWLd5fBg
Message-ID: <CANiq72mPZ-ik8k+04BarAu26A1=rV_y7GYZHkFnCezW4jpXq+g@mail.gmail.com>
Subject: Re: Build: arm rustgcc unknown argument '-mno-fdpic'
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Christian Schrrefl <chrisi.schrefl@gmail.com>, Russell King <rmk+kernel@armlinux.org.uk>, 
	Rudraksha Gupta <guptarud@gmail.com>, Alice Ryhl <aliceryhl@google.com>, 
	Ard Biesheuvel <ardb@kernel.org>, anders.roxell@linaro.org, arnd@arndb.de, 
	dan.carpenter@linaro.org, laura.nao@collabora.com, 
	linux-kernel@vger.kernel.org, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	torvalds@linux-foundation.org, Nick Clifton <nickc@redhat.com>, 
	Richard Earnshaw <richard.earnshaw@arm.com>, Ramana Radhakrishnan <ramanara@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 3:39=E2=80=AFPM Ben Wolsieffer
<ben.wolsieffer@hefring.com> wrote:
>
> -mno-fdpic disables a GCC feature that we don't want for kernel builds.
> clang does not support this feature, so it always behaves as though
> -mno-fdpic is passed. Therefore, it should be fine to mix the two, at
> least as far as FDPIC is concerned.

Great, thanks a lot for confirming it should be all good, very much appreci=
ated!

Naresh: would you like to send the diff as a formal patch since you
already tested it etc.?

Cheers,
Miguel

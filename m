Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 053BB237163
	for <regressions@lists.linux.dev>; Wed, 21 May 2025 06:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747810157; cv=none; b=Dwy/UCe0H9Fp33jMO/HNmWavLn9Dv7o5GELJUhICmzlvT7M7KQ/WQV1WmxsQUMwgKVfbctwypmqAgFwIHJPPOp+bNVkVMzXNZT6JuC18KLzVQtwbNUIAdGrLQCL2e55UwzWZRWD0Cw+/8SKxLcTfcP+UwXOVYPiZvz4PY1GA+Iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747810157; c=relaxed/simple;
	bh=pMgfLOarE3sLn9ApmPKE5gjOoiEH3KlE+dCmFXpW1gM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cR0pmqJgbSlokO1u35t4t+Y3BCtuHVx3ufGNEfnbgk03qvg3mBxthE7WsYnLAEx7XXrkHxXtC3VdGcaus8Z/sKqZRsWBUf8GalFq8Nabppkis7zOamgrXoy6ofPwk5Nx+1+/V5qwGIq21K/r4DF8Bl7j9i/m4QXR2fEVwEtRtVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CstOCKRn; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CstOCKRn"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-232219cc6d0so2523695ad.0
        for <regressions@lists.linux.dev>; Tue, 20 May 2025 23:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747810155; x=1748414955; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMgfLOarE3sLn9ApmPKE5gjOoiEH3KlE+dCmFXpW1gM=;
        b=CstOCKRnEntYV2Pq9NHRo7xQkW6cfzOMvJelCIRWdhoS6nKwOw9sdaWVdwZfokZ6lz
         NhtrypgJlWAL1Hm3GMAO9VZWvdj+NzA7cqYQL3a4afr+v+OzcpqCHrneUsToZ4MV76Z0
         H8sUy50HGM/04BhLZq2mb2Q+DK+/n2UDGCLbhNEYiYNX7BwjhqAhhyG40D5WP1ZoPgRU
         wgouycsw1mjuuVHE3xPbUfAqHt01rhYTtDTbqi4FORmQe2rfzT3WMJnQmoieHtkE/fFZ
         G1URGAIFmqJihMweFIHZzAvYs+CJ/U9pnXMbcva1eeFcbvHQkiqOp+VW85nvsC4PBSkN
         KdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747810155; x=1748414955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pMgfLOarE3sLn9ApmPKE5gjOoiEH3KlE+dCmFXpW1gM=;
        b=GFue8ap//hRTSuCcFn0cFY+T28zBpkTVX43wgat+iVYzKYWDFKXEC3WJLByVbhrJao
         zp1sGb0jSTsuLMApzzYgixVJS8FrlRHNUOkBHTk3xqE88B4AiMccELXxqcVJWBCG92Ct
         5hfG3z2GkoD/LsK2wmQ/mPexnc4Dm5UuMYGE7k2LpUGbyWkRoRApbMK3eYfnoZY+8KLX
         chVQozEBGgmjNbukmCkD00go562tRnP9fAHEepdlw25keYlKiXImYYzgNV/85orFoScR
         f2fRCqizp1pzvE+f6ALTYEFFDGoTM0/k4Abb1pGmKyybQRL+6eOXWlAHHKTN2bP95ftX
         ib2w==
X-Forwarded-Encrypted: i=1; AJvYcCW2vggKdGE/H0AJ7uK/nElVZyEJFXIxAwvCf0coXxhrIAEd4OnGSqt/7fY1gmSzr/5IsMpmcD9tRjwJtw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzXfHyw7xOrPbtynjU8QafTNdcnYyjJZ368628B0+dMRrbvSgrS
	lDJxH7GwU+ieE07Df9gkB7Jb3KXhgHILayg29YeFkvEUBiAJkvxMaqnm+sBTr+JefQrunpnew3j
	EPXbwAmoj9eTVpCf7VzfEPNK0W8Vr4uk=
X-Gm-Gg: ASbGnct7CSqrKExSIIRI7dBvwGoXLFV2D0fgad5YebvI5TJRp8NLuz5K4FJNMHrsYNL
	0ecKTSA5gtaQQk8f2IQhiOS4Q5Zi4r/Kc+6dr7uHBajYHgDDm7a/D3wjeSoNrzA2X5FJHaO4Ra4
	/RdLQQ4a9zJkmbdXCVH3gJfdxqcKm0yqaKgH7Mz+V2Ljg=
X-Google-Smtp-Source: AGHT+IExmNmxiGkYVIFhd609smsGiWGOh8Tpu+Ows+3ubk7FR8CgblGAfBU0mW4P84FMoxwFG0XtVUhmE0uQ2j60ZMw=
X-Received: by 2002:a17:902:7d86:b0:233:b829:691a with SMTP id
 d9443c01a7336-233b82979b1mr7087165ad.12.1747810155231; Tue, 20 May 2025
 23:49:15 -0700 (PDT)
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
 <aAo_F_UP1Gd4jHlZ@dell-precision-5540> <CANiq72mPZ-ik8k+04BarAu26A1=rV_y7GYZHkFnCezW4jpXq+g@mail.gmail.com>
 <53dc3112-9e34-43c5-852d-aeafea882247@gmail.com>
In-Reply-To: <53dc3112-9e34-43c5-852d-aeafea882247@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 21 May 2025 08:49:01 +0200
X-Gm-Features: AX0GCFs8alyZvoCaX-vEw4ZGLJj0dXRTRZ3S4mg4Ye5KYmwczTJfDAjcYR-KhaA
Message-ID: <CANiq72n=pTHrXJysvJVV+xK9Y1O9owF=rxEnrMtMeN=gX4E=Sw@mail.gmail.com>
Subject: Re: Build: arm rustgcc unknown argument '-mno-fdpic'
To: Rudraksha Gupta <guptarud@gmail.com>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Christian Schrrefl <chrisi.schrefl@gmail.com>, Russell King <rmk+kernel@armlinux.org.uk>, 
	Alice Ryhl <aliceryhl@google.com>, Ard Biesheuvel <ardb@kernel.org>, anders.roxell@linaro.org, 
	arnd@arndb.de, dan.carpenter@linaro.org, laura.nao@collabora.com, 
	linux-kernel@vger.kernel.org, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	Ben Wolsieffer <ben.wolsieffer@hefring.com>, torvalds@linux-foundation.org, 
	Nick Clifton <nickc@redhat.com>, Richard Earnshaw <richard.earnshaw@arm.com>, 
	Ramana Radhakrishnan <ramanara@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 1:21=E2=80=AFAM Rudraksha Gupta <guptarud@gmail.com=
> wrote:
>
> I went ahead and sent a patch to Linus directly since it seemed to me
> that this was about to fall thru the cracks. I signed both you and
> Naresh on it since it seemed like you both were happy with the small
> patch. Apologies if that's not standard, please do correct me as I'm
> still new to kernel development.

Yeah, it is not standard, but no worries -- I will reply there.

> Btw Miguel, thanks for introducing Rust to Linux. I'm not too good at
> kernel development or Rust, but hope to one day. The modern Zulip board
> and documentation is very nice for newbies like me. Looking forward to
> making my first Linux driver and Rust driver soon. :)

Thanks for the kind words! :)

Cheers,
Miguel

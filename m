Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090F01CACC8
	for <regressions@lists.linux.dev>; Fri,  1 Nov 2024 17:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730481078; cv=none; b=sCcYJ774bmUaPOmlzJvCvYivrQi+Mh4TzAuBOhn68eeslKUz4c++wFCu9Y3sV5FQ2MMVkgcx9gvjc8BiN4viX4jwGxD/r6eY7uDkUilOcdVUpHWs62SyfBBq2XqDInpAmUC1scGuT8/7KWd5VDGDDZmuHJUlzJOO0lngsMow8Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730481078; c=relaxed/simple;
	bh=lDcrhvdKzxICp2em7eOQ2LPUn90y8jpF57EZ1rpkswU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TdiDvVCNd39imQtI24KlVXOv3qGn0hZYszsQKROTa+m/h3ikJonRmpKtEi72Lyqxj1m5HmJ4wWedCUPejRTUXkvr004SRNkqnD+XtJEL8+2gLnFJJT4EWkOD6C7pm+Pc2Kof0cnR4ohoCD9N2Ifhlw2CIwr2QMuQso0eEyTia0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=VTcaNV8A; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="VTcaNV8A"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-71850708dc9so1319177a34.0
        for <regressions@lists.linux.dev>; Fri, 01 Nov 2024 10:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1730481076; x=1731085876; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xsDgBg/O7EWgquGbLeqs0lCpMz4K8vMjHSFQlw3dpv0=;
        b=VTcaNV8AF/4+y5zedzlOmX2lI/VmMY03yE6/6V1ApFi2UoGY3gB6KEUfo6ux61JWmO
         tf30JpcZsMyp6TEMqLFPWrSmpFsVJwAhc4MTWsmGQ59Mw9VehDyjId2+6MbpzPHmhCr0
         1DZsGErm8HawHMs//keLthA4/Xe1ewls2QQj4jFQUrVSXp7tKt2zmo73+bcQkPMJlFyA
         AtRCo7yQ8PAzhoe6C+LXLjUw6ePxMsHAKD40gnzbFq3AQMyJ58e9V2+C615d0PVqr+K5
         13OFCI2jPil9BbIl1rYqz5Ul2mSXzO0Q6HA93mIy2ak1SxEzB6HtPKC4/hF0SLGyr6vC
         drxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730481076; x=1731085876;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xsDgBg/O7EWgquGbLeqs0lCpMz4K8vMjHSFQlw3dpv0=;
        b=kl+5XOk7Krpr/611eo8eJg5iYFJGQBZ37UH116ck/UlLGhRvHQbYp3Oo7+aupFXAGB
         eZXcMaG9svr8Dl7mqz2rnob5Iwtm4hM7chQu1nwChGp+FTgIggfbC1/BX4EXR9/RHBNP
         qlDhy6wccsLM8wWOq//Q9S1sFAXZyMigYssttcygbHDa3lIO87raBy+H3U2EdmkWX7UV
         e2qAxNci44yNUmYVuQ1LMmc0iKQhfSwK6U2boObZkN2eGgNkhtG7F226e2vN2/JAPvYl
         rtH0W3M5aI5DdqCPh4PXCVvOXs+LrBS9Tq6L/aczgYsCwRVte6jUbxYXiItvIakg5kmt
         1ixQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpd1g73cklwxOUBhKU06eW/BUHzsdNYqhBT9r8PDaZTkfjyU7DI0SJEXVF3Rr4/++eQhbTnvgMaBK/vQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxypWKqplOQOmMVUxKNqAekPjwr1g8QWMGvrbrkv8Aryaxw5Ptc
	8LjEh2wySFPtquKsIX58y6Ubk4LDDN0ACW03dRSVdcuRT1xSXjau1WTQaD41PQPA5sPxDUeoKjJ
	kWI/jAQ14yR3G1SD3+5M9Gci1PrqBqP/1RVMZ
X-Google-Smtp-Source: AGHT+IGE5XTIwiJsnCaOmbPdMrAHJsBW92DiCSlqSt4CdLLL2gNPk/w7OtlscWd0iZ98iATDQMkey/2O1dmRyfwwGwA=
X-Received: by 2002:a05:6358:80a7:b0:1b5:a139:4d92 with SMTP id
 e5c5f4694b2df-1c3f9da1a69mr1362649555d.3.1730481076126; Fri, 01 Nov 2024
 10:11:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYv_Y2tzs+uYhMGtfUK9dSYV2mFr6WyKEzJazDsdk9o5zw@mail.gmail.com>
 <20241101095620.2526421-1-aliceryhl@google.com> <CAHC9VhS5wLQeF4LX67UgUYVG3oViA7CmSZS_kugH+M5J0XS2Vg@mail.gmail.com>
 <CANiq72kcvpEqpwFTNFmxfJsfBMeBNiDrrvFBf_iS7+ozaECJzw@mail.gmail.com>
In-Reply-To: <CANiq72kcvpEqpwFTNFmxfJsfBMeBNiDrrvFBf_iS7+ozaECJzw@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 1 Nov 2024 13:11:05 -0400
Message-ID: <CAHC9VhTQMo11s7mWg=zzDusJompOp01uJat-q9HjQCoEWzHRRQ@mail.gmail.com>
Subject: Re: [PATCH] rust: lsm: replace context+len with lsm_context
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, naresh.kamboju@linaro.org, casey@schaufler-ca.com, 
	anders.roxell@linaro.org, arnd@arndb.de, brauner@kernel.org, 
	dan.carpenter@linaro.org, kees@kernel.org, linux-kernel@vger.kernel.org, 
	lkft-triage@lists.linaro.org, ojeda@kernel.org, regressions@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-security-module@vger.kernel.org, 
	lkft@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 1:04=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Fri, Nov 1, 2024 at 5:56=E2=80=AFPM Paul Moore <paul@paul-moore.com> w=
rote:
> >
> > Thanks Alice.  Would you like me to pull this in via the LSM tree with
> > the associated LSM changes, or would you prefer to do this some other
> > way?
> >
> > I'm going to merge this into lsm/dev for now so that we fix the issue
> > in linux-next, but I'm happy to drop it or do something else, let me
> > know.
>
> Christian has the VFS side, and both are needed for this -- do you
> mean you will cross-merge vfs' branch too?

I think our last emails crossed paths.  I'm not going to merge this
via the LSM tree as we don't have the Rust security.c helpers.
Ideally it would have been better to have the Rust LSM/security
helpers in the LSM tree for reasons like this, but it looks like it's
too late for that now.

> By the way, merging both vfs.rust.file and lsm/dev I confirm this builds =
fine:
>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks for the build test!

--=20
paul-moore.com

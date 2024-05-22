Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B09C148823
	for <regressions@lists.linux.dev>; Wed, 22 May 2024 22:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716418424; cv=none; b=aXwL2AflvebTCulxIhu91DggdEmqWszPPoDZxs/98Hyt9pckVa8Z5HMgo+u3ubcjbSivL+Hei52ZtrvaoE+tN8exV+9bUGOnAGj58YuAephzZiwjszQtT5xJb1w+SAPke6v6wk+QMLjN6RAorHZfGKiiDQf1Bb4C0hVF5MLs0CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716418424; c=relaxed/simple;
	bh=s+AFZiWYdfo9LHxXiFDhhaTaz5In1NnrT6e/kTcTOec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A793TuUOnylTDdutjFmLJVf6sGxCnbhXZh/azWnfxcf+e+NJ81HWWBSBiTvOlzsnVY5Tg038kFyUmQjbeDmgevIdXDV3EVUGLp0ET7bSM16AK7h3qSCcOJ1U6+/tTUcyBReg+JPcqBygWB633g1ERH2eqsW5IXYV80D6/dL8gIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=DcCYxjeq; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DcCYxjeq"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a5a5cb0e6b7so1081362766b.1
        for <regressions@lists.linux.dev>; Wed, 22 May 2024 15:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1716418421; x=1717023221; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5pQI3o2sJHQ9VDDihE2wM0f+XoWWITjrXXHCRcKXU50=;
        b=DcCYxjeqZbOxorEN1PqNdDN1P6p8ZKdR2Od7AWCrj7GMhC35R7H1ErvvfPN3Jz8+MY
         X3EtGr0CEnk5FgTzvLr5gMfdcnW1Y0UxYZa6sCezphDBP2r/9PMSk7mjw4hFKJT3K3sw
         ZBsHamA7IxfEpfSUVmAme1C16Elly3fTTk+9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716418421; x=1717023221;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5pQI3o2sJHQ9VDDihE2wM0f+XoWWITjrXXHCRcKXU50=;
        b=Ey0+YhnX0Tp0hLuF2rGdQ/RJdXkcvqCx1BtbjYnAJ3i2aW+DFj+KCj1KIbrHxqv8pU
         iShy8WnrPHNo/axkxahSQc2TiQZDjxKvMPjuVZGiDKdLx2SiLsOKhEn/QKCgh0ys/Qcy
         2FBRoGBsz+INacsmKb62EFObsNJZYqBk2+cHTeztF2FJd5JGxeQRKN7DhHsOnwwSnYNZ
         PoxwdUjLdp4AyiUHKoXsQdlO+lcILN7IXy4BEC6LxZemBN4/r5dr1+G7uLBXk2uBXzuk
         dZjfhUl8hJsVMK/OCCM0tqQehvQANoPky+OJN7Gje/+zbNy/Qk+ilNf68XpjN06gtEqp
         VRIg==
X-Forwarded-Encrypted: i=1; AJvYcCUtwPeEucWR94/HH+MbahLTftj3Kzsre6wTHMosQIIqR9C0U9Efz0TfkUtsDmnBk7VbFrvKYMFZl5EBgemhblCyqsrugVvB15NVG5c=
X-Gm-Message-State: AOJu0Yz6EdRCuhy54/VEXgjk7Gb83HTQVkvTbFgStfQTdkFv4ljmFNE1
	za6rvk8OBRs9g7VOwuUcIMY+h9y7kYNJpiHYH2rPpN5ziusqoEb1zGMqiHhqjOXQxoO21wiPVkT
	uCqHXNA==
X-Google-Smtp-Source: AGHT+IGT2zpmiFb7RsC5Fn7Eg7AapVKAAMfgmrNrIfWs7QKjBzXO+Pl1MeJJthwjoc0An21KX5eSTQ==
X-Received: by 2002:a17:907:9148:b0:a59:a5c3:819e with SMTP id a640c23a62f3a-a622805e75cmr171555366b.11.1716418420936;
        Wed, 22 May 2024 15:53:40 -0700 (PDT)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17894da1sm1844221066b.89.2024.05.22.15.53.39
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 15:53:39 -0700 (PDT)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a5a5c930cf6so1067333366b.0
        for <regressions@lists.linux.dev>; Wed, 22 May 2024 15:53:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXZjBohepvG+4WRyRX6X2zubBdF9CG2Gxho03HB7Lv34g3TVZmwhvFn7gII9IOgOT0NWbLP+ZifnngZO0ttb2foX+CdTzt/bPs40pg=
X-Received: by 2002:a17:906:6945:b0:a5c:df23:c9c6 with SMTP id
 a640c23a62f3a-a62281673cemr222082266b.47.1716418419345; Wed, 22 May 2024
 15:53:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <0d260c2f7a9f67ec8bd2305919636678d06000d1.camel@HansenPartnership.com>
 <CAMj1kXFE_R_x10BVkU+8vrMz0RHiX0+rz-ZL+w08FH2CLQHZXA@mail.gmail.com>
 <66ec985f3ee229135bf748f1b0874d5367a74d7f.camel@HansenPartnership.com>
 <dfb0d930-7cbe-46c5-be19-d132b4906ecf@notapiano> <D1C2NPOBHAHK.20O4IME8OK1FH@kernel.org>
 <20240518043115.GA53815@sol.localdomain> <ZkhS1zrobNwAuANI@gondor.apana.org.au>
 <00bcfa65-384d-46ae-ab8b-30f12487928b@notapiano> <ZkwMnrTR_CbXcjWe@gondor.apana.org.au>
 <07512097-8198-4a84-b166-ef9809c2913b@notapiano> <Zk2Eso--FVsZ5AF3@gondor.apana.org.au>
In-Reply-To: <Zk2Eso--FVsZ5AF3@gondor.apana.org.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 22 May 2024 15:53:23 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi7vwgzD4hdBzMrt1u3L2JyoctB91B7NLq-kVHrYXoTGA@mail.gmail.com>
Message-ID: <CAHk-=wi7vwgzD4hdBzMrt1u3L2JyoctB91B7NLq-kVHrYXoTGA@mail.gmail.com>
Subject: Re: [v3 PATCH] hwrng: core - Remove add_early_randomness
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>, 
	Eric Biggers <ebiggers@kernel.org>, Jarkko Sakkinen <jarkko@kernel.org>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, linux-integrity@vger.kernel.org, 
	keyrings@vger.kernel.org, regressions@lists.linux.dev, kernel@collabora.com, 
	Tejun Heo <tj@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Kees Cook <keescook@chromium.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 May 2024 at 22:38, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> In this particular configuration, the deadlock doesn't exist because
> the warning triggered at a point before modules were even available.
> However, the deadlock can be real because any module loaded would
> invoke async_synchronize_full.

I think this crapectomy is good regardless of any deadlock - the
"register this driver" should not just blindly call back into the
driver.

That said, looking at the code in question, there are other oddities
going on. Even the "we found a favorite new rng" case looks rather
strange. The thread we use - nice and asynchronous - seems to sleep
only if the randomness source is emptied.

What if you have a really good source of hw randomness? That looks
like a busy loop to me, but hopefully I'm missing something obvious.

So I think this hw_random code has other serious issues, and I get the
feeling there might be more code that needs looking at..

              Linus

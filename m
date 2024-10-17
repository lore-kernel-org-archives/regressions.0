Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB78E1DF99D
	for <regressions@lists.linux.dev>; Thu, 17 Oct 2024 17:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729186799; cv=none; b=gh2zRVdF0Hm3tDY0L7zMr8NXxOCI0vqTTOayxhYLGgdDAV6OcW/a7lVOT93fp1HpCmRmgNmQWOYFsk2iSo58Cu1i5y636tNFrByCTUyjWdqZkbBnxmq+SsgQIfSMStQVvfysiZPw9FnTAu141pTr5apMcXgQTvEmhI7g/iPFdtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729186799; c=relaxed/simple;
	bh=XNhYFcnBb2qAtLDWT7ob6Tja21YLROu8fBAm57b1QQM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nrjE6iUN9gGBlQL6N7HpzWt9u+3SN3OEVWv0XvDHkpPmU5tHCUuXCaqebF6SiEol8KzdjgCgfceet2FL3Mf27gz+rSqVY4JzNyfiVlQYsR4wSYqdUk9nwExkSNYJfdzyREHAYcGDMt7/IqTmgIn2UhEoErHoINFzYDikyJ2P80g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GrZ9g4R5; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GrZ9g4R5"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2e2d83f15f3so187255a91.0
        for <regressions@lists.linux.dev>; Thu, 17 Oct 2024 10:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729186797; x=1729791597; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DVbAzyc9I6m3RIJUQ1MXWzv3RJTPsyczSm1xKWtX5dw=;
        b=GrZ9g4R5sMXlwBPEyu+bNZNcJqbjGXmjkHmIvQwF0hIpGtVnaXXh2XPqSVvZ0DWSDI
         DZ1GezoGHp4Mkf/qEs1+v/bzr/uFTJoCoPlfpWCaOStjHiyd2jDS5IIj+MFgJOPYBEV7
         pKQW44C8T5trkOtj/wfaT4V0XK5JMvGTTAbMTH5D3g87g1lSwiQesdhmYLJUShka22qG
         YSs4qVpddGAp30+xqUf4pT16OdOws7/RYJCaE9nvokqbDrwiKB8VKdelpARYVnRuNy7w
         w5eguwLg5UlV3fpk69lD9cYIzm7lVJxu8q8shPJX9QP1V4n0kdP7DBNtsrGJ5sklaZsl
         pl7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729186797; x=1729791597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DVbAzyc9I6m3RIJUQ1MXWzv3RJTPsyczSm1xKWtX5dw=;
        b=ao5JNL7siDkf2SnXsCj2toPGZ7dySWSU2FLsrda8u8kQeI7jvSft1EdfU/j9hpKQWF
         pdTdsYp2WRjpnrMP4Q8SUY1r8kIoR97WCcWBDCAAzNs16zC605RWbTR6Wzgc6XCmjiYm
         J9s/9BecGq6BNgypVS7fnf7pePs2kaVCg2ctSGKgCqS8dZ2P2jwxXkE5yPD9cybwWmpm
         HtOQjSIxJ/vH+H632c5FTs9y8+M6kwJxwfjxTUAINSYWxNg6A726tSJjcOLu1HW4GfhY
         mOHmSgeVejbOyFdYsKBj9OqMhn3TWKOAJowSKFF8LR299l/QPgq/QDB14G4GrG2TAeTn
         0gKg==
X-Forwarded-Encrypted: i=1; AJvYcCW3HM1RQGx3QZDkz5uXDz+OIe6j8lor5bEKMV0zJ3r49/kK8onA+shyMtAnDvh4iM09SiQepUgxvteHGg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJNZnerwFWJLfNjVSK7TJRf4oDoWlD5RwpynVosSumz3qJRRFn
	iqduetv74+syb8A8N3nUe/yWU8wTDKVViVyWVe/F/b3ZxKYeqof191EuoWgz4AwMhjG+IE99Z29
	pfpwBV5HOWqD75Xd1DVXPRWYmFa0=
X-Google-Smtp-Source: AGHT+IFKzPCfniyRQAO3KPKy/OOw3FuLREb1jofve8Ca+H1mRB5ShgyM2jfaUY0+oY9BlPJVrOG307sYawNQmU4mkPo=
X-Received: by 2002:a17:90b:784:b0:2e2:da69:e3fa with SMTP id
 98e67ed59e1d1-2e3dc135040mr2166896a91.2.1729186797074; Thu, 17 Oct 2024
 10:39:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Zv6BEO-1Y0oJ3krr@archlinux> <E8E64A72-3C1C-40D2-9F07-415F6B8F476E@toblux.com>
 <Zv61dCaxScXuOjZg@archlinux> <202410031424.45E5D19@keescook>
 <Zv8RIs-htdc-PtXB@archlinux> <202410040958.C19D3B9E48@keescook>
 <ZwNb-_UPL9BPSg9N@archlinux> <CAGG=3QUatjhoDHdkDtZ+ftz7JvMhvaQ9XkFyyZSt_95V_nSN8A@mail.gmail.com>
 <CAGG=3QVcsuN0Sk79oZWjY_nNTo_XfGYsDT3gc7vEmLyS8OK3rA@mail.gmail.com>
 <ZxB-uh1KzfD4ww2a@archlinux> <20241017165522.GA370674@thelio-3990X>
In-Reply-To: <20241017165522.GA370674@thelio-3990X>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 17 Oct 2024 19:39:43 +0200
Message-ID: <CANiq72=cUS4GRzuU0WAWn9owttU-L4UpV1Dip6QjUdudCoT8VA@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] erroneous buffer overflow detected in bch2_xattr_validate
To: Nathan Chancellor <nathan@kernel.org>
Cc: Jan Hendrik Farr <kernel@jfarr.cc>, Bill Wendling <morbo@google.com>, Kees Cook <kees@kernel.org>, 
	Thorsten Blum <thorsten.blum@toblux.com>, kent.overstreet@linux.dev, 
	regressions@lists.linux.dev, linux-bcachefs@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ardb@kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 6:55=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> Should this include a Fixes tag to give the stable folks a hint about
> how far back this should go? Maybe
>
> Fixes: c8248faf3ca2 ("Compiler Attributes: counted_by: Adjust name and id=
entifier expansion")

Yeah, I am not sure -- it does not really fix that commit, but if it
helps the stable team...

> compiler_attributes.h is intended to be free from compiler and version
> checks, so adding a version check means that __counted_by() needs to be

Yeah, ideally we should avoid that since the goal was to have a file
with the straightforward ones.

Though if we do go for `CC_HAS_*`, I guess it would be simple enough
too, i.e. similar to `has_attribute` (but on our side), but it also
loses the simplicity of knowing those do not have arbitrarily complex
conditions which `CC_HAS_*` could hide.

> moved into compiler_types.h. This might be a good opportunity to
> introduce something like CC_HAS_COUNTED_BY in Kconfig, so that we can
> keep the checks unified (since there are already multiple places that
> want to know about __counted_by support for the sake of testing) and
> adjust versions like this easily in the future if something else comes
> up, especially since __counted_by() is not available in a released GCC
> version yet.

Sounds good to me (even if we did the unification somewhere else).
Using `CLANG_VERSION` looks better too.

> +config CC_HAS_COUNTED_BY
> +       def_bool $(success,echo 'struct flex { int count; int array[] __a=
ttribute__((__counted_by__(count))); };' | $(CC) $(CLANG_FLAGS) -x c - -c -=
o /dev/null -Werror)

I am probably missing some context, but what is the reason for the
build test? i.e. is there a reason we cannot test the GCC version too?
If the reason it is that it is not released, should we change it
later?

Thanks! (and for the Cc).

Cheers,
Miguel

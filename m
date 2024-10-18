Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE07A6FC3
	for <regressions@lists.linux.dev>; Fri, 18 Oct 2024 11:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729252343; cv=none; b=W29ye1QpJNP8uPUcPtsNv8z6/8FbB8ou+Q4HSkXcVBzs4xiM26IRopxJs25PW2x8uZ7AZWPooAE09eM2AcUQzeydg46ynNKkJXzZkUFMhIGtysmlAfwKNoz1xHvvFOXFf67Xmj0N7nwBoIBrJ+o55AA2MmOl4JFX0dlP7ptJ8fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729252343; c=relaxed/simple;
	bh=iNV1Toc7MSk4oGsveAP0All7CMv4VkQA5da0clNa6u4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cmpOhEcR3ETehZcj/uy8bg6ALiQadnfL84Whpfh8HNfcBBK+bLAtIXS3Oe5B1Te+qCS2RPqbDW3jPD8X5lmzmeZ++rfKuHyaDz5ecoxDyqRmwSjt9dy6ZXvtSUxLCMDV+CFVNcfVUeoH7SK+3iKCd3HFUtrXQdzpKuTefvrZpcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efcrSUjo; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efcrSUjo"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2e2c2a17aa4so361750a91.0
        for <regressions@lists.linux.dev>; Fri, 18 Oct 2024 04:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729252341; x=1729857141; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iNV1Toc7MSk4oGsveAP0All7CMv4VkQA5da0clNa6u4=;
        b=efcrSUjoEUkaOt4TTosHpUqjTk9kN6XkEaqisux+F4l0ybzDUCNrkpK7aDuA+OoEnE
         fS+auxTN2aAzCbL88ZQ5shk330uCZhqZYyvdr7YmuwcSZBtm3Ix8IUG19wh+d3LFOIxt
         eUZtbtJb4xN65pebu3cX/PY8/4Ab2XP43BDmWAmbz9jHkikbkEevH0p+DsAK3CJMjzSo
         TRoVl0vcZOUfkDaBFgQE4FT04d4lRI1//WgjcQRBhrBLZFgVgbfei7m3imCE6wGR8Afb
         aqWQhQZloS+9SyIaGTwARInpMdKEklUDMIqPXi5s0FOsCn80wnaUkVdieOjO4QEpgCy3
         CMEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729252341; x=1729857141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iNV1Toc7MSk4oGsveAP0All7CMv4VkQA5da0clNa6u4=;
        b=PSAFG/AlJgXF+Emqi5riuKEmKezb47U6lmy1U+DsBywyLEiVBUbDx0I8mCQKKVSbUm
         eNNPHoGHs7mVLmrlkj0x4YPdRQsqp8H+7IvJMQmQSLwj8DsjEuTEyK9Nhz+k6FvItljN
         ZXR2metoioiIu+1Ds/lydlCw40AwnMpcKuLwidNp42n2Yt9ARV2IRdEzBx31r0iNoR5W
         4a7JU2/6Gl1Yyf4sJBMd2fqmmG5/TdYxSankEpi2wjsfVySLUABD8bkoytxx2B9DRfHt
         v0LwsT57SmxIlcF/Y2khdGk8W6rFobX9Ktl/lbze/uUnDLJqKRjbuC83PkN/NTtnuPZq
         FMpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKDJxNQrwWqFXIclQZrCSwt0Ca94X/CLxbBp2xeXamMvqF/wlw4pFmE/63qPDWbX+sZqNbbBr8o1Uz3A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxiOywty+tQ6BZ11Xx4L8cxJ9tRFstukhx2k/3FFLD1wMa/coGR
	hAi7GVt57qhQU8Fq54VnhH43QLBScYpQEXBQ8rWwf2ochwZyHV1RnAf6gWhb+enCvOWJJ/jTyng
	mbxS1+LsgRIgRn37QcW4hEJIzUJo=
X-Google-Smtp-Source: AGHT+IG0ZQWmOdahzal0xzYd7knbSdaQBL5DsAJHxmsUxXKZ2XhcWs8MdyWy6ihQNAZJrQ6QOwlll+4hdS5YoIiCx88=
X-Received: by 2002:a17:90b:1254:b0:2e2:d881:5936 with SMTP id
 98e67ed59e1d1-2e561a10f40mr1104905a91.7.1729252341015; Fri, 18 Oct 2024
 04:52:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Zv61dCaxScXuOjZg@archlinux> <202410031424.45E5D19@keescook>
 <Zv8RIs-htdc-PtXB@archlinux> <202410040958.C19D3B9E48@keescook>
 <ZwNb-_UPL9BPSg9N@archlinux> <CAGG=3QUatjhoDHdkDtZ+ftz7JvMhvaQ9XkFyyZSt_95V_nSN8A@mail.gmail.com>
 <CAGG=3QVcsuN0Sk79oZWjY_nNTo_XfGYsDT3gc7vEmLyS8OK3rA@mail.gmail.com>
 <ZxB-uh1KzfD4ww2a@archlinux> <20241017165522.GA370674@thelio-3990X>
 <CANiq72=cUS4GRzuU0WAWn9owttU-L4UpV1Dip6QjUdudCoT8VA@mail.gmail.com> <20241017185552.GA2263054@thelio-3990X>
In-Reply-To: <20241017185552.GA2263054@thelio-3990X>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 18 Oct 2024 13:52:08 +0200
Message-ID: <CANiq72=BRFHrNK54f3ydj7EPPnDGprzaBUhoB+bY_xO3tOPyOA@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] erroneous buffer overflow detected in bch2_xattr_validate
To: Nathan Chancellor <nathan@kernel.org>
Cc: Jan Hendrik Farr <kernel@jfarr.cc>, Bill Wendling <morbo@google.com>, Kees Cook <kees@kernel.org>, 
	Thorsten Blum <thorsten.blum@toblux.com>, kent.overstreet@linux.dev, 
	regressions@lists.linux.dev, linux-bcachefs@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ardb@kernel.org, ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 8:55=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> The most "correct" Fixes tag would appear to be the one that first
> introduced __counted_by itself (dd06e72e68bc) but __counted_by can never
> be used at that original change because the test used __element_count__
> as the attribute name, which never shipped in any compiler. So I would
> argue that this change really does fix c8248faf3ca2 because that is the
> point in time that needs this fix.

That is fair, you are right.

> This is a good point, as technically to allow use of __counted_by with
> GCC with a version check, it would need to be 150000, which would
> potentially break GCC versions between the 15 version bump and landing
> __counted_by support without the feature check. We could also just do
> 150100 to be simple about it but I am not sure that is worth doing,
> since I believe it is important that we support using __counted_by with
> prerelease GCC. We want to make sure that this attribute gets decent
> testing coverage while in development.
>
> We could ship this with a comment to simplify the check when GCC 15.1.0
> is released, since this is a feature very unlikely to be backported to
> earlier GCC releases?

Thanks for the clear explanation! Yeah, if older not-yet-released GCC
15s are important for some people, then I think it is fair to have the
build test for the time being.

Cheers,
Miguel

Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18CE3FE4
	for <regressions@lists.linux.dev>; Wed,  4 Jun 2025 10:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749033997; cv=none; b=g1Kslfa2T8f/f1H3s0sWRC6qzQmECvGSP37nFV0TpMF/UoBV/ZDeRlBT+ZIY51Tq2OHj5nFdSutakMmskccW9VUb3dxIHmSUyu0nOrp05pxpG7HA5sZ6sHtv4RFsXXjtkaEft4MEzc3jfFxV/zOTE3jKZXinz3kJwoMwZ3Z5Dwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749033997; c=relaxed/simple;
	bh=Epv5mheAzkoXZsYIyltaMAeCUL6h42koA1fBsB2ZV/k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AvM8Mg1mHsAM3q/HgwIWd60d67VQo04lXhB32ZuREMh2w2YXlvo4ypW10IpiWB8sTeTFLbt9p8dqNOca0IjV4Y80zBqW458X82FsMAt6zxXuLPGrMeDcAjAWnCBCfGaEZpzM1YRmG8NUUa6pHud4juTmQC1lavnkn6tJuwbQlvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NDQLPMtt; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NDQLPMtt"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-312efc384fcso204080a91.3
        for <regressions@lists.linux.dev>; Wed, 04 Jun 2025 03:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749033995; x=1749638795; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZkMdZcPLkgpesLYoSGyu8by6g0yo2x1DeouPMHzhTM=;
        b=NDQLPMttyYPjV0SPtxcjaxwPyUEhkQ4FQBCpJ8bYxFwWgTgsdWJmB66s/gXM32n4sF
         K5Fq1m8xWtQPy9PPA+WVCnWdCyzKN9YK9MkidCwG5axp1WMWpGmzWcVr5FZbACyUyjHh
         lONtwLe5GLMzoJtOw0Wu4p23SsKt1VIBvl8Q0NYBTkyatFkzPWKEcAy1AgikuZ3/1vva
         ZAar0Azt4FKyao0kcyjdWJdMcGRJXO5uPbobnDIiZAI7xPfF5217W9JLewjet3Fs5tJV
         5RuUB9lPS7vfmQx7Wsy4uYjCEcWjjJl0uMfwaWVnS+T0NMi/XbZ6ZQAfSIWGPWfoxzww
         1g1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749033995; x=1749638795;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZkMdZcPLkgpesLYoSGyu8by6g0yo2x1DeouPMHzhTM=;
        b=UxsiJR22dmq8MhHu2fKJ1wrA0DPvgTcOZsOuR7r/m7M/gveEBmcOD8b+Jxn8ybpxKs
         oOY3Cd/Rq6D1piuFC0ggFBRZ8KQxgASUXCPtrLPQHeGIBZTKiEU8H/sgsLgSjG2xqOsK
         Vc0pysCACk2Bp+TzeWimJNmlw5gf5diHXKI92cvAOldzTbRmaPHx0FU75s0N3bdRGYv6
         LKwA1+ikC0ktnTUQO+3N02XuGwH4O1qqv/+2vlAN3dKmQfM8PhyvrtgkXtAtbDMwANHV
         3Xjd2gH4Raa8+zGsvTGQzzfrjHfn+Jh0apDaCMMrGc1jp3xSg8geGIPE2IbUDLKI2gn1
         WB2g==
X-Forwarded-Encrypted: i=1; AJvYcCUHCxurIVa+re5suwU0+5OuDLyUpOcEBvtavrfq/06zVeowTXEUC9hId7hFwDa5sqYGCceUG9FC0uJUuA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzKGWhxBcpyVNfV9bPOf8O2DZgehgZnboWBEGq3ruorIAOJyFZI
	M0u7NpV8iv0XXzRVAEiPaK0h5gj39vm6vdbZCHC5g9xAv6AWE4tNcY9edUJMKHNx3r7Ckd/bCdK
	Gm3s4E0NoRBCTVKXz0KmiSISu16jcjUA=
X-Gm-Gg: ASbGncvN0ZSksF0yIJ72cLH2jl+gvaA35w5TIri1CBnt57TS4y2ATMhCvwCkqFonRZj
	wbyPsunWyb3SBAC4kU8UhM/iudzrGpSJxRkMcA5JL65ZdazDEUyHdsy/JqspUwremjq/pkTqlDB
	DH0HWKfHErX3YgjNcqR222/OEf8dameG89
X-Google-Smtp-Source: AGHT+IGNTKbmWxJj58p+j9OqUbP+KdcPfi3ogpgUnwFvWYVS0MsDXgTq9fUjK9ub9rEssL91xGAhBa49+UKQcxA0aMM=
X-Received: by 2002:a17:90b:4f8d:b0:311:488:f506 with SMTP id
 98e67ed59e1d1-3130cd6d852mr1421896a91.6.1749033995206; Wed, 04 Jun 2025
 03:46:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <700ebe13-c2d3-48e3-800f-8dc327efb6fc@gmail.com>
 <CANiq72mFL4dn+0JppLLfxyKnM+xYwKeduFw2j07hUfxWVVHdUw@mail.gmail.com>
 <f5d5b84c-0850-4df9-bad7-61fff12c4248@leemhuis.info> <CANiq72=+qUNJu5j+uoveMrTbngwA89+ScwjUPd9OyVGqps54aw@mail.gmail.com>
 <20250604073118.4205f303@canb.auug.org.au>
In-Reply-To: <20250604073118.4205f303@canb.auug.org.au>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 4 Jun 2025 12:46:22 +0200
X-Gm-Features: AX0GCFt_aMFHy55zt8zB_FnAa4ypToTjhayKmPmGVsXSI4Wl9tvd7Ee8ChK3pqU
Message-ID: <CANiq72kghKg7FU=W_yO_q9VuCf=smiyzvrcU8oOFG2FFFsOQiA@mail.gmail.com>
Subject: Re: REGRESSION: armv7 build mismatched types
To: Stephen Rothwell <sfr@canb.auug.org.au>, Thorsten Leemhuis <linux@leemhuis.info>, 
	Rudraksha Gupta <guptarud@gmail.com>
Cc: linux-kernel@vger.kernel.org, 
	Linux regressions mailing list <regressions@lists.linux.dev>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 11:32=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Damn!  I knew I would forget.  Sorry about that, it will be applied
> today.

Looks good to me today, thanks!

Rudraksha/Thorsten: the error should be gone from your builds now.

Cheers,
Miguel

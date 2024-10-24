Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0424A1C82E3
	for <regressions@lists.linux.dev>; Thu, 24 Oct 2024 09:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729762078; cv=none; b=nlsbNvbFq3vHUsyZ5WSM78brfn9oly97GTGE61JKovJ1/qon1VF1OaF+vhJn7fWqvQb35CsL9Y8sm6jfIjS/sbDLiqfs03kQNcGcwkEflJYYaouwemc2voawErx1xJhokIXg3aVTVX+KJDfKUU/iJ02IrvRJT5odkusB90sCZqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729762078; c=relaxed/simple;
	bh=OTTSL0onRwR6qnuOaToi0TOaX8bNt+SPYrxwG1+ZZ0Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EQYWTvbG8UCtB4ke8flDuBVX2L8Z0tGBye2KigRjp8bm0LRxx7t1/q2qaA796/jRn+dBrzquYbruCQEB2cQbORmAJMhKTfUEaTttTIJGqftC3aG3Wq87tVzVdIZl0NIRJfHnn5kHShf0Dk61GWg1JMCAiqDrBIql2P6+9Cs09J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rVx5nSeq; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rVx5nSeq"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so6011651fa.3
        for <regressions@lists.linux.dev>; Thu, 24 Oct 2024 02:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729762074; x=1730366874; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Vw44/IGDHGVtbRZSIkwW6dgCJnRfKhP9Fg+fqXK0gU=;
        b=rVx5nSeqP/zK27fyHpQBjTg6LXckWPPukA5sfz2YAZ2DSLL1sJFyW/q1GgIS+PDNnq
         3ERShhTtj761Pe1k5NlPyNu7LiZlxNd+gAdC1sXnQ0ijiM8VE4uGtx8q92PIQaqvgNFI
         QdTWBnjR3uS9100FA7siTUO+/+IfPZFbAdM94q2SswMpzl3xfHPxKK1et5xOarLOgYE+
         VAiw0KKd2lvW7MntA4xYk7oXvt+nGeU3NFF9nOiEvjzM7kC7VJNfrDsIrq8jCa+cntMZ
         3abDKUPgi8JQy0vxlHOBmZZz3I8+PpFP29W7k5Uz2CTD7Ml175ajPLfS0ldzswWarg66
         N/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729762074; x=1730366874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Vw44/IGDHGVtbRZSIkwW6dgCJnRfKhP9Fg+fqXK0gU=;
        b=ewkrjFeOtJqKXrIw4YR23S0rFl7/7Din/3Jd+Kd+VGuPEtfHt/izBe8gyhupBkW5AN
         lKIyF9KdyMFvaFuSkUMsXgHbNkdQJA28Fem1U37iN+byyp/UKEABFkJf9MUlNNGf/6tA
         eOaRcMF7eFvieReETq9uIvU0P/C7jQq23aXb/76P5gP23qeBS+tRLCENYdm0Bcd6f1EX
         Sz+Ou3RGLbq/APELemsJ3lSDznwdWM68k6J9mMVLEA68BCUOaniVutqE2wf0osvGTYEv
         G72oWClwfbSa28xIGba2xMw1HVkKQPKrNk0+fUJgs4XmHRD/90wxnE9LIbu3FenprncG
         K6Hg==
X-Forwarded-Encrypted: i=1; AJvYcCUSldBAIQvjegc83KcQQoal0SugTtF+bzhH5K1evUAoN9ha1loNJ0+zCTKU6wpDw+Fbg/UKvC4wRdH4Hw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxTZthPSj8YE7feP7PCtOhgeY22l3GF7h4bfDsVANFOUKi9yT/d
	/y+q7BxDT6WV/+R7i+moKNCqXk2D4fCtyacWRAyUOUJn3tf0jnZx8ce92b3lhkcbEPmbU0kJJd5
	eUCsc70+NsMb2kcd+T+2S8dvYlxdtvyNS4bqgsw==
X-Google-Smtp-Source: AGHT+IHetJOx2pidhQpRaDpIjNHeL/hydkQIWL3Z96hrsPJKCCIgS3TJEmBSK/+jaQfDgZHeC3TUOPN5XVLUK3SwxLs=
X-Received: by 2002:a2e:6112:0:b0:2fb:5ac6:90f0 with SMTP id
 38308e7fff4ca-2fca8264708mr7213521fa.34.1729762074061; Thu, 24 Oct 2024
 02:27:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYt86bUAu_v5dXPWnDUwQNVipj+Wq3Djir1KUSKdr9QLNg@mail.gmail.com>
 <CA+G9fYsMg0fA-jraEvC==0a-22J97o-uBmbLJt16_ZKBpOT8EQ@mail.gmail.com>
 <4730e562-7d14-4f12-897a-e23783d094af@app.fastmail.com> <87bjzalhzc.fsf@draig.linaro.org>
In-Reply-To: <87bjzalhzc.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Oct 2024 10:27:43 +0100
Message-ID: <CAFEAcA_+9gA3AqJseY5=5hHOA3OjuGS8bjbGMbpkzFyy7Ggzyw@mail.gmail.com>
Subject: Re: Qemu v9.0.2: Boot failed qemu-arm with Linux next-20241017 tag.
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Naresh Kamboju <naresh.kamboju@linaro.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, qemu-devel@nongnu.org, 
	Mark Brown <broonie@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Aishwarya TCV <Aishwarya.TCV@arm.com>, Anders Roxell <anders.roxell@linaro.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 23 Oct 2024 at 20:47, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> Agreed. However I think we were masking a calling issue that:
>
>     /* Actual RAM size depends on initial RAM and device memory settings =
*/
>     [VIRT_MEM] =3D                { GiB, LEGACY_RAMLIMIT_BYTES },
>
> And:
>
>   -m 4G
>
> make no sense with no ARM_LPAE (which the kernel didn't have)

QEMU can't tell if the guest the user wants to boot
understands LPAE or not; it just provides the 4GB
of RAM, PCIe window above 4GB, etc, and describes them
in the dtb. It's up to the guest kernel to correctly
handle the >32bit addresses in the dtb, i.e. if it is
non-LPAE to ignore those resources it can't access
because they're out of range.

-- PMM

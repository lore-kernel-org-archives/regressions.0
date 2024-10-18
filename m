Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6564D18872A
	for <regressions@lists.linux.dev>; Fri, 18 Oct 2024 09:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729244896; cv=none; b=OTMIPgrGqbhwFMM3eK1f2rgy9RBq8iq9Dg8KKWOhRFWNPIc8CSIcGkFR9XUAKiimFfckZrKZLfplE06fYW47XeB9VCT0AZ06g4KCJQxCLD16/3Kk9HRYHjuhKn1AASh5POOjAR4Zrc0Dg6RPA4Fae4ZD/n0+ZurNZQ6faOmzcXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729244896; c=relaxed/simple;
	bh=BmVeZmCmcwklSJUf1iPn7T5UqzICg/V+X8zVLiMXQTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F3VpR3fRG1bN9/oczMJ6at7NX+VAOtiRsVwOZQycZUCGgpvEveY3f4lhPpwX5gllqvU/lE9X3+Dgn/30kSzhA7Wa/YVhtpiZbNtqU3+xqPgeDPnWBM4PxMozj2dx4FhxQ9Ppbs+2uXLJvWVmuR76mgKRMZWKT/6r0Gx/mzA7U14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HqJB6PPF; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HqJB6PPF"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5c960af31daso2184487a12.3
        for <regressions@lists.linux.dev>; Fri, 18 Oct 2024 02:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729244893; x=1729849693; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Soh6jH0z+eTQKtZFMIbLZG9/1ikoWd+mxwUaxhi1Ds4=;
        b=HqJB6PPFCA8dXiuPpIctlCG2tJFPq97dUuP1x9xiU9XC4uC5JhzAW5u6f7S16T184v
         mqgPdS5GkkLpw1LtH9VLVrh79bSdXW4Q6fvGXJOaSSpp6g3bwAr/ulhP5QsmFtgEVLcB
         c2xXwLCxJuzUB3GiaceELgHJlROVRoKTdFc0w+iBk7deaUA8XyksyXgorFboF+YNbo1L
         LJ680UD+G4xFeEZqKzukO62f6Ne5j5dZIyshlBr/ijAJv86JMN40xQc1BqO6r6k9QPMH
         pKcLuuXpCRybs6CzAT7XNRXeOx50lVV/F4V4MaMlaIQ1kNMXzCQ4yKzeSeyj7nNXPgUz
         r6ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729244893; x=1729849693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Soh6jH0z+eTQKtZFMIbLZG9/1ikoWd+mxwUaxhi1Ds4=;
        b=fsCh4WJQvMsOrw6lFE2MRjdHKeUz9ROtktCynzsfiJHwlaLPJUpy+48LpOoZGgqSSO
         XVi4OES/OQ1yFNdmOPYfSufHaJD0cMKY+o+ZS320J6n4j8dXM9hH9j1I+ftnBahm8fzp
         CTc2yoGzFEwCIHz/Yw2p5fRnUeICl7wAVqkHx9YXlGM+mfscZ+CLSqTBX+uUh9TFlyNN
         LjK+Cfn8VGn1WesQ72E1NE89OC7ZO0b9PYrGKf0nVRgF97fcTCdzTWIrluTBfJ4vntIn
         gyomEjFWygpa7TW1lU4wOCkK8miJOOqDVn8P0NEGS8B1LBjgSdYLwLyP+NomRzNOQ2Bh
         SApg==
X-Forwarded-Encrypted: i=1; AJvYcCWhYahHwjRwWN04VgwyoicCi57pP+ys2hyEqKau1whtZ4YUDRYuXL/qc4n+YYHXItwXAj5ZpP4Qv8yxhw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxZkwhft8sfBhTV1nEUY/SLbO4slLgKmhet7umh2z8+m/bx84x+
	t7EF6/N0KW/W8m9KvYgRw2Aq3p3w9IyrlPjCXfk6eCYMFqZHqeyT5QQ/t1s10QcT1Y8yjQbFwlo
	SW13L7reJ63/r7Ca4UYHKaVnlsyk7iOfJ28NLFg==
X-Google-Smtp-Source: AGHT+IGwkBnt8S54HV5wpTluVRczh/eHb/pg8v+8S1HtQBQwTQ9hgVMWZh3zivyvuxuChXefK071wuCB0YFmrafJ2jY=
X-Received: by 2002:a05:6402:40d4:b0:5c9:3389:bdc3 with SMTP id
 4fb4d7f45d1cf-5ca0abe8729mr1177178a12.0.1729244892751; Fri, 18 Oct 2024
 02:48:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYvx05D7TfRjvdPtKM9iWS6i7b-EHuBAbHEQghvMEg221g@mail.gmail.com>
 <871q0daglh.fsf@draig.linaro.org>
In-Reply-To: <871q0daglh.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Oct 2024 10:48:02 +0100
Message-ID: <CAFEAcA-39GRpvy5LOZSJL3=9FMspAq9c8GUtHv9CP4jU2uFi1w@mail.gmail.com>
Subject: Re: Qemu v9.0.2: Boot failed qemu-arm64 with Linux next-20241017 tag
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, qemu-devel@nongnu.org, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Aishwarya TCV <aishwarya.tcv@arm.com>, 
	Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 18 Oct 2024 at 10:46, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Naresh Kamboju <naresh.kamboju@linaro.org> writes:
>
> > The QEMU-arm64 boot has failed with the Linux next-20241017 tag.
> > The boot log is incomplete, and no kernel crash was detected.
> > However, the system did not proceed far enough to reach the login promp=
t.
> >
> > Please find the incomplete boot log links below for your reference.
> > The Qemu version is 9.0.2.
> > The arm64 devices boot pass.
>
> Can confirm it also fails on the current master of QEMU:
>
>   #0  __pthread_kill_implementation (threadid=3D<optimized out>, signo=3D=
signo@entry=3D6, no_tid=3Dno_tid@entry=3D0) at ./nptl/pthread_kill.c:44
>   #1  0x00007ffff4a3ae9f in __pthread_kill_internal (signo=3D6, threadid=
=3D<optimized out>) at ./nptl/pthread_kill.c:78
>   #2  0x00007ffff49ebfb2 in __GI_raise (sig=3Dsig@entry=3D6) at ../sysdep=
s/posix/raise.c:26
>   #3  0x00007ffff49d6472 in __GI_abort () at ./stdlib/abort.c:79
>   #4  0x00007ffff6e47ec8 in  () at /lib/x86_64-linux-gnu/libglib-2.0.so.0
>   #5  0x00007ffff6ea7e1a in g_assertion_message_expr () at /lib/x86_64-li=
nux-gnu/libglib-2.0.so.0
>   #6  0x0000555555f45732 in regime_is_user (env=3D0x555557f805f0, mmu_idx=
=3DARMMMUIdx_E10_0) at ../../target/arm/internals.h:978
>   #7  0x0000555555f5b0f1 in aa64_va_parameters (env=3D0x555557f805f0, va=
=3D18446744073709551615, mmu_idx=3DARMMMUIdx_E10_0, data=3Dtrue, el1_is_aa3=
2=3Dfalse)
>       at ../../target/arm/helper.c:12048
>   #8  0x0000555555f4e3e5 in tlbi_aa64_get_range (env=3D0x555557f805f0, mm=
uidx=3DARMMMUIdx_E10_0, value=3D107271103184929) at ../../target/arm/helper=
.c:5214

I investigated this yesterday when Catalin reported it
and sent a patch:
https://patchew.org/QEMU/20241017172331.822587-1-peter.maydell@linaro.org/

thanks
-- PMM

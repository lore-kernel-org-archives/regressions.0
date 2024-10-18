Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D5032010FC
	for <regressions@lists.linux.dev>; Fri, 18 Oct 2024 10:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729246965; cv=none; b=QJMSfZeT0PtXoRSSrY6FKo17BC6YAsSNmecvNtkwzdHRzCkLOd9IJfge/68ccYyixOuLZtxXR7nhBLWai5xd40EPTiw9DFhTb/GEjDn1/A7pFC7k7MiR1bJafnrLexwgY+iU0xsdFTccOvxOhFJWaGGJh+fZdDw0sDRNseObWVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729246965; c=relaxed/simple;
	bh=hENYqMpWSl5cgEjc9ivpwcBWhkrp3Y1gODvqXV+r5zM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YBeCAStF21n9ayDQDkRcSQp1bDvZfqjFT0/qbP5cYfNjSst69A1chV1/ygJQ/3sob0rX9OduazurzG0x753mKRtZuehBOstc6a77w0mHxmCmV+9mFQ8o1/Jkz844Am/HPEei9CtdVq6gRLVZgmXplqHQciehjIkNTp6F4HqBf1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MP8q5TNZ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MP8q5TNZ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4314a26002bso20338135e9.0
        for <regressions@lists.linux.dev>; Fri, 18 Oct 2024 03:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729246962; x=1729851762; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JvdD1zvR7pitmvPu5UIzdTzIQaO+R+2TKdsKCLTLB+w=;
        b=MP8q5TNZJfyfJxLdZtzBaiFWyTFzso24C5rpnN1aXkBoFHgMN5bK9DhkecITj5EGk8
         v511oMp3VOKvvsQiuUtxqMLGJlUF9vr7gxNnWWHtv1Nle+LcN2jvS7dOEaXbuQi6H+HN
         t1dQTVLAYoiSH44pY2QW08ayHUDZZ9OiPFhATYwYfT3hIi1u+ZwgLJe4J2wVqI7mfMCn
         hW3vCcz6M8V9lsAMtSCr7qIiL9+S1crrJTR8jFbtEc/fx6nWb1e97HB6JN59tB0uawUN
         8rG4RMpHHES1z7V9l5ZxtsgO8nFJ8U4E30WsAbJDx6D6LGqkRx7A5f+ZiAH36M920p1z
         23Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729246962; x=1729851762;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JvdD1zvR7pitmvPu5UIzdTzIQaO+R+2TKdsKCLTLB+w=;
        b=BQDzRamgz8ZpZ0UhRh9Ag8XvtrxT+INv/80tf2hWySpCjvB7ngcXOiEAIlyyyVOSqV
         jzgl6C6nWeFmr677YDzawIatwGI/nMvw+qIWHt0g2Vv422bctFfaW+oZVAAHY+s4MqG0
         i+sJyZTc8yQRioWxcRy0g78980ReXKy+vrmoZpDyGtubZ8VhXiA+8RmMZ6DsIh0/XLwS
         d3yMyrqMAk2ih173p/EeQNov4Yr8Q3dFYh5TwwfzX+aeGTun2iYNvwAhlAHUgAff3S0i
         msO0gNyEZHiMqRSk+pzp1Szx1fiIEVr/RjqkKtTGNXLRDpgNPzJqIq/0vTM1W89gpiBG
         /2Qw==
X-Forwarded-Encrypted: i=1; AJvYcCVWnB/bQUgPKSSK627UdivWZycuZCXdmK8Kn+TKAdZ/CaefDth3yerZUs8McemeTC/cZPklDuIrHvHTYw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1CZGxoAjNDSoAxEc930kh8xU0nN0FJ4J/Oa1UB9x4UjJ8WhQI
	4lpLWkQ9u9fWIkwW9FFIekjX7kWPHo62v7sknyq6om91ObCZfSW31BiQxrcdpwA=
X-Google-Smtp-Source: AGHT+IHCQcQAOeIFmFjqShlV5pLAgzEU9dc7dJq9mnMndfU3VrQtYqTb6xx9TFAcF6AySuy6pyE1wQ==
X-Received: by 2002:a5d:63c8:0:b0:37c:d2ac:dd7d with SMTP id ffacd0b85a97d-37eb48937f9mr1160741f8f.30.1729246962430;
        Fri, 18 Oct 2024 03:22:42 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf0ed5a5sm1543061f8f.74.2024.10.18.03.22.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 03:22:41 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 18E825F863;
	Fri, 18 Oct 2024 11:22:41 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,  open list
 <linux-kernel@vger.kernel.org>,  Linux ARM
 <linux-arm-kernel@lists.infradead.org>,  qemu-devel@nongnu.org,
  lkft-triage@lists.linaro.org,  Linux Regressions
 <regressions@lists.linux.dev>,  Catalin Marinas <catalin.marinas@arm.com>,
  Mark Brown <broonie@kernel.org>,  Anders Roxell
 <anders.roxell@linaro.org>,  Arnd Bergmann <arnd@arndb.de>,  Dan Carpenter
 <dan.carpenter@linaro.org>,  Aishwarya TCV <aishwarya.tcv@arm.com>,
  Richard Henderson <richard.henderson@linaro.org>
Subject: Re: Qemu v9.0.2: Boot failed qemu-arm64 with Linux next-20241017 tag
In-Reply-To: <CAFEAcA-39GRpvy5LOZSJL3=9FMspAq9c8GUtHv9CP4jU2uFi1w@mail.gmail.com>
	(Peter Maydell's message of "Fri, 18 Oct 2024 10:48:02 +0100")
References: <CA+G9fYvx05D7TfRjvdPtKM9iWS6i7b-EHuBAbHEQghvMEg221g@mail.gmail.com>
	<871q0daglh.fsf@draig.linaro.org>
	<CAFEAcA-39GRpvy5LOZSJL3=9FMspAq9c8GUtHv9CP4jU2uFi1w@mail.gmail.com>
User-Agent: mu4e 1.12.6; emacs 29.4
Date: Fri, 18 Oct 2024 11:22:41 +0100
Message-ID: <87jze590cu.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 18 Oct 2024 at 10:46, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> Naresh Kamboju <naresh.kamboju@linaro.org> writes:
>>
>> > The QEMU-arm64 boot has failed with the Linux next-20241017 tag.
>> > The boot log is incomplete, and no kernel crash was detected.
>> > However, the system did not proceed far enough to reach the login prom=
pt.
>> >
>> > Please find the incomplete boot log links below for your reference.
>> > The Qemu version is 9.0.2.
>> > The arm64 devices boot pass.
>>
>> Can confirm it also fails on the current master of QEMU:
>>
>>   #0  __pthread_kill_implementation (threadid=3D<optimized out>, signo=
=3Dsigno@entry=3D6, no_tid=3Dno_tid@entry=3D0) at ./nptl/pthread_kill.c:44
>>   #1  0x00007ffff4a3ae9f in __pthread_kill_internal (signo=3D6, threadid=
=3D<optimized out>) at ./nptl/pthread_kill.c:78
>>   #2  0x00007ffff49ebfb2 in __GI_raise (sig=3Dsig@entry=3D6) at ../sysde=
ps/posix/raise.c:26
>>   #3  0x00007ffff49d6472 in __GI_abort () at ./stdlib/abort.c:79
>>   #4  0x00007ffff6e47ec8 in  () at /lib/x86_64-linux-gnu/libglib-2.0.so.0
>>   #5  0x00007ffff6ea7e1a in g_assertion_message_expr () at /lib/x86_64-l=
inux-gnu/libglib-2.0.so.0
>>   #6  0x0000555555f45732 in regime_is_user (env=3D0x555557f805f0, mmu_id=
x=3DARMMMUIdx_E10_0) at ../../target/arm/internals.h:978
>>   #7  0x0000555555f5b0f1 in aa64_va_parameters (env=3D0x555557f805f0, va=
=3D18446744073709551615, mmu_idx=3DARMMMUIdx_E10_0, data=3Dtrue, el1_is_aa3=
2=3Dfalse)
>>       at ../../target/arm/helper.c:12048
>>   #8  0x0000555555f4e3e5 in tlbi_aa64_get_range (env=3D0x555557f805f0, m=
muidx=3DARMMMUIdx_E10_0, value=3D107271103184929) at ../../target/arm/helpe=
r.c:5214
>
> I investigated this yesterday when Catalin reported it
> and sent a patch:
> https://patchew.org/QEMU/20241017172331.822587-1-peter.maydell@linaro.org/

And here was I thinking I was being efficient ;-)

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999A5199934
	for <regressions@lists.linux.dev>; Sat, 22 Feb 2025 15:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740237271; cv=none; b=BaNCOHsQawZeGqQ5eV+w7am6faguVvdoYyKJ8Ws8wHzHjFmOsbdt36+pV1oe1uwU7V/rUuJ6gEmwTvG2W6nCZ9JN+lxh76CXcygzWckm+ithGW9au+JPYwWxtDan1TaWl7CTcuFrO14N/abZHCM5chdFmFWRbROBu/NS87G3oto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740237271; c=relaxed/simple;
	bh=gb4Sl+NAFfnDd3eu0lMM0znOWH1iZWbVNbCdUr6/vmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rhtNAZn5WHFJYGYU26bLg368uNAUji22oCM+fX2ScHd7yJKHiRePIUcPFwqSbpMxHkuXVda9I3nnP+Rt/ZDNAJi2ChDwFaEfJTcQ7HCb/AlomFpG64Z+0cyscA+ghpwsqgeOw7C/z3y1TJ6kYVFgO1UAo+jWSIBEthDYbfj0IDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KrQ6f1Ww; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KrQ6f1Ww"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-54529583c39so472183e87.1
        for <regressions@lists.linux.dev>; Sat, 22 Feb 2025 07:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740237268; x=1740842068; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gb4Sl+NAFfnDd3eu0lMM0znOWH1iZWbVNbCdUr6/vmE=;
        b=KrQ6f1Wwqde+409g8XlN0KWMVapuuTgHsPvjICEJjap0KeDmAtmOEQC+eCc+MzDx7l
         71GAExez23Dltd1kxD2fDoaIfp1HucRx7x6jtYaZhwZ4Wx4Owq3gWXf9o0WDWydj5L8m
         mne4y7CeSse2kvCu3EDuaXpXH/i17TmxH+mPVbNqug4Z0LFMqWY6kUATqnwn0piWlepH
         VrBn2sh/3+p/fWKqDGPwWDK6dMf9g6/BTMvrF7mOyRraowS7c+DkAp3DHS12onwxJiRT
         p96zUDTGLw/zuAT1MrfKUP6zcTTPg6xhhlie64Zi6KsbwDXK0oisxOwLco76bh9JbTYd
         UPMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740237268; x=1740842068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gb4Sl+NAFfnDd3eu0lMM0znOWH1iZWbVNbCdUr6/vmE=;
        b=HD4Ijfd1Xxiq94PKokWh4EyaOAjPAxUyFu8+DtYMwWFBWspu5CPxz884jMESF99E/P
         /3NDf5TXR270tHdsnEQ6hVFSOmwhuWu6vuQIo/mm3IwzgM0a9HY7dNY3Rjaf/rPUhHkX
         /slaTzENf5lTTnc5i4tsqG5Sw4t5VrMJ8axzRNO/f3sXZkA1qRW9azxLVaci4i71zMKT
         CfiXzVxRTW/BzRlXk9ePe6SG1lVxap5rkzfMUQ7WGJMc08iCm68ex9Na1HxE8wiVwAoB
         SwI7d/DeYcwMbwuynLbzYc94pQidHJECKNSfkkHU+g0XJy9el0Y8dA8kgC5hcyxJ0E2z
         lr8g==
X-Forwarded-Encrypted: i=1; AJvYcCVqhrtAT9NYP+Kr02+sGxZJim0FXREu96y9g6KOe0/bAfDykd8bkR//8WaXwiRr03YunwhvzYmhjet//A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2GFh7Smi32sSmkKTeIJ1H2kjv5xYr1omdKYzU1IhY5P+vvQ3r
	p+xPy2BIEpUM2q+bSsbdvA8ljrjKFpUwIFi2J3C8FmDQIHOZYEg0tjGU8A8CZWjWwsfmQZdVQJ/
	E5SDdOc1pyQTUrIqNR3fELVWu0ao=
X-Gm-Gg: ASbGncvUl6bqFkepDfPlsnPKyUvliMGLeYAsK4Iyr0NpDI+zfZZ8bPB2fLy2PMGADYL
	5X6P5WINysd3mulnWR5ptqRfXhDy72u5U1lZX5Iq4IhSu7ZWzTMNmzKh5DfMq8qQvc24pjarlAL
	m3gs0c98U=
X-Google-Smtp-Source: AGHT+IH8Tym24vcrnRxEuyslXSwW3y9ZazTyaHZg3gYD5Yy0qwHtZLgjrL5WHKrpGR42kgpwlimOtJGd7bnoDbYEgQ8=
X-Received: by 2002:a05:6512:e99:b0:545:2fae:cffe with SMTP id
 2adb3069b0e04-54838f5a573mr936010e87.10.1740237267476; Sat, 22 Feb 2025
 07:14:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ef950304-0e98-4c91-8fa1-d236cbb782b8@disroot.org> <CANiq72=WyQdQfoOeb_mK=J_5GtiWBenqzA+mOr=8mN8OTWPB-g@mail.gmail.com>
In-Reply-To: <CANiq72=WyQdQfoOeb_mK=J_5GtiWBenqzA+mOr=8mN8OTWPB-g@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 22 Feb 2025 16:14:12 +0100
X-Gm-Features: AWEUYZkDVyQ7F4Gp9ybyNiW1F1rAJPNqvAp0Zrl2cJ0pS2ctF7P1QLlwfAuRl3I
Message-ID: <CANiq72=gJCauuTv3_+vvHU2r=nFpKCdL5tsjS+mj7Ttqra5oLA@mail.gmail.com>
Subject: Re: FTBFS: Rust firmware abstractions in current stable (6.13.4) on
 arm64 with rustc 1.85.0
To: NoisyCoil <noisycoil@disroot.org>, Danilo Krummrich <dakr@kernel.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, ojeda@kernel.org, 
	alex.gaynor@gmail.com, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 22, 2025 at 1:20=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Thanks for the report! Yeah, I noticed in my builds too but didn't get
> to it yet (there are also a couple Clippy warnings in the QR code too,
> in case you see them).
>
> Cc'ing Danilo in case he wants to send the fix, otherwise I will.

s/fix/backport -- actually, sorry, I just sent it.

Cheers,
Miguel

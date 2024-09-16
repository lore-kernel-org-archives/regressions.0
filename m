Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA885136664
	for <regressions@lists.linux.dev>; Mon, 16 Sep 2024 19:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726514623; cv=none; b=RcCXugdPbIJfRTqxfirh8oTN+H4ZWh8zpR5+tzbbOFX/XvSnmlmX5sxHylBmtbS47hi02TYsGdysH7qRBvlzrjDqCiFfp9CIsUJ9aEKg6H/m8c4Bgt5TnwCPp1MhBuYMW3sUMk4+zgcvEJsWQuS/LTFVVwFbG4MqSRzaKxUCJ1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726514623; c=relaxed/simple;
	bh=eNDNlenQ55wq3OU9jE97F/r798BG32rPjmyy5X4VSQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A3DMTwLYr7QBvvIeV6+F/KqTk4iVRNGiOkMdOZwA/SWcJEENP6gFIAYchlS0krU3qJIwzPVlY5cKBn/1huuK4Rm2QDcX+D9SV/VrtX9y78le7cHKI5FP8yrU845B/ddTdBgAcFUWVGtk1UebN5XCcDZ96Ir4ZFfKsVh/PoSc1kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JWFdekls; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JWFdekls"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-718e65590easo410512b3a.3
        for <regressions@lists.linux.dev>; Mon, 16 Sep 2024 12:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726514621; x=1727119421; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=foWXsdfvXW3kM0+CVvXUZRQOzmZiK+RDiPeNZHlJE8A=;
        b=JWFdeklsaITKE0aUeCmdtRexOBQLbVzyz8xxtsvYKt4Tq+hOStk8nWcdnBWSscz7nZ
         7/5uN63v/Q1jLLbuSksXUMrLXruehKQrtu+VSkXN/a58/r4Wfgj7oNlmw9Mg403e6VAt
         WZyFZioiFvHVsJmuWIqgIQHSmbM4eOFXgxxsfwglle/A7rxJRc+cOtlvXF0ugtFlBXMe
         A8PpeBtGvCtjsijNuROyjslM7dCC3vHcX9njIRAPh9WgtmxK80crwI4fuybd0ibpybqd
         yeadocKaR/hGtaaPHpeJh80lHDmcpZ7Qm3D18DULOva6pKHcXhqHgWElbuawYiCA8LOR
         ONiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726514621; x=1727119421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=foWXsdfvXW3kM0+CVvXUZRQOzmZiK+RDiPeNZHlJE8A=;
        b=t45PnW0LhR1UPys245qGUZvBUyIXu9wraMRkvOPX6yjGksOWRpH01FtNOIHnknDR9e
         NhnHFgb+/x43m53J8UZuT5nD+Z5vIWaVv/IaUR8/KPQWFQ48jJ9dP4Zb+JjCuUEtkWMB
         lW7VNHF60wGupQPVoAIHk/CEr+EzAuLkEBpBTsPJOUXp8QQZTYHqRHQRATzZgd3bH8jK
         rSDapLArq09ImHwVJD4xPH1paLk6NiB5ZhUfnXXH0E6cGe+kzMvTs2haz5WpnOGmp9jQ
         rOdJeeQ8GficQmqOAsQNL9NEVhl8CSHZsdqvBQEPwlSn6MQzJc3cskqw8BqysG5xlI9Y
         +UaQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6OLAWNdetwj1fAGHeW7Gcik4LI8Csn0RKmPShE85WooNdPupQFjHy6ZNaGXLqb4bRBtJhUvIKr41ASA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyFWF/ZzWI9+olV9w+MXjjvn7yJedxLT+zUyuYGuJlYsURweYl6
	UJ6QlQhnqpCt2OI9662kh+vAlBjjh2XanPoe8n+WtEsdboxT5NQqh17xaNvnduAgYb3iWS/1KJo
	xOKOGSncwJ+N+uKFvbTbi00E6bDM=
X-Google-Smtp-Source: AGHT+IE7DRhJ+wg7wlbPODJvQQTOCMwvp+3FoQzGpOHy6LDZVVh093NafbDs/OOEt5XjGoPIpmBLlqaM0zneI2fo6eg=
X-Received: by 2002:a05:6a00:2d88:b0:717:87c5:84b with SMTP id
 d2e1a72fcca58-71926088d53mr9934593b3a.1.1726514620830; Mon, 16 Sep 2024
 12:23:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYuaDUCxseqCW8BO0KhLKn6F0VHYaAhu-T9v-MJHzJebcQ@mail.gmail.com>
In-Reply-To: <CA+G9fYuaDUCxseqCW8BO0KhLKn6F0VHYaAhu-T9v-MJHzJebcQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Sep 2024 21:23:28 +0200
Message-ID: <CANiq72kaAd5v+c+A3GHWp9riDtGTrKcCb3kraw2EaZLyp8asSg@mail.gmail.com>
Subject: Re: rustgcc-kselftest: error: unknown unstable option: `patchable-function-entry`
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: rust-for-linux@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, Miguel Ojeda <ojeda@kernel.org>, aliceryhl@google.com, 
	Shuah Khan <shuah@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Naresh,

On Mon, Sep 16, 2024 at 9:17=E2=80=AFPM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> The x86 rust gcc builds failed on the Linux next-20240917 due to followin=
g build
> warnings / errors with rustgcc for selftests rust builds.
>
> First seen on next-20240917
>   Good: next-20240913
>   BAD:  next-20240917
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Thanks for the report -- this should be already fixed in `rust-next`
for tomorrow (requirement changed from `!FINEIBT` to `!CALL_PADDING`),
please see https://lore.kernel.org/rust-for-linux/CANiq72=3DB9NmC=3D1eSaOrg=
7XutjueQsSXGcBQb7dQFPuL0SFjPsA@mail.gmail.com/

If you can confirm it is, that would be great, thanks! i.e. you will
need either to disable `CALL_PADDING` or use a newer Rust compiler
version.

By the way, I think you meant next-202409176, not next-20240917?

Cheers,
Miguel

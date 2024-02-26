Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6738312E1FF
	for <regressions@lists.linux.dev>; Mon, 26 Feb 2024 17:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708968813; cv=none; b=irIDHeocveV0ocIQ2jbfzdKe2vOflatcSaixNvIwI31w7pwn/v3IPTR/ts8Ul6hx98OJqcbh90CPAxDQXdsT0uUX/s9oiwtazKqRMumApHSe6rQEvYEXWvNLOLIzz5UiXIujvVwJ4gJFqyFOLgA1zEARoPKbq/uJu4Jy/w6sdqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708968813; c=relaxed/simple;
	bh=jGHNHxme5qjpR55RWTekjqcx02Y2QJMOPfL+qTuvjKw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IZNyCkjaXrNwf6WA2PTvF23RXnz+fY+ZEPWSeZNAGBZHcInO6UeQTtbeo5bazqAz3jRzHQB10JWJfnnc2Av0iuxRhOfQtMUmgmqPpiyaOyK/beoV7GbSVaKS899MP1016hMS6FOAfHtknKbtSBu0cK09TOTRFjm43BuBx7FuGLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=FgCKpv69; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="FgCKpv69"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-565c6cf4819so2783038a12.1
        for <regressions@lists.linux.dev>; Mon, 26 Feb 2024 09:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1708968809; x=1709573609; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=B+DSV5t8g8pZijgxO3dOQk/2ugtI+XLO7xzncKpdXFs=;
        b=FgCKpv69ElGrJnPweLmpDe+6geuXCB9BE47nOzNAZnp67zgXwypMPApSCDSKm3rwVN
         GcCxNv/19eEDtYXme/qyyQ0uqSHZ9eO3fGk7H3vevnzjhc8YDUFiXwNioHkkivJ9b3P/
         xDGVQ+kg8gwu0xgmUDR+SaOmyA1AdQxoMdoO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708968809; x=1709573609;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B+DSV5t8g8pZijgxO3dOQk/2ugtI+XLO7xzncKpdXFs=;
        b=FJ6niiZ3xzT2A+JgFHYWaGbyoAZmaAcY1VAtfHZc+9mC13VKUJFgPFIkbU5JrzWIWL
         pkZVVsaXPWT7Z5mZ7PXhjjZa9J8y47+b4miBgMBzFYvq/lCCo2RIM1HEXbSKGUYoGG1M
         QytXnUxKzRJPLDN7JuxCnNtL9M4V1zXWn6OV+41PTMkWyNqVlRdP4JHsgggg06MIgFVt
         qcHFU3qxkDAio2sNhNIBl13l1Hz0/kSGUzHgaG+n0WIAVFKIKg/Uen2cSzNgSbALOUFy
         +l0VCLJi1b7VWmTvP93E4PL41DWFJT7P9phWrqLxN7o0tohPrZx/IAeC55gRRmnULwmG
         5y6w==
X-Gm-Message-State: AOJu0YwFa6mfY3byv7rW1OJ+U2fJ+onMzllK9CKfXu99u0ffe13GQg5b
	Qb38yHtcQ9EMnzBrM7ZCPAQjEIt30vf2IBIYrW7+QnMTQfXhpIophiYx/iGOnGi465yk35BliT1
	+rRoRQw==
X-Google-Smtp-Source: AGHT+IE2uPPk9bgYGDNC47hPPblYKIpx78Ve8Y2gwKK4H78n0OrwZr4BEaIKjZRVTkqs3QD3NKlCmw==
X-Received: by 2002:a05:6402:400c:b0:565:2ef3:e017 with SMTP id d12-20020a056402400c00b005652ef3e017mr6544695eda.4.1708968809663;
        Mon, 26 Feb 2024 09:33:29 -0800 (PST)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id fk23-20020a056402399700b005660742bf6bsm782271edb.52.2024.02.26.09.33.28
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 09:33:29 -0800 (PST)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a3ddc13bbb3so502905366b.0
        for <regressions@lists.linux.dev>; Mon, 26 Feb 2024 09:33:28 -0800 (PST)
X-Received: by 2002:a17:906:3b0e:b0:a42:f194:9cd9 with SMTP id
 g14-20020a1709063b0e00b00a42f1949cd9mr5608776ejf.5.1708968807997; Mon, 26 Feb
 2024 09:33:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <170886726066.1516351.14377022830495300698@leemhuis.info> <5ffb73e0-4b00-4bbb-857a-30a48945758d@leemhuis.info>
In-Reply-To: <5ffb73e0-4b00-4bbb-857a-30a48945758d@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 26 Feb 2024 09:33:11 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiHmYxCP36ngovZimX9sixWxMrGA_WZdYyE8JPqBQ6ysw@mail.gmail.com>
Message-ID: <CAHk-=wiHmYxCP36ngovZimX9sixWxMrGA_WZdYyE8JPqBQ6ysw@mail.gmail.com>
Subject: Re: Linux regressions report for mainline [2024-02-25]
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: LKML <linux-kernel@vger.kernel.org>, ntfs3@lists.linux.dev, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, 25 Feb 2024 at 06:21, Linux regression tracking (Thorsten
Leemhuis) <regressions@leemhuis.info> wrote:
>
> Sorry, forgot something: there is a patch to fix a ntfs3 build problem
> that was posted 10+ days ago[1] that didn't get any reaction from the
> ntfs3 maintainer at all. Given the history of occasional slow responses
> for that subsystem I thought I'd let you know in case you want to pick
> the fix up directly; but if you do, consider using v2 of the patch[2].

Ack. Picked up directly.

               Linus

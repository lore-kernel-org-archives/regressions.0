Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E5F2C9C
	for <regressions@lists.linux.dev>; Fri, 11 Feb 2022 00:02:24 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id c6so20234282ybk.3
        for <regressions@lists.linux.dev>; Thu, 10 Feb 2022 16:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6amdZdKfUfxoy5toKt49P0SHUxAj1DnsrZFrMaxvyJI=;
        b=D7RIFrpCEJQ0wQuEprUdX1acbuAgEexUqcq/lvB14jnOS5ogi4JDn/yVt37yPAdUMv
         cdG+nJNyOiGBDs3Q7oBoxOk7+iJSjIOlc6+IK2Bo0YF1NfrU7itoVPmXEYUvDhcqcaYB
         hN3zRzKzMppQgi6wfwPJ1m5WBsBSndmRbAyqYA6MlnovRWIZxiveV6bMATOtuXsQHLVV
         W8L3zrILKJNEnsKWMLf7ddGjcvQycJkut3j1TnkMzJUBHpWRzZgrreAbRmWW+jFZjIXv
         jBuuvqDKDT8EzktRiQkPY1LS+so+kqF8V0hVR+kwNWdVS4zgqM+IL37eryTfYMXXMUKG
         duqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6amdZdKfUfxoy5toKt49P0SHUxAj1DnsrZFrMaxvyJI=;
        b=tKySt9ed2XNH/aWMpre64z5e5T04X8na3ilrcqke0i1lRud0jxxRel68llw/Bv4QZH
         PtfgsiO8aqWysJ0I/ELizxPlqPtbG71LlUtdzSdtCEI8tHDWNYE4g3z6CpcubVlGhtjh
         piDb3EyvJq0nfEgqcwnZUMEPsh9Qi42DQL/CLPY7NsqT8qXsyrz1N6xxGp8ZwO+mDAuH
         NNDLNkQBNXGpTUyWcvY6LLxM8817tipi2ZYwvSrcfAjsN4EOomZFM6v3iC8dtu+yfPT/
         ZlawrGhsES8R3aKYrTgF3wT7OqxfClPaYMpdQ9Bh/OqkzZsJb9ACnwoqyeKCAq2SY8od
         jHeA==
X-Gm-Message-State: AOAM532aNuWpxUUAlgp+KqveMuhEGMslS3LcTAx/RwGrWMg13t553S1F
	4bJDyqX8un6OtgwpVD2IT88rbcPhfmZg9w9dqQ9E+Q==
X-Google-Smtp-Source: ABdhPJz8e25o2s6cN31+acUzC45sbRdhVmC27Ml34E9Ew1Pqg581u0yFka+g4I69kuUy5l+0FIhMy3qtizaDRqxhAvA=
X-Received: by 2002:a25:684a:: with SMTP id d71mr9513602ybc.284.1644537743422;
 Thu, 10 Feb 2022 16:02:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211217153555.9413-1-marcelo.jimenez@gmail.com>
In-Reply-To: <20211217153555.9413-1-marcelo.jimenez@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Feb 2022 01:02:12 +0100
Message-ID: <CACRpkdbzk55pmK9XMwc470O8vJFUBQ6zs35shOYCFKr+YaOezw@mail.gmail.com>
Subject: Re: [PATCH] gpio: Revert regression in sysfs-gpio (gpiolib.c)
To: Marcelo Roberto Jimenez <marcelo.jimenez@gmail.com>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	Thierry Reding <treding@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Edmond Chung <edmondchung@google.com>, Andrew Chant <achant@google.com>, 
	Will McVicker <willmcvicker@google.com>, Sergio Tanzilli <tanzilli@acmesystems.it>
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 17, 2021 at 4:36 PM Marcelo Roberto Jimenez
<marcelo.jimenez@gmail.com> wrote:

> My system is ARM926EJ-S rev 5 (v5l) (AT91SAM9G25), the board is an ACME Systems Arietta.

Which devicetree or boardfile in the upstream Linux kernel is this system
using?

Yours,
Linus Walleij

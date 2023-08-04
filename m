Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4523D1AA6B
	for <regressions@lists.linux.dev>; Fri,  4 Aug 2023 17:52:33 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-447805165e9so1038934137.1
        for <regressions@lists.linux.dev>; Fri, 04 Aug 2023 10:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20221208.gappssmtp.com; s=20221208; t=1691171553; x=1691776353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hKhuaPvhv/FJQGJs3SnWgGcCp1xME/oZLELOSvk67M0=;
        b=phYN/2eO1zMae8aMPb70lr/r2z8I/TfzXHHZhjztwJ8artAqBgsJmWX0N5dpJNx0O3
         rzbRZKpQqkmRa/n5/I5x05zXxoNsIFA0TghC2USi2D4UlS+ROnSUsMCsjqhsKZkIfnjV
         knyTPzz+1cIJaololyZRXU7TnKRRBk4ABM0seEdyxz9l4JdDcbwycdbNQ0OC6Qhy7kdd
         CYy22muOjdZ7BxrLGp0p2hKo6y8xZInPsOyqRPOpJmikQrvgpQxxKAOnGN9JBrG4Wljz
         2rCjy4xzgNusTB5HjVnbOBPb0zId/tYLS9XshI88skvbUWOHqhB2RM5bO9ch1LgALSaK
         QhcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691171553; x=1691776353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hKhuaPvhv/FJQGJs3SnWgGcCp1xME/oZLELOSvk67M0=;
        b=IhudDYQ5oaMhKj9wflzgUASlwG87zpt8lUaQY5MrMuzHqguLp39rYBwkk/8Ljsfi2m
         EtOJIUGX565S7HBh/d844FQUuI966OGt+seSMJEpU+UeJ0WK59z+Z1A1XP+w1UCZGnUy
         LSGlULF7NT3tcp94qoGqkyVU5JlYVxZkMjOGa6wAUyfJcTFiykrFak8iU3ARSPNpMiD7
         7953h69tzYWUBp3WN2hhGfW1z4JqjvZVlOPfXhV8LpreR+QmNwrXhyUf8XF+hkEt0NJP
         gyqiiWuMD3Vcx3bPbMGXuf26J+m50/yVWgQQ3Oi8NAW0XuANxsznYMdYBareQSR2Adxi
         Cc1A==
X-Gm-Message-State: AOJu0YwNYWI47toQvspUiL4fbGfjdW9pVEDI6li4SytjZGp24ZRRMBC0
	d6vGGHU65ci5TiQneH7PBJB+f9tbs/kChmR0oiI67w==
X-Google-Smtp-Source: AGHT+IF8UqRFqWtwNUNQ1Q+gp7qMomGV5R3bGxEcvNI9aTl71Vq1v+XRJe3MetIwOu8vDb8niCq8yY7BwGzYetWOVjM=
X-Received: by 2002:a67:fc03:0:b0:445:4996:1d27 with SMTP id
 o3-20020a67fc03000000b0044549961d27mr1865469vsq.3.1691171552903; Fri, 04 Aug
 2023 10:52:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:ab0:6209:0:b0:794:1113:bb24 with HTTP; Fri, 4 Aug 2023
 10:52:32 -0700 (PDT)
X-Originating-IP: [24.53.241.2]
In-Reply-To: <CAL_Jsq+N2W0hVN7fUC1rxGL-Hw9B8eQvLgSwyQ3n41kqwDbxyg@mail.gmail.com>
References: <CADyTPEzqf8oQAPSFRWJLxAhd-WE4fX2zdoe9Vu6V9hZMn1Yc8g@mail.gmail.com>
 <CAL_JsqLrErF__GGHfanRFCpfbOh6fvz4-aJv32h8OfDjUeZPSg@mail.gmail.com>
 <CADyTPEwgG0=R_b5DNBP0J0auDXu2BNTOwkSUFg-s7pLJUPC+Tg@mail.gmail.com>
 <CADyTPExgjcaUeKiR108geQhr0KwFC0A8qa_n_ST2RxhbSczomQ@mail.gmail.com> <CAL_Jsq+N2W0hVN7fUC1rxGL-Hw9B8eQvLgSwyQ3n41kqwDbxyg@mail.gmail.com>
From: Nick Bowler <nbowler@draconx.ca>
Date: Fri, 4 Aug 2023 13:52:32 -0400
Message-ID: <CADyTPEyT4NJPrChtvtY=_GePZNeSDRAr9j3KRAk1hkjD=5+i8A@mail.gmail.com>
Subject: Re: PROBLEM: Broken or delayed ethernet on Xilinx ZCU104 since 5.18 (regression)
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	netdev@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2023-08-04, Rob Herring <robh@kernel.org> wrote:
> On Fri, Aug 4, 2023 at 10:54=E2=80=AFAM Nick Bowler <nbowler@draconx.ca> =
wrote:
>> Oh, I get it, to include this driver I need to also enable:
>>
>>   CONFIG_RESET_CONTROLLER=3Dy
>>
>> Setting this fixes 6.4.  Perhaps CONFIG_ARCH_ZYNQMP should select it?
>
> Maybe. Do other platforms do that?

Of the ~40 platforms in arch/arm64/Kconfig.platforms, there appear to
be 5 that do select it.

>> However, even with this option enabled, 6.5-rc4 remains broken (no
>> change in behaviour wrt. the network device).  I will bisect this
>> now.
>
> It would be good to know why the deferred probe timeout doesn't work.
> If you disable modules, the kernel shouldn't wait past late_initcall.
> Though this functionality keeps getting tweaked, so I may be off on
> the current behavior.

I don't know about the deferred probe timeout, but I bisected the 6.5-rc4
breakage to this commit:

  commit c720a1f5e6ee8cb39c28435efc0819cec84d6ee2
  Author: Michal Simek <michal.simek@amd.com>
  Date:   Mon May 22 16:59:48 2023 +0200

      arm64: zynqmp: Describe TI phy as ethernet-phy-id

So, reverting that on master appears to correct the issue (together with
setting CONFIG_RESET_CONTROLLER=3Dy).

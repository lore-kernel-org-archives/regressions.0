Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F016C2CA
	for <regressions@lists.linux.dev>; Fri,  4 Aug 2023 16:54:41 +0000 (UTC)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-4474c7fce20so1011385137.3
        for <regressions@lists.linux.dev>; Fri, 04 Aug 2023 09:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20221208.gappssmtp.com; s=20221208; t=1691168081; x=1691772881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54IgYWW4ZMPvtaxEboRz9NGB20nt0nl5l0+8sVW/viE=;
        b=RkYhRqCBnlpbJc3F1PcsJLhqGkhfrA75zJTFAgKcANVQv1aOAvoBh3BgwCIGCDbgxi
         jXt5qs6zRhUu+PP8A7R0OvESoKJROFJb9vH5aHiNTmMJqUYbSMT/MAgrqDrkvghaT2Vs
         WoaQA8OY/8l/hqeNs7B4G+huqW8n26EI/b3TjRqUWPHjvjPyyBxQei+f6voYCQHk9wpP
         zRuoM+JszZ4m5WXvs38VretjXIV9lBiSJ7Ai54XvxMbO0u44hlF/Gk+U86FZ4gZZmpRe
         3LAc6221tSH07bq+P2GleS79z1WQ4ASFQAJ6LzU+UA8e6Q22Gs73JsenMl5/qLSzJbIz
         qtmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691168081; x=1691772881;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=54IgYWW4ZMPvtaxEboRz9NGB20nt0nl5l0+8sVW/viE=;
        b=iI5AxsOCC6G1J9qx2vxvKjBAUz6TShx+pwmhMT63YDzaCni/yvWJXHwEf+Ky0lMLA8
         j1xmHDKLbXd3uubWaJ80r4mVSUBkkFjBZaUf3a5ok8mGDxpatiewilXUY2FvSyxigD9w
         R9tLwZjmYhO+Ik7bCjojpqfRK/TOH//iaqbXPFfXJaJVtzEXaJMxnoD/3xDR2NBMmIIz
         UEDGNS+Tp20asoJqCug9v1zN/kowq7JsPFtvgeceTcTjTvxyw6PKyZpj1nqvO3cA4uPB
         dNgNkLoNmz3euQ9rHbpLKItVXotFBLBXQTcqUGsF59rO2xA/WQwcpQoyr3Thob4PGfXL
         NAoQ==
X-Gm-Message-State: AOJu0YwaGNcJUUIjO2SYYAm+2ayyT9tdZvqZnR/5yJIVzjih+qRtJCgp
	CNOcmN/115UMGxuZ/C7WHboQl7ymt27fK+11JWdSsw==
X-Google-Smtp-Source: AGHT+IHKs1OgapRWNM/ErWvi+4Hrbz+MQG8ZgaBq+vxKTIFeKiht3rQXF6DXqsfPORXrYYOopdR8+sG6KMVuWIJ9N6A=
X-Received: by 2002:a67:fb99:0:b0:447:8d49:bfe9 with SMTP id
 n25-20020a67fb99000000b004478d49bfe9mr1753068vsr.24.1691168080821; Fri, 04
 Aug 2023 09:54:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Received: by 2002:ab0:6209:0:b0:794:1113:bb24 with HTTP; Fri, 4 Aug 2023
 09:54:40 -0700 (PDT)
X-Originating-IP: [24.53.241.2]
In-Reply-To: <CADyTPEwgG0=R_b5DNBP0J0auDXu2BNTOwkSUFg-s7pLJUPC+Tg@mail.gmail.com>
References: <CADyTPEzqf8oQAPSFRWJLxAhd-WE4fX2zdoe9Vu6V9hZMn1Yc8g@mail.gmail.com>
 <CAL_JsqLrErF__GGHfanRFCpfbOh6fvz4-aJv32h8OfDjUeZPSg@mail.gmail.com> <CADyTPEwgG0=R_b5DNBP0J0auDXu2BNTOwkSUFg-s7pLJUPC+Tg@mail.gmail.com>
From: Nick Bowler <nbowler@draconx.ca>
Date: Fri, 4 Aug 2023 12:54:40 -0400
Message-ID: <CADyTPExgjcaUeKiR108geQhr0KwFC0A8qa_n_ST2RxhbSczomQ@mail.gmail.com>
Subject: Re: PROBLEM: Broken or delayed ethernet on Xilinx ZCU104 since 5.18 (regression)
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	netdev@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 2023-08-04, Nick Bowler <nbowler@draconx.ca> wrote:
> On 04/08/2023, Rob Herring <robh@kernel.org> wrote:
>> On Fri, Aug 4, 2023 at 9:27=E2=80=AFAM Nick Bowler <nbowler@draconx.ca> =
wrote:
>>>   commit e461bd6f43f4e568f7436a8b6bc21c4ce6914c36
>>>   Author: Robert Hancock <robert.hancock@calian.com>
>>>   Date:   Thu Jan 27 10:37:36 2022 -0600
>>>
>>>       arm64: dts: zynqmp: Added GEM reset definitions
>>>
>>> Reverting this fixes the problem on 5.18.  Reverting this fixes the
>>> problem on 6.1.  Reverting this fixes the problem on 6.4.  In all of
>>> these versions, with this change reverted, the network device appears
>>> without delay.
>>
>> With the above change, the kernel is going to be waiting for the reset
>> driver which either didn't exist or wasn't enabled in your config
>> (maybe kconfig needs to be tweaked to enable it automatically).
>
> The dts defines a reset-controller node with
>
>   compatible =3D "xlnx,zynqmp-reset"
>
> As far as I can see, this is supposed to be handled by the code in
> drivers/reset/zynqmp-reset.c driver, it is enabled by CONFIG_ARCH_ZYNQMP,
> and I have that set to "y", and it appears to be getting compiled in (tha=
t
> is, there is a drivers/reset/zynqmp-reset.o file in the build directory).

Oh, I get it, to include this driver I need to also enable:

  CONFIG_RESET_CONTROLLER=3Dy

Setting this fixes 6.4.  Perhaps CONFIG_ARCH_ZYNQMP should select it?
I guess the reset-zynqmp.o file that was in my build directory must
have been leftover garbage from a long time ago.

However, even with this option enabled, 6.5-rc4 remains broken (no
change in behaviour wrt. the network device).  I will bisect this
now.

Cheers,
  Nick

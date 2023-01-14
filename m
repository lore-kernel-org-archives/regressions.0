Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D24C801
	for <regressions@lists.linux.dev>; Sat, 14 Jan 2023 04:58:59 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id pa22so11797589qkn.9
        for <regressions@lists.linux.dev>; Fri, 13 Jan 2023 20:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QzBF4eWm48K1rkBM1tff25rPM9mkOGlP3BXDd2no/0g=;
        b=ISnPFHmkdBczqxmmixo9IxPacdtDygFymswcEMhVdVAG+u9tPgDzfAFICztw4HkLIr
         ZZwqtrW+skkIno7ljRS1m1LH4KeR3LSS+2gd8sSmE7tEuuqNP+CXNk5NXE9NJrMq8+K9
         GxTqZBLn+ZVJVeb9Y8w9bbyLY7SsyiSHNVAW5vlMCzJEvcph6vfW1l70NCHuxI5uSTqh
         Bdf3RpZ2Hmya+vBO7iMxdJ7O7v9NOjMdjZYq7HSBbNXjbAPIUvUcv+zxiOIZvNdd1z3O
         up6e4BfumsdomJiDhZQLUWxui0EdWk+9z34J8HoTZZkvRhO8HHLIdApy34bV/I8ZEHD+
         JrLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QzBF4eWm48K1rkBM1tff25rPM9mkOGlP3BXDd2no/0g=;
        b=05HpAAUbr19E8lNO53Co/Sfntk5+np1cnsoZYnKpy85B7EuCPujO+/O2fsd9oGJI6S
         aKXPq8b3nbMSDWaX6fo3OPXnLgyqXb4Glx6ppcM33UWLljHQAhtCHDScIMl9pE+WeH+3
         f1VGQ6fcRoRKg5I/En7kXUGYUyyIcD/UzlozTfA3ISiZ0qCJ1k5bIGONOJqB/DJTTADn
         B8qgFg0By60Ep1dGXF5xCcNFGrFnezMkRnrcFpz1sCRv/8Znc8aIbJgHdr1deYCvk4eP
         xp20XVTnt/DUk7M1+9CnYvDcV2jScHNe//19Qq10aewTp9Dv5OmeeB8jLL3D+Uc+Isl6
         2l4w==
X-Gm-Message-State: AFqh2kry2LHE7atbISZaHsc1hZLQ8VV5ReZ5Mty0NEi+zwwxvGFm4fbz
	v4ejQRo2S6c3Mnx209+tH7FA/I6Pi4WyifUId1aPweK8bJY=
X-Google-Smtp-Source: AMrXdXvuQQzygfW99KEhhj7+yRWXI1G2dqqdpnuzY4ku9nY7rYRTeODRxLC8RgAFOlsZcidOVieFqPJXVeLfnnuLHiY=
X-Received: by 2002:a37:9447:0:b0:6fe:ae3e:418d with SMTP id
 w68-20020a379447000000b006feae3e418dmr5106283qkd.170.1673672338367; Fri, 13
 Jan 2023 20:58:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Matthew Fahner <mdfahner@gmail.com>
Date: Fri, 13 Jan 2023 23:58:47 -0500
Message-ID: <CADsncqR2mTUArTv2HhRnsfmQx5iNgUZo=JVgkUcZT7MtjxEoYw@mail.gmail.com>
Subject: Second Monitor Issue on Kernel 6.1.5
To: stable@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

I'm running Ubuntu 20.10 and experienced a regression when trying
kernel 6.1.5 that was not present in previous kernels such as 6.0.19
or 6.0.9

I have two monitors attached using DisplayPort MST (daisy chaining the
displays).

Normally, this works without issue and both monitors are detected and
display properly.

With kernel 6.1.5, the second monitor (the monitor that's not directly
connected to the computer) was detected but would not display.  I
didn't spend much time troubleshooting the issue and instead reverted
to 6.0.19 where it again worked without issue.  The first monitor
worked without issue.

Let me know what steps I can take to help identify the root cause.

  -Matt

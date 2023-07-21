Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45B31ED25
	for <regressions@lists.linux.dev>; Fri, 21 Jul 2023 13:50:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 519A5C433CA
	for <regressions@lists.linux.dev>; Fri, 21 Jul 2023 13:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689947437;
	bh=2U2DacFLhUUtqfp0Si4LVyjKQgQWEgSA987Rg+G6CfU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UYzzANqHBWaMcoqDv5HkO8fhMTl7gyh6yDpnKlJVOQfDBU0+GkfRCCv71Day6sClO
	 YPkWXyD5UirQpm2crKNN7NByL1aU2QvSausDqAmT2ATKV6u7+NGlkb6F+K5j97ZNkS
	 3m5xad+SqZXaKopQyPfjmeUHcQfx3LTlnaRJpMFwANZNrEzaW1OXbjm+I69BFPI175
	 JPQ9qDAxti6Z1O72VtTKsQUTTJoVxHRNcEXf4Ix4kGnFOb7lnxpNYnMNuufJTng3eP
	 Nd9ie7IlfbMKLJlC5lq0yD6QHFS7xuRRZtQJmXt3+L2QDPzP2WJowqitq6pibTaTYj
	 gncr2fbsTK5Qw==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2b73564e98dso28445031fa.3
        for <regressions@lists.linux.dev>; Fri, 21 Jul 2023 06:50:37 -0700 (PDT)
X-Gm-Message-State: ABy/qLYJUSvLbAv5HQU0GEPcjOyBuLQ8SCoupaZ435hzG6uH+iRmCQox
	Y0RNvovokvVebAGiTrU88EOeBlU8sO7Bg+iVMhg=
X-Google-Smtp-Source: APBJJlGj7WMr4TOPJf7emio4BW3vSAkkVdQ4c3oRT7ZHEN0zxxnxx4KHhKNCugcAp2P53SnvlqZGuCG373aMQpTa+Tk=
X-Received: by 2002:a2e:8003:0:b0:2b9:5695:d10d with SMTP id
 j3-20020a2e8003000000b002b95695d10dmr1514394ljg.36.1689947435674; Fri, 21 Jul
 2023 06:50:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <87lef931x3.fsf@kernel.org>
In-Reply-To: <87lef931x3.fsf@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 21 Jul 2023 22:49:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR_pO_47yiKdGY-4m7es6Y-Tj_Vwo26_+xJYd3L0dfhXg@mail.gmail.com>
Message-ID: <CAK7LNAR_pO_47yiKdGY-4m7es6Y-Tj_Vwo26_+xJYd3L0dfhXg@mail.gmail.com>
Subject: Re: [regression] GNUmakefile broken on v6.5-rc1
To: Kalle Valo <kvalo@kernel.org>
Cc: regressions@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 21, 2023 at 9:05=E2=80=AFPM Kalle Valo <kvalo@kernel.org> wrote=
:
>
> Hi Masahiro,
>
> For a long time I have been using GNUmakefile in the top level source
> directory to change compilers, enable ccache etc. Here's a simplified
> GNUmakefile example:
>
> CROSS_COMPILE=3D/opt/cross/gcc-13.1.0-nolibc/x86_64-linux/bin/x86_64-linu=
x-
> include Makefile



You need to export the variables.


The following should work.



export CROSS_COMPILE=3D/opt/cross/gcc-13.1.0-nolibc/x86_64-linux/bin/x86_64=
-linux-
include Makefile






--=20
Best Regards
Masahiro Yamada

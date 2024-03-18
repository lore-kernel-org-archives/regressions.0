Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371194438F
	for <regressions@lists.linux.dev>; Mon, 18 Mar 2024 13:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710767995; cv=none; b=ruDWrP9Su13VxhZs5+oqCa86tkbe7m5k+NvpTTKszpfMihaLrNr7bVaTCHv3QeX2h/PNQSTMNl/wSkCO1WIrUN0wWqmRMffhc7DRd75wHOohoo8oRYvjOJ/12IHQDy9CZ7qUvV9jh3yfCpCB6X7JXyvdnhT6hhQLzZ39KkCpF8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710767995; c=relaxed/simple;
	bh=B7EFWJAvkf3Ub97Zkwa4Dlgr6sAIbdL0b6kzx37r2cU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E5fKFJz21AnIVm+GecTrn1I8INjrvdJAxxpG8v2/I4wq2eMLCy1hS9TBfYBafsVBFFEtwSY1VmoiB383Sntb40ZnitQZJPOtf5m3NwDb5XgCvO+DkPgYh6mIIm4c29Iqw1E9SY2KLS2E2KyvXYZjfMX8iOugig9Kc5MPyhnxiaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c1CZmIVi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c1CZmIVi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B58D8C433F1
	for <regressions@lists.linux.dev>; Mon, 18 Mar 2024 13:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710767994;
	bh=B7EFWJAvkf3Ub97Zkwa4Dlgr6sAIbdL0b6kzx37r2cU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=c1CZmIVi+G/qv5A+yCvMmvkEntSRAaMT4vpe9ijuWBZk1fn8acWHKWG4slP/db/U1
	 +MLta9/82y7WsnrMSEPKZi9RIDNnHIRUDmJfjeTXYFpw8CEATj3KcyAgu46+SGObSs
	 WKxsrk5vrG0DX2MXoo99BcLPApr8eHssxdbgxJzN/UNEo8foKHHE8X6P2kENmPrJ0A
	 RkWd2E+uNoy0yiTfYj/D5ShxpppZN+C3cnpML9v2RYSTYFDRiBlppgy3XcK6ni4ATr
	 JlxT47eDu7UkRojsR5QHQWCkKHb/TO8Y5jHx1CbD+rqB/EWqPDXlHRv4zeMPjbtjnv
	 xLSO5GG9Sf0oQ==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d109e82bd0so55597181fa.3
        for <regressions@lists.linux.dev>; Mon, 18 Mar 2024 06:19:54 -0700 (PDT)
X-Gm-Message-State: AOJu0Yz9/S5UORjJvVyWZCUejIQ6AVuUB+Gw00rF/Uk6mKKLhZDBQhNW
	7eRm0azTH7LKN2ZPJIbPIw6dnAeA7s13uUDcJuQ2uob2FPdm2HgwasVKql41phayeGGmjTb+8yp
	70uGtKNHS3D8hkP0ORU/tskYfGos=
X-Google-Smtp-Source: AGHT+IGlhfktgrOiEm5j/xxVkcMAbmQ24qNESVHLHUGuFyx/TO6Qu3P6sQtMG+xVY8S/ZxU104+UE76iGifx4SvAINU=
X-Received: by 2002:a2e:b054:0:b0:2d4:3b3b:68d5 with SMTP id
 d20-20020a2eb054000000b002d43b3b68d5mr7963082ljl.26.1710767993111; Mon, 18
 Mar 2024 06:19:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a99a831a-8ad5-4cb0-bff9-be637311f771@podgorny.cz>
 <CAMj1kXF7gaaARdyN=bVuXtJb_S=-_ewAavXHgN4DS36jxK8r6A@mail.gmail.com>
 <CAMj1kXEo-y1DfY_kBhwGU0xMkGp1PhdqGFmw6ToLePiZy4YgZQ@mail.gmail.com>
 <CAMj1kXFmgba8HyZ-yO7MsQBgOGjM10hZKWESBbfrUcjdhq0XsQ@mail.gmail.com>
 <225e9c2a-9889-4c9e-865c-9ef96bb266f3@podgorny.cz> <CAMj1kXG1Vgpp+ckwDww_4q2SF+kajUaoE3+qe5FzMkGyq-Lbag@mail.gmail.com>
 <CAMj1kXGZLs3MdFiK9jrkmWR+YPt50L5tuCJ+rLLTjVa3Grm6tw@mail.gmail.com>
 <61148405-2036-4994-9eef-45cbe6aa9adb@podgorny.cz> <CAMj1kXHn0qp2Qq1WfoT015ezjnzHLoy7=XVE_RY+6jsHzQ+gkA@mail.gmail.com>
 <35ae3208-a0ba-43a7-ac4c-6f770b3df405@podgorny.cz> <CAMj1kXHO_R4XpQ=To1ZW_yac_sjWFPnw7pjunn0UmraFDA2wCg@mail.gmail.com>
 <92898285-e85c-4e72-a179-70fb65349978@podgorny.cz>
In-Reply-To: <92898285-e85c-4e72-a179-70fb65349978@podgorny.cz>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 18 Mar 2024 14:19:41 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEfeC=O2_NFteJM+L1PqgR2MiXQEcFzmeemsgdKC8s7xQ@mail.gmail.com>
Message-ID: <CAMj1kXEfeC=O2_NFteJM+L1PqgR2MiXQEcFzmeemsgdKC8s7xQ@mail.gmail.com>
Subject: Re: [REGRESSION] linux 6.6.18 and later fails to boot with "initramfs
 unpacking failed: invalid magic at start of compressed archive"
To: Radek Podgorny <radek@podgorny.cz>
Cc: regressions@lists.linux.dev, regressions@leemhuis.info
Content-Type: text/plain; charset="UTF-8"

On Mon, 18 Mar 2024 at 14:14, Radek Podgorny <radek@podgorny.cz> wrote:
>
> hello ard,
>
> so, i have some bad news. unfortunately, none of the suggested changes
> resolves the issue. :-(
>

... except reverting the patch that you bisected the regression to, right?

> the last two patches still lead to boot-stuck system.
>

What does 'boot-stuck' mean? Please provide as much context as you
can. More is more.

> overall, the patches only make the difference in error being printed:
> sometimes it's something like "wrong padding",

Can you share the entire, exact error message?

> sometimes the "invalid
> magic" message. i only noticed later so i can't really tell which patch
> leads to which message but i can retry them all and tell you exactly if
> it helps.
>

Yes, please.

> anyway, if you have any other patches, i'll be more than happy to test
> them out (and be more careful about the message this time)!
>

We should be able to narrow down why that one particular change causes
the issue. I can split the change in question into smaller ones to see
which exact change triggers the failure.

And many thanks for taking the time - I really want to figure out what
is happening here.

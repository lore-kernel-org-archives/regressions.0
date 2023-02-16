Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E7823A3
	for <regressions@lists.linux.dev>; Thu, 16 Feb 2023 16:35:15 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id he5so1987126wmb.3
        for <regressions@lists.linux.dev>; Thu, 16 Feb 2023 08:35:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YvjzzplOyYWEsKigVOczYa0vP8bscsvw+TTYRzm8kTA=;
        b=ZoTA6ZJXVLKPbFha4y+xPdeteo9LtJCJyQpII736FkH/gzol2AFDWafQWxmS9u6AQc
         fkV48+8oJPFcsO5/lv3tcQrpHmY3p3XbDHxlawKTj9AF0bPHF5tYBMZhvo5IaAjdXoIE
         FZYywLNHjXt2xmFY+llQF4SaB1lLvzFns8jBCfMbPc23GNLa4/N+YhZe8trEFASZmSCH
         ZrSPNq4HCzR6EGqllpNqCxMDqSHboZtftaCrpf5K8F8vsoIXOe021c+TicDIvYKCC7d1
         YsDsJYSutiT/EHUDO3VELGOsdm2mFSFGo0McaL12CvzxGfXxLG3TGAKCHt3IrPHgn4Ko
         5MWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YvjzzplOyYWEsKigVOczYa0vP8bscsvw+TTYRzm8kTA=;
        b=VrS+fYovkiuaHFWWx0hC5nhcyR3yk0IROZ5gcnhp83BomJctkRL/tA1XDzoyz/3yZ6
         dTILxtOHS+r/Ck4VL1Fgo3zgKafTgzs8HOiw2BNksqvHuxtXWNEBVTjCfEy8uuVCDBa0
         C4UkOE2n5As3R2+oXwOKihZU1mRO5QuyBZgQgXoaLJI1iEw5DVjo86ea5uUVvc+FNv/c
         GD/FlEEl5wfmBOA9RA4dG7eJtGRWvx4pA6x6TrIp+BZPhrF+xu8scuI4Zs22i5bUCQiH
         4+1AC/su1/5q7+C63/JgQLzrJTrshJtd9jj70D6dx0BRh29MqqI6dqkO59BZ9B39LKsA
         Fccw==
X-Gm-Message-State: AO0yUKVzdj36wgCBPC44unLG7kfIAw6yNrYfCATGygqYD5tcOe0cJcx/
	/vylW55nVIuFozF3z+enRVaOCVfQoLsYecOCYMa7GQ==
X-Google-Smtp-Source: AK7set+mxzqP+2cX9xGG+98a7W1aFhcKpWtSQRoANqVGk5nbllqVo0cocFoUDZ94JXpln7JDwQwk8FwQ2GeMPClgJuc=
X-Received: by 2002:a05:600c:46d0:b0:3dd:67c6:8c58 with SMTP id
 q16-20020a05600c46d000b003dd67c68c58mr353816wmo.51.1676565313986; Thu, 16 Feb
 2023 08:35:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+G9fYvZqytp3gMnC4-no9EB=Jnzqmu44i8JQo6apiZat-xxPg@mail.gmail.com>
In-Reply-To: <CA+G9fYvZqytp3gMnC4-no9EB=Jnzqmu44i8JQo6apiZat-xxPg@mail.gmail.com>
From: Alexander Potapenko <glider@google.com>
Date: Thu, 16 Feb 2023 17:34:33 +0100
Message-ID: <CAG_fn=V3a-kLkjE252V4ncHWDR0YhMby7nd1P6RNQA4aPf+fRw@mail.gmail.com>
Subject: Re: next: x86_64: kunit test crashed and kernel panic
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: kasan-dev <kasan-dev@googlegroups.com>, open list <linux-kernel@vger.kernel.org>, 
	kunit-dev@googlegroups.com, lkft-triage@lists.linaro.org, 
	regressions@lists.linux.dev, Marco Elver <elver@google.com>, 
	Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

On Thu, Feb 16, 2023 at 1:13 PM Naresh Kamboju
<naresh.kamboju@linaro.org> wrote:
>
> Following kernel panic noticed while running KUNIT testing on qemu-x86_64
> with KASAN enabled kernel.
>
> CONFIG_KASAN=y
> CONFIG_KUNIT=y
> CONFIG_KUNIT_ALL_TESTS=y
>

This is reproducible for me locally, taking a look...


> <4>[   38.796558]  ? kmalloc_memmove_negative_size+0xeb/0x1f0
> <4>[   38.797376]  ? __pfx_kmalloc_memmove_negative_size+0x10/0x10

Most certainly kmalloc_memmove_negative_size() is related.
Looks like we fail to intercept the call to memmove() in this test,
passing -2 to the actual __memmove().

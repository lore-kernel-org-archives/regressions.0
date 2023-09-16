Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7560134DE
	for <regressions@lists.linux.dev>; Sat, 16 Sep 2023 22:26:01 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-502f302b68dso3117645e87.2
        for <regressions@lists.linux.dev>; Sat, 16 Sep 2023 15:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1694903159; x=1695507959; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r9idXErWZI7pNQUkUS1qR53dXjSp7SyDv32PM6WVIlo=;
        b=OktP7X0/NatZ1ZV5aXQIXHjNX6et5UvRTZQrbOx0E8Ghbl++eTSTpn5PbSDjx4fLxE
         7dSvyw1yT4Eb6dx9Qc6uJqDZyUTjh8Fnvkxw4ZVom98MyF+u2QaQ6rRPeOsTMJiCFnS1
         vh0R82dDktdR1zshwUJBJJRrz5gY7cW9pKMU8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694903159; x=1695507959;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r9idXErWZI7pNQUkUS1qR53dXjSp7SyDv32PM6WVIlo=;
        b=qstHCvUc+NwjMQL0RLknyUtFfl1HYkZdoRU9JSg1ikaMu70ZRxrD/7ahETtvupg76X
         XAbVM9oycUot9b/VSrz3y5ysKEE+9a42hSJcmM7G+4hQu99IPqAjms2tcuFyAVBRBC6j
         5UnLeTJWFowMh08sGytcmxmx/ZdpwPEY6ikDgyO94vlOJjF6l+MzsJ2wrTs7e8xYaQo2
         TRkOJxBp8rg2l/QEIfAhxbDa/b0nyDynHI9MDtN5ywnqpYW0N4q7pw6EKoFhVY+DrgVU
         l5X7Ug3qq6XkZG2xxmEOKsHNHNl1z+SqMHlSOBnguo82y9EfJOD+kdSU7sTzB/80+yhS
         v43g==
X-Gm-Message-State: AOJu0Yw6KsjRlzeBsrUhpxviIgOk+IWrVzxhreg2uKP9xjSAIQv5y0m1
	vP2HPusg8ckM8v9HYklFQZ1LEFuKIPuYugHTurT3WEy8
X-Google-Smtp-Source: AGHT+IFgyYG9Wb2NV9e+zv6rJzmVVeJ41KTp0xwbmUXZRXWbqPAz0ux0Anl6kTbShvq9/diKWBMExg==
X-Received: by 2002:ac2:5470:0:b0:4fb:77d6:89c3 with SMTP id e16-20020ac25470000000b004fb77d689c3mr4353178lfn.12.1694903158946;
        Sat, 16 Sep 2023 15:25:58 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id n8-20020a056512310800b0050307789accsm309393lfb.42.2023.09.16.15.25.58
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Sep 2023 15:25:58 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-50300141a64so1360245e87.0
        for <regressions@lists.linux.dev>; Sat, 16 Sep 2023 15:25:58 -0700 (PDT)
X-Received: by 2002:a05:6512:1321:b0:500:99a9:bc40 with SMTP id
 x33-20020a056512132100b0050099a9bc40mr5258347lfu.69.1694903157814; Sat, 16
 Sep 2023 15:25:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1694366957@msgid.manchmal.in-ulm.de> <ZQWUzwiKWLk79qbp@debian.me>
 <CAHk-=wh29JJSVGyJM7ubxOs51-Nxp6YnmU9Bw1gdOk3rrQ_0mg@mail.gmail.com>
 <CAHk-=wjrEjaUw3oFVEYpF=AWAwrSM3sQTQHuPfFjFdQsvQxHeg@mail.gmail.com> <40eecbdf-40d4-0fa2-6718-3875ed852104@virtuozzo.com>
In-Reply-To: <40eecbdf-40d4-0fa2-6718-3875ed852104@virtuozzo.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 16 Sep 2023 15:25:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjRnv92Y-b69OTefTxVHbmtnijNt8Dw7BFe+fgJTHK60A@mail.gmail.com>
Message-ID: <CAHk-=wjRnv92Y-b69OTefTxVHbmtnijNt8Dw7BFe+fgJTHK60A@mail.gmail.com>
Subject: Re: Possible 6.5 regression: Huge values for "commited memory"
To: Michael Labiuk <michael.labiuk@virtuozzo.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, 
	Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>, 
	Linux PARISC <linux-parisc@vger.kernel.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 16 Sept 2023 at 15:20, Michael Labiuk
<michael.labiuk@virtuozzo.com> wrote:
>
> This patch fixes problem with counter for committed memory.
>
> Thanks!

Oh, no, thank *you*. With the bisection, this was fairly straightforward.

A silly mistake in the original patch, but hard to see without a clear
"this is when the problem was introduced".

           Linus

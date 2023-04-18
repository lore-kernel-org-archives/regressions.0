Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79669C94A
	for <regressions@lists.linux.dev>; Tue, 18 Apr 2023 22:21:24 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id u3so24987576ejj.12
        for <regressions@lists.linux.dev>; Tue, 18 Apr 2023 15:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1681856482; x=1684448482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRUCLZpCTJva3ZJ5YvwKCeVkHO7TB40DF1q9XyINrr4=;
        b=Hlk/yOfAg8ZObQAF9HFyo2GjdAU+uGuu9DIGoZG7BwKbCF3FZOJKCydiYKbyItjtmu
         BbI3eTRdqZZJ8P8ym4SEg0069gk7JvMNWIM1ky24htEX7HkJeYAD3+e9pUyyIw0mGB+p
         HA+Mfv7ndAh9f1OGPYF/YilJ8yB5N/k14y0kY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681856482; x=1684448482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oRUCLZpCTJva3ZJ5YvwKCeVkHO7TB40DF1q9XyINrr4=;
        b=NjD6mrhj7QpHLpzKE4oaLUa2qd1+ykMYAKGySuw7SfaDiHDhdknzK4OLlsZi8z+8Hx
         g3q+1p1L0SLxwnWe669vhT7wSPuuNuTc4UMyI48i9CKwaqW6d6Zu+++ULmYTLtFT5OCC
         JUuE6gg4hMWTGnkNbIbFj3cCZCxkZ4Jc4cjRvM+ezow0CjIdA9zymjvw5iVi2UTPEId5
         nBBZqmN5Ssty/4M0px1/+NiKGjqDj+ZeJNbArILNIlz3w1AFR6OuXMekH6JDVsj3KEQX
         rCEh3e8REEoujiWvK9+pv150ybG7bHfNLN0HO1DxUAMg9lHvC6U2uKH+Q8/WYyCfOYmm
         /l5A==
X-Gm-Message-State: AAQBX9fjOeb0Oclkva8D+fICh+N6PJObhpHFEWsjK4PjfSoG54zt3V8Q
	4luB+TnLKCZXN2aDCpDy8Z8VT9K+duZQwjoopQJM5A==
X-Google-Smtp-Source: AKy350aO2ifa/817OO/C0GqCZF8HnsG8NO1Abl+Bj7QauutSV70q9HjUFwOz9nWRzkavvqJh7LauxA==
X-Received: by 2002:a17:906:145a:b0:94e:e0b7:96d6 with SMTP id q26-20020a170906145a00b0094ee0b796d6mr325992ejc.14.1681856482356;
        Tue, 18 Apr 2023 15:21:22 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id e23-20020a170906315700b0094b87711c9fsm8574034eje.99.2023.04.18.15.21.21
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 15:21:21 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-504eb1155d3so25977414a12.1
        for <regressions@lists.linux.dev>; Tue, 18 Apr 2023 15:21:21 -0700 (PDT)
X-Received: by 2002:aa7:c852:0:b0:505:d16:9374 with SMTP id
 g18-20020aa7c852000000b005050d169374mr313244edt.9.1681856480915; Tue, 18 Apr
 2023 15:21:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHk-=wjL7GG9s9Y2+u2725M+Ru=bUXnzOnXRwoSktY0fVdhhzw@mail.gmail.com>
 <20230418213228.1273218-1-neal@gompa.dev>
In-Reply-To: <20230418213228.1273218-1-neal@gompa.dev>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 18 Apr 2023 15:21:02 -0700
X-Gmail-Original-Message-ID: <CAHk-=whMQLbRPQd+AmP6eiu1jnRQj6QSDnhbsetu23Fx2jW0+g@mail.gmail.com>
Message-ID: <CAHk-=whMQLbRPQd+AmP6eiu1jnRQj6QSDnhbsetu23Fx2jW0+g@mail.gmail.com>
Subject: Re: Linux regressions report for mainline [2023-04-16]
To: Neal Gompa <neal@gompa.dev>
Cc: David Sterba <dsterba@suse.com>, David Sterba <dsterba@suse.cz>, linux-kernel@vger.kernel.org, 
	Rafael Wysocki <rafael@kernel.org>, Chris Mason <clm@meta.com>, Boris Burkov <boris@bur.io>, 
	regressions@leemhuis.info, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 18, 2023 at 2:33=E2=80=AFPM Neal Gompa <neal@gompa.dev> wrote:
>
> From my perspective in Fedora-land, we've been running automatic
> weekly fstrim on every Fedora system for three years now[1] and
> have not received any complaints about SSDs pushing daises from
> that.

Ahh, good. So we do have a lot more test coverage than I expected.

Then I withdraw my concerns. Hopefully it all works now...

              Linus

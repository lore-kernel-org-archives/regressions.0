Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470F8EADC
	for <regressions@lists.linux.dev>; Wed, 21 Jan 2026 19:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769022545; cv=none; b=OUURTNrDRI6YNW8wkAevTg6yn5lVE99/Yg01U8+KE8lL5F05UUy60/hzUwG7JQ4PINdUr5wl46hZwWUA72O19f5Imti+Lb/VvkJwdJ+wFWxF9aO4IqUXjnlcSHzjRxX1EaaQzVdj0qJseO/OTYawMPiN11/lpxllLodiQixkj2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769022545; c=relaxed/simple;
	bh=W58klCYAYA5BeFetF34tB9xivYNNX5uNHOHICRiJiXk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c9P4kNn0s/p5CNK+AcCPdu+QaUIyAY8pEIPsUCgyK8hBBuk5g5Ol9AYQSjhirBHJ3/Y643Q8ILSnZzE4pHEXvO0j7C8RgMl1vVpOkWy/WJ5elqu25uk/HnZC9sCx03rUDZVXr6EZ0CLGNhqBdabOuC4MzKE058h3y53/ALozW9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u2Rur4H4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u2Rur4H4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A48A8C4CEF1
	for <regressions@lists.linux.dev>; Wed, 21 Jan 2026 19:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769022544;
	bh=W58klCYAYA5BeFetF34tB9xivYNNX5uNHOHICRiJiXk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=u2Rur4H4j2GpljpN+k7PLMqJGIKw8MR/UzdDRikPVZzGH+DROfMSXhEPuGv9hv/bp
	 eFhkreT7xWy5XHIIDfYl0PSNjjnzmqkJXMuTbWWxIroLBRJXYnCMkvuwX3KKQJV+I3
	 PmYBGNyg1Pmj3QJhvh5ZW+trqTHEQYwk+CW/PeafFkIWT8HzxbrKmZqKzIaEqh+rRY
	 wVYSBNyA5ZTieu2dK+LpGC+2RA5UUNny+PdyiGjlhPAGIyW/crbfMsSAz86pqzDCbn
	 CO/aNWZKXRezktWZzjw5ATwz9ngmOQOeMCFNWx/8h87GJIA7Y+IqvZIfHvArq8UWjM
	 r9UkjT0cnuV2Q==
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-66106a2f8d1so75325eaf.1
        for <regressions@lists.linux.dev>; Wed, 21 Jan 2026 11:09:04 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUPPckuQYzAbZ+s4OIQ93rhplcVkBAgP7BHbENX0NvPphrXEtq8V+Ob2YGKeR5Pkj8UZzHwnNB2h/eEzA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxSs4vgRzyysXMEbCRyiCyIJGnlBkOUYkpA7qk1gbBpS910cvAL
	nHedtaTv1uYPHoN9OQveChRcEgk59n8gA9LZbrRwpayzA4R0dUkfpdOqDgAPbRJeY/HlNUwdDro
	1INrQP3Igpu7eop46ZdQuaxJWdrm2U8c=
X-Received: by 2002:a05:6820:1989:b0:65f:564f:34b1 with SMTP id
 006d021491bc7-662affb8367mr2453637eaf.16.1769022543782; Wed, 21 Jan 2026
 11:09:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <aXDBRPmk1N5m6Jr-@laps> <20260121162532.1596238-1-sashal@kernel.org>
In-Reply-To: <20260121162532.1596238-1-sashal@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 21 Jan 2026 20:08:51 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jRxwuVgody9TbUqhyj6Ajr+NjchUSo2m6Uzs3PrNoJHw@mail.gmail.com>
X-Gm-Features: AZwV_QggtSdVZ5tgHyiSe47PiUm1mNxPbRfHwfaOezxFdNcqwv1p-ddq__g5QKQ
Message-ID: <CAJZ5v0jRxwuVgody9TbUqhyj6Ajr+NjchUSo2m6Uzs3PrNoJHw@mail.gmail.com>
Subject: Re: [PATCH] objtool: fix libopcodes linking with static libraries
To: Sasha Levin <sashal@kernel.org>
Cc: acme@kernel.org, irogers@google.com, jpoimboe@kernel.org, 
	linux-kernel@vger.kernel.org, peterz@infradead.org, rafael@kernel.org, 
	regressions@lists.linux.dev, torvalds@linux-foundation.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 21, 2026 at 5:25=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> Commit 436326bc525d ("objtool: fix build failure due to missing libopcode=
s
> check") tests for libopcodes using an empty main(), which passes even whe=
n
> static libraries lack their dependencies. This causes undefined reference
> errors (xmalloc, bfd_get_bits, etc.) when linking against static libopcod=
es
> without its required libbfd and libiberty.
>
> Fix by testing with an actual libopcodes symbol and trying increasingly
> complete library combinations until one succeeds.
>
> Fixes: 436326bc525d ("objtool: fix build failure due to missing libopcode=
s check")
> Reported-by: Rafael J. Wysocki <rafael@kernel.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>
> Rafael, I'd appreciate if you could test this patch without the .so symli=
nk
> workaround. Thanks :)

Works here, so

Tested-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

>  tools/objtool/Makefile | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
> index 9b4503113ce5f..a40f302329291 100644
> --- a/tools/objtool/Makefile
> +++ b/tools/objtool/Makefile
> @@ -77,8 +77,21 @@ HOST_OVERRIDES :=3D CC=3D"$(HOSTCC)" LD=3D"$(HOSTLD)" =
AR=3D"$(HOSTAR)"
>  # We check using HOSTCC directly rather than the shared feature framewor=
k
>  # because objtool is a host tool that links against host libraries.
>  #
> -HAVE_LIBOPCODES :=3D $(shell echo 'int main(void) { return 0; }' | \
> -                       $(HOSTCC) -xc - -o /dev/null -lopcodes 2>/dev/nul=
l && echo y)
> +# When using shared libraries, -lopcodes is sufficient as dependencies a=
re
> +# resolved automatically. With static libraries, we must explicitly link
> +# against libopcodes' dependencies: libbfd, libiberty, and sometimes lib=
z.
> +# Try each combination and use the first one that succeeds.
> +#
> +LIBOPCODES_LIBS :=3D $(shell \
> +       for libs in "-lopcodes" \
> +                   "-lopcodes -lbfd" \
> +                   "-lopcodes -lbfd -liberty" \
> +                   "-lopcodes -lbfd -liberty -lz"; do \
> +               echo 'extern void disassemble_init_for_target(void *);' \
> +                    'int main(void) { disassemble_init_for_target(0); re=
turn 0; }' | \
> +                       $(HOSTCC) -xc - -o /dev/null $$libs 2>/dev/null &=
& \
> +                       echo "$$libs" && break; \
> +       done)
>
>  # Styled disassembler support requires binutils >=3D 2.39
>  HAVE_DISASM_STYLED :=3D $(shell echo '$(pound)include <dis-asm.h>' | \
> @@ -86,10 +99,10 @@ HAVE_DISASM_STYLED :=3D $(shell echo '$(pound)include=
 <dis-asm.h>' | \
>
>  BUILD_DISAS :=3D n
>
> -ifeq ($(HAVE_LIBOPCODES),y)
> +ifneq ($(LIBOPCODES_LIBS),)
>         BUILD_DISAS :=3D y
>         OBJTOOL_CFLAGS +=3D -DDISAS -DPACKAGE=3D'"objtool"'
> -       OBJTOOL_LDFLAGS +=3D -lopcodes
> +       OBJTOOL_LDFLAGS +=3D $(LIBOPCODES_LIBS)
>  ifeq ($(HAVE_DISASM_STYLED),y)
>         OBJTOOL_CFLAGS +=3D -DDISASM_INIT_STYLED
>  endif
> --
> 2.51.0
>

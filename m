Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7038027E04E
	for <regressions@lists.linux.dev>; Tue,  1 Jul 2025 17:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751389693; cv=none; b=j9bMiegIpKtryKfJPBRoBmWL5BFwOGV04KxZUFA8hebjoAmDVaDUUUQGG8uNcDqaxFarlDaRfu3jzdXCB6jsjK6reBDSD1ZzK81f2NhOybRJaoFsOuvPjkQUcy9Uvy201w5Qfz5aHipGELDIWWQrqB+Hu4Ncofj9MFMbotu1btk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751389693; c=relaxed/simple;
	bh=Lyu8162aPlGdHqm8MMUtnBXbj7A8z2I/1kHmieIdhe0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KLI+oS7bpI7yKrPvpCRS0b7xnz3FHdADXLWksOAYFCKTgIeSbgDxZ0Oi0+8WQ0GhfXYrDBljrnEgOh0zfs44qRJo3vuixQnWO5mmoMWPGJoxrX1UM9xRDWCgBnLTrk9RTkqpjNqeXKRGuXNcdLK+zEv0Xq8Iov1CruxS5489ZpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZUEIr1nH; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZUEIr1nH"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-32b3c292bb4so53313021fa.1
        for <regressions@lists.linux.dev>; Tue, 01 Jul 2025 10:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751389688; x=1751994488; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A/oHeZZJmEJ3y7HUiY87UCgnZNS6QyZh5Cbvr7xE/rQ=;
        b=ZUEIr1nHf7sVxM89twtl1nsrOcUeifKsnyMy4ZNvVEvruKBzBy4CvwS7YE3qB69XaC
         qhtr+GS9Lci5VIqLXdm6dL+A6eeDEYBWdXCnaMttjWhoG7W9B9Q3/f9CX6DK3d8FOin+
         76QIkAbm9zuRyh9MF9Evh05vtkzQohXQWAdTVNVRCV9D5PNHpk51g3NDjNHWzUTMVLmZ
         0jUUs17+JWL7nKlqm0t0p919C6qJLdWaisqEsUvkDBX0Hgaz4NChGp1LdWoSgKrFHQ+a
         MlJfnc6HoESox6EHHXYB/jeqjMSN/ZVpRLH/nkkzIsuWnlBafSSK6wK7Kh4CZQmzt807
         sLPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751389688; x=1751994488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A/oHeZZJmEJ3y7HUiY87UCgnZNS6QyZh5Cbvr7xE/rQ=;
        b=DSPKnpJ08BMR9wx+nvCPR24RjO9hXzpRGCXw+Sdb6Z2cgB8g5+M220iEQ9RkgUqhaV
         g5XDWXazawndVpH0gUFejX+530Mr5/TdzqUfto/vqRTIQDcasen24LFYmkI6YA9XEs0V
         BcgFIu6i/IkedQWLUkdEyKSq34TWVDzaZnCQt6mOpNmzC9tizQTfNKNpWUxZ7lo8QVs7
         CEP+PAbj68jt3JZ6VjYToGty2Lez1HUdO9Q8U+OXgOQyLbjnm4Lm9JMnqsDdgfgxdD8b
         G7CE7LCL5qExwWAd630gmGdiTeomGsPd4L8BefSdYEQ6otJNuCGFehT3y0O7ECu+I0JB
         xeeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVcCRa0hg2pyjQMfGSWqCwpXfnuqZzA01GB3g4ZWYWFExMYjh3BTOMVqB6h/XudQQ/n6HeBgWc0IXtLnQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyb7lGOaE4qs4T3MaSTp60IvGu4GAE0/mWmWGKqIWdOtp2xxE56
	/3pZ/jyqpON+s+pibz2AoALlquZJFBMqMcJ4y/HFEpKkPXi+7s15VcePjys8j6xp6Hnx76c+zdu
	PmtKYBACBPiK3AWOJaiC6RuOmqdv1qmdtXg==
X-Gm-Gg: ASbGncvO7lJHoP/S9aFfjZxxvp5/eiGDC9jUZgCpdTf6yHiXT8hAoEOw+QFL8I25500
	89RzOtuVUv6nPBVoIwU1H1CbVaNMeDvyS0WYf4wSnLgVdkDr/VEKV1pv+DFTYbtyUtWn2AJ5+pi
	5vuDrqpszxZFCu4Cugkq1DPRCIORCqm+5RlkqLuTAZVuE=
X-Google-Smtp-Source: AGHT+IFDcrq99l7HlyKWB1faKIkaQ1PDP98axqJweblaWyxilVNxqkAj6/VOBrFhVh+9rRTrmMQ2to6liKTFqiYp4cs=
X-Received: by 2002:a2e:a013:0:b0:32c:a097:41bb with SMTP id
 38308e7fff4ca-32cdc4410a7mr32879921fa.5.1751389688165; Tue, 01 Jul 2025
 10:08:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250701141026.6133a3aa@ncopa-desktop>
In-Reply-To: <20250701141026.6133a3aa@ncopa-desktop>
From: =?UTF-8?Q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>
Date: Tue, 1 Jul 2025 19:07:32 +0200
X-Gm-Features: Ac12FXwrtprVZYhiM1ym_K2LaLIEoBM9Qx0NTEAIAXP5_AbBQn0By7Xgq-OkN00
Message-ID: <CAA76j90io241-a+2SDLfAMHY2ro4x-Bstw4AxKDOU_izW9goYg@mail.gmail.com>
Subject: Re: [REGRESSION] v6.12.35: (build) kallsyms.h:21:10: fatal error:
 execinfo.h: No such file or directory
To: Natanael Copa <ncopa@alpinelinux.org>
Cc: stable@vger.kernel.org, regressions@lists.linux.dev, 
	Achill Gilgenast <fossdd@pwned.life>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Hello,

 Thanks for pointing that out. I was not aware of it.

On Tue, 1 Jul 2025 at 14:10, Natanael Copa <ncopa@alpinelinux.org> wrote:
>
> Hi!
>
> I bumped into a build regression when building Alpine Linux kernel 6.12.35 on x86_64:
>
> In file included from ../arch/x86/tools/insn_decoder_test.c:13:
> ../tools/include/linux/kallsyms.h:21:10: fatal error: execinfo.h: No such file or directory
>    21 | #include <execinfo.h>
>       |          ^~~~~~~~~~~~
> compilation terminated.
>
> The 6.12.34 kernel built just fine.
>
> I bisected it to:
>
> commit b8abcba6e4aec53868dfe44f97270fc4dee0df2a (HEAD)
> Author: Sergio Gonz_lez Collado <sergio.collado@gmail.com>
> Date:   Sun Mar 2 23:15:18 2025 +0100
>
>     Kunit to check the longest symbol length
>
>     commit c104c16073b7fdb3e4eae18f66f4009f6b073d6f upstream.
>
> which has this hunk:
>
> diff --git a/arch/x86/tools/insn_decoder_test.c b/arch/x86/tools/insn_decoder_test.c
> index 472540aeabc2..6c2986d2ad11 100644
> --- a/arch/x86/tools/insn_decoder_test.c
> +++ b/arch/x86/tools/insn_decoder_test.c
> @@ -10,6 +10,7 @@
>  #include <assert.h>
>  #include <unistd.h>
>  #include <stdarg.h>
> +#include <linux/kallsyms.h>
>
>  #define unlikely(cond) (cond)
>
> @@ -106,7 +107,7 @@ static void parse_args(int argc, char **argv)
>         }
>  }
>
> -#define BUFSIZE 256
> +#define BUFSIZE (256 + KSYM_NAME_LEN)
>
>  int main(int argc, char **argv)
>  {
>
> It looks like the linux/kallsyms.h was included to get KSYM_NAME_LEN.
> Unfortunately it also introduced the include of execinfo.h, which does
> not exist on musl libc.
>
> This has previously been reported to and tried fixed:
> https://lore.kernel.org/stable/DB0OSTC6N4TL.2NK75K2CWE9JV@pwned.life/T/#t
>
> Would it be an idea to revert commit b8abcba6e4ae til we have a proper
> solution for this?
>
> Thanks!
>
> -nc

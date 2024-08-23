Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB321E517
	for <regressions@lists.linux.dev>; Fri, 23 Aug 2024 14:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724423733; cv=none; b=TDf3bCFlHKXroUjENfLpEW/G/CaPEgGkEWLkMX76ht/2XbxxVjKgZ52n4RcEEKH8m4p+ymGOCAEp7+fZpXGO+PR1yWSsu5py6i7mrDjGon5Hfum1D/0KKsu5hB8TdoTXV9vE9XhEFlbIuP852K7dQUlKiwzjU3PzfIFker6qi54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724423733; c=relaxed/simple;
	bh=c3HWaWoFAgmB8EljcQNSX6ZgAU01aTv2LG8hn6I/IL8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m5LwYI53jPuK4vMkCAVuwvKP0dFaI7eSdJjQwzhZIOv0jFjdrIL6aosBAB7lzdRE6phdMh0O0X7Gbxl3kI0RgJnaogwlFujq1ofJIxyA5KHAFhPteTzOcQPcajQns6pxbh5XbdMVZi2ETPKXQTeVLtKT96f1jELoJtmcuH5Qoao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gtIn9Okw; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gtIn9Okw"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-44fded90c41so10783881cf.3
        for <regressions@lists.linux.dev>; Fri, 23 Aug 2024 07:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724423731; x=1725028531; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HD0zYUJdm5kof1yO+rSoAs76Cq9RGjC/6dlObPwrCXI=;
        b=gtIn9Okw9F1muQYmM8egPd3qqg1ei9Le4sytrViBWXlujYjacJ/ojjU3SKp3dfLjrv
         RLWL8CC6qIkpClU6um6qmYFwX4i1s3PTm5m4u66iE1sjI3tkx96G5QG4MkxAGGsr/P4L
         OEuuoH1Dvi56EhNypcwpy2VrrSkiHz/6TPvTz76xELdO2dWUrUInxH9L8QvOsSAzG47T
         zbShdNqSxeqSLVnW4GA1ghLjMx5iAMf5zqP85jI/ohr6gVaKxgrairg96IAHlp7nuccR
         lA74z6Xcqv2VYNZxUJRBQhx+r35CJP3Ak6UkOPs8Pd95j2f4eCkB53W4FhpiecU0Pu8z
         ocnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724423731; x=1725028531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HD0zYUJdm5kof1yO+rSoAs76Cq9RGjC/6dlObPwrCXI=;
        b=Fn7ARiXz/qgMJJuSPr8Hr/axexHphEPWPjmDEN8axzd2E0kpSWa0hoxFVffI9IUR8E
         JlTkd7wttW3eqpJifyQ9lLaAMZGiZqEa799kxqVi03WfZ4hQxm7j06W44vLlgqBGgLD2
         otSwg28lgRVUKDkOBZaw/oKirFYdlBSGxPwKuqsu4EgOknubWUflYJhZA3yf8bVz0L1s
         7eCNkf4n4PgXJEqecjFy0/MujeGXBCSv3WPqb7jav+o5DaqA1ivDJVkBqsQmTOAlHNpV
         JvOgbRkBzt+waKU/HgMNvfMyNxm5T0RUZ/AzJc0e6GKbgirykGIuMzRnYzEeaW3sr1qp
         fvwQ==
X-Gm-Message-State: AOJu0Yx0Rm1cZ5Yvxbzfacpv97SIUlkktlWMiWR3A/TqU23xhoT4XpIJ
	bQNJ8mdFQJVRk6bd3TZMrgAHihiD0YVwnHtH2h83NYd0VzUmwJngUH9QFWAgS0gp26Iwcf221Vn
	Jzj0C8v+YrWFhOVnGxok+C1AHVwQ=
X-Google-Smtp-Source: AGHT+IESFCFL+ihJkBnUp6givjnwP4o1Pp6kQALg8BhCOcp0A/eLi4A6hjRT9RWUkP3HTXAVkZuPMFV4yiJHkghj5zM=
X-Received: by 2002:a05:6214:3281:b0:6c1:6b00:6e90 with SMTP id
 6a1803df08f44-6c16dc27931mr28556486d6.7.1724423730563; Fri, 23 Aug 2024
 07:35:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <BD22A15A-9216-4FA0-82DF-C7BBF8EE642E@gmail.com>
 <6f65e3a6-5f1a-4fda-b406-17598f4a72d5@leemhuis.info> <ZsiLElTykamcYZ6J@casper.infradead.org>
In-Reply-To: <ZsiLElTykamcYZ6J@casper.infradead.org>
From: Nhat Pham <nphamcs@gmail.com>
Date: Fri, 23 Aug 2024 10:35:19 -0400
Message-ID: <CAKEwX=PEye=VcXF=r-A9B47VsNtpLLxz5cJiswzuQXBio8rizA@mail.gmail.com>
Subject: Re: [regression] oops on heavy compilations ("kernel BUG at
 mm/zswap.c:1005!" and "Oops: invalid opcode: 0000")
To: Matthew Wilcox <willy@infradead.org>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>, 
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>, LKML <linux-kernel@vger.kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Yosry Ahmed <yosryahmed@google.com>, 
	Linux-MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 23, 2024 at 9:13=E2=80=AFAM Matthew Wilcox <willy@infradead.org=
> wrote:
>
>
> That said, zswap could handle this better.  There's no need to panic the
> entire machine over being unable to read a page from swap.  Killing just
> the process that needed this page is sufficient.

Agree 100%. It is silly to kill the entire host for a swap read error,
and extra silly to kill the process because we fail to writeback - for
all we know that page might never be needed by the process again!!!

>
> Suggested patch at end after the oops.
>
> @@ -1601,6 +1613,7 @@ bool zswap_load(struct folio *folio)
>         bool swapcache =3D folio_test_swapcache(folio);
>         struct xarray *tree =3D swap_zswap_tree(swp);
>         struct zswap_entry *entry;
> +       int err;
>
>         VM_WARN_ON_ONCE(!folio_test_locked(folio));
>
> @@ -1638,10 +1651,13 @@ bool zswap_load(struct folio *folio)
>         if (!entry)
>                 return false;
>
> -       if (entry->length)
> -               zswap_decompress(entry, folio);
> -       else
> +       if (entry->length) {
> +               err =3D zswap_decompress(entry, folio);
> +               if (err)
> +                       return false;

Here, if zswap decompression fails and zswap load returns false, the
page_io logic will proceed as if zswap does not have the page and
reads garbage from the backing device instead. This could potentially
lead to silent data/memory corruption right? Or am I missing something
:) Maybe we could be extra careful here and treat it as if there is a
bio read error in the case zswap owns the page, but cannot decompress
it?

The rest seems solid to me :)

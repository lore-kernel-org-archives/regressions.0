Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F88D3CCFC0
	for <regressions@lists.linux.dev>; Wed, 25 Mar 2026 11:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774439714; cv=pass; b=Me6IIwTmgh4kRbmVJKdS1RJGnpYtZ3/Zv1FN10Q9JULljnuuZdioSrBk/haoTDVt+08xt8AicjfG62Tmuc/P1H8rh1S+AFDvBkcNaHcVAxaxUnkkAdaDX6NXByTPXa7Bcvf8WBtWXLUsKwYwlY/V0Q7vkvUdLVCAPKzRJJu3U3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774439714; c=relaxed/simple;
	bh=/4W9RE8z21QjkAb0jO3bHGuVegorEkbX+UlniHVigxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T6zE2khpWdWbY7g/tN4cT6gYxVhVdGMa6b7QIIBcTqvs9dO3vCjMb+YlQk88RYu4YK7HBQsV4ESmMUiRr35msf+W7qLzFLr2As/jZ1jM0OsGxygfTyDifq981ecFK6wb0flxsIYeFYAMzLmxCwhWgev/7YSEicHP0sxVOQsrvIY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Si9MJ35f; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Si9MJ35f"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2c0c955a481so397531eec.1
        for <regressions@lists.linux.dev>; Wed, 25 Mar 2026 04:55:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774439712; cv=none;
        d=google.com; s=arc-20240605;
        b=ICAFPW72Jf8WVj5YwKEZQ9odgTxFKD8IqfX1FNuJ9hIs3HaxvdMHNenNFs9dhHedgl
         6edtSdP2PZhcsqSdBgJjU81+SKrzRnH17js3je9/ZNNHrvAN4Lona0cj4w35++UbTC8U
         ieWhzrKGNF7PVNEmI7uM6hZ1c5W9HEWdAzFA3NYCD+a84TzNjXhIkxuQpUpxqadyKJo4
         j1vFSYHsseey6y0j0jn2UwXA2IwgtvBn37+YfAHy1Hyxlwshl4jm7qxkJCd5qChBca74
         wywKoFUDLoNEaO4ppB79JN1H7eps54iqHUvDKKUo+piRalDvkPpMGEZrdYC/wl09rEi6
         4DNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2tSPIXsOhsxvev4wetUjiK1cG61mtTHq7qYf68HDLCA=;
        fh=9ZkShSwUfm9n90BV/3lXefJsRI6wp6FSwdCOLmIoajs=;
        b=Be9vQaXZkl/ZHYo/YtXuyGMCEBVm7KcR36UfLnmJ4iOmbtFijHD0Be6Wom6EncHUYW
         da6EO7dG1N5DI7fxXLHvLrvZ5V2K9ONkUAkXZGIjoiQIdcvSYb8LWVe/IFqakFK+JPd7
         ZrR4CFvihAYX+PoO5AdgdR9Znv21E0rDVk8Ps0L1jC0MykNjwRcnvHtVUmmUrvOVPho8
         pIiZWqW9/d5A6gbu7Yo27d8txNg1FexX+ERMqqJ3z40v9IyMG08vqKPOMoXT3Mb7QrE3
         QiDWqFxx8DXdbVq9sY33X2LeOXa1ym3w+Q1XwU4F2N7GTvLFjwC5xFUE3DEBIusSdgmU
         /JqA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774439712; x=1775044512; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tSPIXsOhsxvev4wetUjiK1cG61mtTHq7qYf68HDLCA=;
        b=Si9MJ35f6l7/Jd/FD/tAdOmLePuXryv7uoYfWxa1wzYYZcqpITuU0audRcVcNoTymg
         32I9HG7x03cqQeZXS0NHd4Ho+TjDzUKGr+napJKyy1kiDcu9r3QWEKwKqqs3pTSdnYC3
         ThmYgHwT5Sjb0PrHtZoRBHvNkdjrqcLQl9H/g6j2RtwDhecJhQltogqZk1iVDimP8s6I
         SXupcIYo1Qdab+Ie0uscw1Hm+OGSkkaT3O/DE6F+YvzE15y3OpSr6kpd3X4TNX1bHggc
         V4c0zysMuT1QuUalA15fxPaueh5e+glPM5Yjp91WWNpwcdV9UunE5Fn0o5k6dtxHLbBL
         biYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774439712; x=1775044512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2tSPIXsOhsxvev4wetUjiK1cG61mtTHq7qYf68HDLCA=;
        b=Vg76VaNMOZJKuqztzeEyYdoT8j0uM14SDgp9OsPu6WyUi9ehDNfvA7M1DctPzSzy+J
         UAKhlYs/F9uFKDODZurswhHVyDTjsOlNMPpon/QgtTxkzyp911btB1WgoaHRTY06QlOZ
         YhkpuSGcCLxk80ncXpY9VTdnbUIuGwhDoT24Mr8Fz0kEgW5idxeE2VONIxIWySaEmYG5
         wU1jRA3PRnL71S7h4v7Hq0RrnuP3PmGzW3I0xlIS2Ewocrc3k++9yRVv2+Fa9aVKoCuR
         ayYmdSDM1gQaNzVbe+K9Pn7HWvJLw5qF27IcwXvUOTpNw+BjZh+iWq+JGfpEscEKWnR0
         Djyw==
X-Forwarded-Encrypted: i=1; AJvYcCVybe+xhw+guE/0uirlLBV+rLfJdVYEnE4fdAElPm07CvQGR+kTvaN9nwVF49J++Xfw5I2al8ZSmlbRQg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwGn5eDlTK6ljyjZdX8eYoldvTqHFliQmm28ku9zOh1+Bm5Rqlo
	g3B+RB9xl9tZxN1z5kcpMzqXXd07qHaXinIVjAEJdJZqClnXlM4VVEl9Y6RrGQy2scD0pZERIWL
	p75WzxX8H+mw950Jg0gD17kkfP+4d+20=
X-Gm-Gg: ATEYQzxSAGM45ZUL9jw9c/u6xGmlmTa/lupxM/eMe6WeXCUYBXrNWq6IMPJM2ML0TTp
	Q94c1h1W2hK0Cb/yFKlzFHT7GBop1VJWE8qUahCbEApdXU7tUjGOia+eDGI35yvQUhShQWR/SKN
	7oC7H2RJ7S4ZDsiTSX8VuNkJUfj2B7a3IzzWd3TsQclVg6FegDHtmTTymKTSZUP7Qlv8ov+kwzC
	8ngfRBsvDyeJ28Yn2MNo0khOf+gNvZi3Zra/D3mUzM7MkQjWk3J+el+xnT/2g7xMjytvrR0EANI
	USvyZZU=
X-Received: by 2002:a05:7022:78e:b0:11b:9b9f:426b with SMTP id
 a92af1059eb24-12a96ed357fmr1626314c88.20.1774439712218; Wed, 25 Mar 2026
 04:55:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260318023733.116789-1-CFSworks@gmail.com> <bae7a16910a7b2cff6b9f8996d93ea72dabb9a6b.camel@ibm.com>
 <CAH5Ym4i_Vbu88yHr5UG=6=kOS_jebsSaV3B-AvZjrn+jk8h-xA@mail.gmail.com>
In-Reply-To: <CAH5Ym4i_Vbu88yHr5UG=6=kOS_jebsSaV3B-AvZjrn+jk8h-xA@mail.gmail.com>
From: Ilya Dryomov <idryomov@gmail.com>
Date: Wed, 25 Mar 2026 12:55:00 +0100
X-Gm-Features: AaiRm52dih7Y_7oYw7_JM8EEfbKO3eAvCioYFA-s2Ei8UUpBTgqfSuvyd4F9rTw
Message-ID: <CAOi1vP82GXftssgpm3VQgcQ5N9yQV+eYN8sdswJtMhy-NETYRA@mail.gmail.com>
Subject: Re: [REGRESSION] [PATCH v2] ceph: fix num_ops OBOE when crypto
 allocation fails
To: Sam Edwards <cfsworks@gmail.com>
Cc: Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>, Alex Markuze <amarkuze@redhat.com>, 
	"slava@dubeyko.com" <slava@dubeyko.com>, Milind Changire <mchangir@redhat.com>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>, Xiubo Li <xiubli@redhat.com>, 
	"jlayton@kernel.org" <jlayton@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>, 
	"regressions@lists.linux.dev" <regressions@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 25, 2026 at 3:56=E2=80=AFAM Sam Edwards <cfsworks@gmail.com> wr=
ote:
>
> On Wed, Mar 18, 2026 at 12:42=E2=80=AFPM Viacheslav Dubeyko
> <Slava.Dubeyko@ibm.com> wrote:
> > ...
>
> Hi Slava,
>
> > Reviewed-by: Viacheslav Dubeyko <Slava.Dubeyko@ibm.com>
>
> This looks like you gave "for future reference" feedback and provided
> a R-b tag for the current version of the patch; is that it? Or is this
> a tag to roll forward to a v3 with your feedback applied?

Hi Sam,

The patch was applied as is last week:

https://github.com/ceph/ceph-client/commit/681a6d350eff104294bf8aceebb627a0=
8c037298

Thanks,

                Ilya

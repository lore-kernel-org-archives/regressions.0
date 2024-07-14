Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F26E13D88E
	for <regressions@lists.linux.dev>; Sun, 14 Jul 2024 20:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720989707; cv=none; b=GLg1h6xwx7Hxzw81CocOBVinHvrJLkd7e78YS70rDJkVN2hen3ukA4UciSbkjAZjBurqfU20WQPtZL9Ke5QcY3l1lKrdd4FWDeFjJ8oMDcr7q8xGL+Xf4A2RX1SNZI6/+/7Hu/f4VWJA+rA5nj7YglrU6e276HbhGeNGquZRe5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720989707; c=relaxed/simple;
	bh=Rbhi9raS35yjLs44ICMqmzwlTLdlFu8DJr1zq7AF6AA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NJGmSSNnxhy2gp42LA3ULlZTNSVsdtQIifx+2CTvy9vkWNTcKgE09guGSA4ovzKZIGHeZVbirZHKJrPNEVMwZ6AXu/ViOF/LFlxrTuTIS1q1ubwbri8B5I+VNhf7vLdSyqhbcOyC5cRZK2nvTbFurLd4LAQVOCUQudJddKosXhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FK3itkE0; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FK3itkE0"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-58bac81f3f9so4187452a12.2
        for <regressions@lists.linux.dev>; Sun, 14 Jul 2024 13:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720989704; x=1721594504; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/cK++aNJsVXbuZ4CO83IGAtI8ojo7ZZbJZliVitl0M=;
        b=FK3itkE0en8MGL8iG3mzb5doWd87RG6hh5VsQIxmWpNBWe4gItQb1/z7k55F96Fdmb
         em6GuHBbo8QnN1PXNLgrbsf+PuWOSFPkljKCg4YXBD24qkormKwK2AmotJHUAj37Fut/
         ynpcZlpq2UyW+Yh52DVgxF9BNAskAsU4ljHmrgIy2iuvtOo7D79K3fkSxxtSrdmaNs4o
         kj8/M7P7IFwhf/fDy+pz8T/KhvwUQNNOKfRVTSiGDuj/NEaZnwCiXBJCwDmr/TRwAT7h
         FKXH/mz37/CRdLve214NT5BU5lOCZDqYTFVIkGD9lLyPOdpJ0og+E/JWUssZlYmAz+op
         ssAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720989704; x=1721594504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z/cK++aNJsVXbuZ4CO83IGAtI8ojo7ZZbJZliVitl0M=;
        b=v3B1tUlGtVcY0ZINZ2QLQHY0RZcRq4v7P9cY8gRZsCLh7EXmRwJ8Lg4Cta3cerB3+8
         2XSiqNuPcTLxxeK9aCpaVVOwVF49csP5B4EA4D+ezP8RVkL+33h96uViwUEgs2p48zk7
         oN8HehVkbtuguKYQO01dYkk3yy9vFXZQaJdF0RlvbEQ0qxI9pAaIgMv/1txyMkQoz/EY
         EgFBIBbeWogN8bxYKF+49FHaZwJyMDci6l80Zw3/hfiOuNseCAoKCICXRjZsw03ZR/sc
         Lpt9UyuNM02MV7IY0QvySwewRVIED7bmCYoUqjqvF99yA1njCMmM8h4WSmRdgvRe4fXi
         9DVA==
X-Forwarded-Encrypted: i=1; AJvYcCXq3DMKScjEIOdpXHI64dMTHOFESzVPYuVcIaFFWbe8n675MCtmBaNFDAlIpDgXJintRus0Tth0cKtjYZeHoDEfQ9YLfh1JWWEAzQc=
X-Gm-Message-State: AOJu0Yx4N3Yu35whVt9HqApztI8HrPR9Oq/H9+FZHZs28WGsV/K8rwxb
	Q3gMS9ddD4hC58g49OXpLnBvHHgnIO+vCIH270AiHawv+PzYuB6Cl44D6Q5TqvNjuPNtj80O5/9
	YDU0OcJUqnQLAJ7+WznDs/y3g4Ts=
X-Google-Smtp-Source: AGHT+IFFU4LKVj2rB7Y2ql4XbS+Q0ZtDsClPyxLPu1EwMtucLEgaSQSDlc3rjRfkgzPGNZviraCFeIooj9FdKqL4z9M=
X-Received: by 2002:a50:ee0b:0:b0:58d:836e:5d83 with SMTP id
 4fb4d7f45d1cf-594ba59f8eamr10226955a12.22.1720989703622; Sun, 14 Jul 2024
 13:41:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+3zgmsCgQs_LVV6fOwu3v2t_Vd=C3Wrv9QrbNpsmMq4RD=ZoQ@mail.gmail.com>
 <20240714173043.668756e4@foxbook> <ZpP3RU-MKb4pMmZH@eldamar.lan>
In-Reply-To: <ZpP3RU-MKb4pMmZH@eldamar.lan>
From: Tim Lewis <elatllat@gmail.com>
Date: Sun, 14 Jul 2024 16:41:31 -0400
Message-ID: <CA+3zgmtwunPaLbKygi0y+XY7XUd2cBGVP8So8MXxK_1pOX3miQ@mail.gmail.com>
Subject: Re: [PATCH 6.1 000/102] 6.1.98-rc1 review
To: gregkh@linuxfoundation.org
Cc: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	mathias.nyman@linux.intel.com, niklas.neronin@linux.intel.com, 
	stable@vger.kernel.org, regressions@lists.linux.dev, 
	Salvatore Bonaccorso <carnil@debian.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 14, 2024 at 11:32=E2=80=AFAM Micha=C5=82 Pecio <michal.pecio@gm=
ail.com> wrote:
>  see if my suggested solution works.

On Sun, Jul 14, 2024 at 12:05=E2=80=AFPM Salvatore Bonaccorso <carnil@debia=
n.org> wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D219039

Not on 6.1.y:
    drivers/usb/host/xhci-ring.c:2644:31: error: ~@~Xir~@~Y undeclared
(first use in this fuunction); did you mean ~@~Xidr~@~Y?
    2644 |                 inc_deq(xhci, ir->event_ring);

On Sun, Jul 14, 2024 at 2:30=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org=
> wrote:
> Ick

We now have 3 USB HDD Vendors that are reported to crash the kernel
because of this patch.  I think it best we take time to sort out the
long standing minor issue this patch is for, after we quickly revert
the major issues it is causing. Can we get it removed from 6.6.y and
older branches for the hopefully soon next release?

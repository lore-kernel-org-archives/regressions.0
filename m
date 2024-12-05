Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D312770C;
	Thu,  5 Dec 2024 07:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733384208; cv=none; b=ubtAASZyYTEEZduWkg/l8FI2es1lxHJIu4UsHugvpPzCn5/P+iGmGK/647dohUWCrIzO0FTDFg8r/LGzahjw/ZPVB4Y+fVQTHHIInEgkd01nSA+6dr8KMeUPOV/ludj2JLYR5oPujS6b17SIdQUayqAbDM7CvoofFSf9g+NC98Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733384208; c=relaxed/simple;
	bh=bv5VA+Cju/JsKSTeQi9eqs6SdGH8tjxntLJPWxrPhSA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TFAdys9AKy3TC4Fysi/Cl9TAeRsorxFWuapseH7JlEKEAZXlTfqUSpxR/U0AQJpeW0Fjh4TwbRszZCokLXfJj/P+/BfAw3Z9AU4av0CRlfjwuGvqlHfSmGP3WySICBtf3rkGmEw/unzTYLaDd6C1CTUWM0jm9uaBHVoXgdxEVxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CYLRIq4d; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CYLRIq4d"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2ffc357ea33so5025891fa.0;
        Wed, 04 Dec 2024 23:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733384204; x=1733989004; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6uJgGFu4A4xX1u6Opk5GLS5w5FpXRFEhH+tkFsox2WY=;
        b=CYLRIq4dG3e2ugQ5MbuPPpkW3gzknnYT3Wi3XOLENgXo53TLZhDLodeeJGDTDw4n8K
         MTvZ7SPQRlpuyYLqYxBKfV6zik49f00qW3wrmHX9r98QE3ATIon9u93LU5PT2IJ6ZcI4
         G7vydf+mP/nYKAeTCpFS4RYFeAbLJRrdGKGMp7ii9rYWpj0iG7YoyzMpe3OAMv8v3Pmp
         jcZV8L69HeE65nzpJtRHVCMZDZWHoywrMK1zD7oIS4WxZdx8NTGUmrLCDls6YD8VQGgP
         bmf1xks8s588AQ+544dEwFpH+RUjtUhSWwNQjFsmjEkqkbm+Y40VkeOQaK2/aNbwI3Kw
         g4Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733384204; x=1733989004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6uJgGFu4A4xX1u6Opk5GLS5w5FpXRFEhH+tkFsox2WY=;
        b=qJ8s9OQzEKjfW8rZWVFsiruTiF43BMPIhpwuQwHW2lmT0QYaoAuA9PLacoqNSzWiml
         SsXdUbRlWz2aqS3zNhboWbZCRRHovPqib1U6MTwG/cyGbRNGHuJYzUueQ6o4/fMU2VU8
         mpHa+qHJcbAWPMGk+9cQV7kDn6d3CPVyHEnkykEE4Mn4agWaRtc9Obx0qJEHhG7lVM7f
         gPRdUjjKbH4G8QH0t6+gLKRo/4602Ggc/cJX+GRLU08DfI0hRWb3GVEd458IazPRl9W3
         uW8DQHj0kkA3BMGaq7S83rhUZcR/JAi1Sv3EAWfSxzZJAJpUEeuYRXqU6yRmr7chmwBD
         wvRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFt/qO4Cyz/vUS12uj7Jr7M0qscEzNSNLyzK+a1f89e5sOs+gmQp4lD2dpeIeO+E+KIs1aubc8THnRXdTkP/I=@lists.linux.dev, AJvYcCX54UsTnwXgWMdgMql20ueB+djgNa6N8q7vlr1+g87JYNy6/DPjCBrZmX9Kpy9BEnj+0ybAsubYCh2HBOw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwcMZLGfYZ8iWrzLYfAYb+XZy5Ebq7FqFPpUlbMIpnaxrJQE8cF
	HuSxzlsfsnJryyu8qpZuRujqQoIwJyDBnFi82tGQPBhjbh3UQKkGlO4ZU63e4U7EsHM+BlwKL3R
	bKx7bsgix/NjBLMF+U6XrsaueslA=
X-Gm-Gg: ASbGnct56vnUjfve066/0DgnRRt+Atz94gWOsDuRTazBKutbRZUyE7NW9iK+AqkZInq
	bNBCS9mTYiJ2wSV0tinRt2/jO59NovCI=
X-Google-Smtp-Source: AGHT+IEFMj92jqFqXsdeLuswrg7iDuNWpUsTnXe48DLQx8qptEQPnpVAuFFRYKQFTS+vhOOxqF7TyE166c1MM8QpnQ4=
X-Received: by 2002:a2e:bc83:0:b0:2fb:955e:5c17 with SMTP id
 38308e7fff4ca-30009cc52cfmr39878681fa.40.1733384204322; Wed, 04 Dec 2024
 23:36:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241115171712.427535-1-laura.nao@collabora.com> <20241204155305.444280-1-laura.nao@collabora.com>
In-Reply-To: <20241204155305.444280-1-laura.nao@collabora.com>
From: Uros Bizjak <ubizjak@gmail.com>
Date: Thu, 5 Dec 2024 08:36:33 +0100
Message-ID: <CAFULd4a+GjfN5EgPM-utJNfwo5vQ9Sq+uqXJ62eP9ed7bBJ50w@mail.gmail.com>
Subject: Re: [REGRESSION] module BTF validation failure (Error -22) on next
To: Laura Nao <laura.nao@collabora.com>
Cc: alan.maguire@oracle.com, bpf@vger.kernel.org, 
	chrome-platform@lists.linux.dev, kernel@collabora.com, 
	linux-kernel@vger.kernel.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 4, 2024 at 4:52=E2=80=AFPM Laura Nao <laura.nao@collabora.com> =
wrote:
>
> On 11/15/24 18:17, Laura Nao wrote:
> > I managed to reproduce the issue locally and I've uploaded the vmlinux[=
1]
> > (stripped of DWARF data) and vmlinux.raw[2] files, as well as one of th=
e
> > modules[3] and its btf data[4] extracted with:
> >
> > bpftool -B vmlinux btf dump file cros_kbd_led_backlight.ko > cros_kbd_l=
ed_backlight.ko.raw
> >
> > Looking again at the logs[5], I've noticed the following is reported:
> >
> > [    0.415885] BPF:    type_id=3D115803 offset=3D177920 size=3D1152
> > [    0.416029] BPF:
> > [    0.416083] BPF: Invalid offset
> > [    0.416165] BPF:
> >
> > There are two different definitions of rcu_data in '.data..percpu', one
> > is a struct and the other is an integer:
> >
> > type_id=3D115801 offset=3D177920 size=3D1152 (VAR 'rcu_data')
> > type_id=3D115803 offset=3D177920 size=3D1152 (VAR 'rcu_data')
> >
> > [115801] VAR 'rcu_data' type_id=3D115572, linkage=3Dstatic
> > [115803] VAR 'rcu_data' type_id=3D1, linkage=3Dstatic
> >
> > [115572] STRUCT 'rcu_data' size=3D1152 vlen=3D69
> > [1] INT 'long unsigned int' size=3D8 bits_offset=3D0 nr_bits=3D64 encod=
ing=3D(none)
> >
> > I assume that's not expected, correct?
> >
> > I'll dig a bit deeper and report back if I can find anything else.
>
> I ran a bisection, and it appears the culprit commit is:
> https://lore.kernel.org/all/20241021080856.48746-2-ubizjak@gmail.com/
>
> Hi Uros, do you have any suggestions or insights on resolving this issue?

There is a stray ";" at the end of the #define, perhaps this makes a differ=
ence:

+#define PERCPU_PTR(__p) \
+ (typeof(*(__p)) __force __kernel *)(__p);
+

and SHIFT_PERCPU_PTR macro now expands to:

RELOC_HIDE((typeof(*(p)) __force __kernel *)(p);, (offset))

A follow-up patch in the series changes PERCPU_PTR macro to:

#define PERCPU_PTR(__p) \
({ \
unsigned long __pcpu_ptr =3D (__force unsigned long)(__p); \
(typeof(*(__p)) __force __kernel *)(__pcpu_ptr); \
})

so this should again correctly cast the value.

Uros.

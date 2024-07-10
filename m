Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CBF17BB31
	for <regressions@lists.linux.dev>; Wed, 10 Jul 2024 09:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720603480; cv=none; b=LnKxlB8JHGzWDXXpJfZVynAIIjhv1vq41rtDXYYvDE6j9PnwX1W6kcfuC6ocThIeQ1OXqnWoRb4ZWYVZTsQPcAKRtHN1kQB8+VXI29WYZ/s4JqKRhgZ5BwJIOWDT92iN22AO1vrVeSdf2M8ADOmU7qVuoRlDzRZcn5d72Ino7p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720603480; c=relaxed/simple;
	bh=mt5D8AY+7EO0szlXthTVjPtn1EMLtk1kIsZWF6D2fXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P1F001cHHgfuRatSkpuJSuRX1xHejVflbgZiEmMBAoVILnmfAA81ubpzlzg96dGNbuBVdfy+7MWeQD734c0vAoJE9I1EwTiOOMdk66AK3TO6vymO2a3QCIKQ2puY9u/eq8ONH5kh1INHIj5HIU+Znk2x0F0gX29UkZS9WtuN87M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NGkKmKjj; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NGkKmKjj"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-447e221150cso1742391cf.3
        for <regressions@lists.linux.dev>; Wed, 10 Jul 2024 02:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720603477; x=1721208277; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWMHgpbIy0GnN29ystn44vJIYgOS+Ps6swBxJ3oTQT8=;
        b=NGkKmKjjopYS0BC7ebpypJ9EgPFu9ht0VSo/Q//BCDnlgHe5sKqPQpqMqfDovGG1Q9
         j6WwoLhtGKme6TFGxb7Q4oW92PDWiwojQEe5TTeBXtddtP891ULI9CLLG+reotNBmEpl
         5zb/WcGvjwNiJsooz2dsS/ALZRbeWZzAHDnrmF/P7nqXRSLUbxYl1Xf3Ylk+9DV5S5Hg
         irAHuTbrWLhcE4UFyG1yOZxiF6GN6WV8wbB69yv08qARrF8uWfhNsrb42Pc0teMevU5d
         zylIg9GzTdMZZVhb+gbIISjVfoeI6NrJCY2IHN0nZfyr53etUDvoj9oSRa2DlD58IhXR
         aSYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720603477; x=1721208277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eWMHgpbIy0GnN29ystn44vJIYgOS+Ps6swBxJ3oTQT8=;
        b=twuvPzsRZGhGTXdk2uKwmWGgOmZGfmvZ0+JyYeAWTll7XrVSo5SZujZZ37TTUKS2bC
         +NxL+l2Y0c1LtqufxRfrfFn8N+W1zNcdMNghl82ZYri65SxgsVJAERfHRszY3ABe2h71
         ViLzs6X14RS0eN+x7o6P+4K+mSpBhfwArHz39LoKBJ3b4tF+FyCqUCIEnedIo9MV5GK9
         UonS5vE4HcqMIh1+QjfFPj8ZGzbI27L3cuV60xcjxctc5Xxj57zLofAp/ht2LgneFpmu
         5ScP0yRtXL21mFrC9Ena+6Mewy+v1MyKvmhLt3PKGZKO2CKJgzmeML2El/8NEHjGKM4c
         HR8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVpWHl4SjulQTs9ZGzp7WzvIQOdJ7POmt+jrFcmIu9YdZ24Ow/BV5Pi6zhJjLFwdnPU0/RR/MJ20qQ2O24s/5bfLMDnMUdHNJRrono=
X-Gm-Message-State: AOJu0YyIZq1MPmggpH04VBJ8Hbo61jiiBuF+6/MOixXo2Y36LT1avUCk
	X269iLFJmdKdEXwhhTUrnL3KjpMu6Q8oaw9g/U/EJE3PGvenB7VNTqM3qWrdnkqeD/V1bVed44j
	r3Q0acaYYw2/CDawW6KnpqbcNLAk=
X-Google-Smtp-Source: AGHT+IF7E8zn61udfFE2MLrr5RfDLaBzXvM82WJiBjIRP1r9i+9UFnsbu3O6AeiGCBZSYyYR7HPPSUE7OQ7NYaQcYK8=
X-Received: by 2002:ad4:5b8f:0:b0:6b5:ec9a:41ef with SMTP id
 6a1803df08f44-6b61bca42a1mr53442686d6.2.1720603477379; Wed, 10 Jul 2024
 02:24:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CABXGCsMmmb36ym8hVNGTiU8yfUS_cGvoUmGCcBrGWq9OxTrs+A@mail.gmail.com>
 <CAL3q7H4yBx7EAwTWWRboK78nhCbzy1YnXGYVsazWs+VxNYDBmA@mail.gmail.com>
 <CABXGCsMWYaxZry+VDCgP=UM7c9do+JYSKdHAbCcx5=xEwXjE6Q@mail.gmail.com>
 <CAL3q7H7Xb9FQx-5PMQtK_-reMq-cbfysCx6s-ZOWL1FUPSm8sA@mail.gmail.com>
 <CABXGCsP9tSwgR4dN-k97maqHB1KOtykakmHNz78SYbAuHydUTQ@mail.gmail.com>
 <CAL3q7H6vG6PEKjcsXtSuq=yks_g-MczAz_-V96QSZCs9ezRZpg@mail.gmail.com>
 <CAL3q7H5RC6dinsA2KLtus07jxDuY1PecPXbhYOWtW+nVyzXwuA@mail.gmail.com>
 <CAL3q7H4MiarsqxSMc0OzY2TNRk8J7Lg+89MaPHY2+NPO-EcDgQ@mail.gmail.com>
 <CAK-xaQYYx6SPQaOVwL+ardB0y5LzYJw9a_hfWWtVEZ=y1rXq5w@mail.gmail.com>
 <CAL3q7H74jpSoMvvkSvmrtB_VGiscz8zN5aHnApWuYU+hpKe+rA@mail.gmail.com>
 <CAL3q7H6V9M0B4jmW79keUtTdjWsabyWZeU5g4KEN5_-a+wEHVQ@mail.gmail.com>
 <CAK-xaQZ=c7aociwZ5YQreTmT+sBLGdH0rkTKmFzt4i_mrXBmgg@mail.gmail.com>
 <CAK-xaQb2OrgNOKKXp8d_43kqMNyuHxS1V8jSDL6PdNZPTv79+g@mail.gmail.com>
 <CAK-xaQZ25nyCeOvMs0G31sL7R71dxQqZhx61cYzTK7rZD-JxeQ@mail.gmail.com>
 <CAL3q7H4D8Sq1-pbgZb8J_0VeNO=MZqDYPM7aauXqLHDM70UmAg@mail.gmail.com>
 <CAK-xaQaesuU-TjDQcXgbjoNbZa0Y2qLHtSu5efy99EUDVnuhUg@mail.gmail.com>
 <CAK-xaQbcpzvH1uGiDa04g1NrQsBMnyH2z-FPC4CdS=GDfRCsLg@mail.gmail.com>
 <CAL3q7H63GexJexkDxSz9Av_s=XyYotJqLqjUubZmuU7vynaQNQ@mail.gmail.com>
 <CABXGCsO_6cJruBxKdqXzEze_hDGVsPtN8DBCob=OWF5OpT4s7Q@mail.gmail.com>
 <CAL3q7H46BxXUnrZ8Q3WxYf=2Tx0taMt9-2wf0TCrwj_kOiC=Dg@mail.gmail.com>
 <CABXGCsOcpzy7QvRUuSDT-Ouvp_jJHDvuziPQbej4rHLh9te58g@mail.gmail.com> <CAL3q7H6FwUFKb5oODK8jcAbRbjTjsZ2=4usW1_4A6b-t5nF7ng@mail.gmail.com>
In-Reply-To: <CAL3q7H6FwUFKb5oODK8jcAbRbjTjsZ2=4usW1_4A6b-t5nF7ng@mail.gmail.com>
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
Date: Wed, 10 Jul 2024 14:24:25 +0500
Message-ID: <CABXGCsP_V-Dh97SkLbYZvHSUdfhgXY_-RSqdRwv16hz+r3B3FQ@mail.gmail.com>
Subject: Re: 6.10/regression/bisected - after f1d97e769152 I spotted increased
 execution time of the kswapd0 process and symptoms as if there is not enough memory
To: Filipe Manana <fdmanana@kernel.org>
Cc: Andrea Gelmini <andrea.gelmini@gmail.com>, 
	Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, 
	Linux regressions mailing list <regressions@lists.linux.dev>, Btrfs BTRFS <linux-btrfs@vger.kernel.org>, 
	dsterba@suse.com, josef@toxicpanda.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 8, 2024 at 7:16=E2=80=AFPM Filipe Manana <fdmanana@kernel.org> =
wrote:
>
> That's weird, I think you might be observing some variance.
> I noticed that too for your reports of the test2 branch and the old
> test3 branch, which were very identical, yet you got a very
> significant difference between them.
>
> Thanks.
>

up  1:00
root         269 10.2  0.0      0     0 ?        S    10:06   6:13 [kswapd0=
]
up  2:01
root         269  9.1  0.0      0     0 ?        S    10:06  11:07 [kswapd0=
]
up  3:00
root         269  8.4  0.0      0     0 ?        R    10:06  15:18 [kswapd0=
]
up  4:21
root         269 11.7  0.0      0     0 ?        S    10:06  30:33 [kswapd0=
]
up  5:01
root         269 11.7  0.0      0     0 ?        S    10:06  35:19 [kswapd0=
]
up  6:27
root         269 11.5  0.0      0     0 ?        S    10:06  44:39 [kswapd0=
]
up  7:00
root         269 11.2  0.0      0     0 ?        R    10:06  47:18 [kswapd0=
]

The measurement error can reach =C2=B110 min.
Did you plan to merge the fix before the 6.10 release?

--=20
Best Regards,
Mike Gavrilov.

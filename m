Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598E53A6F06
	for <regressions@lists.linux.dev>; Sun, 20 Sep 2026 18:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789928804; cv=none; b=NNZ5G7uFhCpw+0Dzlz5pV+0IAQd5v9P95eKh3fmhFX06k0MiW1bxRb4HkidnLRqGeQATFYVweK7YWb3ZIXhhtxmj6jBIvbP/k7GJz8Cr9Uz4Nn+xn+Mz7WKkLvKKSO0gm25/MQc3zERy9xETSClwS56FuGzCBQH4SmrzpQW3dw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789928804; c=relaxed/simple;
	bh=ctybYDdvZO9pIksP2ULzpuote3bRNon18HCDYrLfzLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IM/oILMc+lJkg+DzJeyyYwlyMzHCzAbZfE5Nmx0Tjk00/Eskj53AcVDscZm02RkB1eKSC76LbtGYW0LTRYN9mJb2TZ75lRoOVq32bCq59kPZBHoE1nfmB9IaWtaIl4TzxUhfiSDEPd+IgGEWKrJdHJqYxtoyrAObOJ5ASLD2f9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Sz8AVNfN; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Sz8AVNfN"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f6c7a56so263766866b.1
        for <regressions@lists.linux.dev>; Sun, 20 Sep 2026 11:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1789928800; x=1790533600; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L5ry7l4Exlxh1M/3zvxmesO5D+d/+A8q4/muqEbWO2I=;
        b=Sz8AVNfNcBwy3QdKqm4BGXJ9jZPklyC1zmEnaxqFfi6V8mpUzyNErOJCtcwqbwoT6o
         71/CM/qA4+Psgz9fxDlZ4JMAwjOznqkiedJY9+nsGY2AHVMgZQ9atQ7NSBh1p1TNDrLE
         EfLqcGVEv2RHDUEAVil8MW7hDyHr00V5s/swk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789928800; x=1790533600;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=L5ry7l4Exlxh1M/3zvxmesO5D+d/+A8q4/muqEbWO2I=;
        b=lC4vq/kp/xyEORjvrhoEWMXHq5lTl8uGC3a3xSFKTEvfXvWHFGVuheHGy9Ui2eRaBc
         ncZur1KnXEFsIPiS3rGeCAuRx+0JSJUgg5Qv6xAq3pFn9ETmshWP1JZz3l/ecRGvfPfs
         +POeXzwYATjy3J93cTf8XPgOQ509E42ghKelPfq7Jf0X3i+u9KodYs5MjcYwajnZNz2y
         nYuRAd7aNBbHJbH0t44ntS96MHypl9usFQpGwOaW6dOvVyzyVT/METFEbt41+c4sCwdO
         jwD2wDPyVugkvqsuZ/wRfoSiOf1aa8y3c/PjkIRytpzHxvV36V3s+scmsjoze9LmY5D/
         wz4w==
X-Gm-Message-State: AFuF++k+mQG17Qz7sE+uJRmubYXjVnV8PZBl2yilTZucxMGoVQ8XkIDR
	4TpE2+63CwSbRFKWgZc3hJw5OEhbPVqsZnypHLMflDkMkjPbVBD4vacGO0onFTWKN2EovExOKTY
	BHZy1zSM=
X-Gm-Gg: AYBFou2Noesi4BlW+3jBNHMQM7Nk42i4DcB3jdqzda/kcBJNl6Qn7zTmIZdQmwdqpEr
	Oy4PNdfdzI+cSrGa3COi6JvzbirqrKrlvCbh7p5wcbSGIdCOzJvZ4zhe33LzTzI7/oUg6sM/D1Z
	TztRshbE1+2bnNBekYq8TIBoa4ifLoEqe/S3i0pBUSgyuRy0OY8P8CtAWwevMgOTTfK5MIWdUQo
	VTLoFiicE6Hv+4ONBTL3Fih1DDGL4ZYExaAI/H2QVpmrDJXd9tX3dfRG+fru/PRIGDeIZEECTwL
	2CPUfimKBuBeelr8pf6qCpwNBNVie9kqxvmR5KCidn2Q3qr31sILZbJEvMe2+DWCSI8AqBnTQbW
	Vk63BgPU8bxHIOsjnxSEF6mk17bDDAcIODqfM/RzNkHkgK78FCfPvQ6faiCfgVhLaiIOep66YVV
	VZgkH05Q/jnAfL18tOv/wjFqIMnwRHKXuMAThdnhvqz/Z4u5CiXe9wHXvsBauq6cynbkQDzKiHt
	5KGr8CIakzRzg/4ohm0iLdGNHeBcaN5LprhbBPWuGtsChXTQVA=
X-Received: by 2002:a17:907:9813:b0:c29:9691:ec9d with SMTP id a640c23a62f3a-c2a1580e502mr694665666b.22.1789928800463;
        Sun, 20 Sep 2026 11:26:40 -0700 (PDT)
Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com. [74.125.228.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a35745cfesm208299766b.38.2026.09.20.11.26.40
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Sep 2026 11:26:40 -0700 (PDT)
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f6c7a58so334455866b.2
        for <regressions@lists.linux.dev>; Sun, 20 Sep 2026 11:26:40 -0700 (PDT)
X-Received: by 2002:a17:906:f5a8:b0:c29:c356:6984 with SMTP id
 a640c23a62f3a-c2a1578857bmr728040866b.8.1789928799735; Sun, 20 Sep 2026
 11:26:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1f3e8e4b-2060-4edc-aa58-d2b7a68280ca@leemhuis.info> <20260920141608.2977460-1-linux@leemhuis.info>
In-Reply-To: <20260920141608.2977460-1-linux@leemhuis.info>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 20 Sep 2026 11:26:21 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgqFzLDVNk9wi5mwL7sPCDM9EvMPhP6R-v9HrSCNEFy=A@mail.gmail.com>
X-Gm-Features: AcwNN1WJl2lEERaMTEHFcx7Qicbe4cFRR8AKTibQLDiSq9zZEta_mcnAVC0bRVA
Message-ID: <CAHk-=wgqFzLDVNk9wi5mwL7sPCDM9EvMPhP6R-v9HrSCNEFy=A@mail.gmail.com>
Subject: Re: [PATCH] net: qrtr: resend HELLO on MHI resume
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 20 Sept 2026 at 07:16, Thorsten Leemhuis <linux@leemhuis.info> wrote:
>
> diff --git net/qrtr/af_qrtr.c net/qrtr/af_qrtr.c
> index 78347c937af76b..e7b3647424b8f1 100644
> --- net/qrtr/af_qrtr.c
> +++ net/qrtr/af_qrtr.c

How did you generate this diff? You have some very broken setup.

A real git diff should have had an extra path component, and looks like

  diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
  index 78347c937af7..e7b3647424b8 100644
  --- a/net/qrtr/af_qrtr.c
  +++ b/net/qrtr/af_qrtr.c

and I don't know what broken scripts you use that break that standard format.

I fixed it up in order to apply it, but you have a "--no-prefix" or
similar horror somewhere that needs to go away.

                Linus

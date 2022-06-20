Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D73E7F6
	for <regressions@lists.linux.dev>; Mon, 20 Jun 2022 08:46:14 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id a13so6251423lfr.10
        for <regressions@lists.linux.dev>; Mon, 20 Jun 2022 01:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u1whDq3La3S3wJgVVVKM0qwBvOFvGeuXT7fA+q99OCQ=;
        b=V239pbMCKN/cnAMGjzY9mC+X1m2kO5EGZR1i3QRsCdvpvMkEePnmREh2fw1V9HWtNI
         dF1fHkQ7x5SHHNQASACh//g6S7GX+3eSyCc34hFKHOqh6CBYpE7nTrPAA2R6welxzv/2
         59QyhkrLs90EaXvnYRuguAwASu4IqOfkUOdoHW8461Zi8phndwADahfZ8OIepPZ7i6GL
         d2nAiPODnHhxmKksaEnOcM2IhjS/IRcLZY4bUeiZqR070rLf9lSovbUzWBdWgKKaDXmt
         keILO88w74s73NA22xJmnVnUXIgjIB3FBMkx47nSifO6ZsNtCu1H/dkXIkHRrP95TLF3
         ZKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u1whDq3La3S3wJgVVVKM0qwBvOFvGeuXT7fA+q99OCQ=;
        b=is1zeVp63cVQM+/TRXP+5Odf4Dm8ajjl5bT2y8+1EvW6T1yVF6wYRD5ph76o7KT+QF
         OZjGeInrun30AkMH+vOVXBqlP5sHh10yN3gQqF7bCVYuPKwYGsOhxgQqdnvYKMTJaHlr
         YlNKsHAYNW7y5ci7zNAddKVjK6+UvxZRojb95R3bUx3ihUOJbeQQKs4t651naxtStvLB
         2LmUEh14Un3RulR14LiiNeSp3FxaV98Zd0+vzAI9dkjc1lJOtVLkbkxuOCyRBrxw7Azj
         Rz2mFUFyhTp/TpvW5yFXXD1PvoE3B4KehHvBY1MJd9f/74QoZr6VKz+DSgG3YCj3LvsA
         354g==
X-Gm-Message-State: AJIora8H+Bl4FSKf8nWECvq8RfbOxkPJLnZ3qO9Zn2UCX7BFgWipqY6k
	LXWdimjBH/vz7I+MNIbct9kJnjiYMU6bISW0l8vkavSm
X-Google-Smtp-Source: AGRyM1tLLMGw5ieWhJI63skLfDlhpysorYgbKd07rLRc7i/FCpQ38Ia2DihLPsWSqJRLR5Oa0d3t7Xsm/4l4w7LtM2A=
X-Received: by 2002:a05:6512:22d4:b0:47f:706b:23b5 with SMTP id
 g20-20020a05651222d400b0047f706b23b5mr1869776lfu.44.1655714770838; Mon, 20
 Jun 2022 01:46:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAM3i8OEGrux+ku7hL20oGO10f=CDLkpcg3wH6hRbheEdacWnfw@mail.gmail.com>
 <CAM3i8OF1mC21wzwfsvhQTK7PPa0myCwftyhA9U1r7HR_0Q3fLQ@mail.gmail.com>
In-Reply-To: <CAM3i8OF1mC21wzwfsvhQTK7PPa0myCwftyhA9U1r7HR_0Q3fLQ@mail.gmail.com>
From: "Ernesto Vigano'" <lanciadelsole@gmail.com>
Date: Mon, 20 Jun 2022 10:45:59 +0200
Message-ID: <CAM3i8OFjvOkLGELkrKEo3B7x0hP=uPrYaPL05=0WXygvYJNZCQ@mail.gmail.com>
Subject: Fwd: question on driver for phy dp83td510e
To: stable@vger.kernel.org
Cc: regressions@lists.linux.dev, o.rempel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"

I see that some weeks ago a driver for phy dp83td510e from TI
(https://www.ti.com/product/DP83TD510E).
I see that it's really different from the Linux driver supplied by TI
on its official repo
https://git.ti.com/gitweb?p=ti-analog-linux-kernel/dmurphy-analog.git;a=commit;h=fefa908e4e3262455a0cec08f3bb7161d7792d02
As an example, TI writes some undocumented register for version 1.0 of the PHY.

Should I forget about the TI driver?
Or is there something that should be integrated in
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/phy/dp83td510.c
?

Thanks

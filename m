Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5053C1E
	for <regressions@lists.linux.dev>; Sat,  2 Sep 2023 21:19:05 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-44e2bd06230so101456137.2
        for <regressions@lists.linux.dev>; Sat, 02 Sep 2023 14:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gsc-game.com; s=google; t=1693689544; x=1694294344; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dCexqn3rGuRVqnGmTMFIIq2uk/s4hulvRhNhslpFIPc=;
        b=MleTTrVfrIyjAmv+csFKn1CeYHGJ6bDmiyiDrKuT6WGC+twUL/XSxf8mDBAtkOgMKN
         E5qQhpG0XDBSlXq4wEFsdId61ntJA5jv99zm7f4tZ7a0qCrs0sKYZPc3kGAJbsyF2smL
         xo7XZPNPvUNvT7aqT9tYkDrAbihQ5LmS0+tViR4Ao1ln19DVwQGV5vC7Ex0mI/CfOP+w
         e0q42TwdzD5gXiFwURWi92zaaQR8vLZlDup4PmBZmL30zrRuJq7X5zfbD6H8SUI9HoeV
         PBdb5VqTyGlxu2L0op9xxV61XT/Qn1pIDnv21tjNSdmX+S29Lh9064qpiQWrPcwe2SQ8
         1t6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693689544; x=1694294344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dCexqn3rGuRVqnGmTMFIIq2uk/s4hulvRhNhslpFIPc=;
        b=V1yBOfvWnjVSZAWgwT8nB7KeYXFcuEN991DCEoUqBqcmRacrMQ45AChDDYTFDrSEcV
         Bis0tGWn9/AgN8Xk8n6HorRpm1EmvePdqZZzhfBcg8DWaMup19hgyYJ4D1m55q6+8mYs
         A9zZKLdFvzeIznQsGxX741gBxAF4qnJ/EQDEtVc+yjoGos7bmmpT5M3FnLBi4cc/uWvh
         WgXvqcLzwqzbzOID+rk9CnTnjmCXNgle8XvF4lS6vEwg/8ozUi/nns+klel0dQw76UZV
         xklR1M4AnRS7G8bC0TIZaSYt2nx2OH7ee8P5blAmyvR64TTjifXWsRPSpFbBQh41L3G/
         WbxA==
X-Gm-Message-State: AOJu0YzudGUJ9Ij8OIq6ocxenRGziNoPMT7izur+J4d0QhXS7cfkbZgJ
	w0MIJDTaDdtdSNNYR0YjvTWVi2tFDj6HH917Af78iyp9Xb5c/WYl
X-Google-Smtp-Source: AGHT+IHwcIqUxMCRKA1iuVinKA8kOPFhwhlerAInxwc6u0B9QAPLwBDuHldqmKbnknrcgOci5AJazLbN164YdERonUs=
X-Received: by 2002:a67:f1d1:0:b0:447:6cf0:7119 with SMTP id
 v17-20020a67f1d1000000b004476cf07119mr5825447vsm.30.1693689544284; Sat, 02
 Sep 2023 14:19:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAKH+VT3YLmAn0Y8=q37UTDShqxDLsqPcQ4hBMzY7HPn7zNx+RQ@mail.gmail.com>
 <2023090201-hybrid-footage-2622@gregkh>
In-Reply-To: <2023090201-hybrid-footage-2622@gregkh>
From: Serguei Ivantsov <manowar@gsc-game.com>
Date: Sat, 2 Sep 2023 23:18:53 +0200
Message-ID: <CAKH+VT0Cxcn=O_oUt=NSjTntwrHmVcLO9+JNRcoc9zsiLuS6Tg@mail.gmail.com>
Subject: Re: DRBD broken in kernel 6.5 and 6.5.1
To: Greg KH <gregkh@linuxfoundation.org>
Cc: regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Well, my bad, it appears there were more commits related to DRBD in 6.5
I'll try to find which is causing the issue.

--
 Serguei

On Sat, Sep 2, 2023 at 11:09=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Sat, Sep 02, 2023 at 10:37:04PM +0200, Serguei Ivantsov wrote:
> > Hello,
> >
> > After upgrading the kernel to 6.5 the system can't connect to the peer
> > (6.4.11) anymore.
> > I checked 6.5.1 - same issue.
> > All previous kernels including 6.4.14 are working just fine.
> > Checking the 6.5 changelog, I found commit
> > 9ae440b8fdd6772b6c007fa3d3766530a09c9045 which mentioned some changes
> > to DRBD.
>
> If you revert that change, does it work properly?
>
> If not, can you run 'git bisect' to try to find the offending change?
>
> thanks,
>
> greg k-h

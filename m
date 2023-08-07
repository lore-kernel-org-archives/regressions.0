Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF434434
	for <regressions@lists.linux.dev>; Mon,  7 Aug 2023 09:42:14 +0000 (UTC)
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-56d0deeca09so655537eaf.0
        for <regressions@lists.linux.dev>; Mon, 07 Aug 2023 02:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691401333; x=1692006133;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IK5JqTcazrnzFQkUb1pgAiTMlQXrShoQJmEX5JHWXhU=;
        b=XcoozLnsKg79P7H3OdyGsDW6PQfqUiDyKNzG2muW7Om8gcASHI4JqiHh7KedJbEu4u
         qUaGtgM3Kis5a+f+0ETot8QQsQwclE9J3tVWT/a/zlCBmSqkUDUJjJ7W17MtD839RgLT
         c7ZkhnM2OtemtU/0sAVKgsqZ5XyoUV5q9ZrFhcsa6uBoaa8x7zS2308LuDh/OA+XVN93
         dqLs4xC9qCZXlVKWrJhsue6M4+EJ96Y/MN81zy+TjEn8kBJDvE2SLv4m1jTTM85sg4SJ
         /07ibLsBY3UIOs0jzKcFEO6ffd9E0afhIKU6kLETd9rZNB6uZdv6APIU42VQfdIGFC0R
         +oIg==
X-Gm-Message-State: ABy/qLb+o0lE9tY63+yFbPEhvI3lUvfU8qT5fqrK1YYsOKEV8pY1EVLJ
	hRvaBY2Ky4PDr6j+f7Dmo7uuolm3wkkpQHwcrrY=
X-Google-Smtp-Source: APBJJlEb7O2dGAF/f7fTBx/HAisyhbmiTj3PawRftJoMI15JdDVqSBYI20CfGwr14y35bjypNJI9KK+xc439zbfSIBc=
X-Received: by 2002:a4a:cf14:0:b0:569:a08a:d9c5 with SMTP id
 l20-20020a4acf14000000b00569a08ad9c5mr19679264oos.0.1691401333651; Mon, 07
 Aug 2023 02:42:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230807083356.19222-2-vbabka@suse.cz>
In-Reply-To: <20230807083356.19222-2-vbabka@suse.cz>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 7 Aug 2023 11:41:58 +0200
Message-ID: <CAJZ5v0g_OjHSdM_oi515KQUrFZvZH4hNgCy4xknosQC+81GYhw@mail.gmail.com>
Subject: Re: [PATCH for 6.5 regression] PM: hibernate: fix resume_store()
 return value when hibernation not available
To: Vlastimil Babka <vbabka@suse.cz>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, Jens Axboe <axboe@kernel.dk>, 
	dm-devel@redhat.com, gregkh@linuxfoundation.org, hch@lst.de, 
	joern@lazybastard.org, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-pm@vger.kernel.org, loic.poulain@linaro.org, miquel.raynal@bootlin.com, 
	regressions@lists.linux.dev, richard@nod.at, snitzer@kernel.org, 
	vigneshr@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 7, 2023 at 10:34=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
>
> On a laptop with hibernation set up but not actively used, and with
> secure boot and lockdown enabled kernel, 6.5-rc1 gets stuck on boot with
> the following repeated messages:
>
>   A start job is running for Resume from hibernation using device /dev/sy=
stem/swap (24s / no limit)
>   lockdown_is_locked_down: 25311154 callbacks suppressed
>   Lockdown: systemd-hiberna: hibernation is restricted; see man kernel_lo=
ckdown.7
>   ...
>
> Checking the resume code leads to commit cc89c63e2fe3 ("PM: hibernate:
> move finding the resume device out of software_resume") which
> inadvertently changed the return value from resume_store() to 0 when
> !hibernation_available(). This apparently translates to userspace
> write() returning 0 as in number of bytes written, and userspace looping
> indefinitely in the attempt to write the intended value.
>
> Fix this by returning the full number of bytes that were to be written,
> as that's what was done before the commit.
>
> Fixes: cc89c63e2fe3 ("PM: hibernate: move finding the resume device out o=
f software_resume")
> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> Resend with review/ack tags added and not buried in the thread.
> Link: https://lore.kernel.org/all/2cfa5f55-1d68-8a4f-d049-13f42e0d1484@su=
se.cz/
>
>  kernel/power/hibernate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
> index e1b4bfa938dd..2b4a946a6ff5 100644
> --- a/kernel/power/hibernate.c
> +++ b/kernel/power/hibernate.c
> @@ -1166,7 +1166,7 @@ static ssize_t resume_store(struct kobject *kobj, s=
truct kobj_attribute *attr,
>         int error;
>
>         if (!hibernation_available())
> -               return 0;
> +               return n;
>
>         if (len && buf[len-1] =3D=3D '\n')
>                 len--;
> --

Applied as 6.5-rc material, thanks!

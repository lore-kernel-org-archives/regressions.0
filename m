Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8A822E36
	for <regressions@lists.linux.dev>; Tue,  6 Jun 2023 18:26:59 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-5ed99ebe076so63806226d6.2
        for <regressions@lists.linux.dev>; Tue, 06 Jun 2023 11:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686076018; x=1688668018;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EgWp+MBxEt8xLJXziW77AWY9c6lqc/rcXlQ+WkMys1I=;
        b=TFRaVkLcKLqFJPBQQ1ujtMNfkCzjmG3/6h7c3036WnXTH0IuSb0oXxXxiUEjKViAKQ
         AvQy7CYkQSCTnyhpd/mYXwSUxMdCdBjbIOjalvMI8mTg2ylUC/sBTaIcfZzfVPbE+i7L
         qslSw0agu6qTPH6NHQO6QLQ//i6VEZtn6dGlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686076018; x=1688668018;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EgWp+MBxEt8xLJXziW77AWY9c6lqc/rcXlQ+WkMys1I=;
        b=WO2dn4SqM5Cfa8R8PohtHjohwKz/Jhm7T525a8lRxWEumeRvzszJ1QfFGyqM1mBTPs
         Y9t7UOlYnlPypelzzCunE56pjoTXMLm36wBgIlgyknDhU1p2BYRye0x50GAHkyWE/kWO
         71nQgNvlpLwY+71R1bhqyyZJDhGS4oqHs2gzT5EdkDaWWhn7+pAwbI2vST+4givoi516
         +M92iuLxKdaX/boap/S8r/L71km64xCb0e1wmXUmN1lohLpSFUhU5ju3vqnQfukGrZBS
         uZrQgyUYZFRmiPI+S2nRxvftzp5aqy7KN7TWnnyr4TPtPOLbx0xT2tVxPPLhzf6ofk1d
         Fg3A==
X-Gm-Message-State: AC+VfDxhMT8Yal0wXMj4xpJUc5/tMiYSXIixNKQiUfmj3nGIdGfKiE3k
	THlEh5e1NkXiDMt+LpZcHchfQnSKw+hBy1gS/Z8=
X-Google-Smtp-Source: ACHHUZ4LKDO2kddOrJYBmTrluYNk4s031zX6Qbnfh758BQrQQ7ZWwqYEaOmJv/Ec/6PR7S6VBNZe5A==
X-Received: by 2002:a05:6214:5090:b0:62b:4590:78e4 with SMTP id kk16-20020a056214509000b0062b459078e4mr448030qvb.28.1686076018442;
        Tue, 06 Jun 2023 11:26:58 -0700 (PDT)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com. [209.85.219.54])
        by smtp.gmail.com with ESMTPSA id v12-20020a0ccd8c000000b006261c80d76dsm5532237qvm.71.2023.06.06.11.26.57
        for <regressions@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 11:26:57 -0700 (PDT)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-5ed99ebe076so63806006d6.2
        for <regressions@lists.linux.dev>; Tue, 06 Jun 2023 11:26:57 -0700 (PDT)
X-Received: by 2002:a05:6214:250d:b0:625:aa49:9abd with SMTP id
 gf13-20020a056214250d00b00625aa499abdmr329934qvb.65.1686076017218; Tue, 06
 Jun 2023 11:26:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230606170919.GJ25679@pendragon.ideasonboard.com> <20230606171150.12875-1-laurent.pinchart@ideasonboard.com>
In-Reply-To: <20230606171150.12875-1-laurent.pinchart@ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 6 Jun 2023 20:26:46 +0200
X-Gmail-Original-Message-ID: <CANiDSCsQJB7bL2ObW2BssK4igEJ2ME3DU-RvsU4wkSoHbnTcfw@mail.gmail.com>
Message-ID: <CANiDSCsQJB7bL2ObW2BssK4igEJ2ME3DU-RvsU4wkSoHbnTcfw@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Fix menu count handling for userspace XU mappings
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Poncho <poncho@spahan.ch>, 
	"Linux regression tracking (Thorsten Leemhuis)" <regressions@leemhuis.info>, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Laurent

On Tue, 6 Jun 2023 at 19:11, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> When commit 716c330433e3 ("media: uvcvideo: Use standard names for
> menus") reworked the handling of menu controls, it inadvertently
> replaced a GENMASK(n - 1, 0) with a BIT_MASK(n). The latter isn't
> equivalent to the former, which broke adding XU mappings from userspace.
> Fix it.

Ups, that was wrong :), sorry about that

Thanks for the quick fix.

>
> Reported-by: Poncho <poncho@spahan.ch>
> Link: https://lore.kernel.org/linux-media/468a36ec-c3ac-cb47-e12f-5906239ae3cd@spahan.ch/
> Fixes: 716c330433e3 ("media: uvcvideo: Use standard names for menus")
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> This is untested. Poncho, would you be able to test this patch to see if
> it fixes your issue ?
> ---
>  drivers/media/usb/uvc/uvc_v4l2.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v4l2.c
> index 5ac2a424b13d..f4988f03640a 100644
> --- a/drivers/media/usb/uvc/uvc_v4l2.c
> +++ b/drivers/media/usb/uvc/uvc_v4l2.c
> @@ -45,7 +45,7 @@ static int uvc_control_add_xu_mapping(struct uvc_video_chain *chain,
>         map->menu_names = NULL;
>         map->menu_mapping = NULL;
>
> -       map->menu_mask = BIT_MASK(xmap->menu_count);
> +       map->menu_mask = GENMASK(xmap->menu_count - 1, 0);
>
>         size = xmap->menu_count * sizeof(*map->menu_mapping);
>         map->menu_mapping = kzalloc(size, GFP_KERNEL);
> --
> Regards,
>
> Laurent Pinchart
>


-- 
Ricardo Ribalda

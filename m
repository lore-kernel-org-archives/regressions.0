Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB9415491
	for <regressions@lists.linux.dev>; Mon, 15 Jul 2024 19:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721071983; cv=none; b=YATssbw5ECxYvY/CYGLUJcVdgUp54v9P9bGyigLZAI1A5caix4CEc3/9486G19dSQiLc0mOQjbT/el1yIT1cX9/gQ16Abq4wbgNJcmrQwUUCMBhh1QrmsRd/u3+5rEIunvfeZlVovisNSOq0mTtDA5dUtBWolkuA0LsxTdUNcxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721071983; c=relaxed/simple;
	bh=GFaV9BV7YR+i2gxGnV/UWYI/2XgJoSuqpoWhzjmf8OE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XKAVafHfgm/hD2q72bwlSQshNoEASC3b8sRS8WemZFUuo4D8EwwSVAtJI/AeCbqrkiow4HPF9BAMK3usy+rY5XwzCO7QXtAfwafRyNkeaIfiTn7Tfd/6bFaKTsVrwUfkP/mKRCSxmDPK44bb9QaaO0JtqQ0xIymhrr2d5PeuWbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=SGS+O1jv; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="SGS+O1jv"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-64f4fd64773so52791937b3.0
        for <regressions@lists.linux.dev>; Mon, 15 Jul 2024 12:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1721071981; x=1721676781; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wX6VVF5zo6QpIl0GNcjuj6SmcU0Q6kPt3Zxz4lR//To=;
        b=SGS+O1jvSpU7byM2mcv/4A7ZKshUKoUFny1QZaRnJiHrQc8P3x3vjpIfackvsgJ1L4
         Ri2njyfaDLaTpS8Sk9XNa8Q1w8ZFaXYmHjECN6I7BespArkYVXxxYL/wIDAMHoQjnSnZ
         cS+hbCxxDXvBS9HY38TU6+e1aWBnEejUWKLIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721071981; x=1721676781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wX6VVF5zo6QpIl0GNcjuj6SmcU0Q6kPt3Zxz4lR//To=;
        b=vsEeAqCUhxbo4jR2qVHwp5NUg0iv7KItn/Etr0VyccY/oBIrmutCHNU8GkbdWOBrt1
         gIOcShgKqM0L976wg1jZosQs0ncqWW/HQz4vcCC+uLROHh3QfTP1VM6rX0QiGY1MmbnJ
         Y+vHbLuduqJeqtw5aRGl6+JzFCeSukChUyG9nmK2FTsaV9VeaF+RBB2Qkn58ommgznhg
         Fk8EPOZMqXiACvUBfn7CSefq/ZNmeK+fR1QOuszPgC/f5lfStpKSITgVWSbJ9566qQSc
         6gahXX+NWCUqD6dyzFr6HmenTEPlKZn1CUEm1aoywHx8SNtdysX5keTUeySNoGi+g7+r
         YgeA==
X-Forwarded-Encrypted: i=1; AJvYcCUX2eD2zKT7hrw1KfiaxUMHDvgN3Yq84AdM2xuRZUix6aNvr1VQPci+M0l4dWSckGCJEBcgX6Sfrn+2EUpwY6Adw131z5wkFj+tbbs=
X-Gm-Message-State: AOJu0Yw/pCJRaepQIj/lHYEMCBImp+6YY5lO28Yn/QhgMQWImcsEoyVj
	q5NUlQeLoohxdoM9t9ZnfHDYjCwZnkMARRWCZQjPRzPGJt6g0s13E2no5MJIywe5GzTWu+rIcTm
	WQhOKqTlyJP5SuSYfRi1WT+76FTd7SnrV1EPa
X-Google-Smtp-Source: AGHT+IFGwqsnaPAj7mqNI8+vo6+/u0K0j2UFb+UYDBq3/3ucIPqVmkkyljDrQrw6oWynXU33+vEOIFDTYxIYzTAJHRs=
X-Received: by 2002:a0d:c183:0:b0:65f:ca0b:5ad9 with SMTP id
 00721157ae682-66354d75631mr5659897b3.25.1721071980901; Mon, 15 Jul 2024
 12:33:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <bd9cb3c7-90e8-435d-bc28-0e38fee58977@schmorgal.com>
In-Reply-To: <bd9cb3c7-90e8-435d-bc28-0e38fee58977@schmorgal.com>
From: Ian Forbes <ian.forbes@broadcom.com>
Date: Mon, 15 Jul 2024 14:32:50 -0500
Message-ID: <CAO6MGtjxnm3Hc=T8jv-upP46XBzAc0ZNmLVF3=KNN8buGBwg1w@mail.gmail.com>
Subject: Re: [REGRESSION] drm/vmwgfx shows green Xv instead of actual video
 (bisected I think)
To: Doug Brown <doug@schmorgal.com>
Cc: Zack Rusin <zack.rusin@broadcom.com>, dri-devel@lists.freedesktop.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Doug,

Can you try this patch with 6.10.

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
index c45b4724e414..e20f64b67b26 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
@@ -92,7 +92,7 @@ static int vmw_overlay_send_put(struct vmw_private *dev_p=
riv,
 {
        struct vmw_escape_video_flush *flush;
        size_t fifo_size;
-       bool have_so =3D (dev_priv->active_display_unit =3D=3D vmw_du_scree=
n_object);
+       bool have_so =3D (dev_priv->active_display_unit !=3D vmw_du_legacy)=
;
        int i, num_items;
        SVGAGuestPtr ptr;


On Thu, Jul 11, 2024 at 3:37=E2=80=AFPM Doug Brown <doug@schmorgal.com> wro=
te:
>
> Hello,
>
> I have discovered a problem in vmwgfx that caused Xv playback to break
> between v6.3 and v6.4-rc1. In v6.3, inside of an Ubuntu 24.04 VMware VM
> with 3D acceleration disabled, I can run the following GStreamer command
> ("sudo apt install gstreamer1.0-tools" if you don't already have it):
>
> gst-launch-1.0 videotestsrc !
> video/x-raw,format=3DYV12,width=3D640,height=3D480 ! xvimagesink
>
> And it works fine, showing a test pattern.
>
> In v6.4-rc1 and all the way up to a build I just made today of Linus's
> latest master branch and also including Zack's latest patchset [1]:
>
> Linux doug-Ubuntu-MATE-2404 6.10.0-rc7+ #55 SMP PREEMPT_DYNAMIC Thu Jul
> 11 12:46:06 PDT 2024 x86_64 x86_64 x86_64 GNU/Linux
>
> ...if I run the same command, the GStreamer window shows up containing
> solid green rather than the test pattern.
>
> I believe I have bisected the problem to commit:
>
> 39985eea5a6d ("drm/vmwgfx: Abstract placement selection")
>
> However, the bisect process was complicated because two earlier commits
> temporarily broke vmwgfx so I had to undo them during bisection, which
> also required some conflict resolution:
>
> 180253782038 ("drm/ttm: stop allocating dummy resources during BO
> creation") and
> f87c1f0b7b79 ("drm/ttm: prevent moving of pinned BOs")
>
> Note that if you have gstreamer1.0-vaapi installed, you should
> temporarily remove it first before testing because there is a separate
> Xorg bug that causes Xorg to crash when you run the above command if
> gstreamer1.0-vaapi is installed.
>
> I'm happy to do any further testing as needed. I've reproduced this
> problem across several different machines and distros. A fully-updated
> Arch Linux is also affected.
>
> As a side note, that same gst-launch-1.0 command is also currently
> broken with 3D acceleration enabled, but that's a separate issue in mesa
> that I've submitted a patch for [2].
>
> Thanks,
> Doug
>
> [1]
> https://lore.kernel.org/all/20240702021254.1610188-1-zack.rusin@broadcom.=
com/#t
> [2] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/30116
>
> #regzbot introduced: v6.3..v6.4-rc1

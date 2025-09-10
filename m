Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88892D2496
	for <regressions@lists.linux.dev>; Wed, 10 Sep 2025 10:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757501173; cv=none; b=G2S1zTUxDoun7SIm3xLVw1Wp8zQpixN7q8H3etxtQJNK9zgA7cbwamDFqKM/N/BrefVs4j8pjZnyVd2hi5FiyjqPURaRtcoDd1oodPftQtuEt/e0WuhHF90B1Kf9JUD/Bp4ONhZP2tdXCpyqZM6TtmREN/XjP0OrGUKmSTsMU7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757501173; c=relaxed/simple;
	bh=YdQDjKnCp0fZZEDL6h7rSAoz3IU0LZop9X2eKSzS2tg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=a0jQakyek4E6WYizy2i4fPgHz/0+TzFzp3pq+XM9GYpIOATnu48MBmnP6/BFrHFRJaXyUzBVSe76HZgNR0uC4RG4s9A7Wq8ktoZafSn9YfNdYtBzFHDBAtrYs5u98QrzDFGZ8LLzEEQ/VycfM9Y8d3QJPGJqSjQubYk/cf/oPJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xr012LlV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xr012LlV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1757501170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ish3TOdF5itkEce/x1a+uOeE11uGbtv2vXkIso/jAMo=;
	b=Xr012LlVME+G5KE53VkVKcXsTgQr7rHHsplHBscAVTHICNCy0lKfEu0DfpSAbIHhkRFyPd
	TC2RW59ixnnXpAahfQOPEFfEyUFq792/LkiOY6hD14X5ovve2ons0pgQDqTz8pV3YBjI6e
	VwH0UgRG9v/g2qWFeFDhWAgnynxC7/M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-2tpSb0IKOn6eP0W1-VF4CA-1; Wed, 10 Sep 2025 06:46:09 -0400
X-MC-Unique: 2tpSb0IKOn6eP0W1-VF4CA-1
X-Mimecast-MFC-AGG-ID: 2tpSb0IKOn6eP0W1-VF4CA_1757501168
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45de07b831dso22745785e9.1
        for <regressions@lists.linux.dev>; Wed, 10 Sep 2025 03:46:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757501168; x=1758105968;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ish3TOdF5itkEce/x1a+uOeE11uGbtv2vXkIso/jAMo=;
        b=KaAU5LW6/bjGw6U8EXfpCUnMQB+XIhaQ4tO9tZZzlJau6JteTblVOdSlZfEwKFgLIT
         ckASrBBioJsijrANJ7DOaJFrrHBWO/6ULfByY0IRahfi8VYkZ6j2WE4FPcc6qUy3bYEz
         QRTRg3FFNbSBa1aSEv9vMW32U1fyzstFwWwrcskVw5hytRwAp7BpNSVUV9Y2a7cvG3/n
         O7Cq9JoKvSm/h0dE+xRRA6c3UAggQ+O7dqNP7/UrAQM269Ljh74DdB0Pm2H8I3d1wm3a
         gJk3pMkjAx4Jqq9CDliE5BZiquorCI1rn70/9QEm+F9bqrBaJ35/FR6URCVR9JRmBVMS
         Aemw==
X-Gm-Message-State: AOJu0YygHUVx8WcFNTNvbtWsPvMBGGJ0V1eO4tE6iyxo1aIGe+yoT6Y4
	aEuKzL55FWqEK5ra7tGvDRhoHisDHU2znQ4NIzUcCtYUPkhRlxr5crbdSSpAlHSQNZaSUm6d8qt
	cgU0qrW7ZI6ZaJSk6zAUXvunRzEXAHDebtdxd6OMPrl+HOhyJ5AujiFJkCweNL96l
X-Gm-Gg: ASbGncvujeSvD64vYssTuhz0SZx7Hd5XNwU6lBl9iUgYFe3Mby4i7tq25ylTjafmVAt
	U1l6zOsoEWt+2oGBuMisg49b2KMZPTiiyCV+FxFhUvXFuC+VQ/qvXdPqaGi7o8IhAg5OPC27A35
	R1Cvb+TCPq8k6/e8BMP0tmYxr9Ag5bRcx92UesPuS69cEirnpRZh/7EkakoZEDZyALO5aaxJXqd
	UoiL0j8cWyN8YHZlrdQfWsUrbJYDeH8mdixxu1GOJ0x2o5XBOV8B7y3giM0n53u5ASD0L3SnPTK
	AoC7Z1AUrbQPaR/Mzz3/KmPZLDYfQtq/ZfQCyK4EGMhDnrjOFtWSW2mi9dVcvO/2xDuFvavvpbX
	Nr9jAfapTiApkauxyiR140w==
X-Received: by 2002:a05:600c:45cc:b0:459:dde3:1a55 with SMTP id 5b1f17b1804b1-45dddec78d3mr134563135e9.24.1757501168141;
        Wed, 10 Sep 2025 03:46:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE41It7Gch3Cc7HmzlNTf33KcOKcEcqR+1x/JRLAyd/4r51Mnyjg/51A7Gwi/T9TvTKWE/bSA==
X-Received: by 2002:a05:600c:45cc:b0:459:dde3:1a55 with SMTP id 5b1f17b1804b1-45dddec78d3mr134562745e9.24.1757501167668;
        Wed, 10 Sep 2025 03:46:07 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81d193esm23564835e9.6.2025.09.10.03.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 03:46:05 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Brett A C Sheffield <bacs@librecast.net>, stable@vger.kernel.org
Cc: regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, Simona
 Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Thomas Zimmermann
 <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Murad Masimov
 <m.masimov@mt-integration.ru>, Yongzhen Zhang <zhangyongzhen@kylinos.cn>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin
 <sashal@kernel.org>, Brett A C Sheffield <bacs@librecast.net>
Subject: Re: [PATCH 1/1] Revert "fbdev: Disable sysfb device registration
 when removing conflicting FBs"
In-Reply-To: <20250910095124.6213-5-bacs@librecast.net>
References: <20250910095124.6213-3-bacs@librecast.net>
 <20250910095124.6213-5-bacs@librecast.net>
Date: Wed, 10 Sep 2025 12:46:04 +0200
Message-ID: <87frcuegb7.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: v8xD1Vyfg7zLZhtfhIPbgAMBrgENhROZ4Carhan_KfQ_1757501168
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Brett A C Sheffield <bacs@librecast.net> writes:

Hello Brett,

> This reverts commit 13d28e0c79cbf69fc6f145767af66905586c1249.
>
> Commit ee7a69aa38d8 ("fbdev: Disable sysfb device registration when
> removing conflicting FBs") was backported to 5.15.y LTS. This causes a
> regression where all virtual consoles stop responding during boot at:
>
> "Populating /dev with existing devices through uevents ..."
>
> Reverting the commit fixes the regression.
>
> Signed-off-by: Brett A C Sheffield <bacs@librecast.net>
> ---

In the other email you said:

> Newer stable kernels with this
> patch (6.1.y, 6.6.y, 6.12,y, 6.15.y, 6.16.y) and mainline are unaffected.

But are you proposing to revert the mentioned commit in mainline too
or just in the 5.15.y LTS tree ?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2342F62A
	for <regressions@lists.linux.dev>; Wed,  8 Nov 2023 00:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HD5qWXGh"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-28014fed9efso5047785a91.0
        for <regressions@lists.linux.dev>; Tue, 07 Nov 2023 16:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699402308; x=1700007108; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o5FTMnIkfAnWQrINqJsE9vGOX5Y79juiKePAWCBp2xQ=;
        b=HD5qWXGhJ0aSi7SDsIHsXtNx2RrwKsLnRAMliOaveASl14smo1sM2OtfzHwsfZJo32
         HJ53NZk7ejC8W0THSc1tFGLpSGy7hI6Ma29tREcS2Gef8hAshWLkcnMOcdO3Ae0w48hV
         o7zEMWIS3VrNTrVH5CEy/Bc9yXz3KR4vobpPYbPttL9kua7Xd/tlbBcSLkhC7NUSRR1S
         dlyJWNtDJssj7O1PIZde1UjXoO6HFBY8wNIIR7TDDgcobXgQ+kEh3w+OfqGtnsyhIbco
         zcuYcevvmejUrx+Q42AhoK30kbirSEwjkocQ4pJ1Xwwb2o5QmiKeuIS75t5CtWUkt2Te
         x/PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699402308; x=1700007108;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=o5FTMnIkfAnWQrINqJsE9vGOX5Y79juiKePAWCBp2xQ=;
        b=jITyPqVZpptf1VElMSjN/aOqOXpqNj7c+nh2cZwgRD6cSFA5X0mm+TCY9ph8sCoEUt
         mHyonbnVk5b3wyUsQY/Tl7Pvosh/XHtR4A/x9viOvIBcDz19io51PxU9PyYh6IaaelJ1
         pwTiKkaWAhWuXVQiYA3/HxipPWa4R4zVMbtuTwJzsfrQIqjDCiCpMpXRAeekvg2gYHnJ
         99xFZK/RSolbJLEwfjvF7BX94zZm32No9v9bi+WVBG01wQZijgQo9dEN9pqHFwZSumSx
         x0AKPQCRHX7APMxXrZ+lZjNSla2Rr3rE3uODP0j5DwtoWbgNuhE3VBMoehXOcR8zDiOO
         +yDg==
X-Gm-Message-State: AOJu0YwY6gbz/s9TdKz/5AkpRrF0f5BgQ06XlD71TAhN9QR6iFNtefc3
	xVOsakBcqCKMNT36w8u3nas=
X-Google-Smtp-Source: AGHT+IFKm49M/VNzE67GA8NDQr1TupQFHjgD/NPr5R/pbLEg4jII8BqgTf96Oyl2ntsD/3uIsg4c6A==
X-Received: by 2002:a17:90b:4a88:b0:280:1a19:6dd5 with SMTP id lp8-20020a17090b4a8800b002801a196dd5mr219806pjb.36.1699402308282;
        Tue, 07 Nov 2023 16:11:48 -0800 (PST)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id w7-20020a17090aad4700b00280fcbbe774sm352767pjv.10.2023.11.07.16.11.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Nov 2023 16:11:47 -0800 (PST)
Message-ID: <ad48a0bf-0454-44ee-ae00-eff3f8b66ca6@gmail.com>
Date: Wed, 8 Nov 2023 07:11:36 +0700
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Virtualization <virtualization@lists.linux-foundation.org>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Christian Hergert <chergert@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
 David Airlie <airlied@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, bluescreen_avenger@verizon.net
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: 01f05940a9a75e11a2be64993c44ad8dd06e6e26 causes Wayland servers
 to flicker in non-gl virtio QEMU cards
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> It seems that commit 01f05940a9a75e11a2be64993c44ad8dd06e6e26 introduced an issue impacting wlroots and Weston (possibly others) on QEMU with the virtio card. happens on QEMU, and it happens in virt-manager when I do NOT enable GL. (When GL is ENABLED it seems to be fine oddly)
> 
> It introduces odd flickering, Weston's desktop shell flashes when a new window opens, wlroots also acts odd.
> This is QEMU 8.0.4
> 
> I have narrowed it down to 01f05940a9a75e11a2be64993c44ad8dd06e6e26. Reverting the commit (it still reverts cleanly), and the flicking goes away on a rebuild and this is on Linux 6.6.

See Bugzilla for the full thread.

Anyway, I'm adding this regression to regzbot:

#regzbot introduced: 01f05940a9a75e https://bugzilla.kernel.org/show_bug.cgi?id=218115
#regzbot title: fb damage clips property enablement causes Wayland non-GL flickering on QEMU

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=218115

-- 
An old man doll... just what I always wanted! - Clara

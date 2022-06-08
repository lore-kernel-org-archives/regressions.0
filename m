Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661577C
	for <regressions@lists.linux.dev>; Wed,  8 Jun 2022 07:36:11 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id e11so17635295pfj.5
        for <regressions@lists.linux.dev>; Wed, 08 Jun 2022 00:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9dT1YbLiitv03+PdOtWagge0EdcnKxpI77SoGaYuRcY=;
        b=SP8iQOXw3TyCNNE3e5y15XHPh4wkAzTM4T6CFjlFHuZOTsIwlqatl/sMUjuDNpMCZt
         V3GQpJrRiJpZ546fXVFaonmkMIYX64ZZAaT9a2qJ5+BUEd7IVk+bh3K58dxvoSBHn92q
         k3oIfugG7ZX3poTCMLMZFoDidkgYglLZZJBVg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9dT1YbLiitv03+PdOtWagge0EdcnKxpI77SoGaYuRcY=;
        b=Brv77MOaQ9Ej80z1AARIvvsC6mNLsW7lPUpC2afGpTyNHx5MNsipqIlK43CU6DXtJy
         1Js0pR8qbnKOpDs6M91qtj/FHViWExCCbROoUU4b+fM6bFFqwZ5IB7cVua42JMEVNVxm
         XcFWDUBI+VfuKwe7eaYyvOlNiYSuR2Wwso2F/VPgExbFzAgm6Q2F+gktKTPtGS09cdQW
         SrEMFLx9uqL7fiwJBoDK8DwqZMC3RYMr8aZj5FpUD0QudwzF1ccv4PzgOTUZgtJk4Nw9
         vVKfwc+lrMKExv+9G0Jb1vPloG21C6T3a2AtVxw6kB2psqdg4sh9DjXcWETjVcGBp+S9
         tnFA==
X-Gm-Message-State: AOAM530br5kxpEYZHSOqeqs7tUTdV3ESI7ngzMKGEKWfc6uH726rjMiT
	OVrjZ08WTCaVVTv8VxRjIuNuDQ==
X-Google-Smtp-Source: ABdhPJwaxdsj6eMQY2PXnXyn7JGln1BneLzhB4mTT8eUahzdJoFLMCIyVlAJyLCCAWjTQesyjDXvzw==
X-Received: by 2002:a63:65c7:0:b0:3fc:85b5:30c0 with SMTP id z190-20020a6365c7000000b003fc85b530c0mr29388641pgb.165.1654673770813;
        Wed, 08 Jun 2022 00:36:10 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:463d:a192:6128:66e])
        by smtp.gmail.com with ESMTPSA id d4-20020a170903230400b00167729dfe0bsm6439373plh.168.2022.06.08.00.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 00:36:10 -0700 (PDT)
Date: Wed, 8 Jun 2022 16:36:05 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Minchan Kim <minchan@kernel.org>
Cc: open list <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	linux-block <linux-block@vger.kernel.org>,
	regressions@lists.linux.dev, Jens Axboe <axboe@kernel.dk>,
	Nitin Gupta <ngupta@vflare.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: qemu-arm: zram: mkfs.ext4 : Unable to handle kernel NULL pointer
 dereference at virtual address 00000140
Message-ID: <YqBRZcsfrRMZXMCC@google.com>
References: <CA+G9fYtVOfWWpx96fa3zzKzBPKiNu1w3FOD4j++G8MOG3Vs0EA@mail.gmail.com>
 <Yp47DODPCz0kNgE8@google.com>
 <CA+G9fYsjn0zySHU4YYNJWAgkABuJuKtHty7ELHmN-+30VYgCDA@mail.gmail.com>
 <Yp/kpPA7GdbArXDo@google.com>
 <YqAL+HeZDk5Wug28@google.com>
 <YqAMmTiwcyS3Ttla@google.com>
 <YqANP1K/6oRNCUKZ@google.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqANP1K/6oRNCUKZ@google.com>

On (22/06/08 11:45), Sergey Senozhatsky wrote:
> 
> Something like this?

May be even something like below. Move static initializer to cpu up
hook.

---
 mm/zsmalloc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 9152fbde33b5..6d3789d834e2 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -453,9 +453,7 @@ MODULE_ALIAS("zpool-zsmalloc");
 #endif /* CONFIG_ZPOOL */
 
 /* per-cpu VM mapping areas for zspage accesses that cross page boundaries */
-static DEFINE_PER_CPU(struct mapping_area, zs_map_area) = {
-	.lock	= INIT_LOCAL_LOCK(lock),
-};
+static DEFINE_PER_CPU(struct mapping_area, zs_map_area);
 
 static __maybe_unused int is_first_page(struct page *page)
 {
@@ -1113,6 +1111,7 @@ static inline int __zs_cpu_up(struct mapping_area *area)
 	area->vm_buf = kmalloc(ZS_MAX_ALLOC_SIZE, GFP_KERNEL);
 	if (!area->vm_buf)
 		return -ENOMEM;
+	local_lock_init(&area->lock);
 	return 0;
 }
 
-- 
2.36.1.255.ge46751e96f-goog

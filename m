Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA167B
	for <regressions@lists.linux.dev>; Wed,  8 Jun 2022 02:45:24 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id e11so17144096pfj.5
        for <regressions@lists.linux.dev>; Tue, 07 Jun 2022 19:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Hk2gCK5GcL5SvSh8UzW9g4jUcY4kzzvd/IMquDVjiO4=;
        b=c5O7ss6DupGlsVEU8Ms0R22mX91KC3Cg3PQV77Qd3ZaYVqNRwgL5voOoS6iRw8YI1g
         1FzQa46DGufTglDq0/urPNxV6ZEq9bIq7HEYZJAKAimhh0Y+HWX3PCzwu/g9oJ2qjr+B
         0NIWmFZ4Q6gwN4oyGaB+qEfjQ5LFeW/hzvOl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Hk2gCK5GcL5SvSh8UzW9g4jUcY4kzzvd/IMquDVjiO4=;
        b=UFZJidCv3YJG0hciDukk9mqzcft7ZsGUpNkvMfndE3iU3LVpr7VZH+0zbptrIOfBx2
         WcIoHVffpZZjk07K3t97LNdzOV0t2qDxYD0ff6YasSeUbSat08rTEAASCZNUa2A25oHB
         +A7PZa0DfeL9MoQW0ZtBaOBt4qIpRD7vZjI+QEAFOOe0ONOJ1wrUqX5TLEWqv63Yd9v8
         Uu2K+v+k7orYWKEF+Zyr0ROVJPLKkglT9bR7pMplpUGIS4TZCea+Sol7Z2RrrtMksvyL
         N0lQ6CKbPMP7T7YNS1pOEut6KP77YWTIq3dDGd4b58df6lzU9GnMmUS0VDFJlU156e3D
         tmDg==
X-Gm-Message-State: AOAM530UYfnl9s9i+FrooP2PPD1YpnQc1UKTO37HUC5C2OYWYyesP1cq
	/RrSXJmavStIwRL59HGG4V6V8Q==
X-Google-Smtp-Source: ABdhPJxgKd0grAVZubtauNeLr0gM6zjTT0NhYAVYAbKmeUS7cPHPdkTquLwAiPqv/feLDELbuUEm/Q==
X-Received: by 2002:a65:6912:0:b0:3fc:907b:e05 with SMTP id s18-20020a656912000000b003fc907b0e05mr27657009pgq.414.1654656324473;
        Tue, 07 Jun 2022 19:45:24 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:463d:a192:6128:66e])
        by smtp.gmail.com with ESMTPSA id c140-20020a624e92000000b005182e39038csm11078266pfb.38.2022.06.07.19.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 19:45:24 -0700 (PDT)
Date: Wed, 8 Jun 2022 11:45:19 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Minchan Kim <minchan@kernel.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	open list <linux-kernel@vger.kernel.org>,
	linux-fsdevel@vger.kernel.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	linux-block <linux-block@vger.kernel.org>,
	regressions@lists.linux.dev, Jens Axboe <axboe@kernel.dk>,
	Nitin Gupta <ngupta@vflare.org>
Subject: Re: qemu-arm: zram: mkfs.ext4 : Unable to handle kernel NULL pointer
 dereference at virtual address 00000140
Message-ID: <YqANP1K/6oRNCUKZ@google.com>
References: <CA+G9fYtVOfWWpx96fa3zzKzBPKiNu1w3FOD4j++G8MOG3Vs0EA@mail.gmail.com>
 <Yp47DODPCz0kNgE8@google.com>
 <CA+G9fYsjn0zySHU4YYNJWAgkABuJuKtHty7ELHmN-+30VYgCDA@mail.gmail.com>
 <Yp/kpPA7GdbArXDo@google.com>
 <YqAL+HeZDk5Wug28@google.com>
 <YqAMmTiwcyS3Ttla@google.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqAMmTiwcyS3Ttla@google.com>

On (22/06/08 11:42), Sergey Senozhatsky wrote:
> > This looks like a NULL lock->name dereference in lockdep. I suspect
> > that somehow local_lock doesn't get .dep_map initialized. Maybe running
> > the kernel with CONFIG_DEBUG_LOCK_ALLOC would help us? Naresh, can you
> > help us with this?
> 
> Hmm, actually, hold on. mapping_area is per-CPU, so what happens if CPU
> get offlined and onlined again? I don't see us re-initializing mapping_area
> local_lock_init(&zs_map_area.lock) and so on.

Something like this?

---

diff --git a/mm/zsmalloc.c b/mm/zsmalloc.c
index 9152fbde33b5..ea434a5226a3 100644
--- a/mm/zsmalloc.c
+++ b/mm/zsmalloc.c
@@ -1104,6 +1104,8 @@ static struct zspage *find_get_zspage(struct size_class *class)
 
 static inline int __zs_cpu_up(struct mapping_area *area)
 {
+	local_lock_init(&area->lock);
+
 	/*
 	 * Make sure we don't leak memory if a cpu UP notification
 	 * and zs_init() race and both call zs_cpu_up() on the same cpu

Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5915EA0
	for <regressions@lists.linux.dev>; Mon, 13 Jun 2022 16:49:06 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id w21so6293887pfc.0
        for <regressions@lists.linux.dev>; Mon, 13 Jun 2022 09:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=9ALP8lsGfjdjgEofzfsJxd9qV2mlI2gIpt2uj+q0ckY=;
        b=czz4osvuz+f2/S9+hKIjWaAk9nwSjJ5BOHALM+L8npDyOhQSu1gub0HzMFya7upev0
         ksc11lhUgxu5WOL1X01iW7xW28n2VADA6Drw9tJPihqqX620yo73SEmRJ6hGnGZOAzjq
         qAUgNs2B0F1W/wZQbVz2t2VLJ5nKXleE2zBa5OitnNb8XSHZrsJFKLMtydUtpznI1+9E
         fehC7wCZeJMpJkFmbogNuBdjfUA42uqOY4DxjxHRGdQyX1ltUipgYipCxG2mdtoliuRV
         jlddM/kmMTj75GnveSpGfFLOg8Kf6qr7icepy6U07x7cpPImoEsYWl/QwxdTSCRmlv4P
         UeiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=9ALP8lsGfjdjgEofzfsJxd9qV2mlI2gIpt2uj+q0ckY=;
        b=vTlkdE3/TRKniVRl4BR8nG8tQPamo2F798Hg12YRHRe/JwSIVsNp0Vqan9n7HYRnFC
         XER+Haa8PdzIr5QeEygqjLZwfuewTHURTehnLFMqoQiiHRMjJt9P03LOuyEaGpd3JoiP
         uS0UkX62BpEpGoJYtLJR8RS/JIG6q9oaBUB0pevoN4va+ywqAkRGDQMpB7ard5wqm2wv
         24ObBKNo4nhGcXeRyF9uSo+U46mLBhENvDkPyb+HFF87Rdzg8FwNWavt3ZOSTPtLhwum
         TdjIwtjLf0ZOjKlwNGVvRmrBsshrcWzTJ0ztOwm60Aj07pL4YBoGGlWuwAJ/miLOFC0g
         fUbA==
X-Gm-Message-State: AOAM530WC0+5oLI4r0wbERumwnueh4W6fSsjWsLxNkD518S1ZTiDO874
	nmyIjzJXhlGW5gn6tC4S+Lo=
X-Google-Smtp-Source: ABdhPJz7UaAu1dmwAfduVnLzoXN0rY0S0U8WJE6KWUcTeKiIhK5MLmLXhvJaShL6SyWBuIMPeljjvA==
X-Received: by 2002:a05:6a00:3491:b0:51c:1d3b:b0b0 with SMTP id cp17-20020a056a00349100b0051c1d3bb0b0mr131559pfb.68.1655138946195;
        Mon, 13 Jun 2022 09:49:06 -0700 (PDT)
Received: from google.com ([2620:15c:211:201:43cb:e071:e7f2:5e7a])
        by smtp.gmail.com with ESMTPSA id ij7-20020a170902ab4700b001621cd83e49sm5356623plb.92.2022.06.13.09.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 09:49:05 -0700 (PDT)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date: Mon, 13 Jun 2022 09:49:03 -0700
From: Minchan Kim <minchan@kernel.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>, umgwanakikbuti@gmail.com,
	bigeasy@linutronix.de
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	open list <linux-kernel@vger.kernel.org>,
	linux-fsdevel@vger.kernel.org,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
	linux-block <linux-block@vger.kernel.org>,
	regressions@lists.linux.dev, Jens Axboe <axboe@kernel.dk>,
	Nitin Gupta <ngupta@vflare.org>
Subject: Re: qemu-arm: zram: mkfs.ext4 : Unable to handle kernel NULL pointer
 dereference at virtual address 00000140
Message-ID: <Yqdqfz4Ycbg33k1R@google.com>
References: <CA+G9fYtVOfWWpx96fa3zzKzBPKiNu1w3FOD4j++G8MOG3Vs0EA@mail.gmail.com>
 <Yp47DODPCz0kNgE8@google.com>
 <CA+G9fYsjn0zySHU4YYNJWAgkABuJuKtHty7ELHmN-+30VYgCDA@mail.gmail.com>
 <Yp/kpPA7GdbArXDo@google.com>
 <YqAL+HeZDk5Wug28@google.com>
 <YqAMmTiwcyS3Ttla@google.com>
 <YqANP1K/6oRNCUKZ@google.com>
 <YqBRZcsfrRMZXMCC@google.com>
 <CA+G9fYvjpCOcTVdpnHTOWaf3KcDeTM3Njn_NnXvU37ppoHH5uw@mail.gmail.com>
 <YqbtH9F47dkZghJ7@google.com>
Precedence: bulk
X-Mailing-List: regressions@lists.linux.dev
List-Id: <regressions.lists.linux.dev>
List-Subscribe: <mailto:regressions+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:regressions+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqbtH9F47dkZghJ7@google.com>

On Mon, Jun 13, 2022 at 04:54:07PM +0900, Sergey Senozhatsky wrote:
> Hello,
> 
> On (22/06/12 20:56), Naresh Kamboju wrote:
> > 
> > I have tested this patch and the reported issue got resolved [1].
> >
> 
> Many thanks for the tests.
> 
> Quite honestly I was hoping that the patch would not help :) Well, ok,
> we now know that it's mapping area lock and the lockdep part of its
> memory is zero-ed out. The question is - "why?" It really should not
> be zeroed out.

Ccing Mike and Sebastian who are author/expert of the culprit patch

Naresh found zsmalloc crashed on the testing [1] and confirmed
that Sergey's patch[2] fixed the problem.
However, I don't understand why we need reinit the local_lock
on cpu_up handler[3].

Could you guys shed some light?

[1] https://lore.kernel.org/all/CA+G9fYtVOfWWpx96fa3zzKzBPKiNu1w3FOD4j++G8MOG3Vs0EA@mail.gmail.com/
[2] https://lore.kernel.org/all/YqBRZcsfrRMZXMCC@google.com/
[3] https://lore.kernel.org/all/YqEKapKLBgKEXGBg@google.com/
